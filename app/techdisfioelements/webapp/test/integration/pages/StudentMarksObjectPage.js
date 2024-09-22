sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.sample.techdisfioelements',
            componentId: 'StudentMarksObjectPage',
            contextPath: '/Students/to_StudentMarks'
        },
        CustomPageDefinitions
    );
});