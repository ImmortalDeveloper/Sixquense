<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<form class="form-horizontal">
<fieldset>

<!-- Form Name -->
<legend>PRODUCTS</legend>

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
  <label class="col-md-4 control-label" for="product_categorie">��� ����</label>
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

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="available_quantity">AVAILABLE QUANTITY</label>  
  <div class="col-md-4">
  <input id="available_quantity" name="available_quantity" placeholder="AVAILABLE QUANTITY" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_weight">PRODUCT WEIGHT</label>  
  <div class="col-md-4">
  <input id="product_weight" name="product_weight" placeholder="PRODUCT WEIGHT" class="form-control input-md" required="" type="text">
    
  </div>
</div>



<!-- Textarea -->
<div class="form-group">
  <label class="col-md-4 control-label" for="product_name_fr">�ڽ��Ұ�</label>
  <div class="col-md-4">                     
    <textarea class="form-control" id="product_name_fr" name="product_name_fr"></textarea>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="percentage_discount">PERCENTAGE DISCOUNT</label>  
  <div class="col-md-4">
  <input id="percentage_discount" name="percentage_discount" placeholder="PERCENTAGE DISCOUNT" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="stock_alert">STOCK ALERT</label>  
  <div class="col-md-4">
  <input id="stock_alert" name="stock_alert" placeholder="STOCK ALERT" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Search input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="stock_critical">STOCK CRITICAL</label>
  <div class="col-md-4">
    <input id="stock_critical" name="stock_critical" placeholder="STOCK CRITICAL" class="form-control input-md" required="" type="search">
    
  </div>
</div>

<!-- Search input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="tutorial">TUTORIAL</label>
  <div class="col-md-4">
    <input id="tutorial" name="tutorial" placeholder="TUTORIAL" class="form-control input-md" required="" type="search">
    
  </div>
</div>

<!-- Search input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="tutorial_fr">TUTORIAL FR</label>
  <div class="col-md-4">
    <input id="tutorial_fr" name="tutorial_fr" placeholder="TUTORIAL FR" class="form-control input-md" required="" type="search">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="online_date">ONLINE DATE</label>  
  <div class="col-md-4">
  <input id="online_date" name="online_date" placeholder="ONLINE DATE" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="author">AUTHOR</label>  
  <div class="col-md-4">
  <input id="author" name="author" placeholder="AUTHOR" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="enable_display">ENABLE DISPLAY</label>  
  <div class="col-md-4">
  <input id="enable_display" name="enable_display" placeholder="ENABLE DISPLAY" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="comment">COMMENT</label>  
  <div class="col-md-4">
  <input id="comment" name="comment" placeholder="COMMENT" class="form-control input-md" required="" type="text">
    
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" for="approuved_by">APPROUVED BY</label>  
  <div class="col-md-4">
  <input id="approuved_by" name="approuved_by" placeholder="APPROUVED BY" class="form-control input-md" required="" type="text">
    
 <!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="filebutton">main_image</label>
  <div class="col-md-4">
    <input id="filebutton" name="filebutton" class="input-file" type="file">
  </div>
</div>
<!-- File Button --> 
<div class="form-group">
  <label class="col-md-4 control-label" for="filebutton">auxiliary_images</label>
  <div class="col-md-4">
    <input id="filebutton" name="filebutton" class="input-file" type="file">
  </div>
</div>

<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton">Single Button</label>
  <div class="col-md-4">
    <button id="singlebutton" name="singlebutton" class="btn btn-primary">Button</button>
  </div>
  </div>

</fieldset>
</form>
    