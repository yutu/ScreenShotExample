import Foundation
import BoltsSwift
import Alamofire
import Himotoki

struct BoltsExampleAPIClient {
    private let manager: SessionManager

    init(manager: SessionManager = Alamofire.SessionManager.default) {
        self.manager = manager
    }

    var articles: Task<[Article]> {
        let taskCompletionSource = TaskCompletionSource<[Article]>()

        manager.request("https://localhost/articles").responseJSON { response in
            let articles: [Article] = try! decodeArray(response.result.value!) // it's sample!!
            taskCompletionSource.set(result: articles)
        }

        return taskCompletionSource.task
    }
}
