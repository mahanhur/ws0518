package com.kbstar.service;

import com.kbstar.dto.Qna;
import com.kbstar.frame.KBService;
import com.kbstar.mapper.QnaMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class QnaService implements KBService<Integer, Qna> {
    @Autowired
    QnaMapper mapper;

    @Override
    public void register(Qna qna) throws Exception {
        mapper.insert(qna);
    }

    @Override
    public void remove(Integer s) throws Exception {
        mapper.delete(s);
    }

    @Override
    public void modify(Qna qna) throws Exception {
        mapper.update(qna);
    }

    @Override
    public Qna get(Integer s) throws Exception {
        return mapper.select(s);
    }

    public Qna count() throws Exception {
        return mapper.count();
    }

    @Override
    public List<Qna> get() throws Exception {
        return mapper.selectall();
    }

}
