package BOARD.DAO;

import java.sql.SQLException;

import BOARD.DB.DB;
import BOARD.DB.DTO;

public class crudDAO extends memDAO {

	// 쓰기
	public void writeDB(String title, String id, String content) {
		
		openDB();
		try {
			String query = String.format("insert into %s (title, id, content, replyCount, hit, recmd, report) value ('%s','%s','%s', 0, 0, 0, 0)", 
					DB.SERVER_BOARD, title, id, content);
			st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		closeDB();
	}
	
	// 읽기
	public void readDB(String readNum) {
		
		openDB();
		try {
			String query = String.format("select * from %s where num = %s", DB.SERVER_BOARD, readNum);
			rs = st.executeQuery(query);
			rs.next();
			DB.dto = new DTO(rs.getString("title"), rs.getString("id"), rs.getString("content"), rs.getString("num"), 
					rs.getString("hit"), rs.getString("replyCount"), rs.getString("recmd"), rs.getString("report"));
		} catch (Exception e) {
			e.printStackTrace();
		}	
		closeDB();
	}
	
	// 조회수 올림
	public void hitUpDB(String readNum) {
		openDB();
		try {
			st.executeUpdate("update "+ DB.SERVER_BOARD +" set hit = hit + 1 where num="+ readNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		closeDB();
	}
	
	// 삭제
	public void deleteDB(String delNum) {
		
		openDB();
		try {
			String query = String.format("delete from %s where num = %s", DB.SERVER_BOARD, delNum);
			st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		closeDB();
	}
	
	// 수정
	public void editDB(String title, String id, String content, String editNum) {
		
		openDB();
		try {
			String query= String.format("update %s set title='%s', id='%s', content='%s' where num = %s", DB.SERVER_BOARD, title, id, content, editNum);
			st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		closeDB();
	}
	
	// 권한 여부
	public boolean checkRightDB(String id1, String num) {
		
		if(id1.equals(DB.ADMIN_ID)) {return true;}
		
		String id2 = "";
		
		openDB();
		String query = String.format("select * from %s where num = '%s'", DB.SERVER_BOARD, num);
		try {
			rs = st.executeQuery(query);
			rs.next();
			id2 = rs.getString("id");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		closeDB();
		
		return id1.equals(id2);
	}
	
	public void recommand(String value, String rcmdNum) {
		openDB();
		
		String query="";
		if(value.equals("up")){
			query = String.format("update %s set recmd = recmd + 1 where num = %s", DB.SERVER_BOARD, rcmdNum);
		}
		else if(value.equals("down")){
			query = String.format("update %s set recmd = recmd - 1 where num = %s", DB.SERVER_BOARD, rcmdNum);
		}
		
		try {
			st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		closeDB();
	}
}
