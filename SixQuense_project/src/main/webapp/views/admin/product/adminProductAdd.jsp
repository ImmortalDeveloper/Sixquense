<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>��ǰ ���</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
<!------ Include the above in your HEAD tag ---------->

<form class="form-horizontal" action="<%=request.getContextPath() %>/admin/productinsertend.do" method="post" enctype="multipart/form-data">
<fieldset>

<!-- Form Name -->
<legend><b style="padding-left:540px;">��ǰ ���</b></legend>

<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="nation">������</label>
  <div class="col-md-4">
    <select id="nation" name="nation" class="form-control">
	    <option value="�ٳ�">�ٳ�</option>
		<option value="���ۡ���Ÿ��">���ۡ���Ÿ��</option>
		<option value="�븸">�븸</option>
		<option value="����ī��">����ī��</option>
		<option value="��Ȧ">��Ȧ</option>
		<option value="����">����</option>
		<option value="��ŸŰ���߷�">��ŸŰ���߷�</option>
		<option value="Ǫ��">Ǫ��</option>
		<option value="�̰�����">Ǫ��</option>
		<option value="ȣġ�Ρ���Ʈ�����޶�">ȣġ�Ρ���Ʈ�����޶�</option>
		<option value="����">����</option>
		<option value="������">������</option>
		<option value="����ī������">����ī������</option>
		 <option value="��Ű����">��Ű����</option>
		<option value="�����ī">�����ī</option>
		<option value="������">������</option>
		<option value="�����Ρ�������Į">�����Ρ�������Į</option>
		<option value="����">����</option>
		<option value="��Ż����">��Ż����</option>
		<option value="������">������</option>
		<option value="�̵���">�̵���</option>
		<option value="�̼���">�̼���</option>
		<option value="ĳ����">ĳ����</option>
		<option value="�Ͽ���">�Ͽ���</option>
		<option value="ȣ��">ȣ��</option>
    </select>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="productName">��ǰ��</label>  
  <div class="col-md-4">
  <input id="productName" name="productName" placeholder="��ǰ���� �Է��ϼ���" class="form-control input-md" required="" type="text">
    
  </div>
</div>



<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="price">����</label>  
  <div class="col-md-4">
  <input id="price" name="price" placeholder="������ �Է����ּ��� ex) 10000" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="discountRate">������</label>  
  <div class="col-md-4">
  <input id="discountRate" name="discountRate" placeholder="�������� �Է����ּ��� ex) 0.2" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="minCount">�ּ� �ο�</label>  
  <div class="col-md-4">
  <input id="minCount" name="minCount" placeholder="�ּ��ο��� �Է����ּ��� ex) 3" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="maxCount">�ִ� �ο�</label>  
  <div class="col-md-4">
  <input id="maxCount" name="maxCount" placeholder="�ִ��ο��� �Է����ּ��� ex) 10" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="productDuration">�ҿ� �ð�</label>  
  <div class="col-md-4">
  <input id="productDurationt" name="productDuration" placeholder="�ҿ�ð��� �Է����ּ��� ex) 5" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="productDetail">��ǰ ����</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="productDetail" name="productDetail" placeholder="��ǰ ������ �Է����ּ���"></textarea>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="editorNote">Editor's Note</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="editorNote" name="editorNote" placeholder="������ ��Ʈ�� �Է����ּ���"></textarea>
  </div>
</div>

<!-- Text input ���̵� ��Ʈ-->
<div class="form-group">
  <label class="col-md-4 control-label" for="guideName">���̵� �̸�</label>  
  <div class="col-md-4">
  <input id="guideName" name="guideName" placeholder="���̵� �̸��� �Է����ּ���" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="guidePhone">���̵� ����ó</label>  
  <div class="col-md-4">
  <input id="guidePhone" name="guidePhone" placeholder="���̵� ����ó�� �Է����ּ��� ex) 010-0000-0000" class="form-control input-md" required="" type="text">
    
  </div>
</div>



<!-- Select Basic -->
<div class="form-group">
  <label class="col-md-4 control-label" for="productDay">��� ����</label>
  <div class="col-md-4">
		<label>��<input type="checkbox" name="productDay" value="��"></label>
		<label>ȭ<input type="checkbox" name="productDay" value="ȭ"></label>
		<label>��<input type="checkbox" name="productDay" value="��"></label>
		<label>��<input type="checkbox" name="productDay" value="��"></label>
		<label>��<input type="checkbox" name="productDay" value="��"></label>
		<label>��<input type="checkbox" name="productDay" value="��"></label>
		<label>��<input type="checkbox" name="productDay" value="��"></label>
  </div>
</div>

<br><b style="padding-left:540px;">�ڽ� ���</b><br><br>
<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="courseName1">�ڽ��� 1</label>  
  <div class="col-md-4">
  <input id="courseName1" name="courseName1" placeholder="�ڽ����� �����ּ���" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="courseDetail1">�ڽ��Ұ� 1</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="courseDetail1" name="courseDetail1" placeholder="�ڽ��Ұ��� �����ּ���"></textarea>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="courseName2">�ڽ��� 2</label>  
  <div class="col-md-4">
  <input id="courseName2" name="courseName2" placeholder="�ڽ����� �����ּ���" class="form-control input-md" required="" type="text">
    
  </div>
</div>



<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="courseDetail2">�ڽ��Ұ� 2</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="courseDetail2" name="courseDetail2" placeholder="�ڽ��Ұ��� �����ּ���"></textarea>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="courseName3">�ڽ��� 3</label>  
  <div class="col-md-4">
  <input id="courseName3" name="courseName3" placeholder="�ڽ����� �����ּ���" class="form-control input-md" required="" type="text">
    
  </div>
</div>



<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="courseDetail3">�ڽ��Ұ� 3</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="courseDetail3" name="courseDetail3" placeholder="�ڽ��Ұ��� �����ּ���"></textarea>
  </div>
</div>


<div class="form-group">
  <label class="col-md-4 control-label" for="courseName4">�ڽ��� 4</label>  
  <div class="col-md-4">
  <input id="courseName4" name="courseName4" placeholder="�ڽ����� �����ּ���" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="courseDetail4">�ڽ��Ұ� 4</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="courseDetail4" name="courseDetail4" placeholder="�ڽ��Ұ��� �����ּ���"></textarea>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label" for="courseName5">�ڽ��� 5</label>  
  <div class="col-md-4">
  <input id="courseName5" name="courseName5" placeholder="�ڽ����� �����ּ���" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="courseDetail5">�ڽ��Ұ� 5</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="courseDetail5" name="courseDetail5" placeholder="�ڽ��Ұ��� �����ּ���"></textarea>
  </div>
</div>



<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="filebutton">�̹��� ÷��</label>
  <div class="col-md-4">
    <input id="filebutton" name="filebutton" class="input-file" type="file" multiple="multiple" accept=".jpg, .jpeg, .png">
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"></label>
  <div class="col-md-4">
    <input type="submit" id="submitbutton" name="submitbutton" class="btn btn-primary" value="���">
  </div>
  </div>

</fieldset>
</form>
<script>
$("#submitbutton").click(e=>{
	//js FormdataŬ������ ������ -> ���±׶� ���
	const form = new FormData();
	//FormDataŬ������ append(key,value)�� ������ �����͸� ����
	const fileInput = $("#upfile");
	console.log(fileInput[0].files[0]); /* ������ �����ϴ� �Ӽ� files, �������� ����Ǳ� ������ �ε��� �ο� */
	$.each(fileInput[0].files,(i,f)=>{ /* �迭�� ���� �ݺ��� �� �� �ְ� ����� */
		form.append("upfile"+i,f);
	})
	form.append("userId","bsyoo");
	
		$.ajax({
		url: "<%=request.getContextPath()%>/ajax/uploadFile.do",
		data:form,
		type:"post",
		processData:false, /* form���Ŀ��� ���̳ʸ�����(��������)���� �ٲٱ� ���ؼ� false */
		contentType:false,
		success:data=>{
			alert("����");
		},
		error:(r,e)=>{
			alert("����");
		},
		complete:()=>{
			fileInput.val('');
		}
	}) 
})




</script>
</body>
</html>