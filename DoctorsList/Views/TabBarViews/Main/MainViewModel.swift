//
//  MainVievModel.swift
//  DoctorsList
//
//  Created by сонный on 03.01.2025.
//

import Foundation
import SwiftUI

enum SortType: String, CaseIterable, Identifiable {
    case price = "По цене"
    case experience = "По стажу"
    case rating = "По рейтингу"
    
    var id: String { rawValue }
}


class MainViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var alertMessage: String? = nil
    @Published var filteredDoctors: [User] = []
    
    @Published var sortType: SortType = .price
    @Published var isAscending: Bool = true
    
    var searchText: String = "" {
        didSet {
            filterDoctor()
        }
    }
    
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "655b754e0574da7622c94aa4", withExtension: "json") else {
            print("JSON file not found.")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedResponse = try JSONDecoder().decode(Response.self, from: data)
            self.users = decodedResponse.record.data.users
            self.filteredDoctors = users
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
    
    func handleAppointment(user: User) {
        if let alert = user.nearestReceptionTime {
            alertMessage = "Вы успешно записались!"
        } else {
            alertMessage = "Нет свободного времени для записи."
        }
    }
    
    func filterDoctor() {
        if searchText.isEmpty {
            filteredDoctors = users
        } else {
            filteredDoctors = users.filter { user in
                let fullName = "\(user.firstName ?? "") \(user.lastName ?? "") \(user.patronymic ?? "")"
                return fullName.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    
    func sortDoctors() {
        switch sortType {
        case .price:
            filteredDoctors.sort {
                isAscending ? ($0.videoChatPrice ?? 0) < ($1.videoChatPrice ?? 0) : ($0.videoChatPrice ?? 0) > ($1.videoChatPrice ?? 0)
            }
        case .experience:
            filteredDoctors.sort {
                isAscending ? ($0.workExperience.count < $1.workExperience.count) : ($0.workExperience.count > $1.workExperience.count)
            }
        case .rating:
            filteredDoctors.sort {
                isAscending ? ($0.ratings.first?.value ?? 0) < ($1.ratings.first?.value ?? 0) : ($0.ratings.first?.value ?? 0) > ($1.ratings.first?.value ?? 0)
            }
            
        }
    }
}

