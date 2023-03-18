package com.model2.mvc.service.domain;

import java.sql.Date;


public class Inquiry {
	
	private User inquirerId;
	private Purchase purchaseNo;
	private int inquiryNo;
	private String inquiryOption;
	private String title;
	private String content;
	private String answerStatus;
	private Date postDate;
	
	public Inquiry(){
	}
	
	
	public User getInquirerId() {
		return inquirerId;
	}


	public void setInquirerId(User userId) {
		this.inquirerId = userId;
	}


	public Purchase getPurchaseNo() {
		return purchaseNo;
	}


	public void setPurchaseNo(Purchase purchaseNo) {
		this.purchaseNo = purchaseNo;
	}


	public int getInquiryNo() {
		return inquiryNo;
	}


	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}



	public String getInquiryOption() {
		return inquiryOption;
	}


	public void setInquiryOption(String inquiryType) {
		this.inquiryOption = inquiryType;
	}




	public String getInquiryTitle() {
		return title;
	}




	public void setInquiryTitle(String inquiryTitle) {
		this.title = inquiryTitle;
	}




	public String getInquiryContent() {
		return content;
	}




	public void setInquiryContent(String inquiryContent) {
		this.content = inquiryContent;
	}




	public String getAnswerStatus() {
		return answerStatus;
	}




	public void setAnswerStatus(String answerStatus) {
		this.answerStatus = answerStatus;
	}




	public Date getPostDate() {
		return postDate;
	}




	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}




	@Override
	public String toString() {
		return "Inquiry [userId=" + inquirerId + ", purchaseNo=" + purchaseNo + ", inquiryNo=" + inquiryNo
				+ ", inquiryOption=" + inquiryOption + ", inquiryTitle=" + title + ", inquiryContent="
				+ content + ", answerStatus=" + answerStatus + ", postDate=" + postDate + "]";
	}
	

}