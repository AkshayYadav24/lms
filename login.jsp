<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
    </head>

    <body>
        <div class="container">

            <div class="row justify-content-center">
                <div class="col-md-4 mt-5 border border-secondary rounded p-5 pb-4">
                    <h3 class="text-secondary mb-5">
                        Library Management System
                    </h3>
                    <h3 class="text-secondary mb-5">
                        <c:choose>
                            <c:when test="${param.user_type_id==1}">
                                Admin
                            </c:when>
                            <c:otherwise>
                                User
                            </c:otherwise>
                        </c:choose> Login
                    </h3>
                    <form action="login.do" method="post">
                        <input type="hidden" name="user_type_id" id="user_type_id" value="${param.user_type_id}">
                        <div class="mb-4">
                            <label for="user_id" class="form-label fs-5 fw-semibold text-primary">User_id</label>
                            <input type="text" class="form-control fs-5" name="user_id" id="User_id"
                                value="">
                        </div>
                        <div class="mb-4">
                            <label for="password" class="form-label fs-5 fw-semibold text-primary">Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control fs-5" name="password" id="password">
                                <span class="input-group-text" id="basic-addon2"><img id="password_eye"
                                        src="static/media/image/eye_open.svg" width="33px" alt="" srcset=""></span>
                            </div>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary btn-lg" id="btn">SignIn</button>
                        </div>
                    </form>
                    <div class="row mt-5">
                        <div class="col-6">
                            <a href="signup.do?user_type_id=${param.user_type_id}" class="btn btn-warning">SignUp</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            const password = document.querySelector("#password");
            const password_eye = document.querySelector("#password_eye");

            password_eye.addEventListener('click', (e) => {
                if (password_eye.src == 'http://localhost:8080/wma/static/media/image/eye_close.svg') {
                    password.type = 'password';
                    password_eye.src = 'static/media/image/eye_open.svg';
                } else {
                    password.type = 'text';
                    password_eye.src = 'static/media/image/eye_close.svg';
                }
            });

            password.addEventListener('click', (e) => {
                password.type = 'password';
                password_eye.src = 'static/media/image/eye_open.svg';
            });
        </script>
    </body>

    </html>