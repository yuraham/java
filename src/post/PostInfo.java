package post;

import java.sql.Timestamp;

public class PostInfo {
	private int numb;
	private String text;
	private String writer;
	private Timestamp cd_date;

	public int getNumb() {
		return numb;
	}
	public void setNumb(int numb) {
		this.numb = numb;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Timestamp getCd_date() {
		return cd_date;
	}
	public void setCd_date(Timestamp cd_date) {
		this.cd_date = cd_date;
	}
}
