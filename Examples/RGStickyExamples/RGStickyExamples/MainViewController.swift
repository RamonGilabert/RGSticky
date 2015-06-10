import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = RGStickyTableView()
    let arrayOfDictionaries = DataManager.Dictionary

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, Constant.Size.DeviceHeight)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.registerClass(CommentsTableViewCell.classForCoder(), forCellReuseIdentifier: Constant.Information.ReusableIdentifier)
        self.tableView.addStickyImage(UIImage(named: "header-sticky-image")!, heigth: Constant.Size.DeviceHeight/2)
        self.view.addSubview(self.tableView)
    }

    // MARK: TableView delegate methods

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfDictionaries.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constant.Information.ReusableIdentifier) as! CommentsTableViewCell
        let dictionary = self.arrayOfDictionaries[indexPath.row]
        cell.configureCell(dictionary["photo"]!, userName: dictionary["name"]!, comment: dictionary["comment"]!)
        return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let dictionary = self.arrayOfDictionaries[indexPath.row]

        let userNameLabel = UILabel()
        userNameLabel.text = dictionary["name"]!
        userNameLabel.font = UIFont(name: "Helvetica-Bold", size: 17)
        userNameLabel.sizeToFit()
        userNameLabel.frame = CGRectMake(75, 5, userNameLabel.frame.width, userNameLabel.frame.height)

        let commentLabel = UILabel(frame: CGRectMake(75, 0, Constant.Size.DeviceWidth - 80, 0))
        commentLabel.text = dictionary["comment"]!
        commentLabel.font = UIFont(name: "Helvetica", size: 16)
        commentLabel.numberOfLines = 10
        commentLabel.sizeToFit()
        commentLabel.frame = CGRectMake(userNameLabel.frame.origin.x, userNameLabel.frame.origin.y + userNameLabel.frame.height, commentLabel.frame.width, commentLabel.frame.height)

        return commentLabel.frame.origin.y + commentLabel.frame.height + 12.5
    }

    // MARK: Scroll methods

    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.tableView.updateHeaderView(scrollView)
    }

    // MARK: White status bar

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
