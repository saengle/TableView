//
//  SettingTableViewController.swift
//  TableView
//
//  Created by 쌩 on 5/23/24.
//

import UIKit

import SnapKit

final class SettingTableViewController: UITableViewController {

    private let sectionNameList = ["전체설정", "개인설정", "기타"]
    
    private let wholeSettingList = [["공지사항", "실험실", "버전 정보"], ["개인/보안", "알림", "채팅", "멀티프로필"], ["고객센터/도움말"]]
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
    
    private var dataSource: UICollectionViewDiffableDataSource<String, String>!
    
    private func createLayout() -> UICollectionViewLayout {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        configuration.backgroundColor = .black
        configuration.showsSeparators = true
        
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { cv in
            cv.edges.equalTo(view.safeAreaLayoutGuide)
        }
        configureDataSource()
        updateSnapshot()
    }
    private func configureDataSource() {
        var registration: UICollectionView.CellRegistration<UICollectionViewListCell, String>!
        registration = UICollectionView.CellRegistration { cell, indexPath, itemIdentifier in
            
            var headerContent = UIListContentConfiguration.plainHeader()
            headerContent.text = self.sectionNameList[indexPath.section]
            
            var content = UIListContentConfiguration.valueCell()
            content.text = self.wholeSettingList[indexPath.section][indexPath.row]
            
            var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
            cell.contentConfiguration = content
            
        }
        dataSource =  UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            let cell = collectionView.dequeueConfiguredReusableCell(using: registration, for: indexPath, item: itemIdentifier)
            return cell
        })
    }
    
    private func updateSnapshot() {
        var snapShot = NSDiffableDataSourceSnapshot<String, String> ()
        snapShot.appendSections(sectionNameList)
        snapShot.appendItems(wholeSettingList[0], toSection: sectionNameList[0])
        snapShot.appendItems(wholeSettingList[1], toSection: sectionNameList[1])
        snapShot.appendItems(wholeSettingList[2], toSection: sectionNameList[2])
        dataSource.apply(snapShot)
    }
}
