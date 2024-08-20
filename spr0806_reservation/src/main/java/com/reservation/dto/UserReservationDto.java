package com.reservation.dto;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

public class UserReservationDto {
/*
 * create table user_reservation (
    reservation_number varchar2(20) not null,   --예약(주문)번호 pk (년월일시분초ms)
    user_email varchar2(255) not null,          --유저이메일 fk (예악자)    (users)
    vendor_email varchar2(255) not null,        --사업자이메일 ┐                (vendor)
    business_regi_num varchar2(20),             --사업자번호　 ┴ 복합키 fk       (vendor)
    reservation_date date,                      --이용 예정 년월일
    times varchar2(50),                         --이용 예정 시간 48개단위
    service_name varchar2(255),                 --예약 당시 이용 예정 서비스 이름(service_items)
    service_price number,                       --예약 당시 이용 예정 서비스 가격(service_items)
    zipcode varchar2(10),                       --예약 당시 이용 예정 장소 우편번호(vendor)
    basic_address varchar2(255),                --예약 당시 이용 예정 장소 기본주소(vendor)
    detail_address varchar2(255),               --예약 당시 이용 예정 장소 상세주소(vendor)
    status varchar2(50)                         --주문 상태. 1입금대기/2입금완료/3이용완료/
                                                --       4이용자취소(회원요청,사업자승인필요)/
                                                --       5사업자취소(사업자요청,회원승인불필요)/6환불대기/7환불완료 등 상태
    );
 */
	
	private String reservation_number;
	private String user_email;
	private String vendor_email;
	private String business_regi_num;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDateTime reservation_date;
	private Integer times;
	private String service_name;
	private Integer service_price;
	private String zipcode;
	private String basic_address;
	private String detail_address;
	private String status;
	
	
	
	

	public UserReservationDto() {}
	
	public UserReservationDto(String reservation_number, String user_email, String vendor_email,
			String business_regi_num, LocalDateTime reservation_date, Integer times, String service_name,
			Integer service_price, String zipcode, String basic_address, String detail_address, String status) {
		super();
		this.reservation_number = reservation_number;
		this.user_email = user_email;
		this.vendor_email = vendor_email;
		this.business_regi_num = business_regi_num;
		this.reservation_date = reservation_date;
		this.times = times;
		this.service_name = service_name;
		this.service_price = service_price;
		this.zipcode = zipcode;
		this.basic_address = basic_address;
		this.detail_address = detail_address;
		this.status = status;
	}
	@Override
	public String toString() {
		return "UserReservationDto [reservation_number=" + reservation_number + ", user_email=" + user_email
				+ ", vendor_email=" + vendor_email + ", business_regi_num=" + business_regi_num + ", reservation_date="
				+ reservation_date + ", times=" + times + ", service_name=" + service_name + ", service_price="
				+ service_price + ", zipcode=" + zipcode + ", basic_address=" + basic_address + ", detail_address="
				+ detail_address + ", status=" + status + "]";
	}
	public String getReservation_number() {
		return reservation_number;
	}
	public void setReservation_number(String reservation_number) {
		this.reservation_number = reservation_number;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getVendor_email() {
		return vendor_email;
	}
	public void setVendor_email(String vendor_email) {
		this.vendor_email = vendor_email;
	}
	public String getBusiness_regi_num() {
		return business_regi_num;
	}
	public void setBusiness_regi_num(String business_regi_num) {
		this.business_regi_num = business_regi_num;
	}
	public LocalDateTime getReservation_date() {
		return reservation_date;
	}
	public void setReservation_date(LocalDateTime reservation_date) {
		this.reservation_date = reservation_date;
	}
	public Integer getTimes() {
		return times;
	}
	public void setTimes(Integer times) {
		this.times = times;
	}
	public String getService_name() {
		return service_name;
	}
	public void setService_name(String service_name) {
		this.service_name = service_name;
	}
	public Integer getService_price() {
		return service_price;
	}
	public void setService_price(Integer service_price) {
		this.service_price = service_price;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getBasic_address() {
		return basic_address;
	}
	public void setBasic_address(String basic_address) {
		this.basic_address = basic_address;
	}
	public String getDetail_address() {
		return detail_address;
	}
	public void setDetail_address(String detail_address) {
		this.detail_address = detail_address;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
	
}
