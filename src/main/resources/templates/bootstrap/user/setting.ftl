<#include "../common/layout.ftl"/>
<@html page_tab="setting">
<div class="row">
  <div class="col-md-9">
    <div class="panel panel-default">
      <div class="panel-heading">
        <a href="/"><@spring.message "site.panel.header.home"/></a> / <@spring.message "site.panel.header.profile"/>
      </div>
      <div class="panel-body">
        <form action="/user/setting" method="post" id="userProfileForm" enctype="multipart/form-data">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          <div class="form-group">
            <label for="username"><@spring.message "site.form.user.name"/></label>
            <input type="text" disabled class="form-control" id="username" value="${user.username}"/>
          </div>
          <div class="form-group">
            <label for="email"><@spring.message "site.form.user.email"/></label>
            <input type="text" class="form-control" id="email" name="email" value="${user.email!}"/>
          </div>
          <div class="form-group">
            <label for="url"><@spring.message "site.form.user.website"/></label>
            <input type="text" class="form-control" id="url" name="url" value="${user.url!}"/>
          </div>
          <div class="form-group">
            <label for="signature"><@spring.message "site.form.user.signature"/></label>
            <textarea class="form-control" name="signature" id="signature">${user.signature!}</textarea>
          </div>
          <div class="form-group">
            <label for="avatar"><@spring.message "site.form.user.avatar"/></label>
            <input type="file" class="form-control" name="avatar" id="avatar"/>
            <br>
            <img src="${user.avatar!}" width="150">
          </div>
          <#if user.block == true>
            <button type="button" disabled="disabled" class="btn btn-default"><@spring.message "site.button.save"/></button>
          <#else>
            <button type="button" id="userProfileUpdateBtn" onclick="updateUserProfile()"
                    class="btn btn-default"><@spring.message "site.button.save"/>
            </button>
          </#if>
          <span id="error_message"></span>
        </form>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <@spring.message "site.panel.header.changePassword"/>
      </div>
      <div class="panel-body">
        <form action="/user/changePassword" method="post">
          <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
          <div class="form-group">
            <label for="oldPassword"><@spring.message "site.form.user.oldPassword"/></label>
            <input type="password" class="form-control" id="oldPassword" name="oldPassword"/>
          </div>
          <div class="form-group">
            <label for="newPassword"><@spring.message "site.form.user.newPassword"/></label>
            <input type="password" class="form-control" id="newPassword" name="newPassword"/>
          </div>
          <#if user.block == true>
            <button type="button" class="btn btn-default" disabled="disabled"><@spring.message "site.button.save"/></button>
          <#else>
            <button type="submit" class="btn btn-default"><@spring.message "site.button.save"/></button>
          </#if>
          <span class="text-danger">${changePasswordErrorMsg!}</span>
        </form>
      </div>
    </div>
  </div>
  <div class="col-md-3 hidden-sm hidden-xs">

  </div>
</div>
</@html>