package BOARD.DAO;

import java.util.ArrayList;

import BOARD.DB.DB;
import BOARD.DB.DTO;

public class listDAO extends DAO {
	
	public int mountPost; // 총 포스트 수
	public int mountPage; // 총 페이지 수
	public int currentPageNum; // 현재 페이지 int
	
	public String countDB() {
		
		openDB();
		String query = String.format("select count(*) from %s ", DB.SERVER_BOARD);
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
	
	public void pagintInitDB() {
		
		String mountPostStr = countDB();
		
		if(mountPostStr==null || mountPostStr=="0") {
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
	
	// 리스트
	public ArrayList<DTO> listDB(String currentPage) {	
		if(currentPage==null) {
			currentPageNum=1;
		}
		else {
			currentPageNum = Integer.parseInt(currentPage);
		}
		
		openDB();
		ArrayList<DTO> postA = new ArrayList<DTO>();
		try {
			String query= String.format("select * from %s order by %s desc limit %d, %d", DB.SERVER_BOARD, "num", (currentPageNum-1)*DB.PAGINGNUM, DB.PAGINGNUM);
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
	
	// 추천 리스트
	public ArrayList<DTO> BestlistDB() {	
		
		openDB();
		ArrayList<DTO> postA = new ArrayList<DTO>();
		try {
			String query= String.format("select * from %s order by %s desc limit %d, %d", DB.SERVER_BOARD, "recmd", 0, DB.PAGINGNUM_BEST);
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
