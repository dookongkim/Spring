package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import vo.DeptVO;

@Component
public class DeptDAO {

	SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
	public List<DeptVO> selectList(){
		
		List<DeptVO> list= sqlSession.selectList("d.dept_list");
		
		return list;
	}
	
	
}
