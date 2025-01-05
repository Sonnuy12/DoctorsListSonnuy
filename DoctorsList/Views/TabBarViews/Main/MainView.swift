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
    @State private var searchText: String = ""
    
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack {
                // Кнопки сортировки
                HStack {
                    ForEach(SortType.allCases) { sort in
                        Button(action: {
                            viewModel.toggleSortDirection(for: sort)
                        }) {
                            HStack(spacing: 5) {
                                Text(sort.rawValue)
                                    .font(.system(size: 16))
                                    .fontWeight(viewModel.sortType == sort ? .bold : .regular)
                                    .foregroundColor(viewModel.sortType == sort ? .white : .red)
                                if viewModel.sortType == sort {
                                    Image(systemName: viewModel.isAscending ? "arrow.up" : "arrow.down")
                                        .font(.system(size: 14))
                                        .foregroundColor(.white)
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(viewModel.sortType == sort ? Color.red : Color.white)
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.red, lineWidth: 1)
                            )
                        }
                    }
                }
                .padding(.horizontal, 17)
                .padding(.top, 10)
                // Сетка докторов
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

