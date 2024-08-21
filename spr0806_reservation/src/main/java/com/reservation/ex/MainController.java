package com.reservation.ex;

import java.awt.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.reservation.dto.MainDto;
import com.reservation.service.IMainService;

//created by 김하겸
//해당 컨트롤러는 메인페이지 뷰에서 오는 요청을 처리

@Controller
public class MainController {

	@Inject
	private IMainService userService;

	// getMapping으로 변환 필요
	@RequestMapping(value = "/my/myPage", method = RequestMethod.GET)
	public void myPage() {

	}

	// getMapping으로 변환 필요
	@RequestMapping(value = "/my/myUpdate", method = RequestMethod.GET)
	public void myUpdate(@RequestParam("userId") String userId, Model model) {

		model.addAttribute("userId", userId);
		System.out.println("마이 페이지로 이동합니다.");

	}

	// getMapping으로 변환 필요
	@RequestMapping(value = "/my/myCoupon", method = RequestMethod.GET)
	public void myCoupon(Model model) {

		// 유저테이블을 타고 보유쿠폰 테이블에가서 쿠폰목록 받아오기
		System.out.println("쿠폰 페이지로 이동합니다.");

	}

	// getMapping으로 변환 필요
	@RequestMapping(value = "/my/myCart", method = RequestMethod.GET)
	public void myCart(Model model) {

		// 유저테이블을 타고 보유쿠폰 테이블에가서 쿠폰목록 받아오기
		System.out.println("장바구니 페이지로 이동합니다.");

	}

	// 검색폼 처리 관련 메서드
	@GetMapping("/ex/search")
	public ArrayList<String> search(@RequestParam("query") String query) {
		// 검색 폼에서 입력받은 쿼리로 게시판 관련 db에서 검색키워드가 포함된 글들을 추출해냄
		ArrayList<String> results = new ArrayList<>();
		// userService.selectSearch(query);와 같은 로직으로 db에 접속해 해당 쿼리를 포함한 글들을 추출
		// board 관련 기능이 완료됐을때 구현
		results.add("검색 결과 1: " + query);
		results.add("검색 결과 2: " + query);
		results.add("검색 결과 3: " + query);

		return results;
	}

	// 공지사항 노출 폼
	@GetMapping("/ex/notices")
	public ArrayList<String> getNotices() {
		// 예시 공지사항 (실제 응용 프로그램에서는 데이터베이스에서 공지사항을 불러옴)
		ArrayList<String> notices = new ArrayList<>();
		notices.add("공지사항 1: 시스템 점검 안내");
		notices.add("공지사항 2: 신규 기능 업데이트");
		notices.add("공지사항 3: 서비스 이용 안내");

		return notices;
	}

	// 회원정보 노출 폼
	@GetMapping("/ex/userInfo")
	public Map<String, String> getUserInfo() {
		// 예시 사용자 정보 (실제 응용 프로그램에서는 사용자 정보를 데이터베이스에서 가져옴)
		Map<String, String> userInfo = new HashMap<>();
		userInfo.put("name", "홍길동");
		userInfo.put("email", "hong@example.com");
		userInfo.put("joinDate", "2023-01-01");

		return userInfo;
	}

}
