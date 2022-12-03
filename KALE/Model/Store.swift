//
//  Store.swift
//  KALE
//
//  Created by Tai Chin Huang on 2022/12/3.
//

import Foundation

struct Store: Codable, Hashable {
    let icon: String
    let name: String
    let rate: Int
    let comment: String
    let openTime: String
    let type: String
    let costLevel: String
}
