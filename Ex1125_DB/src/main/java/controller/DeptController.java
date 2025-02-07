package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.DeptDAO;
import vo.DeptVO;

@Controller
public class DeptController {
	
	DeptDAO dept_dao;
	
	public DeptController( DeptDAO dept_dao ) {
		this.dept_dao=dept_dao;
	}
	
	public static final String VIEW_PATH="/WEB-INF/views/dept/";
	
	
	@RequestMapping(value={"/","/list_dept.do"} )
	public String list(Model model) {	
		List<DeptVO> list=dept_dao.selectList();
		
		model.addAttribute("list",list);
		
		return VIEW_PATH+"dept_list.jsp";
	}
}
