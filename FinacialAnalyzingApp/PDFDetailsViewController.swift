//
//  PDFDetailsViewController.swift
//  FinacialAnalyzingApp
//
//  Created by wwww on 2017-08-27.
//
//

import UIKit

class PDFDetailsViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        let url = loadPDF(filename: "Mastery")
        var i = 3
        while i != 0 {
            let imageForPDF = drawPDFfromURL(url: url, pageNum: i)
            UIImageWriteToSavedPhotosAlbum(imageForPDF!,self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
            i = i - 1
        }
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            // we got back an error!
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPDF(filename: String) -> URL {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let filePath = "\(documentsPath)/\(filename).pdf"
        let url = NSURL(fileURLWithPath: filePath)
        let urlRequest = NSURLRequest(url: url as URL)
        webView.loadRequest(urlRequest as URLRequest)
        return url as URL
    }
    
    func drawPDFfromURL(url: URL, pageNum: Int) -> UIImage? {
        let document = CGPDFDocument(url as CFURL)
        guard let page = document?.page(at: pageNum) else { return nil }
        
        let pageRect = page.getBoxRect(.mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageRect.size)
        let img = renderer.image { ctx in
            UIColor.white.set()
            ctx.fill(pageRect)
            
            ctx.cgContext.translateBy(x: 0.0, y: pageRect.size.height);
            ctx.cgContext.scaleBy(x: 1.0, y: -1.0);
            
            ctx.cgContext.drawPDFPage(page);
        }
        
        return img
    }

    @IBAction func logoAct(_ sender: Any) {
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(URL(string: "https://www.chicagocashflow.com")!, options: [:], completionHandler: nil)
        } else {
            // Fallback on earlier versions
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
