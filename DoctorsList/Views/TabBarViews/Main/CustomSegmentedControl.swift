//
//  CustomSegmentedControl.swift
//  DoctorsList
//
//  Created by сонный on 06.01.2025.
//

import SwiftUI

struct CustomSegmentedControl: View {
    @Binding var sortType: SortType
    @Binding var isAscending: Bool
    var onSortChanged: () -> Void

    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<SortType.allCases.count, id: \.self) { index in
                let sort = SortType.allCases[index]

                Button(action: {
                    if sortType == sort {
                        isAscending.toggle()
                    } else {
                        sortType = sort
                        isAscending = true
                    }
                    onSortChanged()
                }) {
                    HStack(spacing: 5) {
                        Text(sort.rawValue)
                            .font(.system(size: 12))
                            .fontWeight(sortType == sort ? .bold : .regular)
                            .foregroundColor(sortType == sort ? .white : .gray)

                        if sortType == sort {
                            Image(systemName: isAscending ? "arrow.up" : "arrow.down")
                                .font(.system(size: 14))
                                .foregroundColor(.white)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 8)
                    .background(sortType == sort ? Color.pink : Color.white)
                    .cornerRadius(
                        index == 0 ? 8 : (index == SortType.allCases.count - 1 ? 8 : 0),
                        corners: index == 0 ? [.topLeft, .bottomLeft] : (index == SortType.allCases.count - 1 ? [.topRight, .bottomRight] : [])
                    )
                }

                if index != SortType.allCases.count - 1 {
                    Divider()
                        .frame(height: 20)
                        .background(Color.gray.opacity(0.5))
                }
            }
        }
        .padding(8)
        .background(Color.lightGray)
        .cornerRadius(8)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = 0
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
