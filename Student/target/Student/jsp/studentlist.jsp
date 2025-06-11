<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- ģʽ�ж� --%>
<c:set var="isEditMode" value="${not empty param.action and param.action eq 'edit'}"/>
<c:set var="isDeleteMode" value="${not empty param.action and param.action eq 'delete'}"/>
<c:set var="showOperation" value="${isEditMode or isDeleteMode}"/>

<!DOCTYPE html>
<html>
<head>
    <title>
        <c:choose>
            <c:when test="${isEditMode}">�޸�ѧ��</c:when>
            <c:when test="${isDeleteMode}">ɾ��ѧ��</c:when>
            <c:otherwise>ѧ���б�</c:otherwise>
        </c:choose>
    </title>
    <style>
        /* ������ʽ */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: center; /* ʹ����ҳ�����ݾ��� */
            min-height: 100vh;
        }

        /* ���������ʽ */
        .table-container {
            width: 90%;
            max-width: 1000px;
            margin: 20px auto;
            overflow-x: auto; /* ���ˮƽ�������������Ҫ�� */
        }

        /* �����ʽ */
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: center; /* ��Ԫ�����ݾ��� */
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

        /* ������ť��ʽ */
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

        /* ģʽ��ʾ�� */
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

        /* ������ʽ */
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

<!-- ģʽ��ʾ -->
<c:if test="${isEditMode or isDeleteMode}">
    <div class="mode-indicator">
        <c:choose>
            <c:when test="${isEditMode}">
                ?? �������޸�ģʽ�£���ѡ��Ҫ�޸ĵ�ѧ��
            </c:when>
            <c:when test="${isDeleteMode}">
                ? ������ɾ��ģʽ�£����������棡
            </c:when>
        </c:choose>
    </div>
</c:if>

<!-- ��̬���� -->
<h1>
    <c:choose>
        <c:when test="${isEditMode}">�޸�ѧ����Ϣ</c:when>
        <c:when test="${isDeleteMode}">ɾ��ѧ����Ϣ</c:when>
        <c:otherwise>ѧ����Ϣ�б�</c:otherwise>
    </c:choose>
</h1>

<!-- ѧ����� -->
<div class="table-container">
    <table>
        <thead>
        <tr>
            <th>ѧ��</th>
            <th>����</th>
            <th>����</th>
            <th>�༶</th>
            <th>�ɼ�</th>
            <c:if test="${showOperation}">
                <th>����</th>
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
                                <a href="UpdateStudentservlet.do?id=${student.id}" class="btn-edit">�޸�</a>
                            </c:when>
                            <c:when test="${isDeleteMode}">
                                <a href="Deleteservlet.do?id=${student.id}"
                                   class="btn-delete"
                                   onclick="return confirm('ȷ��ɾ�� ${student.name} ��')">ɾ��</a>
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