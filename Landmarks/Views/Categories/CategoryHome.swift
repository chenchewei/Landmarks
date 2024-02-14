//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Anderson Chen on 2024/2/13.
//

import SwiftUI

struct CategoryHome: View {
    @Environment(ModelData.self) var modelData
    @State private var showingProfile: Bool = false
    
    var body: some View {
        NavigationSplitView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .listRowInsets(EdgeInsets()) // Fill in row size
                
                
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) {
                    CategoryRow(categoryName: $0, items: modelData.categories[$0]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.fill")
                    
                }
                
            }
            .sheet(isPresented: $showingProfile, content: {
                ProfileHost()
                    .environment(modelData)
            })
            
            
        } detail: {
            Text("Select a Landmark")
        }
    }
}

#Preview {
    CategoryHome()
        .environment(ModelData())
}
