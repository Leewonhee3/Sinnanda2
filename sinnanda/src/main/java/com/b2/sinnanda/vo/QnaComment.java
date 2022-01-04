package com.b2.sinnanda.vo;

import lombok.Data;

@Data
public class QnaComment {
	private int qnaNo;
	private int adminNo;
	private String qnaCommentContent;
	private String commentDate;
}
