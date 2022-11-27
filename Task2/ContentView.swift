//
//  ContentView.swift
//  Task2
//
//  Created by Dion Aditya on 26/11/22.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPS
    
    @State private var isShown = false
    @State private var isShowingDetailSheet: Bool = false
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Image("go-to-beach")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .overlay(
                    Color.black
                        .opacity(0.5)
                        .ignoresSafeArea()
            )
            
            VStack {
                HStack(spacing: 100) {
    
                    Button{
                        isShown = true
                    } label: {
                        Image(systemName: "cloud.sun.fill")
                            .symbolRenderingMode(.multicolor)
                            .font(.title2)
                            .foregroundColor(.white)
                    } .alert("Not yet available", isPresented: $isShown, actions: {
                        // Any view other than Button would be ignored
                   
                    }, message: {
                        // Any view other than Text would be ignored
                        Text("Currently on active development")
                    })
                    
                    Text("Travel")
                        .font(.title2)
                        .foregroundColor(.white)
                    
                    Button {
                        isShowingDetailSheet.toggle()
                    } label: {
                        Image(systemName: "cart.badge.plus")
                            .symbolRenderingMode(.multicolor)
                            .font(.title2)
                            .foregroundColor(.white)
                    }.sheet(isPresented: $isShowingDetailSheet) {
                        VStack {
                            SheetDetailView()
                                .presentationDetents([.fraction(0.5), .fraction(0.6)])
                                .presentationDragIndicator(.visible)
                                                            
                        }
                    }
                  
                }.padding()
        
                VStack(alignment: .leading) {
                    Text("Start your Adventure and Go Travel Now")
                        .font(.system(size: 45))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 100))
                    
                    Text("Discover local destinations beauty with Bluesky and travel with pride")
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 5, leading: 30, bottom: 0, trailing: 30))
                        .fontWeight(.semibold)
                    
                }.padding(40)
                
                Spacer()
            
                
            } //: VStack
            .padding()
        }
       
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
