<#import "parts/common.ftlh" as c>


<@c.page>
    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        New photo
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control" name="name" placeholder="Enter name" />
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile"/>
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Send</button>
                </div>
            </form>
        </div>
    </div>
    <div>All photos</div>
    <#list photos as photo>
        <div>
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

