package com.ycyw.PoC.model;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Message {
    private String fromUser;
    private String toUser;
    private String content;
    private LocalDateTime timestamp;
}