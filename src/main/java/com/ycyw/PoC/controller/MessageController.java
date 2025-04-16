package com.ycyw.PoC.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.ycyw.PoC.model.Message;

@Controller
public class MessageController {

    private List<Message> messages = new CopyOnWriteArrayList<>();

    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    @MessageMapping("/chat")
    public void processMessage(@Payload Message message) {
        message.setTimestamp(LocalDateTime.now());
        messages.add(message);
        messagingTemplate.convertAndSend("/topic/messages/" + message.getToUser(), message);
    }

}