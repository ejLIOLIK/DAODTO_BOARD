package BOARD.DAO;

import java.sql.SQLException;
import java.util.ArrayList;

import BOARD.DB.DB;
import BOARD.DB.replyDTO;

public class replyDAO extends memDAO {
	
	public int mountPost; // 총 포스트 수
	public int mountPage; // 총 페이지 수
	public int currentPageNum; // 현재 페이지 int
	
	public String countDB(String PostNum) {
		
		openDB();
		String query = String.format("select count(*) from %s where PostNum = %s ", DB.SERVER_BOARD_REPLY, PostNum);
		try {
			rs = st.executeQuery(query);
			rs.next();
			return rs.getString("count(*)");	
		} catch (Exception e) {
			e.printStackTrace();
		}
		closeDB();
		return null;
	}
	
	public void pagintInitDB(String PostNum) {
		
		String mountPostStr = countDB(PostNum);
		
		if(mountPostStr==null || mountPostStr.equals("0")) {
			mountPage = 1; // 리플 없는 경우
		}
		else {
			mountPost = Integer.parseInt(mountPostStr);
			if (mountPost % DB.PAGINGNUM_R == 0) {
				mountPage = mountPost / DB.PAGINGNUM_R;
			} else {
				mountPage = mountPost / DB.PAGINGNUM_R + 1;
			}
		}
		
		closeDB();
	}
	
	// 리스트
	public ArrayList<replyDTO> listDB(String postNum, String currentPage) {
		
		if(currentPage==null) {
			currentPageNum=1;
		}
		else {
			currentPageNum = Integer.parseInt(currentPage);
		}
		
		openDB();
		ArrayList<replyDTO> replyA = new ArrayList<replyDTO>();
		try {
			String query= String.format("select * from %s where postNum = %s order by %s desc limit %d, %d", 
					DB.SERVER_BOARD_REPLY, postNum, "replyNum", (currentPageNum-1)*DB.PAGINGNUM_R, DB.PAGINGNUM_R);
			rs = st.executeQuery(query);
			while(rs.next()) {
				DB.reply = new replyDTO(rs.getString("replyId"), rs.getString("replyNum"), rs.getString("PostNum"), rs.getString("replyText"), rs.getString("date"));
				replyA.add(DB.reply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		closeDB();
		return replyA;		
	}
	
	// 쓰기
	public void writeDB(String replyId, String PostNum, String replyText) {
		
		openDB();
		try {
			String query = String.format("insert into %s (replyId, PostNum, replyText) value ('%s','%s','%s')", 
					DB.SERVER_BOARD_REPLY, replyId, PostNum, replyText);
			st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		closeDB();
	}
	
	// 리플 수 +
	public void replyMountUpDB(String PostNum) {
		openDB();
		try {
			st.executeUpdate("update "+ DB.SERVER_BOARD +" set replyCount = replyCount + 1 where num="+ PostNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		closeDB();
	}
	
	// 리플 수 -
	public void replyMountDownDB(String PostNum) {
		openDB();
		try {
			st.executeUpdate("update "+ DB.SERVER_BOARD +" set replyCount = replyCount - 1 where num="+ PostNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		closeDB();
	}
	
	// 삭제
	public void replyDeleteDB(String delNum) {
		openDB();
		String query = String.format("delete from %s where replyNum = %s", DB.SERVER_BOARD_REPLY, delNum);
		try {
			st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		closeDB();
	}
	
	// 수정
	public void replyEditDB(String replyNum, String replyText) {
		openDB();
		try {
			String query = String.format("update %s set replyText = '%s' where replyNum = %s", 
					DB.SERVER_BOARD_REPLY, replyText, replyNum);
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
		String query = String.format("select * from %s where replyNum = '%s'", DB.SERVER_BOARD_REPLY, num);
		try {
			rs = st.executeQuery(query);
			rs.next();
			id2 = rs.getString("replyId");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		closeDB();
		
		return id1.equals(id2);
	}
	
}
