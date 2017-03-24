<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "mybatis-3-mapper.dtd" >
<mapper namespace="${dataDomain}Mapper">
	<resultMap id="${dataDomain}BaseResultMap" type="com.police.acess.system.pub.bean.${dataDomain}">
	<#list  allColunm as  columns  >
	    <result column="${columns.columnName}" property="${columns.columnName?replace("_","")}" jdbcType="${columns.databaseType}" />
	</#list>
	</resultMap>
	<select id="selectDataById" resultMap="${dataDomain}BaseResultMap" parameterType="java.lang.String">

		select * from ${tableName} where  ${primaryKey} like CONCAT('%','${r"$"}{parameter}','%' )
		
	</select>
	<select id="getAllDatalistPage" resultMap="${dataDomain}BaseResultMap" parameterType="page" >
		SELECT * from ${tableName} where 1=1
        <#list  queryCondition as  columns  >
	    <if test="pd.${columns.columnName} != null and pd.${columns.columnName} != ''">
			AND ${r"#"}{columns.columnName} like CONCAT('%','${r"$"}{pd.${columns.columnName}}','%' )
		</if>
	   </#list>
	</select>
	<insert id="addData" parameterType="com.police.acess.system.pub.bean.${dataDomain}">
		insert into
		${tableName}( <#list  allColunm as  columns> ${columns.columnName}<#if columns_index<columns?size-1>,<#else></#if></#list>)
		values
		( <#list  allColunm as  columns>${r"#"}{ ${columns.columnName?replace("_","")},jdbcType=${columns.databaseType}}<#if columns_has_next>,</#if></#list>
		)
	</insert>
	<update id="editData" parameterType="com.police.acess.system.pub.bean.${dataDomain}">
		update ${tableName} set
	<#list  allColunm as  columns>${columns.columnName?replace("_","")}=${r"#"}{${columns.columnName}}<#if columns_has_next>,</#if> </#list>
		where ${primaryKey}=${r"#"}{${primaryKey}}
	</update>
	<delete id="deleteData" parameterType="java.util.Map">
		delete from ${tableName} where ${primaryKey} in (
		${r"#"}{${primaryKey}} )
	</delete>
</mapper>