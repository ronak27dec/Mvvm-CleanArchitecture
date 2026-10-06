//
//  PostView.swift
//  Mvvm+CleanArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import SwiftUI

struct PostView: View {
    @StateObject private var viewModel: PostsViewModel

    init(viewModel: PostsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            self.content
                .navigationDestination(
                    item: Binding(
                        get: {
                            if case let .postDetails(detail) = viewModel.state.navigation {
                                return detail
                            }
                            return nil
                        },
                        set: { _ in
                            self.viewModel.clearNavigation()
                        }
                    ),
                    destination: { (detailState: PostDetailsViewState) in
                        PostDetailsView(state: detailState)
                    }
                )
                .task {
                    await self.viewModel.onAppear()
                }
        }
    }

    @ViewBuilder
    private var content: some View {
        if self.viewModel.state.isLoading {
            ProgressView()
        } else if let error = viewModel.state.errorMessage {
            Text(error)
                .foregroundColor(.red)
        } else {
            List(self.viewModel.state.posts) { post in
                VStack(alignment: .leading, spacing: 4) {
                    Text(post.title)
                        .font(.subheadline)
                        .onTapGesture {
                            self.viewModel.postSelected(post)
                        }
                }
            }
        }
    }
}
