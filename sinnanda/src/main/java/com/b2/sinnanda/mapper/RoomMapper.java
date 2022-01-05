package com.b2.sinnanda.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.b2.sinnanda.vo.Room;

@Mapper
public interface RoomMapper {
	
	// [이승준] (목록)"객실 목록" 조회
	List<Room> selectRoomList(Map<String, Object> map);
	
	// [이승준] (개수)"객실 개수" 조회
	int selectRoomTotalCount(int accomNo);
	
	// [이승준] (상셰)"객실 상세" 조회
	Room selectRoomOne(int roomNo);
}
