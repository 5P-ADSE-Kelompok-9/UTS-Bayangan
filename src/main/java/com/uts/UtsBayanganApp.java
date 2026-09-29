package com.uts;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

@SpringBootApplication
@ConfigurationPropertiesScan
public class UtsBayanganApp {

    public static void main(String[] args) {
        SpringApplication.run(UtsBayanganApp.class, args);
    }
}