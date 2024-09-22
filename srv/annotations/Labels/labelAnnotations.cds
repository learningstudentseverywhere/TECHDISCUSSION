using {SchoolService as service} from '../../cat-service';



annotate service.Students with {
    student_id @title : 'Student ID';
    student_name @title : 'Student Name';
}