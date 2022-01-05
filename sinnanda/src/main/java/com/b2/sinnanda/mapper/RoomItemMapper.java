package com.b2.sinnanda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.b2.sinnanda.vo.RoomItemInven;

@Mapper
public interface RoomItemMapper {
	
	// [이승준] (목록)"객실 비품 목록" 조회
	List<RoomItemInven> selectRoomItemList(int roomNo);
}
