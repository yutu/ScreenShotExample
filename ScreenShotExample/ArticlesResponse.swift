import Foundation
import Himotoki

struct ArticlesResponse: Decodable {
    let articles: [Article]

    static func decode(_ e: Extractor) throws -> ArticlesResponse {
        return try ArticlesResponse(articles: decodeArray(e.rawValue))
    }
}
