<%--
  Created by IntelliJ IDEA.
  User: admin1
  Date: 12/01/23
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="js/custom.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <div id="table" style="background-color: aliceblue;">
        <table id="datatable">
            <thead>
            <tr>
                <th>Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
                <th>Address</th>
            </tr>
            </thead>
        </table>
    </div>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Add Person</button>

    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="exampleModalLabel">Add New Person</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <label for="personId" class="col-form-label">person id</label>
                            <input type="number" class="form-control" id="personId" name="personId">
                        </div>
                        <div class="form-group">
                            <label for="firstName" class="col-form-label">First name</label>
                            <input type="text" class="form-control" id="firstName" name="firstName">
                        </div>
                        <div class="form-group">
                            <label for="lastName" class="col-form-label">Last name</label>
                            <input type="text" class="form-control" id="lastName" name="lastName">
                        </div>
                        <div class="form-group">
                            <label for="age" class="col-form-label">age</label>
                            <input type="number" class="form-control" id="age" name="age">
                        </div>
                        <div class="form-group">
                            <label for="address" class="col-form-label">Address</label>
                            <input type="text" class="form-control" id="address" name="address">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="addForm">Add Record</button>
                </div>
            </div>
        </div>
    </div>
<script>
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
        // let table = $("#datatable").DataTable({
        //     columns: [
        //         {data : 'personId'},
        //         {data : 'firstName'},
        //         {data: 'lastName'},
        //         {data: 'age'},
        //         {data: 'address'},
        //     ]
        // });


        $('#addForm').click(function () {
            // $("#exampleModal").hide("fast",addPerson());
            let person = {};
            person.personId = $('#personId').val();
            person.firstName = $('#firstName').val();
            person.lastName = $('#lastName').val();
            person.age = $('#age').val();
            person.address = $('#address').val();

            let productJSON = JSON.stringify(person);
            $.ajax({
                url: 'http://localhost:8080/person',
                method: 'POST',
                data: productJSON,
                contentType: "application/json; charset=utf-8",
                success: function () {
                    $("#exampleModal").hide();
                    loadTable();
                },
                error: function (error) {
                    alert(error);
                }
            });
        });

    });
</script>
</body>
</html>
