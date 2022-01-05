package com.b2.sinnanda.vo;

import lombok.Data;

@Data
public class AccomComfortInven {
	private int accomComfortInvenNo;
	private int accomNo;
	private String accomComfortNo;
	private String credateDate;
	private String updateDate;
	
	private AccomComfort accomComfort;
}
