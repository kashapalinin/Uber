//
//  LocationSearchView.swift
//  Uber
//
//  Created by Павел Калинин on 05.03.2024.
//

import SwiftUI

struct LocationSearchActivationView: View {
    @Binding var mapState: MapViewState
    var body: some View {
        HStack{
            Rectangle()
                .fill(.black)
                .frame(width: 8, height: 8)
                .padding(.horizontal)
            Text("Where to")
                .foregroundStyle(Color(.darkGray))
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width - 64, height: 50)
        .background{
            Rectangle()
                .fill(Color.white)
                .shadow(color: .black, radius: 6)
        }
    }
}

#Preview {
    LocationSearchActivationView(mapState: .constant(.noInput))
}
