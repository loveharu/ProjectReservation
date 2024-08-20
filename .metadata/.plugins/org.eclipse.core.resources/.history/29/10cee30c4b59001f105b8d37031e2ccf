package com.reservation.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.dao.BusinessPlaceInfoDao;
import com.reservation.dto.BusinessPlaceInfoDto;

@Service
public class BusinessPlaceInfoServiceImpl implements BusinessPlaceInfoService{
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public BusinessPlaceInfoDto selectVendorBusinessPlaceInfo(String email, String business_regi_num) throws Exception {
		BusinessPlaceInfoDao dao = sqlSession.getMapper(BusinessPlaceInfoDao.class);
		
		return dao.selectVendorBusinessPlaceInfo(email, business_regi_num);
		
	}

	
}
