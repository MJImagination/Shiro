package com.mj.service.impl;

import com.mj.mapper.UserMapper;
import com.mj.model.User;
import com.mj.service.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements IUserService {
    @Resource
    private UserMapper userMapper;

    public User getUser(Integer id) {
      ;
        return   userMapper.selectByPrimaryKey(Long.valueOf(id));
    }
}
