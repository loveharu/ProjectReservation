package com.reservation.ex;

import java.time.LocalDateTime;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.reservation.dto.VendorReservationDto;
import com.reservation.service.UserService;
import com.reservation.service.VendorReservationService;
import com.reservation.service.VendorService;



@Controller
public class VendorController {
	
	@Autowired
	private VendorService vService;

	@Autowired
	private UserService uService;
	
	@Autowired
	private VendorReservationService vRService;
	
	private static final Logger logger = LoggerFactory.getLogger(VendorController.class);
	
	@RequestMapping(value = "/vendor/vendor", method = RequestMethod.GET)
	public String vendor(HttpSession session, Model model) throws Exception {
		System.out.println("VendorController - /vendor/vendor");
		
		String email = (String)session.getAttribute("loginEmail");
		if(session.getAttribute("loginName")==null) {
			session.setAttribute("loginName", uService.selectEmail(email).getName());
			session.setAttribute("loginBusiness_regi_num", vService.selectEmail(email).getBusiness_regi_num());
		}
		
		return "/vendor/vendor";
	}
	
	
	
	
	@RequestMapping(value = "/vendor/scheduleinsert", method = RequestMethod.GET)
	public String vendorScheduleinsert(HttpSession session, Model model) throws Exception {
		System.out.println("VendorController - /vendor/scheduleinsert");
		
		
		return "/vendor/scheduleinsert";
	}
	
	@RequestMapping(value = "/vendor/scheduleinsert", method = RequestMethod.POST)
	public String vendorScheduleinsertDB(
			@RequestParam("date") String date,
			@RequestParam("timeSlots") String timeSlots, HttpSession session, Model model) throws Exception {
		System.out.println("VendorController - /vendor/scheduleinsert");
		
		VendorReservationDto dto = new VendorReservationDto(
				(String)session.getAttribute("loginEmail"),
				(String)session.getAttribute("loginBusiness_regi_num"),
				date,
				timeSlots,
				"1"	//0이면 바로예약불가 1이면 바로예약가능
				);
		
		System.out.println(dto.getOpen_date());
		System.out.println("^ date   v times");
		System.out.println(dto.getTimes());
		
		vRService.insert(dto);
		
		return "/vendor/scheduleinsert";
	}
	
	
	
}
