//
//  MapViewActionButton.swift
//  Uber
//
//  Created by Павел Калинин on 05.03.2024.
//

import SwiftUI

struct MapViewActionButton: View {
    @Binding var mapState: MapViewState
    var body: some View {
        Button{
            withAnimation(.spring()){
                actionForState(mapState: mapState)
            }
        }label: {
            Image(systemName: imageForState(mapState: mapState))
                .font(.title2)
                .foregroundStyle(.black)
                .padding()
                .background(.white)
                .clipShape(Circle())
                .shadow(radius: 6)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    func actionForState(mapState: MapViewState){
        switch mapState{
        case .locationSelected:
            self.mapState = .noInput
        case .noInput:
            self.mapState = .noInput
            print(mapState)
        case .searchingForLocation:
            self.mapState = .noInput
            print(mapState)
        }
    }
    
    func imageForState(mapState: MapViewState) -> String{
        switch mapState{
        case .noInput:
            return "line.3.horizontal"
        case .searchingForLocation, .locationSelected:
            return "arrow.backward"
        }
    }
}


