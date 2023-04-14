package com.model2.mvc.service.inquiry;

import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Purchase;

public interface InquiryService {
	
	
	public Map<String, Object> getInquiryList(Search search, String userId) throws Exception ;
		
	
	
}
