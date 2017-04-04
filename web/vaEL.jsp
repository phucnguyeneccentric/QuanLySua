<%-- 
    Document   : vaEL
    Created on : Apr 4, 2017, 8:36:22 AM
    Author     : hv
--%>
<%@page import="JavaBeans.LoaiSua"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            int[] a={1,2,3,4,5};
            //application.setAttribute("a", a);
            //session.setAttribute("a", a);
            request.setAttribute("a",a);
            //pageContext.setAttribute("a", a);
            
            //List<String> ds = Arrays.asList("mai","lan","cuc","truc");
            List<String> ds = new ArrayList<String>();
            ds.add("mai");
            ds.add("lan");
            ds.add("cuc");
            ds.add("truc");
            request.setAttribute("ds",ds);
            
            Map<String,String> td= new Hashtable<String,String>();
            td.put("override", "ghi đè");
            td.put("interface", "giao tiếp");
            td.put("extend","mở rộng");
            request.setAttribute("td", td);
            
            double tongTien=12345.67;
            request.setAttribute("tongTien",tongTien);
            
            LoaiSua loaiSua = new LoaiSua();
            loaiSua.setMaLoai("aa");
            loaiSua.setTenLoai("aaaa");
            request.setAttribute("loaiSua", loaiSua);
            
            String hoTen = "Trần Vi Tính";
            session.setAttribute("hoTen",hoTen);
        %>

    </head>
    <body>
         a[1]=<%= a[1]%><br>
        a[1]=${a[1]}<br>
        ds[1] = ${ds[1]}<br>
        td["interface"] = ${td["interface"]}<br>
        Tổng tiền: ${tongTien}<br
        Tên Loại: <%= loaiSua.getTenLoai()%><br>
        Tên loại: ${loaiSua.tenLoai}
        Tên loại (EL phương thức): ${loaiSua.getTenLoai()}<br>
        3>2 là ${3>2?"Đúng":"Sai"}<br>
        Họ tên (jsp tag): <%= session.getAttribute("hoTen")%><br>
        Họ tên (EL) : ${sessionScope.hoTen}<br>
        Mã sữa (jsp tag) : <%= request.getParameter("maSua")%><br>
        Mã sữa (EL param) : ${param.maSua}

        
        <h1>Hello World!</h1>
    </body>
</html>
