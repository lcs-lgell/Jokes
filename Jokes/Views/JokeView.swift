//
//  JokeView.swift
//  Jokes
//
//  Created by Leon Gell on 2023-04-14.
//

import SwiftUI

struct JokeView: View {
    
    //MARK: Stored Properties
    
    //0.0 is invisible, 1.0 is visible
    @State var punchlineOpacity = 0.0
    
    // The current joke to display
    @State var currentJoke: Joke?
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                if let currentJoke = currentJoke {
                   
                    
                //Show the joke if it can be unwrapped
                    Text(currentJoke.setup)
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
                        withAnimation(.easeIn(duration: 1.0)) {
                            punchlineOpacity = 1.0
                        }
                    }, label: {
                        Image(systemName: "arrow.down.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40)
                            .tint(.black)
                    })
                    
                    Text(currentJoke.punchline)
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .opacity(punchlineOpacity)
                    
                    
                    
                } else {
                    // Show a spinning wheel indicator
                    ProgressView()
                }
                
                
              
            }
            .navigationTitle("Random Jokes")
        }
        // Create a asynchronous task to be performed as this view appears
        .task {
            currentJoke = await NetworkService.fetch()
        }
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView()
    }
}
