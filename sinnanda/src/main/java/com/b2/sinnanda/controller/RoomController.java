package com.b2.sinnanda.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.b2.sinnanda.commons.DL;
import com.b2.sinnanda.service.RoomService;
import com.b2.sinnanda.vo.Room;

@Controller
public class RoomController {
	@Autowired
	private RoomService roomService;
	@Autowired
	private DL dl;
	
/* 1. 조회 */
	
	// [이승준] "숙소 상세+주소" 조회
	@GetMapping("host/myRoomOne")
	public String getRoomOne(Model model, int roomNo) {
		dl.p("RoomController", "getRoomOne() | Get", "[시작]");
		dl.p("getRoomOne()", "roomNo", roomNo);
		
		Room room = roomService.getRoomOne(roomNo);
		
		// 4. 모델 전달
		model.addAttribute("room", room);
		
		return "host/myRoomOne";
	}
}
