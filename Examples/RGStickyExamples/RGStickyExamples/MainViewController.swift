import UIKit

class MainViewController: UIViewController, UITableViewDelegate {

    let tableView = RGStickyTableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)
        self.tableView.delegate = self
    }
}
