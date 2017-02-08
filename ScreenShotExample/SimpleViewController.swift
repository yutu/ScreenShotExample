import UIKit

final class SimpleViewController: UITableViewController {
    private let articles = [
        Article(id: 1, title: "hoge", likeCount: 123),
        Article(id: 2, title: "meso", likeCount: 456)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
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
