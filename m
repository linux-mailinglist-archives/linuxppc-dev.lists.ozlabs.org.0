Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F30194C8B00
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 12:41:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7Fh70VyDz3bsH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 22:41:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=N5PldGyo;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=ikhNENNh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=citrix.com (client-ip=216.71.145.153;
 helo=esa2.hc3370-68.iphmx.com;
 envelope-from=prvs=0520bb690=andrew.cooper3@citrix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256
 header.s=securemail header.b=N5PldGyo; 
 dkim=pass (1024-bit key;
 unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com
 header.b=ikhNENNh; dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Tue, 01 Mar 2022 22:40:43 AEDT
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7FgH0R9bz30Bc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 22:40:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1646134843;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=YkxE1f2Bzj1X7jPJQvSSRXnaMkgU9fY9NDuKWHA4v4Q=;
 b=N5PldGyoslOKuiyC3LO82j8gDLmQQihra+OYfIcb2hP/qjShYkPrUjyB
 4BBF1rxyL1zx+D9cBmAn0O6TfWO2yHpa/uYM0fImfUMSRHAI55d1lx8gX
 yWeLXbFxVmn34MtuIRNTGWvZafTxorj0Yy/F5WhVszcHxhX5Ri0U8v1um E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=pass (signature verified)
 header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65208004
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:bn3jqa3mM61RMjrMjvbD5eJ3kn2cJEfYwER7XKvMYLTBsI5bp2QCz
 TNMDWrVbPjZMGP3fN93Pd6yoU4Du5XRmINlSApvpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1EE/NtTo5w7Rj2tUw2IDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1kuayBRF4XD5bMnc0ZSjBpOB1gY/F/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNaiDP
 ZJJMWIzBPjGS00RHGYlFY0PoOmhhCfHcxhT9nykl4NitgA/yyQuieOwYbI5YOeiQcRTg1bdp
 2uYo0znDRwAct+S0zyI9jSrnOCntSf6Xp8CUbi57uVCnlKe3CoQBQcQWF/9puO24mauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O/c94gCLjK/J+R6ZF0ANVDsHY9sj3OcyRDo3x
 hqAhdasBjF1trCRYXac7auP6zK0NzIcIWILaWkDVwRty93ippwjlgrEC9puDoaxj8bpAnf30
 TSDpjN4gK8c5eYX3aK84RXLjiyhorDNTxUp/UPMWX+/5Q53Y5Sqasqu5ESzxfJBKpuJC0GKv
 VAalMWEquMDF5eAkGqKWuplNLWo4euVdT3NmVN1AbE/+Dm3vX2uZ4Zd5Hd5PkgBGsIFfyL5J
 VXSoghPzJtSJ2exK65xbZi4B8kjwe7nD9uNfvTVaMdeJ4MqJVev4i5jfwiT0nrrnUxqlrswU
 b+ReMGoEDAeFIxjzTyrV6Ec16MmwmY1wma7bZn91BS61LOYIn2VQLEJLVKKRukj6eWPpwC92
 8pfMM6D0FNbXevyayLU4KYaKFxMJn8+bbjm+5J/deOZJAdiXmY7BJf5wbghU4h+g+JZm4/g/
 3a4X1JwzFvkmWaBLQSMd2AmZrTyW5p2sXM8O2orJ1nA83skZ5ym4OEAdp80Vb49/ednwLh/S
 PxtU8eHGPNnGj7W5zkGK57no+RKeAuumlimPiyrejEzcpdsAQvT9bfMfAT18zIVJjGqrsZ4q
 LqlvivAWoYKTQlmCMfQadqswkm3sHxbn/h9N2PCJcNSYwPr65RwLDLqje4fJNsFIhHOgDCd0
 m6r7Qww/LeX5dVvqZ+Q2P7C/9zB//ZC8lRyNmXr3LvvCxjh/m+KxZZpYc20Y26BbTahkEm9X
 tl9w/b5OfwBuV9FtYtgDrpmpZ4DC8vTS6xylVo9QiiSB7i/IvY5eyTdg5ET3kFY7uIB4WOLt
 lSzFs620FljEOfsCxYvKQUsdYxvPtlEy2CJvZzZzKgXjRKbHYZrs20PZ3FgawQHddOZ1b/JJ
 8974Kb6DCTl13IX3i6u1Hw8yoh1BiVov18bnp8bGpT3rQEg10tPZ5fRYgevvs3RM4oXbBVze
 2bF7EYnu1i67hCZG5bUPSKQtdexeLxU4EwapLP8Dw7hdiX5ag8fg0QKrGVfovV9xRRbyeNjU
 lWHxGUuTZhiCwxA3ZAZN0j1QlkpLETApiTZlgtY/EWEHhLAfjGccwUA1ROloRlxH5R0JWMAo
 tl1CQ/NDF7XQS0G9nBqCB499qe6FoQZG8+rsJnPIvlp1qISOFLNqqSveXAJu13gB8Ywj1fAv
 u5k4KB7bqiTCMLai/dT51WyvVjIdC25GQ==
IronPort-HdrOrdr: A9a23:fW7ZVautmpH1osJiNB1AaJrn7skC2IMji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H8BEGBKUmskKKceeEqTPiftXrdyReVxeZZnMXfKlzbamHDH4tmu5
 uIHJIOceEYYWIK7voSpTPIaerIo+P3sZxA592ut0uFJDsCA8oLjmdE40SgYzZLrWF9dMEE/f
 Gnl656Tk+bCBIqh7OAdx44tob41r/2vaOjRSRDKw8s6QGIgz/twqX9CQKk0hAXVC4K6as+8E
 De+jaJppmLgrWe8FvxxmXT55NZlJ/K0d1YHvGBjcATN3HFlhuoXoJ8QLeP1QpF491HqWxa0u
 UkkS1Qe/ib2EmhOV1dZiGdnTUI5QxerkMKD2Xo2EcL7/aJHA7SQPAx+r6xOiGplXbI+usMip
 6jlljpx6a+R3n77VXAzsmNWBdwmkWup30+1eYVknxESIMbLKRctIoF4SpuYdw99Q/Bmcka+d
 NVfYnhDTdtACenRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtR5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdY15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAp23G4gMyKeFPGC1zwdLl1qbrSnxw2OLyvZ8
 qO
X-IronPort-AV: E=Sophos;i="5.90,145,1643691600"; d="scan'208";a="65208004"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rrjyn4HlQnEHcuIqGpcs28ooDKC34t9cILAgwXLCdmdfJpSTuFHzlcCkkfGGFyV1CTbcB3+bXYogyKiXIkXGT/peo5Ruqu2bXChvG29LUdpJose1gilGWZqS0ZLDxECaUWkQ8RaErEkbaMWdVpfVWAV+Tcx8zwnaDEE7kyCLGptCHg61BRltbpg2VRzpKeGtx5nhC3Vbpxb/s8OLOWYsJvUgOQcHBc5fvlYbtftx4AGmCZY+Ld21GnZNUwhoqVnsAPYDD7pjDeT7qpbZuW2z7V2dHhZeklYK9EtuDuu1CX/PXkl90i8Qyj8ANPIGT458qqfjgnlgA1iheabbBHy7qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkxE1f2Bzj1X7jPJQvSSRXnaMkgU9fY9NDuKWHA4v4Q=;
 b=PN0XQDeHFqDPlEUM2KLVxdx6hxfe3b+6KiTEz/XrFrtWo5e1HmsInVdXUDTpQWeZ1LvUDhc31E7xFn6p2JPpi7b92tjBHryXabyvcdNFgd95377zUjORYqJyvo7gQhvava5IhRpHwbK1Pv0NACUMTzzPSWQno0TVtgVEo9yKMLdZRV6an+mRTHDgpYBALTAqB02KUSm8q4lH6wZ6q7ud/VbW9DSrDPn/leVuRiBadGkfj6mZvv5qfCy64yoeqoNGDVpgvhMFOQo00bx3gMWl5j6f6btmZ4ackCPGwt00Ovs85azCoKc1xL69cvdkJyHkH2lmx0xhAE3HTSoQK/cNbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkxE1f2Bzj1X7jPJQvSSRXnaMkgU9fY9NDuKWHA4v4Q=;
 b=ikhNENNh/YG4IYUOOWYwB9BS6DStnY3cvmx+NVkB+LWJP6FsKhTYrvhH6hyWVoERAHMEzUt53/2Jj4qARu4cRjbGraKRnFSup3kQepXg6bDEOLs2SjQvH9iZybYfmrxq/3x6qLKHxM78e5N5BMPjdfutOjfDSkJDm15c2eucLGw=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Christoph Hellwig <hch@lst.de>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>
Subject: Re: [PATCH 08/12] x86: centralize setting SWIOTLB_FORCE when guest
 memory encryption is enabled
Thread-Topic: [PATCH 08/12] x86: centralize setting SWIOTLB_FORCE when guest
 memory encryption is enabled
Thread-Index: AQHYLVsO0esfCi4ktkCl+GWHal7mDKyqZ0+A
Date: Tue, 1 Mar 2022 11:39:29 +0000
Message-ID: <8e623a11-d809-4fab-401c-2ce609a9fc14@citrix.com>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-9-hch@lst.de>
In-Reply-To: <20220301105311.885699-9-hch@lst.de>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c374ea50-179c-4ab3-e28f-08d9fb7825f5
x-ms-traffictypediagnostic: BYAPR03MB4135:EE_
x-microsoft-antispam-prvs: <BYAPR03MB413527F2015C0D815369F9A1BA029@BYAPR03MB4135.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eqr1nj/ADPfeq9PVCJBr+xjKZqtUjR5u30OY6zkNoUAZL+/B4yliVPv4iJCsQQtWhlsplDdoapbqyAZmz8RG+x4PgMjdulajurymsHBmp0mm2kWSATBllOis9nkoKfbjut8aMybKD5sA8GrZ72QfM3mShxhKQ66MAQ7VbwuhFLL4tVL0Awm0Q3R+7pu97dT/4sWhyXSlJiwsKvqXgt83GJKc27XlHmho9KAO6aBi9vMw7SE6WeLXJ2E3X32OAHVTYRKfujpdDZ9Bog0pde30SgcMFuyUljEk9poXhy2w7OL4ydDTfTbWSm8jc/b+/dIEiquExy06y7f9n5Eb0ruOHP0epECNITbR2sESxyFul/TL9V8K+wZT6BLg3UqKjYW7rCca0hevDx3qk3Ien2nCv/U07Y+gfhUJ0p/gQ/dReQFPSnQ3WZeOpFHgmmlWFzZRrVoBfbz/cbK5tQbMM7FU75RYxG1rJyDsAyHKbHSvC5VnaW50UPUnm76LtWH6+k2ooG5p9eo6rbD9rD2Rjxajg1mPSqxyQqlGvP4p+ZEj2yZMR951JFrcEhE8Ri5bOON9GMGgkhFhvGE0IMg7fMHFMBe7TqBlNBFdzHnhl8w3cfgFjWi99Yi2BSsfDeLENMvDgcqa6N/M9l0XZAc1bjfh+QMXFJ3BTL2TZJb0baPQGJbK1K1Y7G51bczEgGjXSb0ulD7WHNj7bty0g38lVkaaJ+p9+D1VDWi33gehc4DY35kG0VYIwqhj0vGPK1WP6piaywpGilNedp2rVu7CGk1Qqw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR03MB3623.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(8936002)(4744005)(71200400001)(2616005)(6486002)(54906003)(8676002)(4326008)(91956017)(31686004)(66556008)(66446008)(64756008)(76116006)(66946007)(66476007)(36756003)(2906002)(7416002)(5660300002)(316002)(26005)(110136005)(38100700002)(82960400001)(83380400001)(53546011)(122000001)(6506007)(6512007)(38070700005)(31696002)(86362001)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V29KQUxGQ3Z1eE9uZzlEN1JXSHNJRUZxZEV1bU5PbDRnS3ZpckxTTTdJekpl?=
 =?utf-8?B?bTZHdmNGMWFmajdVd3dIajgxSjIwVmJ1bC9oZUtNSU1hVGppY3BSd2NVWHUy?=
 =?utf-8?B?RU9VOWE5VnJXM2dHaUFDdTJUMnpMZDBzdnJHYjBhV2VoT2hqZ0ZDbjdTN2Jv?=
 =?utf-8?B?aTdvci92ZHY3SXhNK0dmNTQvL2MzaTViYWN6bkJodStHcGJHVTBhV0xFcGZR?=
 =?utf-8?B?Zzl4SVpVajVKVkZ4ek0vaVRtZHovUms1bnQxT0UwVzRJc21wTEpiVzRzL3NC?=
 =?utf-8?B?clR4ckRTVWlZNDNaa0RQU3R3TmNJTjBEZE85em5JOVZFcU5NN3A0eFFpbmgz?=
 =?utf-8?B?Q2QvdTdjdmlvOXVPWG5OWjBJbDBsMmFTdTRybjI0S0ROakF6MlIxWnJNelFU?=
 =?utf-8?B?T3F0ZWdXRFI2V2R0amxwckVBTjB1WkliMmVCTVlTQW1DRHRmUVRCYTgxMStS?=
 =?utf-8?B?a3VBeU56dnBxUTF4UGtodEZHU09PMVNkc2ZGK2dyZkJCT2lKZ2xGOUJnRWRi?=
 =?utf-8?B?NmdsVHkwdDBUZGl4UFRXbGRuL2Y2T3k3ZXQ2UGllczZWdThPY1dObTRaSEg5?=
 =?utf-8?B?ZHIwbVJ5dFhOL0hZRnczbERnMFJjK1BWZktLamhVVkZuN1VmYUdpZnVOdnY1?=
 =?utf-8?B?ejByN01ITmdyMUZYZkRCVk9Lc3o4V3diSVJWWnNqL0xmUkh0WUorU3YrWFJZ?=
 =?utf-8?B?di85UGZHbHBVSENWai9NTlJOSFlzbEQ1NjNXeC9aRGhLZ1IvaWovMER0S3RR?=
 =?utf-8?B?amdLQ3hsMHpIWjhQMkZhUS9xNFNWK2tkb3JVMmZkSTI0WUU5a3dBd0pnRlds?=
 =?utf-8?B?SXBPUHpVZHV2Ym5zNUJDdkJwdUxRcDJKaTZ4RktUL2VDUFpGTkk0UFR6UFVZ?=
 =?utf-8?B?SXhycDVyVlRXQ1c0WTVhSVpHMkNsRE5YYjk3cDNWdUY2UUlGSDNBMHRUamRk?=
 =?utf-8?B?bFdEYUFnZmk5dUk2UWhjcUUxcTFTSEJDcE9ZdGFNbDNJQUFsdmVVaEJ1NnYx?=
 =?utf-8?B?TWU1THhRY2tNS3NSUWJDNkZrN3J6cEtVNCtMdno0ekhLTXVPSEdKUGlKTldq?=
 =?utf-8?B?SVN2YTF3b0lMRUZaRFBzMWlRdW1iZGYvdDlGK3NRb25Cek9FWXFab1dJUm9H?=
 =?utf-8?B?eFdwY1ZwWFpaQVg5UmR5cXJYbnZHbEpJUHAvRDRiYXorWXQ0aGs0dG5hVVhN?=
 =?utf-8?B?ekllUS9HbUxPaUoyYnY1ajAyUEV4WlJvaE51bXpXYkFiWjQ4MnBKN1E1Vzg1?=
 =?utf-8?B?TnRGY09ybWt3cUorR0ltbk1UR1haQkJFYUx2T2ZITzJxOFNFZEl2Y2IxT2x5?=
 =?utf-8?B?bWE2cjJwMFNJVEY1NGtqR01xSWM2TFlraUR1SjRMM0V5YkRSKzZxUjBsakp0?=
 =?utf-8?B?ajdycmovMzRYc3pncERnczUxTzlIUWZ2ZDNQWHU1dVNqNmVudDhnRVo3VmJo?=
 =?utf-8?B?OG5HdlcrSy9vNEpiSy9WVjk2YmRFZGpMZGNZS09mWXJ6TjlkYVRIWGJTRFdH?=
 =?utf-8?B?UFgycnZzZDI3WnExY0k0eHVnSVRpQ2FsQ0RaakRMWHNWeHRrTXBoam1NVzdx?=
 =?utf-8?B?ZjBGZE1mekw2RFBvd1R4dDBpeG5vemhlUDdyOWhIZHV3NHNSclVjOTRtcVFJ?=
 =?utf-8?B?MXRMQmsyelZudU5SaThBQnBTZ1R3Z0lUOVFVeDcyZjk5S21DS0hSZkE1MjZV?=
 =?utf-8?B?YTJja3htenErTEpLdmtTUVRqcWlJcHpocDFuWDFoS2lLdGZ0dzhRSU1IQ2Zp?=
 =?utf-8?B?aEJ1R1lJaHd0ZzZaeWZPK3o0b1FyNEQ0TXZUSGtyU25Ja0FWc28wRFJiRm9M?=
 =?utf-8?B?ZlRXS2drbXlLL3NQOEZKTzFnRXhnQ0Nqa1c4QkVsUmZZRlJxTjhmdzFPZVN0?=
 =?utf-8?B?cGVzOE5DRGw4cjhVbG11aWwvdER6UlllOHAxUStjNENaVWxhRndudmhvS1Vm?=
 =?utf-8?B?RS9iQnNYZzhqT2VWbDJZMkNqYjZxMUtOSWJVVmp4cENrTWllVWpuWXdybndx?=
 =?utf-8?B?anM3a1hsWWNvbXVldWlBUzVhU3ArRHZKMlcwYkRCQTFHV2NieGR6ZHlWZTQ2?=
 =?utf-8?B?NTFPQ3dENFd2alBJSG5ZUXJTVzNDd3k2Q2xUSHljMVE0cW40c1lVcW8wZlk2?=
 =?utf-8?B?Z1NBVzZGQndUUjNlRHBRdnpaTWJKdnB5TFduL202dm45bHdSMDJrdVU0NjlU?=
 =?utf-8?B?d0RBWmI4ZFFpdzZHVlp2UGtrZzdWNTh4OHRSc0xpV1MyajM0R3p6WTR2T05i?=
 =?utf-8?B?SDR6OHlqZjlEUVZVcTRxVy9oQW1RPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B90F7ECC334C094D98FBB04318ADC72A@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c374ea50-179c-4ab3-e28f-08d9fb7825f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2022 11:39:29.9592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cn7CjesrcGKBpaPLehKxWy78J7QftlA2WxBhsLzq3mibgMd/ZVh1iPL1bNoyD8clO3N3VBw2CneavMhSmbRjE7aIiZ88WgnHvaEqDuwU2Sw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4135
X-OriginatorOrg: citrix.com
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, Robin
 Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tboot-devel@lists.sourceforge.net" <tboot-devel@lists.sourceforge.net>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, David
 Woodhouse <dwmw2@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gMDEvMDMvMjAyMiAxMDo1MywgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IGRpZmYgLS1n
aXQgYS9hcmNoL3g4Ni9rZXJuZWwvcGNpLWRtYS5jIGIvYXJjaC94ODYva2VybmVsL3BjaS1kbWEu
Yw0KPiBpbmRleCAyYWMwZWY5YzJmYjc2Li43YWI3MDAyNzU4Mzk2IDEwMDY0NA0KPiAtLS0gYS9h
cmNoL3g4Ni9rZXJuZWwvcGNpLWRtYS5jDQo+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9wY2ktZG1h
LmMNCj4gQEAgLTUzLDYgKzUzLDEzIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBwY2lfc3dpb3RsYl9k
ZXRlY3Qodm9pZCkNCj4gIAlpZiAoY2NfcGxhdGZvcm1faGFzKENDX0FUVFJfSE9TVF9NRU1fRU5D
UllQVCkpDQo+ICAJCXg4Nl9zd2lvdGxiX2VuYWJsZSA9IHRydWU7DQo+ICANCj4gKwkvKg0KPiAr
CSAqIEd1ZXN0IHdpdGggZ3Vlc3QgbWVtb3J5IGVuY3J5cHRpb24gbXVzdCBhbHdheXMgZG8gSS9P
IHRocm91Z2ggYQ0KPiArCSAqIGJvdW5jZSBidWZmZXIgYXMgdGhlIGh5cGVydmlzb3IgY2FuJ3Qg
YWNjZXNzIGFyYml0cmFyeSBWTSBtZW1vcnkuDQoNClRoaXMgaXNuJ3QgcmVhbGx5ICJtdXN0Ii7C
oCBUaGUgZ3Vlc3QgaXMgcGVyZmVjdGx5IGNhcGFibGUgb2Ygc2hhcmluZw0KbWVtb3J5IHdpdGgg
dGhlIGh5cGVydmlzb3IuDQoNCkl0J3MganVzdCB0aGF0IGZvciBub3csIGJvdW5jZSBidWZmZXJp
bmcgaXMgYWxsZWdlZGx5IGZhc3RlciwgYW5kIHRoZQ0Kc2ltcGxlIHdheSBvZiBnZXR0aW5nIGl0
IHdvcmtpbmcuDQoNCn5BbmRyZXcNCg==
