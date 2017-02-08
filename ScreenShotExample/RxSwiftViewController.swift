import UIKit
import RxSwift
import RxCocoa

final class RxSwiftViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let viewModel = RxSwiftViewModel()

    @IBOutlet private weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        rx.sentMessage(#selector(viewWillAppear(_:)))
            .map { _ in }
            .bindTo(viewModel.viewWillAppear)
            .addDisposableTo(disposeBag)

        viewModel.displayArticles
            .bindTo(tableView.rx.items(cellIdentifier: "Cell")) { _, article, cell in
                cell.textLabel?.text = article.title
                cell.detailTextLabel?.text = "👍\(article.likeCount)"
            }
            .addDisposableTo(disposeBag)
    }
}
