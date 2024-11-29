package controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import common.BCryptPwd;
import common.Common;
import common.PagingComment;
import dao.VisitDAO;
import vo.VisitVO;

@Controller
public class VisitController {

	public static final String VIEW_PATH = "/WEB-INF/views/";

	@Autowired // 자동주입 
	ServletContext applicaton;

	@Autowired
	HttpServletRequest request;
	
	BCryptPwd bcp;
	VisitDAO visit_dao;

	public VisitController(VisitDAO visit_dao, BCryptPwd bcp) {
		this.bcp = bcp;
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
	public String insert_visit(VisitVO vo) {
		//사진업로드
		String webPath="resources/upload/"; //상대경로
		String savePath=applicaton.getRealPath(webPath); //절대경로

		System.out.println("절대경로 : " +savePath);

		MultipartFile photo=vo.getPhoto();
		String filename="no_file";

		if( !photo.isEmpty() ) {
			filename= photo.getOriginalFilename();

			//저장할 파일의 경로 지정
			File saveFile=new File(savePath,filename);
			if( !saveFile.exists() ) {
				saveFile.mkdirs();
			}else {
				//동일한 이름의 파일이 존재한다면, 현재 업로드 시간을 붙여서 중복을 방지
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time,filename);
				saveFile=new File(savePath,filename);
			}
			//파일을 절대경로에 생성
			try {
				photo.transferTo(saveFile); 
			} 
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		vo.setFilename(filename);		

		//암호화
		String encodePwd=bcp.encryption(vo.getPwd());

		vo.setPwd(encodePwd);

		vo.setIp(request.getRemoteAddr());

		int res=visit_dao.insert_form(vo);

		System.out.println("insert 결과 : " + res);
		
		return "redirect:list_visit.do";
	}

	
	@RequestMapping(value="/delete.do", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String delete_visit(VisitVO vo , Integer page,String c_pwd) {

		int nowPage=1;
		if(page != null) {
			nowPage=page; 
		}		 

		//비밀번호 비교
		boolean isValid = bcp.decryption(vo.getPwd(), c_pwd);

		int res=0;

		if(isValid) {
			res=visit_dao.delete_visit(vo.getIdx());
		}else {
			String pwdCheck="no_pwd";
			return String.format("[{'res':'%s'}]", pwdCheck);
		}

		String result="아니요";

		if(res != 0) {
			result="네";
			
			String webPath="resources/upload/"; //상대경로
			String savePath=applicaton.getRealPath(webPath); //절대경로
			
			File deleteFile = new File(savePath,vo.getFilename());
			if( deleteFile.exists() ) {
				deleteFile.delete();
			}
			
			
		}
		String resultStr=String.format("[{'res':'%s'}]", result);

		System.out.println("delete 결과 : "+res);

		return resultStr;

	}

	@RequestMapping("/update_form.do")
	public String update_form(int idx,Model model , Integer page) {
		int nowPage=1;

		if(page != null) {
			nowPage=page; 
		}		 

		VisitVO vo=visit_dao.select_one(idx);

		model.addAttribute("vo",vo);

		return Common.Visit.VIEW_PATH+"update_form.jsp?page="+nowPage;

	}


	@RequestMapping("/update_visit.do")
	public String update_visit(VisitVO vo, Integer page) {

		//페이징
		int nowPage=1;  
		if(page != null) {
			nowPage=page; 
		}

		vo.setPwd(bcp.encryption(vo.getPwd()));

		String ip=request.getRemoteAddr();
		vo.setIp(ip);

		String webPath="resources/upload/"; //상대경로
		String savePath=applicaton.getRealPath(webPath); //절대경로
		
		MultipartFile photo =vo.getPhoto();
		String filename="no_file";
		
		if( !photo.isEmpty() ) {
			
			filename = photo.getOriginalFilename();
			
			File saveFile=new File(savePath , filename);
			if( !saveFile.exists() ) {
				saveFile.mkdirs();
				
				
			}else {
				long time=System.currentTimeMillis();
				filename = String.format("%d_%s", time,filename);
				saveFile= new File(savePath , filename);
			}
			
			try {
				photo.transferTo(saveFile);
				saveFile = new File(savePath,vo.getFilename());
				if( saveFile.exists()) {
					saveFile.delete();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}else {
			filename=vo.getFilename();
		}
		System.out.println(filename);
		
		vo.setFilename("filename : "+filename);
		int res=visit_dao.update_visit(vo);

		System.out.println("update 결과 : " +res);

		return "redirect:list_visit.do?page="+nowPage;
	}

	//수정을 위한 비밀번호 체크
	@RequestMapping("/update_password_check.do")
	@ResponseBody //콜백
	public String chkPwd(String pwd, String c_pwd) {

		BCryptPwd bcp=new BCryptPwd();
		boolean isValid=bcp.decryption(pwd, c_pwd);

		String result="no_pwd";

		if(isValid) {
			result="yes_pwd";
		}

		return result;
	}


}
