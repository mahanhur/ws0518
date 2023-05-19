<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
  let update = {
    init: ()=>{
      $('#update_btn').attr('disabled',true);
      $("#update_btn").click( () => {
        update.send();
      });

      //비밀번호 일치여부 확인
      $('#pwd2').keyup( () => {
        let pwd = $("#pwd").val();
        let pwd2 = $("#pwd2").val();
        if(pwd != pwd2) {
          $("#pwderror").html("입력하신 비밀번호가 다릅니다.");
          $("#pwderror").css('color','red');
        } else{
          $("#pwderror").html("입력하신 비밀번호가 일치합니다.");
          $("#pwderror").css('color','blue');
        }

      })
      $('#lev').keyup( () => {
        let id = $("#id").val();
        let pwd = $("#pwd").val();
        let lev = $("#lev").val();
        if(id != '' && pwd != '' && lev != '') {
            let pwd2 = $("#pwd2").val();
          if(pwd == pwd2){
            $('#update_btn').attr('disabled',false);
          };
        };
      });
    },
    // 입력값 form 전송
    send : ()=>{
      $("#update_form").attr({
        'action':'/updateimpl',
        'method':'post'
      });
      $("#update_form").submit();
    }
  };


  $( ()=> {
    update.init();
  });

</script>


<div id="layoutAuthentication">
  <div id="layoutAuthentication_content">
    <main>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-7">
            <div class="card shadow-lg border-0 rounded-lg mt-5">
              <div class="card-header"><h3 class="text-center font-weight-light my-4">About Your Account</h3></div>
              <div class="card-body">

                <form id="update_form">
                  <div class="form-floating mb-3">
                    <input class="form-control" id="id" type="id" name="id" value="${loginadm.id}" readonly/>
                    <label for="id">ID</label>
                  </div>

                  <div class="row mb-3">
                    <div class="col-md-6">
                      <div class="form-floating mb-3 mb-md-0">
                        <input class="form-control" id="pwd" type="password" name="pwd" placeholder="Create a password" />
                        <label for="pwd">Password</label>
                      </div>
                    </div>

                    <div class="col-md-6">
                      <div class="form-floating mb-3 mb-md-0">
                        <input class="form-control" id="pwd2" type="password" name="pwd2" placeholder="Confirm password" />
                        <label for="pwd2">Confirm Password</label>
                      </div>
                    </div>
                    <div style="height:10px; font-size:12px; margin-left:50%; color:red;" id="pwderror"></div>
                  </div>

                  <div class="form-floating mb-3">
                    <input class="form-control" id="lev" type="number" name="lev" value="${loginadm.lev}" />
                    <label for="id">Authority level</label>
                  </div>
                  <div class="mt-4 mb-0">
                    <div class="d-grid">
                      <button type="button" class="btn btn-primary btn-block" id="update_btn">Update Account</button>
                    </div>
                  </div>
                </form>

              </div>
              <div class="card-footer text-center py-3">
                <div class="small"><a href="/login">Have an account? Go to login</a></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
  <div id="layoutAuthentication_footer">
    <footer class="py-4 bg-light mt-auto">
      <div class="container-fluid px-4">
        <div class="d-flex align-items-center justify-content-between small">
          <div class="text-muted">Copyright &copy; Your Website 2023</div>
          <div>
            <a href="#">Privacy Policy</a>
            &middot;
            <a href="#">Terms &amp; Conditions</a>
          </div>
        </div>
      </div>
    </footer>
  </div>
</div>
