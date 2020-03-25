package com.project.shuttle.model.dao;

import java.util.List;

import com.project.shuttle.model.dto.TBJobDto;
import com.project.shuttle.model.dto.TBUserDto;

public interface TBUserDao {
	
	public TBUserDto login(TBUserDto dto);
	
	public List<TBJobDto> getWrittenBoard(String name);

}
