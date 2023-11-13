<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
    var IMP = window.IMP; 
    IMP.init("imp88100268"); 
  
    const today = new Date();   
    const hours = today.getHours(); // 시
    const minutes = today.getMinutes();  // 분
    const seconds = today.getSeconds();  // 초
    const milliseconds = today.getMilliseconds();
    const makeMerchantUid = hours +  minutes + seconds + milliseconds;
    

    function paymentButton() {
        var infocheckbox = document.getElementById("infocheckbox");
        if (!infocheckbox.checked) {
            return;
        }

        IMP.request_pay({
            pg : 'kakaopay',
            merchant_uid: "IMP"+makeMerchantUid, 
            name : '으악으악',
            amount : 1004,
            buyer_email : 'sixquence',
            buyer_name : '장세영',
            buyer_tel : '010-1234-5678',
            buyer_addr : 'gdacadamey',
            buyer_postcode : '123-456'
        }, function (rsp) { // callback
            if (rsp.success) {
                console.log(rsp);
            } else {
                console.log(rsp);
            }
        });
    }
</script>
<section class="body">
    <div style="display: flex;margin-top:170px;">
    <section class="set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Shopping Cart</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.html">Home</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="col-lg-6">
        <div class="container">
            <style>
              .shoping__cart__item {
                display: flex;
                align-items: center;
              }
          
              .shoping__cart__item img {
                max-width: 50px;
                margin-right: 10px;
              }
          
              .shoping__cart__item h2,
              .shoping__cart__item h5 {
                margin: 0;
              }
          
              .quantity {
                width: 50px;
              }
          
              .pro-qty input {
                width: 100%;
                text-align: center;
              }
          
              .shoping__cart__item__close {
                cursor: pointer;
                color: #ff0000;
              }
            </style>
            <h3>예약하기</h3><br>
              <div class="row">
              <div class="col-lg-12">
                <div class="shoping__cart__table">
                  <table>
                    <thead>
                      <tr>
                        <th class="shoping__product">상품정보</th>
                        <th>가격</th>
                        <th>수량</th>
                        <th>총합</th>
                        
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <div class="shoping__cart__item">
                          <img src="<%=request.getContextPath() %>/img/japen/삿포르.png">
                            <h3>패키지 제목</h3>
                          </div>
                        </td>
                        <td class="shoping__cart__price">
                          100만원
                        </td>
                        <td class="shoping__cart__total">
                          수량
                        </td>
                        <td class="shoping__cart__item__close">
                          총합
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
            
            <div class="row">
                <div class="col-lg-12">  
                </div>
                <div class="form-container">
                <form>
                    <h2>예약자 정보 입력</h2>
                    <label for="name">한글 이름:</label>
                    <input type="text" id="name" name="name" required>
                  
                    <div class="flex-container">
                      <div>
                        <label for="englishFirstName">영문 이름:</label>
                        <input type="text" id="englishFirstName" name="englishFirstName" required>
                      </div>
                      <div>
                        <label for="englishLastName">영문 성:</label>
                        <input type="text" id="englishLastName" name="englishLastName" required>
                      </div>
                    </div>
                  
                    <div class="flex-container">
                      <div>
                        <label for="birthDate">생년월일:</label>
                        <input type="date" id="birthDate" name="birthDate" required>
                      </div>
                    </div>
                    <label for="gender">성별:</label>
                    <select id="gender" name="gender" required>
                      <option value="" disabled selected>성별 선택</option>
                      <option value="male">남성</option>
                      <option value="female">여성</option>
                    </select>
                    <button type="submit">정보 제출</button>
                  </form>
                  
                  <style>
                    form {
                        max-width: 600px;
                        margin: 20px 0 20px 500px;
                        padding: 0 20px;
                        box-sizing: border-box;
                        background-color: #f5f5f5;
                    }
                
                    label {
                        display: block;
                        margin-bottom: 8px;
                    }
                
                    input,
                    select {
                        width: 100%;
                        padding: 8px;
                        margin-bottom: 16px;
                        box-sizing: border-box;
                    }
                
                    .flex-container {
                        display: flex;
                        justify-content: space-between;
                        margin-bottom: 16px;
                    }
                
                    button {
                        background-color: #4caf50;
                        color: white;
                        padding: 10px 15px;
                        border: none;
                        border-radius: 4px;
                        cursor: pointer;
                    }
                
                    button:hover {
                        background-color: #45a049;
                    }
                    .form-container{
                        display: flex;
                        width:100%;
                        justify-content: space-between;
                    }
                </style>
                <form>
                    <h2>여행자 정보 입력</h2>
                    <label for="name">한글 이름:</label>
                    <input type="text" id="name" name="name" required>
                  
                    <div class="flex-container">
                      <div>
                        <label for="englishFirstName">영문 이름:</label>
                        <input type="text" id="englishFirstName" name="englishFirstName" required>
                      </div>
                      <div>
                        <label for="englishLastName">영문 성:</label>
                        <input type="text" id="englishLastName" name="englishLastName" required>
                      </div>
                    </div>
                  
                    <div class="flex-container">
                      <div>
                        <label for="birthDate">생년월일:</label>
                        <input type="date" id="birthDate" name="birthDate" required>
                      </div>
                    </div>
                    <label for="gender">성별:</label>
                    <select id="gender" name="gender" required>
                      <option value="" disabled selected>성별 선택</option>
                      <option value="male">남성</option>
                      <option value="female">여성</option>
                    </select>
                    <button type="submit">정보 제출</button>
                  </form>
            </div>
        </div>
        <div class="button-container">
						<button type="button" class="btn btn-secondary btn-lg btn-block" width="1160px">다른
							지역 둘러보기</button>
					</div>
          <style>
            form {
                max-width: 600px;
                margin: 20px 0 20px 500px;
                padding: 0 20px;
                box-sizing: border-box;
                background-color: #f5f5f5;
            }
        </style>
    </div>    
    </section>
    <div class="col-lg-3" style="border: 2px solid grey; padding: 22px 24px; width: 340px;">
          <h3>결제 정보</h3><hr>
        <div>
          <h5>주문 금액</h5>
          <h4 style="background-color: #4caf50; padding: 5px; color: white;">총 결제 금액 1,179,000원</h4>
        </div>

    <h3>약관 안내</h3>
    <hr>

    <div>
    	<div style="display:flex;align-item:center;justify-content:space-between;">
        	<p class="consent">개인정보 수집 및 이용동의</p>
            <button class="consent" onclick="showModal()" style="padding: 2px 4px;">필수</button>
            <div style="display:flex;align-item:center;justify-content:center">
            	<input type="checkbox" id="personalInfoConsent" onchange="checkConsent()">
            </div>
         </div>
         <div id="termsModal" class="modal">
            <div class="modal-content">
                <span class="close">&times;</span>
                <h4>개인정보 수집 및 이용동의 (필수)</h4>
                <p>
            	1. 개인정보 수집 및 이용목적:<br>
            	상품 제공 계약의 성립, 계약 관련 동의 또는 철회 본인 의사 확인, 대금환불, 상품배송, 고객상담<br>
            	<br>
            	2. 개인정보 수집 항목:<br>
            	· 예약자 정보 : 이름, 이메일, 휴대폰번호, 영문이름(일부 상품)<br>
            	· 여행자 정보 : 이름, 영문이름(일부 상품)<br>
            	· 추가 예약 정보 : 성별(일부 상품), 생년월일(일부 상품), 카카오톡ID(일부 상품)<br>
            	<br>
            	3. 보유 및 이용기간:<br>
            	회원 탈퇴시 까지(단, 관계 법령에 따름)
        </p>
                <button onclick="confirmConsent('termsModal', 'personalInfoConsent')">확인</button>
            </div>
        </div>
         
         <div style="display:flex;align-item:center;justify-content:space-between;">   
        <p class="consent">개인정보 제공 동의</p>
            <button class="consent" onclick="showModal2()" style="padding: 2px 4px;">필수</button>
            <div>
           		 <input type="checkbox" id="infoProvidingConsent" onchange="checkConsent()">            
            </div>
         </div>
         <div id="termsModal2" class="modal">
     	<div class="modal-content">
                <span class="close">&times;</span>
                <h4>개인정보 제공 동의 (필수)</h4>
                <p>
            	1. 개인 정보를 제공받는자<br>
				· B2B단거리상품팀<br>
				2. 제공하는 개인정보 항목<br>
				· 예약자 정보 (이름, 이메일, 휴대폰번호, 영문이름(일부 상품)), 여행자 정보(이름, 영문이름(일부 상품)), 추가 예약 정보 (성별(일부 상품), 생년월일(일부 상품), 카카오톡ID(일부 상품))
				<br>
				3. 개인정보를 제공받는 자의 이용 목적<br>
				· 판매자와 구매자 거래, 상품배송, 고객관리(고객상담/불만처리)
				<br>
				4. 보유 및 이용기간
				· 여행 완료 후 5일까지
        		</p>
                <button onclick="confirmConsent('termsModal2', 'infoProvidingConsent')">확인</button>
            </div>
        </div>
     	
     	
     	<div style="display:flex;align-item:center;justify-content:space-between;">   
        <p class="consent">고유식별정보 제공 동의</p>
            <button class="consent" onclick="showModal3()" style="padding: 2px 4px;">필수</button>
            <div>
            	<input type="checkbox" id="identificationConsent" onchange="checkConsent()">            
            </div>
        </div>
        <div id="termsModal3" class="modal">
     	<div class="modal-content">
                <span class="close">&times;</span>
				<table>
				  <tr>
				    <th>제공 받는자</th>
				    <th>제공 목적</th>
				    <th>제공 정보</th>
				    <th>보유 및 이용 기간</th>
				  </tr>
				  <tr>
				    <td>B2B단거리상품팀</td>
				    <td>현지 여행진행 및 고객 관리</td>
				    <td>여권 번호, 여권발행국, 여권만료일</td>
				    <td>예약 확정 후 3개월까지</td>
				  </tr>
				</table>
				<p>고유식별정보 제공 동의를 거부할 수 있으며, 거부시 서비스 이용이 제한됩니다.</p>
                <button onclick="confirmConsent('termsModal3', 'identificationConsent')">확인</button>
            </div>
        </div>
        
        
        <div style="display:flex;align-item:center;justify-content:space-between;">
        <p class="consent">고유식별정보 수집 및 이전 동의</p>
            <button class="consent" onclick="showModal4()" style="padding: 2px 4px;">필수</button>
            <div>
            	<input type="checkbox" id="identificationTransferConsent" onchange="checkConsent()">            
            </div>
    	</div>
    	<div id="termsModal4" class="modal">
     	<div class="modal-content">
                <span class="close">&times;</span>
                <table>
				  <thead>
				    <tr>
				      <th>수집목적</th>
				      <th>수집항목</th>
				      <th>보유기간</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>상품/서비스의 예약 또는 배송 업무 처리 및 고객상담/해피콜, 맞춤형 컨텐츠 및 서비스 제공</td>
				      <td>여권번호, 여권발행국, 여권만료일</td>
				      <td>회원탈퇴시까지(단, 관계 법령에 따름)</td>
				    </tr>
				    <tr>
				      <td>여행자 정보 등록 및 관리</td>
				      <td>여권번호, 여권발행국, 여권만료일</td>
				      <td>회원탈퇴 혹은 여행자정보 삭제시까지</td>
				    </tr>
				  </tbody>
				</table>

				<button onclick="confirmConsent('termsModal4', 'identificationTransferConsent')">확인</button>
            </div>
        </div>
    	
        <div class="infocheck" style="border: 2px solid grey";>
              "위 약관을 확인하였으며 회원 본인은 약관 및 결제에 동의합니다"<input type="checkbox" id="infocheckbox">
        </div>

        <div>
          <h5 onclick="toggleCancellationPolicy()">예약 취소 규정 보기/숨기기</h5>
            <div id="cancellationPolicy">
              <p>▶여행자의 여행계약 해제 요청 시 여행약관에 의거하여 취소료가 부과됩니다◀</p>
              <p>제16조(여행출발 전 계약해제)</p>
              <p>여행개시 30일전까지( ～30) 통보 시 - 계약금 환급</p>
              <p>여행개시 20일전까지(29～20) 통보 시 - 여행요금의 10% 배상</p>
              <p>여행개시 10일전까지(19～10) 통보 시 - 여행요금의 15% 배상</p>
              <p>여행개시 8일전까지( 9～ 8) 통보 시 - 여행요금의 20% 배상</p>
              <p>여행개시 1일전까지( 7～ 1) 통보 시 - 여행요금의 30% 배상</p>
              <p>여행 당일 통보 시 - 여행요금의 50% 배상</p>
              <p>▶선발권 관련 규정안내</p>
              <p>① 선발권 조건의 특가로 진행되는 상품가로, 발권 시점은 별도 안내드립니다.</p>
              <p>② 선발권 시점 이후 항공 요금 상승시 상품 가격이 인상될 수 있습니다.</p>
              <p>③ 항공사 규정상 발권 후에는 이름 변경, 여정 변경 시 별도비용이 추가됩니다.</p>
              <p>(1석당 13만원)</p>
              <p>④ 항공발권 후 취소시 약관시점 이전에 취소 될 경우라도 항공 발권 취소차지가 별도로 부과됩니다.</p>
              <p>(예: 토/일/월 출발 상품은 금요일 업무종료 이후 취소시 당일 취소로 간주됩니다.)</p>
              <p>▶ 여행 취소 접수 안내</p>
              <p>취소는 업무시간 내 접수 시 확인 및 적용이 가능합니다.</p>
              <p>취소수수료 발생일은 영업일 기준으로 산정됩니다.(주말,공휴일 제외)</p>
              <p>업무시간 외 접수한 경우에는 익일(영업일이 아닌 경우 다음 영업일)에 접수한 것으로 간주됩니다.</p>
              <p>업무시간은 월-금 09:00~18:00 (주말,공휴일 제외)</p>
              <p>(예: 토/일/월 출발 상품은 금요일 업무종료 이후 취소시 당일 취소로 간주됩니다.)</p>
            </div>
        </div>
              <div>
                <button id="paymentButton" onclick="paymentButton()">결제하기</button>
              </div>
              <div>
              	<button id="nhnpaymentButton" onclick="nhnpaymentButton()">결제하기</button>
              </div>
      </div>
</section>
  <style>
    body {
      font-family: Arial, sans-serif;
    }

    form {
      max-width: 400px;
      margin: 20px auto;
    }

    label {
      display: block;
      margin-bottom: 8px;
    }

    input, select {
      width: 100%;
      padding: 8px;
      margin-bottom: 16px;
      box-sizing: border-box;
    }

    .flex-container {
      display: flex;
      justify-content: space-between;
      gap: 16px;
    }

    button {
      background-color: #51abf3;
      color: white;
      padding: 10px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    button:hover {
      background-color: #45a049;
    }
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        padding-top: 15%; /* 수직 위치를 조절합니다 */
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4);
    }

    .modal-content {
        background-color: #fefefe;
        margin: auto; /* 추가 */
        padding: 20px;
        border: 1px solid #888;
        width: 50%; /* 가로 너비를 조절합니다 */
    }
  </style>

 <script>
    function checkConsent() {
        let personalinfo = document.getElementById("personalInfoConsent").checked;
        let infoprovide = document.getElementById("infoProvidingConsent").checked;
        let identifiinfo = document.getElementById("identificationConsent").checked;
        let identifiinfotrans = document.getElementById("identificationTransferConsent").checked;

        var infocheckbox = document.getElementById("infocheckbox");
        if (personalinfo && infoprovide && identifiinfo && identifiinfotrans) {
            infocheckbox.checked = true;
            infocheckbox.disabled = false;
        } else {
            infocheckbox.checked = false;
            infocheckbox.disabled = true;
        }
    }

    function showModal() {
        var modal = document.getElementById("termsModal");
        modal.style.display = "block";
    }

    function showModal2() {
        var modal = document.getElementById("termsModal2");
        modal.style.display = "block";
    }

    function showModal3() {
        var modal = document.getElementById("termsModal3");
        modal.style.display = "block";
    }

    function showModal4() {
        var modal = document.getElementById("termsModal4");
        modal.style.display = "block";
    }

    function confirmConsent(target, checkboxId) {
        alert("약관에 동의했습니다.");
        var modal = document.getElementById(target);
        modal.style.display = "none";
        var checkbox = document.getElementById(checkboxId);
        checkbox.checked = true;
        checkConsent();
    }

    document.getElementById("paymentButton").addEventListener("click", function() {
        var infocheckbox = document.getElementById("infocheckbox");
        if (!infocheckbox.checked) {
            alert("약관을 모두 동의해야 합니다.");
        }
    });

    function toggleCancellationPolicy() {
        var policy = document.getElementById("cancellationPolicy");
        if (policy.style.display === "none") {
            policy.style.display = "block";
        } else {
            policy.style.display = "none";
        }
    }

    window.onload = function() {
        var infocheckbox = document.getElementById("infocheckbox");
        infocheckbox.disabled = true;

        var span = document.getElementsByClassName("close")[0];
        span.onclick = function() {
            var modal = document.getElementById("termsModal");
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            var modal = document.getElementById("termsModal");
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    }
</script>

<%@ include file="/views/common/footer.jsp"%>