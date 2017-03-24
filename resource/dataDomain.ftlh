<#assign columntype=""/>
package ${packageName};

public class ${dataDomain} {

	<#list allColunm as columns>
	<#if columns.type=="string">
	<#assign columntype= "String">
	</#if>
     <#if columns.comment??>
     /**
     * ${columns.comment}.
     */
     </#if>
	private ${columntype} ${columns.columnName};

	public ${columntype} get${columns.columnName?cap_first}() {
		return ${columns.columnName};
	}

	public void set${columns.columnName?cap_first}(String ${columns.columnName}) {
		this.${columns.columnName} = ${columns.columnName};
	}
	
</#list>
}
