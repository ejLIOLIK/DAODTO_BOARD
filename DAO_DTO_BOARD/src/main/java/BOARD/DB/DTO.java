package BOARD.DB;

public class DTO {
	
	public String title;
	public String id;
	public String num;
	public String content;
	public String replyCount;
	public String hit;
	public String recmd;
	public String report;
	
	public DTO(String title, String id, String content, String num, String hit, String replyCount, String recmd, String report){
		this.title = title;
		this.id = id;
		this.num = num;
		this.content = content;
		this.hit = hit;
		this.replyCount = replyCount;
		this.recmd = recmd;
		this.report = report;
	}	
}
