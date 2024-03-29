package com.web.mypage.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/uploadfro.do")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
		 if (!ServletFileUpload.isMultipartContent(request)) {
	            throw new IllegalArgumentException("올바른 파일이 아닙니다.");
	        } else {
	            // 파일 저장 경로 설정
	            String path = getServletContext().getRealPath("/upload/mypage");
	            MultipartRequest mr = new MultipartRequest(request, path, 10224 * 1024 * 100, "UTF-8",
	                    new DefaultFileRenamePolicy());
	            List<Map<String, String>> files = new ArrayList<>();

	            Enumeration names = mr.getFileNames();
	            while (names.hasMoreElements()) {
	                String name = (String) names.nextElement();
	                String re = mr.getFilesystemName(name);
	                String ori = mr.getOriginalFileName(name);
	                files.add(Map.of("rename", re, "oriName", ori));
	            }

	            files.forEach(e -> {
	                System.out.println(e);
	            });

	            String userNo = mr.getParameter("userNo");
	            System.out.println(userNo);
	            
	            String imagePath = request.getContextPath() + "/upload/mypage/" + files.get(0).get("rename");
	            response.getWriter().write("업로드 성공!");
	        }
	    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
