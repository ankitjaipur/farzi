<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="WebApplication2._Default" %>
    
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<div id="fb-root"></div>
<script type="text/javascript">

    window.fbAsyncInit = function () {
        FB.init({
            appId: '217124298420965', // App ID
            channelUrl: 'http://local.yumixo.com/channel.html', // Channel File
            status: true, // check login status
            cookie: true, // enable cookies to allow the server to access the session
            xfbml: true  // parse XFBML
        });

        FB.getLoginStatus(function (response) {
            alert(response.status);
            if (response.status === 'connected') {
                // connected
                var postUrl = "";
                postUrl += "/Account/RegisterWithFb?";
                postUrl += "fbId=" + response.authResponse.userID;
                postUrl += "&fbToken=" + response.authResponse.accessToken;
                postUrl += "&email=" + "";
                postUrl += "&clientVersion=" + "Yumixo Web Client";
                postUrl += "&language=" + "en";
                $.ajax({
                    type: 'POST',
                    url: postUrl,
                    success: function (data) {
                        window.location.href = "Account/MyProfile";
                    }
                });
            } else if (response.status === 'not_authorized') {
                // not_authorized
                login();
            } else {
                // not_logged_in
                login();
            }
        });
    };

    function login() {
        FB.login(function (response) {
            if (response.authResponse) {
                // connected
                testAPI();
            } else {
                // cancelled
            }
        });
    }

    function testAPI() {
        FB.api('/me/feed', 'post', {
            message: 'my_message',
            link: 'www.google.com',
            name: 'Ankit',
            description: 'description'
        }, function (data) {
            alert(data);
        });
    }

    // Load the SDK Asynchronously
    (function (d) {
        var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
        if (d.getElementById(id)) { return; }
        js = d.createElement('script'); js.id = id; js.async = true;
        js.src = "//connect.facebook.net/en_US/all.js";
        ref.parentNode.insertBefore(js, ref);
    } (document));

</script>
    <h2>
        Welcome to ASP.NET!
    </h2>
    <p>
        To learn more about ASP.NET visit <a href="http://www.asp.net" title="ASP.NET Website">www.asp.net</a>.
    </p>
    <p>
        You can also find <a href="http://go.microsoft.com/fwlink/?LinkID=152368&amp;clcid=0x409"
            title="MSDN ASP.NET Docs">documentation on ASP.NET at MSDN</a>.
    </p>
</asp:Content>
