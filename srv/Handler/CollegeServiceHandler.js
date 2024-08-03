const { resourceLimits } = require("worker_threads");

var CollegeSeriveHandler = async (that,cds) => {

    that.on('GetAllPersonData',async req=>{
        let result = {
            "CollegeStudents" : [],
            "CollegeStaffs" :{},
            "CollegeEmployee" : []
        }
 
        //Fetching Data from all Tables
        let StudentsData = await SELECT.from('techdiscussion_CollegeStudents').columns('student_id','studnet_name');
        let CollegeStaffs = await SELECT.one.from('techdiscussion_CollegeStaffs');
        let CollegeEmployee = await SELECT.from('techdiscussion_CollegeEmployee');

        for(let i=0;i<StudentsData.length;i++){
            let StudentDatCopy = {...StudentsData[i]};
            let temp = {
                student_id : StudentDatCopy.student_id,
                studnet_nam : StudentDatCopy.studnet_name
            }
            result.CollegeStudents.push(temp);
        }
 
        result.CollegeEmployee = CollegeEmployee;
        result.CollegeStaffs = CollegeStaffs;
        
        return result;
        
    })

}



module.exports = CollegeSeriveHandler;


