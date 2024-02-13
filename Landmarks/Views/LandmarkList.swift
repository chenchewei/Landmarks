//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Anderson Chen on 2024/2/12.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly: Bool = true
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { !showFavoritesOnly || $0.isFavorite }
    }
    
    var body: some View {
        NavigationSplitView {
            List {
                // Use the $ prefix to access a binding to a state variable, or one of its properties.
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    LandmarkList()
}
