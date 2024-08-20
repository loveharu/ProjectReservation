package com.reservation.ex;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reservation.dto.MainDto;
import com.reservation.service.IMainService;

@Controller
public class MainController {

	@Inject
	private IMainService userService;

	@RequestMapping(value = "/my/myPage", method = RequestMethod.GET)
	public void myPage() {
		
		System.out.println("마이 페이지로 이동합니다.");
	}
	@RequestMapping(value = "/my/myUpdate", method = RequestMethod.GET)
	public void myUpdate(@RequestParam("userId")String userId,Model model) {
		
		model.addAttribute("userId",userId);
		System.out.println("마이 페이지로 이동합니다.");
		
	}
	@RequestMapping(value = "/my/myCoupon", method = RequestMethod.GET)
	public void myCoupon(Model model) {
		
		//유저테이블을 타고 보유쿠폰 테이블에가서 쿠폰목록 받아오기
		System.out.println("쿠폰 페이지로 이동합니다.");
		
	}
	@RequestMapping(value = "/my/myCart", method = RequestMethod.GET)
	public void myCart(Model model) {
		
		//유저테이블을 타고 보유쿠폰 테이블에가서 쿠폰목록 받아오기
		System.out.println("장바구니 페이지로 이동합니다.");
		
	}
	
}
