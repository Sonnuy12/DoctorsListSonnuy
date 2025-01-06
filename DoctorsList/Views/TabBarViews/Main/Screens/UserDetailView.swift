//
//  UserDetailView.swift
//  TestJsonDecode
//
//  Created by сонный on 05.01.2025.
//

import SwiftUI
struct UserDetailView: View {
    var user: User
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .bottom) {
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
                            Text(user.lastName ?? "Неизвестно")
                                .font(.headline)
                            Text("\(user.firstName ?? "") \(user.patronymic ?? "")")
                                .font(.headline)
                                .bold()
                        }
                    }
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 10) {
                            Image(systemName: "clock")
                                .foregroundColor(.gray)
                            Text("Опыт работы: \(user.workExperience.count) лет")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        HStack(spacing: 10) {
                            Image(systemName: "cross.case.fill")
                                .foregroundColor(.gray)
                            Text("Врач высшей категории") // Замени текст на подходящий
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        HStack(spacing: 10) {
                            Image(systemName: "graduationcap.fill")
                                .foregroundColor(.gray)
                            Text(user.higherEducation.first?.university ?? "1-й ММИ им. И.М.Сеченова")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        HStack(spacing: 10) {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.gray)
                            Text(user.workExperience.first?.organization ?? "Детская клиника “РебёнОК” ")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Button(action: {
                        //                    viewModel.handleAppointment(user: user)
                        //                    showAlert = true
                    }) {
                        HStack {
                            Text("Стоимость услуг")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.leading, 15)
                            Spacer()
                            Text("от \(user.videoChatPrice ?? 0) ₽")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(.trailing, 20)
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.vertical)
                    }
                    
                    Text("Проводит диагностику и лечение терапевтических больных. Осуществляет расшифровку и снятие ЭКГ. Даёт рекомендации по диетологии. Доктор имеет опыт работы в России и за рубежом. Проводит консультации пациентов на английском языке.")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
//                                    Button(action: {
//                    //                    viewModel.handleAppointment(user: user)
//                    //                    showAlert = true
//                                    }) {
//                                        Text((user.nearestReceptionTime != nil)  ? "Записаться" : "Нет свободного времени")
//                                            .font(.headline)
//                                            .foregroundColor(.white)
//                                            .frame(maxWidth: .infinity)
//                                            .padding()
//                                            .background(user.nearestReceptionTime != nil ? Color.pink : Color.gray)
//                                            .cornerRadius(8)
//                                    }
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle(user.specialization.first?.name ?? "Педиатр")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color.lightGray)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.backward") // Стандартная иконка "назад"
                            .foregroundColor(.black) // Измените цвет на желаемый
                    }
                }
            }
            Button(action: {
//                    viewModel.handleAppointment(user: user)
//                    showAlert = true
            }) {
                Text((user.nearestReceptionTime != nil)  ? "Записаться" : "Нет свободного времени")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 56)
                    .background(user.nearestReceptionTime != nil ? Color.pink : Color.gray)
                    .cornerRadius(8)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
        }
        
    }
}

