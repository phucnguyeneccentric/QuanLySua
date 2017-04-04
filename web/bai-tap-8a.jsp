<%-- 
    Document   : bai-tap-8
    Created on : Mar 31, 2017, 8:11:07 AM
    Author     : hv
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="JavaBeans.Sua"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Services.Database"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bài tập 8</title>
        <style>
            form{
                background-color:#E97C7C;
            }
            #container{
                background-color:#E9E9CA;
                width:800px;
                margin:auto;
            }
        </style>
        <%
            int sosp =0;
            List<Sua> dsSua= null;
            if(request.getParameter("btnTimKiem")!=null){
                dsSua = (List<Sua>)request.getAttribute("dsSua");
                sosp = Integer.parseInt(request.getAttribute("sosp").toString());
            }
        %>
    </head>
    <body>
        <div id="container">
        <form name="frmTimKiem" action="TimSuaTheoTenController" method="get">
            <table border="1" width="100%">
                <thead>
                    <tr>
                        <th colspan="2" style="font-size:25px;">TÌM KIẾM THÔNG TIN SỮA</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width:50%;padding-left:15px;">Tên sữa: <input type="text" name="txtTenSuaTim" value="" size="40"/></td>
                        <td><input type="submit" value="Tìm kiếm" name="btnTimKiem" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <%if(sosp>0){%>
        <p style="text-align:center;font-weight:bold;">Có <%= sosp%> sản phẩm được tìm thấy</p>
        <table border="1">
            <%for(Sua sua:dsSua){%>
            <thead>
                <tr>
                    <th colspan="2"><%= sua.getTenSua()%></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><img src="images/<%= sua.getHinh()%>"></td>
                    <td>
                        <p><b>Thành phần dinh dưỡng:</b> <br> <%= sua.getTpDinhDuong()%></p>
                        <p><b>Lợi ích:</b> <br> <%= sua.getLoiIch()%> </p>
                        <p><b>Trọng lượng:</b><%= sua.getTrongLuong()%> gr - <b>Đơn giá:</b> <%= sua.getDonGia()%> VNĐ</p>
                    </td>
                </tr>
            </tbody>
            <%}%>
        </table>
        <%}%>
        </div>
    </body>
</html>
 