//
//  Gameplay.swift
//  HPTrivia
//
//  Created by Ruben Movsisyan on 4/2/24.
//

import SwiftUI

struct Gameplay: View {
    @State private var animateViewsIn = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("hogwarts")
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height * 1.05)
                    .overlay(Rectangle().foregroundStyle(.black.opacity(0.8)))
                
                VStack {
                    HStack {
                        Button("End Game") {
                            
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red.opacity(0.5))
                        
                        Spacer()
                        
                        Text("Score: 50")
                            .padding()
                    }
                    .padding()
                    .padding(.vertical, 30)
                    
                    VStack {
                        if animateViewsIn {
                            Text("Who is Harry Potter")
                                .font(.custom(Consts.hpFont, size: 50))
                                .multilineTextAlignment(.center)
                                .padding()
                                .transition(.scale)
                        }
                    }
                    .animation(.easeInOut(duration: 2), value: animateViewsIn)
                    
                    Spacer()
                    
                    HStack {
                        VStack {
                            if animateViewsIn {
                                Image(systemName: "questionmark.app.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100)
                                    .foregroundStyle(.cyan)
                                    .rotationEffect(.degrees(-15))
                                    .padding()
                                    .padding(.leading, 20)
                                    .transition(.offset(x: -geo.size.width / 2))
                            }
                        }
                        .animation(.easeOut(duration: 1.5).delay(2), value: animateViewsIn)
                        
                        Spacer()
                        
                        VStack {
                            if animateViewsIn {
                                Image(systemName: "book.closed")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50)
                                    .foregroundStyle(.black)
                                    .frame(width: 100, height: 100)
                                    .background(.cyan)
                                    .clipShape(.rect(cornerRadius: 20))
                                    .rotationEffect(.degrees(15))
                                    .padding()
                                    .padding(.trailing, 20)
                                    .transition(.offset(x: geo.size.width / 2))
                            }
                        }
                        .animation(.easeOut(duration: 1.5).delay(2), value: animateViewsIn)
                    }
                    .padding(.bottom)
                    
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(1..<5) { i in
                            VStack {
                                if animateViewsIn {
                                    Text(i == 3 ? "The boy who lived got sent o his relatives house where je was treated quit badlky " : "Answer \(i)")
                                        .minimumScaleFactor(0.5)
                                        .multilineTextAlignment(.center)
                                        .padding(10)
                                        .frame(width: geo.size.width / 2.15 , height: 80)
                                        .background(.green.opacity(0.5))
                                        .clipShape(.rect(cornerRadius: 25))
                                        .transition(.scale)
                                }
                            }
                            .animation(.easeOut(duration: 1).delay(1.5), value: animateViewsIn)
                        }
                    }
                    
                    Spacer()
                    
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .foregroundStyle(.white)
                    
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .onAppear {
            animateViewsIn = true
        }
    }
}

#Preview {
    Gameplay()
}
