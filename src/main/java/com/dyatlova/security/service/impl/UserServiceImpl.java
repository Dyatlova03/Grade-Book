package com.dyatlova.security.service.impl;

import com.dyatlova.security.dao.RoleDao;
import com.dyatlova.security.dao.UserDao;
import com.dyatlova.security.service.UserService;
import com.dyatlova.security.model.Role;
import com.dyatlova.security.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {

    @Override
    public void save(User user) {

    }

    @Override
    public User findByUsername(String username) {
        return null;
    }
}
