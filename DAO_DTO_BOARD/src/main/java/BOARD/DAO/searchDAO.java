package BOARD.DAO;

import java.util.ArrayList;

import BOARD.DB.DB;
import BOARD.DB.DTO;

public class searchDAO extends listDAO {
	
	public String countDB(String keyword, String keywordRange) {
		
		openDB();
		String query="";
		
		switch(keywordRange) {
		case "제목" : 
			query= String.format("select count(*) from %s where (title like '%%%s%%') "
					, DB.SERVER_BOARD, keyword);
			break;
		case "작성자" : 
			query= String.format("select count(*) from %s where (id like '%%%s%%') "
					, DB.SERVER_BOARD, keyword);
			break;
		case "내용" : 
			query= String.format("select count(*) from %s where (content like '%%%s%%') "
					, DB.SERVER_BOARD, keyword);
			break;
		case "제목+내용" : 
			query = String.format("select count(*) from %s where (title like '%%%s%%') OR (content like '%%%s%%') "
					, DB.SERVER_BOARD, keyword, keyword);
			break;
			default:
		}
		
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
	
	public void pagintInitDB(String keyword, String keywordRange) {
		
		String mountPostStr = countDB(keyword, keywordRange);
		
		if(mountPostStr==null) {
			mountPage = -1; // -1이면 결과 없음 팝업 띄우기
		}
		else {
			mountPost = Integer.parseInt(mountPostStr);
			if (mountPost % DB.PAGINGNUM == 0) {
				mountPage = mountPost / DB.PAGINGNUM;
			} else {
				mountPage = mountPost / DB.PAGINGNUM + 1;
			}
		}
		
		closeDB();
	}
	
	// 리스트 //keyword
	public ArrayList<DTO> listDB(String currentPage, String keyword, String keywordRange) {
		
		String query="";
		if(currentPage==null) {
			currentPageNum=1;
		}
		else {
			currentPageNum = Integer.parseInt(currentPage);
		}
		
		switch(keywordRange) {
		case "제목" : 
			query= String.format("select * from %s "
					+ "where (title like '%%%s%%') order by %s desc limit %s, %s"
					, DB.SERVER_BOARD, keyword, "num", (currentPageNum-1)*DB.PAGINGNUM, DB.PAGINGNUM);
			break;
		case "작성자" : 
			query= String.format("select * from %s "
					+ "where (id like '%%%s%%') order by %s desc limit %s, %s"
					, DB.SERVER_BOARD, keyword, "num", (currentPageNum-1)*DB.PAGINGNUM, DB.PAGINGNUM);
			break;
		case "내용" : 
			query= String.format("select * from %s "
					+ "where (content like '%%%s%%') order by %s desc limit %s, %s"
					, DB.SERVER_BOARD, keyword, "num", (currentPageNum-1)*DB.PAGINGNUM, DB.PAGINGNUM);
			break;
		case "제목+내용" : 
			query= String.format("select * from %s "
					+ "where (title like '%%%s%%') OR (content like '%%%s%%') order by %s desc limit %s, %s"
					, DB.SERVER_BOARD, keyword, keyword, "num", (currentPageNum-1)*DB.PAGINGNUM, DB.PAGINGNUM);
			break;
			default:
		}
		
		openDB();
		ArrayList<DTO> postA = new ArrayList<DTO>();
		try {
			rs = st.executeQuery(query);
			while(rs.next()) {
				DB.dto = new DTO(rs.getString("title"), rs.getString("id"), rs.getString("content"), rs.getString("num"), 
						rs.getString("hit"), rs.getString("replyCount"), rs.getString("recmd"), rs.getString("report"));
				postA.add(DB.dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		closeDB();
		return postA;		
	}
}
