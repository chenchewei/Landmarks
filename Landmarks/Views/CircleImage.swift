//
//  CircleImage.swift
//  Landmarks
//
//  Created by Anderson Chen on 2024/2/4.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .clipShape(.circle)
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(image: Image(.turtlerock))
}
