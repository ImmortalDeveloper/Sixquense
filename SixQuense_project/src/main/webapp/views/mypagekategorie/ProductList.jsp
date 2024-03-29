<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<%@ page import="com.web.product.dto.ProductorderinfoDto,java.util.List" %>
<%@ page import="com.web.product.dto.ProductpaymentDto,java.util.List" %>
<%@ page import="com.web.product.dto.ProductDto,java.util.List" %>

<%
	List<ProductorderinfoDto> info = (List<ProductorderinfoDto>) request.getAttribute("info");
	System.out.println(info);

%>  
    <!-- Breadcrumb Section End -->

    <!-- Checkout Section Begin -->
    <section class="checkout spad" style="padding-top: 0px";>
    <div class="container">
        <div class="checkout__form" style="margin-top: 200px;">
            <img src="<%= request.getContextPath() %>/img/icon/결제상품.png" style="
                        width: 165px;
                        padding-left: 0px;
                        margin-left: 294px;
                        margin-bottom: 25px;">

            <form action="#">
                <div class="row">
                    <div class="col-lg-8 col-md-6">
                        <div class="checkout__input">
                            <p style="font-size: xx-large;">결제상품 조회</p>
                            <% if (!info.isEmpty()) {
                                for (ProductorderinfoDto i : info) { %>
                            <hr />
                            <div >
                            <div class="box1" style="width:100%; height: 260px; display: flex; align-items: center;"
                                value="<%= i.getProductNo() %>">
                                <div style="width:200px; padding-left: 20px;">
                                    <div><%= i.getProductName() %></div>
                                    <div><%= i.getPaymentId() %></div>
                                </div>
							     <form action="<%=request.getContextPath() %>/productpackage/refund.do" method="post">
							        <label for="imp_uid">결제번호:</label><br>
							        <input type="hidden" value = "<%= i.getTotalAmount() %>" name ="total">
							        <input value="<%= i.getPaymentId() %>"id="imp_uid" name="imp_uid"><br>
							        <button type="submit">환불 요청</button>
							        
							    </form> 
                                </div>
                            </div>
                            <% }
                                
                                } %>
                        </div>
                       
                        <div></div>
                       
                    </div>
                        <div class="col-lg-4 col-md-6" style="padding-left: 170px; padding-right: 80px;">
                            <div class="checkout__order" style="padding-left: 20px; width: 360px;">
                                <div class="col-lg-3">
                                    <div class="hero__categories">
                                        <div class="hero__categories__all" style="width: 292px;">
                                            <i class="fa fa-bars"></i>
                                            <span>메뉴</span>
                                        </div> 
                                        <div id="Listlist"> 
                                        <ul style="width: 292px; height: 870px;">
                                            <li style="margin-bottom: 15px;">

                                               <a href="<%=request.getContextPath()%>/views/common/Mypage.jsp">
                                                  <img src="<%=request.getContextPath() %>/img/icon/사용자아이디.png" style="width: 40px; margin-right: 10px;">사용자아이디
                                               </a>
                                            </li>                                     
                                            <li style="margin-bottom: 15px;">
                                            	<a href="#"><img src="<%=request.getContextPath() %>/img/icon/수정.png" style="width: 40px; margin-right: 10px;">
                                            		<button id="updateBtn">개인정보 수정</button>
                                            	</a>
                                            </li>
                                            <li style="margin-bottom: 15px;">
                                         	<a onclick="location.assign('<%=request.getContextPath()%>/ProductList.do?userNo=<%=loginMember.getUserNo()%>')">                                           	
                                            	<img src="<%=request.getContextPath() %>/img/icon/결제상품.png" style="width: 50px; margin-right: 10px;">
	                                            	<button id="checkcancelBtn">결제상품 조회</button>
	                                            </a>
                                            </li>
                                            <li style="margin-bottom: 15px;">
													<a onclick="location.assign('<%=request.getContextPath()%>/Wish.do?userNo=<%=loginMember.getUserNo()%>')">	                                            
	                                            <img src="<%=request.getContextPath() %>/img/icon/위시리스트.png" style="width: 50px; margin-right: 10px;">
	                                            	<button id="wishBtn">위시리스트</button>
	                                            </a>
                                            </li>
                                            <li style="margin-bottom: 15px;">
	                                            <a onclick="location.assign('<%=request.getContextPath()%>/mypage/mywrite.do?userNo=<%=loginMember.getUserNo()%>')">
		                                            <img src="<%=request.getContextPath() %>/img/icon/나의글.png" style="width: 40px; margin-right: 10px;">
		                                            <button id="mywirteBtn">나의 글</button>
	                                            </a>
                                            </li>
                                            <li style="margin-bottom: 15px;">
	                                            <a href="#"><img src="<%=request.getContextPath() %>/img/icon/문의사항.png" style="width: 50px; margin-right: 10px;">
	                                            	<button id="questionBtn">문의사항</button>
	                                            </a>
                                            </li>
                                        </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                       </div>
                     </div>   	
                	</form>
                	</div>
            	</div>
        	</div>
</section>
<script>
	$("#updateBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/updateview.do",
			dataType:"html",
			success:function(data){
					console.log(data);
					$("#htmlcontainer").html(data);
				}
			});
		});		
		
	</script>
<script>
	$("#wishBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/Wish.do",
			dataType:"html",
			success:function(data){
					console.log(data);
					$("#htmlcontainer").html(data);
				}
			});
		});		
		
	</script>
	<script>
	$("#checkcancelBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/ProductList.do",
			dataType:"html",
			success:function(data){
					console.log(data);
					$("#htmlcontainer").html(data);
				}
		});
	});		
	</script>
	 <script>
	$("#mywirteBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/mywrite.do",
			dataType:"html",
			success:function(data){
					console.log(data);
					$("#htmlcontainer").html(data);
				}
		});
	});		
	</script>
	<script>
	$("#questionBtn").click(e=>{
		$.ajax({
			url:"<%=request.getContextPath()%>/question.do",
			dataType:"html",
			success:function(data){
					console.log(data);
					$("#htmlcontainer").html(data);
				}
		});
	});		
	</script>
<%@ include file="/views/common/footer.jsp"%>