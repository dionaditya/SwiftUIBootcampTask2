//
//  SheetDetailView.swift
//  Task2
//
//  Created by Dion Aditya on 27/11/22.
//

import SwiftUI

struct CategoryItem: Identifiable {
    let id = UUID()
      
    let title: String, icon: String, color: Color;
}

struct SheetDetailView: View {
    // MARK: - Properties
    var categoryItems: [CategoryItem] = [
        CategoryItem(title: "Walk", icon: "figure.walk.motion", color: .green),
        CategoryItem(title: "Food", icon: "fork.knife.circle.fill", color: .orange),
        CategoryItem(title: "Stay", icon: "house.fill", color: .blue),
        CategoryItem(title: "Ride", icon: "sailboat.fill", color: .indigo),
    ]
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack(spacing: 100) {
                Text("Pink Beach, Flores")
                    .font(.title2)
                    .fontWeight(.bold)
                
                HStack {
                    Image(systemName: "star.fill")
                        .symbolRenderingMode(.multicolor)
                    Text("4.8")
                        .font(.title2)
                        .fontWeight(.bold)
                } //: HSTACK
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(categoryItems, id: \.id) { category in
                                CategoryItemView(title: category.title, icon: category.icon, color: category.color)
                                
                            }
                        } //: HSTACK
            }.padding() //: ScrollView
            
            
            VStack {
                Text("About Destination")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                    .frame(
                        maxWidth: .infinity,
                        alignment: .leading
                    )
                    
                Text("Pink Beach, or Pantai Merah, as it aptly named, is one of seven pink beaches on the planet, This was awesome")
                
                
            }.frame(
                maxWidth: .infinity,
                alignment: .leading
            ) //: VStack
             
            
            HStack(spacing: 100) {
                Text("$81,39")
                    .font(.title)
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                    .padding(EdgeInsets(top: 0, leading: -20, bottom: 10, trailing: 0))
                
                Link(destination: URL(string: "https://www.apple.com")!) {
                          HStack {
                              Image(systemName: "case")
                              Text("Join Tour")
                          }
                          .frame(width: 140, height: 60)
                          .foregroundColor(.white)
                          .background(LinearGradient(colors: [.purple, .indigo], startPoint: .leading, endPoint: .trailing))
                          .clipShape(Capsule())
                          .shadow(radius: 8, x: 10, y: 2)
            
                }
                      
            } //: HSTACK
                .padding()
            
            Spacer()
        } //: VSTACK
            .padding(20)
   
    }
}

struct SheetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SheetDetailView()
    }
}

struct CategoryItemView: View {
    var title: String
    var icon: String
    var color: Color
    
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .center, spacing: 8) {
                Image(systemName: icon)
                    .symbolRenderingMode(.multicolor)
                    .font(.system(size: 24))
                    .foregroundColor(color)
                
                Text(title)
                    .foregroundColor(.primary)
            }
            
        } //: HSTACK
        .frame(width: 45, height: 75)
        .padding()
        .background(Color("BrokenWhite"))
        .cornerRadius(10)
    }
}
