<%-- 
    Document   : loai-sua-1
    Created on : Oct 4, 2016, 8:53:46 AM
    Author     : hv
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="JavaBeans.LoaiSua"%>
<%@page import="BusinessLogics.LoaiSuaBL"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trang loại sữa 4</title>
    </head>
    <body>
        <form name="frmLoaiSua" action="LoaiSuaController4" method="post">
            <table border="0">
                <caption>CẬP NHẬT LOẠI SỮA</caption>
                <tbody>
                    <tr>
                        <td>Mã loại</td>
                        <td><input type="text" name="txtMaLoai" value="${loaiSua.maLoai}" /></td>
                    </tr>
                    <tr>
                        <td>Tên loại</td>
                        <td><input type="text" name="txtTenLoai" value="${loaiSua.tenLoai}" /></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="submit" value="Thêm" name="btnChon" />
                            <input type="submit" value="Tìm" name="btnChon" />
                            <input type="submit" value="Sửa" name="btnChon" />
                            <input type="submit" value="Xóa" name="btnChon" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </form>
        <table border="1">
            <caption>DANH SÁCH LOẠI SỮA</caption>
            <thead>
                <tr>
                    <th>Mã loại</th>
                    <th>Tên loại</th>
                </tr>
            </thead>
            <tbody>
                <%--
                <c:forEach var="i" begin="0" end="2" step="1">
                    <tr>
                        <td>${dsls[i].maLoai}</td>
                        <td>${dsls[i].tenLoai}</td>
                    </tr>
                </c:forEach> 
                --%>
               
                <c:forEach items="${dsls}" var="ls">
                        <tr>
                            <td>${ls.maLoai}</td>
                            <td>${ls.tenLoai}</td>
                        </tr>
                </c:forEach>
            </tbody>
        </table>

    </body>
</html>
