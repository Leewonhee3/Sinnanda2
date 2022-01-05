package com.b2.sinnanda.vo;

import lombok.Data;

@Data
public class RoomItemInven {
	private int roomItemInvenNo;
	private int roomNo;
	private int roomItemNo;
	private int roomItemCount;
	private String createDate;
	private String updateDate;
	
	private RoomItem roomItem;	// [이승준] 한 객실의 한 비품
}
