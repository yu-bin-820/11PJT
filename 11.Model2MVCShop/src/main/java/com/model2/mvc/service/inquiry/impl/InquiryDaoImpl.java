package com.model2.mvc.service.inquiry.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Inquiry;
import com.model2.mvc.service.inquiry.InquiryDao;

@Repository("inquiryDaoImpl")
public class InquiryDaoImpl implements InquiryDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession ;
	}
	
	///Constructor
	public InquiryDaoImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public List<Inquiry> getInquiryList(Search search, String userId) throws Exception {
		
		Map<String , Object>  map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("search", search);
		return sqlSession.selectList("InquiryMapper.getInpuiryList", map);
	}

	@Override
	public int getTotalCount(Search search, String userId) throws Exception {

		Map<String , Object>  map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("search", search);
		return sqlSession.selectOne("InquiryMapper.getTotalCount", map);
	}

}
