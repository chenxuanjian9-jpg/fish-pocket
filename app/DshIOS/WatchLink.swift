import Foundation
import Combine

class WatchLink {
    static let shared = WatchLink()
    
    func activate() {
        // 手表功能已移除
    }
    
    func attach(_ model: Any) {
        // 空实现，防止报错
    }
    
    func scenePhaseChanged(to phase: Any) {
        // 空实现，防止报错
    }
}
