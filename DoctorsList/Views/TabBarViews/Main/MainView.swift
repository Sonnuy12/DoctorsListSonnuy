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
    
    let columns = [GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            VStack() {
                CustomSegmentedControl(
                    sortType: $viewModel.sortType,
                    isAscending: $viewModel.isAscending,
                    onSortChanged: {
                        viewModel.sortDoctors()
                    }
                )
                .cornerRadius(100)
                .clipShape(.rect(cornerRadius: 8))
                .padding(.horizontal, 10)
                
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
            .onSubmit(of: .search) {
                viewModel.filterDoctor()
            }
            .background(Color.lightGray)
            .navigationTitle("Доктора")
//            .toolbar {
//                ToolbarItem(placement: .principal) {
//                    Text("Доктора")
//                        .font(.title)
//                        .frame(maxWidth: .infinity, alignment: .center)
//                        .padding(.top, 40)
//                }
//            }
        }
    }
}
