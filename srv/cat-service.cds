using {techdiscussion as my} from '../db/data-model';



service SchoolService{
    entity Students as projection on my.Students;
    entity StudentMarks as projection on my.StudentMarks;
}