package com.b2.sinnanda.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.b2.sinnanda.commons.DL;
import com.b2.sinnanda.mapper.AddressMapper;

@Service
@Transactional
public class IndexCategoryService {
	@Autowired DL dl;
	@Autowired AddressMapper addressMapper;
	
	//[이원희] 인덱스 페이지 검색 카테고리 주소, 숙소유형..옵션 리스트를 불러온다.
	
	public List<String> getSidoList(){
		List<String> returnList = addressMapper.selectAddressSido();
		dl.p("IndexCategoryService", "returnList", returnList);
		
		return returnList;
	}
}
