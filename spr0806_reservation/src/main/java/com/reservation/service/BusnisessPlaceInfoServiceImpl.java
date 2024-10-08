package com.reservation.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.dao.BusnisessPlaceInfoDao;
import com.reservation.dao.ServiceItemsDao;
import com.reservation.dto.BusnisessPlaceInfoDto;
import com.reservation.dto.ServiceItemsDto;

@Service
public class BusnisessPlaceInfoServiceImpl implements BusnisessPlaceInfoService{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public BusnisessPlaceInfoDto selectVendorBusinessPlaceInfo(BusnisessPlaceInfoDto dto) throws Exception {


			BusnisessPlaceInfoDao businessDao = sqlSession.getMapper(BusnisessPlaceInfoDao.class);
			return businessDao.selectVendorBusinessPlaceInfo(dto);

		
	}

	
}
