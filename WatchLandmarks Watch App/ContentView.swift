//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by Anderson Chen on 2024/2/14.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
