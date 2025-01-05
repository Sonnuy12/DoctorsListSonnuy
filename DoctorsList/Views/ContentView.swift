//
//  ContentView.swift
//  DoctorsList
//
//  Created by сонный on 03.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State var selected: String = "MainView"
    
    init() {
           UITabBar.setCustomAppearance(
            backgroundColor: .white,
            selectedColor: .red,
            unselectedColor: .darkGray
           )
       }
    
    var body: some View {
        TabView(selection: $selected) {
            MainView(select: $selected)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Главная")
                }
                .tag("MainView")
            
            
            AppointmentView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Приемы")
                }
                .tag("AppointmentView")
            
            СhatView()
                .tabItem {
                    Image(systemName: "message.fill")
                    Text("Чат")
                }
                .tag("СhatView")
                .badge(1)

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Профиль")
                }
                .tag("ProfileView")
        }
//        .background(Color.indigo)
    }
}

#Preview {
    ContentView()
}

extension UITabBar {
    static func setCustomAppearance(backgroundColor: UIColor, selectedColor: UIColor, unselectedColor: UIColor) {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        
        appearance.stackedLayoutAppearance.normal.iconColor = unselectedColor
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: unselectedColor]
        
        appearance.stackedLayoutAppearance.selected.iconColor = selectedColor
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: selectedColor]
        
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}
