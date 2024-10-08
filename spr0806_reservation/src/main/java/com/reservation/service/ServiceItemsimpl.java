package com.reservation.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.reservation.dao.IMainDao;
import com.reservation.dao.ServiceItemsDao;
import com.reservation.dto.ImageDto;
import com.reservation.dto.MainDto;
import com.reservation.dto.ServiceItemsDto;

@Service
public class ServiceItemsimpl implements IServiceItemsService {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertServiceItem(ServiceItemsDto dto) throws Exception {
		ServiceItemsDao itemDao = sqlSession.getMapper(ServiceItemsDao.class);
		itemDao.insertMyItem(dto);

	}

	@Override
	public ArrayList<ServiceItemsDto> selectMyItems(ServiceItemsDto dto) throws Exception {
		ServiceItemsDao itemDao = sqlSession.getMapper(ServiceItemsDao.class);

		return itemDao.selectMyItems(dto);
	}

	@Override
	public ServiceItemsDto selectOneMyItem(ServiceItemsDto dto) throws Exception {
		ServiceItemsDao itemDao = sqlSession.getMapper(ServiceItemsDao.class);
		return itemDao.selectOneMyItem(dto);
	}

	@Override
	public void updateMyItem(ServiceItemsDto dto) throws Exception {
		ServiceItemsDao itemDao = sqlSession.getMapper(ServiceItemsDao.class);
		itemDao.updateMyItem(dto);

	}

	@Override
	public void deleteMyItem(ServiceItemsDto dto) throws Exception {
		ServiceItemsDao itemDao = sqlSession.getMapper(ServiceItemsDao.class);
		itemDao.deleteMyItem(dto);

	}
	@Override
	public void insertItemImg(ImageDto dto) throws Exception{
		ServiceItemsDao itemDao = sqlSession.getMapper(ServiceItemsDao.class);
		itemDao.insertItemImg(dto);
		
	}

}
