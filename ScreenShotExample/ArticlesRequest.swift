import Foundation
import APIKit
import Himotoki

struct ArticlesRequest: Request {
    typealias Response = ArticlesResponse

    var baseURL: URL {
        return URL(string: "https://localhost")!
    }

    var method: HTTPMethod {
        return .get
    }

    var path: String {
        return "/articles"
    }

    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> ArticlesResponse {
        return try decodeValue(object)
    }
}
