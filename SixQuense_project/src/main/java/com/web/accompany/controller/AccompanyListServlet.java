package com.web.accompany.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.accompany.model.dto.AccompanyDTO;
import com.web.accompany.service.AccompanyServiceKH;

/**
 * Servlet implementation class AccompanySelectAllServlet
 */
@WebServlet("/accompany/accompanylist.do")
public class AccompanyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccompanyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId=request.getParameter("userId");
		System.out.println(userId);
		if(!userId.equals("null")) {
			List<AccompanyDTO> accompanys=new AccompanyServiceKH().selectAccompanyAll();
			request.setAttribute("accompanys", accompanys);
			request.getRequestDispatcher("/views/accompany/accompanylist.jsp").forward(request, response);			
		}else {
			String msg="로그인후 이용해주세요";
			String loc="/";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
