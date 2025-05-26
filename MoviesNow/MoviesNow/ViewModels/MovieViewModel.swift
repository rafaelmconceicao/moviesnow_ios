import Foundation

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []

    func loadMovies() {
        movies = MovieService.loadMovies()
    }
}

