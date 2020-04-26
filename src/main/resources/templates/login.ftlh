<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    ${message?ifExists}
    <@l.login "/login" false/>
    <a href="/registration">Add new user</a>
</@c.page>

