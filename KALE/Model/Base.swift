//
//  Comment.swift
//  KALE
//
//  Created by Tai Chin Huang on 2022/12/4.
//

import Foundation

enum Week: String, CaseIterable {
    case monday = "Monday"
    case tuesday = "Tuseday"
    case wednesday = "Wednesday"
    case thursday = "Thursday"
    case friday = "Friday"
    case saturday = "Saturday"
    case sunday = "Sunday"
}

class Base {
//    var isDisp = false
//    var creatID = 0
//    var lastEditID = 0
//    var createTime = ""
//    var lastEditTime = ""
    let isDisp: Bool
    let createID: Int
    let lastEditID: Int
    let createTime: String
    let lastEditTime: String
    
    init(isDisp: Bool, createID: Int, lastEditID: Int, createTime: String, lastEditTime: String) {
        self.isDisp         = isDisp
        self.createID       = createID
        self.lastEditID     = lastEditID
        self.createTime     = createTime
        self.lastEditTime   = lastEditTime
    }
}

class StoreE: Base {
    private var avgScore: Double

    let name: String
    let address: String
    let businessHours: [Time]
    let comments: [Comment]
    var averageScore: Double {
        get {

        }
    }

    init(avgScore: Double, name: String, address: String, businessHours: [Time], comments: [Comment]) {

        self.avgScore = avgScore
        self.name = name
        self.address = address
        self.businessHours = businessHours
        self.comments = comments
    }

    private func updateAverageScore() {
        if comments.count <= 0 {
            avgScore = 0.0
            return
        }
        let countOfComment: Int
        let totalOfScore: Double
        for comment in comments {
            if comment.isDisp {
                totalOfScore = totalOfScore + comment.score
                countOfComment += 1
            }
        }
        if countOfComment <= 0 {
            avgScore = 0.0
            return
        }
        avgScore = totalOfScore / Double(countOfComment)
    }
}

class Time: Base {
    let week: Week
    let startTime: String
    let endTime: String

    init(week: Week, startTime: String, endTime: String) {
        self.week       = week
        self.startTime  = startTime
        self.endTime    = endTime
    }
}

class Comment: Base {
    let score: Double
    let minScore: Double
    let maxScore: Double

    let description: String
//    let score: Double {
//        get {
//
//        }
//    }

    init(score: Double, minScore: Double, maxScore: Double, description: String) {
        self.score          = score
        self.minScore       = minScore
        self.maxScore       = maxScore
        self.description    = description
    }
}
