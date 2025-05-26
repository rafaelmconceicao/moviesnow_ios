import Foundation

class MovieService {
    static func loadMovies() -> [Movie] {
        guard let url = Bundle.main.url(forResource: "filmes", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let decoded = try? JSONDecoder().decode(GraphQLResponse.self, from: data) else {
            return []
        }
        return decoded.data.movies
    }
}

struct GraphQLResponse: Codable {
    let data: MovieData
}

struct MovieData: Codable {
    let movies: [Movie]
}

