package com.eoi.servicios;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conexion {

	private static conexion instancia;
	private Connection connection;
	private String url = "jdbc:mysql://localhost:3306/keepmypet?useSSL=false&serverTimezone=UTC";

	private String username = "root";

	private String password = "1234";

	private conexion() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			this.connection = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException ex) {
			System.out.println("Conexion a BD incorrecta : " + ex.getMessage());
		}
	}

	public Connection getConnection() {
		return connection;
	}

	public static conexion getInstance() throws SQLException {
		if (instancia == null) {
			instancia = new conexion();
		} else if (instancia.getConnection().isClosed()) {
			instancia = new conexion();
		}

		return instancia;
	}
}
