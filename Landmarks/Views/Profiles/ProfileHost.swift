//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Anderson Chen on 2024/2/14.
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile: Profile = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            ProfileSummary(profile: draftProfile)
        })
        .padding()
    }
}

#Preview {
    ProfileHost()
}
