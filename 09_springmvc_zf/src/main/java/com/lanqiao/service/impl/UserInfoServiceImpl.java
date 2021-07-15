package com.lanqiao.service.impl;

import com.lanqiao.domain.UserInfo;
import com.lanqiao.mapper.UserInfoMapper;
import com.lanqiao.service.IUserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 赵林
 * @date 2021/7/14 8:07
 **/
@Service("userInfoService")
public class UserInfoServiceImpl implements IUserInfoService {
    //注入mybatis映射器接口。，从而完成数据库访问
    @Autowired
    UserInfoMapper userInfoMapper;
    /**
     * 登录
     * @param userInfo
     * @return
     */
    @Override
    public UserInfo selectForLogin(UserInfo userInfo) {
        return this.userInfoMapper.selectForLogin(userInfo);
    }
}
