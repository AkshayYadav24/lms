<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SignUp</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
        <style>
            .message {
                display: none;
            }
        </style>
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
                        </c:choose> SignUpg
                    </h3>
                    <form action="signup.do" id="signup_form" method="POST">
                        <input type="hidden" name="user_type_id" id="user_type_id" value="${param.user_type_id}">
                        <div class="mb-3">
                            <label for="name" class="form-label fs-5 fw-semibold text-primary">Full Name</label>
                            <input type="text" class="form-control fs-5" name="name" id="name" value="">
                            <small class="text-danger message" id="name_err_msg">Enter Valid Name...</small>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label fs-5 fw-semibold text-primary">Email</label>
                            <input type="email" class="form-control fs-5" name="email" id="email" value="">
                            <small class="text-danger message" id="email_err_msg">Enter Valid Email...</small>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label fs-5 fw-semibold text-primary">Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control fs-5" name="password" id="password" value="">
                                <span class="input-group-text" id="basic-addon2"><img id="password_eye"
                                        src="static/media/image/eye_open.svg" width="33px" alt="" srcset=""></span>
                            </div>
                            <small class="text-danger message" id="password_err_msg">Password is atleast AtoZ, atoz,
                                0to9,@,#,$,_</small>
                        </div>

                        <div class="mb-3">
                            <label for="contact" class="form-label fs-5 fw-semibold text-primary">Contact</label>
                            <input type="number" class="form-control fs-5" name="contact" id="contact" value="">
                            <small class="text-danger message" id="contact_err_msg">Enter Valid Contact
                                Number...</small>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary btn-lg mt-3" id="btn">SignUp</button>
                        </div>
                    </form>

                    <div class="row mt-5">
                        <div class="col-md-6">
                            <a href="login.do?user_type_id=${param.user_type_id}" class="btn btn-warning">LogIn</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>



        <script>
            const signup_form = document.querySelector("#signup_form");

            const name_err_msg = document.querySelector("#name_err_msg");
            const email_err_msg = document.querySelector("#email_err_msg");
            const password_err_msg = document.querySelector("#password_err_msg");
            const contact_err_msg = document.querySelector("#contact_err_msg");

            const name = document.querySelector("#name");
            const email = document.querySelector("#email");
            const password = document.querySelector("#password");
            const contact = document.querySelector("#contact");

            const namePattern = new RegExp(/^[a-zA-Z][a-zA-Z_ ]*$/);
            const emailPattern = new RegExp(/^[0-9a-zA-Z][0-9A-Za-z_.]*@[a-zA-Z0-9]+\.[a-zA-Z0-9-.]+$/);
            const passwordPattern = new RegExp(/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[_#@$])[a-zA-Z0-9*_#@!~^$]{8,12}$/);
            const contactPattern = new RegExp(/^[6-9][0-9]{9}$/);

            // ******** Focus ***********************
            name.addEventListener('focus', (e) => {
                name_err_msg.style.display = 'none';
            })

            email.addEventListener('focus', (e) => {
                email_err_msg.style.display = 'none';
            })

            password.addEventListener('focus', (e) => {
                password_err_msg.style.display = 'none';
            })

            contact.addEventListener('focus', (e) => {
                contact_err_msg.style.display = 'none';
            })

            // ******** Blur *******************
            function match(pattern, value) {
                return (pattern.test(value))
            }

            name.addEventListener('blur', (e) => {
                if (!match(namePattern, name.value)) {
                    name_err_msg.style.display = 'inline';
                }
            })

            email.addEventListener('blur', (e) => {
                if (!emailPattern.test(email.value)) {
                    email_err_msg.style.display = 'inline';
                }
            })

            password.addEventListener('blur', (e) => {
                if (!passwordPattern.test(password.value)) {
                    password_err_msg.style.display = 'inline';
                }
            })

            contact.addEventListener('blur', (e) => {
                if (!contactPattern.test(contact.value)) {
                    contact_err_msg.style.display = 'inline';
                }
            })

            signup_form.addEventListener('submit', (e) => {
                e.preventDefault();
                let flag = true;

                if (!namePattern.test(name.value)) {
                    name_err_msg.style.display = 'inline';
                    flag = false;
                }

                if (!emailPattern.test(email.value)) {
                    email_err_msg.style.display = 'inline';
                    flag = false;
                }

                if (!passwordPattern.test(password.value)) {
                    password_err_msg.style.display = 'inline';
                    flag = false;
                }

                if (!contactPattern.test(contact.value)) {
                    contact_err_msg.style.display = 'inline';
                    flag = false;
                }

                if (flag) {
                    signup_form.submit();
                }
            })

            // password
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