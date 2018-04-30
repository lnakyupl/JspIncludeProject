<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.row {
	margin: 0px auto;
	width: 600px;
}

h2, h3 {
	text-align: center;
}
</style>
<link rel="stylesheet" type="text/css"
	href="../member/shadow/css/shadowbox.css">
<script type="text/javascript" src="../member/shadow/js/shadowbox.js"></script>
<script type="text/javascript">
Shadowbox.init({players:["iframe"]});
function idcheck()
{
	Shadowbox.open({
		content:'../member/idcheck.jsp',
		title:'���̵��ߺ�üũ',
		player:'iframe',
		width:300,
		height:200
	});
}
function postfind()
{
	Shadowbox.open({
		content:'../member/postfind.jsp',
		title:'�����ȣ�˻�',
		player:'iframe',
		width:450,
		height:350
	});
}
</script>
</head>
<body>
	<div id="content-wrapper">
		<div id="content">
			<div class="container">
				<div class="row">
					<div class="12u">

						<!-- Main Content -->
						<section>
							<header>
								<h2>ȸ������</h2>
								<h3>
									<font color=red>*</font>�� �ʼ� �Է»���
								</h3>
							</header>
							<!-- �Է��� -->
							<form name="frm">
								<table class="table">
									<tr>
										<th width=20% class="text-right success">ID</th>
										<td width=80% class="text-left"><input type=text name=id
											size=12 readonly> <input type=button
											class="btn btn-sm btn-danger" value="�ߺ�üũ"
											onclick="idcheck()"></td>
									</tr>

									<tr>
										<th width=20% class="text-right success">��й�ȣ</th>
										<td width=80% class="text-left"><input type="password"
											name=pwd size=12> <input type="password" name=pwd1
											size=12 placeholder="���Է�"></td>
									</tr>

									<tr>
										<th width=20% class="text-right success">�̸�</th>
										<td width=80% class="text-left"><input type="text"
											name=name size=12></td>
									</tr>

									<tr>
										<th width=20% class="text-right success">����</th>
										<td width=80% class="text-left"><input type=radio
											name=sex value="����">���� <input type=radio name=sex
											value="����">����</td>
									</tr>

									<tr>
										<th width=20% class="text-right success">�������</th>
										<td width=80% class="text-left"><input type=date
											name=birthday size=30></td>
									</tr>
									<!-- �̸��� ������ : javaMail -->
									<tr>
										<th width=20% class="text-right success">�̸���</th>
										<td width=80% class="text-left"><input type=text
											name=email size=40></td>
									</tr>

									<tr>
										<th width=20% class="text-right success">�����ȣ</th>
										<td width=80% class="text-left"><input type=text
											name=post1 size=5 readonly> - <input type=text
											name=post2 size=5 readonly> <input type=button
											value="�����ȣ�˻�" class="btn btn-sm btn-danger" onclick="postfind()"></td>
									</tr>

									<tr>
										<th width=20% class="text-right success">�ּ�</th>
										<td width=80% class="text-left"><input type=text
											name=addr1 size=40 readonly></td>
									</tr>

									<tr>
										<th width=20% class="text-right success">���ּ�</th>
										<td width=80% class="text-left"><input type=text
											name=addr2 size=40></td>
									</tr>

									<tr>
										<th width=20% class="text-right success">��ȭ��ȣ</th>
										<td width=80% class="text-left"><select name=tel1>
												<option>02</option>
												<option>031</option>
												<option>032</option>
												<option>053</option>
												<option>041</option>
										</select> <input type=text name=tel2 size=7> - <input type=text
											name=tel3 size=10></td>
									</tr>

									<tr>
										<td colspan="2" class="text-center"><input type=submit
											class="btn btn-sm btn-info" value="����"> <input
											type=button class="btn btn-sm btn-warning" value="���">
										</td>
									</tr>
								</table>
							</form>
						</section>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>