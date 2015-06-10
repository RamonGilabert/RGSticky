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

        self.profileImageView.frame = CGRectMake(5, 5, 85, 85)

        self.userNameLabel.frame = CGRectMake(0, 0, 0, 0)
        self.userNameLabel.font = UIFont(name: "Helvetica-Bold", size: 20)

        self.commentLabel.frame = CGRectMake(0, 0, 0, 0)
        self.commentLabel.font = UIFont(name: "Helvetica", size: 18)

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
        self.userNameLabel.frame = CGRectMake(0, 0, 0, 0)

        self.commentLabel.text = comment
        self.commentLabel.sizeToFit()
        self.commentLabel.frame = CGRectMake(0, 0, 0, 0)
    }

    // MARK: Selected cell

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
