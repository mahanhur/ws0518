<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let item_detail = {
    init:function (){
        $('#register_btn').click(function (){
            item_detail.send(); //아이템_애드 라는 객체에 센드가 호출
            });
        $('#delete_btn').click(function (){
            var c = confirm("정말 삭제하겠습니까?");
            if(c == true){
                location.href="/item/deleteimpl?id=${gitem.id}";
            }
        });
    },
            send:function(){
            $('#register_form').attr({
                method:'post',
                action:'/item/updateimpl',
                enctype:'multipart/form-data'
            });
            $('#register_form').submit();
        }
    };

    $(function (){
        item_detail.init();
    })
</script>


<div class="container-fluid px-5">
    <!-- Page Heading -->
    <h1 class="mt-4"></h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h3 class="m-2">ITEM ID : ${gitem.id}</h3>
        </div>
        <div class="card-body">
            <div id="container">
                <form id="register_form" class="form-horizontal well">
                    <input type="hidden" name="id" value="${gitem.id}"> <%--hidden을 통해서 화면에는 보이지 않지만 name=id를 지정해서 서버에 전송을해준다--%>
                    <input type="hidden" name="imgname" value="${gitem.imgname}">

                    <div class="form-group">
                        <div class="col-sm-10">
                            <img src="/uimg/${gitem.imgname}">
                        </div>
                    </div>

                    <label class="control-label col-sm-2" for="name">Name:</label>
                    <div class="form-group">
                        <input type="name" class="form-control" id="name" name="name" value="${gitem.name}" >
                    </div>

                    <label class="control-label col-sm-2" for="price">Price:</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="price" name="price" value="${gitem.price}" >
                    </div>

                    <label class="control-label col-sm-2" for="cate_id">Category:</label>
                    <div class="form-group">
                        <input type="text" class="form-control" id="cate_id" name="cate_id" value="${gitem.cate_id}" >
                    </div>

                    <label class="control-label col-sm-2" for="price">IMG:</label>
                    <div class="form-group">
                        <input type="file" class="form-control" id="img" name="img" placeholder="Input image" >
                    </div>
                    <br/>
                    <div>
                        <button type="button" id="register_btn" class="btn btn-outline-primary">Update</button>
                        <button type="button" id="delete_btn" class="btn btn-outline-primary">Delete</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
