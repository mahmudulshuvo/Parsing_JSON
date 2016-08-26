//
//  ViewController.swift
//  JSON
//
//  Created by SHUVO on 8/26/16.
//  Copyright © 2016 SHUVO. All rights reserved.
//

import UIKit
import SwiftyJSON   


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        parseJson()
    }
    
    
    func  parseJson() {
        
        let path = NSBundle.mainBundle().pathForResource("JsonFile", ofType:"json")
        let jsonData = try! NSData(contentsOfFile:path!,
                                   options: NSDataReadingOptions.DataReadingUncached)
        var parseData = JSON(data: jsonData, options: NSJSONReadingOptions.MutableContainers, error: nil)
        
        
        // Modify Value
        print("parsedata \(parseData["seq"])")
        
        parseData["seq"] = "44"
        
        print("parseData \(parseData["seq"])")
        
        print("parseStream \(parseData["res","streams","S:vi2rjo8u","type"])")
        
        parseData["res","streams","S:vi2rjo8u","type"] = "mpg"
        
        print("parseStream \(parseData["res"]["streams"]["S:vi2rjo8u"]["type"])")
        
        
        // Item Count
        print("items \(parseData["res","streams","S:vi2rjo8u"].count)")
        
        // Looping
        for items in parseData["res","streams","S:vi2rjo9u"] {
            print("items  \(items)")
        }
        
        print("parse Data \(parseData)")
        
        let newValue: JSON = [

            "strm_id": "S:vi2rjo9u",
            "type": "avs",
            "owner": [
                "type": "room",
                "id": "IMEET_5000025"
            ],
            "dest": [
                "type": "room",
                "id": "IMEET_5000025"
            ],
            "offer": [
                "audio": "sendrecv",
                "video": "sendrecv",
                "rtc": [
                    "desc": [
                        "type": "offer",
                        "sdp": "v=0\r\no=- 362421431812 2 IN IP4 127.0.0.1\r\ns=-\r\nt=0 0\r\na=group:BUNDLE audio video\r\na=msid-semantic: WMS 3JjFBo2BIT7SQ9XuBu6ir3bPztlcG0oZH5ws\r\nm=audio 9 UDP/TLS/RTP/SAVPF 111 0 8\r\nc=IN IP4 0.0.0.0\r\na=ice-ufrag:1t0Yh1wIaN7Deyzx\r\na=ice-pwd:h5GbB4FETM96RF7b+HX4cgvZ\r\na=ice-lite\r\na=fingerprint:sha-256 5D:AF:0B:AD:23:CF:99:CB:DC:83:93:14:D0:E8:2E:8C:43:11:0F:E6:ED:12:CF:83:31:2E:B9:28:60:99:F5:A2\r\na=setup:actpass\r\na=mid:audio\r\na=sendrecv\r\na=rtcp-mux\r\na=rtpmap:111 opus/48000/2\r\na=rtpmap:0 pcmu/8000\r\na=rtpmap:8 pcma/8000\r\na=ssrc:934330117 cname:0qirR+KDCBsLKLFi\r\na=ssrc:934330117 msid:3JjFBo2BIT7SQ9XuBu6ir3bPztlcG0oZH5ws f7474aca0a90-ca60-08fe-3249-d31a2d4eb3e6\r\na=ssrc:934330117 label:f7474aca0a90-ca60-08fe-3249-d31a2d4eb3e6\r\na=ptime:20\r\nm=video 9 UDP/TLS/RTP/SAVPF 100\r\nc=IN IP4 0.0.0.0\r\nb=AS:384\r\na=ice-ufrag:1t0Yh1wIaN7Deyzx\r\na=ice-pwd:h5GbB4FETM96RF7b+HX4cgvZ\r\na=ice-lite\r\na=fingerprint:sha-256 5D:AF:0B:AD:23:CF:99:CB:DC:83:93:14:D0:E8:2E:8C:43:11:0F:E6:ED:12:CF:83:31:2E:B9:28:60:99:F5:A2\r\na=setup:actpass\r\na=mid:video\r\na=sendrecv\r\na=rtcp-mux\r\na=rtpmap:100 vp8/90000\r\na=fmtp:100 max-fs=12288;max-fr=60\r\na=rtcp-fb:100 nack\r\na=rtcp-fb:100 nack pli\r\na=ssrc:793742184 cname:hazKMpqrpTPx/deI\r\na=ssrc:793742184 msid:3JjFBo2BIT7SQ9XuBu6ir3bPztlcG0oZH5ws 8cd8247af9cd-06b7-64ba-e7a7-62a7d4061252\r\na=ssrc:793742184 label:8cd8247af9cd-06b7-64ba-e7a7-62a7d4061252\r\n"
                    ]
                ],
                "flv": true
            ]
        ]
        
        // Add value
        parseData["res","streams","S:vi2rjo9u"] = newValue
        print("parse Data \(parseData["res","streams"])")
        
        // Delete Value 
       parseData.dictionaryObject?.removeValueForKey("seq")
        print("parse Data \(parseData)")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

