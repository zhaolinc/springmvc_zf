package com.lanqiao.domain;

import lombok.Data;
import lombok.ToString;

/**
 * @author 赵林
 * @date 2021/7/14 7:48
 **/
@Data
@ToString
public class UserInfo {
    private Integer userId;
    private String username;
    private String password;
    private String tel;
    private String email;
}
