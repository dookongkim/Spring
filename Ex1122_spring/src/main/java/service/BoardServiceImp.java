package service;

import java.util.List;

import dao.BoardDAO;

public class BoardServiceImp implements BoardService {
	
	//일반적으로 Service 클래스는
	//DAO들을 묶어서 관리하는 용도로 생성한다
	BoardDAO dao;

	public BoardServiceImp(BoardDAO dao) {
		this.dao=dao;
	}
	
	
	@Override
	public List<String> selectList() {
		// 과일목록을 가져오는 dao의 메서드를 호출한다
		return dao.selectList();
	}
	
}
