package com.lanqiao.domain;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;
import java.util.Date;

/**
 * 出租信息表
 * @TableName house
 */
@Data
@ToString
public class House implements Serializable {

    private Integer id;
    private Integer userId;
    private Integer streetId;
    private Integer typeId;
    private Integer room;
    private Integer hall;
    private String title;
    private String description;
    private Integer price;
    private Date pubdate;
    private String telephone;
    private String contact;
    private Types types;
    private Street street;
}