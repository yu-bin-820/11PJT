package com.model2.mvc.service.domain;

import java.sql.Date;


public class Inquiry {
	
	private User inquirer;
	private Purchase inquiryyPurchase;
	private Product inquiryProd;
	private int inquiryNo;
	private String inquiryOption;
	private String title;
	private String content;
	private String answerStatus;
	private Date postDate;
	
	public Inquiry(){
	}
	


	public User getInquirer() {
		return inquirer;
	}



	public void setInquirer(User inquirer) {
		this.inquirer = inquirer;
	}



	public Purchase getInquiryyPurchase() {
		return inquiryyPurchase;
	}



	public void setInquiryyPurchase(Purchase inquiryyPurchase) {
		this.inquiryyPurchase = inquiryyPurchase;
	}



	public Product getInquiryProd() {
		return inquiryProd;
	}



	public void setInquiryProd(Product inquiryProd) {
		this.inquiryProd = inquiryProd;
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
		return "Inquiry [inquirer=" + inquirer + ", inquiryyPurchase=" + inquiryyPurchase + ", inquiryProd="
				+ inquiryProd + ", inquiryNo=" + inquiryNo + ", inquiryOption=" + inquiryOption + ", title=" + title
				+ ", content=" + content + ", answerStatus=" + answerStatus + ", postDate=" + postDate + "]";
	}



	

}