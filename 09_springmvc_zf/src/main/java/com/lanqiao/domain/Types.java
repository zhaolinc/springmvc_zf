package com.lanqiao.domain;

import java.io.Serializable;
import lombok.Data;
import lombok.ToString;

/**
 * 出租类型表
 * @TableName types
 */
@Data
@ToString
public class Types implements Serializable {
    private Integer id;
    private String name;
}