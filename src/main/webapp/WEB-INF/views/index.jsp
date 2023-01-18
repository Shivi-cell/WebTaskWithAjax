<%--
  Created by IntelliJ IDEA.
  User: admin1
  Date: 12/01/23
  Time: 1:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <link rel="stylesheet" href="/resources/css/custom.css">
</head>
<body>
    <h2 style="text-align: center">Person Details</h2>
    <div id="table" style="background-color: aliceblue;">
        <table id="datatable">
            <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
                <th>Address</th>
                <th>Action</th>
            </tr>
            </thead>
        </table>
    </div>
    <div style="text-align: center">
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@getbootstrap">Add Person</button>
    </div>

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
                    <form id="form">
                        <div class="form-row">
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

    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabelU" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title" id="exampleModalLabelU">Update Person Details</h2>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" >
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body " id="updateModalBody">
                    <form>
                        <input type="hidden" id="person-id" />
                        <div class="form-group">
                            <label for="firstName" class="col-form-label">First name</label>
                            <input type="text" class="form-control" id="firstNameU" name="firstName">
                        </div>
                        <div class="form-group">
                            <label for="lastName" class="col-form-label">Last name</label>
                            <input type="text" class="form-control" id="lastNameU" name="lastName">
                        </div>
                        <div class="form-group">
                            <label for="age" class="col-form-label">age</label>
                            <input type="number" class="form-control" id="ageU" name="age">
                        </div>
                        <div class="form-group">
                            <label for="address" class="col-form-label">Address</label>
                            <input type="text" class="form-control" id="addressU" name="address">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="updateForm">Update Record</button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="/resources/js/custom.js"></script>
    <script src="/resources/js/ajaxCall.js"></script>
</body>
</html>
