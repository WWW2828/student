<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>学生信息管理系统</title>
    <style type="text/css">
        :root {
            --primary-color: #4361ee;
            --secondary-color: #3f37c9;
            --accent-color: #4895ef;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --success-color: #4cc9f0;
            --warning-color: #f8961e;
            --danger-color: #f94144;
            --management-color: #6c757d;
            --import-color: #20c997;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            color: var(--dark-color);
        }

        .container {
            width: 90%;
            max-width: 1000px;
            margin: 2rem auto;
            padding: 2rem;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(5px);
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        header {
            text-align: center;
            margin-bottom: 3rem;
        }

        h1 {
            font-size: 2.5rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
            position: relative;
            display: inline-block;
        }

        h1::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: var(--accent-color);
            border-radius: 2px;
        }

        .welcome {
            font-size: 1.1rem;
            color: #555;
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.6;
        }

        .menu {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2rem;
            margin: 3rem 0;
        }

        .menu-item {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            text-align: center;
            text-decoration: none;
            color: var(--dark-color);
            transition: all 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            border: 1px solid rgba(0, 0, 0, 0.05);
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

        .menu-item::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 5px;
            height: 100%;
        }

        .menu-item.management::before {
            background-color: var(--management-color);
        }

        .menu-item.import::before {
            background-color: var(--import-color);
        }

        .menu-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }

        .menu-item.management:hover {
            border-color: var(--management-color);
        }

        .menu-item.import:hover {
            border-color: var(--import-color);
        }

        .menu-item i {
            font-size: 2.5rem;
            margin-bottom: 1rem;
        }

        .menu-item.management i {
            color: var(--management-color);
        }

        .menu-item.import i {
            color: var(--import-color);
        }

        .menu-item span {
            font-size: 1.2rem;
            font-weight: 500;
            margin-bottom: 0.5rem;
        }

        .menu-item .desc {
            font-size: 0.9rem;
            color: #666;
            margin-bottom: 1rem;
        }

        .sub-actions {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 10px;
            width: 100%;
            margin-top: 10px;
        }

        .sub-action {
            padding: 8px 12px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 0.9rem;
            transition: all 0.2s ease;
            color: white;
            min-width: 100px;
            text-align: center;
        }

        .management .sub-action.view {
            background-color: var(--primary-color);
        }

        .management .sub-action.add {
            background-color: var(--success-color);
        }

        .management .sub-action.edit {
            background-color: var(--warning-color);
        }

        .management .sub-action.delete {
            background-color: var(--danger-color);
        }

        .import .sub-action {
            background-color: var(--import-color);
            width: 100%;
        }

        .sub-action:hover {
            transform: translateY(-2px);
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
            opacity: 0.9;
        }

        footer {
            text-align: center;
            margin-top: 3rem;
            padding-top: 1.5rem;
            border-top: 1px solid rgba(0, 0, 0, 0.1);
            color: #666;
            font-size: 0.9rem;
        }

        /* 响应式调整 */
        @media (max-width: 768px) {
            .container {
                width: 95%;
                padding: 1.5rem;
            }

            h1 {
                font-size: 2rem;
            }

            .menu {
                grid-template-columns: 1fr;
            }
        }
    </style>
    <!-- 引入Font Awesome图标 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<div class="container">
    <header>
        <h1>学生信息管理系统</h1>
        <p class="welcome">欢迎使用学生信息管理系统，这是一个功能完善的管理平台，可以帮助您高效管理学生信息数据。</p>
    </header>

    <div class="menu">
        <!-- 学生信息管理功能框 -->
        <div class="menu-item management">
            <i class="fas fa-users-cog"></i>
            <span>学生信息管理</span>
            <p class="desc">全面管理学生信息数据</p>
            <div class="sub-actions">
                <a href="ListStudentServlet.do" class="sub-action view">查看信息</a>
                <a href="jsp/studentinsert.jsp" class="sub-action add">新增学生</a>
                <a href="ListStudentServlet.do?action=edit" class="sub-action edit">修改信息</a>
                <a href="ListStudentServlet.do?action=delete" class="sub-action delete">删除信息</a>
            </div>
        </div>

        <!-- 数据导入功能框 -->
        <div class="menu-item import">
            <i class="fas fa-file-import"></i>
            <span>数据批量导入</span>
            <p class="desc">通过Excel文件批量导入学生数据</p>
            <div class="sub-actions">
                <a href="jsp/import.jsp" class="sub-action">导入Excel</a>
            </div>
        </div>
    </div>

    <footer>
        <p> 2025 学生信息管理系统 | QuantumLeap（量子跃迁）</p>
    </footer>
</div>
</body>
</html>