package BOARD.DB;

public class replyDTO {
	
	public String replyId;
	public String replyNum;
	public String PostNum;
	public String replyText;
	public String date;
	
	public replyDTO(String replyId, String replyNum, String PostNum, String replyText, String date){
		this.replyId = replyId;
		this.replyNum = replyNum;
		this.PostNum = PostNum;
		this.replyText = replyText;
		this.date = date;
	}	
}
