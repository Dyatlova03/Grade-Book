package com.dyatlova.security.service;

import com.dyatlova.security.model.User;

public interface UserService {

    void save (User user);

    User findByUsername(String username);
}
