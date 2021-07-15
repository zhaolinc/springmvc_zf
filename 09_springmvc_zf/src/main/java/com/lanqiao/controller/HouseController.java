package com.lanqiao.controller;

import com.github.pagehelper.Page;
import com.lanqiao.domain.House;
import com.lanqiao.service.IHouseService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author 赵林
 * @date 2021/7/14 10:30
 **/
@Controller
@RequestMapping("/house")
@Slf4j
public class HouseController {
    @Autowired
    IHouseService houseService;

    /**
     * @param modelMap -一个map结构，作用域与请求（HttpServletRequest）相当
     * @return
     */
    @RequestMapping("/select_for_page")
    public String selectForPage(ModelMap modelMap,Integer pageNum){
        if (pageNum==null){
            pageNum=1;
        }
        Page<House> houseList = this.houseService.selectForPage(pageNum, 5);
        //相当于把数据存入HttpServletRequest
        modelMap.addAttribute("houseList",houseList);
        return "list";
    }

    @RequestMapping("/viewdetail/{id}")
    public String viewDetail(ModelMap modelMap,@PathVariable Integer id){
        House house = houseService.findById(id);
        System.out.println(house);
        modelMap.addAttribute("h",house);
        return "detail";
    }
}
