using {techdiscussion as my} from '../db/data-model';



service SchoolService{
    entity Students as projection on my.Students;
    entity StudentMarks as projection on my.StudentMarks;
    entity StudentFees as projection on my.StudentFees;
    entity Logs as projection on my.Logs;
    entity CompleteStudentInfo as projection on my.CompleteStudentInfo;
    entity Student_Hostel as projection on my.Student_Hostel;
}