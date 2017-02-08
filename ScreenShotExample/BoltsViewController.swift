import UIKit

final class BoltsViewController: UITableViewController, BoltsExampleView {
    private var presenter: BoltsExamplePresenter!
    private var articles: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = BoltsExamplePresenter(view: self)

        presenter.viewDidLoad()
    }

    func display(articles: [Article]) {
        self.articles = articles
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let article = articles[indexPath.row]

        cell.textLabel?.text = article.title
        cell.detailTextLabel?.text = "👍\(article.likeCount)"

        return cell
    }
}
