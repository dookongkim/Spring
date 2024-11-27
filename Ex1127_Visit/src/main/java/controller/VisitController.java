package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import common.PagingComment;
import dao.VisitDAO;
import vo.VisitVO;

@Controller
public class VisitController {
	
	VisitDAO visit_dao;
	
	public VisitController(VisitDAO visit_dao) {
		this.visit_dao=visit_dao;
	}
	
	
	@RequestMapping(value={"/","/list_visit.do"} )
	public String visitList(Model model,Integer page) {
		//페이징
		int nowPage=1;
		if( page != null ) {
			nowPage=page;
			
		}
		int start=(nowPage -1) * Common.Visit.BLOCKLIST +1;
		int end= start + Common.Visit.BLOCKPAGE -1;
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("start",start);
		map.put("end", end);
		
		List<VisitVO> list=visit_dao.select_list(map);
		
		int row_total=visit_dao.getRowTotal();
		  
		//페이지 메뉴 ( ◀ 1 2 ▶ ) 
		String pageMenu = PagingComment.getPaging("list_visit.do", nowPage, row_total, Common.Visit.BLOCKLIST,Common.Visit.BLOCKPAGE);
		
		model.addAttribute("pageMenu",pageMenu);
		model.addAttribute("list",list);
		
		return Common.Visit.VIEW_PATH+"visit_list.jsp";
	}
	
	@RequestMapping("/insert_form.do")
	public String insert_form() {
		
		return Common.Visit.VIEW_PATH+"insert_form.jsp";
	}
	
	@RequestMapping("/insert_visit.do")
	public String insert_visit(VisitVO vo,HttpServletRequest request) {
		
		vo.setIp(request.getRemoteAddr());
		
		int res=visit_dao.insert_form(vo);
		
		System.out.println("insert 결과 : " + res);
		return "redirect:list_visit.do";
	}
	
	@RequestMapping("/delete_visit.do")
	public String delete_visit(int idx) {
		
		int res=visit_dao.delete_visit(idx);
		
		System.out.println("delete 결과 : "+res);
		return "redirect:list_visit.do";
		
	}
	
	@RequestMapping("/update_form.do")
	public String update_form(int idx,Model model) {
		
		VisitVO vo=visit_dao.select_one(idx);
		
		model.addAttribute("vo",vo);
		
		return Common.Visit.VIEW_PATH+"update_form.jsp";
		
	}
	
	@RequestMapping("/update_visit.do")
	public String update_visit(VisitVO vo) {
		
		int res=visit_dao.update_visit(vo);
		
		System.out.println("update 결과 : " +res);
		
		return "redirect:list_visit.do";
	}
		
	
}
