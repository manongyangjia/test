package com.police.acess.system.service_impl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.Semaphore;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.noah.ai.platform.pub.entity.Page;
import com.police.acess.system.config.CONS;
import com.police.acess.system.config.DBUtil;
import com.police.acess.system.config.SQL;
import com.police.acess.system.config.StringsReader;
import com.police.acess.system.pub.bean.HcmtreeData;
import com.police.acess.system.pub.bean.UserAccount;
import com.police.acess.system.pub.service.UserService;
import com.police.acess.system.pub.util.common.EncryptUtil;

/**
 * .
 * 
 * @author gst
 * 
 */
@Service("${dataDomain}Service")
public class ${dataDomain}ServiceImpl implements UserService {

	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

	private static SQL sql;
	private static ${dataDomain}ServiceImpl instance = new ${dataDomain}ServiceImpl();

	public static ${dataDomain}ServiceImpl getInstance() {
		return instance;
	}

	public static SQL getSQL() {
		return sql;
	}

	public ${dataDomain}ServiceImpl() {
		String driver = StringsReader.getString(CONS.driver);
		String url = StringsReader.getString(CONS.url);
		String user = StringsReader.getString(CONS.user);
		String password = StringsReader.getString(CONS.password);
		try {
			sql = new SQL(driver, url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		} catch (SQLException e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		} catch (IOException e) {
			e.printStackTrace();
			logger.error(e.getMessage(), e);
		}
	}

	public List<${dataDomain}> getAllusers(Page page) {
		return (List<UserAccount>) sql.selectList("${dataDomain}Mapper.getAllDatalistPage", page);
	}

	public ${dataDomain} selectDataById(String data) {
		List<${dataDomain}> dataList = (List<${dataDomain}>) sql.selectList("${dataDomain}Mapper.selectDataById", data);
		if (dataList != null && dataList.size() > 0) {
			return dataList.get(0);
		} else {
			return null;
		}
	}

	

	
	public int addData(${dataDomain} addData) {
		sql.update("${dataDomain}Mapper.addData", addData);
		return cnt;

	}
	
	public int delete${dataDomain}(String id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("${primaryKey}", id);
		 sql.update("useraccountMapper.deleteData", map);
		return 1;
	}

	
}
