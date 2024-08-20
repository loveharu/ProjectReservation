package com.reservation.ex;

import java.util.Locale;

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
public class MemberController {
	
	@Autowired
	private UserService uService;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping(value = "/member/member", method = RequestMethod.GET)
	public String member(HttpSession session, Model model) throws Exception {
		System.out.println("MemberController - /member/member");
		
		String email = (String)session.getAttribute("loginEmail");
		if(session.getAttribute("loginName")==null) {
			session.setAttribute("loginName", uService.selectEmail(email).getName());
		}
		
		return "/member/member";
	}
	
}
