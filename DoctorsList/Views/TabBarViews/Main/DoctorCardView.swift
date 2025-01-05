//
//  UserCardView.swift
//  TestJsonDecode
//
//  Created by сонный on 05.01.2025.
//
import SwiftUI

struct DoctorCardView: View {
    @State var user: User
    @State private var showAlert = false
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationLink(destination: UserDetailView(user: user)) {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    if let avatarURL = user.avatar, let url = URL(string: avatarURL) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                        } placeholder: {
                            ProgressView()
                        }
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.gray)
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(user.lastName ?? "Неизвестно")
                            .font(.headline)
                        Text("\(user.firstName ?? "") \(user.patronymic ?? "")")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    VStack(){
                        Button(action: {
                            user.isFavorite?.toggle()
                        }) {
                            Image(systemName:  user.isFavorite ?? false ? "heart.fill" : "heart")
                                .font(.title2)
                                .foregroundColor(.red)
                        }
                    }
                }
                HStack {
                    VStack(alignment: .leading){
                        
                        StarRatingView(rating: user.ratings.first?.value ?? 0)
                        HStack {
                            Text("\(user.specialization.first?.name ?? "Педиатр") · стаж \(user.workExperience.count) лет")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                        Text("от \(user.videoChatPrice ?? 0) ₽")
                            .font(.subheadline)
                            .bold()
                    }
                    
                }
                .padding(.leading, 70)
                
                Button(action: {
                    viewModel.handleAppointment(user: user)
                    showAlert = true
                }) {
                    Text((user.nearestReceptionTime != nil)  ? "Записаться" : "Нет свободного времени")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(user.nearestReceptionTime != nil ? Color.pink : Color.gray)
                        .cornerRadius(8)
                }
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .frame(width: 343, height: 224)
        }
        .buttonStyle(PlainButtonStyle())
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Сообщение"),
                message: Text(viewModel.alertMessage ?? ""),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
//звездочки
struct StarRatingView: View {
    let rating: Double
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<5) { index in
                Image(systemName: index < Int(rating) ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 12, height: 12)
                    .foregroundColor(index < Int(rating) ? .pink : .gray)
            }
        }
    }
}

