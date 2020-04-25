<#import "parts/common.ftlh" as c>


<@c.page>
    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        New photo
    </a>
    <div class="collapse" id="collapseExample">
        <form method="post" enctype="multipart/form-data">
            <input type="text" name="name" placeholder="Enter name" />
            <input type="file" name="file" />
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit">Send</button>
        </form>
    </div>
    <div>All photos</div>
    <#list photos as photo>
        <div>
            <b>${photo.id}</b>
            <span>${photo.name}</span>
            <strong>${photo.authorName}</strong>
            <div>
                <#if photo.filename??>
                    <img src="/img/${photo.filename}"
                </#if>
            </div>
        </div>
        <#else>
        No photo
    </#list>>
</@c.page>

