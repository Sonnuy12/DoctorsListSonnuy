//
//  MainModel.swift
//  DoctorsList
//
//  Created by сонный on 03.01.2025.
//

import Foundation

struct Responce: Decodable, Hashable {
    let articles: [User]
}

struct User: Decodable, Hashable {
    let author: String?
    let title: String?
}
