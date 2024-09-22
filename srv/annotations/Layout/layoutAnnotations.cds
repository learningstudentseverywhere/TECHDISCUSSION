using {SchoolService as service} from '../../cat-service';




annotate service.Students with 
@UI:{
  SelectionFields  : [
      student_id,
      student_name
  ],
  LineItem  : [
      {
        $Type:'UI.DataField',
        Value:student_id
      },
      {
        $Type:'UI.DataField',
        Value:student_name
      }
  ],
  HeaderInfo  : {
      $Type : 'UI.HeaderInfoType',
      TypeName : 'Students Detail',
      TypeNamePlural : 'Students Details',
  },
};