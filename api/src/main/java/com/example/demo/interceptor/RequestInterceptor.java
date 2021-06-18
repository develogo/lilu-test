package com.example.demo.interceptor;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.auth.FirebaseToken;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RequestInterceptor implements HandlerInterceptor {
    private final Logger LOG = LoggerFactory.getLogger(RequestInterceptor.class);


    @CrossOrigin
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        LOG.info("Pre Request");

        //FirebaseToken decodedToken = FirebaseAuth.getInstance().verifyIdTokenAsync(idToken).get();

        if(request.getHeader("Authorization") ==null){
            response.setContentType("application/json");
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("{\"success\": false,\"payload\": [],\"message\" : \"Token is required\"}");
            return false;
        }else {
            try {
                FirebaseToken decodedToken = FirebaseAuth.getInstance().verifyIdTokenAsync(request.getHeader("Authorization")).get();
                return HandlerInterceptor.super.preHandle(request, response, handler);
            } catch (Exception e){
                response.setContentType("application/json");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.getWriter().write("{\"success\": false,\"payload\": [],\"message\" : \"Invalid Token\"}");
                return false;
            }
        }

        //return false;
    }

    @CrossOrigin
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        LOG.info("Post Request");

        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @CrossOrigin
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        LOG.info("After Request");

        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
