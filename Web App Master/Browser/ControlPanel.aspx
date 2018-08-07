<%@ Page Title="Control Panel" Async="true" ValidateRequest="false" EnableEventValidation="false" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ControlPanel.aspx.cs" Inherits="Web_App_Master.Browser.ControlPanel" %>
<asp:Content ID="ControlPanelContent" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .inner {
            padding-left:0px !important;
            padding-right:0px !important;
            padding-top:0px !important;
        }
        .panel-heading{
            padding:2px 15px 2px 15px!important;
        }
        a{
            color: black;
        }
        a:hover a:focus{
            text-decoration:none;
            color: rgba(0, 175, 240, 1) !important;
            text-shadow: 0px 0px 5px rgba(0, 0, 0, 1) !important;
        }
    </style>
         <%--<link href="BrowserContent/awp.css" rel="stylesheet" />--%>
    <link href="BrowserContent/browser.css" rel="stylesheet" />
    <link href="BrowserContent/jquery-ui.css" rel="stylesheet" />
    <link href="BrowserContent/jquery.contextMenu.css" rel="stylesheet" />
    <link href="BrowserContent/L0XX0R.css" rel="stylesheet" />

    <script src="BrowserScripts/jquery-ui.js"></script>
    <script src="BrowserScripts/jquery.contextMenu.js"></script>
    <script src="BrowserScripts/jquery.ui.position.js"></script>   
    <script src="BrowserScripts/browser.js"></script>
    <script src="BrowserScripts/jquery-resizable.js"></script>    
    <script type="text/javascript">
        //SuperFunction
        function Super(arg) {
            var arg = $("#SuperButtonArg");
            var btn = $("#SuperButton");
            $("#SuperButtonArg").val(arg);
            $("#SuperButton").click();
        }
    </script>
        <div id="appcontainer" style="z-index:900000 !important">           
        <div id="toolbar" style="height:0px !important;">       
            <div class="l0x-toolbar">
                <asp:UpdatePanel runat="server" ID="AppToolbarUpdatePanel" UpdateMode="Conditional" ChildrenAsTriggers="true" >
                    <ContentTemplate>                     
     
                    </ContentTemplate>
                   
                </asp:UpdatePanel>
                
            </div>
        </div>
        <div id="browserbox">
            <%--Modals--%>
            <div class="app-modal transition-top" id="CreateOfficePersonnelModal" style="display:none">
                <span class="app-modal-closer" onclick="HideDiv('CreateOfficePersonnelModal')" ><strong>X</strong></span>
                 <span><h4>Create</h4></span>
                <div>
                    <input runat="server" id="COPNameTextBox" type="text" class=" form-control" placeholder="Name..." /><br />
                    <input runat="server" id="COPEmailTextBox" type="text" class="form-control" placeholder="Email..." /><br />
                </div>
                <div>
                    <asp:Button OnClientClick="HideDiv('CreateOfficePersonnelModal')"  ID="COPOkBtn" CssClass="btn"  ClientIDMode="Static" runat="server" Text="Ok" OnClick="COPOkBtn_Click" />
                </div>        
            </div>
            <%--Browser--%>
            <div class="wrap">
                <div class="resizable resizable1">
                    <div class="inner">     
                         <asp:UpdatePanel runat="server" ID="AppLeftPanelUpdatePanel" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:TreeView 
                                     EnableViewState="true"                                    
                                     ViewStateMode="Enabled"  
                                     ShowLines="false" 
                                     runat="server"
                                     ID ="DirTree" 
                                     ClientIDMode="Static" 
                                     NodeWrap="false"      
                                ></asp:TreeView>    
                            </ContentTemplate>
                            
                        </asp:UpdatePanel>
                        
                    </div>  
                </div>
                <div class="resizable resizable2">
                    <div class="inner">   
                        <asp:UpdatePanel runat="server" ID="AppRightPanelUpdatePanel" UpdateMode="Conditional" >
                            <ContentTemplate>
                                     <nav class="navbar navbar-inverse  bg-grayDark" style="border-bottom-left-radius:8px !important;border-bottom-right-radius:0px !important;border-top-left-radius:0px !important;border-top-right-radius:0px !important; position:fixed; padding-right:25px; width:auto; right:0px; text-align:left !important; margin-top:-23px !important; margin-left:7px!important; z-index:25000; vertical-align:top">
                                          <div class="container-fluid">
                                            <div class="navbar-header">
                                              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#CustomerMenu" style="float:left !important">
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>
                                                <span class="icon-bar"></span>                        
                                              </button>
      
                                            </div>
                                            <div id="CustomerMenu" class="collapse navbar-collapse" >
                                              <ul class="nav navbar-nav starrag-menu">
                                                  <li class="dropdown">
                                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-cog"></i>
                                                    <span class="caret"></span></a>
                                                    <ul class="dropdown-menu starrag-menu">
                                                        <li><a href="#" onclick="ToggleList();" >Toggle List</a></li>                
                                                    </ul>
                                                  </li>
                                                  <li style="margin-top:10px;">
                                                       <div class="  text" data-role="input" style="width:250px !important; vertical-align:middle!important">
                                                           <asp:TextBox ID="avSearchString" runat="server" ClientIDMode="Static" CssClass="form-control"></asp:TextBox>
                                                       </div>
                                                  </li>
                                                  <li>             
                                                       <asp:LinkButton ID ="AssetSearchBtn" ClientIDMode="Static" runat="server"  OnClick="SearchButton_Click"><span class="glyphicon glyphicon-search""></span></asp:LinkButton>
                                                  </li>                                                     
                                                  <li class="dropdown">
                                                    <a class="dropdown-toggle" data-toggle="dropdown" href="#"><i class="glyphicon glyphicon-plus av-hand-cursor"></i>
                                                    <span class="caret"></span></a>
                                                    <ul class="dropdown-menu pull-right starrag-menu">
                                                        <li><a href="#" >Static Email</a></li>   
                                                        <li><a href="#" >Customer</a></li>  
                                                        <li><a href="#" onclick="ShowDiv('CreateOfficePersonnelModal');"  >Office Personnel</a></li>  
                                                        <li><a href="#" >Field Personnel</a></li>  
                                                        <li><a href="#" >Asset</a></li>  
                                                    </ul>
                                                  </li>
                                                  <li id="ControlPanelSave" runat="server">
                                                      <asp:LinkButton ID ="ControlPanelSaveBtn" OnClientClick="ShowLoader();  setTimeout(HideLoader, 2000);" ToolTip="Save" ClientIDMode="Static" runat="server"  OnClick="ControlPanelSaveBtn_Click"><i class="glyphicon glyphicon-floppy-disk av-hand-cursor fg-starrag"></i></asp:LinkButton>
                                                  </li>                                                    
                                              </ul>   
                                            </div>
                                          </div>
                                        </nav>
<%--<div style="height:40px"></div>--%>
                                <asp:MultiView ID ="AppRightPanelMultiView" EnableViewState="false"  ActiveViewIndex="0" runat="server">
                                    <%--Settings View--%>
                                    <asp:View ID="SettingsView" runat="server">      
                                        <asp:UpdatePanel runat="server" ID="SettingsViewUpdatePanel" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:MultiView ID="SettingsMultiview" ActiveViewIndex="0" runat="server">
                                                    <asp:View ID="GeneralSettingsView" runat="server">
                                                        <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                            <span class="shadow-metro-black"><strong><h3>Control Panel</h3></strong></span>
                                                        </div>
                                                        
                                                        <fieldset class="groupbox-border">
                                                            <legend class="groupbox-border fg-l0xx0r">Database Settings</legend>
                                                            <asp:CheckBox Text="Test Mode" ID="TESTMODE_CHECKBOX" runat="server" />
                                                        </fieldset>
                                                    </asp:View>
                                                    <asp:View ID="UserSettingsView" runat="server">
                                                        <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                            <span class="shadow-metro-black"><strong><h3>User Settings</h3></strong></span>
                                                        </div>
                                                        <hr />
                                                        <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                            <span class="shadow-metro-black"><strong><h4>Roles</h4></strong></span>
                                                        </div>
                                                        <asp:UpdatePanel ChildrenAsTriggers="true" ID="RolesUpdatePanel" ClientIDMode="Static" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <asp:Repeater ID="RolesAndUsersRepeater" OnItemDataBound="RolesAndUsersRepeater_ItemDataBound" ClientIDMode="Static" runat="server" ViewStateMode="Enabled" EnableViewState="true">
                                                                    <HeaderTemplate>
                                                                        <div class="panel-group" id="rolesAccordion">
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <div class="panel panel-default">
                                                                            <div class="panel-heading">
                                                                            <h3 class="panel-title text-left">
                                                                                <a data-toggle="collapse" data-parent="#rolesAccordion" href='#collapse<%# Container.ItemIndex + 1%>'>
                                                                                    <h5><%# Eval("RoleName")%></h5>
                                                                                </a>
                                                                            </h3>
                                                                            </div>
                                                                            <div id='collapse<%# Container.ItemIndex + 1%>' class="panel-collapse collapse">
                                                                            <div class="panel-body text-left">
                                                                                <!--Repeaters for users of this role-->
                                                                                <asp:Repeater DataSource='<%# Eval("RoleUsers")%>' runat="server">
                                                                                    <ItemTemplate>
                                                                                        <div class="row bg-sg-box">                                           
                                                                                                <div class="col-sm-12  text-left bg-white" style="width:auto !important">
                                                                                                    <asp:Button ToolTip="Delete User From Role" ID="DeleteFromRole" CssClass="btn btn-sm" runat="server" Text="X" Font-Bold="true" CommandName='<%#Eval("UserId")%>' CommandArgument='<%#Eval("RoleId") %>' OnCommand="DeleteFromRole_Command" />
                                                    
                                                                                                    <asp:DropDownList ClientIDMode="Static" ID='RoleDropDown' AppendDataBoundItems="true" runat="server" DataSource='<%#GetRoleNames() %>'  CssClass="dropdown-button">
                                                                                                        <asp:ListItem Text="--Select One--" Value="" /> 
                                                                                                    </asp:DropDownList>
                                                                                                    <asp:Button ToolTip="Copy User To ROle" ID="CopyRole" CssClass="btn btn-sm" runat="server" Text="Copy" Font-Bold="true" CommandName='<%#Eval("UserId")%>' CommandArgument='<%#Eval("RoleId") %>' OnCommand="CopyRole_Command" />
                                                                                                    <asp:Button ToolTip="Change User Role" ID="ChangeRole" CssClass="btn btn-sm" runat="server" Text="Change" Font-Bold="true" CommandName='<%#Eval("UserId")%>' CommandArgument='<%#Eval("RoleId") %>' OnCommand="ChangeRole_Command" />
                                                                                                <strong><%# Eval("UserName")%></strong> 
                                                                                                </div>                      
                                                                                        </div>                                     
                                                                                    </ItemTemplate>
                                                                                </asp:Repeater>
                                                                            </div>
                                                                            </div>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        </div>
                                                                    </FooterTemplate>
                                                                </asp:Repeater>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>

                                                        <hr />

                                                        <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                            <span class="shadow-metro-black"><strong><h4>Users</h4></strong></span>
                                                        </div>
                                                        <asp:UpdatePanel ID="UserUpdatePanel" ChildrenAsTriggers="true" ClientIDMode="Static" UpdateMode="Conditional" runat="server">
                                                            <ContentTemplate>
                                                               <asp:Repeater ID ="UserRepeater" ClientIDMode="Static" runat="server">
                                                                   <ItemTemplate>
                                                                    
                                                                          <div class="border-bottom-blue" style="overflow:hidden">                                        
                                                                                <div class="col-sm-12 fg-black" style="width:auto !important; padding-left:10px; text-align:left; font-weight:normal !important">
                                                                                    <asp:Button Height="25" Width="15" ToolTip="Delete User" ID="DeleteTransactionBtn" CssClass="btn btn-sm" runat="server" Text="X" Font-Bold="true" CommandName='<%#Eval("UserId")%>' CommandArgument='<%#Eval("RoleId")%>'  OnCommand="DeleteUser_Command"/>
                                                                                    <span><%# Eval("UserName")%></span>
                                                                                </div>  
                                                                        </div>
                                                                   </ItemTemplate>
                                                               </asp:Repeater>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </asp:View>
                                                    <asp:View ID="DatabaseSettingsView" runat="server">
                                                        <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                            <span class="shadow-metro-black"><strong><h3>Database Settings</h3></strong></span>
                                                        </div>
                                                        <hr />
                                                        <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                            <span class="shadow-metro-black"><strong><h4>Sql</h4></strong></span>
                                                            <span>
                                                                <asp:Button OnClientClick="ShowLoader()" ID="SendSQL" CssClass="btn" ClientIDMode="Static" runat="server" Text="Asset Library to SQL" OnClick="SendSQL_Click" />
                                                                <asp:Button OnClientClick="ShowLoader()"  ID="SendSettingsSQL" CssClass="btn"  ClientIDMode="Static" runat="server" Text="Settings To SQL" OnClick="SendSettingsSQL_Click" />
                                                                <asp:Button OnClientClick="ShowLoader()"  ID="PullSettings" CssClass="btn"  ClientIDMode="Static" runat="server" Text="SQL To Settings" OnClick="PullSettings_Click" />
                                                                <asp:Button OnClientClick="ShowLoader()"  ID="PullSQL" CssClass="btn"  ClientIDMode="Static" runat="server" Text="SQL to Asset Library" OnClick="PullSQL_Click" />
                                                                <asp:Button OnClientClick="ShowLoader()"  ID="DeleteSQL" CssClass="btn"  ClientIDMode="Static" runat="server" Text="Erase SQL DataBase" OnClick="DeleteSQL_Click" />
                                                                <asp:Button OnClientClick="ShowLoader()"  ID="DeleteSettingsSQL" CssClass="btn"  ClientIDMode="Static" runat="server" Text="Erase Settings SQL" OnClick="DeleteSettingsSQL_Click" />
                                                            </span>
                                                        </div>
                                                        <hr />
                                                        <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                            <span class="shadow-metro-black"><strong><h4>Import / Export</h4></strong></span>
                                                            <asp:Button ID="ExportLibraryBtn" CssClass="btn" ClientIDMode="Static" runat="server" Text="Export Library" OnClick="ExportLibraryBtn_Click" />
                                                            <asp:Button  ID="ExportXmlBtn" CssClass="btn" ClientIDMode="Static" runat="server" Text="Export Xml" OnClick="ExportXmlBtn_Click" />
                                                            <asp:Button OnClientClick="ShowLoader()" ID="ImportLibraryBtn" CssClass="btn" ClientIDMode="Static" runat="server" Text="Import Library" OnClick="ImportLibraryBtn_Click" />
                                                            <fieldset class="groupbox-border">
                                                            <legend class="groupbox-border fg-l0xx0r">Legacy Windows App</legend>
                                                                <asp:FileUpload ID="HistoryUploader" runat="server" Width="250px" />
                                                                <asp:Button OnClientClick="ShowLoader();"  ID="UploadHistory" ClientIDMode="Static" CssClass=" btn" runat="server" Text="Upload History File" OnClick="UploadHistory_Click" />
                                                                <asp:FileUpload ID="NoticeUploader" runat="server" Width="250px" CssClass="text-center" />
                                                                <asp:Button OnClientClick="ShowLoader();"  ID="UploadNotices" ClientIDMode="Static" CssClass="btn" runat="server" Text="Upload Notices File" OnClick="UploadNotices_Click" />
                                                                <asp:FileUpload ID="LibraryUploader" runat="server" Width="250px" />
                                                                <asp:Button  OnClientClick="ShowLoader();"  ID="UploadLibrary" ClientIDMode="Static" CssClass="btn" runat="server" Text="Upload Asset File" OnClick="UploadLibrary_Click" />
                                                            </fieldset>
                                                        </div>
                                                        <hr />
                                                        <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                            <span class="shadow-metro-black"><strong><h4>Email / Messaging</h4></strong></span>
                                                            <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                                <span class="shadow-metro-black"><strong><h5>Checkout Email Body</h5></strong></span>
                                                                <div class=" textarea" style="min-height:75px !important; padding:3px"><textarea style="width:100%; height:75px"  class="form-control" id="checkoutmsgbox" runat="server" ></textarea></div>
                                                            </div>
                                                            <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                                <span class="shadow-metro-black"><strong><h5>Checkin Email Body</h5></strong></span>
                                                                <div class=" textarea " style="min-height:75px !important; padding:3px"><textarea style="width:100%; height:75px"  class="form-control textarea form-control" id="checkinmsgbox" runat="server" ></textarea></div>
                                                            </div>
                                                            <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                                <span class="shadow-metro-black"><strong><h5>Notification Email Body</h5></strong></span>
                                                                <div class=" textarea" style="min-height:75px !important; padding:3px"><textarea style="width:100%; height:75px"  class="form-control" id="notificationmsgbox" runat="server" ></textarea></div>
                                                            </div>
                                                            <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                                <span class="shadow-metro-black"><strong><h5>Office Personnel Email Body</h5></strong></span>
                                                                <div class=" textarea" style="min-height:75px !important; padding:3px"><textarea style="width:100%; height:75px" class="form-control" id="shipmsgbox" runat="server" ></textarea></div>
                                                            </div>
                                                        </div>
                                                        <hr />
                                                        <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                            <span class="shadow-metro-black"><strong><h4>Shipping Services</h4></strong></span>
                                                            <fieldset class="groupbox-border">                                                            
                                                            <legend class="groupbox-border fg-l0xx0r">UPS Settings</legend>
                                                            <input runat="server" id="ups_aln" type="text" class="form-control" placeholder="Access License #..." />
                                                            <input runat="server" id="ups_userid" type="text" class="form-control" placeholder="User ID..." />
                                                            <input runat="server" id="ups_pwd" type="password" class="form-control" placeholder="Password..." />
                                                            <input runat="server" id="ups_shippernumber" type="text" class="form-control" placeholder="Shipper #" />
                                                            </fieldset>
                                                            <fieldset class="groupbox-border">
                                                            <legend class="groupbox-border fg-l0xx0r">Fedex Settings</legend>
                                                    
                                                            </fieldset>
                                                        </div>
                                                    </asp:View>
                                                </asp:MultiView>                                                
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="AssetSearchBtn" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:View>
                                    <%--Transaction View--%>
                                    <asp:View ID="TransactionsView" runat="server">
                                        <asp:MultiView ID ="TransactionMultiView" ActiveViewIndex="0" runat="server">
                                            <asp:View ID="TransactionList" runat="server">
                                                <asp:UpdatePanel runat="server" ID="TransactionListUpdatePanel" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                            <span class="fg-black shadow-metro-black"><strong><h3>Transactions</h3></strong></span>
                                                        </div>
                                                        <asp:Repeater ID="TransactionRepeater" ClientIDMode="Static" runat="server" OnItemDataBound="TransactionRepeater_ItemDataBound1">
                                                                        <ItemTemplate>
                                                                            <div class="border-bottom-blue" style="overflow:hidden">                                        
                                                                                    <div class="col-sm-12 fg-black" style="width:auto !important; padding-left:10px; text-align:left; font-weight:normal !important">
                                                                                        <asp:Button Height="25" Width="15" ToolTip="Delete Transaction" ID="DeleteTransactionBtn" CssClass="btn btn-sm" runat="server" Text="X" Font-Bold="true" CommandName='<%#Eval("Name")%>' CommandArgument='<%#Eval("TransactionID")%>'  OnCommand="DeleteTransactionBtn_Command"/>
                                                                                        <a title="Complete Transaction" style="font-weight:bold" class="btn btn-sm fg-black shadow-metro-black" href='/Account/OutCart.aspx?pend=<%#Eval("TransactionID")%>'>></a>    
                                                                                        <a style="text-decoration:none" href='/Account/Transactions.aspx?tid=<%#Eval("TransactionID")%>'><span class="fg-black shadow-metro-black"><%# ((DateTime)Eval("Date")).ToShortDateString()%></span>&nbsp-&nbsp <span class="fg-black shadow-metro-black"><%# Eval("Name")%></span><span class="fg-black shadow-metro-black"> &nbsp-&nbsp  <span class="fg-black shadow-metro-black"><%# (Eval("Customer") as Helpers.Customer).CompanyName%></span> <asp:Literal Text="" runat="server" ID="TransactionLiteral"  /></a>
                                                                                    </div>  
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </asp:View>
                                             <asp:View ID="IndividualTRansaction" runat="server">
                                                 <asp:UpdatePanel runat="server" ID="IndividualTransactionUpdatePanel" UpdateMode="Conditional">
                                                     <ContentTemplate>
                                                         <div class="awp_box_title">
                                                            Transaction
                                                        </div>
                                                                 <div class="col-md-12 fg-white shadow-metro-black" >
                                                   <div style="width:auto; opacity:0.75 !important; font-weight:bold" class="bg-sg-title rounded">
                                                                     <span class=" top-right-btn bg-green"><a style="text-decoration:none!important;" class="fg-white" title="Complete Transaction" href='/Account/OutCart.aspx?pend=<%= TID%>'>Complete</a></span>

                                                        <div>
                                                            <span>Confimation Number:  <%= TID %></span>
                                                        </div>
                                                        <div>
                                                        <span>Ship To:  <%= ShipToName %></span>
                                                        </div>
         
                                                        <div>
                                                            <span><a href='mailto:<%= Email %>'> Email:  <%= Email %></a></span>
                                                        </div>
                                                        <div>
                                                            <span>Comment:  <%= OrderNumber %></span>
                                                        </div>
                                                    </div>
        
                                                </div>
                                                <div class="col-md-12">
                                                    <div>
                                                        <asp:Repeater ID="TransactionItemRepeater"  runat="server" OnItemCommand="TransactionItemRepeater_ItemCommand">
                                                            <ItemTemplate>
                                                                    <div  class="file " title='' draggable="true"  onclick="BarcodeScanned('<%# Eval("AssetNumber")%>', '<%# Eval("IsHistoryItem")%>','<%# Eval("DateShippedTicks")%>');">
                                                                            <div id =" file-color " class="file-color <%# Eval("Color") %>" style="width:100%; height:100%;"></div>

                                                                    <div class="i-icon">   
                                                                        <img style="box-shadow: rgba(0, 0, 0, 0.70) 0px 0px 10px;" src='<%# Eval("FirstImage")+".r?w=133&h=100" %>' />
                                                                    </div>

                                                                    <div runat="server" class="i-title"><strong class="fg-white shadow-metro-black"><%# Eval("AssetName") %></strong> </div>
  
                                                                    <div class="i-check">
                                                                <span id="InOutIndicator"  runat="server" class="edge-badge fg-white shadow-metro-black icon-badge " style="z-index:3 !important;"><strong><%# Eval("AssetNumber")%></strong></span></div>
                                                                        <div runat="server" id="DownloadLink" class="i-download" style="margin-top:-4px;padding-left:2px" onclick="event.stopPropagation();">  <asp:LinkButton ID="RemoveFromCheckOutButton" CommandName="Delete" CommandArgument='<%# Eval("AssetNumber")%>' runat="server"  > <i title="Add To Task List" id="dl_link"  style="font-size:1.5em;" class="glyphicon glyphicon-remove c-red  av-hand-cursor"></i></asp:LinkButton>       

   
                                                                </div>

                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </div>
                                                </div>

                                                     </ContentTemplate>
                                                 </asp:UpdatePanel>
                                            </asp:View>
                                        </asp:MultiView>
                                    </asp:View>
                                    <%--Customer View--%>
                                    <asp:View ID="CustomersView" runat="server">
                                        <asp:UpdatePanel runat="server" ID="CustomerUpdatePanel" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                    <span class="fg-black shadow-metro-black"><strong><h3>Customers</h3></strong></span>
                                                </div>
                                                <asp:Repeater ID="CustomersRepeater" ClientIDMode="Static" runat="server">
                                                                <ItemTemplate>
                                                                    <div class="border-bottom-blue" style="overflow:hidden">                                        
                                                                            <div class="col-sm-12 fg-black" style="width:auto !important; padding-left:10px; text-align:left; font-weight:normal !important">
                                                                                <asp:Button Height="25" Width="15" ToolTip="Delete Customer" ID="DeleteCustomerBtn" CssClass="btn btn-sm" runat="server" Text="X" Font-Bold="true" CommandName='<%#Eval("CompanyName")%>' CommandArgument='<%#Eval("Postal")%>'  OnCommand="DeleteCustomerBtn_Command"/>
                                                                                <a title="Edit Customers" style="font-weight:bold" class="btn btn-sm fg-black shadow-metro-black" href="#">(Edit)</a>    
                                                                                <span ><%# Eval("CompanyName") %>&nbsp-&nbsp<%# Eval("Address") %> ,<%# Eval("Postal") %> </span>
                                                                                <a href='mailto:<%# Eval("Email") %>'>Email: <%# Eval("Email") %></a>
                                                                            </div>  
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="AssetSearchBtn" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:View>
                                    <%--Personnel View--%>
                                    <asp:View ID="PersonnelView" runat="server">
                                        <asp:UpdatePanel ID="PersonnelViewMasterUpdatePanel" UpdateMode="Conditional" runat="server">
                                            <ContentTemplate>
                                                <asp:MultiView ID="PersonnelMultiView" ActiveViewIndex="0" runat="server">
                                                    <asp:View ID="PersonnelMainView" runat="server">
                                                        <asp:UpdatePanel runat="server" ID="PersonnelMainViewUpdatePanel" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                                    <span class="fg-black shadow-metro-black"><strong><h3>Office Personnel</h3></strong></span>
                                                                </div>
                                                                <asp:Repeater ID="PersonnelOfficeMainViewRepeater" ClientIDMode="Static" runat="server">
                                                                    <ItemTemplate>
                                                                        <div class="border-bottom-blue" style="overflow:hidden">                                        
                                                                                <div class="col-sm-12 fg-black" style="width:auto !important; padding-left:10px; text-align:left; font-weight:normal !important">
                                                                                    <asp:Button Height="25" Width="15" ToolTip="Delete" ID="DeleteOfficePersonnelBtn2" CssClass="btn btn-sm" runat="server" Text="X" Font-Bold="true" CommandName='<%#Eval("Name")%>' CommandArgument='<%#Eval("Email")%>'  OnCommand="DeleteOfficePersonnel_Command"/>
                                                                                    <a title="Edit" style="font-weight:bold" class="btn btn-sm fg-black shadow-metro-black" href="#">(Edit)</a>    
                                                                                    <span ><%# Eval("Name") %>&nbsp-&nbsp</span>
                                                                                    <a href='mailto:<%# Eval("Email") %>'>Email: <%# Eval("Email") %></a>
                                                                                </div>  
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                                <hr />
                                                                <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                                    <span class="fg-black shadow-metro-black"><strong><h3>Field Personnel</h3></strong></span>
                                                                </div>
                                                                <asp:Repeater ID="PersonnelFieldMainViewRepeater" ClientIDMode="Static" runat="server">
                                                                    <ItemTemplate>
                                                                        <div class="border-bottom-blue" style="overflow:hidden">                                        
                                                                                <div class="col-sm-12 fg-black" style="width:auto !important; padding-left:10px; text-align:left; font-weight:normal !important">
                                                                                    <asp:Button Height="25" Width="15" ToolTip="Delete" ID="DeleteFieldPersonnelBtn2" CssClass="btn btn-sm" runat="server" Text="X" Font-Bold="true" CommandName='<%#Eval("Name")%>' CommandArgument='<%#Eval("Email")%>'  OnCommand="DeleteFieldPersonnelBtn_Command"/>
                                                                                    <a title="Edit" style="font-weight:bold" class="btn btn-sm fg-black shadow-metro-black" href="#">(Edit)</a>    
                                                                                    <span ><%# Eval("Name") %>&nbsp-&nbsp</span>
                                                                                    <a href='mailto:<%# Eval("Email") %>'>Email: <%# Eval("Email") %></a>
                                                                                </div>  
                                                                        </div>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="AssetSearchBtn" EventName="click" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>

                                                    </asp:View>
                                                     <asp:View ID="PersonnelOfficeView" runat="server">
                                                        <asp:UpdatePanel runat="server" ID="PersonnelOfficeUpdatePanel" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                                    <span class="fg-black shadow-metro-black"><strong><h3>Office Personnel</h3></strong></span>
                                                                </div>
                                                                <asp:Repeater ID="PersonnelOfficeRepeater" ClientIDMode="Static" runat="server">
                                                                                <ItemTemplate>
                                                                                    <div class="border-bottom-blue" style="overflow:hidden">                                        
                                                                                            <div class="col-sm-12 fg-black" style="width:auto !important; padding-left:10px; text-align:left; font-weight:normal !important">
                                                                                                <asp:Button Height="25" Width="15" ToolTip="Delete" ID="DeleteOfficePersonnel" CssClass="btn btn-sm" runat="server" Text="X" Font-Bold="true" CommandName='<%#Eval("Name")%>' CommandArgument='<%#Eval("Email")%>'  OnCommand="DeleteOfficePersonnel_Command"/>
                                                                                                <a title="Edit" style="font-weight:bold" class="btn btn-sm fg-black shadow-metro-black" href="#">(Edit)</a>    
                                                                                                <span ><%# Eval("Name") %>&nbsp-&nbsp</span>
                                                                                                <a href='mailto:<%# Eval("Email") %>'>Email: <%# Eval("Email") %></a>
                                                                                            </div>  
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="AssetSearchBtn" EventName="click" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>

                                                    </asp:View>
                                                     <asp:View ID="PersonnelFieldView" runat="server">
                                                        <asp:UpdatePanel runat="server" ID="PersonnelFieldUpdatePanel" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                                    <span class="fg-black shadow-metro-black"><strong><h3>Field Personnel</h3></strong></span>
                                                                </div>
                                                                <asp:Repeater ID="PersonnelFieldRepeater" ClientIDMode="Static" runat="server">
                                                                                <ItemTemplate>
                                                                                    <div class="border-bottom-blue" style="overflow:hidden">                                        
                                                                                            <div class="col-sm-12 fg-black" style="width:auto !important; padding-left:10px; text-align:left; font-weight:normal !important">
                                                                                                <asp:Button Height="25" Width="15" ToolTip="Delete" ID="DeleteFieldPersonnelBtn" CssClass="btn btn-sm" runat="server" Text="X" Font-Bold="true" CommandName='<%#Eval("Name")%>' CommandArgument='<%#Eval("Email")%>'  OnCommand="DeleteFieldPersonnelBtn_Command"/>
                                                                                                <a title="Edit" style="font-weight:bold" class="btn btn-sm fg-black shadow-metro-black" href="#">(Edit)</a>    
                                                                                                <span ><%# Eval("Name") %>&nbsp-&nbsp</span>
                                                                                                <a href='mailto:<%# Eval("Email") %>'>Email: <%# Eval("Email") %></a>
                                                                                            </div>  
                                                                                    </div>
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="AssetSearchBtn" EventName="click" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>

                                                    </asp:View>
                                                </asp:MultiView>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="AssetSearchBtn" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>

                                    </asp:View>
                                    <%--Notification View--%>
                                    <asp:View ID="NotificationsView" runat="server">
                                        <asp:UpdatePanel runat="server" ID="NotificationsViewUpdatePanel" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                    <span class="fg-black shadow-metro-black"><strong><h3>Notifications</h3></strong></span>
                                                </div>
                                                <asp:Repeater ID="NotificationsRepeater" ClientIDMode="Static" runat="server">
                                                    <ItemTemplate>
                                                        <div class="border-bottom-blue" style="overflow:hidden">                                        
                                                                <div class="col-sm-12 fg-black" style="width:auto !important; padding-left:10px; text-align:left; font-weight:normal !important">
                                                                    <asp:Button  Height="25" Width="15" ToolTip="Delete Notice" ID="DeleteNoticeBtn" CssClass="btn btn-sm" runat="server" Text="X" Font-Bold="true" CommandName='<%#Eval("NoticeControlNumber")%>' CommandArgument='<%#Eval("GUID")%>'  OnCommand="DeleteNoticeBtn_Command" />
                                                                    <asp:Button  Height="25" Width="15" ToolTip="Send Notice" ID="SendNoticeBtn" CssClass="btn btn-sm" runat="server" Text="Send" Font-Bold="true" CommandName='<%#Eval("NoticeControlNumber")%>' CommandArgument='<%#Eval("GUID")%>' OnCommand="SendNoticeBtn_Command" />
                                                                    <a title="Edit Notification" style="font-weight:bold" class="btn btn-sm fg-black shadow-metro-black" href="#">(Edit)</a>    
                                                                    <span ><%# Eval("Name") %>&nbsp-&nbsp Scheduled in: &nbsp<%# Eval("DaysUntil").ToString()%>&nbsp Days</span>
                                                                </div>  
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="AssetSearchBtn" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>

                                    </asp:View>
                                    <%--Asset View --%>
                                    <asp:View ID="AssetsView" runat="server">
                                        <asp:UpdatePanel runat="server" ID="AssetsUpdatePanel" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div class=" border-bottom-blue" style="margin:0px !important; padding-left:15px">
                                                    <span class="fg-black shadow-metro-black"><strong><h3>Assets</h3></strong></span>
                                                </div>
                                                <asp:Repeater ID="AssetsRepeater" ClientIDMode="Static" runat="server">
                                                    <ItemTemplate>
                                                        <div class="border-bottom-blue" style="overflow:hidden">                                        
                                                                <div class="col-sm-12 fg-black" style="width:auto !important; padding-left:10px; text-align:left; font-weight:normal !important">
                                                                    <asp:Button  Height="25" Width="15" ToolTip="Delete Asset" ID="DeleteAssetBtn" CssClass="btn btn-sm" runat="server" Text="X" Font-Bold="true" CommandName="delete" CommandArgument='<%#Eval("AssetNumber")%>'  OnCommand="DeleteAssetBtn_Command" />
                                                                    <a title="Edit Asset" style="font-weight:bold" class="btn btn-sm fg-black shadow-metro-black" href="#"  onclick="BarcodeScanned('<%# Eval("AssetNumber")%>', '<%# Eval("IsHistoryItem")%>','<%# Eval("DateShippedTicks")%>');">(Edit)</a>    
                                                                    <span ><%# Eval("AssetNumber") %>&nbsp-&nbsp<%# Eval("AssetName") %>&nbsp-&nbsp Is Out: <%# Eval("IsOut").ToString() %></span>
                                                                </div>  
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:AsyncPostBackTrigger ControlID="AssetSearchBtn" EventName="click" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </asp:View>
                                </asp:MultiView>
                            </ContentTemplate>
                             <%--<Triggers>
                                 <asp:AsyncPostBackTrigger ControlID="DirTree" EventName="SelectedNodeChanged" />
                             </Triggers>--%>
                        </asp:UpdatePanel>
                       
                    </div>  
                </div>
            </div>
         </div>
        <div id="footer" style="overflow:hidden !important;">
            <asp:UpdatePanel runat="server" ID="AppFooterUpdatePanel" UpdateMode="Conditional" ChildrenAsTriggers="true" >
                <ContentTemplate>
                    Take Care!
                </ContentTemplate>
                
            </asp:UpdatePanel>
          
        </div>
    </div>
    <asp:TextBox runat="server" ID ="CurrentView" ClientIDMode="Static" style="display:none"></asp:TextBox>
    <asp:TextBox runat="server" ID ="AppArgument" ClientIDMode="Static" style="display:none"></asp:TextBox>
    <asp:TextBox runat="server" ID ="AppCommand" ClientIDMode="Static" style="display:none"></asp:TextBox>
    <asp:TextBox runat="server" ID ="SuperButtonArg" ClientIDMode="Static" style="display:none"></asp:TextBox>
    <asp:Button ID="SuperButton" runat="server" Text="Super" OnClick="SuperButton_Click" style="display:none" ClientIDMode="Static"/>

 

</asp:Content>
