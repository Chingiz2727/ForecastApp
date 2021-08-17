import UIKit

final class MainTableViewDataSource: NSObject, UITableViewDataSource {
    var days: [Daily] = []
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ForecastTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let day = days[indexPath.row]
        cell.setupDay(day: day)
        return cell
    }
}
