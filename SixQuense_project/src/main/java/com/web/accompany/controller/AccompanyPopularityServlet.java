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
 * Servlet implementation class AccompanyPopularityServlet
 */
@WebServlet("/accompany/accompanypopularity.do")
public class AccompanyPopularityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccompanyPopularityServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<AccompanyDTO> accompanys=new AccompanyServiceKH().selectAccompanyByPopularity();
		request.setAttribute("accompanys", accompanys);
		request.getRequestDispatcher("/views/accompany/accompanylist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
