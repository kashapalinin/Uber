//
//  HomeView.swift
//  Uber
//
//  Created by Павел Калинин on 03.03.2024.
//

import SwiftUI

struct HomeView: View {
    @State var mapState = MapViewState.noInput
    var body: some View {
        ZStack(alignment: .bottom){
            ZStack(alignment: .top){
                UberMapViewRepresentable(mapState: $mapState)
                    .ignoresSafeArea()
                if mapState == .searchingForLocation{
                    LocationSearchView(mapState: $mapState)
                }else if mapState == .noInput{
                    LocationSearchActivationView(mapState: $mapState)
                        .padding(.top, 72)
                        .onTapGesture {
                            withAnimation(.spring()){
                                mapState = .searchingForLocation
                            }
                        }
                }
                MapViewActionButton(mapState: $mapState)
                    .padding(.leading)
                    .padding(.top, 4)
            }
            if mapState == .locationSelected{
                RideRequestView()
                    .transition(.move(edge: .bottom))
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        
    }
}

#Preview {
    HomeView()
}
