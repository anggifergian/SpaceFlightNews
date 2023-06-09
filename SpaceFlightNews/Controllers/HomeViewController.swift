//
//  HomeViewController.swift
//  SpaceFlightNews
//
//  Created by Anggi Fergian on 16/05/23.
//

import UIKit
import SDWebImage
import SafariServices

class HomeViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    var readingList: [Response] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newsTableView.dataSource = self
        
        loadNews()
    }
    
    private func loadNews() {
        SpaceServices.shared.fetchNews { result in
            switch result {
            case .failure(let err):
                print(err.localizedDescription)
            case .success(let data):
                self.readingList = data
                self.newsTableView.reloadData()
            }
        }
    }

}

// MARK: - UITableDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return readingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "news_view_cell", for: indexPath) as! NewsViewCell
        
        let item = readingList[indexPath.row]
        
        cell.headingLbl.text        = item.title
        cell.descriptionLbl.text    = item.summary
        cell.delegate               = self
        
        if let url = URL(string: item.imageUrl) {
            cell.thumbImage.sd_setImage(with: url)
        } else {
            cell.thumbImage.image = nil
        }
        
        
        return cell
    }
}

// MARK: - UITableDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        newsTableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - NewsViewCellDelegate
extension HomeViewController: NewsViewCellDelegate {
    func NewsViewCellVisitTapped(_ cell: NewsViewCell) {
        if let indexPath = newsTableView.indexPath(for: cell) {
            let news = readingList[indexPath.row]
            
            if let url = URL(string: news.url) {
                let controller = SFSafariViewController(url: url)
                present(controller, animated: true)
            }
        }
    }
}
