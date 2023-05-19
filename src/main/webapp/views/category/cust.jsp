<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
    let cust_add = {
        init:function (){
            $('#cust_add_btn').click(function (){
                cust_add.send();
            });
        },
        send:function(){
            $('#register_form').attr({
                method:'post',
                action:'/cust/addimpl'
            });
            $('#register_form').submit();
        }
    };
    $(function (){
        cust_add.init();
    })
</script>

<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Cust ALL</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item"><a href="/">Move Main Page</a></li>
            <li class="breadcrumb-item active">#</li>
        </ol>
        <div class="card mb-4">
            <div class="card-body">
                Our Shop Customers.
                <button type="button" class="btn btn-outline-primary"
                        data-toggle="modal" data-target="#custaddmodal">New Cust ADD</button>
            </div>
        </div>
        <div class="card mb-4">
            <div class="card-header">
                <i class="fas fa-table me-1"></i>
                DataTable : Cust
            </div>
            <div class="card-body">
                <table id="datatablesSimple">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Password</th>
                        <th>Age</th>
                        <th>Gender</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="obj" items="${clist}">
                        <tr>
                            <td><a href="/cust/detail?id=${obj.id}">${obj.id}</a></td>
                            <td>${obj.name}</td>
                            <td>${obj.pwd}</td>
                            <td>${obj.age}</td>
                            <td>${obj.gender}</td>
                        </tr>

                    </c:forEach>

                    <!-- Cust Add Modal -->
                    <div id="custaddmodal" class="modal fade" role="dialog">
                        <div class="modal-dialog">
                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h4 class="modal-title">ADD CUST</h4>
                                </div>
                                <div class="modal-body">
                                    <form id="register_form" >
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="id" name="id" placeholder="Make Cust or Admin ID" >
                                        </div>
                                        <div class="col-sm-10">
                                            <span id="check_id" class="bg-danger"></span>
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password" >
                                        </div>
                                        <div class="form-group">
                                            <input type="name" class="form-control" id="name" name="name" placeholder="Enter name" >
                                        </div>
                                        <div class="form-group">
                                            <input type="name" class="form-control" id="age" name="age" placeholder="Enter age" >
                                        </div>
                                        <div class="form-group">
                                            <input type="name" class="form-control" id="gender" name="gender" placeholder="Enter gender" >
                                        </div>
                                        <div>
                                            <button type="button" id="cust_add_btn" class="btn btn-outline-primary">ADD</button>
                                            <button type="button" class="btn btn-outline-primary" data-dismiss="modal">CLOSE</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Cust Add Modal END-->
                     </tbody>
                </table>
            </div>
        </div>
    </div>
</main>

<%--<!-- Cust detail Modal -->
<div id="custdetailmodal${obj.id}" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Detail CUST</h4>
            </div>
            <div class="modal-body">
                <form id="detail_form" >
                    <div class="form-group">
                        <input type="id" class="form-control" id="updateid" name="updateid" value =${obj.id} readonly>
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" id="updatepwd" name="updatepwd" value =${obj.pwd} >
                    </div>
                    <div class="form-group">
                        <input type="name" class="form-control" id="updatename" name="updatename" value =${obj.name} >
                    </div>
                    <div class="form-group">
                        <input type="number" class="form-control" id="updateage" name="updateage" value =${obj.age} >
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="updategender" name="updategender" value =${obj.gender} >
                    </div>
                    <div>
                        <button type="button" id="cust_update_btn" class="btn btn-outline-primary">UPDATE</button>
                        <button type="button" id="cust_delete_btn" class="btn btn-outline-primary cust_delete_btn">DELETE</button>
                        <button type="button" id="detailmodalclose_btn" class="btn btn-outline-primary" data-dismiss="modal">CLOSE</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Cust detail Modal END-->--%>



