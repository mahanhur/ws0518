package com.kbstar.controller;

import com.kbstar.dto.Adm;
import com.kbstar.service.AdmService;
import com.kbstar.service.CustService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
public class MainController {
    @Autowired
    CustService custService;
    @Autowired
    private BCryptPasswordEncoder encoder;
    @Autowired
    AdmService admService;
    @RequestMapping("/")
    public String main() throws Exception {
        return "index";
    };

    @RequestMapping("/chart")
    public String chart(Model model) throws Exception {
        model.addAttribute("center", "chart");
        return "index";
    };
    @RequestMapping("/dashboard")
    public String dashboard(Model model) {
        model.addAttribute("center", "dashboard");
        return "index";
    };
    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("center", "login");
        return "index";
    };
    @RequestMapping("/detail")
    public String detail(Model model) {
        model.addAttribute("center", "detail");
        return "index";
    };
    @RequestMapping("/register")
    public String register(Model model) {
        model.addAttribute("center", "register");
        return "index";
    };
    @RequestMapping("/ws")
    public String ws(Model model) {
        model.addAttribute("center", "ws");
        return "index";
    };
    @RequestMapping("/registerimpl")
    public String registerimpl(Model model, Adm adm, HttpSession session) throws Exception {
        try {
            adm.setPwd(encoder.encode(adm.getPwd()));
            admService.register(adm);
            session.setAttribute("loginadm", adm);
        } catch (Exception e) {
            throw new Exception("registerimpl 시스템 에러");
        }
        return "index";
    };
    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, Adm adm, HttpSession session) throws Exception {
        try {
            adm.setPwd(encoder.encode(adm.getPwd()));
            admService.modify(adm);
            session.setAttribute("loginadm", adm);
        } catch (Exception e) {
            throw new Exception("registerimpl 시스템 에러");
        }
        return "index";
    };

    @RequestMapping("/loginimpl")
    public String loginimpl(Model model, String id, String pwd, HttpSession session) throws Exception {
        Adm adm = null;
        String nextPage = "loginfail";
        try {
            adm = admService.get(id);
            if(adm != null) {
                if(adm != null && encoder.matches(pwd, adm.getPwd())) {
                    nextPage = "center";
                    session.setMaxInactiveInterval(600000);
                    session.setAttribute("loginadm", adm);
                    log.info("----------------------------------------------------------------------------------");
                    log.info(adm.toString());
                }
            } else {
                log.info("불일치");
            }
        } catch (Exception e) {
            throw new Exception("loginimpl 에러");
        }
        model.addAttribute("center", nextPage);
        return "index";
    };
    @RequestMapping("/logoutimpl")
    public String logout(Model model, HttpSession session) {
        if( session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }

}
