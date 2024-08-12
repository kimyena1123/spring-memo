<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>로그인</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
    <div id="wrap">
        <section class="contents d-flex justify-content-center">
            <div class="join-box my-5">
                <form id="loginForm">
                    <input type="text" class="form-control mt-2" id="user_id" name="user_id" placeholder="아이디" />
                    <input type="password" class="form-control mt-2" id="user_pw" name="user_pw" placeholder="비밀번호"/>

                    <button type="submit" class="btn btn-primary btn-block mt-2" id="login_btn">로그인</button>
                    <div class="text=center mt-4"><a href="/user/signup/view">회원가입</a></div>
                </form>
            </div>
        </section>
    </div>

<script>
    $(document).ready(function(){

        $("#login_btn").on("click", function(e){

            //해당 이벤트의 기능을 모두 취소한다
            //preventDefault: 브라우저에서 구현된 기본 동작을 취소해준다
            //폼 이벤트: 폼이 제출되면 새로고침되는 기본ㄷ농작을 취소
            e.preventDefault();

            let user_id = $("#user_id").val();
            let user_pw = $("#user_pw").val();

            //input 빈 값이라면
            if(user_id === ""){
                alert('아이디를 입력해주세요');
                return;
            }
            if(user_pw === ""){
                alert("비밀번호를 입력해주세요");
                return;
            }

            $.ajax({
                type: 'POST',
                url: '/user/signin',
                data: {
                    'user_id' : user_id,
                    'user_pw' : user_pw,
                },
                success: function(res){
                    console.log(res.result);
                    if(res.result){
                        alert('로그인 성공');
                        location.href='/post/list/view';
                    }else{
                        alert('아이디 또는 비밀번호가 일치하지 않습니다.');
                        location.reload();
                    }
                },
                error: function(err){
                    alert('login err');
                }
            })
        });
    });
</script>
</body>
</html>