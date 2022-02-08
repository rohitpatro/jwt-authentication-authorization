package com.rohit;

import com.rohit.domain.Role;
import com.rohit.domain.User;
import com.rohit.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.ArrayList;

import static com.rohit.constants.AppConstant.*;

@SpringBootApplication
public class JwtAuthenticationAuthorizationApplication {

    public static void main(String[] args) {
        SpringApplication.run(JwtAuthenticationAuthorizationApplication.class, args);
    }

    @Bean
    CommandLineRunner run(@Autowired UserService userService) {
        return args -> {
            userService.saveRole(new Role(null, ROLE_USER));
            userService.saveRole(new Role(null, ROLE_MANAGER));
            userService.saveRole(new Role(null, ROLE_ADMIN));
            userService.saveRole(new Role(null, ROLE_SUPER_ADMIN));

            userService.saveUser(new User(null, "Rohit", "rohit", "rohit", new ArrayList<>()));
            userService.saveUser(new User(null, "Champ", "champ", "champ", new ArrayList<>()));
            userService.saveUser(new User(null, "Anjali", "anjali", "anjali", new ArrayList<>()));
            userService.saveUser(new User(null, "Kuku", "kuku", "kuku", new ArrayList<>()));

            userService.addRoleToUser("rohit", ROLE_USER);
            userService.addRoleToUser("rohit", ROLE_MANAGER);
            userService.addRoleToUser("anjali", ROLE_MANAGER);
            userService.addRoleToUser("anjali", ROLE_SUPER_ADMIN);
            userService.addRoleToUser("champ", ROLE_USER);
            userService.addRoleToUser("kuku", ROLE_MANAGER);
        };
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
