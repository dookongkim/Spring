package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.Common;
import dao.DeptDAO;
import vo.DeptVO;

@Controller
public class DeptController {
	
	DeptDAO dept_dao;
	
	public DeptController( DeptDAO dept_dao ) {
		this.dept_dao=dept_dao;
	}
	

	@RequestMapping(value={"/","/list_dept.do"} )
	public String list(Model model) {	
		List<DeptVO> list=dept_dao.selectList();
		
		model.addAttribute("list",list);
		
		return Common.Dept.VIEW_PATH+"dept_list.jsp";
	}

}
