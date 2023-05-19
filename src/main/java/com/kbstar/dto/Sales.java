package com.kbstar.dto;

import lombok.*;

import java.util.Date;
//import org.springframework.format.annotation.DateTimeFormat;


@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString

public class Sales {
//    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private String item_id;
    private int cust_id;
    private int id;
    private Date rdate;
    private int price;
}

