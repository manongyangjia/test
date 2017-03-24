package ${packageName};

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.noah.ai.platform.pub.entity.Page;
import com.noah.ai.platform.pub.util.PageData;
import com.police.acess.system.controller.base.BaseController;
import com.police.acess.system.pub.bean.HcmtreeData;
import com.police.acess.system.pub.bean.UserAccount;
import com.police.acess.system.pub.service.HcmtreedataService;
import com.police.acess.system.pub.service.UserService;
import com.police.acess.system.pub.util.common.EncryptUtil;

@Controller
public class ${dataDomain}Controller extends BaseController {
	@Autowired
	private ${dataDomain?cap_first}Service ${dataDomain}Service;

	@RequestMapping(value = "${dataDomain}/list", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public ModelAndView list(Page page) {

		PageData pd = new PageData();
		pd = this.getPageData();
		<#list queryCondition as var1>
		String ${var1.columnName} = pd.get${var1.type?cap_first}("${var1.columnName}");
		pd.put("${var1.columnName}", ${var1.columnName});
		</#list>
		page.setPd(pd);
		ModelAndView mv = this.getModelAndView();
		List<${dataDomain}> dataList = ${dataDomain}Service.getAllData(page);
		page.setPd(pd);
		mv.setViewName("system/admin/${dataDomain}list");
		mv.addObject("dataList", dataList);
		mv.addObject("pd", pd);
		return mv;
	}

@RequestMapping(value = "/${dataDomain}/goEdit", produces = "text/html;charset=UTF-8")
	public ModelAndView goEditUser()

	{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String id = pd.getString("id");
		mv.addObject("pd", ${dataDomain}Service.selectDataById(id));
		mv.setViewName("system/admin/edit${dataDomain}");
		return mv;
	}

	@RequestMapping(value = "/${dataDomain}/edit")
	public ModelAndView editData(PrintWriter out) {

		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		${dataDomain} data = ${dataDomain}Service.selectDataById(pd.getString("${primaryKey}"));
		<#list addCondition as  addConditionVar >
		data.set${addConditionVar.columnName?cap_first}(pd.get${addConditionVar.type?cap_first}("${addConditionVar.columnName}"));
		</#list>
		try {
			${dataDomain}Service.editData(data);
			mv.addObject("msg", "success");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "failed");
		}
		mv.setViewName("save_result");
		return mv;
	}

	@RequestMapping(value = "/${dataDomain}/goAdd", produces = "text/html;charset=UTF-8")
	public ModelAndView goadd${dataDomain}()
	{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("system/admin/add${dataDomain}");
		return mv;
	}

	@RequestMapping(value = "/${dataDomain}/add")
	public ModelAndView addUser(PrintWriter out) throws Exception {
		ModelAndView mv = this.getModelAndView();
		PageData pd = this.getPageData();
		${dataDomain} data = new ${dataDomain}();
		<#list addCondition as  addConditionVar >
		data.set${addConditionVar.columnName?cap_first}(pd.get${addConditionVar.type?cap_first}("${addConditionVar.columnName}"));
		</#list>
		data.set${primaryKey?cap_first}(UUID.randomUUID().toString());
		try {
			${dataDomain}Service.addUser(data);

			mv.addObject("msg", "success");

		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "failed");
		}
		mv.setViewName("save_result");
		return mv;
	}

}
