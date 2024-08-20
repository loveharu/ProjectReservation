package com.reservation.service;

import java.util.ArrayList;

import com.reservation.dto.UserDto;

public interface UserService {
	
	public void insert(UserDto dto) throws Exception;
	
	public ArrayList<UserDto> selectAll() throws Exception;

	public UserDto selectEmail(String email) throws Exception;
	
	public void update(UserDto dto) throws Exception;
	
	public void delete(String email) throws Exception;
}
