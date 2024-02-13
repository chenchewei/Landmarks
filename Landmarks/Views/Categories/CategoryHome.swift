//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Anderson Chen on 2024/2/13.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationSplitView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets()) // Fill in row size
                
                
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) {
                    CategoryRow(categoryName: $0, items: modelData.categories[$0]!)
                }
                .listRowInsets(EdgeInsets())
            }
                .navigationTitle("Featured")
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
