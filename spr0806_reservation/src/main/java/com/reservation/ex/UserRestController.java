package com.reservation.ex;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reservation.dto.UserDto;
import com.reservation.dto.VendorReservationDto;
import com.reservation.service.UserService;
import com.reservation.service.VendorReservationService;

@RestController
public class UserRestController {
	
	@Autowired
	private UserService userService;
	

	@Autowired
	private VendorReservationService vRService;
	

	//이건 여기서 처리할게 아니라 rest에서 해야될듯
	@RequestMapping(value = "/userrest/scheduleselect", method = RequestMethod.POST)
	@ResponseBody
	public VendorReservationDto userScheduleselectDB(@RequestBody VendorReservationDto dto, 
			RedirectAttributes rttr) throws Exception{
		System.out.println("UserRestController - /userrest/scheduleselect(post)");
		
		System.out.println(dto.toString());
		
		return vRService.selectOneVendorsReservation(dto);
	}
	
	
	
	

	@RequestMapping(value = "/userrest/emailToName", method = RequestMethod.GET)
	public Map emailToName(String email) throws Exception {
		System.out.println("UserRestController - /emailToName " + email);
		
		Map<String, String> result = new HashMap<>();
		UserDto checkDto =null;
		try {
			checkDto = userService.selectEmail(email);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("UserRestController - /userrest/emailToName    input email : " + email + " , return dto : " + checkDto);
		if(checkDto == null) {
			result.put("name", null);
			System.out.println("name : null");
		}else {
			result.put("name", checkDto.getName());
			System.out.println("name : " + checkDto.getName());
		}
		
		return result;
	}
	
	@RequestMapping(value = "/userrest/emailcheck", method = RequestMethod.GET)
	public Map userEmailCheck(String email)  {
		System.out.println("UserRestController - /userrest/emailcheck " + email);
		
		Map<String, String> result = new HashMap<>();
		UserDto checkDto =null;
		try {
			checkDto = userService.selectEmail(email);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("UserRestController - /userrest/emailcheck    input email : " + email + " , return dto : " + checkDto);
		if(checkDto == null) {
			result.put("result", "true");
			System.out.println("result : true");
		}else {
			result.put("result", "false");
			System.out.println("result : false");
		}
		
		return result;
	}

	@RequestMapping("/userrest/selectall")
	public List<UserDto> sendUserList() throws Exception {
		System.out.println("UserRestController - /userrest/selectall ");
		List<UserDto> list = new ArrayList<>();
		list = userService.selectAll();
		
		return list;
	}

	@RequestMapping("/userrest/test/{email}")
	public ResponseEntity<UserDto> selectEmailTest(@PathVariable("email") String email) {
		System.out.println("UserRestController - /userrest/test ");
		ResponseEntity<UserDto> entity = null;
		try {
			entity = new ResponseEntity<>(userService.selectEmail(email), HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		//entity.getBody().getEmail()
		
		return entity;
	}
//
//	@RequestMapping("/userrest/test/{email}")
//	public ResponseEntity<UserDto> selectEmailTest(@PathVariable("email") String email) {
//		System.out.println("UserRestController - /userrest/test ");
//		ResponseEntity<UserDto> entity = null;
//		try {
//			entity = new ResponseEntity<>(userService.selectEmail(email), HttpStatus.OK);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
//		}
//		
//		return entity;
//	}
	
}
