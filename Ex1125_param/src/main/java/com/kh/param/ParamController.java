package com.kh.param;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import vo.PersonVO;

@Controller
public class ParamController {
	
	public static final String VIEW_PATH="/WEB-INF/views/person/";
	
	@RequestMapping(value = {"/" , "/insert_form.do"} )
	public String insertForm(Model model) {
		
		
		
		
		return VIEW_PATH+"insert_form.jsp";
	}
	
	@RequestMapping("/insert_single.do")
	public String insert1(Model model,String name, int age, String tel) {
		//name=홍길동&age=23&tel=01010101010
		
		PersonVO vo=new PersonVO();
		vo.setAge(age);
		vo.setName(name);
		vo.setTel(tel);
		
		model.addAttribute("vo", vo);
		
		return VIEW_PATH+"insert_result.jsp";
	}
	
	@RequestMapping("/insert_vo.do")
	public String insert2(Model model , PersonVO vo) {
		
		//파라미터로 넘어온 값을 vo에 속성이 일치하는 변수에 자동으로 추가
		model.addAttribute("vo",vo);
		
		
		return VIEW_PATH+"insert_result.jsp";
	}
}
















