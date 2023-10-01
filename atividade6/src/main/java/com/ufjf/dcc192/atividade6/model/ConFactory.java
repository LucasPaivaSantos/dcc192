/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ufjf.dcc192.atividade6.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author anastacia
 */
public class ConFactory {

    public static final int MYSQL = 0;
    public static final int JavaDB = 1;

    public static Connection conexao(String nome, String senha,
            int banco) throws ClassNotFoundException, SQLException {
        switch (banco) {
            case MYSQL:
                Class.forName("org.gjt.mm.mysql.Driver");
                return DriverManager.getConnection("jdbc:mysql://localhost:3306/semana5?zeroDateTimeBehavior=convertToNull", nome, senha);
            case JavaDB:
                Class.forName("org.apache.derby.jdbc.ClientDriver");
                return DriverManager.getConnection("jdbc:derby://localhost:1527/semana5", nome, senha);
        }
        return null;
    }
}
