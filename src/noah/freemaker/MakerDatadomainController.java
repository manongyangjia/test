package noah.freemaker;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import noah.datasource.DbTablename;
import noah.datasource.TabColumn;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;

public class MakerDatadomainController extends TemplateObject {
	private List<DbTablename> columnsList;
	public MakerDatadomainController(Map<String, Object> root, List<DbTablename> columnsList) {
		this.root = root;
		this.columnsList = columnsList;

	}

	public static void generateFile(String filePath, String fileName, Map<String, Object> root) throws IOException, TemplateException {

		Configuration cfg = new Configuration(Configuration.VERSION_2_3_25);
		cfg.setDirectoryForTemplateLoading(new File("resource"));
		cfg.setDefaultEncoding("UTF-8");
		cfg.setTemplateExceptionHandler(TemplateExceptionHandler.RETHROW_HANDLER);
		cfg.setLogTemplateExceptions(false);
		File f = new File(filePath);
		if (!f.exists()) {
			f.mkdirs();
		}
		File f1 = new File(fileName);
		if (!f1.exists()) {
			f1.createNewFile();
		}
		Template temp = cfg.getTemplate("dataDomaincontroller.ftlh");
		Writer out = new OutputStreamWriter(new FileOutputStream(fileName), "UTF-8");
		temp.process(root, out);

	}

	public static List<TabColumn> getDomailColumn(List<DbTablename> db) {
		
		List<TabColumn> ret = new ArrayList<TabColumn>();
		if (db != null && db.size() > 0) {
			for (DbTablename data : db) {
				TabColumn column = new TabColumn();
				column.setColumnName(data.getColumn_name());
				if (data.getColumn_key() != null && data.getColumn_key().equals("PRI")) {
					column.setIsPrimary("1");
				} else {
					column.setIsPrimary("0");
				}
				if (data.getColumn_type() != null && data.getColumn_type().contains("varchar")) {
					column.setType("string");
				} else {
					column.setType("string");
				}
				column.setComment(data.getColumn_comment());
				ret.add(column);

			}

		}
		return ret;
	}

	public static List<TabColumn> getAddDomailColumn(List<DbTablename> db) {
		List<TabColumn> ret = new ArrayList<TabColumn>();
		if (db != null && db.size() > 0) {
			for (DbTablename data : db) {
				TabColumn column = new TabColumn();
				column.setColumnName(data.getColumn_name());
				if (data.getColumn_key() != null && data.getColumn_key().equals("PRI")) {
					column.setIsPrimary("1");
				} else {
					column.setIsPrimary("0");
				}
				if (data.getColumn_type() != null && data.getColumn_type().contains("varchar")) {
					column.setType("string");
				} else {
					column.setType("string");
				}
				column.setComment(data.getColumn_comment());
				ret.add(column);

			}

		}
		return ret;
	}

	public void gengerateCode() {
		root.put("queryCondition", getDomailColumn(columnsList));
		root.put("addCondition", getAddDomailColumn(columnsList));
		String packageName = (String) root.get("packageName");
		String dataDomain = (String) root.get("dataDomain");
		String pathName1 = pathName + packageName.replace(".", "/");
		String fileName = pathName + packageName.replace(".", "/") + "/" + dataDomain + ".java";
		try {
			generateFile(pathName1, fileName, root);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		}

	}
}
