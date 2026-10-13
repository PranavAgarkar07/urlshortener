package com.wit.shorturl.service;

import org.springframework.stereotype.Service;
import java.util.UUID;

// Simple code generator. Teacher explanation:
// "We take random string and keep first 6 chars, like abc123."
@Service
public class ShortCode {

    private static final String CHARS =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

    public String next() {
        // UUID gives random text, we map it to 6 Base62 chars
        UUID u = UUID.randomUUID();
        long v = Math.abs(u.getMostSignificantBits());
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 6; i++) {
            sb.append(CHARS.charAt((int) (v % 62)));
            v /= 62;
            if (v == 0) v = Math.abs(UUID.randomUUID().getLeastSignificantBits()) + 62;
        }
        return sb.toString();
    }
}
