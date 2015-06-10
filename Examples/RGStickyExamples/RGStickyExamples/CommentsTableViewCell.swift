import UIKit

class CommentsTableViewCell: UITableViewCell {

    let profileImageView = UIImageView()
    let userNameLabel = UILabel()
    let commentLabel = UILabel()

    // MARK: View lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.profileImageView.frame = CGRectMake(5, 5, 65, 65)
        self.profileImageView.contentMode = UIViewContentMode.ScaleAspectFill

        self.userNameLabel.frame = CGRectMake(75, 0, 0, 0)
        self.userNameLabel.font = UIFont(name: "Helvetica-Bold", size: 17)

        self.commentLabel.frame = CGRectMake(75, 0, Constant.Size.DeviceWidth - 80, 0)
        self.commentLabel.font = UIFont(name: "Helvetica", size: 16)
        self.commentLabel.numberOfLines = 10

        self.addSubview(self.profileImageView)
        self.addSubview(self.userNameLabel)
        self.addSubview(self.commentLabel)
    }

    // MARK: Required

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Configure the cell

    func configureCell(image: String, userName: String, comment: String) {
        self.profileImageView.image = UIImage(named: image)

        self.userNameLabel.text = userName
        self.userNameLabel.sizeToFit()
        self.userNameLabel.frame = CGRectMake(self.profileImageView.frame.origin.x + self.profileImageView.frame.width + 5, 5, self.userNameLabel.frame.width, self.userNameLabel.frame.height)

        self.commentLabel.text = comment
        self.commentLabel.sizeToFit()
        self.commentLabel.frame = CGRectMake(self.userNameLabel.frame.origin.x, self.userNameLabel.frame.origin.y + self.userNameLabel.frame.height, self.commentLabel.frame.width, self.commentLabel.frame.height)
    }

    // MARK: Selected cell

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
