<%-- 
    Document   : vdJSTL
    Created on : Apr 4, 2017, 9:22:17 AM
    Author     : hv
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="JavaBeans.LoaiSua"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            LoaiSua ls1 = new LoaiSua();
            ls1.setMaLoai("aa");
            ls1.setTenLoai("aaaa");
            LoaiSua ls2 = new LoaiSua();
            ls2.setMaLoai("bb");
            ls2.setTenLoai("bbbb");
            LoaiSua ls3 = new LoaiSua();
            ls3.setMaLoai("bb");
            ls3.setTenLoai("bbbb");
            List<LoaiSua> dsls = Arrays.asList(ls1,ls2,ls3);
            request.setAttribute("dsls",dsls);
        %>
    
    </head>
    <body>
        <h1>Hello World!</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Mã sữa</th>
                    <th>Tên sữa</th>
                </tr>
            </thead>
            <tbody>
                
                <c:forEach var="i" begin="0" end="2" step="1">
                    <tr>
                        <td>${dsls[i].maLoai}</td>
                        <td>${dsls[i].tenLoai}</td>
                    </tr>
                </c:forEach>      
                
                <%--
                <c:forEach items="${dsls}" var="ls">
                    <tr>
                        <td>${ls.maLoai}</td>
                        <td>${ls.tenLoai}</td>
                    </tr>
                </c:forEach>
                --%>

            </tbody>
        </table>

    </body>
</html>
