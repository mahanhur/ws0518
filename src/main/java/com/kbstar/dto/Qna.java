package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Qna {
    private int id;
    private String title;
    private String content;
    private Date rdate;
    private int q_id;
    private String cust_id;
    private String adm_id;

    private String question;
    private String answer;
    private String cnt;
    private String waiting;


    public Qna(int id, String question, String answer, String title, String cust_id, Date rdate){
        this.id = id;
        this.question = question;
        this.answer = answer;
        this.title = title;
        this.cust_id = cust_id;
        this.rdate = rdate;
    }

}
