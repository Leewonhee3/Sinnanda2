package com.b2.sinnanda.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.b2.sinnanda.vo.Admin;
import com.b2.sinnanda.vo.User;

import lombok.extern.slf4j.Slf4j;

//	[김영후] 유저 권한 별 필터링 작업 21.12.14
// [이원희] 포워딩에서 리다이렉트로 변경 22.01.04
@Slf4j
@WebFilter(urlPatterns = "/admin/*")
public class AdminLoginFilter implements Filter{
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		log.debug("[Debug] \"Admin 필터 생성\" AdminFilter.init()");
	}
	
	//[윤경환] 관리자 필터 		[김영후] 수정 21.12.13
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		log.debug("[Debug] \"Admin 필터 시작\" AdminFilter.doFilter()");
		
		//	User 객체 생성
		User loginUser = new User();
		// request 호출
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res =(HttpServletResponse) response;
		// 세션 정보 가져오기
		HttpSession session = req.getSession();
		// 로그인 정보가 없을 시, login 페이지로 이동
		if(session.getAttribute("loginUser") == null) {
			log.info(" ├[info] \"로그인 정보 없음, 로그인 페이지로 이동\" AdminFilter.doFilter()");
			res.sendRedirect(req.getContextPath()+"/login");
			//req.getRequestDispatcher("/login").forward(request, response);
			return;
		} else {
			loginUser = (User)session.getAttribute("loginUser");
			log.debug(" ├[param] user : "+loginUser.toString());	
			//	UserLevel 검사
			if(loginUser.getUserLevel() != 3) {
				log.info(" ├[info] \"User 권한 부족, 인덱스 페이지로 이동\" AdminFilter.doFilter()");
				//req.getRequestDispatcher("/login").forward(request, response);				
				res.sendRedirect(req.getContextPath()+"/index");
				return;
			}
		}		
		chain.doFilter(request, response);
		log.debug("[Debug] \"Admin 필터 종료\" AdminFilter.doFilter()"); 
    }

	@Override
	public void destroy() {
		log.debug("[Debug] \"Admin 필터 파기\" AdminFilter.destroy()");
	}
}