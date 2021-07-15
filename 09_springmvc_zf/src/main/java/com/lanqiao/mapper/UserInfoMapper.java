package com.lanqiao.mapper;

import com.lanqiao.domain.UserInfo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserInfoMapper {
    /**
     * 登录
     * @param userInfo
     * @return
     */
    public UserInfo selectForLogin(UserInfo userInfo );
}
