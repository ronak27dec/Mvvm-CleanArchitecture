//
//  PostsViewModel.swift
//  Mvvm+CleanArchitecture
//
//  Created by Ronak Malick on 14/02/26.
//

import Combine
import Foundation

@MainActor
final class PostsViewModel: ObservableObject {
    @Published private(set) var state: PostsViewState

    private let fetchPostsUseCase: FetchPostsUseCase

    init(fetchPostsUseCase: FetchPostsUseCase) {
        self.fetchPostsUseCase = fetchPostsUseCase
        self.state = PostsViewState.initial
    }

    func onAppear() async {
        await self.loadPosts()
    }

    private func loadPosts() async {
        self.state = self.state.copy(isLoading: true)

        do {
            let posts = try await fetchPostsUseCase.execute()

            let rowStates = posts.map {
                PostRowViewState(
                    id: $0.id,
                    title: $0.title,
                    subtitle: $0.description
                )
            }

            self.state = self.state.copy(
                isLoading: false,
                posts: rowStates
            )
        } catch {
            self.state = self.state.copy(
                isLoading: false,
                errorMessage: error.localizedDescription
            )
        }
    }

    func postSelected(_ post: PostRowViewState) {
        let detailState = PostDetailsViewState(
            id: post.id,
            title: post.title,
            subtitle: post.subtitle
        )
        self.state = self.state.copy(
            navigation: .postDetails(detailState)
        )
    }

    func clearNavigation() {
        self.state = self.state.copy(navigation: nil)
    }
}
