//
//  MainView.swift
//  DoctorsList
//
//  Created by сонный on 03.01.2025.
//

import SwiftUI

struct MainView: View {
    @Binding var select: String
    
    var body: some View {
        NavigationStack {
            Text("Main!")
                .navigationTitle("Педиатры")
        }
        .background(Color.clear)
    }
}
//
//#Preview {
//    MainView(select: .constant("MainView"))
//}
