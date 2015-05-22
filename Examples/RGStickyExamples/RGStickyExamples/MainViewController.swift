import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = RGStickyTableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)
        self.tableView.delegate = self
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: Constant.Information.ReusableIdentifier)
    }

    // MARK: TableView delegate methods

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constant.Information.ReusableIdentifier) as! UITableViewCell

        return cell
    }
}
