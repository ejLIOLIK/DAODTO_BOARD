package BOARD.DB;

public class DB {

	public static String serverforName = "com.mysql.cj.jdbc.Driver";
	public static String serverConnection = "jdbc:mysql://localhost:3306/my_cat";
	public static String DB_ID = "root";
	public static String DB_PW = "root";
	
	public static String SERVER_BOARD = "board";
	public static int PAGINGNUM = 10;
	public static int PAGINGNUM_BEST = 3;
	public static int PAGINGNUM_BLOCK = 5;

	public static String SERVER_BOARD_REPLY = "reply_DTO";
	public static int PAGINGNUM_R = 5;	
	
	public static String SERVER_BOARD_REGISTER = "register";

	public static String ADMIN_ID = "admin";
	
	public static DTO dto;
	public static replyDTO reply;
}
