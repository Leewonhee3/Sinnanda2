package com.b2.sinnanda.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.b2.sinnanda.vo.Admin;
import com.b2.sinnanda.vo.Host;
import com.b2.sinnanda.vo.Member;
import com.b2.sinnanda.vo.User;

@Mapper
public interface LoginMapper {
	
	//	[김영후] Member 마지막 로그인 날짜 데이터 갱신
	public void updateMemberLastLogin(int memberNo);
	
	// [이승준] 모든 테이블 조회 로그인
	public String selectLoginCheckAll(User user);
	
	// [이승준] 사업자 로그인 정보 조회
	public Host selectHostLogin(Host host);
	
	//[이원희] 로그인 정보 조회 쿼리 21.12.10
	public Member selectMemberLogin(Member member); 
	
	//[윤경환] 관리자 로그인 정보 조회
	public Admin selectAdminLogin(Admin admin);
}
