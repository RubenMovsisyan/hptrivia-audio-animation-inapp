//
//  InstructionsView.swift
//  HPTrivia
//
//  Created by Ruben Movsisyan on 4/1/24.
//

import SwiftUI

struct InstructionsView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            
           InfoBackgroundImage()
            
            VStack {
                Image("appiconwithradius")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding()
                
                ScrollView {
                    Text("How To Play")
                        .font(.largeTitle)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Welcome to HP Trivia! In this game, you will be asked random question from the HP books and you must guess correct answer or you will lose points. 😱")
                            .padding([.horizontal, .bottom])
                        
                        Text("Each question is worth 5 point, but if you guess wrong answer, you lose 1 point.")
                            .padding([.horizontal, .bottom])
                        
                        Text("If you are struggling with the question, there is an option to reveal a hint or reveal the book that answers the question. But beware! Using these also minuses 1 point.")
                            .padding([.horizontal, .bottom])
                        
                        Text("When you select the correct answer, you will be awarded all the points left for that question, and they will be added to your total score.")
                            .padding(.horizontal)
                    }
                    .font(.title3)
                    
                    Text("Good luck!")
                        .font(.title)
                }
                .foregroundStyle(.black)
                
                Button("Done") {
                    dismiss()
                }
                .doneButton()
            }

        }
    }
}

#Preview {
    InstructionsView()
}
