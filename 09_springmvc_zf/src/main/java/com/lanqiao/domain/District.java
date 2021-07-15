package com.lanqiao.domain;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

/**
 * 出租类型表
 * @TableName types
 */
@Data
@ToString
public class District implements Serializable {
    private Integer id;
    private String name;
}