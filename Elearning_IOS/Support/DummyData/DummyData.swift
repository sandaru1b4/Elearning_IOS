//
//  DummyData.swift
//  Elearning_IOS
//
//  Created by Achitha Sandaruwan on 2022-10-16.
//

import Foundation

//TODO: Clear dummy data when add real data
struct DummyData {
    
    static let lessionSection: [SectionInfo] = [
        SectionInfo(id: 1, title: "Introduction", duration: "15"),
        SectionInfo(id: 2, title: "Figma Basic", duration: "60"),
        SectionInfo(id: 3, title: "Let’s Practice", duration: "75")
    ]
    
    
    static let section1: [LessonsInfo] = [
        LessonsInfo(id: 1, lessionNum: "01", title: "Why Using Figma", duration: "10", isUnlocked: true),
        LessonsInfo(id: 2, lessionNum: "02", title: "Set up Your Figma Account", duration: "05", isUnlocked: false),
    ]
    
    static let section2: [LessonsInfo] = [
        LessonsInfo(id: 1, lessionNum: "03", title: "Take a Look Figma Interface", duration: "15", isUnlocked: false),
        LessonsInfo(id: 2, lessionNum: "04", title: "Working with Frame & Layer", duration: "10", isUnlocked: false),
        LessonsInfo(id: 3, lessionNum: "05", title: "Working with Text & Grids", duration: "10", isUnlocked: false),
        LessonsInfo(id: 4, lessionNum: "06", title: "Using Figma Plugins", duration: "25", isUnlocked: false)
        
    ]
    
    static let section3: [LessonsInfo] = [
        LessonsInfo(id: 1, lessionNum: "07", title: "Let’s Design a Sign-Up Form", duration: "35", isUnlocked: false),
        LessonsInfo(id: 2, lessionNum: "08", title: "Let’s Create a Prototype", duration: "20", isUnlocked: false),
        LessonsInfo(id: 3, lessionNum: "09", title: "Sharing Work with Team", duration: "08", isUnlocked: false),
        LessonsInfo(id: 4, lessionNum: "10", title: "Exporting Assets", duration: "12", isUnlocked: false)
    ]
    
}
