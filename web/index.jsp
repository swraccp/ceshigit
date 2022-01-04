<%@ page import="com.flower.service.FlowerService" %>
<%@ page import="com.flower.service.impl.FlowerServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.flower.entity.Flower" %>
<%@ page import="com.flower.util.PageBean" %><%--
  Created by IntelliJ IDEA.
  User: shenwanru
  Date: 2021/7/30
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <%--<script type="text/javascript" src="js/jquery-1.12.4.js">--%>
  <%--</script>--%>
  <%--<script type="text/javascript">--%>
      <%--$(document).ready(function () {--%>
          <%--$("tr:even").css("background-color","pink")--%>
      <%--});--%>
  <%--</script>--%>
  <%--<table border="1">--%>
    <%--<tr style="font-size: 40px; background-color: pink; text-align: center;font-family: 微软雅黑"><td colspan="5">花卉信息列表</td></tr>--%>
    <%--<tr style="text-align: right"><td colspan="5"><a>增加花卉信息</a></td></tr>--%>
    <%--<tr style=" width: 100px">--%>
      <%--<td style="width: 100px">花卉编号</td>--%>
      <%--<td style="width: 100px">花卉姓名</td>--%>
      <%--<td style="width: 100px">别名</td>--%>
      <%--<td style="width: 100px">科属</td>--%>
      <%--<td style="width: 100px">价格(元/支)</td>--%>
    <%--</tr>--%>
  <form method="post" action="index.jsp">
      花名：<input type="text" name="flower"><input type="submit" value="搜索">
  </form>
  <%
      request.setCharacterEncoding("utf-8");
      String name=request.getParameter("flower");
      if(name==null){
          name="";
      }
  //获取超链接传的值，第一次打开首页时，index值为空
  String index=request.getParameter("pageIndex");
    FlowerService flowerService=new FlowerServiceImpl();
    PageBean pageBean=new PageBean();
    //调用getCount()方法，查询到数据库一共有多少条数据，赋值给allRows
    pageBean.setAllRows(flowerService.getCount(name));
    //处理页码
    if(index!=null){
        Integer pageIndex=Integer.parseInt(index);
        //当页码为0时，设置当前页码为1
        if(pageIndex<=0){
            pageIndex=1;
            //如果页码超出总页数，当前页码最大为总页数的值
        }else if(pageIndex>pageBean.getTotalPage()){
            pageIndex=pageBean.getTotalPage();
        }
        //把当前页码重新赋值给pageIndex属性
        pageBean.setPageIndex(pageIndex);
    }
    //调用查询所有的分页方法，把一页的数据存到pageList中
    pageBean.setPageList(flowerService.getAll(pageBean,name));
    //显示结果
    for(int i=0;i<pageBean.getPageList().size();i++){
        out.print(pageBean.getPageList().get(i).getName()+"<br/>");
    }
  %>
    [<%=pageBean.getPageIndex()%>/<%=pageBean.getTotalPage()%>]
    <a href="index.jsp?pageIndex=1&flower=<%=name%>">首页</a>
    <a href="index.jsp?pageIndex=<%=pageBean.getPageIndex()-1%>&flower=<%=name%>">上一页</a>
    <a href="index.jsp?pageIndex=<%=pageBean.getPageIndex()+1%>&flower=<%=name%>">下一页</a>
    <a href="index.jsp?pageIndex=<%=pageBean.getTotalPage()%>"&flower=<%=name%>>末页</a>

  </body>
</html>
