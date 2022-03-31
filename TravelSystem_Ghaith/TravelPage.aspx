<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="TravelPage.aspx.cs" Inherits="TravelSystem_Ghaith.TravelPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>

<!-- Form Name -->
<legend><center><h2><b>Travel Page</b></h2></center></legend><br>


    <center>

        <asp:GridView ID="GridView1" runat="server"></asp:GridView>


        

    </center>  
</fieldset>
</asp:Content>
