package com.web.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.member.dto.Member;
import com.web.member.service.MemberService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub2
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 클라이언트가 보낸 아이디와 패스워드를 받아온다
			String userId=request.getParameter("userId");
			String userpw=request.getParameter("userpw");
			String saveId=request.getParameter("saveId");
			if(saveId!=null) {
				Cookie c=new Cookie("saveId", userId);
				c.setMaxAge(60*60*24);
				response.addCookie(c);
			}else {
				Cookie c=new Cookie("saveId",userId);
				c.setMaxAge(0);
				response.addCookie(c);
				
			}
			
			//2. DB의 member테이블에 보낸 이메일와 패스워드 가 일치하는 회원을 가져온다. 
			
			Member m=new MemberService().selectMemberByEmailAndPw(userId,userpw);
			if(m!=null) {
				HttpSession session=request.getSession();
				session.setAttribute("loginMember",m);
				response.sendRedirect(request.getContextPath());
			}else {
				request.setAttribute("msg", "이메일이나 패스워드가 불일치");
				request.setAttribute("loc", "/loginpage.do");
				request.getRequestDispatcher("/views/common/msg.jsp")
				.forward(request,response);
			}
			
		
	}

	private void forward(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
