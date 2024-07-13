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