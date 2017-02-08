import Foundation

protocol BoltsExampleView: class {
    func display(articles: [Article])
}

struct BoltsExamplePresenter {
    private weak var view: BoltsExampleView!
    private let client: BoltsExampleAPIClient

    init(view: BoltsExampleView, client: BoltsExampleAPIClient = BoltsExampleAPIClient()) {
        self.view = view
        self.client = client
    }

    func viewDidLoad() {
        client.articles.continueOnSuccessWith(continuation: {
            self.view.display(articles: $0)
        })
    }
}
