<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let login = {
        init: () => {
            $('#login_btn').attr('disabled',true);
            $('#pwd').keyup( () => {
                let id = $("#id").val();
                let pwd = $("#pwd").val();
                if(id != '' && pwd != '') {
                    $('#login_btn').attr('disabled',false);
                };
            });
            $("#login_btn").click( () => {
                login.send();
            });
        },
        send: () => {
            $("#login_form").attr({
                'action':'/loginimpl',
                'method':'post'
            });
            $("#login_form").submit();
        }
    }

    $( ()=> {
        login.init();
    })
</script>



<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                            <div class="card-body">

                                <form id="login_form">
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="id" type="id" name="id" placeholder="Enter ID" />
                                        <label for="id">Enter ID</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input class="form-control" id="pwd" type="password" name="pwd" placeholder="Enter PWD" />
                                        <label for="pwd">Enter Password</label>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                        <a class="small" href="/forgotpwd">Forgot Password?</a>
                                        <button type="button" id="login_btn" class="btn btn-primary ">Login</button>
<%--                                        <a class="btn btn-primary" href="#">Login</a>--%>
                                    </div>
                                </form>

                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small"><a href="/register">Need an account? Sign up!</a></div>
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