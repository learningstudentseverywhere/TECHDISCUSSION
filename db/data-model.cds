namespace techdiscussion;


entity Students{
    key student_id : String(10);
        student_name : String;
        to_StudentMarks : Composition of  many StudentMarks on to_StudentMarks.student_id=$self.student_id;
}

entity StudentMarks{
    key student_id : String(10);
    key subject : String(10);
        marks : String(10);
        to_Students: Association to Students on to_Students.student_id = $self.student_id;
}


entity StudentFees{
    key student_id : String(10);
        fees_paid : Boolean;
}

entity Logs{
    key student_id : String(10);
        message : String;
}

//How to create table
type StudentMarksType {
      student_id : String(10);
      subject : String(10);
        marks : String(10);
}
entity CompleteStudentInfo{
    key student_id : String(10);
        student_name : String;
        marks : Array of StudentMarksType;
       fees_paid : Boolean;
}


