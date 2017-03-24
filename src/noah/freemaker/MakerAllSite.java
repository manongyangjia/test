package noah.freemaker;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import noah.datasource.DbTablename;

public class MakerAllSite {

	public static void main(String[] args) {

		try {
			Connection conn = DBUtil.openConnection();
			List<DbTablename> columnsList = DBUtil.queryBeanList(conn, "SELECT * FROM information_schema.COLUMNS a WHERE  a.`TABLE_NAME`='test'",
					DbTablename.class);
			String packageName = "com.police.acess.system.pub.bean";
			Map<String, Object> root = new HashMap<String, Object>();
			root.put("packageName", packageName);
			root.put("dataDomain", "Test");
			MakerDatadomain domain = new MakerDatadomain(root, columnsList);
			domain.gengerateCode();
			MakerDatadomainController domainControll = new MakerDatadomainController(root, columnsList);
			root.put("packageName", "com.police.acess.system.controller");
			root.put("dataDomain", "TestController");
			root.put("primaryKey", "id");
			domainControll.gengerateCode();
			MakerDatadomaindaoxml xml = new MakerDatadomaindaoxml(root, columnsList);
			root.put("packageName", "com.police.acess.system.xml");
			root.put("dataDomain", "TestMapper");
			root.put("primaryKey", "id");
			xml.gengerateCode();
			MakerDatadomainjsp jsp = new MakerDatadomainjsp(root, columnsList);
			root.put("dataDomain", "test");
			root.put("packageName", "com.police.acess.system.page");
			jsp.gengerateCode();
			MakerDatadomainService service = new MakerDatadomainService(root, columnsList);
			root.put("packageName", "com.police.acess.system.service");
			root.put("dataDomain", "TestService");
			service.gengerateCode();
			MakerDatadomainServiceimpl impl = new MakerDatadomainServiceimpl(root, columnsList);
			root.put("packageName", "com.police.acess.system.service");
			root.put("dataDomain", "UserAccount");
			impl.gengerateCode();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
