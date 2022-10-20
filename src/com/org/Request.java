package com.org;

public class Request {
	public static int count = 0;
	public int requestID;
	public String requestingUserName;
	public String recievingUserName;
	public int requestedBookID;
	public String approvalStatus;
	
	public Request(int requestID,String requestingUserName,String recievingUserName,int bookID) {
		this.requestID = requestID;
		this.recievingUserName = recievingUserName;
		this.requestedBookID = bookID;
		this.requestingUserName = requestingUserName;
		this.approvalStatus = "pending";
	}
}
