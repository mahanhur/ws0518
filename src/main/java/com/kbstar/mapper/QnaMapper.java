package com.kbstar.mapper;

import com.kbstar.dto.Qna;
import com.kbstar.frame.KBMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface QnaMapper extends KBMapper<Integer, Qna> {
    public Qna count();
}
