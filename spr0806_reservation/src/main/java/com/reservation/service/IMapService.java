package com.reservation.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.reservation.dto.AuthoritiesDto;
import com.reservation.dto.BusnisessPlaceInfoDto;
import com.reservation.dto.PlaceDetailDto;

public interface IMapService {
	public ArrayList<PlaceDetailDto> selectPlace(String query) throws Exception;

}
