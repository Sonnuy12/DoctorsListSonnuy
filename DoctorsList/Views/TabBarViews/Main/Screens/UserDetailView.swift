//
//  UserDetailView.swift
//  TestJsonDecode
//
//  Created by сонный on 05.01.2025.
//

import SwiftUI

struct UserDetailView: View {
     var user: User
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                if let avatarURL = user.avatar, let url = URL(string: avatarURL) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .foregroundColor(.gray)
                }

                Text("\(user.firstName ?? "") \(user.lastName ?? "")")
                    .font(.title)
                    .bold()

                StarRatingView(rating: user.ratings.first?.value ?? 0)

                Text("Специализация: \(user.specialization.first?.name ?? "Педиатр")")
                Text("Стаж: \(user.workExperience.count) лет")
                Text("Цена видео-консультации: \(user.videoChatPrice ?? 0) ₽")
                
                // Здесь можно добавить другие данные о враче
            }
            .padding()
        }
        .navigationTitle("\(user.firstName ?? "") \(user.lastName ?? "")")
    }
}
