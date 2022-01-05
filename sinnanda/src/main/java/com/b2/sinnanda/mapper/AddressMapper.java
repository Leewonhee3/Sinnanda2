package com.b2.sinnanda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.b2.sinnanda.vo.Address;

@Mapper
public interface AddressMapper {
	
/* 1. 조회 */
	
	// [이승준] (상세)"주소 상세" 조회
	Address selectAddressOne(Address address);
	// [이원희] 시도 목록 조회
	List<String> selectAddressSido();
}
