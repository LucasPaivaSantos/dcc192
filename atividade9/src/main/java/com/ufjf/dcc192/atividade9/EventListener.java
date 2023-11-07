/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ufjf.dcc192.atividade9;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.http.HttpSessionAttributeListener;
import jakarta.servlet.http.HttpSessionBindingEvent;
import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

/**
 * Web application lifecycle listener.
 *
 * @author ciro
 */
public class EventListener implements ServletContextListener, HttpSessionListener, HttpSessionAttributeListener {

    public void incrementUserCount(ServletContext context) {
        Integer userCount = (Integer) context.getAttribute("userCount");
        if (userCount == null) {
            userCount = 0;
        }
        userCount++;
        context.setAttribute("userCount", userCount);
    }

    public void decrementUserCount(ServletContext context) {
        Integer userCount = (Integer) context.getAttribute("userCount");
        if (userCount != null && userCount > 0) {
            userCount--;
            context.setAttribute("userCount", userCount);
        }
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println(">>> Context Initialized");
        if (sce.getServletContext() == null) {
            sce.getServletContext().setAttribute("userCount", 0); // Inicializa o contador
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        System.out.println(">>> Context Destroyed");
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        System.out.println(">>> Session Created");
        // incrementUserCount(se.getSession().getServletContext());
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        System.out.println(">>> Session Destroyed");
        decrementUserCount(se.getSession().getServletContext());
        //   decrementUserCount(se.getSession().getServletContext());
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent event) {
        System.out.println(">>> Attribute Added: " + event.getName());
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent event) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        System.out.println(">>> Attribute Removed: " + event.getName());
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent event) {
        System.out.println(">>> AttributeReplaced: " + event.getName());
    }
}
