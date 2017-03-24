package com.police.acess.system.pub.service;

import java.util.List;

import com.noah.ai.platform.pub.entity.Page;
import com.police.acess.system.pub.bean.HcmtreeData;
import com.police.acess.system.pub.bean.UserAccount;

/**
 * .
 * 
 * @author gst
 * 
 */
public interface ${dataDomain}Service {

	public List<${dataDomain}> getAllusers(Page page);

	public ${dataDomain} selectUserById(String id);

	public int addUser(${dataDomain} addData);

	public int editUser(${dataDomain} addData);

	public int deleteUser(String id);


}

