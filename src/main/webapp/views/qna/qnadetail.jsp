<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let answer = {
    init:function (){
        $('#answer_btn').addClass('disabled');

        var answerarea = $('#answerarea').val();
        if (answerarea == '') {
            $('#answer_btn').removeClass('disabled')
        }

        $('#answer_btn').click(function (){
            answer.send(); //아이템_애드 라는 객체에 센드가 호출
            });
    },
            send:function(){
            $('#answer_form').attr({
                method:'post',
                action:'/qna/answerimpl',
            });
            $('#answer_form').submit();
        }
    };
    $(function (){
        answer.init();
    })
</script>


<div class="container-fluid px-5">
    <!-- Page Heading -->
    <h1 class="mt-4"></h1>
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <h3 class="m-2">Title: ${gqna.title}</h3>
            <h3 class="m-2">Writer: ${gqna.cust_id}</h3>
        </div>
        <div class="card-body">
            <div id="container">
                    <input type="hidden" name="id" value="${gqna.id}"> <%--hidden을 통해서 화면에는 보이지 않지만 name=id를 지정해서 서버에 전송을해준다--%>

                    <h4>Question</h4><textarea style="width: 800px" readonly>${gqna.question}</textarea>

                    <form id="answer_form">
                    <input type="hidden" name="q_id" value="${gqna.id}"> <%--hidden을 통해서 화면에는 보이지 않지만 name=id를 지정해서 서버에 전송을해준다--%>
                    <input type="hidden" name="title" value="${gqna.title}">
                    <input type="hidden" name="cust_id" value="${gqna.cust_id}">
                    <input type="hidden" name="adm_id" value="admin01">
                    <h4>Answer</h4><textarea style="width: 800px" name="content" id="answerarea">${gqna.answer}</textarea>
                    </form>
                    <br/>
                    <div>
                        <button type="button" id="answer_btn" class="btn btn-outline-primary">Answer</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>
