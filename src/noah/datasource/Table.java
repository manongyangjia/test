package noah.datasource;

public class Table {
	/**
	 * 表名称.
	 */
	private String name;
	/**
	 * 作者.
	 */
	private String author;
	/**
	 * 注释.
	 */
	private String comment;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

}
