import UIKit

class RGStickyTableView: UITableView {

    var height: CGFloat?
    var imageView: UIImageView {
        set {
            self.imageView.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y - self.height!, self.frame.width, self.height!)
            self.imageView.contentMode = UIViewContentMode.ScaleAspectFill
            self.imageView.clipsToBounds = true
            setNeedsDisplay()
        } get {
            return self.imageView
        }
    }

    func addStickyImage(image: UIImage, heigth: CGFloat) {
        self.height = heigth
        self.imageView.image = image
        
        self.contentInset = UIEdgeInsetsMake(heigth, 0, 0, 0)
        self.addSubview(imageView)
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        println("Sup")
    }
}
