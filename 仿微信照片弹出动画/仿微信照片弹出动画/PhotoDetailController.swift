//
//  PhotoDetailController.swift
//  仿微信照片弹出动画
//
//  Created by zhangxu on 2016/12/21.
//  Copyright © 2016年 zhangxu. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.size.width;
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height;

class PhotoDetailController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout();
        layout.itemSize = CGSize(width: SCREEN_WIDTH, height: SCREEN_HEIGHT);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = .horizontal;
        let collectionView = UICollectionView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), collectionViewLayout: layout);
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.isPagingEnabled = true;
        return collectionView;
    }();
    
    var indexPath: IndexPath?;
    var photoModelArray: [PhotoModel]?;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加collectionView
        view.addSubview(collectionView);
        
        // 注册cell
        collectionView.register(PhotoDetailCell.self, forCellWithReuseIdentifier: "PhotoDetailCell");
        
        if let indexPath = indexPath {
            collectionView.scrollToItem(at: indexPath, at: .right, animated: false);
        }

    }
    
    // 返回行
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let photoModelArray = photoModelArray {
            return photoModelArray.count
        } else {
            return 0;
        }
    }
    
    // 返回cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoDetailCell", for: indexPath) as? PhotoDetailCell;
        cell?.photoModel = photoModelArray?[indexPath.row];
        return cell!;
    }
    
    // 选中 cell消失
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        dismiss(animated: true, completion: nil);
    }
    
    // 设置子控件的frame
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        collectionView.frame = view.bounds;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
}
