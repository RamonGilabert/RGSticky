import UIKit

class RGStickyTableView: UITableView {

    func frameWithBackgroundStickyImage(imageView: UIImageView) {
        self.contentInset = UIEdgeInsetsMake(imageView.frame.height, 0, 0, 0)
        self.addSubview(imageView)
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        println("Sup")
    }
}
