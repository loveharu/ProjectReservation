package com.reservation.dao;

import java.util.ArrayList;

import com.reservation.dto.VendorReservationDto;

public interface VendorReservationDao {

	public void insert(VendorReservationDto dto) throws Exception;

	public VendorReservationDto selectAllEnableVendorsReservation(
			String email, String business_regi_num) throws Exception;
	

	public VendorReservationDto selectOneVendorsReservation(
			VendorReservationDto dto) throws Exception;
	
	
	
	
}
