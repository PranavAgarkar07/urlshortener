package com.wit.shorturl.controller;

import com.wit.shorturl.dao.UrlDao;
import com.wit.shorturl.model.Url;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

// The heart of the project. Unit-II: sendRedirect.
// Teacher line: "GET /s/abc123 finds long URL and redirects, clicks+1."
@Controller
public class RedirectController {

    @Autowired
    private UrlDao dao;

    @GetMapping("/s/{code}")
    public String go(@PathVariable String code) {
        Url u = dao.findByCode(code);
        if (u == null) return "redirect:/?missing=" + code;
        dao.addClick(u);
        return "redirect:" + u.getLongUrl(); // 302 redirect to original site
    }
}
