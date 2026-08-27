//
//  ChessClockView.swift
//  ChessAccesibilityClock
//
//  Created by Anthony Sale on 07/05/2026.
//

import SwiftUI

struct ChessClockView: View {
    @State private var player1Time = 600 // 10 minutes in seconds
    @State private var player2Time = 600 // 10 minutes in seconds
    @State private var isPlayer1Turn = true
    @State private var timer: Timer?
    @State private var isFirstStart = true

    var body: some View {
        VStack(spacing: 20) {
            Text("Chess Clock")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            HStack(spacing: 30) {
                // Player 1 Clock
                VStack {
                    Text("Player 1")
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                    Text(formatTime(player1Time))
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(isPlayer1Turn ? .yellow : .white)
                }
                .frame(maxWidth: .infinity)
                
                // Player 2 Clock
                VStack {
                    Text("Player 2")
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                    Text(formatTime(player2Time))
                        .font(.system(size: 48, weight: .bold))
                        .foregroundColor(!isPlayer1Turn ? .yellow : .white)
                }
                .frame(maxWidth: .infinity)
            }
            .padding()
            .background(Color.black.opacity(0.3))
            .cornerRadius(10)
            
            Button(action: {
                finishCurrentTurn()
            }) {
                Text("Finish Turn")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .disabled(isFirstStart)
            
            Button(action: {
                if isFirstStart {
                    startTimer()
                    isFirstStart = false
                } else {
                    restartTimer()
                }
            }) {
                Text(isFirstStart ? "Start Timer" : "Restart Timer")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea()
        .background(Color.green)
    }
    
    func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let secs = seconds % 60
        return String(format: "%02d:%02d", minutes, secs)
    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if isPlayer1Turn {
                player1Time -= 1
                if player1Time <= 0 {
                    player1Time = 0
                    timer?.invalidate()
                }
            } else {
                player2Time -= 1
                if player2Time <= 0 {
                    player2Time = 0
                    timer?.invalidate()
                }
            }
        }
    }
    
    func finishCurrentTurn() {
        // Stop the current timer
        timer?.invalidate()
        
        // Switch turn to the other player
        isPlayer1Turn.toggle()
        
        // Start the timer for the new player
        startTimer()
    }
    
    func restartTimer() {
        // Stop any existing timer
        timer?.invalidate()
        
        // Reset both player times and turn state
        player1Time = 600
        player2Time = 600
        isPlayer1Turn = true
        
        // Start a new timer
        startTimer()
    }
}

#Preview {
    ChessClockView()
}
