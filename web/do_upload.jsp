<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItem" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.io.File" %>
<%@ page import="org.apache.commons.fileupload.FileUploadBase" %>
<%@ page import="java.util.Arrays" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    //设置请求字符编码
    request.setCharacterEncoding("utf-8");
    //请求信息中的内容是否是multipart类型
    boolean isMultipart= ServletFileUpload.isMultipartContent(request);
    //文件的上传路径（服务器上的绝对路径）
    String uploadFilePath=request.getSession().getServletContext().getRealPath("file/");
    if(isMultipart){//判断是否是二进制上传
        DiskFileItemFactory factory=new DiskFileItemFactory();
        //创建ServletFileUpload对象，用于做文件上传
        ServletFileUpload upload=new ServletFileUpload(factory);
        //设置上传文件最大值，以字节为单位
        upload.setSizeMax(1024*500);
        try{
        //获取表单提交上来的文件，每一个文件都是一个fileitem对象
        List<FileItem> items=upload.parseRequest(request);
        for(int i=0;i<items.size();i++){
            //获取FileItem对象
            FileItem item=items.get(i);
            if(!item.isFormField()){//如果item对象是一个文件表单元素
                //获取文件名
                String fileName=item.getName();
                if(fileName!=null&&!fileName.equals("")){//判断文件名不为空或空字符串
                   //限制文件类型
                    //规定好可以上传的文件后缀有哪些
                    List<String> fileType= Arrays.asList("png","gif","jpg","bmp");
                    //截取上传文件的后缀
                    String ext=fileName.substring(fileName.lastIndexOf(".")+1);
                    if(fileType.contains(ext)){

                    //创建文件对象，指定文件名和文件路径
                    File file=new File(uploadFilePath,fileName);
                    //通过 FileItem的write()方法将文件的内容保存到文件中
                    item.write(file);
                    out.print("文件上传成功！文件名："+fileName+"<br>");
                    }else {
                        out.print("上传失败，文件类型不匹配！<br>");
                    }
                }
            }
        }
    }catch (FileUploadBase.SizeLimitExceededException e){
            out.print("上传失败！文件超出最大值，文件最大为"+upload.getSizeMax()+"字节");
        }
    }
%>