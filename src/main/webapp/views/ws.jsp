<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<style>
    #to {
        width: 400px;
        height: 200px;
        overflow: auto;
        border: 2px solid lightgray;
        border-radius: 10px;
    }
</style>

<script>
    let websocket = {
        id:null,
        stompClient:null,
        init:function(){
            this.id = $('#adm_id').text();
            $("#connect").click(function() {
                websocket.connect();
            });
            $("#disconnect").click(function() {
                websocket.disconnect();
            });
            $("#sendto").click(function() {
                websocket.sendTo();
                $("#to").append(
                    "<h4>" + "${loginadm.id}" +":"+
                    $("#totext").val()
                    + "</h4>");
            });
        },
        connect:function(){
            var sid = this.id;
            var socket = new SockJS('http://172.16.21.61:8090/ws');
            this.stompClient = Stomp.over(socket);

            this.stompClient.connect({}, function(frame) {
                websocket.setConnected(true);
                console.log('Connected: ' + frame);
                this.subscribe('/send/to/'+sid, function(msg) {
                    $("#to").append(
                        "<h4>" + JSON.parse(msg.body).sendid +":"+
                        JSON.parse(msg.body).content1
                        + "</h4>");
                });
            });
        },
        disconnect:function(){
            if (this.stompClient !== null) {
                this.stompClient.disconnect();
            }
            websocket.setConnected(false);
            console.log("Disconnected");
        },
        setConnected:function(connected){
            if (connected) {
                $("#status").text("Connected");
            } else {
                $("#status").text("Disconnected");
            }
        },
        sendTo:function(){
            var msg = JSON.stringify({
                'sendid' : this.id,
                'receiveid' : $('#target').val(),
                'content1' : $('#totext').val()
            });
            this.stompClient.send('/receiveto', {}, msg);
        }
    };
    $(function(){
        websocket.init();
    })

</script>

<div class="container-fluid px-4">
    <h1 class="mt-4">실시간 1:1 문의</h1>
    <ol class="breadcrumb mb-4">
        <li class="breadcrumb-item"><a href="/">Move Main Page</a></li>
        <li class="breadcrumb-item active">#</li>
    </ol>
    <div class="card mb-4">
        <div class="card-header">
            <i class="fas fa-person me-1"></i>
            1:1 문의
        </div>
        <div class="card-body">

            <div id="container"></div>
            <div class="col-sm-5">
                <h3 id="adm_id">${loginadm.id}</h3>
                Status : <h3 id="status" style="color:red">Ready</h3>
                <button id="connect" type="button" class="btn btn-primary">Connect</button>
                <button id="disconnect" type="button" class="btn btn-primary">Disconnect</button>
                <hr/>
                        <div id="to"></div>
                UserID  &nbsp;&nbsp;: <input type="text" id="target"><br/>
                Content : <input type="text" id="totext"><br/>
                <button id="sendto" type="button" class="btn btn-secondary">Send</button>

            </div>

        </div>
    </div>
</div>

