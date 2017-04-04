<%-- 
    Document   : bai-tap-8
    Created on : Mar 31, 2017, 8:11:07 AM
    Author     : hv
--%>

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
        <%!
            Connection ketNoi = Database.LayKetNoi();
            Statement stm;
            ResultSet rs;
            int sosp=0;
        %>
        <%
            request.setCharacterEncoding("UTF-8");
            String tenSua="";
            if(request.getParameter("txtTenSuaTim")!=null){
                tenSua=request.getParameter("txtTenSuaTim");
                stm= ketNoi.createStatement();
                rs = stm.executeQuery("select * from sua where ten_sua like '%"+tenSua+"%'");
                rs.last();
                sosp = rs.getRow();
                rs.beforeFirst();
            }
        %>
    </head>
    <body>
        <div id="container">
        <form name="frmTimKiem" action="" method="get">
            <table border="1" width="100%">
                <thead>
                    <tr>
                        <th colspan="2" style="font-size:25px">TÌM KIẾM THÔNG TIN SỮA</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td width="50%" style="padding-left:15px;">Tên sữa: <input type="text" name="txtTenSuaTim" value="" size="40"/></td>
                        <td><input type="submit" value="Tìm kiếm" name="btnTimKiem" /></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <%if(sosp>0){%>
        <p style="text-align:center;font-weight:bold;">Có <%= sosp%> sản phẩm được tìm thấy</p>
        <table border="1">
            <%while(rs.next()){%>
            <thead>
                <tr>
                    <th colspan="2" style="font-size:20px;"><%= rs.getString("ten_sua")%></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><img src="images/<%= rs.getString("hinh")%>"></td>
                    <td>
                        <p><b>Thành phần dinh dưỡng:</b> <br> <%= rs.getString("tp_dinh_duong")%></p>
                        <p><b>Lợi ích:</b> <br> <%= rs.getString("loi_ich")%> </p>
                        <p><b>Trọng lượng:</b><%= rs.getInt("trong_luong")%> gr - <b>Đơn giá:</b> <%= rs.getInt("don_gia")%> VNĐ</p>
                    </td>
                </tr>
            </tbody>
            <%}%>
        </table>
        <%}%>
        </div>
    </body>
</html>
 