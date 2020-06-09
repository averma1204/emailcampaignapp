<%@page import="clientModal.templateModal"%>
<%@page import="java.util.List"%>
<%@page import="clientModal.clientmodal"%>
<%@page import="clientModal.clientmodal"%>
<%@page import="clientModal.clientInterface"%>
<%@page import="clientModal.ClientImpl"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>EMAIL CAMPAIGN MANAGER</title>
        <link rel="icon" href="images/dc_logo_icon.png" sizes="16x16" type="image/png">
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

  
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="manifest" href="images/fav/site.webmanifest">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">

        <!-- CSS -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://use.typekit.net/hxv7cob.css">
        <link rel="stylesheet" href="css/ecm-style.css">
        <style>
            /*body {background:#f8f8f8;}*/
        </style>
        <script>
            var cid;
            var sid;
            var campaignID;
            
           function myFunction()
            {
                  <%
                        if(request.getSession().getAttribute("username")==null)
                        {
                            System.out.println("session 222 :"+ session);
                            response.sendRedirect("index.html");
                        }
                        else
                        {
                             System.out.println("session 333 :"+ session);
                         }
                %>
                        alert("asdasd");
              }
              
             function close()
            {
                $('#Delete').modal('hide');
            }
            function viewDelete(id)
            {
                $('#Delete').modal("show");
                this.cid = id;
            }
            function deletePro(id)
            {
                $('#DeleteProg').modal("show");
                this.sid = id;
            }

            function deleteCampaign(id)
            {
                $('#DeleteCampaign').modal("show");
                this.campaignID = id;
            }


            function finalDelete()
            {
                $.ajax({
                    url: 'clientAdd',
                    data: {clientID: cid},
                    type: 'post',
                    cache: false,
                    success: function (data)
                    {
                        if (data === "Done")
                        {
                            location.reload();
                        }
                    },
                    error: function () {
                        swal({
                          title: "Deleted!",
                          text: "Something went  Wrong!",
                          icon: "error",
                          button: "OK!",
                        });
                    }
                });
            }
            function DeletePro()
            {
                $.ajax({
                    url: 'subClient',
                    data: {subClientID: sid},
                    type: 'post',
                    cache: false,
                    success: function (data)
                    {
                        if (data === "Done")
                        {
                            $("#" + sid + "").remove();
                            $('.close').trigger('click');
                        }
                    },
                    error: function () {
                        swal({
                          title: "Deleted!",
                          text: "Something went  Wrong!",
                          icon: "error",
                          button: "OK!",
                        });
                    }
                });
            }

            function Deletecamp()
            {
                $.ajax({
                    url: 'campiagn',
                    data: {deleteCampID: campaignID},
                    type: 'post',
                    cache: false,
                    success: function (data)
                    {
                        if (data === "Done")
                        {
                            $("#cam" + campaignID + "").remove();
                            $('.close').trigger('click');
                        }
                    },
                    error: function () {
                        swal({
                          title: "Deleted!",
                          text: "Something went  Wrong!",
                          icon: "error",
                          button: "OK!",
                        });
                    }
                });
            }

            function viewEdit(id, name, description)
            {
                this.cid = id;
                $("#EditClientName").val(decodeURIComponent(name));
                $("#cdesc").val(decodeURIComponent(description));
                $('#EditClient').modal("show");
            }
            function editPrograme(id, name, description)
            {
                this.sid = id;
                $("#EditProgName").val(decodeURIComponent(name));
                $("#pdesc").val(decodeURIComponent(description));
                $('#EditProgram').modal("show");
            }
            function editCampaign(templateID, id, campaignName, description, region, status)
            {
                this.campaignID = id;
                 $("#editCampName").val(decodeURIComponent(campaignName));
                $("#editcampdesc").val(decodeURIComponent(description));
                $("#editregion").val(region);
                $("#editstatus").val(status);
          //      $("#template").val(templateID);
                $('#EditCampaign').modal("show");
            }

            function updateClient()
            {
                let clientName = $("#EditClientName").val();
                let Description = $("#cdesc").val();
                if (clientName != "" && Description != "")
                {
                    $.ajax({
                        url: 'clientAdd',
                        data: {clientID2: cid, clientName: clientName, Description: Description},
                        type: 'post',
                        cache: false,
                        success: function (data)
                        {
                            if (data === "Done")
                            {
                                location.reload();
                            }
                        },
                        error: function () {
                        swal({
                          title: "Deleted!",
                          text: "Something went  Wrong!",
                          icon: "error",
                          button: "Aww yiss!",
                        });
                        }
                    });
                } else
                {
                            swal({
                          title: "Required",
                          text: "Field are mandatory!",
                          icon: "info",
                          button: "OK!",
                        });
                 }
            }

            function programUpadate()
            {
                let EditProgName = $("#EditProgName").val();
                let pdesc = $("#pdesc").val();
                if (pdesc != "" && EditProgName != "")
                {
                    $.ajax({
                        url: 'subClient',
                        data: {updateSid: sid, EditProgName: EditProgName, pdesc: pdesc},
                        type: 'post',
                        cache: false,
                        success: function (data)
                        {
                               $(this).closest('form').trigger("reset");
                             $("#" + sid + "").remove();
                            data.forEach(function (item) {
                                let descrp = encodeURIComponent(item.description);
                                let programName = encodeURIComponent(item.programName);

                                console.log('TID: ' + item.description);

                                var _template = "<tr id='" + item.subclientID + "'><td><div class='custom-control custom-checkbox'>\n\
                                                <input type='checkbox' value='" + item.subclientID + "' onclick=selectsubClient('" + item.subclientID + "') class='custom-control-input' id='" + item.subclientID + "a'>\n\
                                                <label class='custom-control-label' for='" + item.subclientID + "a'>" + item.programName + "</label>\n\
                                                </div></td><td><a href='#' data-toggle='modal' onclick=viewHolder('" + descrp + "') data-target='#ViewModal'>\n\
                                                <i class='fa fa-eye'></i></a></td><td>\n\
                                                <a href='#' onclick=editPrograme('" + item.subclientID + "','" + programName + "','" + descrp + "') >\n\
                                                <i class='fa fa-pencil-square-o fa-lg' aria-hidden='true'>\n\
                                                   </i></a></td><td><a href='#' onclick=deletePro('" + item.subclientID + "') >\n\
                                                  <i class='fa fa-trash-o fa-lg' aria-hidden='true'></i></a></td></tr>";
                                $("#subClients").append(_template);

                            });
                            $('.close').trigger('click');
                        },
                        error: function () {
                            swal({
                          title: "Error",
                          text: "Something Went Wrong!",
                          icon: "error",
                          button: "OK!",
                        });
                        }
                    });
                } else
                {
                        swal({
                          title: "Required",
                          text: "Field are mandatory!",
                          icon: "info",
                          button: "OK!",
                        });
                 }

            }

            function updateCampaign()
            {
                let editCampName = $("#editCampName").val();
                let editcampdesc = $("#editcampdesc").val();
                let editregion = $("#editregion").val();
                let editstatus = $("#editstatus").val();
                let selecttemplate = $("#template2").val();
                 if (editCampName != "" && editcampdesc != "" && editregion != "" && editstatus != "")
                {
                    $.ajax({
                        url: 'campiagn',
                        data: {updateCampID: campaignID, editCampName: editCampName, editcampdesc: editcampdesc, editregion: editregion, editstatus: editstatus, selecttemplate: selecttemplate},
                        type: 'post',
                        cache: false,
                        success: function (data)
                        {
                               $(this).closest('form').trigger("reset");
                             $("#cam" + campaignID + "").remove();
                            data.forEach(function (item) {
                                if (item.status === "Scheduled")
                                {
                                    $("#col" + item.campiagnID).attr("style", "font-size:14px;color:#ffa500;");

                                } else if (item.status === "Active")
                                {
                                    $("#col" + item.campiagnID).attr("style", "font-size:14px;color:#19a51d;");
                                } else if (item.status === "Launched")
                                {
                                    $("#col" + item.campiagnID).attr("style", "font-size:14px;color:#ff0000;");

                                } else if (item.status === "Deactivate")
                                {
                                    $("#col" + item.campiagnID).attr("style", "font-size:14px;color:#d43513;");
                                } else {
                                }

                                var _template = "<tr id='cam" + item.campiagnID + "'><td>\n\
                                                    <div class='custom-control custom-checkbox'>\n\
                                                    <input type='checkbox' value='" + item.campiagnID + "' onclick=selectCampaign('" + item.campiagnID + "') class='custom-control-input' id='" + item.campiagnID + "a'>\n\
                                                    <label class='custom-control-label' for='" + item.campiagnID + "a'>" + item.campiagnName + "</div></td>\n\
                                                    <td><a href='#' data-toggle='modal' onclick=viewHolder('" + encodeURIComponent(item.description) + "') data-target='#ViewModal'>\n\
                                                    <i class='fa fa-eye'></i></a></td>\n\
                                                    <td>" + item.region + "</td>\n\
                                                    <td><span style='font-size:14px; color: #19a51d'>" + item.status + "</span></td>\n\
                                                    <td>\n\
                                                    <a href='#' onclick=editCampaign('" + item.templateId + "','" + item.campiagnID + "','" + encodeURIComponent(item.campiagnName) + "','" + encodeURIComponent(item.description) + "','" + encodeURIComponent(item.region) + "','" + encodeURIComponent(item.status) + "')  >\n\
                                                    <i class='fa fa-pencil-square-o fa-lg' aria-hidden='true'></i></a></td>\n\
                                                    <td>\n\
                                                    <a href='#' onclick=deleteCampaign('" + item.campiagnID + "')>\n\
                                                    <i class='fa fa-trash-o fa-lg' aria-hidden='true'></i></a></td></tr>";
                                $("#campiagn").append(_template);

                            });
                            $('.close').trigger('click');
                        },
                        error: function () {
                             swal({
                          title: "Error",
                          text: "Something Went Wrong!",
                          icon: "error",
                          button: "OK!",
                        });
                         }
                    });
                } else
                {
                    
                     swal({
                          title: "Required",
                          text: "Fields are mandatory!",
                          icon: "info",
                          button: "OK!",
                        });
                 }

            }


            function viewHolder(view)
            {
                $("#viewHolder").empty();
                $("#viewHolder").append(decodeURIComponent(view));
            }

            function programs()
            {
                $("#subClients").empty();
                if (cid != null)
                {
                    if (document.getElementById(cid).checked)
                    {
                        $("#" + cid + "").prop("checked");
                        let val = $("#" + cid + "").val();
                         $.ajax({
                            url: 'subClient',
                            data: {clientID3: val},
                            type: 'post',
                            cache: false,
                            success: function (data)
                            {
                                
                                data.forEach(function (item) {

                                    let descrp = encodeURIComponent(item.description);
                                    let programName = encodeURIComponent(item.programName);

                                    var _template = "<tr id='" + item.subclientID + "'><td><div class='custom-control custom-checkbox'>\n\
                                                <input type='checkbox' value='" + item.subclientID + "' onclick=selectsubClient('" + item.subclientID + "') class='custom-control-input' id='" + item.subclientID + "a'>\n\
                                                <label class='custom-control-label' for='" + item.subclientID + "a'>" + item.programName + "</label>\n\
                                                </div></td><td><a href='#' data-toggle='modal' onclick=viewHolder('" + descrp + "') data-target='#ViewModal'>\n\
                                                <i class='fa fa-eye'></i></a></td><td>\n\
                                                <a href='#' onclick=editPrograme('" + item.subclientID + "','" + programName + "','" + descrp + "') >\n\
                                                <i class='fa fa-pencil-square-o fa-lg' aria-hidden='true'>\n\
                                                   </i></a></td><td><a href='#' onclick=deletePro('" + item.subclientID + "') >\n\
                                                  <i class='fa fa-trash-o fa-lg' aria-hidden='true'></i></a></td></tr>";
                                    $("#subClients").append(_template);

                                });
                            },
                            error: function () {
                                
                                 swal({
                          title: "Error",
                          text: "Something Went Wrong!",
                          icon: "error",
                          button: "OK!",
                        });
                              }
                        });
                    }
                } else
                {
                     swal({
                          title: "Required",
                          text: "Please Select the Client!",
                          icon: "info",
                          button: "OK!",
                        });
                 }

            }

            function campaign()
            {
                $("#campiagn").empty();
                if (sid != null)
                {
                    if (document.getElementById(sid + "a").checked)
                    {
                        $("#" + sid + "a").prop("checked");
                        let val = $("#" + sid + "a").val();
                        $.ajax({
                            url: 'campiagn',
                            data: {subclientID: val},
                            type: 'post',
                            cache: false,
                            success: function (data)
                            {
                                data.forEach(function (item) {


                                    var _template = "<tr id='cam" + item.campiagnID + "'><td>\n\
                                                    <div class='custom-control custom-checkbox'>\n\
                                                    <input type='checkbox' value='" + item.campiagnID + "' onclick=selectCampaign('" + item.campiagnID + "') class='custom-control-input' id='" + item.campiagnID + "a'>\n\
                                                    <label class='custom-control-label' for='" + item.campiagnID + "a'>" + item.campiagnName + "</div></td>\n\
                                                    <td><a href='#' data-toggle='modal' onclick=viewHolder('" + encodeURIComponent(item.description) + "') data-target='#ViewModal'>\n\
                                                    <i class='fa fa-eye'></i></a></td>\n\
                                                    <td>" + item.region + "</td>\n\
                                                    <td><span style='font-size:14px; color: #19a51d'>" + item.status + "</span></td>\n\
                                                    <td>\n\
                                                    <a href='#' onclick=editCampaign('" + item.templateId + "','" + item.campiagnID + "','" + encodeURIComponent(item.campiagnName) + "','" + encodeURIComponent(item.description) + "','" + encodeURIComponent(item.region) + "','" + encodeURIComponent(item.status) + "')  >\n\
                                                    <i class='fa fa-pencil-square-o fa-lg' aria-hidden='true'></i></a></td>\n\
                                                    <td>\n\
                                                    <a href='#' onclick=deleteCampaign('" + item.campiagnID + "')>\n\
                                                    <i class='fa fa-trash-o fa-lg' aria-hidden='true'></i></a></td></tr>";
                                    $("#campiagn").append(_template);
                                });
                            },
                            error: function () {
                                 swal({
                          title: "Error",
                          text: "Something Went Wrong!",
                          icon: "error",
                          button: "OK!",
                        });
                            }
                        });
                    }
                } else
                {
                        swal({
                          title: "Required",
                          text: "Please Select the Program!",
                          icon: "info",
                          button: "OK!",
                        });

                 }
            }
            function setting()
            {
 
                if (campaignID != null)
                {
                    if (document.getElementById(campaignID + "a").checked)
                    {
                        $("#" + campaignID + "a").prop("checked");
                        let val = $("#" + campaignID + "a").val();
                         $.ajax({
                            url: 'settings',
                            data: {campaignID: val},
                            type: 'post',
                            cache: false,
                            success: function (data)
                            {
                             },
                            error: function () {
                                 swal({
                          title: "Error",
                          text: "Something Went Wrong!",
                          icon: "error",
                          button: "OK!",
                        });
                            }
                        });
                    }
                } else
                {
                        swal({
                          title: "Required",
                          text: "Please Select the Campaign!",
                          icon: "info",
                          button: "OK!",
                        });
                 }
            }
            function selectClient(id)
            {
                this.cid = id;
            }
            function selectsubClient(id)
            {
                this.sid = id;
            }
            function selectCampaign(id)
            {
                this.campaignID = id;
            }
            function addSubClient()
            {
                let ProgName = $("#ProgName").val();
                let progdesc = $("#progdesc").val();

                $.ajax({
                    url: 'subClient',
                    data: {clientID: cid, ProgName: ProgName, progdesc: progdesc},
                    type: 'post',
                    cache: false,
                    success: function (data)
                    {
                           $(this).closest('form').trigger("reset");

                        data.forEach(function (item) {
                            let descrp = encodeURIComponent(item.description);
                            let programName = encodeURIComponent(item.programName);


                            var _template = "<tr id='" + item.subclientID + "'><td><div class='custom-control custom-checkbox'>\n\
                                                <input type='checkbox' value='" + item.subclientID + "' onclick=selectsubClient('" + item.subclientID + "') class='custom-control-input' id='" + item.subclientID + "a'>\n\
                                                <label class='custom-control-label' for='" + item.subclientID + "a'>" + item.programName + "</label>\n\
                                                </div></td><td><a href='#' data-toggle='modal' onclick=viewHolder('" + descrp + "') data-target='#ViewModal'>\n\
                                                <i class='fa fa-eye'></i></a></td><td>\n\
                                                <a href='#' onclick=editPrograme('" + item.subclientID + "','" + programName + "','" + descrp + "') >\n\
                                                <i class='fa fa-pencil-square-o fa-lg' aria-hidden='true'>\n\
                                                   </i></a></td><td><a href='#' onclick=deletePro('" + item.subclientID + "') >\n\
                                                  <i class='fa fa-trash-o fa-lg' aria-hidden='true'></i></a></td></tr>";
                            $("#subClients").append(_template);
                        });
                        $('.close').trigger('click');
                        document.getElementById("myForm2").reset();

                    },
                    error: function () {
                                 swal({
                          title: "Error",
                          text: "Something Went Wrong!",
                          icon: "error",
                          button: "OK!",
                        });
                    }
                });
            }

            function addCampaign()
            {
                let CampName = $("#CampName").val();
                let campdesc = $("#campdesc").val();
                let region = $("#region").val();
                let template = $("#template").val();
                if(template!="")
                {
                    if(CampName!==null && campdesc!==null && region!==null )
                    {
                                       $.ajax({
                    url: 'campiagn',
                    data: {template: template, subClient: sid, CampName: CampName, campdesc: campdesc, region: region, status: "Active"},
                    type: 'post',
                    cache: false,
                    success: function (data)
                    {
                           $(this).closest('form').trigger("reset");

                        data.forEach(function (item) {


                            var _template = "<tr id='cam" + item.campiagnID + "'><td>\n\
                                                    <div class='custom-control custom-checkbox'>\n\
                                                    <input type='checkbox' value='" + item.campiagnID + "' onclick=selectCampaign('" + item.campiagnID + "') class='custom-control-input' id='" + item.campiagnID + "a'>\n\
                                                    <label class='custom-control-label' for='" + item.campiagnID + "a'>" + item.campiagnName + "</div></td>\n\
                                                    <td><a href='#' data-toggle='modal' onclick=viewHolder('" + encodeURIComponent(item.description) + "') data-target='#ViewModal'>\n\
                                                    <i class='fa fa-eye'></i></a></td>\n\
                                                    <td>" + item.region + "</td>\n\
                                                    <td><span style='font-size:14px; color: #19a51d'>" + item.status + "</span></td>\n\
                                                    <td>\n\
                                                    <a href='#' onclick=editCampaign('" + item.templateId + "','" + item.campiagnID + "','" + encodeURIComponent(item.campiagnName) + "','" + encodeURIComponent(item.description) + "','" + encodeURIComponent(item.region) + "','" + encodeURIComponent(item.status) + "')  >\n\
                                                    <i class='fa fa-pencil-square-o fa-lg' aria-hidden='true'></i></a></td>\n\
                                                    <td>\n\
                                                    <a href='#' onclick=deleteCampaign('" + item.campiagnID + "')>\n\
                                                    <i class='fa fa-trash-o fa-lg' aria-hidden='true'></i></a></td></tr>";
                            $("#campiagn").append(_template);
                        });
                        $('.close').trigger('click');
                        document.getElementById("myForm3").reset();

                    },
                    error: function () {
                                 swal({
                          title: "Error",
                          text: "Something Went Wrong!",
                          icon: "error",
                          button: "OK!",
                        });
                    }
                });
  
                    }
                    else
                    {
                        swal({
                          title: "Required",
                          text: "Some field Missed!",
                          icon: "info",
                          button: "OK!",
                        });
                     }
                    
                }
                else
                {
                            swal({
                          title: "Required",
                          text: "No template Selected or Upload New Template!",
                          icon: "info",
                          button: "OK!",
                        });
                 }
             }
            
            function setSubject()
            {
                let A=$("#SubjectA").val();
                let B=$("#SubjectB").val();
                let C=$("#SubjectC").val();
                let D=$("#SubjectD").val();
                if(A!=="" && B!=="" && C!=="" && D!=="" )
                {
                    $.ajax({
                    url: 'subject',
                    data: {A:A,B:B,C:C,D:D},
                    type: 'post',
                    cache: false,
                    success: function (data)
                    {
                           $(this).closest('form').trigger("reset");
                             $('#launch-tab').trigger('click');
                             document.getElementById("myForm4").reset();

                        $('.close').trigger('click');
                    },
                    error: function () {
                         swal({
                          title: "Error",
                          text: "Something Went Wrong!",
                          icon: "error",
                          button: "OK!",
                        });
                     }
                });
            }
               else
                {
                          swal({
                          title: "Required",
                          text: "Please fill the Subject!",
                          icon: "info",
                          button: "OK!",
                        });   
                 }

            }
             
            function launch ()
            {
                let userID=$("#userId").val(); 
                let emailfrom=$("#emailfrom").val(); 
                let sendername=$("#sendername").val(); 
                let emailto=$("#emailto").val(); 
                let recname=$("#recname").val(); 
                
                if(emailfrom!=="" && sendername!=="" && emailto!=="" && recname!=="")
                {
                    $("#loader").show();
                    $("#myForm1").hide();
                    $.ajax({
                    url: 'launch',
                    data: {userID:userID,emailfrom:emailfrom,sendername:sendername,emailto:emailto,recname:recname},
                    type: 'post',
                    cache: false,
                    success: function (data)
                    {
                        if(data==="error")
                        {
                            $("#loader").hide();
                            $("#myForm1").show();
                            swal({
                          title: "Triggered",
                          text: "Error to Triggered Template",
                          icon: "error",
                          button: "OK!",
                        });
                         }
                        else
                        {
                            $("#loader").hide();
                            $("#myForm1").show();
                              document.getElementById("myForm1").reset();
                              swal({
                          title: "Triggered",
                          text: "Email Template Triggered",
                          icon: "success",
                          button: "OK!",
                        });
                          }
                     },      
                    error: function () {
                            $("#loader").hide();
                            $("#myForm1").show();
                        swal({
                          title: "Error",
                          text: "Something Went Wrong!",
                          icon: "error",
                          button: "OK!",
                        });                    }
                });
            }
               else
                {
                     swal({
                          title: "Required",
                          text: "Please fill the Subject!",
                          icon: "info",
                          button: "OK!",
                        });        
                 }
                
            }
            
            function emailConfig()
            {
              let Email= $("#Email").val();  
              let password= $("#password").val();  
               
               if(Email!="" && password!="")
               {
                return true;;
               }
               else
               {
                   $("#errorMsg").show();
                   return false;
               }
                 
            }
                             

        </script>
    </head>
    <body onload="myFunction()" class="fixed-navbar pt-0">
        
        
        <div class="page-wrapper">
            <header class="header">
                <div class="container-fluid">
                    <nav class="navbar navbar-default navbar-expand-lg fixed-top py-0 pl-0">
                        <div class="page-brand navbar-header d-inline-flex align-items-center">
                            <div class="col-md-12">
                                <!--button class="navbar-toggler float-left mt-1 mr-2" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button-->
                                <a class="navbar-brand" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="brand-mini">
                                        <object type="image/svg+xml" data="images/dc_logo_icon.svg" class="dcHdrIcon">ECM</object>
                                    </span>
                                </a>
                            </div>
                        </div>
                        <!--div class="col-8 collapse navbar-collapse" id="navbarSupportedContent"-->
                        <div class="d-flex flex-grow-1">
                            <div class="col-xl-12 px-0">
                                <div class="row">
                                    <!-- ToolBar Left Icon Starts -->

                                    <!-- ToolBar Left Icon Ends -->
                                    <div class="col-xl-10 text-center">
                                        <h1 class="appname text-uppercase">EMAIL CAMPAIGN <b>MANAGER</b></h1>
                                    </div>
                                    <!-- ToolBar Right Starts -->
                                    <div class="col-xl-2 d-flex justify-content-xl-end justify-content-between align-items-center">
                                        <div class="logName d-flex align-items-center">
                                             <span class="userImg text-center"><img src="images/user-icon.png" alt=""></span>&nbsp;&nbsp;<span id="userName"> <%=session.getAttribute("username")%> | <a href="logoutsession.jsp" class="logout">Logout</a></span>
                                            &nbsp;|&nbsp;<span><a href="#" data-toggle="modal" data-target="#Config"><i class="fa fa-cog" aria-hidden="true"></i></a></span>
                                        </div>
                                    </div>
                                    <!-- ToolBar Right Ends -->
                                </div>
                            </div>
                        </div>
                    </nav>		
                </div>
            </header>
            <!-- Header Starts -->
            <!-- SideBar Starts -->
            <nav class="page-sidebar position-fixed" id="sidebar">
                <div class="minimenu">
                    <div class="col-md-12 admin-block d-flex align-content-center">
                        <div><span class="userImg text-center"><img src="images/user-icon.png" alt=""></span></div>

                    </div>
                    <ul id="ecmMenu" class="side-menu ecmMenu">
                        <li>
                            <span class="menNameMini">MA</span>
                        </li>

                    </ul>
                </div>
            </nav>
            <!-- SideBar Ends -->
            <!-- Content Starts -->
            <div class="content-wrapper">
                <div class="page-heading d-flex justify-content-between mt-2">
                    <h4 class="col pl-0 page-title">Marketing Activities</h4>
                </div>
                <div class="page-content fade-in-up">
                    <!-- MA Table Row Starts -->
                    <div class="row">
                        <div class="col-md-12 maTab mb-3">
                            <div class="bg-white">
                                <!-- Tabs Starts -->
                                <ul class="nav nav-tabs" id="maTab" role="tablist">
                                    <li class="nav-item"><a class="nav-link active" id="clients-tab" data-toggle="tab" href="#clients" 	role="tab" aria-controls="clients" aria-selected="true">Clients</a></li>
                                    <li class="nav-item"><a class="nav-link" onclick="return programs();" id="programs-tab" data-toggle="tab" href="#programs" role="tab" aria-controls="programs" aria-selected="false">Programs</a></li>
                                    <li class="nav-item"><a class="nav-link" onclick="return campaign();" id="campaigns-tab" data-toggle="tab" href="#campaigns" role="tab" aria-controls="campaigns" aria-selected="false">Campaigns</a></li>
                                    <li class="nav-item"><a class="nav-link" onclick="return setting();" id="settings-tab" data-toggle="tab" href="#settings" role="tab" aria-controls="settings" aria-selected="false">Settings</a></li>
                                    <li class="nav-item"><a class="nav-link" id="launch-tab" data-toggle="tab" href="#launch" role="tab" aria-controls="launch" aria-selected="false">Launch</a></li>
                                </ul>
                                <!-- Tabs Ends -->
                                <!-- Tab panes Starts -->
                                <div class="tab-content">
                                    <div class="tab-pane active" id="clients" role="tabpanel" aria-labelledby="clients-tab">
                                        <div class="table-responsive">
                                            <div class="filter mb-2 text-right">

                                                <button type="button" class="btn btn-green btn-sm rounded-0 align-top" data-toggle="modal" data-target="#UploadTemplate"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Upload Templates</button>
                                                <button type="button" class="btn btn-green btn-sm rounded-0 align-top" data-toggle="modal" data-target="#ClientModal"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> New</button>
                                            </div>
                                            <table id="clientsTbl" class="table table-sm ecmTbl">
                                                <thead>
                                                    <tr>
                                                        <th width="87%">
                                                            <div class="custom-control custom-checkbox chkAll">
                                                                <label class="custom-control-label" for="clientName">Client Name</label>
                                                            </div>
                                                        </th>
                                                        <th width="6%">View</th>
                                                        <th width="2%">Edit</th>
                                                        <th width="5%">Delete</th>

                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <%
                                                        clientInterface i = new ClientImpl();
                                                        List<clientmodal> list = i.getClient(Long.parseLong(String.valueOf(session.getAttribute("userId"))));
                                                        for (clientmodal c : list) {
                                                    %>
                                                    <tr>					
                                                        <td>
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" value="<%=c.getClientId()%>" onclick="selectClient(<%=c.getClientId()%>)" class="custom-control-input" id="<%=c.getClientId()%>">
                                                                <label class="custom-control-label" for="<%=c.getClientId()%>"><%=c.getClientName()%></label>
                                                            </div>
                                                        </td>
                                                        <td><a href="#" data-toggle="modal" onclick="return viewHolder('<%=c.getDescription()%>');" data-target="#ViewModal"><i class="fa fa-eye"></i></a></td>
                                                        <td><a href="#" onclick="return viewEdit('<%=c.getClientId()%>', '<%=c.getClientName()%>', '<%=c.getDescription()%>');" ><i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a></td>
                                                        <td><a href="#"   onclick="return viewDelete('<%=c.getClientId()%>');" ><i class="fa fa-trash-o fa-lg" aria-hidden="true"></i></a></td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>


                                                </tbody>
                                            </table>

                                        </div>
                                    </div>
                                    <div class="tab-pane" id="programs" role="tabpanel" aria-labelledby="programs-tab">
                                        <div class="table-responsive">
                                            <div class="filter mb-2 text-right">
                                                <nav aria-label="breadcrumb">
                                                    <ol class="breadcrumb">
                                                        <li class="breadcrumb-item"><a href="#">Mindshare Dubai</a></li>
                                                        <li class="breadcrumb-item active" aria-current="page">Programs</li>
                                                    </ol>
                                                </nav>
                                                <button type="button" class="btn btn-green btn-sm rounded-0 align-top" data-toggle="modal" data-target="#ProgramModal"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> New</button>
                                            </div>
                                            <table id="programTbl" class="table table-sm ecmTbl">
                                                <thead>
                                                    <tr>
                                                        <th width="87%">
                                                            <div class="custom-control custom-checkbox chkAll">
                                                                <input type="checkbox" class="custom-control-input" id="programName">
                                                                <label class="custom-control-label" for="programName">Program Name</label>
                                                            </div>
                                                        </th>
                                                        <th width="6%">View</th>
                                                        <th width="2%">Edit</th>
                                                        <th width="5%">Delete</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="subClients">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="tab-pane" id="campaigns" role="tabpanel" aria-labelledby="campaigns-tab">
                                        <div class="table-responsive">
                                            <div class="filter mb-2 text-right">
                                                <nav aria-label="breadcrumb">
                                                    <ol class="breadcrumb">
                                                        <li class="breadcrumb-item"><a href="#">Mindshare Dubai</a></li>
                                                        <li class="breadcrumb-item"><a href="#">Mindshare Dubai UK IBM Q4 GTS RaaS Q418</a></li>
                                                        <li class="breadcrumb-item active" aria-current="page">Campaigns</li>
                                                    </ol>
                                                </nav>
                                                <button type="button" class="btn btn-green btn-sm rounded-0 align-top" data-toggle="modal" data-target="#CampModal"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> New</button>
                                            </div>
                                            <table id="campaignTbl" class="table table-sm ecmTbl">
                                                <thead>
                                                    <tr>
                                                        <th width="72%">
                                                            <div class="custom-control custom-checkbox chkAll">
                                                                <input type="checkbox" class="custom-control-input" id="campaignName">
                                                                <label class="custom-control-label" for="campaignName">Campaign Name</label>
                                                            </div>
                                                        </th>
                                                        <th width="4%">View</th>
                                                        <th width="6%">Region</th>
                                                        <th width="8%">Status</th>
                                                        <th width="2%">Edit</th>
                                                        <th width="5%">Delete</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="campiagn">
                                                </tbody>
                                            </table>


                                        </div>
                                    </div>
                                    <div class="tab-pane" id="settings" role="tabpanel" aria-labelledby="settings-tab">
                                        <div class="filter mb-2 text-right">
                                            <nav aria-label="breadcrumb">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="#">Mindshare Dubai</a></li>
                                                    <li class="breadcrumb-item"><a href="#">Mindshare Dubai UK IBM Q4 GTS RaaS Q418</a></li>
                                                    <li class="breadcrumb-item"><a href="#">Mindshare Dubai IBM FY20 Q2 GBS Rethink 2020 AE Q220_05.05.20_em4</a></li>
                                                    <li class="breadcrumb-item active" aria-current="page">Settings</li>
                                                </ol>
                                            </nav>
                                        </div>
                                        <div class="col-sm-12 col-md-6 col-lg-6" style="position: relative; margin-top: 3%; left: 25%;">
                                            <!--Form with header-->
                                            <form id="myForm4" action="#" method="post">
                                                <div class="card rounded-0">
                                                    <div class="card-header p-0">
                                                        <div class="bg-info text-white text-center py-2">
                                                                <h3>Set Subject line</h3>
                                                        </div>
                                                    </div>
                                                    <div class="card-body p-3">

                                                        <!--Body-->
                                                        <div class="form-group">
                                                            <div class="input-group mb-2">
                                                                <div class="input-group-prepend">
                                                                    <div class="input-group-text">A</div>
                                                                </div>
                                                                <input type="text" class="form-control" id="SubjectA" name="SubjectA" placeholder="Subject line A" required>

                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="input-group mb-2">
                                                                <div class="input-group-prepend">
                                                                    <div class="input-group-text">B</div>
                                                                </div>
                                                                <input type="text" class="form-control" id="SubjectB" name="SubjectB" placeholder="Subject line B" required>

                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="input-group mb-2">
                                                                <div class="input-group-prepend">
                                                                    <div class="input-group-text">C</div>
                                                                </div>
                                                                <input type="text" class="form-control" id="SubjectC" name="SubjectC" placeholder="Subject line C" required>

                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <div class="input-group mb-2">
                                                                <div class="input-group-prepend">
                                                                    <div class="input-group-text">D</div>
                                                                </div>
                                                                <input type="text" class="form-control" id="SubjectD" name="SubjectD" placeholder="Subject line D" required>

                                                            </div>
                                                        </div>
                                                        <div class="form-group text-center">
                                                            <input type="button" value="Save" onclick="return setSubject();" class="btn btn-green">
                                                            <input type="reset" value="Reset" class="btn btn-light">
                                                        </div>
                                                    </div>

                                                </div>
                                            </form>
                                            <!--Form with header-->

                                        </div>
                                    </div>
                                    <div class="tab-pane" id="launch" role="tabpanel" aria-labelledby="launch-tab">
                                        <div class="filter mb-2 text-right">
                                            <nav aria-label="breadcrumb">
                                                <ol class="breadcrumb">
                                                    <li class="breadcrumb-item"><a href="#">Mindshare Dubai</a></li>
                                                    <li class="breadcrumb-item"><a href="#">Mindshare Dubai UK IBM Q4 GTS RaaS Q418</a></li>
                                                    <li class="breadcrumb-item"><a href="#">Mindshare Dubai IBM FY20 Q2 GBS Rethink 2020 AE Q220_05.05.20_em4</a></li>
                                                    <li class="breadcrumb-item"><a href="#">Settings</a></li>
                                                    <li class="breadcrumb-item active" aria-current="page">Launch</li>
                                                </ol>
                                            </nav>
                                        </div>
                                        <div class="col-sm-12 col-md-6 col-lg-6" style="position: relative; margin-top: 3%; left: 25%;">
                                            <!--Form with header-->

                                            <form id="myForm1">
                                                <div class="card rounded-0">
                                                    <div class="card-header p-0">
                                                        <div class="bg-info text-white text-center py-2">
                                                            <h3>Campaign Launch Settings</h3>
                                                        </div>
                                                    </div>
                                                    <div class="card-body p-3">			 
                                                         
                                                         
                                                        <div class="form-group row">
                                                            
                                                      <input type="hidden" id="userId" name="userID" value="<%=session.getAttribute("userId")%>">
                                                            <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">Email From</label>
                                                            <div class="col-sm-9">
                                                                <input id="emailfrom" name="emailfrom" placeholder="" class="form-control"  type="email">
                                                            </div>
                                                            </div>
                                                        <div class="form-group row">
                                                            <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">Sender Name</label>
                                                            <div class="col-sm-9">
                                                                <input id="sendername" name="sendername" placeholder="" class="form-control"  type="text">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">Email To</label>
                                                            <div class="col-sm-9">
                                                                <input id="emailto" name="emailto" placeholder="" class="form-control"  type="email">
                                                            </div>
                                                        </div>
                                                        <div class="form-group row">
                                                            <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm">Receiver Name</label>
                                                            <div class="col-sm-9">
                                                                <input id="recname" name="recname" placeholder="" class="form-control"  type="text">
                                                            </div>
                                                        </div>
                                                          
                                                        <div class="form-group text-center">
                                                            <input type="button" value="Launch" onclick="return launch();" class="btn btn-green">
                                                            <input type="reset" value="Reset" class="btn btn-light">
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                            <!--Form with header-->
                                            <div id="loader" style="display:none; text-align: center">                                          
                                            <div class="spinner-grow text-muted"></div>
                                            <div class="spinner-grow text-primary"></div>
                                            <div class="spinner-grow text-success"></div>
                                            <div class="spinner-grow text-info"></div>
                                            <div class="spinner-grow text-warning"></div>
                                            <div class="spinner-grow text-danger"></div>
                                            <div class="spinner-grow text-secondary"></div>
                                            <div class="spinner-grow text-dark"></div>
                                            <div class="spinner-grow text-light"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Tab panes Ends -->

                        </div>
                    </div>
                </div>
                <!-- MA Table Row Ends -->

                <!-- Footer Starts -->

                <div class="row">
                    <div class="col-md-12 px-0 position-fixed btm-0">
                        <footer class="d-flex align-items-center px-3">
                            <p class="f-text">&copy; 2020 My Projects | All Rights Reserved</p>
                        </footer>
                    </div>
                </div>

            </div>
        </div>
        <!-- Footer Ends -->
        <!-- Content Ends -->

        <!-- Client Modal -->
        <div class="container">
            <!-- Modal -->
            <div id="ClientModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">New Client</h4>
                        </div>
                        <div class="modal-body">
                            <form action="clientAdd" method="post">
                                <div class="card-body p-3">			 
                                    <input type="hidden" name="userID" value="<%=session.getAttribute("userId")%>">
                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Client Name <i class="fa fa-asterisk"></i></label>
                                        <div class="col-sm-9">
                                            <input id="ClientName" name="ClientName" placeholder="" class="form-control"  type="text">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Description</label>
                                        <div class="col-sm-9">
                                            <textarea id="desc" name="desc" placeholder="" class="form-control" rows="5"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group text-center" style="margin-bottom: 0;">
                                        <input type="submit" value="Save" class="btn btn-green">
                                        <input type="submit" value="Reset" class="btn btn-light">
                                    </div>
                                </div>

                            </form>
                            <!--Form with header-->
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <!--- Program Modal --->
        <div class="container">
            <!-- Modal -->
            <div id="ProgramModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">New Program</h4>
                        </div>
                        <div class="modal-body">
                            <form id="myForm2">


                                <div class="card-body p-3">			 

                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Program Name <i class="fa fa-asterisk"></i></label>
                                        <div class="col-sm-9">
                                            <input id="ProgName" name="ProgName" placeholder="" class="form-control"  type="text">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Description</label>
                                        <div class="col-sm-9">
                                            <textarea id="progdesc" name="progdesc" placeholder="" class="form-control" rows="5"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group text-center" style="margin-bottom: 0;">
                                        <input type="button" onclick="return addSubClient();" value="Save" class="btn btn-green">
                                        <input type="reset" value="Reset" class="btn btn-light">
                                    </div>
                                </div>

                            </form>
                            <!--Form with header-->
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <!-- Campaign Modal -->
        <div class="container">
            <!-- Modal -->
            <div id="CampModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">New Campaign</h4>
                        </div>
                        <div class="modal-body">
                            <form id="myForm3">


                                <div class="card-body p-3">			 

                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Campaign Name <i class="fa fa-asterisk"></i></label>
                                        <div class="col-sm-9">
                                            <input id="CampName" name="CampName" placeholder="" class="form-control"  type="text">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Description</label>
                                        <div class="col-sm-9">
                                            <textarea id="campdesc" name="campdesc" placeholder="" class="form-control" rows="5"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Region <i class="fa fa-asterisk"></i></label>
                                        <div class="col-sm-9">
                                            <select class="form-control" id="region">
                                                <option selected="true" disabled="disabled">Select from the list </option>
                                                <option>NORAM</option>
                                                <option>APAC</option>
                                                <option>EMEA</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Templates <i class="fa fa-asterisk"></i></label>
                                        <div class="col-sm-9">
                                            <select class="form-control" id="template">
                                                <option selected="true" disabled="disabled">Select from the list </option>
                                                <%! List<clientModal.templateModal> list2 = null;
                                                %>
                                                <%
                                                    list2 = i.getAlltemplate(Long.parseLong(String.valueOf(session.getAttribute("userId"))));
                                                    for (templateModal t : list2) {
                                                %>
                                                <option value="<%=t.getTemplateID()%>"><%=t.getTemplateName()%></option>

                                                <%
                                                    }
                                                %>

                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group text-center" style="margin-bottom: 0;">
                                        <input type="button" onclick="return addCampaign();" value="Save" class="btn btn-green">
                                        <input type="reset" value="Reset" class="btn btn-light">
                                    </div>
                                </div>

                            </form>
                            <!--Form with header-->
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <!-- View Modal -->
        <div class="container">
            <!-- Modal -->
            <div id="ViewModal" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">View Description</h4>
                        </div>
                        <div class="modal-body">
                            <div class="container">
                                <p style="font-size: 14px; line-height: 22px;" id="viewHolder"></p>
                            </div>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <!-- Edit Modal -->
        <div class="container">
            <!-- Modal -->
            <div id="EditClient" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit Client Details</h4>
                        </div>
                        <div class="modal-body">
                            <form id="myForm">
                                <div class="card-body p-3">			 
                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Client Name </label>
                                        <div class="col-sm-9">
                                            <input id="EditClientName" name="EditClientName" placeholder="" class="form-control"  type="text">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Description</label>
                                        <div class="col-sm-9">
                                            <textarea id="cdesc" name="cdesc" placeholder="" class="form-control" rows="5"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group text-center" style="margin-bottom: 0;">
                                        <input type="button" onclick="return updateClient();" value="Update" class="btn btn-green">
                                        <input type="reset" value="Reset" class="btn btn-light">
                                    </div>
                                </div>

                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <!-- Edit Program Modal -->
        <div class="container">
            <!-- Modal -->
            <div id="EditProgram" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit Program Details</h4>
                        </div>
                        <div class="modal-body">
                            <form id="myForm">


                                <div class="card-body p-3">			 

                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Program Name </label>
                                        <div class="col-sm-9">
                                            <input id="EditProgName" name="EditClientName" placeholder="" class="form-control"  type="text">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Description</label>
                                        <div class="col-sm-9">
                                            <textarea id="pdesc" name="pdesc" placeholder="" class="form-control" rows="5"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group text-center" style="margin-bottom: 0;">
                                        <input type="button" onclick="programUpadate()" value="Update" class="btn btn-green">
                                        <input type="reset" value="Reset" class="btn btn-light">
                                    </div>
                                </div>

                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <!-- Edit Campaign Modal -->
        <div class="container">
            <!-- Modal -->
            <div id="EditCampaign" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit Campaign Details</h4>
                        </div>
                        <div class="modal-body">
                            <form id="myForm">


                                <div class="card-body p-3">			 

                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Campaign Name </label>
                                        <div class="col-sm-9">
                                            <input id="editCampName" name="editCampName" placeholder="" class="form-control"  type="text">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Description</label>
                                        <div class="col-sm-9">
                                            <textarea id="editcampdesc" name="editcampdesc" placeholder="" class="form-control" rows="5"></textarea>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Region </label>
                                        <div class="col-sm-9">
                                            <select class="form-control" id="editregion">
                                                <option selected="true" disabled="disabled">Select from the list </option>
                                                <option value="NORAM">NORAM</option>
                                                <option value="APAC">APAC</option>
                                                <option value="EMEA">EMEA</option>

                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Templates <i class="fa fa-asterisk"></i></label>
                                        <div class="col-sm-9">
                                            <select class="form-control" id="template2">
                                                <option selected="true" disabled="disabled">Select from the list </option>
                                                <%
                                                    for (templateModal t1 : list2) {
                                                %>
                                                <option value="<%=t1.getTemplateID()%>"><%=t1.getTemplateName()%></option>

                                                <%
                                                    }
                                                %>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Status </label>
                                        <div class="col-sm-9">
                                            <select class="form-control" id="editstatus">
                                                <option selected="true" disabled="disabled">Select from the list </option>
                                                <option value="Active">Active</option>
                                                <option value="Scheduled">Scheduled</option>
                                                <option value="Launched">Launched</option>
                                                <option value="Deactivate">Deactivate</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group text-center" style="margin-bottom: 0;">
                                        <input type="button"onclick="return updateCampaign();" value="Update" class="btn btn-green">
                                        <input type="reset" value="Reset" class="btn btn-light">
                                    </div>
                                </div>

                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        <!-- Delete Modal -->
        <div class="container">
            <!-- Modal -->
            <div id="Delete" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Do you want to delete this file?</h4>
                        </div>
                        <div class="modal-body">
                            <form id="myForm">


                                <div class="card-body p-3">			 


                                    <div class="form-group text-center" style="margin-bottom: 0;">
                                        <input type="button" onclick="return close();" value="No" class="btn btn-danger">
                                        <input type="button" onclick="return finalDelete();" value="Yes" class="btn btn-light">
                                    </div>
                                </div>

                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <div class="container">
            <!-- Modal -->
            <div id="DeleteProg" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Do you want to delete this file?</h4>
                        </div>
                        <div class="modal-body">
                            <form id="myForm">


                                <div class="card-body p-3">			 


                                    <div class="form-group text-center" style="margin-bottom: 0;">
                                        <input type="button" onclick="return close();" value="No" class="btn btn-danger">
                                        <input type="button" onclick="return DeletePro();" value="Yes" class="btn btn-light">
                                    </div>
                                </div>

                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <div class="container">
            <!-- Modal -->
            <div id="DeleteCampaign" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Do you want to delete this file?</h4>
                        </div>
                        <div class="modal-body">
                            <form>


                                <div class="card-body p-3">			 


                                    <div class="form-group text-center" style="margin-bottom: 0;">
                                        <input type="button" onclick="return close();" value="No" class="btn btn-danger">
                                        <input type="button" onclick="return Deletecamp();" value="Yes" class="btn btn-light">
                                    </div>
                                </div>

                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <div class="container">
            <!-- Modal -->
            <div id="Config" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Configuration</h4>
                        </div>
                        <div class="modal-body">
                            <form action="emailConfigure" method="post">
                                <div class="card-body p-3">			 

                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Email ID <i class="fa fa-asterisk"></i></label>
                                        <div class="col-sm-9">
                                            <input type="hidden" name="userID" value="<%=session.getAttribute("userId")%>">

                                            <input id="Email" name="Email" placeholder="" class="form-control"  type="text">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Password <i class="fa fa-asterisk"></i></label>
                                        <div class="col-sm-9">
                                            <input id="password" name="password" placeholder="" class="form-control"  type="password">
                                        </div>
                                    </div>
                                    <div class="form-group text-center" style="margin-bottom: 0;">
                                        <input type="button"onclick="return emailConfig();" value="Update" class="btn btn-green">
                                        <input type="reset" value="Reset" class="btn btn-light">
                                    </div>
                                </div>
                                <div class="form-group" style="height: 17px">
                                    <%
                                       String EmailConfig=(String) request.getAttribute("EmailConfig");
                                                                    if(EmailConfig!=null)
                                                                    {
                                                                          if(EmailConfig.equals("true"))
                                                                    {%>
                                                                    <script>
                                                                        alert("Email Configuration Done");
                                                                        </script>
                                                                     <%
                                                                     }
                                                             }

                                                              %>
                                                              <span style="display:none" id="errorMsg" class="successMsg">Please mention correct ID or Password</span>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>
            </div>
        </div>

        <div class="container">
            <!-- Modal -->
            <div id="UploadTemplate" class="modal fade" role="dialog">
                <div class="modal-dialog">

                    <!-- Modal content-->
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Upload Template</h4>
                        </div>
                        <div class="modal-body">
                            <form action="addTemplate" method="post" enctype='multipart/form-data' >

                                <div class="card-body p-3">			 
                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Template Name <i class="fa fa-asterisk"></i></label>
                                        <div class="col-sm-9">
                                            <input type="hidden" name="userID" value="<%=session.getAttribute("userId")%>">

                                            <input id="Tempname" name="Tempname" required="true" placeholder="" class="form-control"  type="text">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="colFormLabelSm" class="col-sm-3 col-form-label col-form-label-sm labelpad">Select Template</label>
                                        <div class="col-sm-9">
                                            <!--<input type="file" class="form-control-file" id="formcontrolfileupload">-->
                                            <div class="custom-file">
                                                <input type="file" required="true" class="custom-file-input" id="customFile"  name="customFile1" accept=".html">
                                                <label class="custom-file-label" for="customFile">Choose your file</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group text-center" style="margin-bottom: 0;">
                                        <input type="submit" value="Upload" class="btn btn-green">
                                        <input type="submit" value="Reset" class="btn btn-light">
                                    </div>
                                </div>

                            </form>
                            <!--Form with header-->
                        </div>

                    </div>

                </div>
            </div>
        </div>     



        <!-- JavaScripts -->
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
        <script src="js/jquery.slimscroll.min.js"></script>
        <script src="js/ecm-js.js"></script>

    </body>
</html>

