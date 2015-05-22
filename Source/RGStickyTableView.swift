import UIKit

class RGStickyTableView: UITableView {

    func addStickyImage(image: UIImage, heigth: CGFloat) {
        let imageView = UIImageView(frame: CGRectMake(self.frame.origin.x, self.frame.origin.y - heigth, self.frame.width, heigth))
        imageView.image = image
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        self.contentInset = UIEdgeInsetsMake(heigth, 0, 0, 0)
        self.addSubview(imageView)
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        println("Sup")
    }
}
