<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <div>
        <@l.logout />
    </div>
    <span><a href="/user">User List</a></span>
    <div>
        <form method="post">
            <input type="text" name="name" placeholder="Enter name" />
            <input type="text" name="imagePath" placeholder="Enter path" />
            <input type="text" name="tag" placeholder="Tag" />
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit">Send</button>
        </form>
    </div>
    <div>All photos</div>
    <#list photos as photo>
        <div>
            <b>${photo.id}</b>
            <span>${photo.name}</span>
            <span>${photo.imagePath}</span>
            <i>${photo.tag}</i>
            <strong>${photo.authorName}</strong>
        </div>
        <#else>
        No photo
    </#list>>
</@c.page>

