<#import "parts/common.ftlh" as c>


<@c.page>
    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        New photo
    </a>
    <div class="collapse <#if photo??>show</#if>" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control ${(nameError??)?string('is-invalid', '')}" value="<#if photo??>${photo.name}</#if>" name="name" placeholder="Enter name" />
                    <#if nameError??>
                        <div class="invalid-feedback">
                            ${nameError}
                        </div>
                    </#if>
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
    <div class="card-columns">
        <#list photos as photo>
        <div class="card my-3">
            <div>
                <#if photo.filename??>
                    <img src="/img/${photo.filename}" class="card-img-top">
                </#if>
            </div>
            <div class="m-2">
                <span>${photo.name}</span>
            </div>
            <div class="card-footer text-muted">
                ${photo.authorName}
            </div>
        </div>
        <#else>
            No photo
        </#list>
    </div>
</@c.page>

<script>
    $(document).ready(function() {

        $(".card-img-top").click(function(){
            var img = $(this);
            var src = img.attr('src');
            $("body").append("<div class='popup'>"+
                "<div class='popup_bg'></div>"+
                "<img src='"+src+"' class='popup_img' />"+
                "</div>");
            $(".popup").fadeIn(800);
            $(".popup_bg").click(function(){
                $(".popup").fadeOut(800);
                setTimeout(function() {
                    $(".popup").remove();
                }, 800);
            });
        });

    });
</script>

<style>
    body {
        margin:0;
    }
    .image {
        margin:30px;
        float:left;
        cursor:pointer;
        max-height:100px;
    }
    .popup {
        position: absolute;
        height:100%;
        width:100%;
        top:0;
        left:0;
        display:none;
        text-align:center;
    }
    .popup_bg {
        background:rgba(0,0,0,0.4);
        position:absolute;
        z-index:1;
        height:100%;
        width:100%;
    }
    .popup_img {
        position: relative;
        margin:0 auto;
        z-index:2;
        max-height:94%;
        max-width:94%;
        margin:1% 0 0 0;
    }
</style>

