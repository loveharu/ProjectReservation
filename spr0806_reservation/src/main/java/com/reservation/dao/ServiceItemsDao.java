package com.reservation.dao;

import java.util.ArrayList;

import com.reservation.dto.ImageDto;
import com.reservation.dto.ServiceItemsDto;
import com.reservation.dto.VendorReservationDto;

public interface ServiceItemsDao {

	public void insertMyItem(ServiceItemsDto dto) throws Exception;
	public ArrayList<ServiceItemsDto> selectMyItems(ServiceItemsDto dto) throws Exception;
	public ServiceItemsDto selectOneMyItem(ServiceItemsDto dto) throws Exception;
	public void updateMyItem(ServiceItemsDto dto) throws Exception;
 	public void deleteMyItem(ServiceItemsDto dto) throws Exception;
	public void insertItemImg(ImageDto dto) throws Exception;
	
}
