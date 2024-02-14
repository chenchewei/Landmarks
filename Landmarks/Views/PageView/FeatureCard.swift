//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Anderson Chen on 2024/2/14.
//

import SwiftUI

struct FeatureCard: View {
    var landmark: Landmark
    
    var body: some View {
        landmark.featureImage?
            .resizable()
            .overlay(content: {
                TextOverlayView(landmark: landmark)
            })
    }
}

struct TextOverlayView: View {
 
    var landmark: Landmark
    
    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center
        )
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading, content: {
            gradient
            
            VStack(alignment: .leading, content: {
                Text(landmark.name)
                    .font(.title)
                    .bold()
                
                Text(landmark.park)
            })
            .padding()
        })
        .foregroundStyle(.white)
    }
}


#Preview {
    FeatureCard(landmark: ModelData().features[0])
        .aspectRatio(1.5, contentMode: .fit)
}
