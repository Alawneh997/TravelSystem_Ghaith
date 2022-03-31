<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterPage.aspx.cs" Inherits="TravelSystem_Ghaith.Registration.RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-grid.css" rel="stylesheet" />
    <link href="../Content/bootstrap-grid.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap-grid.rtl.css" rel="stylesheet" />
    <link href="../Content/bootstrap-grid.rtl.min.css" rel="stylesheet" />
     <link href="../Content/bootstrap-reboot.css" rel="stylesheet" />
    <script>
      
  $(document).ready(function() {
    $('#contact_form').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            first_name: {
                validators: {
                        stringLength: {
                        min: 2,
                    },
                        notEmpty: {
                        message: 'Please enter your First Name'
                    }
                }
            },
             last_name: {
                validators: {
                     stringLength: {
                        min: 2,
                    },
                    notEmpty: {
                        message: 'Please enter your Last Name'
                    }
                }
            },
			 user_name: {
                validators: {
                     stringLength: {
                        min: 8,
                    },
                    notEmpty: {
                        message: 'Please enter your Username'
                    }
                }
            },
			 user_password: {
                validators: {
                     stringLength: {
                        min: 8,
                    },
                    notEmpty: {
                        message: 'Please enter your Password'
                    }
                }
            },
			confirm_password: {
                validators: {
                     stringLength: {
                        min: 8,
                    },
                    notEmpty: {
                        message: 'Please confirm your Password'
                    }
                }
            },
            email: {
                validators: {
                    notEmpty: {
                        message: 'Please enter your Email Address'
                    },
                    emailAddress: {
                        message: 'Please enter a valid Email Address'
                    }
                }
            },
            contact_no: {
                validators: {
                  stringLength: {
                        min: 12, 
                        max: 12,
                    notEmpty: {
                        message: 'Please enter your Contact No.'
                     }
                }
            },
			 department: {
                validators: {
                    notEmpty: {
                        message: 'Please select your Department/Office'
                    }
                }
            },
                }
            }
        })
        .on('success.form.bv', function(e) {
            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
                $('#contact_form').data('bootstrapValidator').resetForm();

            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            // Use Ajax to submit form data
            $.post($form.attr('action'), $form.serialize(), function(result) {
                console.log(result);
            }, 'json');
        });
});
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

        
<fieldset>

<!-- Form Name -->
<legend><center><h2><b>Registration</b></h2></center></legend><br>

<!-- Text input-->
    <center>
<div class="form-group">
  <label style="width: 455px;text-align: left" class="col-md-4 control-label">Civil ID</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <%--  <input  name="first_name" placeholder="First Name" class="form-control"  type="text">--%>
      <asp:TextBox ID="Civil" runat="server" Width="465px"></asp:TextBox>

      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Civil" ErrorMessage="Please Enter Your Civil ID" ForeColor="Red"></asp:RequiredFieldValidator>

      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Civil" ErrorMessage="Please Enter &quot;10&quot; Digits" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

    </div>
  </div>
</div>
    <div class="form-group">
  <label style="width: 455px;text-align: left" class="col-md-4 control-label">Full Name</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <%--  <input  name="first_name" placeholder="First Name" class="form-control"  type="text">--%><%--<asp:TextBox ID="TextBox1" runat="server" Width="465px"></asp:TextBox>--%>
      <asp:TextBox ID="Full" runat="server" Width="465px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Full" ErrorMessage="Please Enter Your Full Name" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
  </div>
</div>
    <div class="form-group">
  <label style="width: 455px;text-align: left" class="col-md-4 control-label">Email</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <%--  <input  name="first_name" placeholder="First Name" class="form-control"  type="text">--%><%--<asp:TextBox ID="TextBox1" runat="server" Width="465px"></asp:TextBox>--%>
      <asp:TextBox ID="Email" runat="server" Width="465px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Email" ErrorMessage="Please Enter Your Email" ForeColor="Red"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Email" ErrorMessage="Please Enter a Correct Email" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </div>
  </div>
</div>
    <div class="form-group">
  <label style="width: 455px;text-align: left" class="col-md-4 control-label">Password</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <%--  <input  name="first_name" placeholder="First Name" class="form-control"  type="text">--%><%--<asp:TextBox ID="TextBox1" runat="server" Width="465px"></asp:TextBox>--%>
      <asp:TextBox ID="Pass" runat="server" Width="465px" TextMode="Password"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="Pass" ErrorMessage="Please Enter A Password" ForeColor="Red"></asp:RequiredFieldValidator>
      <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Pass" ControlToValidate="Confirm" ErrorMessage="The Passwords Does not Match" ForeColor="Red"></asp:CompareValidator>
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label style="width: 455px;text-align: left" class="col-md-4 control-label" >Confirm Password</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        <asp:TextBox ID="Confirm" runat="server" Width="465px" TextMode="Password"></asp:TextBox>
        <%--  <input name="last_name" placeholder="Last Name" class="form-control"  type="text">--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Confirm" ErrorMessage="Please Confirm Your Password" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
  </div>
</div>


  
<!-- Text input-->

<div class="form-group">
  <label style="width: 455px;text-align: left" class="col-md-4 control-label">Age</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <asp:TextBox ID="Age" runat="server" Width="465px"></asp:TextBox>


 <%-- <input  name="user_name" placeholder="Username" class="form-control"  type="text">--%>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Age" ErrorMessage="Please Enter Your Age" ForeColor="Red"></asp:RequiredFieldValidator>
      <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Age" ErrorMessage="Please Enter a Digits" ForeColor="Red" MaximumValue="60" MinimumValue="18"></asp:RangeValidator>
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label style="width: 455px;text-align: left" class="col-md-4 control-label" >Address</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        <asp:TextBox ID="Address" runat="server" Width="465px"></asp:TextBox>

 <%-- <input name="user_password" placeholder="Password" class="form-control"  type="password">--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Address" ErrorMessage="Please Enter Your Address" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
  </div>
</div>
    <div class="form-group">
  <label style="width: 455px;text-align: left" class="col-md-4 control-label" >PhoneNumber</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
        <asp:TextBox ID="Phonenumber" runat="server" Width="465px"></asp:TextBox>  

 <%-- <input name="user_password" placeholder="Password" class="form-control"  type="password">--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Phonenumber" ErrorMessage="Please Enter Your PhoneNumber" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="Phonenumber" ErrorMessage="Please Enter &quot;10&quot; Digits" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
    </div>
  </div>
</div>

<!-- Text input-->


        
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4"><br>
      <asp:Button ID="OK" runat="server" Text="Register" BackColor="#FFCC00" ForeColor="Black" Width="465px" OnClick="OK_Click" />

  </div>
</div>
    </center>  
</fieldset>
        </div>
    </form>

</body>
</html>
