import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = RGStickyTableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: Constant.Information.ReusableIdentifier)
        self.tableView.addStickyImage(UIImage(named: "header-sticky-image")!, heigth: Constant.Size.DeviceHeight/2)
        self.view.addSubview(self.tableView)
    }

    // MARK: TableView delegate methods

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constant.Information.ReusableIdentifier) as! UITableViewCell
        cell.textLabel?.text = "Sup"
        return cell
    }
}
