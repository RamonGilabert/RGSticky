import UIKit

class RGStickyTableView: UITableView {

    private var imageView = UIImageView() {
        didSet {
            self.imageView.contentMode = UIViewContentMode.ScaleAspectFill
            self.imageView.clipsToBounds = true
        }
    }

    var height: CGFloat = 0.0 {
        didSet {
            self.imageView.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y - self.height, self.frame.width, self.height)
            self.contentInset = UIEdgeInsetsMake(self.height, 0, 0, 0)
        }
    }

    var image = UIImage() {
        didSet {
            self.imageView.image = self.image
        }
    }

    func addStickyImage(image: UIImage, heigth: CGFloat) {
        self.height = heigth
        self.image = image

        self.addSubview(imageView)
    }

    // MARK: Delegate methods

    func updateHeaderView(scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        var imageViewFrame = self.imageView.frame
        
        if yOffset < -self.height {
            imageViewFrame.origin.y = yOffset
            imageViewFrame.size.height = -yOffset
            self.imageView.frame = imageViewFrame
        }
    }
}
