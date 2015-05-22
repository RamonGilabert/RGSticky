import UIKit

class RGStickyTableView: UITableView {

    func frameWithBackgroundStickyImage(frame: CGRect, imageView: UIImageView) {
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.width, frame.height)
        self.contentInset = UIEdgeInsetsMake(imageView.frame.height, 0, 0, 0)
        self.addSubview(imageView)
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {

    }
}
