package com.org;
import java.util.HashMap;

import com.org.*;

public class User {
	public static HashMap<String,User> userList = new HashMap<>(); 
	public static HashMap<String,String> map = new HashMap<>();    
	public static int count = 0;
	public String uname;
	public String id;
	public String email;
	public long wallet;
	public long phNum;
	public String address;
	private String password;
	public int borrowLimit;
	public int numBooksPub;
	public HashMap<Integer,Request> requestList = new HashMap<>();
	public HashMap<Integer,Request> sentRequests = new HashMap<>();
	public HashMap<Integer,Book> borrowedBooks = new HashMap<>();
	
	public void addToMap() {
		map.put(this.uname,this.password);
	}
	
	public static boolean checkUnamePass(String x,String y) {
		if(map.containsKey(x)) {
			if(map.get(x).equals(y)) return true;
		}
		return false;
	}
	
	public User(String uname,String id,String email, long phNum,String address,String password) {
		this.uname = uname;
		this.id = id;
		this.email = email;
		this.phNum = phNum;
		this.address = address;
		this.password = password;
		this.wallet = 100;
		this.numBooksPub = 0;
		this.borrowLimit = 5;
	}

	public void changePassword(String newPassword) {
		this.password = newPassword;
	}
}
