import Foundation
import CoreGraphics

//All basic Math operations with CGPoint (+,+=,-,-=,*,*=,/(pnt,scalar),/=(pnt,scalar)
func + (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x + right.x, y: left.y + right.y)
}
func += (inout left: CGPoint, right: CGPoint) {
  left = left + right
}
func - (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}
func -= (inout left: CGPoint, right: CGPoint) {
    left = left - right
}
func * (left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x * right.x, y: left.y * right.y)
}
func *= (inout left: CGPoint, right: CGPoint) {
    left = left * right
}
func * (point: CGPoint, scalar: CGFloat) -> CGPoint {
  return CGPoint(x: point.x * scalar, y: point.y * scalar)
}
func *= (inout point: CGPoint, scalar: CGFloat) {
  point = point * scalar
}
func / (left: CGPoint, right: CGPoint) -> CGPoint {
  return CGPoint(x: left.x / right.x, y: left.y / right.y)
}
func /= (inout left: CGPoint, right: CGPoint) {
  left = left / right
}
func / (point: CGPoint, scalar: CGFloat) -> CGPoint {
  return CGPoint(x: point.x / scalar, y: point.y / scalar)
}
func /= (inout point: CGPoint, scalar: CGFloat) {
  point = point / scalar
}
//Atan CF
#if !(arch(x86_64) || arch(arm64))
  func atan2(y: CGFloat, x: CGFloat) -> CGFloat {
  return CGFloat(atan2f(Float(y), Float(x)))
  }
  func sqrt(a: CGFloat) -> CGFloat {
  return CGFloat(sqrtf(Float(a)))
  }
#endif

//Extension CGPoint
extension CGPoint {
    func length() -> CGFloat {
      return sqrt(x*x + y*y)
    }
    func normalized() -> CGPoint {
      return self / length()
    }
    var angle: CGFloat {
      return atan2(y, x)
    }
}
//Smooth rotation
let π = CGFloat(M_PI)
func shortestAngleBetween(angle1: CGFloat, angle2: CGFloat) -> CGFloat {
  let twoπ = π * 2.0
  var angle = (angle2 - angle1) % twoπ
  
  if (angle >= π) {
    angle = angle - twoπ
  }
  if (angle <= -π) {
    angle = angle + twoπ
  }
  return angle
}

extension CGFloat {
  func sign() -> CGFloat {
  return (self >= 0.0) ? 1.0 : -1.0
  }
}
