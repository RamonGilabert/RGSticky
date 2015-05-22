import UIKit

class RGStickyTableView: UITableView {

    var height: CGFloat = 0.0 {
        didSet {
            self.imageView.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y - self.height, self.frame.width, self.height)
            self.contentInset = UIEdgeInsetsMake(self.height, 0, 0, 0)
        }
    }

    private var imageView = UIImageView() {
        didSet {
            self.imageView.contentMode = UIViewContentMode.ScaleAspectFill
            self.imageView.clipsToBounds = true
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

    func scrollViewDidScroll(scrollView: UIScrollView) {
        println("Sup")
    }
}
