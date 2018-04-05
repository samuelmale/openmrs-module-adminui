<%
    ui.decorateWith("appui", "standardEmrPage", ["title": "Manage Modules"])
    
    ui.includeCss("adminui", "adminui.css")
    ui.includeCss("referenceapplication", "manageApps.css");
    ui.includeJavascript("adminui", "systemadmin/manageModules.js")
    
%>

<script type="text/javascript">

    var breadcrumbs = [
        {icon: "icon-home", link: '/' + OPENMRS_CONTEXT_PATH + '/index.htm'},
        {
            label: "${ ui.message("adminui.app.myAccount.label")}",
            link: '${ui.pageLink("adminui", "myaccount/myAccount")}'
        },
        {label: "${ ui.message("adminui.myAccount.managemodules.label")}"}

    ];
</script>

<table id="list-roles" cellspacing="0" cellpadding="2">
    <thead>
    <tr>
        <th class="adminui-name-column">${ui.message('general.name')}</th>
        <th>${ui.message('general.author')}</th>
        <th>${ui.message('general.description')}</th>
        <th colspan="2" class="adminui-action-column">${ui.message('general.action')}</th>
    </tr>
    </thead>
    <tbody>
<% loadedModules.each{%> 
<form id="${it.moduleId}-form" method="post"> 
<input type="hidden" name="moduleId" value="${it.moduleId}" /> 
    <tr id="${it.moduleId}" path="${ui.actionLink("adminui", "manageModules", "manageDependecies")}">
        <td valign="top"><%= it.name %></td>
        <td valign="top"><%= it.author %></td>
        <td valign="top"><%= it.description %></td>
      <% if(allowAdmin && !it.mandatory && !it.coreModule) {%>  
        <td valign="top">
        <% if(it.started){ %>
          <i class="icon-stop stop-action" title="${ui.message("Module.stop.help")}" ></i>
        <% } else { %><i class="icon-play play-action" title="${ui.message("Module.start.help")}"></i> <% } %>
        </td>
        
        <td valign="top"><i class="icon-remove delete-action" title="${ ui.message("general.delete") }"></i></td>
      <% } else {%> 
        <td valign="top"><i class="icon-lock lock-action"></i></td>  
      <% } %>  
      
      <div id="stop-module-dialog" class="dialog" style="display: none;">
         <div class="dialog-header">
              <h3>${ ui.message("Module.dependencyValidationNotice")}</h3>
         </div>
         <div class="dialog-content">          
            <ul>
               <li class="info">
                   <span>${ ui.message("Module.dependencyShutdownNotice")}</span>
                </li>
            </ul>

            <button class="confirm right">${ ui.message("emr.yes")}
               <i class="icon-spinner icon-spin icon-2x" style="display: none; margin-left: 10px;"></i>
            </button>
            <button class="cancel">${ ui.message("emr.no")}</button>
          </div>
        </div>
      
    </tr>
</form>    
<% }%>     
    </tbody>
</table>

                     
