<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

	<%--	jquery--%>
	<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>

	<%--	bootstrap--%>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div id="wrap">

		<section class="contents d-flex justify-content-center">
			<div class="join-box my-5">
				<h1>회원가입</h1>

				<input type="text" class="form-control mt-2" id="user_id" name="user_id"  placeholder="아이디"/>
				<input type="password" class="form-control mt-2" id="user_pw" name="user_pw"  placeholder="비밀번호"/>
				<input type="password" class="form-control mt-2" id="user_pw_check" name="user_pw_check" placeholder="비밀번호 확인"/>
				<input type="text" class="form-control mt-2" id="user_name" name="user_name" placeholder="이름" />
				<input type="email" class="form-control mt-2" id="user_email" name="user_email" placeholder="이메일"/>

				<button type="button" class="btn btn-primary btn-block mt-2" id="register_btn">회원가입</button>

 			</div>
		</section>
	</div>

</body>
</html>

<script>
	$(document).ready(function(){
		$('#register_btn').on("click", function(){
			let user_id = $('#user_id').val();
			let user_pw = $('#user_pw').val();
			let user_pw_check = $('#user_pw_check').val();
			let user_name = $('#user_name').val();
			let user_email = $('#user_email').val();

			if(user_id === ""){
				alert('아이디를 입력해주세요');
				return;
			}

			if(user_pw === ""){
				alert('비밀번호를 입력해주세요');
				return;
			}

			if(user_name === ""){
				alert('이름을 적어주세요');
				return;
			}

			if(user_email === ""){
				alert('이메일을 입력해주세요');
				return;
			}

			if(user_pw !== user_pw_check){
				alert("비밀번호가 일치하지 않습니다.");
				return;
			}

			$.ajax({
				type: 'POST',
				url: '/user/signup',
				data: {
					"user_id" : user_id,
					"user_pw" : user_pw,
					"user_name" : user_name,
					"user_email" : user_email,
				},
				success: function(res){
					if(res.result){
						location.href="/user/signin/view";
					}else{
						alert("회원가입 insert 실패");
					}
				},
				error: function(err){
					alert('insert err');
				}
			})
		})
	});
</script>

<style>
	h1{
		text-align: center;
	}
</style>