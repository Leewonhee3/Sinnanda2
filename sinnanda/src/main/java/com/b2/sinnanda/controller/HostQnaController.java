package com.b2.sinnanda.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.b2.sinnanda.commons.DL;
import com.b2.sinnanda.service.HostQnaService;
import com.b2.sinnanda.vo.HostQna;
import com.b2.sinnanda.vo.HostQnaComment;
import com.b2.sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HostQnaController {
	@Autowired
	private HostQnaService hostQnaService;
	@Autowired
	private DL dl;
	
	// 페이징용 상수
	private final int ROW_PER_PAGE = 10;
	
/* 1. 조회 */
	
	// [이승준] "사업자문의 목록" | 관리자페이지
	@GetMapping("/admin/hostQnaList")
	public String getHostQnaListForAdmin(HttpSession session, Model model,
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(defaultValue = "전체") String hostQnaCategory) {
		dl.p("HostQnaController", "getHostQnaListForAdmin() | Get", "시작");
		dl.p("getHostQnaListForAdmin()", "currentPage", currentPage);
		dl.p("getHostQnaListForAdmin()", "hostQnaCategory", hostQnaCategory);
		
		// 1. 로그인 세션 조회
		User loginUser = (User)session.getAttribute("loginUser");
		dl.p("complainList()", "loginUser", loginUser.toString());
		
		// 2. 페이지번호의 출력을 시작하는 수를 구하기 수식
		int beginRow = (currentPage * ROW_PER_PAGE) - ROW_PER_PAGE;
		
		// 3. "답변없는 사업자문의 목록" 조회 서비스 호출
		Map<String, Object> map = hostQnaService.getNotCommentedHostQnaList(loginUser.getUserLevel(), 0, hostQnaCategory, beginRow, ROW_PER_PAGE);
		
		// 4. 10개의 페이지번호의를 출력하기 위한 변수
		int pageNo = ((beginRow / 100) * 10 + 1);
		log.debug(" ├[param] pageNo : " + pageNo);
		
		// 5. 모델 전달
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("hostQnaCategory", hostQnaCategory);
		model.addAttribute("loginUser", loginUser);
		model.addAttribute("hostQnaList", map.get("hostQnaList"));
		model.addAttribute("hostQnaListTotalCount", map.get("totalCount"));
		model.addAttribute("lastPage", map.get("lastPage"));
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		
		return "admin/hostQnaList";
	}
	
	// [이승준] "사업자문의 목록" 조회 | 사업자페이지
	@GetMapping("/host/myHostQnaList")
	public String hostQnaListForHost(HttpServletRequest request, Model model,
			@RequestParam(defaultValue = "1") int currentPage, 
			@RequestParam(defaultValue = "전체") String hostQnaCategory) {
		log.debug("[Debug] \"START\" HostQnaController.hostQnaListForHost() | Get");
		log.debug(" ├[param] currentPage : "+currentPage);
		log.debug(" ├[param] hostQnaCategory : "+hostQnaCategory);
		
		// 1. 출력을 시작하는 행 구하기 수식
		int beginRow = (currentPage * ROW_PER_PAGE) - ROW_PER_PAGE; 
		
		// 2. 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		// 2-1. 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
		} else {
			log.debug(" ├[param] loginUser : Null");
			return "redirect:/index";
		}
		
		// 3. Host QnA 목록 조회(userLevel, hostNo, hostQnaCategory, currentPage, ROW_PER_PAGE)
		Map<String, Object> map = hostQnaService.getHostQnaList(loginUser.getUserLevel(), loginUser.getHost().getHostNo(), hostQnaCategory, beginRow, ROW_PER_PAGE);
		
		// 4. 10개의 page 번호를 출력하기 위한 변수
		int pageNo = ((beginRow / 100) * 10 + 1);
		log.debug(" ├[param] pageNo : " + pageNo);
		
		// 4. 모델 추가
		model.addAttribute("loginUser", loginUser);	// 로그인 세선 정보
		model.addAttribute("hostQnaCategory", hostQnaCategory);	// 선택된 QnA 카테고리
		model.addAttribute("hostQnaList", map.get("hostQnaList"));	// QnA 목록 정보
		model.addAttribute("hostQnaListTotalCount", map.get("totalCount"));
		model.addAttribute("beginRow", beginRow);
		model.addAttribute("ROW_PER_PAGE", ROW_PER_PAGE);
		model.addAttribute("lastPage", map.get("lastPage"));	// 마지막 페이지(페이징용)
		model.addAttribute("currentPage", currentPage);	// 현재 페이지
		model.addAttribute("pageNo", pageNo);	// 페이지 번호를 출력하기 위한 변수
		
		return "host/myHostQnaList";
	}
	
	// [이승준] "사업자문의 상세" 조회 | 사업자페이지
	@GetMapping("/host/myHostQnaOne")
	public String hostQnaOne(HttpServletRequest request, Model model, int hostQnaNo) {
		log.debug("[Debug] \"START\" HostQnaController.hostQnaOne() | Get");
		log.debug(" ├[param] hostQnaNo : "+hostQnaNo);
		
		// Host QnA 상세 조회
		HostQna hostQna = hostQnaService.getHostQnaOne(hostQnaNo);
		
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		// 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
		} else {
			log.debug(" ├[param] loginUser : Null");
		}
		
		/* 모델 추가 */
		model.addAttribute("loginUser", loginUser);	// 로그인 세선 정보
		model.addAttribute("hostQna", hostQna);	// 선택된 QnA 상세 정보 */
		
		return "host/myHostQnaOne";
	}
	
	//[윤경환] 관리자 답변이 필요한 Qna
	@GetMapping("/admin/hostQnaOne")
	public String hostAdminQnaOne(HttpServletRequest request, Model model, int hostQnaNo) {
				// Host QnA 상세 조회
				HostQna hostQna = hostQnaService.getHostQnaOne(hostQnaNo);
				
				// 로그인 세션 조회
				HttpSession session = request.getSession();
				User loginUser = (User)session.getAttribute("loginUser");
				// 로그인 세션 디버깅
				if(loginUser != null) {
					log.debug(" ├[param] loginUser : "+loginUser.toString());
				} else {
					log.debug(" ├[param] loginUser : Null");
				}
				
				/* 모델 추가 */
				model.addAttribute("loginUser", loginUser);	// 로그인 세선 정보
				model.addAttribute("hostQna", hostQna);	// 선택된 QnA 상세 정보 */
		
		
		return "admin/hostQnaOne";
		
	}
	
/* 2. 삽입 */
	
	// [이승준] "사업자문의" 삽입 | 사업자페이지
	@GetMapping("/host/addHostQna")
	public String addHostQna(HttpServletRequest request, Model model) {
		log.debug("[Debug] \"START\" HostQnaController.addHostQna() | Get");
		
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		// 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
		} else {
			log.debug(" ├[param] loginUser : Null");
		}
		
		/* 모델 추가 */
		model.addAttribute("loginUser", loginUser);	// 로그인 세선 정보
		
		return "host/addHostQna";
	}
	@PostMapping("/host/addHostQna")
	public String addHostQna(HttpSession session, MultipartFile[] upload, HostQna hostQna) {
		log.debug("[Debug] \"START\" HostQnaController.addHostQna() | Post");
		log.debug(" ├[param] hostQna : "+hostQna.toString());
		log.debug(" ├[param] upload : "+upload);
		
		//	파일이 업로드 될 경로 설정 
		String saveDir = session.getServletContext().getRealPath("/images/hostQna"); 
		
		//	파일 업로드 
		for(MultipartFile f : upload) {
			if(!f.isEmpty()) {
				// 기존 파일 이름을 받고 확장자 저장
				String orifileName = f.getOriginalFilename(); 
				String ext = orifileName.substring(orifileName.lastIndexOf(".")); 
				
				// 이름 값 변경을 위한 설정 
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd-HHmmssSSS"); 
				int rand = (int)(Math.random()*1000); 
				
				// 파일 이름 변경 
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rand + ext; 
				
				// 파일 저장 
				try { 
					f.transferTo(new File(saveDir + "/" + reName));
					//	rename한 파일이름을 데이터에 추가
					hostQna.setHostQnaUploadFile(reName);
				}catch (IllegalStateException | IOException e) {
					e.printStackTrace(); 
				} 
			} 
		} 
		
		hostQnaService.addHostQna(hostQna);
		
		return "redirect:/host/myHostQnaOne?hostQnaNo="+hostQna.getHostQnaNo();
	}
	
	//[윤경환] 사업자문의 답변 삽입
	@PostMapping("/admin/addHostQnaComment")
	public String addHostQnaComment(HostQnaComment hostQnaComment) {
		dl.p("HostQnaController", "addHostQnaComment()", "시작");
		dl.p("addHostQnaComment()", "hostQnaComment", hostQnaComment.toString());
		
		hostQnaService.addHostQnaComment(hostQnaComment);
		
		return "redirect:/admin/hostQnaOne?hostQnaNo=" + hostQnaComment.getHostQnaNo();
	}
	
	
/* 3. 수정 */
	
	// [이승준] "사업자문의" 수정 | 사업자페이지
	@GetMapping("/host/modifyMyHostQna")
	public String modifyMyHostQna(HttpServletRequest request, Model model, int hostQnaNo) {
		log.debug("[Debug] \"START\" HostQnaController.modifyHostQna() | Get");
		log.debug(" ├[param] hostQnaNo : "+hostQnaNo);
		
		// 수정 전 기존 값 조회
		HostQna hostQna = hostQnaService.getHostQnaOne(hostQnaNo);
		model.addAttribute(hostQna);
		
		// 로그인 세션 조회
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		// 로그인 세션 디버깅
		if(loginUser != null) {
			log.debug(" ├[param] loginUser : "+loginUser.toString());
			// 오직 글을 작성한 사업자만 접근 가능
			if((loginUser.getUserLevel() != 2) && (loginUser.getHost().getHostNo() != hostQna.getHostNo())) {
				return "redirect:/host/hostQnaList";
			}
		} else {
			log.debug(" ├[param] loginUser : Null");
			return "redirect:/host/hostQnaList";
		}
		
		return "host/modifyMyHostQna";
	}
	@PostMapping("/host/modifyMyHostQna")
	public String modifyQna(HostQna hostQna) {
		log.debug("[Debug] \"START\" HostQnaController.modifyMyHostQna() | Post");
		log.debug(" ├[param] hostQna : "+hostQna.toString());
		
		hostQnaService.modifyHostQna(hostQna);
		
		return "redirect:/host/myHostQnaOne?hostQnaNo="+hostQna.getHostQnaNo();
	}
	
	
	
	
/* 4. 삭제 */
	
	// [이승준] "사업자문의" 삭제 | 사업자페이지
	@GetMapping("/host/removeMyHostQna")
	public String removeMyHostQna(int hostQnaNo) {
		dl.p("HostQnaController", "removeHostQna() | Get", "시작");
		dl.p("removeHostQna()", "hostQnaNo", hostQnaNo);
		
		hostQnaService.removeHostQna(hostQnaNo);
		
		return "redirect:/host/hostPage";
	}
	
	
	
}
