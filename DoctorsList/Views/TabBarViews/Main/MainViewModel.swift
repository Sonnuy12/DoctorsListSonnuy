//
//  MainVievModel.swift
//  DoctorsList
//
//  Created by сонный on 03.01.2025.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var alertMessage: String? = nil
    @Published var filteredDoctors: [User] = []
    
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
}

