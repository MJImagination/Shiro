package com.mj.service;

import com.mj.mapper.UserMapper;
import com.mj.model.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public interface IUserService {
    public User getUser(Integer id);
}
