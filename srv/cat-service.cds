using {techdiscussion as my} from '../db/data-model';



service SchoolService{
    entity Sample as projection on my.Students;
}