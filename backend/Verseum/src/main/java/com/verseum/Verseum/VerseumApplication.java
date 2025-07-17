package com.verseum.Verseum;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@OpenAPIDefinition
@SpringBootApplication
public class VerseumApplication {

	public static void main(String[] args) {
		SpringApplication.run(VerseumApplication.class, args);
	}

}
