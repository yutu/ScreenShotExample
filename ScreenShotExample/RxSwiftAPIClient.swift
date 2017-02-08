import Foundation
import RxSwift
import APIKit

struct RxSwiftAPIClient {
    private let session: APIKit.Session

    init(session: APIKit.Session = .shared) {
        self.session = session
    }

    var articles: Observable<[Article]> {
        return session.rx.response(ArticlesRequest()).map { $0.articles }
    }
}
