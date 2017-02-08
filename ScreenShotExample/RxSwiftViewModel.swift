import Foundation
import RxSwift

final class RxSwiftViewModel {
    let viewWillAppear = PublishSubject<Void>()
    let displayArticles: Observable<[Article]>

    init(client: RxSwiftAPIClient = RxSwiftAPIClient()) {
        displayArticles = viewWillAppear
            .flatMap { client.articles }
    }
}
