//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Anderson Chen on 2024/2/14.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode
    @Environment(ModelData.self) var modelData
    @State private var draftProfile: Profile = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20, content: {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive
                    }
                }
                
                Spacer()
                
                EditButton()
            }
            
            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear(perform: {
                        draftProfile = modelData.profile
                    })
                    .onDisappear(perform: {
                        modelData.profile = draftProfile
                    })
            }
            
            
        })
        .padding()
    }
}

#Preview {
    // !!!: Even though this view doesn’t use a property with the @Environment property wrapper, ProfileSummary, a child of this view, does. So without the modifier, the preview fails.
    ProfileHost()
        .environment(ModelData())
}
