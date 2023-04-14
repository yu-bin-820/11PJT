package com.model2.mvc.service.inquiry;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Inquiry;
import com.model2.mvc.service.domain.Purchase;

public interface InquiryDao {
	
	public List<Inquiry> getInquiryList(Search search, String userId) throws Exception;
	
	public int getTotalCount(Search search, String userId) throws Exception;
	
}
