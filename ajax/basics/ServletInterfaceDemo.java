package com.quinnox.basics;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;

/**
 * Servlet implementation class ServletInterfaceDemo
 */
@WebServlet("/ServletInterfaceDemo")
public class ServletInterfaceDemo implements Servlet {
	ServletConfig config=null;
    /**
     * Default constructor. 
     */
    public ServletInterfaceDemo() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		this.config=config;
		System.out.println("Servlet is intialised");
	}

	/**
	 * @see Servlet#destroy()
	 */
	
	public void destroy() {
		System.out.println("Servlet is destroyed");
	}

	/**
	 * @see Servlet#getServletConfig()
	 */
	public ServletConfig getServletConfig() {
		// TODO Auto-generated method stub
		return config;
	}

	/**
	 * @see Servlet#getServletInfo()
	 */
	public String getServletInfo() {
		// TODO Auto-generated method stub
		return "copyright 2010-2019"; 
	}

	/**
	 * @see Servlet#service(ServletRequest request, ServletResponse response)
	 */
	public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
			response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			out.println("<html><body><b>Hello Simple servlet</b></body></html>");
	}

}
