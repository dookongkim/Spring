package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import vo.GogekVO;

public class GogekDAO {
	
	SqlSession sqlSession;
	
	public GogekDAO(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
		
	}
	
	public List<GogekVO> gogek_list(int sabun){
		
		List<GogekVO> list=sqlSession.selectList("g.gogek_list",sabun);
		
		return list;
		
		
	}
	
}
