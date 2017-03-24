package noah.freemaker;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.Properties;

/**
 * Properties文件读取类
 * @author xiapeng
 *
 */
public class PropertiesReader {
	// read all property values and set it into props
	public static Properties readProperties(String filePath) {
		Properties props = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(
					filePath));
			props.load(in);
			@SuppressWarnings("rawtypes")
			Enumeration en = props.propertyNames();
			while (en.hasMoreElements()) {
				String key = (String) en.nextElement();
				@SuppressWarnings("unused")
				String Property = props.getProperty(key);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return props;
	}

	@SuppressWarnings("rawtypes")
	public static Properties readProperties(InputStream in) {
		Properties props = new Properties();
		try {
			// InputStream in = new BufferedInputStream(new
			// FileInputStream(filePath));
			props.load(in);
			Enumeration en = props.propertyNames();
			while (en.hasMoreElements()) {
				String key = (String) en.nextElement();
				@SuppressWarnings("unused")
				String Property = props.getProperty(key);
				// System.out.println(key + Property);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return props;
	}

	// get value by key
	public static String readValue(String filePath, String key) {
		Properties props = new Properties();
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(
					filePath));
			props.load(in);
			String value = props.getProperty(key);
			System.out.println(key + value);
			return value;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
