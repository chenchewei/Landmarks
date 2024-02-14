//
//  PageView.swift
//  Landmarks
//
//  Created by Anderson Chen on 2024/2/14.
//

import SwiftUI

struct PageView<Page: View>: View {
    
    var pages: [Page]
    
    var body: some View {
        PageViewController(pages: pages)
            .aspectRatio(1.5, contentMode: .fit)
    }
}

#Preview {
    PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
}
