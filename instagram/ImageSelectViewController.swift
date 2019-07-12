//
//  ImageSelectViewController.swift
//  instagram
//
//  Created by 三坂真治 on 2019/07/11.
//  Copyright © 2019 shinji.misaka. All rights reserved.
//

import UIKit

class ImageSelectViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBAction func handleLibraryButton(_ sender: Any) {
        
        // ライブラリ（カメラロール）を指定してピッカーを開く
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .photoLibrary
            self.present(pickerController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func handleCameraButton(_ sender: Any) {
        
        // カメラを指定してピッカーを開く
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let pickerController = UIImagePickerController()
            pickerController.delegate = self
            pickerController.sourceType = .camera
            self.present(pickerController, animated: true, completion: nil)
        
    }
    
        func handleCancelButton(_ sender: Any) {
        
        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
        
    }
        
        // 写真を撮影/選択したときに呼ばれるメソッド
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if info[.originalImage] != nil {
                // 撮影/選択された画像を取得する
                let image = info[.originalImage] as! UIImage
                
                // あとでCLImageEditorライブラリで加工する
                print("DEBUG_PRINT: image = \(image)")
                
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            // 閉じる
            picker.dismiss(animated: true, completion: nil)
        }
    
        func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
