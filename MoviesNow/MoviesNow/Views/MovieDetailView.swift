import SwiftUI
import WebKit

struct MovieDetailView: View {
    let movie: Movie
    @State private var showTrailer = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                AsyncImage(url: URL(string: movie.posterUrl)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 250)
                .overlay(alignment: .bottomTrailing) {
                    Button {
                        showTrailer.toggle()
                    } label: {
                        Image(systemName: "play.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                            .padding()
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(movie.title)
                        .font(.title)
                        .bold()
                    Text("\(movie.releaseYear) • \(movie.durationMinutes) min")
                        .foregroundColor(.secondary)
                    Text(movie.description)
                        .font(.body)

                    HStack {
                        ForEach(0..<10) { i in
                            Image(systemName: i < Int(movie.rating) ? "star.fill" : "star")
                                .foregroundColor(i < Int(movie.rating) ? .yellow : .gray)
                        }
                        Text(" \(String(format: "%.1f", movie.rating))/10")
                            .font(.caption)
                    }
                }
                .padding(.horizontal)
            }
        }
        .sheet(isPresented: $showTrailer) {
            WebView(url: movie.trailerUrl)
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

