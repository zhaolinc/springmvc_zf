package com.lanqiao.domain;

import lombok.Data;
import lombok.ToString;

/**
 * @author 赵林
 * @date 2021/7/15 8:43
 **/
@Data
@ToString
public class Street {
    private Integer id;
    private String name;
    private District district;
}
