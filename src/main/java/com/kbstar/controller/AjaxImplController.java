package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.dto.Chart;
import com.kbstar.dto.Chart2;
import com.kbstar.dto.Chart3;
import com.kbstar.service.AdmService;
import com.kbstar.service.ChartService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.List;

@Slf4j
@RestController
public class AjaxImplController {
    @Autowired
    AdmService admService;
    @Autowired
    ChartService chartService;


    @RequestMapping("/checkid")
    public Object checkid(String id) throws Exception{
        int result = 0;
        Adm adm = null;
        adm = admService.get(id);

        if(adm != null) {
            result=1;
        }
        return result;
    }
    @RequestMapping("/chart01")
    public Object chart01(Chart chart) throws Exception{
        List<Chart> list = chartService.getMonthlyTotal();
        JSONArray fma = new JSONArray();
        JSONArray ma = new JSONArray();

        for(Chart c:list) {
            if(c.getGender().toUpperCase().equals("F")) {
                fma.add(c.getTotal());
            } else {
                ma.add(c.getTotal());
            }
        };
        JSONObject fmo = new JSONObject();
        JSONObject mo = new JSONObject();
        fmo.put("name", "Female");
        fmo.put("data", fma);
        mo.put("name", "Male");
        mo.put("data", ma);
        JSONArray data = new JSONArray();
        data.add(fmo);
        data.add(mo);

        return data;

    }
    @RequestMapping("/chart02")
    public Object chart02(Chart2 chart2) throws Exception{
        List<Chart2> list = chartService.getCateTotal();

        JSONArray ja = new JSONArray();
        JSONObject jo1 = new JSONObject();
        JSONObject jo2 = new JSONObject();
        JSONObject jo3 = new JSONObject();


        for(Chart2 c:list) {
            if(c.getTopcate() == 100) {
                jo1.put("name","상의");
                jo1.put("y",c.getTotal());
            } else if(c.getTopcate() == 200){
                jo2.put("name","하의");
                jo2.put("y",c.getTotal());
            }
            else if(c.getTopcate() == 300) {
                jo3.put("name","신발");
                jo3.put("y",c.getTotal());
            }
        };

        ja.add(jo1);
        ja.add(jo2);
        ja.add(jo3);

        return ja;

    }
    @RequestMapping("/chart03")
    public Object chart03(Chart3 chart3) throws Exception{
        List<Chart3> list = chartService.getAgeTotal();

        JSONArray ja = new JSONArray();
        for(Chart3 c:list) {
            ja.add(c.getTotal());
        };
        return ja;

    }



}


