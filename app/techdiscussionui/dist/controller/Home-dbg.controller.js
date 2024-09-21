sap.ui.define([
    "sap/ui/core/mvc/Controller"
],
function (Controller) {
    "use strict";

    return Controller.extend("com.tech.techdiscussionui.controller.Home", {
        onInit: function () {

        },
        //Get
        getDatafromservice:function(){
          let that = this
         //Getting value from the Input Box
         let inputBoxValue = this.getView().byId('Input1').getValue();

         //Send the values to the backend- Odata v4
         $.ajax({
            url:`/odata/v4/school/Students?$filter=student_id eq '${inputBoxValue}'`,
            dataType:"json",
            success:function(data){
                console.log(data);
                let receivedData = data.value[0];
                let studentname = receivedData.student_name
                that.getView().byId('Output1').setValue(studentname);

            },
            error:function(error){
                console.log('Error Occured');
            }
         })
         console.log(inputBoxValue);

        },
        //Post
        createStudent : function(){
          //Get Data from UI
          let Studentid = this.getView().byId('Input2').getValue();
          let StudentName = this.getView().byId('Input3').getValue();
          let StudentLocation =  this.getView().byId('Input4').getValue();
 
          //Create Payload
          let payload = {
            "student_id": Studentid,
            "student_name":StudentName,
            "student_location":StudentLocation
          }

          //Do the post call to the backend
          $.ajax({
            url:"/odata/v4/school/Students",
            contentType : "application/json",
            type:"POST",
            data:JSON.stringify(payload),
            dataType:"json",
            success:function(data){
                console.log(data);
            },
            error:function(error){
                console.log(error);
            }
          })
        }
        //Patch,Delete -- Try

      
    });
});
