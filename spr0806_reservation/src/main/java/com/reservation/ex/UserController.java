package com.reservation.ex;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reservation.dto.UserDto;
import com.reservation.dto.VendorDto;
import com.reservation.dto.VendorReservationDto;
import com.reservation.service.UserService;
import com.reservation.service.VendorReservationService;
import com.reservation.service.VendorService;


@Controller
public class UserController {
	
	@Autowired
    PasswordEncoder passwordEncoder;
	
	@Autowired
	private UserService uService;

	@Autowired
	private VendorService vService;
	
	@Autowired
	private VendorReservationService vRService;
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	

	@RequestMapping(value = "/user/user", method = RequestMethod.GET)
	public String user(HttpSession session, Model model) throws Exception {
		System.out.println("UserController - /user/user");
		
		if(session.getAttribute("loginEmail")!=null) {
			String email = (String)session.getAttribute("loginEmail");
			if(session.getAttribute("loginName")==null) {
				session.setAttribute("loginName", uService.selectEmail(email).getName());
			}
		}
		
		return "/user/user";
	}
	
	/*
	@RequestMapping(value = "/user/emailcheck", method = RequestMethod.GET)
	public String userEmailCheck(String email, UserDto dto, RedirectAttributes rttr) throws Exception{
		System.out.println("UserController - /user/emailcheck");
		UserDto checkDto =null;
		checkDto = service.selectEmail(email);
		System.out.println("UserController - /user/emailcheck    input email : " + email + " , return dto : " + checkDto);
		if(checkDto == null) {
			rttr.addFlashAttribute("result", "true");
			System.out.println("result : true");
		}else {
			rttr.addFlashAttribute("result", "false");
			System.out.println("result : false");
		}
		return "/user/emailcheck";
	}
	*/
	
	
	@RequestMapping(value = "/user/error", method = RequestMethod.GET)
	public String userError(Locale locale, Model model) {
		System.out.println("UserController - /user/error");
		return "/user/error";
	}
	
	@RequestMapping(value = "/user/login", method = RequestMethod.GET)
	public String userLogin(Locale locale, Model model) {
		System.out.println("UserController - /user/login");
		return "/user/login";
	}
	
	@RequestMapping(value = "/user/insert", method = RequestMethod.GET)
	public String userInsert(Locale locale, Model model) {
		System.out.println("UserController - /user/insert(get)");
		return "/user/insert";
	}
	
	

	@RequestMapping(value = "/user/insert", method = RequestMethod.POST)
	public String insertDB(UserDto dto, RedirectAttributes rttr) throws Exception{
		System.out.println("UserController - /user/insert(post)");
		String encPassword = passwordEncoder.encode(dto.getPassword());
		dto.setPassword(encPassword);
		uService.insert(dto); // 일반user 가입시 authorities role 자동으로 member 들어감 UserServiceImpl구현부. 트렌젝션 처리 o
		System.out.println(dto);
		return "redirect:/user/login?member";
	}
	
	
	
	@RequestMapping(value = "/user/membertovendor", method = RequestMethod.GET)	//user의 권한에서 vendor로 변환하려는것이기때문에 일단 UserController에 넣어둠
	public String userMembertovendor(Locale locale, Model model) {
		System.out.println("UserController - /user/membertovendor(get)");
		return "/user/membertovendor";
	}
	
	
	@RequestMapping(value = "/user/membertovendor", method = RequestMethod.POST)	//user의 권한에서 vendor로 변환하는것이기때문에 일단 UserController에 넣어둠
	public String userMembertovendorDB(VendorDto dto, RedirectAttributes rttr) throws Exception{
		System.out.println("UserController - /user/membertovendor(post)");
		vService.insert(dto); 		// 일반user vendor전환시,  vendor table에  vendor 정보 insert되고  
		System.out.println(dto);	// authorities table에  ROLE_MEMBER가  ROLE_VENDOR 로 update 됨     VeendorServiceImpl구현부. 트렌젝션 처리 o
		rttr.addAttribute("vendor",true);
		return "redirect:/user/logout";	// 그냥 로그아웃 땡 돼서 뭔가 좀 부자연스러움. 사업자회원전환되엇으니 새로 로그인하라고 보여줘야함
	}

	@RequestMapping(value = "/user/scheduleselect", method = RequestMethod.GET)
	public String userScheduleselect(Locale locale, Model model) {
		System.out.println("UserController - /user/scheduleselect(get)");
		return "/user/scheduleselect";
	}
	
	
	
	//이건 여기서 처리할게 아니라 rest에서 해야될듯
	@RequestMapping(value = "/user/scheduleselect", method = RequestMethod.POST)
	@ResponseBody
	public VendorReservationDto userScheduleselectDB(@RequestBody VendorReservationDto dto, 
			RedirectAttributes rttr) throws Exception{
		System.out.println("UserController - /user/scheduleselect(post)");
		
		System.out.println(dto.toString());
		
		return vRService.selectOneVendorsReservation(dto);
	}
	
	
}
