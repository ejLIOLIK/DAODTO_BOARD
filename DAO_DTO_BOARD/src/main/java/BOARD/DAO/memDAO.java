package BOARD.DAO;

import BOARD.DB.DB;
import BOARD.DB.memDTO;

public class memDAO extends DAO {

	public memDTO mdto;
	
	// 로그인 여부
	public boolean loginDB(String id, String pw) {
		mdto = new memDTO();
		openDB();
		String query = String.format("select * from %s where id = '%s' AND pw = '%s'", DB.SERVER_BOARD_REGISTER, id, pw);
		
		try {
			rs = st.executeQuery(query);
			rs.next();
			mdto.id = rs.getString("id");
			mdto.date = rs.getString("date");
			mdto.email = rs.getString("email");
		} catch (Exception e) {
			e.printStackTrace();
		}
		closeDB();
		
		if(mdto.id==null) {
			return false;
		}
		else {
			return true;
		}
	}
	
	// 회원가입 통합
	public String registerDB(String email, String id, String pw1, String pw2) {
		
		if(registerEmailDB(email)) {return "이미 가입한 email입니다.";}
		if(registerIdDB(id)) {return "중복된 id입니다.";}
		if(registerPwDB(pw1, pw2)) {return "패스워드 불일치";}

		openDB();
		String query = String.format("insert into %s (email, id, pw) value ('%s','%s','%s');", DB.SERVER_BOARD_REGISTER ,email, id, pw1);
		try {
			st.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		closeDB();
		
		return "회원가입 성공";		
	}
	
	// 회원가입 시 중복 email
	public boolean registerEmailDB(String email) {

		openDB();
		String query = String.format("select count(*) from %s where email = '%s'", DB.SERVER_BOARD_REGISTER, email);
		try {
			rs=st.executeQuery(query);
			rs.next();
			if(rs.getString("count(*)").equals("0")) {
				return false; // 가입안함
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		closeDB();
		return true; // 가입함
	}
	// 회원가입 시 중복 id
	public boolean registerIdDB(String id) {

		openDB();
		String query = String.format("select count(*) from %s where id = '%s'", DB.SERVER_BOARD_REGISTER, id);
		try {
			rs=st.executeQuery(query);
			rs.next();
			if(rs.getString("count(*)").equals("0")) {
				return false; // 가입안함
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		closeDB();
		return true; // 가입함
	}
	// 회원가입 시 pw 체크
	public boolean registerPwDB(String pw1, String pw2) {

		if(pw1.equals(pw2)) {
			return false; //일치
		}
		return true; //불일치
	}
	
}
