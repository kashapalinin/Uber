//
//  LocationSearchResultCell.swift
//  Uber
//
//  Created by Павел Калинин on 05.03.2024.
//

import SwiftUI

struct LocationSearchResultCell: View {
    var name: String
    var description: String
    var body: some View {
        HStack{
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .foregroundStyle(.blue)
                .tint(.white)
                .frame(width: 40, height: 40)
            VStack(alignment: .leading, spacing: 4){
                Text(name)
                    .font(.body)
                Text(description)
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
                Divider()
            }
            .padding(.leading, 8)
            .padding(.vertical, 8)
        }
        .padding(.leading)
    }
}

#Preview {
    LocationSearchResultCell(name: "wef", description: "edf")
}
