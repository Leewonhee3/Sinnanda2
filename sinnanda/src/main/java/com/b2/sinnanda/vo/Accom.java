package com.b2.sinnanda.vo;

import java.util.List;

import lombok.Data;

@Data
public class Accom {
	int accomNo;
	int hostNo;
	int adminNo;
	int commissionNo;
	int accomCategoryNo;
	int accomRate;
	String accomName;
	String accomImg;
	String accomDescription;
	String accomDescriptionLong;
	String createDate;
	String updateDate;
	String accomAddr;
	
	private List<AccomComfortInven> accomComfortInven;	// [이승준] 숙소의 편의시설 목록
	private List<AccomCategoryInven> accomCategoryInven;	// [이승준] 숙소의 카테고리 목록
	private List<Room> rooms;	// [이승준] 숙소가 가지고 있는 객실의 목록
	private AccomAddress accomAddress;	// [이승준] 숙소의 주소
	private String adminName;	// [이승준] 숙소를 등록한 관리자 이름
	private String accomCategoryName;	// [이승준] 숙소의 분류 중 한 개
	private String commissionName; // [이승준] 숙소의 수수료 적용사항
	private int roomCount;	// [이승준] 각 숙소의 객실 개수를 위한 변수
}
