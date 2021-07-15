package com.lanqiao.controller;

import com.lanqiao.domain.UserInfo;
import com.lanqiao.service.IUserInfoService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @author 赵林
 * @date 2021/7/12 20:55
 **/
@Controller
@RequestMapping("/user")
@Slf4j
public class UserController {
    @Autowired
    IUserInfoService userInfoService;

    @RequestMapping(value = "/login")
    public String login(UserInfo userInfo, HttpSession session, HttpServletRequest request){ //login(@RequestParam("username") String username, String password)

        log.debug(userInfo.getUsername()+","+userInfo.getPassword());

        UserInfo logUser = this.userInfoService.selectForLogin(userInfo);
        /*
         只要返回的字符串带有前缀：forward: 或 redirect: 视图解析器失效（不解析）
         所以此时返回的字符必须是一个从WEB ROOT开始的一个完整路径
         return "forward:/views/test.jsp";                    //转发到页面
         return "forward:/user/login";                        //转发到控制器方法
         return "redirect:/views/test.jsp?paramName=james"; //重定向到页
         return "redirect:/user/login?paramName=james";     //重定向的控制器的方法
        */

        if (logUser!=null){
            session.setAttribute("logUser",logUser);
        }else {
            return "redirect:/login_form.jsp";
        }
        return "redirect:/house/select_for_page";
    }
}
