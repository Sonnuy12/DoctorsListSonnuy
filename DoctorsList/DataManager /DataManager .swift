//
//  DataManager .swift
//  DoctorsList
//
//  Created by сонный on 03.01.2025.
//

//import Foundation
//
//class DataManager {
//    
//    func loadUsersFromJSON() -> [User]? {
//        guard let url = Bundle.main.url(forResource: "655b754e0574da7622c94aa4", withExtension: "json") else {
//            print("Failed to locate users.json in bundle.")
//            
//            return nil
//        }
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = JSONDecoder()
//            let users = try decoder.decode([User].self, from: data)
//            return users
//        } catch {
//            print("Failed to load or decode JSON: \(error.localizedDescription)")
//            return nil
//        }
//    }
//}
