$(document).ready(function () {
    $.ajax({
        url: "http://localhost:8080/person/all",
        method: "GET",
        dataType: "json",
        success: function (data) {
            $("#datatable").DataTable({
                data: data,
                sort: true,
                searching: true,
                paging: false,
                columns: [
                    {data : 'personId'},
                    {data : 'firstName'},
                    {data: 'lastName'},
                    {data: 'age'},
                    {data: 'address'},
                ]
            })
        }
    });
});