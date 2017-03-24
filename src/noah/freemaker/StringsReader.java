package noah.freemaker;

import java.io.InputStream;
import java.util.Properties;

/**
 * 读取Strings配置文件下的数据
 * @author xiapeng
 *
 */
public class StringsReader {
	private static Properties props;
    public StringsReader(){
        initialization();
    }
    public static void initialization(){
        InputStream in = StringsReader.class.getResourceAsStream("/strings.properties");
        props=PropertiesReader.readProperties(in);    
    }
    public static String getString(String key){
        if (props==null) initialization();
        return props.getProperty(key);
    }
}
