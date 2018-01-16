package com.mj.controller;
import com.mj.service.IUserService;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;
@Controller
@RequestMapping("/user")
public class UserController {
    @Resource
    private IUserService userService;
    private Logger logger = Logger.getLogger(UserController.class);

    @RequestMapping("/index")
    public String index(){
        logger.info("请求成功!");
        soutAAA();
//        System.out.println(userService.getUser(1));
        return "index";
    }

    public void soutAAA(){
        System.out.println("FDFDsss");
    }

//    //用户登录
//    @ResponseBody
//    @RequestMapping("/login")
//    public String login(User user, HttpServletRequest request) {
//        Subject subject = SecurityUtils.getSubject();
//        UsernamePasswordToken token = new UsernamePasswordToken(user.getLoginName(), user.getPassword());
//        try{
//            subject.login(token);//会跳到我们自定义的realm中
//            request.getSession().setAttribute("user", user);
//            return "success";
//        }catch(Exception e){
//            e.printStackTrace();
//            request.getSession().setAttribute("user", user);
//            request.setAttribute("error", "用户名或密码错误！");
//            return "login";
//        }
//    }
//
//
//
//




    @RequestMapping("/find")
    @ResponseBody
    public Map<String,Object> find(HttpServletRequest request){

        Map<String,Object> map = new HashMap<String, Object>();
        System.out.println("你已通过springMVC进入controller方法。。。。");
        logger.info("你已通过springMVC进入controller方法。。。。");
//        User loginuser = userService.findByUsernameAndPwd(user.getUsername(),user.getPassword());
//        if(loginuser != null){
//            map.put("result","success");
//        }else {
//            map.put("result","fail");
//        }
        return map;
    }

    @RequestMapping("/success")
    public String success(){
        System.out.println("登录成功。。。。");
        logger.info("登录成功。。。。");

        return "success";
    }

}
