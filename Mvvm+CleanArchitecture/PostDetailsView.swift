//
//  PostDetailsView.swift
//  Mvvm+CleanArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import SwiftUI

struct PostDetailsView: View {
    let state: PostDetailsViewState

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(self.state.title)
                .font(.title)

            Text(self.state.subtitle)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}
