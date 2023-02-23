 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="Demo.PlaceOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <%--<form id="form1" runat="server">
        <div>
        </div>
    </form>--%>
    <%--<center>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
       <%-- <script src="Index.js"></script>--%>
    <%--<script src="Index.js"></script>--%>
    <%--<script src="Index.js"></script>--%>
    <%--<script async = " "
       src="https://pay.google.com/gp/p/js/pay.js"
       onload="onGooglePayLoaded()"></script>
    <button type="button" id="buy-now">buynow</button>
    </center>--%>

   <%--<script>

      /* window.location = "AddtoCart.aspx";*/
       ScriptManager.RegisterStartupScript(this, this.grandtotal(),  "javascript:window.open( 'AddtoCart.aspx.cs','_blank','height=600px,width=600px,scrollbars=1');", true);
   </script>--%>
    
    <input type="button" value="summa" onclick="tit()" />
    <script>
        function tit() {
            /*var b = "tftfjb";*/
            window.location = "Archieve.js";
            /*window.location.href = "Archieve.html?text="+b+ "&test2=2";*/
            
            alert(2);
        }
        
    </script>


</body>
</html>
