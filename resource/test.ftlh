<#assign  a="11111111111">
<#macro  greet>aaaaaaaaaaaaaa</#macro>
<html>
<head>
  <title>Welcome!</title>
</head>
<body>
<#--   注释    -->
  <h1>Welcome ${user}!</h1>
  <p>Our latest product:
  <a href="${latestProduct.url}">${latestProduct.name}</a>!
<#list being as being1> 
   <li>${being1.name} for ${being1.name} Euros
</#list>
${a}
<#list 1..6 as  list1>
  ${list1}
</#list>

<@greet></@greet>
</body>
</html>