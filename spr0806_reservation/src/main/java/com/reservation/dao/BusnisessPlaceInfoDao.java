package com.reservation.dao;

import com.reservation.dto.BusnisessPlaceInfoDto;

public interface BusnisessPlaceInfoDao {
	public BusnisessPlaceInfoDto selectVendorBusinessPlaceInfo(BusnisessPlaceInfoDto dto) throws Exception;
	
}
