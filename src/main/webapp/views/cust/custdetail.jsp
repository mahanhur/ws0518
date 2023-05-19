<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
    let cust_detail = {
        init:function (){
            $('#update_btn').click(function (){
                var c = confirm("수정 하시겠습니까?");
                if(c == true){
                    location.href="/cust/updateimpl?id=${gcust.id}";
                    cust_detail.send();
                }
            });
            $('#delete_btn').click(function (){
                var c = confirm("주의!!삭제하겠습니까?");
                if(c == true){
                    location.href="/cust/deleteimpl?id=${gcust.id}";
                }
            });
        },
        send:function(){
            $('#detail_form').attr({
                method:'post',
                action:'/cust/updateimpl'
            });
            $('#detail_form').submit();
        }
    }
    $(function (){
        cust_detail.init();
    })
</script>

<div class="container-fluid px-5">
    <!-- Page Heading -->
    <h1 class="mt-4"></h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h3>CUST Detail</h3>
        </div>
        <div class="card-body">
            <div id="container">
                <form id="detail_form">
                    <div>
                        <label class="control-label col-sm-2" for="id">ID:</label>
                        <input type="id" class="form-control" id="id" name="id" value="${gcust.id}" readonly>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="id">PASSWORD:</label>
                        <input type="password" class="form-control" id="pwd" name="pwd" >
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="id">NAME:</label>
                        <input type="name" class="form-control" id="name" name="name" value="${gcust.name}" >
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="id">AGE:</label>
                        <input type="number" class="form-control" id="age" name="age" value="${gcust.age}" >
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-2" for="id">GENDER:</label>
                        <input type="text" class="form-control" id="gender" name="gender" value="${gcust.gender}" >
                    </div>
                    <br/>
                    <div>
                        <button type="button" id="update_btn" class="btn btn-outline-primary">Update</button>
                        <button type="button" id="delete_btn" class="btn btn-outline-primary">Delete</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>