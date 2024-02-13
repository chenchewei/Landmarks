//
//  RotateBadgeSymbol.swift
//  Landmarks
//
//  Created by Anderson Chen on 2024/2/13.
//

import SwiftUI

struct RotateBadgeSymbol: View {
    let angle: Angle
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotateBadgeSymbol(angle: Angle(degrees: 5))
}
