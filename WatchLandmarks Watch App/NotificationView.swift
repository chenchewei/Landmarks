//
//  NotificationView.swift
//  WatchLandmarks Watch App
//
//  Created by Anderson Chen on 2024/2/14.
//

import SwiftUI

struct NotificationView: View {
    
    var title: String?
    var message: String?
    var landmark: Landmark?
    
    var body: some View {
        VStack {
            if let landmark {
                CircleImage(image: landmark.image.resizable())
                    .scaledToFit()
            }
            
            Text(title ?? "Unknown Landmark title")
                .font(.headline)
            
            Divider()
            
            Text(message ?? "You are within 5 miles of one of your favorite landmarks.")
                .font(.caption)
        }
    }
}

#Preview {
    NotificationView(
        title: "Turtle Rock",
        message: "a piece of message",
        landmark: ModelData().landmarks[0]
    )
}
