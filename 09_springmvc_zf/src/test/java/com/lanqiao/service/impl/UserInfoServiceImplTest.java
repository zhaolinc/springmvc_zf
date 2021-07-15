package com.lanqiao.service.impl;

import com.lanqiao.domain.UserInfo;
import com.lanqiao.service.IUserInfoService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class UserInfoServiceImplTest {
    @Autowired
    IUserInfoService userInfoService;
    @Test
    public void selectForLogin() {
        UserInfo userInfo = new UserInfo();
        userInfo.setUsername("admin");
        userInfo.setPassword("admin");
        UserInfo logUser = this.userInfoService.selectForLogin(userInfo);
        System.out.println(logUser);
    }
}