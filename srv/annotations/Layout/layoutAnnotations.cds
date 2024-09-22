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
      Title:{
        $Type:'UI.DataField',
        Value:student_id
      }
  },
  HeaderFacets  : [
      {
        $Type:'UI.ReferenceFacet',
        ID:'StudentName',
        Label:'Header Student Basic Info',
        Target:'@UI.FieldGroup#StudentBasicInfo'
      },
       {
        $Type:'UI.ReferenceFacet',
        ID:'StudentName1',
        Label:'Header Student Basic Info1',
        Target:'@UI.FieldGroup#StudentBasicInfo1'
      }
  ],
  Facets  : [
       {
        $Type:'UI.ReferenceFacet',
        ID:'StudentName',
        Label:'Tab Student Basic Info',
        Target:'@UI.FieldGroup#StudentBasicInfo'
      },
       {
        $Type:'UI.ReferenceFacet',
        ID:'StudentMarks',
        Label:'Student Marks',
        Target:'to_StudentMarks/@UI.LineItem'
      }
  ],
  FieldGroup #StudentBasicInfo : {
    $Type:'UI.FieldGroupType',
    Data:[
      {
        $Type:'UI.DataField',
        Value: student_id
      },
       {
        $Type:'UI.DataField',
        Value: student_name
      }
    ]
  },
  FieldGroup #StudentBasicInfo1:{
     $Type:'UI.FieldGroupType',
    Data:[
      
       {
        $Type:'UI.DataField',
        Value: student_name
      },
      {
        $Type:'UI.DataField',
        Value: student_id
      }
    ]
  }
};


annotate service.StudentMarks with @UI:{
  LineItem  : [
      {
        $Type:'UI.DataField',
        Value : student_id
      },
      {
        $Type:'UI.DataField',
        Value : subject
      },
       {
        $Type:'UI.DataField',
        Value : marks
      }
  ]
};