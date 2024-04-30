package com.hospital.app;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{
	@Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        PasswordEncoder encoder = 
          PasswordEncoderFactories.createDelegatingPasswordEncoder();
        auth
          .inMemoryAuthentication()
          .withUser("tejas")
          .password(encoder.encode("test123"))
          .roles("USER","PATIENT")
          .and()
          .withUser("patil")
          .password(encoder.encode("test123"))
          .roles("USER", "RECEPTIONIST")
        .and()
        .withUser("nitin")
        .password(encoder.encode("test123"))
        .roles("USER","DOCTOR");
    }
	
	 @Override
	    protected void configure(HttpSecurity http) throws Exception {
		 http
         .csrf().disable()
         .authorizeRequests()
         .antMatchers("/").permitAll()
         .antMatchers("/main").permitAll()
         
         .antMatchers("/signup").permitAll()
         .antMatchers("/doctors/**").hasRole("DOCTOR")
         .antMatchers("/patients/**").hasRole("PATIENT")
         .antMatchers("/receptionist/**").hasRole("RECEPTIONIST")
         .antMatchers("/anonymous*").anonymous()
         .antMatchers("/login*").permitAll()
         .anyRequest().authenticated()
         .and()
         .formLogin()
   //     .loginPage("/login")
//         .loginProcessingUrl("/perform_login")
         .defaultSuccessUrl("/showPostLogin", false)
         .permitAll()
         //.failureUrl("/login.html?error=true")
         //.failureHandler(authenticationFailureHandler())
         .and()
         .logout()
         .logoutSuccessUrl("/")
         .permitAll();
	    }
	
}
