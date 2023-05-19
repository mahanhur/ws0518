<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      initialView: 'dayGridMonth'
    });
    calendar.render();
  });

</script>


<div class="container-fluid px-4">
  <h1 class="mt-4">Welcome!</h1>
  <ol class="breadcrumb mb-4">
    <li class="breadcrumb-item active">This is main center for MOSINSA admin </li>
  </ol>
  <div class="row">
    <div class="col-xl-2 col-md-6">
      <div class="card bg text-black mb-4">
        <div class="card-body"><i class="fas fa-shop"></i> 전체</div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-black stretched-link" href="#"><span id="all">291</span></a>
          <div class="small text-black"><i class="fas fa-angle-right"></i></div>
        </div>
      </div>
    </div>
    <div class="col-xl-2 col-md-6">
      <div class="card bg text-black mb-4">
        <div class="card-body"><i class="fas fa-person"></i> 배송대기</div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-black stretched-link" href="#"><span id="readytoshipping">41</span></a>
          <div class="small text-black"><i class="fas fa-angle-right"></i></div>
        </div>
      </div>
    </div>
    <div class="col-xl-2 col-md-6">
      <div class="card bg text-black mb-4">
        <div class="card-body"><i class="fas fa-truck-fast"></i> 배송중</div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-black stretched-link" href="#"><span id="onshipping">101</span></a>
          <div class="small text-black"><i class="fas fa-angle-right"></i></div>
        </div>
      </div>
    </div>
    <div class="col-xl-2 col-md-6">
      <div class="card bg text-black mb-4">
        <div class="card-body"><i class="fas fa-box"></i> 배송완료</div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-black stretched-link" href="#"><span id="completetoshipping">149</span></a>
          <div class="small text-black"><i class="fas fa-angle-right"></i></div>
        </div>
      </div>
    </div>
    <div class="col-xl-2 col-md-6">
      <div class="card bg text-black mb-4">
        <div class="card-body"><i class="fas fa-right-to-bracket"></i> 반품요청</div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-black stretched-link" href="#"><span id="refund">13</span></a>
          <div class="small text-black"><i class="fas fa-angle-right"></i></div>
        </div>
      </div>
    </div>
    <div class="col-xl-2 col-md-6">
      <div class="card bg text-black mb-4">
        <div class="card-body"><i class="fas fa-guitar"></i> 기타</div>
        <div class="card-footer d-flex align-items-center justify-content-between">
          <a class="small text-black stretched-link" href="#"><span id="etc">13</span></a>
          <div class="small text-black"><i class="fas fa-angle-right"></i></div>
        </div>
      </div>
    </div>
  </div>
    <div class="row">
      <div class="col-xl-12">
        <div class="card mb-4">
          <div class="card-header"><i class="fas fa-calendar me-1"></i>Calendar</div>
          <div class="card-body">
            <div id="calendar"></div>
          </div>
        </div>
      </div>
    </div>
</div>