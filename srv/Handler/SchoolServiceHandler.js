var SchoolServiceHandler = async (that,cds) => {

    that.before('CREATE','Students',async req=>{
        let input_student_id = req.data.student_id;
        let dataFromFeesTable = await SELECT.from('techdiscussion_StudentFees').where({student_id:input_student_id,fees_paid:1});
        if(dataFromFeesTable.length<=0){
          req.reject({
              code:'500',
              message:"Please pay the fees before entering Student Table"
          });
        }
  
      });
  
  
    that.after('CREATE','Students',async req=>{   
            console.log('Entered After condition');
            let student_id = req.student_id;
            let insertedSuccessfully = await INSERT.into('techdiscussion_Logs').entries({student_id:student_id,message:"Successfully Created Student Record"});
            let updateSuccess = await UPDATE.entity('techdiscussion_Logs').with({message:"ChangedMessagee"}).where({student_id:student_id});
            let deleteSuccess = await DELETE.from('techdiscussion_Logs').where({student_id:student_id});
            console.log(updateSuccess);
  
      });
  
    that.on('READ','CompleteStudentInfo',async req=>{
        let student_id = req.params[0].student_id;
        let DataFromStudentTable = await SELECT.from('techdiscussion_Students').where({student_id:student_id})
        DataFromStudentTable = DataFromStudentTable[0].student_name;
        let DataFromStudentmarks = await SELECT.from('techdiscussion_StudentMarks').where({student_id:student_id});
  
        let DataFromFeesTable = await SELECT.from('techdiscussion_StudentFees').where({student_id:student_id});
        DataFromFeesTable = DataFromFeesTable[0].fees_paid;
        let result = {
          "student_id" : student_id,
          "student_name" : DataFromStudentTable,
          "marks" :DataFromStudentmarks,
         "fees_paid" :DataFromFeesTable
        }
  
        req.reply(result)
       
        
  
      })
}


module.exports = SchoolServiceHandler