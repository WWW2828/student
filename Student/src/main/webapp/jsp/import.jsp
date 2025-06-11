<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>`
<head>
    <title>批量导入学生信息</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; padding: 20px; background-color: #f5f5f5; }
        .container { max-width: 800px; margin: 0 auto; background: white; padding: 20px; border-radius: 5px; box-shadow: 0 0 10px rgba(0,0,0,0.1); }
        h1 { color: #333; text-align: center; }
        .form-group { margin-bottom: 15px; }
        .error { color: #d9534f; background: #f2dede; padding: 10px; border-radius: 4px; margin-bottom: 15px; }
        .info-box { background: #e7f4ff; padding: 15px; border-radius: 4px; margin: 20px 0; }
        .btn { background: #337ab7; color: white; padding: 8px 15px; border: none; border-radius: 4px; cursor: pointer; }
        .btn:hover { background: #286090; }
        .format-table { width: 100%; border-collapse: collapse; margin-top: 15px; }
        .format-table th, .format-table td { border: 1px solid #ddd; padding: 8px; text-align: left; }
        .format-table th { background-color: #f2f2f2; }
    </style>
</head>
<body>
<div class="container">
    <h1>批量导入学生信息</h1>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <div class="info-box">
        <h3>操作说明</h3>
        <p>请上传包含学生信息的Excel文件，系统将自动导入数据</p>
    </div>

    <form action="../ImportExcelServlet.do" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label><strong>选择Excel文件:</strong></label>
            <input type="file" name="excelFile" accept=".xlsx" required style="display: block; margin-top: 5px;">
        </div>

        <div class="form-group">
            <input type="submit" value="开始导入" class="btn">
            <a href="../ListStudentServlet.do" class="btn" style="margin-left: 10px; text-decoration: none;">返回列表</a>
        </div>
    </form>

    <div class="info-box">
        <h3>Excel文件格式要求</h3>
        <table class="format-table">
            <tr>
                <th>列顺序</th>
                <th>字段名称</th>
                <th>数据类型</th>
                <th>是否必填</th>
                <th>示例</th>
            </tr>
            <tr>
                <td>1</td>
                <td>学号</td>
                <td>整数</td>
                <td>是</td>
                <td>1001</td>
            </tr>
            <tr>
                <td>2</td>
                <td>姓名</td>
                <td>字符串</td>
                <td>是</td>
                <td>张三</td>
            </tr>
            <tr>
                <td>3</td>
                <td>性别</td>
                <td>字符串</td>
                <td>是</td>
                <td>男/女</td>
            </tr>
            <tr>
                <td>4</td>
                <td>班级</td>
                <td>字符串</td>
                <td>是</td>
                <td>计算机1班</td>
            </tr>
            <tr>
                <td>5</td>
                <td>年龄</td>
                <td>整数</td>
                <td>是</td>
                <td>20</td>
            </tr>
            <tr>
                <td>6</td>
                <td>成绩</td>
                <td>浮点数</td>
                <td>是</td>
                <td>85.5</td>
            </tr>
        </table>
        <p style="margin-top: 10px;"><strong>注意：</strong>第一行应为标题行，系统会自动跳过</p>
    </div>
</div>
</body>
</html>