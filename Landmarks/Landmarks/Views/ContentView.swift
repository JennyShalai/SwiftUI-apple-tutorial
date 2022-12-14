//
//  ContentView.swift
//  Landmarks
//
//  Created by Jenny Shalai on 11/20/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            // makes the modal object available to any subview.
            .environmentObject(ModelData())
    }
}
