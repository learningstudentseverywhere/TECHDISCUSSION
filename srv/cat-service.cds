using {techdiscussion as my} from '../db/data-model';



service SchoolService{
    entity Students as projection on my.Students;
    entity StudentMarks as projection on my.StudentMarks;
    entity StudentFees as projection on my.StudentFees;
    entity Logs as projection on my.Logs;
    entity CompleteStudentInfo as projection on my.CompleteStudentInfo;
    entity Student_Hostel as projection on my.Student_Hostel;

     //Basic, consumption,composite
     //ZCDSB,ZCDSI,ZCDSC
    //Creating a cds view for students table and students marks table
    entity ViewForStudents as select 
    key A.student_id,
    key A.student_name,
        B.subject,
        B.marks 
    from Students as A 
    inner join StudentMarks as B 
    on A.student_id = B.student_id;

//Left outer join
     entity ViewForStudentsLeft as select 
    key A.student_id,
    key A.student_name,
        B.subject,
        B.marks 
    from Students as A 
    left join StudentMarks as B 
    on A.student_id = B.student_id;
}

service CollegeService{
   entity CollegeStudents as projection on my.CollegeStudents;
   entity CollegeStaffs as projection on my.CollegeStaffs;
   entity CollegeEmployee as projection on my.CollegeEmployee;

   type CollegeStudnetsStructure{
        student_id:String(10);
        studnet_nam : String;
        Age:String;
   }
 
   type CollegeStaffsStructure{
       staff_id : String(10);
       staff_name : String;
   }

   type CollegeEmployeeStructure {
        employee_id : String(10);
        employee_name : String;
   }
   type CompleteData  {
      CollegeStudents : Array of CollegeStudnetsStructure;
      CollegeStaffs :CollegeStaffsStructure;
      CollegeEmployee : Array of CollegeEmployeeStructure;
   }


   type EmployeeStructure{
        employee_id : String;
        employee_name : String;
        employee_age : String;
        employee_phone_no : Array of String;
   }

   function GetAllPersonData(Input:String) returns CompleteData;


   //Action
   action GetAllPersonDataAction(Input:EmployeeStructure) returns CompleteData;



}
