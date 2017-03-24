package noah.freemaker;

import java.util.Map;

/**
 * 模板基类.
 * 
 * @author gst
 * 
 */
public class TemplateObject {

	protected String pathName = "d:/noah/";
	protected String fileName = "";
	protected Map<String, Object> root;

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getPathName() {
		return pathName;
	}

	public void setPathName(String pathName) {
		this.pathName = pathName;
	}

	public Map<String, Object> getRoot() {
		return root;
	}

	public void setRoot(Map<String, Object> root) {
		this.root = root;
	}

}
