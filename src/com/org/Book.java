package com.org;

import java.util.*;
import java.sql.Timestamp;

public class Book { 
	public static HashMap<Integer,Book> bookList = new HashMap<>();
	public static int count = 0;
	public String bookName;
	public int bookID;
	public String author;
	public String edition;
	public int year;
	public String borrowedStatus;
	public Date date;
	public String publishedBy;
	public Book(String bname, String author, String edition, int year,String uname) {
		this.bookName = bname;
		this.author = author;
		this.edition = edition;
		this.year = year;
		this.publishedBy = uname;
		count = count + 1;
		this.bookID = count;
		this.borrowedStatus = "Available";
	}
}
