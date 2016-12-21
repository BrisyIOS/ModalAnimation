//
//  PhotoListController.swift
//  仿微信照片弹出动画
//
//  Created by zhangxu on 2016/12/20.
//  Copyright © 2016年 zhangxu. All rights reserved.
//

import UIKit

class PhotoListController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout();
        layout.itemSize = CGSize(width: 100, height: 100);
        layout.minimumLineSpacing = 5;
        layout.minimumInteritemSpacing = 5;
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout);
        collectionView.backgroundColor = UIColor.clear;
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.contentInset = UIEdgeInsets.init(top: 20, left: 20, bottom: 20, right: 20);
        return collectionView;
    }();
    
    // 数组
    private lazy var photoModelArray: [PhotoModel] = [PhotoModel]();

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 添加collectionView
        view.addSubview(collectionView);
        
        // 注册cell
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: "PhotoCell");
        
        // 加载数据
        setData();

        // Do any additional setup after loading the view.
    }
    
    // 加载数据
    private func setData() -> Void {
        
        let urls = ["https://img03.sogoucdn.com/net/a/04/link?url=http%3A%2F%2Fimg04.sogoucdn.com%2Fapp%2Fa%2F100520024%2F5ce7acb11ed7046bed36465479724fa0&appid=122",
                    "https://img02.sogoucdn.com/net/a/04/link?url=http%3A%2F%2Fimg02.sogoucdn.com%2Fapp%2Fa%2F100520024%2F8d42de3ed1e7a8df21885879519c51be&appid=122",
                    "https://img04.sogoucdn.com/net/a/04/link?url=http%3A%2F%2Fimg04.sogoucdn.com%2Fapp%2Fa%2F100520024%2Fff8a16661a322bf38d26a06b06dd5123&appid=122",
                    "https://img02.sogoucdn.com/net/a/04/link?url=http%3A%2F%2Fimg03.sogoucdn.com%2Fapp%2Fa%2F100520024%2Ff0eac2cf832d0e6fad595c8d48b7c262&appid=122",
                    "https://img04.sogoucdn.com/net/a/04/link?url=http%3A%2F%2Fimg02.sogoucdn.com%2Fapp%2Fa%2F100520093%2F0e0fd862f51611ae-a90dafa354d6f346-97195a0d2c4c2a969922f09a9e33410e.jpg&appid=122",
                    "https://img01.sogoucdn.com/net/a/04/link?url=http%3A%2F%2Fimg04.sogoucdn.com%2Fapp%2Fa%2F100520093%2F0e0fd862f51611ae-a90dafa354d6f346-8c0b8833ba6e2a1fdd31295a41dbde79.jpg&appid=122",
                    "https://img03.sogoucdn.com/net/a/04/link?url=http%3A%2F%2Fimg01.sogoucdn.com%2Fapp%2Fa%2F100520093%2F0e0fd862f51611ae-a90dafa354d6f346-60d95bde9bbb0436a23810ca27c42e03.jpg&appid=122",
                    "https://img01.sogoucdn.com/net/a/04/link?url=http%3A%2F%2Fimg04.sogoucdn.com%2Fapp%2Fa%2F100520093%2F0e0fd862f51611ae-a90dafa354d6f346-937a2be319e3de09625b3be7552af4c2.jpg&appid=122",
                    "https://img01.sogoucdn.com/net/a/04/link?url=http%3A%2F%2Fimg01.sogoucdn.com%2Fapp%2Fa%2F100520093%2F0e0fd862f51611ae-a90dafa354d6f346-c04404a51343ba167531baa684947794.jpg&appid=122"
            
        ];
        
        for url in urls {
            let model = PhotoModel();
            model.img_url = url;
            photoModelArray.append(model);
        }
    }
    
    // 返回行
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoModelArray.count;
    }
    
    // 返回cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotoCell;
        cell?.model = photoModelArray[indexPath.row];
        return cell!;
    }
    
    // 选中cell, 弹出动画
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let photoDetailVc = PhotoDetailController();
        photoDetailVc.indexPath = indexPath;
        photoDetailVc.photoModelArray = photoModelArray;
        photoDetailVc.transitioningDelegate = ModalAnimationDelegate.shared;
        photoDetailVc.modalPresentationStyle = .custom;
        present(photoDetailVc, animated: true, completion: nil);
    }
    
    // 设置collectionView的frame
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
        collectionView.frame = self.view.bounds;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
