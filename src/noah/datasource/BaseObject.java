package noah.datasource;

import java.io.Serializable;

public class BaseObject implements Serializable{

	private String author;

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

}
