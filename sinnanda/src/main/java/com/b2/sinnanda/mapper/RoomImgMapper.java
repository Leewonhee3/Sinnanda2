package com.b2.sinnanda.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.b2.sinnanda.vo.RoomImg;

@Mapper
public interface RoomImgMapper {
	
	// [이승준] (목록)"객실 이미지 목록" 조회
	List<RoomImg> selectRoomImgList(int roomNo);
}
