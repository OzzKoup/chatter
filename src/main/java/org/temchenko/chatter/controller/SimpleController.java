package org.temchenko.chatter.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class SimpleController {

    @GetMapping("/hello")
    public String hello() {
        return "Hello, World! New Update 1";
    }
}
