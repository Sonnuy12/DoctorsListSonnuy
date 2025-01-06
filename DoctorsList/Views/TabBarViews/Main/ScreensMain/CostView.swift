////
////  ServicesCostView.swift
////  DoctorsList
////
////  Created by сонный on 06.01.2025.
////


import SwiftUI

struct CostView: View {
    var user: User
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            ServiceRow(title: "Видеоконсультация", description: "30 мин", price: "\(user.videoChatPrice ?? 0 ) ₽")
            ServiceRow(title: "Чат с врачом", description: "30 мин", price:"\(user.videoChatPrice ?? 0) ₽")
            ServiceRow(title: "Приём в клинике", description: "В клинике", price:"\(user.videoChatPrice ?? 0) ₽")
            
            Spacer()
        }
        .padding()
        .background(Color.lightGray)
        .navigationTitle("Стоимость услуг")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct ServiceRow: View {
    var title: String
    var description: String
    var price: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.headline)
                .bold()
                .padding(.bottom, 10)
            
            HStack {
                Text(description)
                    .font(.body)
                Spacer()
                Text(price)
                    .font(.body)
                    .bold()
            }
            .padding()
            .background(Color.white)
            .cornerRadius(8)
        }
    }
}
