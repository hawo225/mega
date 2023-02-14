package com.finalProject;

 

import java.util.Date;

 

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.boot.CommandLineRunner;

import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;

 

import com.finalProject.entity.Boardlist;

import com.finalProject.repository.BoardlistRepository;

 

@SpringBootApplication

public class FinalProjectboardlistApplication implements CommandLineRunner{

 

           @Autowired

           BoardlistRepository boardlistRepository;

          

           public static void main(String[] args) {

                     SpringApplication.run(FinalProjectboardlistApplication.class, args);

           }

          

           public void run(String...args) {

                    

                     //테스트를 위해 글9개 입력


                   
           }

}

 