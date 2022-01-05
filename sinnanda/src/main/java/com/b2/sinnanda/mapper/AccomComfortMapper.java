package com.b2.sinnanda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.b2.sinnanda.vo.AccomComfortInven;

@Mapper
public interface AccomComfortMapper {
	
	// [이승준] "숙소 편의시설 목록" 조회
	List<AccomComfortInven> selectAccomComfortList(int accomNo);
}
