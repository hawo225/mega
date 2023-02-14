package com.finalProject.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.finalProject.dto.BoardDTO;
import com.finalProject.service.BoardService;
import com.finalProject.util.MyUtil;

// 공지사항 게시판 컨트롤러
/*
 - API
 
공지사항
http://localhost:8080/list

공지사항 등록(어드민)
http://localhost:8080/created

공지사항 수정 (어드민)
http://localhost:8080/updated(글값?)

 */


@RestController("BoardcreConrtroller")
@RequestMapping("/movie")
public class BoardcreConrtroller {
	
	@Resource
	private BoardService boardService; //얘를 호출하면 BoardServiceImpl이 딸려들어옴

	@Autowired
	MyUtil myUtil; //@Service로 구현된 MyUtil을 불러온것
	
	@RequestMapping(value = "/Boardcre")
	public ModelAndView index() throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("index"); //jsp(html)로 갈때는 setViewName // class로 갈때는 setView
		
		return mav;
	}
	
	// 공지사항 글 작성
	@RequestMapping(value = "/Boardcre", method = RequestMethod.GET)
	public ModelAndView created() throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("notice/Boardcre"); //jsp(html)로 갈때는 setViewName // class로 갈때는 setView
		
		return mav;
	}
	
	// 공지사항 글 작성 처리
	@RequestMapping(value = "/Boardcre", method = RequestMethod.POST)
	public ModelAndView created_ok(BoardDTO dto, HttpServletRequest request) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		int maxNum = boardService.maxNum();
		
		dto.setNum(maxNum + 1);
		dto.setIpAddr(request.getRemoteAddr());
		
		boardService.insertData(dto);
		
		mav.setViewName("redirect:/Boardcre");
		
		return mav;
		
	}
	
	
	
	

	
	
}