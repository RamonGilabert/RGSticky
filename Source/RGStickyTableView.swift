import UIKit

class RGStickyTableView: UITableView {

    private var alternativeImageView = UIImageView()
    private var fakeView = UIView()

    private var imageView = UIImageView() {
        didSet {

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

    func updateHeaderView(scrollView: UIScrollView, height: CGFloat, view: UIView) {
        let yOffset = scrollView.contentOffset.y
        self.imageView.contentMode = UIViewContentMode.ScaleAspectFill
        self.imageView.clipsToBounds = true
        
        if yOffset < -self.height {
            self.imageView.frame.origin.y = yOffset
            self.imageView.frame.size.width = -(Constant.Size.DeviceWidth * (yOffset / self.height))
            self.imageView.frame.origin.x = (Constant.Size.DeviceWidth - self.imageView.frame.size.width) / 2
            self.imageView.frame.size.height = -yOffset
        } else if yOffset > -height && self.imageView.isDescendantOfView(self) {
            self.imageView.removeFromSuperview()
            self.alternativeImageView = self.imageView
            self.alternativeImageView.image = self.imageView.image
            self.alternativeImageView.frame = CGRectMake(0, 0, Constant.Size.DeviceWidth, height)

            self.fakeView.frame = self.alternativeImageView.frame
            self.fakeView.backgroundColor = UIColor.whiteColor()
            self.fakeView.layer.shadowColor = UIColor.darkGrayColor().CGColor
            self.fakeView.layer.shadowOffset = CGSizeMake(0.1, 1.6)
            self.fakeView.layer.shadowRadius = 2
            self.fakeView.layer.shadowOpacity = 1.0

            view.addSubview(self.fakeView)
            view.addSubview(self.alternativeImageView)
        } else if yOffset < -height && !self.imageView.isDescendantOfView(self) {
            self.alternativeImageView.removeFromSuperview()
            self.fakeView.removeFromSuperview()
            self.imageView.frame = CGRectMake((Constant.Size.DeviceWidth - self.imageView.frame.size.width) / 2, -height, Constant.Size.DeviceWidth, height)
            self.addSubview(self.imageView)
        } else if yOffset > -self.height && self.imageView.isDescendantOfView(self) {
            self.imageView.frame.origin.y = yOffset
            self.imageView.frame.size.height = -yOffset
        }
    }
}
