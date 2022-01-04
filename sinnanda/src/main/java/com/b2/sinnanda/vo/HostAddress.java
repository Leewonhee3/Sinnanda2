package com.b2.sinnanda.vo;

import lombok.Data;

@Data
public class HostAddress {
	private int hostNo;
	private int addressNo;
	private String addressDetail;
	private String createDate;
	private String updateDate;
	
	private String addressInfo;	// [이승준] 합쳐진 주소를 담기위한 변수
	private Address address;
}
