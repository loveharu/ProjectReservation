package com.reservation.ex;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.reservation.service.UserService;


@Controller
public class AdminController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private UserService uService;
	
	@RequestMapping(value = "/admin/admin", method = RequestMethod.GET)
	public String admin(HttpSession session, Model model) throws Exception {
		System.out.println("AdminController - /admin/admin");
		
		String email = (String)session.getAttribute("loginEmail");
		if(session.getAttribute("loginName")==null) {
			session.setAttribute("loginName", uService.selectEmail(email).getName());
		}
		
		return "/admin/admin";
	}
	
}
