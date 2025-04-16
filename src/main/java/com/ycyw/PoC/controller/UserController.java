package com.ycyw.PoC.controller;

import java.util.Collection;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ycyw.PoC.model.User;

@RestController
@RequestMapping("/api")
public class UserController {

    private Map<String, User> users = new ConcurrentHashMap<>();

    @PostMapping("/login")
    public ResponseEntity<User> login(@RequestBody Map<String, String> body) {
        String username = body.get("username");
        String type = body.get("type");
        User user = new User(username, type);
        users.put(username, user);
        return ResponseEntity.ok(user);
    }

    @GetMapping("/users")
    public Collection<User> getUsers() {
        return users.values();
    }
}