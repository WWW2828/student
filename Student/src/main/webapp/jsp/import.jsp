<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>`
<head>
    <title>��������ѧ����Ϣ</title>
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
    <h1>��������ѧ����Ϣ</h1>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <div class="info-box">
        <h3>����˵��</h3>
        <p>���ϴ�����ѧ����Ϣ��Excel�ļ���ϵͳ���Զ���������</p>
    </div>

    <form action="../ImportExcelServlet.do" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label><strong>ѡ��Excel�ļ�:</strong></label>
            <input type="file" name="excelFile" accept=".xlsx" required style="display: block; margin-top: 5px;">
        </div>

        <div class="form-group">
            <input type="submit" value="��ʼ����" class="btn">
            <a href="../ListStudentServlet.do" class="btn" style="margin-left: 10px; text-decoration: none;">�����б�</a>
        </div>
    </form>

    <div class="info-box">
        <h3>Excel�ļ���ʽҪ��</h3>
        <table class="format-table">
            <tr>
                <th>��˳��</th>
                <th>�ֶ�����</th>
                <th>��������</th>
                <th>�Ƿ����</th>
                <th>ʾ��</th>
            </tr>
            <tr>
                <td>1</td>
                <td>ѧ��</td>
                <td>����</td>
                <td>��</td>
                <td>1001</td>
            </tr>
            <tr>
                <td>2</td>
                <td>����</td>
                <td>�ַ���</td>
                <td>��</td>
                <td>����</td>
            </tr>
            <tr>
                <td>3</td>
                <td>�Ա�</td>
                <td>�ַ���</td>
                <td>��</td>
                <td>��/Ů</td>
            </tr>
            <tr>
                <td>4</td>
                <td>�༶</td>
                <td>�ַ���</td>
                <td>��</td>
                <td>�����1��</td>
            </tr>
            <tr>
                <td>5</td>
                <td>����</td>
                <td>����</td>
                <td>��</td>
                <td>20</td>
            </tr>
            <tr>
                <td>6</td>
                <td>�ɼ�</td>
                <td>������</td>
                <td>��</td>
                <td>85.5</td>
            </tr>
        </table>
        <p style="margin-top: 10px;"><strong>ע�⣺</strong>��һ��ӦΪ�����У�ϵͳ���Զ�����</p>
    </div>
</div>
</body>
</html>