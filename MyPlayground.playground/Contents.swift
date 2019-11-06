//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
      
        let view1 = UIView.init(frame: .init(x: 0, y: 0, width: 200, height: 80))
        view1.backgroundColor = .red
        view.addSubview(view1)
      
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        label.backgroundColor = .green
      
        let view2 = UIView.init(frame: .init(x: 0, y: 0, width: 200, height: 80))
        view2.backgroundColor = .clear
        view2.layer.borderWidth = 0.5
        view2.layer.borderColor = UIColor.red.cgColor
        view.addSubview(view2)
        
        view1.addSubview(label)
        self.view = view
      print("\(view1.frame)\(view1.bounds)\(label.frame)\(label.bounds)\n")
      view1.layer.anchorPoint = .init(x: 0, y: 0)
//      view1.layer.position = .init(x: 200, y: 40)
      view1.bounds = .init(x: 10, y: 10, width: 200, height: 80)
//      view1.transform = CGAffineTransform.init(rotationAngle: .pi/2)
      view1.transform = CGAffineTransform.init(translationX: 0, y: 40)
      print("\(view1.layer.anchorPoint)\(view1.layer.position)\n")
      print("\(view1.frame)\(view1.bounds)\(label.frame)\(label.bounds)\n")
      print("计算一下结果\(self.sumArrayItems(m: 2, n: 9, t: 4))")
    }
   
//   整数数组[m,n],m到n连续，每间隔t个数加一次，用递归方式求总和。
//   eg：[2,9] t = 3 求和为2+5+8 = 15
//   解法1
   func sumArrayItems(m:Int,n:Int,t:Int) -> Int {
      if m > n {
         return 0
      }
      if (n - m)%t == 0 {
         print("n \(n)")
         return n + sumArrayItems(m: m, n: n-1, t: t)
      }else{
         return sumArrayItems(m: m, n: n-1, t: t)
      }
   }
   //解法2 采用尾递归
   func sumArrayItemsWithTrial(m:Int,n:Int,t:Int) -> Int {
      return self.sumArrayItems(m: m, n: n, t: t, count: 0)
   }
   func sumArrayItems(m:Int,n:Int,t:Int,count:Int) -> Int {
      if m > n {
         return count;
      }
      if (n - m)%t == 0 {
         print("n \(n)")
         return sumArrayItems(m: m, n: n-1, t: t,count: count+n)
      }else{
         return sumArrayItems(m: m, n: n-1, t: t,count: n)
      }
   }
   
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
