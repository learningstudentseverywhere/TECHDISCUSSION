sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'com/sample/techdisfioelements/test/integration/FirstJourney',
		'com/sample/techdisfioelements/test/integration/pages/StudentsList',
		'com/sample/techdisfioelements/test/integration/pages/StudentsObjectPage',
		'com/sample/techdisfioelements/test/integration/pages/StudentMarksObjectPage'
    ],
    function(JourneyRunner, opaJourney, StudentsList, StudentsObjectPage, StudentMarksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('com/sample/techdisfioelements') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheStudentsList: StudentsList,
					onTheStudentsObjectPage: StudentsObjectPage,
					onTheStudentMarksObjectPage: StudentMarksObjectPage
                }
            },
            opaJourney.run
        );
    }
);