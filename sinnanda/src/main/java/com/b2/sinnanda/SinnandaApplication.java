package com.b2.sinnanda;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
@ServletComponentScan
public class SinnandaApplication {

	public static void main(String[] args) {
		SpringApplication.run(SinnandaApplication.class, args);
	}

}
