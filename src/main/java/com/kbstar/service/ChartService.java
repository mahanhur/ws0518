package com.kbstar.service;

import com.kbstar.dto.Chart;
import com.kbstar.dto.Chart2;
import com.kbstar.dto.Chart3;
import com.kbstar.mapper.ChartMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Slf4j
@Service
public class ChartService {

    @Autowired
    ChartMapper chartMapper;
    public List<Chart> getMonthlyTotal() throws Exception{
        return chartMapper.getMonthlyTotal();
    }
    public List<Chart2> getCateTotal() throws Exception{
        return chartMapper.getCateTotal();
    }
    public List<Chart3> getAgeTotal() throws Exception{
        return chartMapper.getAgeTotal();
    }
}
