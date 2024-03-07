//
//  ViewController.swift
//  TableView
//
//  Created by 신승재 on 3/4/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var moviesArray: [Movie] = []
    var movieDataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        
        title = "영화목록"
        
        movieDataManager.makeMovieData()
        moviesArray = movieDataManager.getMovieData()
    }
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        print(#function)
        
        movieDataManager.updateMovieData()
        moviesArray = movieDataManager.getMovieData()
        tableView.reloadData()
        
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // UITableViewCell이 기본이기때문에 MovieCell로 타입캐스팅이 필요함
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

        cell.mainImageView.image = moviesArray[indexPath.row].movieImage
        cell.movieNameLabel.text = moviesArray[indexPath.row].movieName
        cell.descriptionLabel.text = moviesArray[indexPath.row].movieDescription
        cell.selectionStyle = .none
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "toDetail", sender: indexPath)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let detailVC = segue.destination as! DetailViewController
            let array = movieDataManager.getMovieData()
            let indexPath = sender as! IndexPath
            
            detailVC.movieData = array[indexPath.row]
        }
    }
}
