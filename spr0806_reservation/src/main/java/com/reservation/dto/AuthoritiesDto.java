package com.reservation.dto;

public class AuthoritiesDto {
	private String email;
	private String authority;
	
	public AuthoritiesDto() {}
	
	public AuthoritiesDto(String email, String authority) {
		super();
		this.email = email;
		this.authority = authority;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getAuthority() {
		return authority;
	}
	
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	@Override
	public String toString() {
		return "AuthoritiesDto [email=" + email + ", authority=" + authority + "]";
	}
	
	
	
	
}