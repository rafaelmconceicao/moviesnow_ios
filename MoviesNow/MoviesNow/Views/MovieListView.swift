import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel = MovieViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.movies) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie)) {
                    MovieRow(movie: movie)
                }
            }
            .navigationTitle("Movies Now")
        }
        .onAppear {
            viewModel.loadMovies()
        }
    }
}

struct MovieRow: View {
    let movie: Movie

    var body: some View {
        HStack(alignment: .top) {
            AsyncImage(url: URL(string: movie.posterUrl)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 120)
            .cornerRadius(8)

            VStack(alignment: .leading, spacing: 4) {
                Text(movie.title)
                    .font(.headline)
                Text("\(movie.releaseYear) • \(String(format: "%.1f", movie.rating))/10")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
