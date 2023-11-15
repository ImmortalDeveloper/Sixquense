<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<ProductDto> recentProducts = (List<ProductDto>)request.getAttribute("recentProducts");
	ProductDto rp = recentProducts.get(0);
%>
<%@ page import="com.web.product.dto.ProductDto, java.util.List" %>
<%@ include file="/views/common/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style_je.css" type="text/css">
<style>
.btn-group-lg>.btn, .btn-lg {
	font-size: 14px; ! important;
	margin: 20px 0px; ! important;
	padding: 10px 16px; ! important;
	width: 1106px; !important;
}

p {
	text-align: left;
	!
	important;
}

.country_package:after {
	position: absolute;
	left: 0;
	bottom: 140px;
	right: 60px;
	height: 4px;
	width: 300px;
	background: #7fad39;
	content: "";
	margin: 0 auto;
}

.blog__sidebar__item__tags a.selected {
	background: #7fad39;
	color: #ffffff;
}

</style>
<body>
	<!-- Blog Section Begin -->
	<section class="blog spad" style="padding-top: 250px";>
		<div class="container">
			<div class="blog__item-container">
				<div class="col-lg-4 col-md-5">
					<div class="country_package">나라이름 패키지</div>
					<div class="blog__sidebar">
						<div class="blog__sidebar__item">
							<h4>어떤 여행을 찾고 있나요</h4>
							<div class="blog__sidebar__item__tags">
								<a href="#" class="tag" onclick="scrollToSection('best')">BEST</a> 
								<a href="#" class="tag" onclick="scrollToSection('latest')">최신순</a> 
								<a href="#" class="tag" onclick="scrollToSection('special')">특가</a>
							</div>
						</div>
					</div>
				</div>
				<!-- 여기서 부터  -->
				<div class="col-lg-8 col-md-7">
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item" id="best">
							<div class="blog__item__pic">
								<img src="img/blog/blog-2.jpg" alt="">
							</div>
							<div class="blog__item__text">
								<h5>
									<a href="<%=request.getContextPath()%>/product/productview.do">패키지/투어 이름1</a>
								</h5>
								<p>패키지 내용1</p>
								<a href="<%=request.getContextPath()%>/product/productview.do" class="blog__btn"> 199,000원 <span
									class="arrow_right"></span></a>
								<div class="edit_note">
									<img src="<%=request.getContextPath() %>/img/logo/ttlogo.png" alt="로고이미지입니다" width="120px"><br>
									<div class="edit_text">
										<span>Editor's note</span><br>
										<p>추천 이유1</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 여기까지 -->
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item" id="latest">
							<div class="blog__item__pic">
								<img src="<%=request.getContextPath() %>/img/product/japan/fukuoka/<%=rp.getAttachment().get(0).getOrginalFilename() %>" alt="고양이">
							</div>
							<div class="blog__item__text">
								<h5>
									<a href="<%=request.getContextPath()%>/product/productlist.do"><%=rp.getProductName() %></a>
								</h5>
								<p><%=rp.getProductDetail() %></p>
								<a href="<%=request.getContextPath()%>/product/productlist.do" class="blog__btn"><%=rp.getProductPrice() %> <span class="arrow_right"></span></a>
								<div class="edit_note">
									<img src="<%=request.getContextPath() %>/img/logo/ttlogo.png" alt="로고이미지입니다" width="120px"><br>
									<div class="edit_text">
										<span>Editor's note</span><br>
										<p><%=rp.getEditorNote() %></p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="blog__item" id="special">
							<div class="blog__item__pic">
								<img src="img/blog/blog-2.jpg" alt="">
							</div>
							<div class="blog__item__text">
								<h5>
									<a href="<%=request.getContextPath()%>/product/productlist.do">패키지/투어 이름3</a>
								</h5>
								<p>패키지 내용3</p>
								<a href="<%=request.getContextPath()%>/product/productlist.do" class="blog__btn"> 가격 <span class="arrow_right"></span></a>
								<div class="edit_note">
									<img src="<%=request.getContextPath() %>/img/logo/ttlogo.png" alt="로고이미지입니다" width="120px"><br>
									<div class="edit_text">
										<span>Editor's note</span><br>
										<p>추천 이유3</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="button-container">
						<button type="button" class="btn btn-secondary btn-lg btn-block" width="1160px">다른
							지역 둘러보기</button>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
<script>
/* 메뉴 버튼 클릭시 색 변하게 하는 이벤트*/
  // 각 태그에 대한 클릭 이벤트를 처리
 document.querySelectorAll('.blog__sidebar__item__tags a').forEach(function(tag) {
    tag.addEventListener('click', function(event) {
      event.preventDefault(); // 기본 동작 방지 (예: 링크 이동)
      
      // 선택된 태그에 'selected' 클래스 추가, 다른 태그에서는 제거
      document.querySelectorAll('.blog__sidebar__item__tags a').forEach(function(otherTag) {
        otherTag.classList.remove('selected');
      });
      tag.classList.add('selected');
    });
  });
  
  
  
 function scrollToSection(sectionId) {
	    var element = document.getElementById(sectionId);
	    // 해당 섹션의 위치를 가져와서 스크롤
	    if (element) {
	        var rect = element.getBoundingClientRect();
	        console.log(rect);
	        var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
	        console.log(scrollTop);
	        var targetY = rect.top + scrollTop -250;

	        window.scrollTo({
	            top: targetY,
	            behavior: 'smooth'
	        });
	    }
	}
</script>
<%@ include file="/views/common/footer.jsp"%>