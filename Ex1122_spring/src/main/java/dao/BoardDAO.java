package dao;

import java.util.List;

public interface BoardDAO {
   int insert(int idx);
   List<String> selectList();
   int update(int idx);
   int delete(int idx);
   
   
   
}
