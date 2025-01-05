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
                HStack(spacing: 15) {
                    if let avatarURL = user.avatar, let url = URL(string: avatarURL) {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                        } placeholder: {
                            ProgressView()
                        }
                    } else {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)
                    }
                    
                    VStack(alignment: .leading) {
                        Text("\(user.lastName ?? "") \(user.firstName ?? "")")
                            .font(.title3)
                            .bold()
                        Text("Опыт работы: \(user.workExperience.count) лет")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("Врач высшей категории") // Замени текст на подходящий
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Divider()
                
                // Информация о клинике
                Group {
                    HStack(spacing: 10) {
                        Image(systemName: "building.2")
                            .foregroundColor(.gray)
                        Text("1-й ММИ им. И.М.Сеченова")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    HStack(spacing: 10) {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.gray)
                        Text("Детская клиника “РебёнОК”")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
                Divider()
                
                // Стоимость услуг
                HStack {
                    Text("Стоимость услуг")
                        .font(.headline)
                    Spacer()
                    Text("от \(user.videoChatPrice ?? 0) ₽")
                        .font(.headline)
                        .foregroundColor(.red)
                }
                .padding(.vertical)
                
                Divider()
                
                // Описание врача
                Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Даёт рекомендации по диетологии. Доктор имеет опыт работы в России и за рубежом. Проводит консультации пациентов на английском языке.")
                    .font(.body)
                    .foregroundColor(.gray)
                
                Spacer()
                
                // Кнопка "Записаться"
                Button(action: {
                    // Добавьте действие
                }) {
                    Text("Записаться")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding(.vertical)
            }
            .padding(.horizontal, 20)
        }
        .navigationTitle(user.specialization.first?.name ?? "Педиатр")
        .navigationBarTitleDisplayMode(.inline)
    }
}

