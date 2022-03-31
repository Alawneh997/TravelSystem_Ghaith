<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="UsersPage.aspx.cs" Inherits="TravelSystem_Ghaith.UsersPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset>

        <!-- Form Name -->
        <legend><center><h2><b>Travel Page</b></h2></center></legend><br>


        <center style="padding-bottom: 100px">

            <asp:GridView ID="GridView1" runat="server"></asp:GridView>

        </center>  
    </fieldset>
</asp:Content>
