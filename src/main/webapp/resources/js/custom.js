$(document).ready(function () {

    let tableInstance = $("#datatable").DataTable({
        sort: true,
        searching: true,
        paging: true,
        columns: [
            {   data : 'firstName',
                render : function (firstName, type, row, meta){
                    return `<a data-toggle="modal" data-target="#updateModal" class="editLink">${firstName}</a>`;
                },
            },
            {   data: 'lastName' },
            {   data: 'age' },
            {   data: 'address' },
            {   'defaultContent' : '<button id="delete" >Delete</button>'}
        ]
    });

    // inserting the data in dataTable
    $.ajax({
        url: "http://localhost:8080/person/all",
        method: "GET",
        dataType: "json",
        success: function (data) {
            tableInstance.rows.add(data).draw();
        },
        error: function (error){
            alert(error);
        }
    });
    /**
     *adding my code using promises
     */
   /* ajaxCallFetch("http://localhost:8080/person/all","GET")
        .then(function (data){
            tableInstance.rows.add(data).draw();
            console.log("then method called");
        }).catch(function (error){
            alert(error);
        console.log("catch method called");
        });*/

    // adding person by the modal form
    $('#addForm').click(function () {
        let person = {};
        person.firstName = $('#firstName').val();
        person.lastName = $('#lastName').val();
        person.age = $('#age').val();
        person.address = $('#address').val();
        let productJSON = JSON.stringify(person);
        $.ajax({
            url: 'http://localhost:8080/person/save',
            method: 'POST',
            data: productJSON,
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                tableInstance.row.add(data).draw();
                swal("Success", "Record added successfully", "success");
                $("#exampleModal").modal('hide');
                resetForm();
            },
            error: function (error) {
                swal("Bad Request", ""+error, "error");
                $("#exampleModal").modal('hide');
                resetForm();
            }
        });
        /*ajaxCallSend("http://localhost:8080/person/save","POST", "productJSON")
            .then(function (data){
                tableInstance.row.add(data).draw();
                swal("Success", "Record added successfully", "success");
                $("#exampleModal").modal('hide');
                resetForm();
            }).catch(function (error){
                swal("Bad Request", ""+error, "error");
                $("#exampleModal").modal('hide');
                resetForm();
            });*/
    });

    // deleting the particular record (row) from the dataTable
    $('#datatable tbody').on('click', '#delete', function () {
        let row = $(this).closest('tr');
        let data = tableInstance.row( row ).data();

        $.ajax({
            data : data,
            url: "http://localhost:8080/person/delete/"+data.personId,
            method: "DELETE",
            contentType : "application/json; charset=utf-8",
            success: function (data) {
                swal("Good Job","Record deleted successfully", "success");
                tableInstance.row(row).remove().draw();
            },
            error: function (error){
                swal("Bad Request", "Record not deleted ", "error");
            }
        });
    });

    // editLink Query
    let a = $('#datatable tbody').on('click', 'a', function () {
        // $(this).toggleClass('selectRow');
        let row = $(this).closest('tr');
        let data = tableInstance.row(row).data();
        $('#firstNameU').val(data.firstName);
        $('#lastNameU').val(data.lastName);
        $('#ageU').val(data.age);
        $('#addressU').val(data.address);
        $('#person-id"').val(data.personId);
        console.log(data);
    });

    $('#updateForm').click(function (){
        let person = {};
        person.personId = $('#person-id"').val();
        person.firstName = $('#firstNameU').val();
        person.lastName = $('#lastNameU').val();
        person.age = $('#ageU').val();
        person.address = $('#addressU').val();
        let personJSON = JSON.stringify(person);
        console.log(data);
        $.ajax({
            url: 'http://localhost:8080/person/update',
            method: 'PUT',
            data: personJSON,
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                console.log("updated row data");
                console.log(data);
                tableInstance.row(row).data(data).draw();
                swal("Success", "Record updated successfully", "success");
                $("#updateModal").modal('hide');
                resetForm();
                row = null; data = null;
            },
            error: function (error) {
                swal("Bad Request", "Record not updated", "error");
                $("#updateModal").modal('hide');
                resetForm();
                row = null; data = null;
            }
        });
    });


    // updating the record in dataTable
    /*$('#updateForm').click(function () {
        let person = {};
        let r = $('#editLink').closest('tr');
        let id = tableInstance.row(r).data().personId;
        person.personId = id;
        person.firstName = $('#firstNameU').val();
        person.lastName = $('#lastNameU').val();
        person.age = $('#ageU').val();
        person.address = $('#addressU').val();

        let personJSON = JSON.stringify(person);
        $.ajax({
            url: 'http://localhost:8080/person/update',
            method: 'PUT',
            data: personJSON,
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                //tableInstance.row(r).data(data).draw();
                swal("Success", "Record updated successfully", "success");
                $("#updateModal").modal('hide');
                resetForm();
            },
            error: function (error) {
                swal("Bad Request", "Record not updated", "error");
            }
        });
    });*/

// resetting form after closing the modal
    let resetForm = function(){
        $('form').each(function(i, element){
            $(element)[0].reset();
        });
    }
});