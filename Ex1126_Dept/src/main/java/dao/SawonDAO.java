package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import vo.SawonVO;

@Component
public class SawonDAO {

	SqlSession sqlSession;

	public SawonDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;

	}

	public List<SawonVO> sawon_list(int deptno) {
		List<SawonVO> list = sqlSession.selectList("s.sawon_list", deptno);

		return list;
	}

	public SawonVO sawon_one(int deptno) {

		SawonVO vo = sqlSession.selectOne("s.select_one", deptno);

		return vo;
	}


	public int updateList(SawonVO vo) {

		int res=sqlSession.update("s.sawon_update", vo);
		
		return res; 
	}
	
	public int deleteList(int sabun) {
		
		int res=sqlSession.delete("s.sawon_delete", sabun);
		
		return res;
	}

	public int insertList(SawonVO vo) {
		
		int res=sqlSession.insert("s.sawon_insert", vo);
		
		return res;
	}

}
