package com.b2.sinnanda.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.b2.sinnanda.commons.DL;
import com.b2.sinnanda.service.MemberService;
//[이원희]필터 or 스케줄러에 dl 클래스 사용하지 말것
@Component
public class MemberScheduler {
	@Autowired MemberService memberService;
	//@Autowired DL dl;
	
	//	[김영후] 마지막 접속 1년이 지난 회원 휴면상태로 변경
	@Scheduled(cron = "0 0 0 * * *")
	public void modifyMemberActive() {
		int row = memberService.modifyMemberActive();
		//dl.p("ReserveScheduler", "modifyReserveUseCheckOut", row + "명 회원을 휴면 상태로 변경");
	}
	
}
