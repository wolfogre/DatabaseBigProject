<%@ page import="com.wolfogre.domain.Teacher" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.wolfogre.Information" %>
<%@ page import="com.wolfogre.domain.Student" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wolfogre.domain.Course" %><%--
  Created by IntelliJ IDEA.
  User: Jason Song(wolfogre.com)
  Date: 2016/4/13
  Time: 22:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- BootStrap CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/BootStrap/css/bootstrap.min.css"/>
	<!--DataTables CSS -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/DataTables/css/jquery.dataTables.css"/>
	<!-- jQuery -->
	<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/DataTables/js/jquery.js"></script>
	<!-- DataTables -->
	<script type="text/javascript" charset="utf8" src="${pageContext.request.contextPath}/DataTables/js/jquery.dataTables.js"></script>

	<title>教师页面</title>
</head>
<script type="text/javascript" class="init">
	$(document).ready(function() {
		$('#dataTable').DataTable({
			language: {
				"sProcessing": "处理中...",
				"sLengthMenu": "显示 _MENU_ 项结果",
				"sZeroRecords": "没有匹配结果",
				"sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
				"sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
				"sInfoFiltered": "(由 _MAX_ 项结果过滤)",
				"sInfoPostFix": "",
				"sSearch": "搜索:",
				"sUrl": "",
				"sEmptyTable": "表中数据为空",
				"sLoadingRecords": "载入中...",
				"sInfoThousands": ",",
				"oPaginate": {
					"sFirst": "首页",
					"sPrevious": "上页",
					"sNext": "下页",
					"sLast": "末页"
				},
				"oAria": {
					"sSortAscending": ": 以升序排列此列",
					"sSortDescending": ": 以降序排列此列"
				}
			}
		});
	});
</script>
<body>
<%
	Teacher master = (Teacher)session.getAttribute("master");
	if(master == null){
		response.sendRedirect("/index.action");
		return;
	}
%>
<div class="page-header" >
	<div>
		<h2>&nbsp;&nbsp;&nbsp;&nbsp;教师:<%=master.getT_name()%>
			<small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;工号:<%=master.getT_id()%></small>
			<small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=Information.getCopyRight()%></small>
		</h2>
	</div>
</div>
<ul class="nav nav-tabs">
	<li role="presentation"><a href="index.action">基本信息</a></li>
	<li role="presentation"><a href="timetable.action">课表查询</a></li>
	<li role="presentation" class="active"><a href="list.action">学生名单查询</a></li>
	<li role="presentation"><a href="score.action">成绩登记</a></li>
	<li role="presentation"><a href="${pageContext.request.contextPath}/login.action">退出登录</a></li>
</ul>
<%
	List<Student> studentList = (List<Student>)request.getAttribute("studentList");
	Course course = (Course)request.getAttribute("course");
	if(studentList == null){
%>
<div class="jumbotron" style="height: 100%">
	<div class="panel panel-info center-block" style="width: 50%">
		<div class="panel-body text-center">
			<h2>请在<a href="timetable.action">课表查询</a>中选择您要查询的课程</h2>
		</div>
	</div>
</div>
<%
		return;
	}
%>
<div class="text-center">
	<h2>课程号：<%=course.getC_id()%>&nbsp;&nbsp;&nbsp;&nbsp;课程名：<%=course.getC_name()%></h2>

</div>
<table id="dataTable" class="display" cellspacing="0" width="100%">
	<thead>
	<tr>
		<th>学号</th>
		<th>姓名</th>
	</tr>
	</thead>
	<tbody>
	<%
		for(Student student : studentList)
		{
	%>
	<tr>
		<td><%=student.getS_id()%></td>
		<td><%=student.getS_name()%></td>
	</tr>
	<%
		}
	%>
	</tbody>
</table>
</body>
</html>