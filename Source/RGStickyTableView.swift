import UIKit

class RGStickyTableView: UITableView {

    func frameWithBackgroundStickyImage(frame: CGRect, image: UIImage) {
        self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.width, frame.height)
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {

    }
}
