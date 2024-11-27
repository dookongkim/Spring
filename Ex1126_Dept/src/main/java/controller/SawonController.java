package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.SawonDAO;
import vo.SawonVO;

@Controller
public class SawonController {

	SawonDAO sawon_dao;
	
	public SawonController(SawonDAO sawon_dao) {
		this.sawon_dao=sawon_dao;
	}
	
	@RequestMapping("/sawon_list.do")
	public String sawon(Model model , int deptno) {
		
		List<SawonVO> list=sawon_dao.sawon_list(deptno);
		model.addAttribute("list",list);
		
		return Common.Sawon.VIEW_PATH+"sawon_list.jsp";
	}
	
	@RequestMapping("/update.do")
	public String sawon_select_one(Model model,int sabun) {
		
		SawonVO vo=sawon_dao.sawon_one(sabun);
		model.addAttribute("vo",vo);
		
		return Common.Sawon.VIEW_PATH+"sawon_update.jsp";
		
	}
	
	@RequestMapping("/updfin.do")
	public String sawon_upd_fin(SawonVO vo) {
				
		int res=sawon_dao.updateList(vo);
		
		System.out.println("upd 결과 : "+res);
		
		return "sawon_list.do?deptno="+vo.getDeptno();
		
		
	}
	
	@RequestMapping("/sawon_del.do")
	public String sawon_del(SawonVO vo) {
		
		int res=sawon_dao.deleteList(vo.getSabun());
		System.out.println("del 결과 : "+res );
		return "redirect:sawon_list.do?deptno="+vo.getDeptno();
	}
	
	@RequestMapping("/insert.do")
	public String sawon_insertForm() {
		
		return Common.Sawon.VIEW_PATH+"sawon_insert.jsp";
	}
	
	
	@RequestMapping("/insertFin.do")
	public String sawon_insert(SawonVO vo) {
		
		int res=sawon_dao.insertList(vo);
		
		System.out.println("insert 결과 : "+ res);
		
		return  "redirect:sawon_list.do?deptno="+vo.getDeptno();
	}
	

		
	
}










