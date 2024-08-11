//
//  RideRequestView.swift
//  Uber
//
//  Created by Павел Калинин on 15.03.2024.
//

import SwiftUI

struct RideRequestView: View {
    var body: some View {
        VStack{
            VStack{
                Capsule()
                    .frame(width: 46, height: 6)
                    .foregroundStyle(.gray)
                    .cornerRadius(5)
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
                    VStack(alignment: .leading, spacing: 24){
                        HStack{
                            Text("Current location")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.gray)
                            Spacer()
                            Text("1:30 pm")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.gray)
                        }
                        .padding(.bottom, 10)
                        HStack{
                            Text("Starbucks")
                                .font(.system(size: 16, weight: .semibold))
                            Spacer()
                            Text("1:45 pm")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundStyle(.gray)
                        }
                    }
                    .padding(.leading, 8)
                }
            }
            .padding()
            Divider()
            Text("Suggested Rides")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding()
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView(.horizontal){
                HStack{
                    ForEach(0..<3, id: \.self){_ in
                        VStack(spacing: 20){
                            Image(systemName: "car.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                            
                            VStack(alignment: .leading ,spacing: 4){
                                Text("UberX")
                                    .font(.system(size: 14, weight: .semibold))
                                Text("$22")
                                    .font(.system(size: 14, weight: .semibold))
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 8)
                        }
                        .frame(width: 114, height: 140)
                        .background(Color(.systemGroupedBackground))
                        .cornerRadius(10)
                    }
                }
            }
            .padding(.horizontal)
            
            Divider()
                .padding(.vertical, 8)
            
            HStack(spacing: 12){
                Text("Visa")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(6)
                    .background(.blue)
                    .foregroundStyle(.white)
                    .cornerRadius(4)
                    .padding(.leading)
                
                Text("**** 1234")
                    .fontWeight(.bold)
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .imageScale(.medium)
                    .padding()
                
                
            }
            .frame(height: 50)
            .background(Color(.systemGroupedBackground))
            .cornerRadius(10)
            .padding(.horizontal)
            
            Button{
                
            }label: {
                Text("CONFIRM RIDE")
                    .fontWeight(.bold)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .background(.blue)
                    .cornerRadius(10)
                    .foregroundStyle(.white)
            }
        }
        .padding(.bottom, 24)
        .background(.white)
        .cornerRadius(30)
    }
}

#Preview {
    RideRequestView()
}
