//
//  FavouritesView.swift
//  Jokes
//
//  Created by Leon Gell on 2023-04-17.
//

import Blackbird
import SwiftUI

struct FavouritesView: View {
    
    //MARK: Stored Properties
    
    // the list of favourite jokes
    @BlackbirdLiveModels({ db in
        try await Joke.read(from: db)
    }) var favouriteJokes
    
    //MARK: Computed Properties
    var body: some View {
        List(favouriteJokes.results) { currentJoke in
            VStack(alignment: .leading) {
                Text(currentJoke.setup)
                    .bold()
                Text(currentJoke.punchline)
            }
        }
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
        // Make the databse accessible to all the different views.
            .environment(\.blackbirdDatabase, AppDatabase.instance)
    }
}
