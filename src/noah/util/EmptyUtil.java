package noah.util;

import java.util.List;

import noah.datasource.DbTablename;

public class EmptyUtil {

	public static boolean listIsEmpty(List<DbTablename> listObj) {
		if (listObj != null && listObj.size() > 0) {
			return true;
		}
		return false;
	}
}
