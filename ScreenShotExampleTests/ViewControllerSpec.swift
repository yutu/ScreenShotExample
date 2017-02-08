import UIKit
import Quick
import Nimble
import Nimble_Snapshots
import OHHTTPStubs
@testable import ScreenShotExample

final class ViewControllerSpec: QuickSpec {
    override func spec() {
        describe("view") {
            var subject: UINavigationController!
            var window: UIWindow!

            beforeEach {
                window = UIWindow()

                let bundle = Bundle.main
                let storyboard = UIStoryboard(name: "Main", bundle: bundle)
                subject = storyboard.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
            }

            afterEach {
                window = nil
                OHHTTPStubs.removeAllStubs()
            }

            context("If it have 2 comments") {
                beforeEach {
                    _ = stub(condition: isPath("/articles") && isMethodGET()) { _ in
                        let stubPath = OHPathForFileInBundle("articles.json", Bundle.main)
                        return fixture(filePath: stubPath!, headers: ["Content-Type" as NSObject: "application/json" as AnyObject])
                    }

                    window.addSubview(subject.view)
                    RunLoop.current.run(until: Date())
                }

                it("displays 2 comments") {
                    // 📷(subject)
                    expect(subject).toEventually(haveValidSnapshot())
                }
            }
        }
    }
}
