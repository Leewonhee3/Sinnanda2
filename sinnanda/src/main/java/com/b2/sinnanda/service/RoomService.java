package com.b2.sinnanda.service;

import org.springframework.transaction.annotation.Transactional;

import com.b2.sinnanda.commons.DL;
import com.b2.sinnanda.mapper.RoomImgMapper;
import com.b2.sinnanda.mapper.RoomItemMapper;
import com.b2.sinnanda.mapper.RoomMapper;
import com.b2.sinnanda.vo.Room;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class RoomService {
	@Autowired
	private RoomMapper roomMapper;
	@Autowired
	private RoomImgMapper roomImgMapper;
	@Autowired
	private RoomItemMapper roomItemMapper;
	@Autowired
	private DL dl;
	
	// [이승준] "객실 상세" 조회
	public Room getRoomOne(int roomNo){
		dl.p("RoomService", "getRoomOne()", "[시작]");
		dl.p("getRoomOne()", "roomNo", roomNo);
		
		Room room = roomMapper.selectRoomOne(roomNo);
		dl.p("getRoomOne()", "room", room);
		
		room.setRoomItemInven(roomItemMapper.selectRoomItemList(roomNo));
		
		room.setRoomImg(roomImgMapper.selectRoomImgList(roomNo));
		
		return room;
	}
}
