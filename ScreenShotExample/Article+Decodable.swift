import Foundation
import Himotoki

extension Article: Decodable {
    static func decode(_ e: Extractor) throws -> Article {
        return try Article(
            id:        e <| "id",
            title:     e <| "title",
            likeCount: e <| "like_count"
        )
    }
}
