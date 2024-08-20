package com.reservation.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.dao.VendorReservationDao;
import com.reservation.dto.VendorReservationDto;

@Service
public class VendorReservationServiceImpl implements VendorReservationService{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(VendorReservationDto dto) throws Exception {
		VendorReservationDao vDao = sqlSession.getMapper(VendorReservationDao.class);
		vDao.insert(dto);	//영업'일','시' 추가
	}


	@Override
	public VendorReservationDto selectAllEnableVendorsReservation(String email, String business_regi_num)
			throws Exception {
		VendorReservationDao vDao = sqlSession.getMapper(VendorReservationDao.class);
		return vDao.selectAllEnableVendorsReservation(email, business_regi_num);
	}

	@Override
	public VendorReservationDto selectOneVendorsReservation(VendorReservationDto dto)
			throws Exception {
		VendorReservationDao vDao = sqlSession.getMapper(VendorReservationDao.class);
		return vDao.selectOneVendorsReservation(dto);
	}


		
		
}
