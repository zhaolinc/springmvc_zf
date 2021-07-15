package com.lanqiao.service.impl;

import com.lanqiao.domain.House;
import com.lanqiao.service.IHouseService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;
@ContextConfiguration("classpath:applicationContext.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class HouseServiceImplTest {
    @Autowired
    IHouseService houseService;

    @Test
    public void selectForPage() {
        List<House> houses = houseService.selectForPage(1, 5);
        houses.forEach(h-> System.out.println(h));
    }
}