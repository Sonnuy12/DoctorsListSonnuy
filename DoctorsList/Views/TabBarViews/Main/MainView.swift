//
//  MainView.swift
//  DoctorsList
//
//  Created by сонный on 03.01.2025.
//

import SwiftUI

struct MainView: View {
    @Binding var select: String
    @StateObject private var viewModel = MainViewModel()
    @State private var searchText: String = ""  // Для хранения текста поиска
    
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 10) {
                        ForEach(viewModel.filteredDoctors) { user in
                            DoctorCardView(user: user)
                        }
                    }
                    .padding()
                }
            }
            .onAppear {
                viewModel.fetchData()
                let appearance = UISearchBar.appearance()
                appearance.barTintColor = .cyan  // Цвет фона
                appearance.isTranslucent = false
            }
            .searchable(text: $viewModel.searchText)
            .onSubmit(of: .search, {
                viewModel.filterDoctor()
            })
            .background(Color.lightGray)
            .navigationTitle("Доктора")
            
        }
    }
}
//struct MainView: View {
//    @Binding var select: String
//    @StateObject private var viewModel = MainViewModel()
//    
//    let columns = [GridItem(.flexible())]
//    
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                LazyVGrid(columns: columns, spacing: 20) {
//                    ForEach(viewModel.users) { user in
//                        DoctorCardView(user: user)
//                    }
//                }
//                .padding()
//            }
//            .background(Color.lightGray)
//            .navigationTitle("Доктора")
//            .onAppear {
//                viewModel.fetchData()
//            }
//        }
//    }
//}

