//
//  ContentView.swift
//  rockPaper
//
//  Created by Muhammad Faisal Imran Khan on 17/6/23.
//

import SwiftUI

struct ContentView: View {
    @State var moves = ["Rock", "Paper", "Scissors"]
    @State private var win = Bool.random()
    @State private var appChoice = Int.random(in: 0...2)
    @State private var score = 0
    @State private var questionCount = 0
    @State private var scoreTitle = ""
    @State private var showingScore = true
    @State private var showingFinalScore = false
    func askQuestion() {
        moves.shuffle()
        appChoice = Int.random(in: 0...2)
        win = Bool.random()
        
    }
    
    func resetMethod(){
       
            showingFinalScore = false
       
        score = 0
       
        questionCount = 0
        scoreTitle = ""
        askQuestion()
    }
    var body: some View {
        
        ZStack{
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Rock, Paper , Scissors")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack{
                        
                        Text("App Selected")
                            .font(.subheadline.weight(.heavy))
                            .foregroundColor(.white)
                        
                        
                        Text(moves[appChoice])
                            .font(.largeTitle.weight(.semibold))
                            .foregroundStyle(.secondary)
                        
                        Text("You should select for")
                            .font(.subheadline.weight(.heavy))
                            .foregroundColor(.white)
                        
                        
                        Text(win.description)
                            .font(.largeTitle.weight(.semibold))
                            .foregroundStyle(.secondary)
                        
                        
                        
                        ForEach(0..<3) { number in
                            Button {
                                playerHasChosen(number, number: appChoice, win: win)
                            } label: {
                                Text(moves[number])
                                    .font(.largeTitle.weight(.semibold))
                                    .foregroundStyle(.secondary)
                            }
                            
                            
                        }
                        
                    }
                    
                    
                }
                
                
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: " + score.description)
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
                
            }
            .padding()
        }
        
        
        .alert(scoreTitle, isPresented: $showingScore) {
            
            Button("Continue", action: askQuestion)
            
        } message: {
            Text("Score:" + score.description)
                .foregroundColor(.white)
                .font(.title.bold())
        }
        
        .alert(scoreTitle, isPresented: $showingFinalScore) {
            
                Button("New Game", action: resetMethod)
            
        } message: {
            Text("Score:" + score.description)
                .foregroundColor(.white)
                .font(.title.bold())
        }
        
        
    }
    
    //moves: player
    //number: app
    //0: Rock
    //1: Paper
    //2: Scissor
    
    func playerHasChosen(_ moves : Int, number : Int, win : Bool) {
            questionCount += 1
        
      
            if number == 0 && moves == 1 && win == true {
                score += 5
                scoreTitle = "Correct"
            }
            else if number == 0 && moves == 1 && win == false {
                score -= 5
                scoreTitle = "False"
            }
        
        if number == 0 && moves == 2 && win == false {
            score += 5
            scoreTitle = "Correct"
        }
        else if number == 0 && moves == 2 && win == true {
            score -= 5
            scoreTitle = "False"
        }
        
        if number == 1 && moves == 2 && win == true {
            score += 5
            scoreTitle = "Correct"
        }
        
      else  if number == 1 && moves == 2 && win == false {
            score -= 5
          scoreTitle = "False"
        }
        
        if number == 1 && moves == 0 && win == false {
            score += 5
            scoreTitle = "Correct"
        }
        
      else  if number == 1 && moves == 0 && win == true {
            score -= 5
          scoreTitle = "False"
        }
 
        if number == 2 && moves == 0 && win == true {
            score += 5
            scoreTitle = "Correct"
        }
        
      else  if number == 2 && moves == 0 && win == false {
            score -= 5
          scoreTitle = "False"
        }
        
        if number == 2 && moves == 1 && win == false {
            score += 5
            scoreTitle = "Correct"
        }
        
      else  if number == 2 && moves == 1 && win == true {
            score -= 5
          scoreTitle = "False"
        }
     
        
        if( questionCount == 10){
           
            scoreTitle = "Game Over"
            showingFinalScore = true
            
        }
        showingScore = true
        
        
            
        }
    
    
    


      
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
