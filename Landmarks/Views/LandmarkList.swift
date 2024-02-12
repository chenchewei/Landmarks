//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Anderson Chen on 2024/2/12.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        List {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
    }
}

#Preview {
    LandmarkList()
}
