<%--
  Created by IntelliJ IDEA.
  User: un2ge
  Date: 2020-06-18
  Time: 오후 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"
         import="java.sql.*, java.util.*"%>
<html>
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <meta charset="utf-8" />
    <meta name="viewport"
          content="width=device-width, initial-scale=1, user-scalable=no" />

</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");
    String name = (String) request.getParameter("name");
    String hospital = (String) request.getParameter("hospital");
    int num=1;
    int isNull;

    String logout = request.getParameter("logout");

    if (logout != null && logout.equals("yes")) {
        session.removeAttribute("id");
        session.removeAttribute("login");
    }

    isNull=0;
%>
<header id="header" class="row justify-content-md-center" >
    <div class="table-wrapper">
        <h3><%=name%>님의 예약 내역</h3>
    </div>
</header>

<div class="row justify-content-md-center" >
    <table id="main_table" class="table table-bordered" style="top: 100px;width: 800px; ">
        <thead>
            <td>num</td>
            <td>병원명</td>
            <td>예약 날짜</td>
        </thead>
        <tr>
            <td>1</td>
            <td><a href='bookCheck.jsp'><%=hospital%></a></td>
            <td><p>2020-06-25</p></td>
        </tr>
    </table>
</div>
</body>
</html>
