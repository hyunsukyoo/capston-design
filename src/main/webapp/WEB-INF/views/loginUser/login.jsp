<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<script>
    const signUp = () => {
        let userId = $('input[name=userId]').val();
        let userPw = $('input[name=userPw]').val();

        let values = {
            'userId': userId,
            'userPw': userPw
        };

        console.log(values);

        axios.post('http://localhost:8080/login', values)
            .then(res => {
                console.log(res);
            })
            .catch(err => {
                console.log(err);
            });
    }
</script>

<h2>로그인</h2>
    <span style="color:red;">${map.message}</span>
    <table>
        <tr>
            <td>아이디</td>
            <td><input type="text" name="UserId"></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="UserPw"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="button" value="로그인" >
                <input type="button" value="회원가입" onclick="location.href='/join'">
            </td>
        </tr>
    </table>
</body>
</html>