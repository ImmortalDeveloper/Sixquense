package com.web.accompany.model.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class AccompanyDTO {
	private int accompanyNo;
	private String accompanyTitle;
	private String accompanyContent;
	private int accompanyCount;
	private Date accompanyDate;
	private int memberNo;
	private String userId ; //user 아이디 가져오기 
	private int accompanyReadCount;
	private Coordinate coordinate;//좌표 번호 
	private String openChattingLink;
	private String originalFilename; //첨부 파일불러오기
	private String renameFilename; //첨부 파일불러오기
	private String accompanyStatus;
	private List <AccompanyOffer> AcOffer = new ArrayList();
	private String renameProfilename;
	private String userIntroduce;
	
	
}

