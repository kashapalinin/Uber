//
//  LocationSearchView.swift
//  Uber
//
//  Created by Павел Калинин on 05.03.2024.
//

import SwiftUI

struct LocationSearchView: View {
    @State private var startLocationText = ""
    @Binding var mapState: MapViewState
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    var body: some View {
        VStack{
            HStack{
                VStack{
                    Circle()
                        .fill(Color(.systemGray3))
                        .frame(width: 6, height: 6)
                    Rectangle()
                        .fill(Color(.systemGray3))
                        .frame(width: 1, height: 24)
                    Rectangle()
                        .fill(.black)
                        .frame(width: 6, height: 6)
                }
                VStack{
                    TextField("Current Location", text: $startLocationText)
                        .frame(height: 32)
                        .background(Color(.systemGroupedBackground))
                        .padding(.trailing)
                    
                    TextField("Where to", text: $locationViewModel.queryFragment)
                        .frame(height: 32)
                        .background(Color(.systemGray4))
                        .padding(.trailing)
                    

                }
                
            }
            .padding(.horizontal)
            .padding(.top, 64)
            Divider()
                .padding(.vertical)
            ScrollView{
                ForEach(locationViewModel.results, id: \.self){result in
                    LocationSearchResultCell(name: result.title, description: result.subtitle)
                        .onTapGesture {
                            withAnimation(.spring){
                                locationViewModel.selectLocation(result)
                                mapState = .locationSelected
                            }
                        }
                }
            }
        }
        .background(.white)
    }
}

#Preview {
    LocationSearchView(mapState: .constant(.searchingForLocation))
}
