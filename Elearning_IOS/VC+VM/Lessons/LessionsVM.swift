//
//  LessionsVM.swift
//  Elearning_IOS
//
//  Created by Achitha Sandaruwan on 2022-10-17.
//

import Foundation

class LessionsVM: NSObject{
    
    var videoUrl = "http://techslides.com/demos/sample-videos/small.mp4"
    var sectionLessonData: [Int: [LessonsInfo]] = [
        0: DummyData.section1,
        1: DummyData.section2,
        2: DummyData.section3
    ]
    
    
}
