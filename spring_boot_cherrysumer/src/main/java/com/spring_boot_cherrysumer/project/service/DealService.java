package com.spring_boot_cherrysumer.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.spring_boot_cherrysumer.project.dao.IDealDAO;
import com.spring_boot_cherrysumer.project.model.DealVO;
import com.spring_boot_cherrysumer.project.model.MypageVO;
import com.spring_boot_cherrysumer.project.model.PictureVO;

@Service
public class DealService implements IDealDAO {
	@Autowired
	@Qualifier("IDealDAO")
	private IDealDAO dao;
	
	@Override
	public PictureVO DealCheck(String picNo) {
		
		
		return dao.DealCheck(picNo);
	}
	
	@Override
	public MypageVO Dealinfo(String memId) {
		
		return dao.Dealinfo(memId);
	}

	@Override
	public void insertdeal(DealVO vo ) {
	
		dao.insertdeal(vo);
		
	}
}