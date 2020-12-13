import UIKit

public class VNGetImageView: UIView, UIGestureRecognizerDelegate {

    private var v: VNImageRequest?
    private var tap = UITapGestureRecognizer()
    private var addView: UIImageView?
    private var named: String?
    private var up: String?
    private var right: String?
    private var down: String?
    private var left: String?

    private var count = 0

    open func tapped(view: UIView, addView: UIImageView, up: String, left: String, down: String, right: String, v: VNImageRequest?) {

        self.named = up
        self.up = up
        self.right = right
        self.down = down
        self.left = left

        tap = UITapGestureRecognizer(target: self, action:#selector(getImage))
        tap.delegate = self
        self.frame = view.frame
        self.addGestureRecognizer(tap)
        self.addView = addView
        self.v = v
    }

    @objc open func getImage()  {
        switch count {
        case 0:
            count = 1
            self.named = left
        case 1:
            count = 2
            self.named = down
        case 2:
            count = 3
            self.named = right
        case 3:
            count = 0
            self.named = up
        default:
            break
        }
        addView?.image = UIImage(named: named ?? "")
        let rect = addView?.bounds
        UIGraphicsBeginImageContextWithOptions(rect?.size ?? CGSize(), false, 0.0)
        guard let context : CGContext = UIGraphicsGetCurrentContext() else { return }
        addView?.layer.render(in: context)
        guard let image : UIImage = UIGraphicsGetImageFromCurrentImageContext() else { return }
        UIGraphicsEndImageContext()

        v?.checkFace(image.cgImage!, count: count)
    }
}
