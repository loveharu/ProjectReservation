package com.reservation.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.reservation.dto.BusnisessPlaceInfoDto;
import com.reservation.dto.MainDto;
import com.reservation.dto.PlaceDetailDto;

public interface IMapDao {
	ArrayList<PlaceDetailDto> selectPlace(String query) throws Exception;
}
