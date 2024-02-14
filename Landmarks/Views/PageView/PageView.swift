//
//  PageView.swift
//  Landmarks
//
//  Created by Anderson Chen on 2024/2/14.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    @State private var currentPage: Int = 0
    
    var body: some View {
        VStack {
            PageViewController(pages: pages, currentPage: $currentPage)

            Text("Current Page: \(currentPage)")
        }
        .aspectRatio(1.5, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}
