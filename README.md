# 🎓 学生信息管理系统 StudentManager

本项目为一套基于 **Java Web (JSP + Servlet + JavaBean) + MySQL** 架构开发的学生信息管理系统，遵循 MVC 设计模式。用户可通过网页界面对学生信息进行增删改查操作，并支持通过 Excel 文件批量导入学生数据。项目使用 Navicat 进行数据库可视化建模，配合 Apache POI 实现 Excel 操作。

---

## 📚 项目功能

✅ 学生信息录入（增）  
✅ 学生信息浏览（查）  
✅ 学生信息修改（改）  
✅ 学生信息删除（删）  
✅ Excel 文件批量导入学生数据  
✅ 使用 Navicat 图形化建表  
✅ 使用 GitHub 进行版本控制  
✅ 使用 ProcessOn 进行 UML 类图与用例图建模  

---

## 🧱 技术栈

| 模块     | 技术框架                |
| -------- | ----------------------- |
| 前端     | JSP + HTML + CSS        |
| 后端     | Java Servlet + JavaBean |
| 数据库   | MySQL 8.0               |
| 可视化   | Navicat Premium         |
| 文件导入 | Apache POI              |
| Web容器  | Apache Tomcat 9.0       |
| IDE      | IntelliJ IDEA / Eclipse |
| 建模     | ProcessOn UML           |
| 项目管理 | Git + GitHub            |

---

## 📁 项目结构

StudentManager/
 ├── src/
 │   ├── entity/              # 实体类（Student.java）
 │   ├── dbutil/              # 数据库连接类（Dbconn.java）
 │   ├── model/               # 业务逻辑处理类（StudentModel.java）
 │   └── control/             # 控制器Servlet类
 ├── WebRoot/
 │   ├── jsp/                 # 页面文件（JSP视图）
 │   └── WEB-INF/web.xml      # Servlet配置
 ├── student.sql              # 数据库初始化脚本
 ├── lib/                     # mysql-connector 和 POI Jar 包
 └── README.md

## ⚙️ 环境部署步骤

### 📌 1. 数据库初始化

使用 Navicat（或命令行）导入 `student.sql` 创建数据库和表：

```sql
CREATE DATABASE students;
USE students;

CREATE TABLE student (
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50),
  age INT,
  gender VARCHAR(10),
  major VARCHAR(50)
);
```

### 📌 2. 配置数据库连接

编辑 `dbutil/Dbconn.java`：

```java
private static final String URL = "jdbc:mysql://localhost:3306/students?useSSL=false&serverTimezone=UTC";
private static final String USER = "root";
private static final String PASSWORD = "your_password";
```

### 📌 3. 项目运行方式

1. 使用 IntelliJ IDEA 或 Eclipse 打开本项目；
2. 导入所有依赖 JAR 包（MySQL 驱动、Apache POI）；
3. 启动 Tomcat；
4. 浏览器访问：

```
http://localhost:8080/studentmanager/ListStudentServlet.do
```

------

## 📦 功能说明

| 页面路径                   | 功能描述       |
| -------------------------- | -------------- |
| `studentinsert.jsp`        | 添加学生       |
| `studentlist.jsp`          | 列出所有学生   |
| `studentupdate.jsp`        | 修改学生信息   |
| `studentshow.jsp`          | 查看并删除学生 |
| `student_excel_import.jsp` | Excel批量导入  |

------

## 📄 UML 建模文件（由 ProcessOn 绘制）

- 类图：StudentManagerClassDiagram
- 用例图：学生信息管理系统用例图
- 链接（仅团队可见）：https://www.processon.com/

------

## 🔗 GitHub 仓库地址

> 📍 项目主页：https://github.com/example/studentmanager

------

## 👨‍💻 团队成员及分工

| 成员   | 职责                                     |
| ------ | ---------------------------------------- |
| 龚科硕 | 项目结构设计、MVC编码、数据库结构建模    |
| 吴彦富 | Excel导入模块开发、Apache POI 调试       |
| 欧梓航 | UML类图、用例图绘制，文档结构整合        |
| 宋延贇 | GitHub仓库维护、项目部署测试、用例图绘制 |

------

## 📝 实验拓展建议

- 🔐 加入用户身份验证与权限控制；
- 📊 实现分页查询与搜索功能；
- 💾 实现学生数据的导出（CSV/Excel）；
- 🧩 使用前后端分离架构（如 Vue + Spring Boot）；
- ☁️ 部署至云服务器实现公网访问。

------

## 📜 License

本项目为教学实验用途，仅供学习参考，不得用于商业用途。
