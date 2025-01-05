//
//  AppointmentView.swift
//  DoctorsList
//
//  Created by сонный on 03.01.2025.
//

import SwiftUI
import FSCalendar

struct AppointmentView: View {
    var body: some View {
        FSCalendarView()
            .edgesIgnoringSafeArea(.bottom) 
    }
}

struct FSCalendarView: UIViewRepresentable {
    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.scope = .month
        return calendar
    }

    func updateUIView(_ uiView: FSCalendar, context: Context) {}
}

#Preview {
    AppointmentView()
}
