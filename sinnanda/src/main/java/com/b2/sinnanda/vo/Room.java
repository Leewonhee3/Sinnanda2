package com.b2.sinnanda.vo;

import java.util.List;

import lombok.Data;

@Data
public class Room {
	int roomNo;
	int accomNo;
	String roomName;
	String roomMainImg;
	String roomDescription;
	int roomPerson;
	int roomPrice;
	String roomCheckIn;
	String roomCheckOut;
	String roomUse;
	String createDate;
	String updateDate;
	
	//[정산에 필요한 값들]
	private Accom accom;
	private List<RoomItemInven> roomItemInven;	// [이승준] 객실의 비품
	private List<RoomImg> roomImg;	// [이승준] 객실의 이미지
}
