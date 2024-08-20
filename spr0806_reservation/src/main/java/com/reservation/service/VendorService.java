package com.reservation.service;

import java.util.ArrayList;


import com.reservation.dto.VendorDto;


public interface VendorService {
	
	public void insert(VendorDto dto) throws Exception;
	
	public ArrayList<VendorDto> selectAll() throws Exception;

	public VendorDto selectEmail(String email) throws Exception;
	
	public void update(VendorDto dto) throws Exception;
	
	public void delete(String email) throws Exception;

	public VendorDto selectBusiness_regi_num(String business_regi_num) throws Exception;
	
}
