<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
    const signUp = () => {
        let userId = $('input[name=userId]').val();
        let userPw = $('input[name=userPw]').val();
        let userName = $('input[name=userName]').val();
        let userGender = $('input[name=userGender]').val();
        let userTel = $('input[name=userTel]').val();
        let userAddress = $('input[name=userAddress]').val();

        let values = {
            'userId': userId,
            'userPw': userPw,
            'userName': userName,
            'userGender': userGender,
            'userTel': userTel,
            'userAddress': userAddress
        };

        console.log(values);

        axios.post('http://localhost:8080/join', values)
            .then(res => {
                console.log(res);
            })
            .catch(err => {
                console.log(err);
            });
    }
</script>

* 회/원/가/입 *<br><br>
    <span style="color:#ff0000; font-weight: bold">* 필수입력</span>
    <br>
    <table border="1">
        <tr> <th>*아이디</th>
            <td>
                <input type="text" name="userId" id="id" size="15" required>
                <input type="button" value="ID중복확인" onclick="idCheck()">
            </td>
        </tr>
        <tr>
            <th>*비밀번호</th>
            <td>
                <input type="password" name="userPw" id="passwd" size="15" required>
            </td>
        </tr>

        <tr>
            <th>*이름</th>
            <td><input type="text" name="userName" id="mname" size="15" required></td>
        </tr>

        <tr>
            <th>*성별</th>
            <td>
                <input type="text" name="userGender" id="mgender" size="15" required></td>
        </tr>

        <tr>
            <th>전화번호</th>
            <td>
            <input type="text" name="userTel" id="tel" size="15">
            </td>
        </tr>

        <tr>
            <th>주소</th>
            <td>
            <input type="text" name="userAddress" id="address" size="45" required>
            </td>
        </tr>
    </table>

<button onClick="signUp()">회원가입</button>
</body>
</html>