package noah.datasource;

public class DbTablename extends BaseObject {

	private String table_name;
	private String column_name;
	private String column_comment;
	private String column_key;
	private String column_type;

	public String getColumn_type() {
		return column_type;
	}

	public void setColumn_type(String column_type) {
		this.column_type = column_type;
	}

	public String getColumn_key() {
		return column_key;
	}

	public void setColumn_key(String column_key) {
		this.column_key = column_key;
	}

	public String getTable_name() {
		return table_name;
	}

	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}

	public String getColumn_name() {
		return column_name;
	}

	public void setColumn_name(String column_name) {
		this.column_name = column_name;
	}

	public String getColumn_comment() {
		return column_comment;
	}

	public void setColumn_comment(String column_comment) {
		this.column_comment = column_comment;
	}

}
