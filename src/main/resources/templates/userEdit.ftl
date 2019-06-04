<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
<form method="post" action="/user">
    <input type="text" name="username" value="${_user.username}">
    <#list roles as role>
        <div>
            <label><input type="checkbox" name="${role}" ${_user.roles?seq_contains(role)?string("checked", "")} />${role}</label>
        </div>
    </#list>
    <input type="hidden" name="userId" value="${_user.id}">
    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
    <div>
        <input type="submit" name="save" value="Save"/>
        <#if getUserId != _user.id>
            <input type="submit" name="delete" value="Delete"/>
        </#if>
    </div>
</form>

</@c.page>