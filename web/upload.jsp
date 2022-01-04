<%--
  Created by IntelliJ IDEA.
  User: shenwanru
  Date: 2021/8/4
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<!--文件上传时，设置enctype="multipart/form-data"支持二进制方式上传文件-->
<form method="post" action="do_upload.jsp" enctype="multipart/form-data">
    请选择文件:<input type="file" name="file"/><br>
    请选择文件:<input type="file" name="file"/><br>
    请选择文件:<input type="file" name="file"/><br>
    <input type="submit" value="上传"/>
</form>
</body>
</html>
