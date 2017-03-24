<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- jsp文件头和头部 -->a
<%@ include file="../admin/top.jsp"%>
</head>
<body>

	<div class="container-fluid" id="main-container">

		<div id="page-content" class="clearfix">

			<div class="row-fluid">

				<div class="row-fluid">

					<form action="/videomeeting/${dataDomain}/list" method="post" name="userForm"	id="userForm">
						<table>
							<tr>
					<#list  queryCondition as  columns  >
					<td width="100" align="right">${columns.comment}：</td>
					<td width="60" align="right" ><input  type="text" name="${columns.columnName}" id="${columns.columnName}"   title="${columns.comment}"/></td>					
					</#list>
					<td width="100" align="right"><button class="btn btn-small btn-success" type="submit" onclick="search()"><i class="icon-ok"></i> 查询</button>
					 </td>
							</tr>
						</table>
						<!-- 检索  -->

						<table id="table_report"
							class="table table-striped table-bordered table-hover">

							<thead>
								<tr>
									<th class="center"><label><input type="checkbox"
											id="zcheckbox" /><span class="lbl"></span></label></th>
									<th>序号</th>
									<#list  listColumn as  columns  >
									<th>${columns.comment}</th>
									</#list>
									<th class="center">操作</th>
								</tr>
							</thead>

							<tbody>

								<!-- 开始循环 -->
								<c:choose>
									<c:when test="${r"$"}{not empty dataList}">

										<c:forEach items="${r"$"}{dataList}" var="user" varStatus="vs">

											<tr>
												<td class='center' style="width: 20px;">
														<label><input type='checkbox' name='ids'
															value="${r"$"}{user.accountid }" /><span class="lbl"></span></label>
													 </td>
												<td class='center' style="width: 30px;">${r"$"}{vs.index+1}</td>
												<#list  listColumn as  columns  >
												<td>${r"$"}{user.${columns.columnName} }</td>
												</#list>
										
												<td style="width: 100px;">
													<div class='hidden-phone visible-desktop btn-group'>
														
														<a class='btn btn-mini btn-info' title="编辑"
															onclick="editdata('${r"$"}{user.${primaryKey} }');"><i
															class='icon-edit'></i></a> 
															<a class='btn btn-mini btn-danger' title="删除" onclick="delUser('${r"$"}{user.${primaryKey}}');"><i class='icon-trash'></i></a>
															
													</div>
												</td>
											</tr>

										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr class="main_info">
											<td colspan="10" class="center">没有相关数据</td>
										</tr>
									</c:otherwise>
								</c:choose>


							</tbody>
						</table>

						<div class="page-header position-relative">
							<table style="width: 100%;">
								<tr>
								<td style="vertical-align:top;">
				<a class="btn btn-small btn-success" onclick="add();">新增</a>
									<td style="vertical-align: top;"><div class="pagination"
											style="float: right; padding-top: 0px; margin-top: 0px;">${"r$"}{page.pageStr}</div></td>
								</tr>
							</table>
						</div>

					</form>
				</div>

				<!-- PAGE CONTENT ENDS HERE -->
			</div>
			<!--/row-->

		</div>
		<!--/#page-content-->
	</div>
	<!--/.fluid-container#main-container-->

	<!-- 返回顶部  -->
	<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
		class="icon-double-angle-up icon-only"></i>
	</a>

	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>

	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script>
	<!-- 下拉框 -->
	<script type="text/javascript"
		src="static/js/bootstrap-datepicker.min.js"></script>
	<!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootbox.min.js"></script>
	<!-- 确认窗口 -->
	<!-- 引入 -->


	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!--提示框-->


	<script type="text/javascript">
		
		$(top.hangge());
		
		//检索
		function search(){
			top.jzts();
			$("#userForm").submit();
		}
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="增加用户";
			 diag.URL = '<%=basePath%>/userManager/goAddData.do';
			 diag.Width = 400;
			 diag.Height = 440;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 top.jzts();
					 setTimeout("self.location.reload()",100);
				}
				diag.close();
			 };
			 diag.show();
		}
		//修改
		function editdata(userId){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="修改用户";
			 diag.URL = '<%=basePath%>/userManager/goEditData.do?id='+userId;
			 diag.Width = 400;
			 diag.Height = 440;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 top.jzts();
					 setTimeout("self.location.reload()",100);
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function delUser(userId,msg,datasource,loginname){
			if(datasource!='1'){
				bootbox.alert("系统分配的用户不能删除！！");
				return;
			}
			bootbox.confirm("确定要删除["+msg+"]吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>userManager/deleteUser.do?userId="+userId+"&loginname="+loginname;
					$.get(url,function(data){
						top.jzts();
						setTimeout("self.location.reload()",100);
					});
				}
			});
		}

	 }
		</script>

</body>
</html>

