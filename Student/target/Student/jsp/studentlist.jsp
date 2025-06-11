<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- 模式判断 --%>
<c:set var="isEditMode" value="${not empty param.action and param.action eq 'edit'}"/>
<c:set var="isDeleteMode" value="${not empty param.action and param.action eq 'delete'}"/>
<c:set var="showOperation" value="${isEditMode or isDeleteMode}"/>

<!DOCTYPE html>
<html>
<head>
    <title>
        <c:choose>
            <c:when test="${isEditMode}">修改学生</c:when>
            <c:when test="${isDeleteMode}">删除学生</c:when>
            <c:otherwise>学生列表</c:otherwise>
        </c:choose>
    </title>
    <style>
        /* 基础样式 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center; /* 使整个页面内容居中 */
            min-height: 100vh;
        }

        /* 表格容器样式 */
        .table-container {
            width: 90%;
            max-width: 1000px;
            margin: 20px auto;
            overflow-x: auto; /* 添加水平滚动条（如果需要） */
        }

        /* 表格样式 */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center; /* 单元格内容居中 */
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
            position: sticky;
            top: 0;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* 操作按钮样式 */
        .btn-edit {
            background-color: #4CAF50;
            color: white;
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 4px;
            margin: 0 3px;
            display: inline-block;
            min-width: 60px;
        }

        .btn-delete {
            background-color: #f44336;
            color: white;
            padding: 6px 12px;
            text-decoration: none;
            border-radius: 4px;
            margin: 0 3px;
            display: inline-block;
            min-width: 60px;
        }

        /* 模式提示条 */
        .mode-indicator {
            padding: 12px;
            margin: 20px 0;
            border-radius: 4px;
            text-align: center;
            width: 90%;
            max-width: 1000px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .edit-mode .mode-indicator {
            background-color: #fff8e1;
            color: #ff8f00;
            border-left: 4px solid #FFC107;
        }

        .delete-mode .mode-indicator {
            background-color: #ffebee;
            color: #c62828;
            border-left: 4px solid #f44336;
        }

        /* 标题样式 */
        h1 {
            text-align: center;
            margin: 20px 0;
            color: #333;
            width: 90%;
            max-width: 1000px;
        }
    </style>
</head>
<body class="${isEditMode ? 'edit-mode' : ''} ${isDeleteMode ? 'delete-mode' : ''}">

<!-- 模式提示 -->
<c:if test="${isEditMode or isDeleteMode}">
    <div class="mode-indicator">
        <c:choose>
            <c:when test="${isEditMode}">
                ?? 您正在修改模式下，请选择要修改的学生
            </c:when>
            <c:when test="${isDeleteMode}">
                ? 您正在删除模式下，操作不可逆！
            </c:when>
        </c:choose>
    </div>
</c:if>

<!-- 动态标题 -->
<h1>
    <c:choose>
        <c:when test="${isEditMode}">修改学生信息</c:when>
        <c:when test="${isDeleteMode}">删除学生信息</c:when>
        <c:otherwise>学生信息列表</c:otherwise>
    </c:choose>
</h1>

<!-- 学生表格 -->
<div class="table-container">
    <table>
        <thead>
        <tr>
            <th>学号</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>班级</th>
            <th>成绩</th>
            <c:if test="${showOperation}">
                <th>操作</th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${studentlist}" var="student">
            <tr>
                <td>${student.id}</td>
                <td>${student.name}</td>
                <td>${student.age}</td>
                <td>${student.grade}</td>
                <td>${student.score}</td>
                <c:if test="${showOperation}">
                    <td>
                        <c:choose>
                            <c:when test="${isEditMode}">
                                <a href="UpdateStudentservlet.do?id=${student.id}" class="btn-edit">修改</a>
                            </c:when>
                            <c:when test="${isDeleteMode}">
                                <a href="Deleteservlet.do?id=${student.id}"
                                   class="btn-delete"
                                   onclick="return confirm('确定删除 ${student.name} 吗？')">删除</a>
                            </c:when>
                        </c:choose>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>