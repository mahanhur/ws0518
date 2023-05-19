package com.kbstar.controller;

import com.kbstar.dto.Item;
import com.kbstar.service.ItemService;
import com.kbstar.util.FileUploadUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Slf4j /*로그 찍는 골뱅이 이거 넣으면 log.info 사용가능 */
@Controller
@RequestMapping("/item") // /cust를 넣음으으로 기본적으로 주소에 /cust가 셋팅됨
public class ItemController {
    @Autowired
    ItemService itemService;
    String dir = "item/";
    @Value("${uploadimgdir}") /*이미지 저장경로*/
    String imgdir;

    @RequestMapping("")
    public String all(Model model) throws Exception {
        List<Item> list = null;
        list = itemService.get();
        model.addAttribute("ilist",list);
        model.addAttribute("center",dir+"item");
        return "index";
    }

    @RequestMapping("/addimpl")
    public String addimpl(Model model, Item item) throws Exception {
        MultipartFile mf = item.getImg();
        log.info(mf.getOriginalFilename());
        String imgname = mf.getOriginalFilename();
        log.info("---------------------------------------------------------------------");
        log.info(imgname);
        log.info("---------------------------------------------------------------------");
        item.setImgname(imgname);
        itemService.register(item);
        FileUploadUtil.saveFile(mf,imgdir);
        return "redirect:/item";
    }

    @RequestMapping("/detail")
    public String detail(Model model, int id) throws Exception {
        Item item = null;
        item = itemService.get(id);
        model.addAttribute("gitem",item);
        model.addAttribute("center",dir+"itemdetail");
        return "index";
    }

    @RequestMapping("/deleteimpl")
    public String delete(Model model,int id) throws Exception {
        itemService.remove(id);
        model.addAttribute("center",dir+"itemdetail");
        return "redirect:/item";
    }

    @RequestMapping("/updateimpl")
    public String updateimpl(Model model, Item item) throws Exception {
        MultipartFile mf = item.getImg();
        String new_imgname = mf.getOriginalFilename();

        if(new_imgname.equals("") || new_imgname == null){
            itemService.modify(item);
        }else{
            item.setImgname(new_imgname);
            itemService.modify(item);
            FileUploadUtil.saveFile(mf,imgdir);
        }
/*        if(!imgname.equals("") || imgname != null){
            item.setImgname(imgname);
            FileUploadUtil.saveFile(mf,imgdir);
        }
        itemService.modify(item);*/
        return "redirect:/item/detail?id="+item.getId();
    }
}