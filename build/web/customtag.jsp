<%-- 
    Document   : customtag
    Created on : Apr 3, 2017, 8:47:59 AM
    Author     : hv
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="myTag" uri="/WEB-INF/tlds/mytaglib.tld" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <myTag:chao>Phuc</myTag:chao>
        <myTag:cong a="4" b="5">Kết quả :</myTag:cong>
        <myTag:loaisua></myTag:loaisua>
    </body>
</html>
