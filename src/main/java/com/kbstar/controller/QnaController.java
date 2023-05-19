package com.kbstar.controller;


import com.kbstar.dto.Qna;
import com.kbstar.service.QnaService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/qna")
public class QnaController {
    @Autowired
    QnaService qnaService;
    String dir = "qna/";

    @RequestMapping("")
    public String all(Model model) throws Exception {
        List<Qna> list = null;
        list = qnaService.get();
        Integer cnt = null;
        Qna qna = null;
        qna = qnaService.count();
        model.addAttribute("qlist",list);
        model.addAttribute("qna",qna);
        model.addAttribute("center",dir+"qna");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model,int id) throws Exception {
        Qna qna = null;
        qna = qnaService.get(id);
        model.addAttribute("gqna",qna);
        model.addAttribute("center",dir+"qnadetail");
        return "index";
    }

    @RequestMapping("/answerimpl")
    public String answerimpl(Model model, Qna qna) throws Exception {
        qnaService.register(qna);
        return "redirect:/qna/detail?id="+qna.getQ_id();
    }
}
