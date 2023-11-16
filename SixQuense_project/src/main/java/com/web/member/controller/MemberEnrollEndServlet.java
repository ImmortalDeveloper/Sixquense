package com.web.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.member.dto.Member;
import com.web.member.service.MemberService;

/**
 * Servlet implementation class MemberEnrollEndServlet
 */
@WebServlet("/member/login.do")
public class MemberEnrollEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//화면에서 전달한 데이터 받아오기
		String userId=request.getParameter("userId");
		String userPw=request.getParameter("userpw");
		String userNn=request.getParameter("usernn");
		String phone=request.getParameter("phone");
		
		Date userDd = Date.valueOf(LocalDate.of(Integer.parseInt(request.getParameter("userYear")),
				Integer.parseInt(request.getParameter("userMonth")), Integer.parseInt(request.getParameter("userDd"))));

		String gender=request.getParameter("gender");
		
		Member m=Member.builder()
				.userId(userId)
				.userPw(userPw)
				.userNn(userNn)
				.phone(phone)
				.userDd(userDd)
				.gender(gender)
				.build();
		//DB에 저장하기
		int result=new MemberService().insertMember(m);
		
		//저장 후 메세세지 출력 후 메인화면으로 이동
		String msg,loc;
		if(result>0) {
			msg=m.getUserId()+"가입완료";
			loc="/";
		}else {
			msg="가입 실패";
			loc="/member/enrollMember.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp")
		.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
