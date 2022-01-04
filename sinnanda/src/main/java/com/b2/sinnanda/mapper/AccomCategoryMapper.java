package com.b2.sinnanda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.b2.sinnanda.vo.AccomCategory;

@Mapper
public interface AccomCategoryMapper {
	
	// [이승준] "숙소 카테고리 목록" 조회
	List<AccomCategory> selectAccomCategoryList(int accomNo);
}
