//
//  MainModel.swift
//  DoctorsList
//
//  Created by сонный on 03.01.2025.
//

import Foundation

struct Response: Codable {
    let record: Record
}

struct Record: Codable {
    let data: DataClass
}

struct DataClass: Codable {
    let users: [User]
}

struct User: Codable, Identifiable {
    let id: String
    let slug: String?
    let firstName: String?
    let patronymic: String?
    let lastName: String?
    let gender: String?
    let genderLabel: String?
    let specialization: [Specialization]
    let ratings: [Rating]
    let rankLabel: String?
    let scientificDegreeLabel: String?
    let categoryLabel: String?
    let avatar: String?
    let higherEducation: [Education]
    let workExperience: [WorkExperience]
    let advancedTraining: [AdvancedTraining]
    let videoChatPrice: Int?
    var isFavorite: Bool?
    
    let nearestReceptionTime: TimeInterval?
    
    enum CodingKeys: String, CodingKey {
        case id, slug, firstName = "first_name", patronymic, lastName = "last_name"
        case gender, genderLabel = "gender_label"
        case specialization, ratings
        case rankLabel = "rank_label"
        case scientificDegreeLabel = "scientific_degree_label"
        case categoryLabel = "category_label"
        case avatar, higherEducation = "higher_education"
        case workExperience = "work_expirience"
        case advancedTraining = "advanced_training"
        case videoChatPrice = "video_chat_price"
        case isFavorite = "is_favorite"
        case nearestReceptionTime = "nearest_reception_time"
    }
}

struct Specialization: Codable {
    let name: String?
    let id: Int
    let isModerated: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case isModerated = "is_moderated"
    }
}

struct Rating: Codable {
    let id: Int
    let name: String?
    let value: Double?
}

struct Education: Codable {
    let id: Int
    let university: String?
    let specialization: String?
    let qualification: String?
    let startDate: TimeInterval?
    let endDate: TimeInterval?
    let untilNow: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, university, specialization, qualification
        case startDate = "start_date"
        case endDate = "end_date"
        case untilNow = "until_now"
    }
}

struct WorkExperience: Codable {
    let id: Int
    let organization: String?
    let position: String?
    let startDate: TimeInterval?
    let endDate: TimeInterval?
    let untilNow: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, organization, position
        case startDate = "start_date"
        case endDate = "end_date"
        case untilNow = "until_now"
    }
}

struct AdvancedTraining: Codable {
    let id: Int
    let course: String?
    let startDate: TimeInterval?
    let endDate: TimeInterval?
    let untilNow: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id, course
        case startDate = "start_date"
        case endDate = "end_date"
        case untilNow = "until_now"
    }
}
