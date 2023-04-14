package com.model2.mvc.service.inquiry.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Inquiry;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.inquiry.InquiryDao;
import com.model2.mvc.service.inquiry.InquiryService;
import com.model2.mvc.service.product.ProductDao;
import com.model2.mvc.service.product.ProductService;

@Service("inquiryServiceImpl")
public class InpuiryServiceImpl implements InquiryService {

	///Field
	@Autowired
	@Qualifier("inquiryDaoImpl")
	private InquiryDao inquiryDao;
	
	public void setInquiryDao(InquiryDao inquiryDao) {
		this.inquiryDao = inquiryDao;
	}
	
	//Constructor
	public InpuiryServiceImpl() {
		System.out.println(this.getClass());
	}



	@Override
	public Map<String, Object> getInquiryList(Search search, String userId) throws Exception {
		List<Inquiry> list= inquiryDao.getInquiryList(search, userId);
		int totalCount = inquiryDao.getTotalCount(search, userId);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list );
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}


}
