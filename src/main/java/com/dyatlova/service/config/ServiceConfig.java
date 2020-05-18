package com.dyatlova.service.config;

import com.dyatlova.dao.config.DaoConfig;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@ComponentScan("com.dyatlova.service")
@Import(DaoConfig.class)
public class ServiceConfig {
}
