Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A71F8F333
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 20:23:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468ZZN70GnzDqGW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 04:23:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=nam04-bn3-obe.outbound.protection.outlook.com
 (client-ip=40.107.68.41; helo=nam04-bn3-obe.outbound.protection.outlook.com;
 envelope-from=christian.koenig@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="ytqJ04Y5"; 
 dkim-atps=neutral
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680041.outbound.protection.outlook.com [40.107.68.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468ZX45rQnzDqlL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 04:21:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kfviY8FA9c5M498MIBNdoq4y8L+6YvobCvunw8y7KowpaQUr4OFfB3MMMCdUgU3q0BMgp2GuQKZc+htQcWJ0F0us4CpkyFsIQ1wmYQy1+IFo/Ht4tPUDjRvLseoLuhWUp8lX18tQdbo/g5OF8Ljprr8zADvob3P4iidHkeqzqL/A1wa7VLR0lkaYJBTbsvSPRXgJALY5ONzswRFmhUAg+0a2tC2EB416nGAt8jzTxXklXuXt+DJzpRwGezeMv2BIp/GDIG5nzhjxlYlTroLUkl40xKddYCmQk2bU1R05ghaks6TvVBI/9CssL41NJYp/rsj55pKK4rpIK2zHjryo+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rq/Qt+N6mJauGSQER/F0ygVUwMjubyDLbDlHJkhacaQ=;
 b=L2v2MNQlCOyhDR3KPna9me3VH0QGCRc7T133IE6bAm145OHOofCnrG87RZdljBNTRbIOnytCbZs2f77grUxHl4CuSPEN2gZ0gp/uPaKwttEgBQBdbwCE2oWH/bu0L9d8AYllAE1fuhKGKAi2DsRRANc7cCmEcaw1vTcEhM7vqJckA5Iv23sFjPOuYDG0mLVtMc0oyXaAeX8e+rqSJ9eGkVEhZB1QRCEl7uR3dT3cijpU4mXWapRWfzEfVPuCBj5cHLLzaK7V1pFDrS+74Fd5NaNtvOCUKukmebAyI2+rGO6o8Zx/Ee11eH/q+Xw5kZWWOiNT+9glmRf9tSKHVqCl1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rq/Qt+N6mJauGSQER/F0ygVUwMjubyDLbDlHJkhacaQ=;
 b=ytqJ04Y5NilDqnM7wSR0QMfgf+rv+A38rysKtFErp1NVqFEC0A0tjB/G/zgCsz54EP06pT+gvCuIxcDy+VPYIUM2z9clBXfqwU2AcgXxIN6jNdmIF/Fl8mD9Sq82GqaUGyqbzHKKZkEhL2Ucpu8MgRDZ6tPPkxTwdM51xFSsNAY=
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1498.namprd12.prod.outlook.com (10.172.39.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Thu, 15 Aug 2019 18:21:01 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::a129:1f1a:52a9:4ac3%5]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 18:21:01 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Christoph Hellwig <hch@lst.de>, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 0/6] drm+dma: cache support for arm, etc
Thread-Topic: [PATCH 0/6] drm+dma: cache support for arm, etc
Thread-Index: AQHVU5JmDrmSZWuFL068/CJR6aJZq6b8hSsA
Date: Thu, 15 Aug 2019 18:21:00 +0000
Message-ID: <e3f73b3c-49d5-3c19-dfff-0a24b4617e50@amd.com>
References: <20190814220011.26934-1-robdclark@gmail.com>
 <20190815065117.GA23761@lst.de>
 <CAJs_Fx4bS64s7+xQqsead3N80ZQpofqegFQu+tT=b3wcGd_2pA@mail.gmail.com>
 <20190815175346.GA19839@lst.de>
In-Reply-To: <20190815175346.GA19839@lst.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0033.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::21) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de4ad33d-86fa-4654-afa7-08d721ad532f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1498; 
x-ms-traffictypediagnostic: DM5PR12MB1498:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB14980593AB1F77840C217C7683AC0@DM5PR12MB1498.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(189003)(199004)(478600001)(8676002)(14444005)(6116002)(81156014)(81166006)(36756003)(110136005)(256004)(54906003)(4326008)(14454004)(25786009)(6246003)(31686004)(64126003)(5660300002)(58126008)(7736002)(71200400001)(99286004)(53936002)(305945005)(71190400001)(316002)(186003)(7406005)(7416002)(102836004)(66946007)(6436002)(53546011)(52116002)(8936002)(446003)(6512007)(476003)(31696002)(66446008)(6506007)(66556008)(46003)(86362001)(66476007)(64756008)(6486002)(386003)(2906002)(76176011)(229853002)(11346002)(65826007)(2616005)(65956001)(65806001)(486006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1498;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mjkHOObKBkCvOmvAt7FgynzwLeqBX4jPF5vYY2ctttZv3EYvOLzZEgygKRGvhgE6xv1cYv+/TedaHtmIjCFKrGMDNq4d2dSGkjcO9hYe7G6wDqRlEW35yYI2D0DbNw3Aw1aCwKfgE5PRRq3IAT94o8E34qq4DWB5vQkTFi7+KuajgiTwmQ7S43DpxjYzVDSwBq0itQx6qzFoK7UiYefuq+5SUbF6VRKa2t498ILq37ENAJzTY5J+PCYBTPsOiEk6//DhyX6FZS4CI4ndUfFOjKeO+q5Px17aept1OK3WpJvcJ1dtmKV33y508nxj6N1ZudJeovWEzKGUSTbwjcTqfqXB/zs9E8CsrMMaM3HTl6bKCGkRGk3elCLucOcT7DhgWvTgw8WWqxxKghMqtPs61daNzyHwpDKfL35lF2g7qkc=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2458A0C96E02564CBEC3503674921588@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de4ad33d-86fa-4654-afa7-08d721ad532f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 18:21:01.0325 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0q8ZR4mj3HGLi77GQZGvseiD7M5u/NmaVslkiWmFbWAHKNRTTSdyjlWsPDGP9raE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1498
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 "Maciej W. Rozycki" <macro@linux-mips.org>, Eric Biggers <ebiggers@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Imre Deak <imre.deak@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Will Deacon <will@kernel.org>, Emil Velikov <emil.velikov@collabora.com>,
 "Sharma, Deepak" <Deepak.Sharma@amd.com>, Paul Burton <paul.burton@mips.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "moderated list:ARM64 PORT \(AARCH64
 ARCHITECTURE\)" <linux-arm-kernel@lists.infradead.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Robin Murphy <robin.murphy@arm.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Jesper Dangaard Brouer <brouer@redhat.com>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND
 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Doug Anderson <armlinux@m.disordat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Enrico Weigelt <info@metux.net>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, "open list:DRM
 DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

QW0gMTUuMDguMTkgdW0gMTk6NTMgc2NocmllYiBDaHJpc3RvcGggSGVsbHdpZzoNCj4gT24gVGh1
LCBBdWcgMTUsIDIwMTkgYXQgMDY6NTQ6MzlBTSAtMDcwMCwgUm9iIENsYXJrIHdyb3RlOg0KPj4g
T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMTE6NTEgUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOg0KPj4+IEFzIHNhaWQgYmVmb3JlIEkgZG9uJ3QgdGhpbmsgdGhlc2UgbG93
LWxldmVsIGhlbHBlcnMgYXJlIHRoZQ0KPj4+IHJpZ2h0IEFQSSB0byBleHBvcnQsIGJ1dCBldmVu
IGlmIHRoZXkgZGlkIHlvdSdkIGp1c3QgY292ZXIgYSB0aW55DQo+Pj4gc3Vic2V0IG9mIHRoZSBh
cmNoaXRlY3R1cmVzLg0KPj4gQXJlIHlvdSB0aGlua2luZyBpbnN0ZWFkIHNvbWV0aGluZyBsaWtl
Og0KPj4NCj4+IHZvaWQgZG1hX3N5bmNfc2dfZm9yX3tjcHUsZGV2aWNlfShzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBzY2F0dGVybGlzdCAqc2dsLA0KPj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpbnQgbmVudHMsIGVudW0gZG1hX2RhdGFfZGlyZWN0aW9uIGRpcikNCj4+
IHsNCj4+ICAgICAgZm9yX2VhY2hfc2coc2dsLCBzZywgbmVudHMsIGkpIHsNCj4+ICAgICAgICAg
IGFyY2hfc3luY19kbWFfZm9yXy4uKGRldiwgc2dfcGh5cyhzZyksIHNnLT5sZW5ndGgsIGRpcik7
DQo+PiAgICAgIH0NCj4+IH0NCj4+IEVYUE9SVF9TWU1CT0xfR1BMKGRtYV9zeW5jX3NnX2Zvcl8u
LikNCj4+DQo+PiBvciBkaWQgeW91IGhhdmUgc29tZXRoaW5nIGVsc2UgaW4gbWluZD8NCj4gTm8u
ICBXZSByZWFsbHkgbmVlZCBhbiBpbnRlcmZhY2UgdGhheSBzYXlzIHBsZWFzZSBnaXZlIG1lIHVu
Y2FjaGVkDQo+IG1lbW9yeSAoZm9yIHNvbWUgZGVmaW5pdGlvbiBvZiB1bmNhY2hlZCB0aGF0IGlu
Y2x1ZGVzIHRoYXQgZ3JhcGljcw0KPiBkcml2ZXJzIGNhbGwgd3JpdGUgY29tYmluZSksIGFuZCB0
aGVuIGxldCB0aGUgYXJjaGl0ZWN0dXJlIGRvIHRoZSByaWdodA0KPiB0aGluZy4gIEJhc2ljYWxs
eSBkbWFfYWxsb2NfY29oZXJlbnQgd2l0aCBETUFfQVRUUl9OT19LRVJORUxfTUFQUElORw0KPiBp
cyBzdXBlcmZpY2lhbGx5IGNsb3NlIHRvIHdoYXQgeW91IHdhbnQsIGV4Y2VwdCB0aGF0IHRoZSB3
YXkgdGhlIGRybQ0KPiBkcml2ZXJzIHdvcmsgeW91IGNhbid0IGFjdHVhbGx5IHVzZSBpdC4NCg0K
VGhlIHRlcm1pbm9sb2d5IGdyYXBoaWNzIGRyaXZlciB1c2UgaXMgVVNXQyAoVW5jYWNoZWQgU3Bl
Y3VsYXRpdmUgV3JpdGUgDQpDb21iaW5lKS4NCg0KRXNzZW50aWFsbHkgaXQgaXMgYSBsZWZ0b3Zl
ciBmcm9tIHRoZSBBR1AgZGF5cyB3aGVyZSB0aGUgZ3JhcGhpY3MgDQpkZXZpY2VzIGNvdWxkbid0
IHNub29wIHRoZSBDUFUgY2FjaGVzLg0KDQpOb3dhZGF5cyB0aGV5IGVpdGhlciBkb24ndCB3YW50
IHRvIHNub29wIHRoZSBDUFUgY2FjaGVzIGZvciBwZXJmb3JtYW5jZSANCnJlYXNvbnMuDQoNCk9y
IGJlY2F1c2Ugb2Ygc3BlY2lhbCByZXF1aXJlbWVudHMgdGhhdCBjZXJ0YWluIGFyZWFzIG9mIHN5
c3RlbSBtZW1vcnkgDQphcmUgbm90IGNhY2hlZCBmb3IgY2VydGFpbiBmdW5jdGlvbmFsaXR5Lg0K
DQpGb3IgZXhhbXBsZSB0aGUgIlZSQU0iIG9uIEFNRCBHUFVzIHdoaWNoIGFyZSBpbnRlZ3JhdGVk
IGludG8gdGhlIENQVSBpcyANCmp1c3Qgc3RvbGVuIHN5c3RlbSBtZW1vcnkuIFRoZW4geW91IGNh
biBzY2Fub3V0IHlvdXIgcGljdHVyZSB0byB0aGUgDQpkaXNwbGF5IGZyb20gdGhpcyBtZW1vcnkg
b3IgIm5vcm1hbCIgc3lzdGVtIG1lbW9yeSwgYnV0IG9ubHkgaWYgdGhlIA0Kc3lzdGVtIG1lbW9y
eSBpcyBtYXBwZWQgYXMgVVNXQy4NCg0KPiBUaGUgcmVhc29uIGZvciB0aGF0IGlzIGlmIHdlIGNh
biB3ZSByZWFsbHkgbmVlZCB0byBub3QgY3JlYXRlIGFub3RoZXINCj4gdW5jYWNoYWJsZSBhbGlh
cywgYnV0IGluc3RlYWQgY2hhbmdlIHRoZSBwYWdlIGF0dHJpYnV0ZXMgaW4gcGxhY2UuDQo+IE9u
IHg4NiB3ZSBjYW4gYW5kIG11c3QgZG8gdGhhdCBmb3IgZXhhbXBsZSwgYW5kIGJhc2VkIG9uIHRo
ZQ0KPiBjb252ZXJzYXRpb24gd2l0aCBXaWxsIGFybTY0IGNvdWxkIGRvIHRoYXQgZmFpcmx5IGVh
c2lseS4gIGFybTMyIGNhbg0KPiByaWdodCBub3cgb25seSBkbyB0aGF0IGZvciBDTUEsIHRob3Vn
aC4NCj4NCj4gVGhlIGJpZyBxdWVzdGlvbiBpcyB3aGF0IEFQSSBkbyB3ZSB3YW50LiAgSSBoYWQg
YSBwcmV0dHkgc2ltaWxhcg0KPiBkaXNjdXNzaW9uIHdpdGggQ2hyaXN0aWFuIG9uIGRvaW5nIHN1
Y2ggYW4gYWxsb2NhdGlvbiBmb3IgYW1kZ3B1LA0KPiB3aGVyZSB0aGUgZGV2aWNlIG5vcm1hbGx5
IGlzIGNhY2hlIGNvaGVyZW50LCBidXQgdGhleSBhY3R1YWxseSB3YW50DQo+IHRvIHR1cm4gaXQg
aW50byBub24tY29oZXJlbnQgYnkgdXNpbmcgUENJZSB1bnNub29wZWQgdHJhbnNhY3Rpb25zLg0K
Pg0KPiBIZXJlIGlzIG15IGhpZ2ggbGV2ZWwgcGxhbiwgd2hpY2ggc3RpbGwgaGFzIGEgZmV3IGxv
c2UgZW5kOg0KPg0KPiAgICgxKSBwcm92aWRlIGEgbmV3IEFQSToNCj4NCj4gCXN0cnVjdCBwYWdl
ICpkbWFfYWxsb2NfcGFnZXMoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBucl9wYWdlcywN
Cj4gCQkJZ2ZwX3QgZ2ZwLCB1bnNpZ25lZCBsb25nIGZsYWdzKTsNCj4gCXZvaWQgZG1hX2ZyZWVf
cGFnZXMoc3RydWN0IGRldmljZSAqZGV2LCB1bnNpZ25lZCBucl9wYWdlcywNCj4gCQkJdW5zaWdu
ZWQgbG9uZyBmbGFncyk7DQo+DQo+ICAgICAgIFRoZXNlIGdpdmUgeW91IGJhY2sgcGFnZSBiYWNr
ZWQgbWVtb3J5IHRoYXQgaXMgZ3VhcmFudGVlZCB0byBiZQ0KPiAgICAgICBhZGRyZXNzYWJsZSBi
eSB0aGUgZGV2aWNlIChubyBzd2lvdGxiIG9yIHNpbWlsYXIpLiAgVGhlIG1lbW9yeSBjYW4NCj4g
ICAgICAgdGhlbiBiZSBtYXBwZWQgdXNpbmcgZG1hX21hcCosIGluY2x1ZGluZyB1bm1hcCBhbmQg
ZG1hX3N5bmMgdG8NCj4gICAgICAgYm91bmNlIG93bmVyc2hpcCBhcm91bmQuICBUaGlzIGlzIHRo
ZSByZXBsYWNlbWVudCBmb3IgdGhlIGN1cnJlbnQNCj4gICAgICAgZG1hX2FsbG9jX2F0dHJzIHdp
dGggRE1BX0FUVFJfTk9OX0NPTlNJU1RFTlQgQVBJLCB0aGF0IGlzIHJhdGhlcg0KPiAgICAgICBi
YWRseSBkZWZpbmVkLg0KPg0KPiAgICgyKSBBZGQgc3VwcG9ydCBmb3IgRE1BX0FUVFJfTk9fS0VS
TkVMX01BUFBJTkcgdG8gdGhpcyBuZXcgQVBJIGluc3RlYWQNCj4gICAgICAgb2YgZG1hX2FsbG9j
X2F0dHJzLiAgVGhlIGluaXRpYWwgZGlmZmVyZW5jZSB3aXRoIHRoYXQgZmxhZyBpcyBqdXN0DQo+
ICAgICAgIHRoYXQgd2UgYWxsb3cgaGlnaG1lbSwgYnV0IGluIHRoZSBmdXR1cmUgd2UgY291bGQg
YWxzbyB1bm1hcCB0aGlzDQo+ICAgICAgIG1lbW9yeSBmcm9tIHRoZSBrZXJuZWwgbGluZWFyIG1h
cHBpbmcgZW50aXJlbHkgb24gYXJjaGl0ZWN0dXJlcw0KPiAgICAgICB3aGVyZSB3ZSBjYW4gZWFz
aWx5IGRvIHRoYXQuDQoNCk1obSwgd2h5IHdvdWxkIHdlIHdhbnQgdG8gZG8gdGhpcz8NCg0KPg0K
PiAgICgzKSBBZGQgYSBkbWFfcGFnZXNfbWFwL2RtYV9wYWdlc191bm1hcCBvciBzaW1pbGFyIEFQ
SSB0aGF0IGFsbG93cyB5b3UNCj4gICAgICAgdG8gZ2V0IGEga2VybmVsIG1hcHBpbmcgZm9yIHBh
cnRzIG9yIGFsbCBvZiBhDQo+ICAgICAgIERNQV9BVFRSX05PX0tFUk5FTF9NQVBQSU5HIGFsbG9j
YXRpb24uICBUaGlzIGlzIHRvIHJlcGxhY2UgdGhpbmdzDQo+ICAgICAgIGxpa2UgeW91ciBvcGVu
LWNvZGVkIHZtYXAgaW4gbXNtIChvciBzaW1pbGFybHkgZWxzZXdoZXJlIGluIGRtYS1idWYNCj4g
ICAgICAgcHJvdmlkZXJzKS4NCj4NCj4gICAoNCkgQWRkIHN1cHBvcnQgZm9yIGEgRE1BX0FUVFJf
VU5DQUNIQUJMRSBmbGFncyAob3Igc2ltaWxhcikgdG8gdGhlIG5ldw0KPiAgICAgICBBUEksIHRo
YXQgbWFwcyB0aGUgcGFnZXMgYXMgdW5jYWNoYWJsZSBpZmYgdGhleSBoYXZlIGEga2VybmVsDQo+
ICAgICAgIG1hcHBpbmcsIGluY2x1ZGluZyBpbnZhbGlkYXRpbmcgdGhlIGNhY2hlcyBhdCB0aW1l
IG9mIHRoaXMgcGFnZQ0KPiAgICAgICBhdHRyaWJ1dGUgY2hhbmdlIChvciBjcmVhdGlvbiBvZiBh
IG5ldyBtYXBwaW5nKS4gIFRoaXMgQVBJIHdpbGwgZmFpbA0KPiAgICAgICBpZiB0aGUgYXJjaGl0
ZWN0dXJlIGRvZXMgbm90IGFsbG93IGluLXBsYWNlIHJlbWFwcGluZy4gIE5vdGUgdGhhdCBmb3IN
Cj4gICAgICAgYXJtMzIgd2UgY291bGQgYWx3YXlzIGRpcCBpbnRvIHRoZSBDTUEgcG9vbCBpZiBv
bmUgaXMgcHJlc2VudCB0byBub3QNCj4gICAgICAgZmFpbC4gIFdlJ2xsIGFsc28gbmVlZCBzb21l
IGhlbHBlciB0byBtYXAgZnJvbSB0aGUgRE1BX0FUVFJfKiBmbGFncw0KPiAgICAgICB0byBhIHBn
cHJvdCBmb3IgbWFwcGluZyB0aGUgcGFnZSB0byB1c2Vyc3BhY2UuICBUaGVyZSBpcyBhbHNvIGEg
ZmV3DQo+ICAgICAgIG90aGVyIHdlaXJkIGJpdHMgaGVyZSwgZS5nLiBvbiBhcmNoaXRlY3R1cmVz
IGxpa2UgbWlwcyB0aGF0IHVzZSBhbg0KPiAgICAgICB1bmNhY2hlZCBzZWdtZW50IHdlJ2xsIGhh
dmUgdG8gZmFpbCB1c2Ugd2l0aCB0aGUgcGxhaW4NCj4gICAgICAgRE1BX0FUVFJfVU5DQUNIQUJM
RSBmbGFnLCBidXQgaXQgY291bGQgYmUgc3VwcG9ydGVkIHdpdGgNCj4gICAgICAgRE1BX0FUVFJf
VU5DQUNIQUJMRSB8IERNQV9BVFRSX05PX0tFUk5FTF9NQVBQSU5HLg0KPg0KPiBJIHdhcyBob3Bp
bmcgdG8gZ2V0IG1vc3Qgb2YgdGhpcyBkb25lIGZvciB0aGlzIG1lcmdlIHdpbmRvdywgYnV0IEkn
bQ0KPiBwcm9iYWJseSBsdWNreSBpZiBJIGdldCBhdCBsZWFzdCBwYXJ0cyBkb25lLiAgVG9vIG11
Y2ggZGlzdHJhY3Rpb24uDQoNClRoYW5rcyBhZ2FpbiBmb3IgdGFraW5nIGNhcmUgb2YgdGhpcywN
CkNocmlzdGlhbi4NCg0KPg0KPj4gSG1tLCBub3QgZW50aXJlbHkgc3VyZSB3aHkuLiB5b3Ugc2hv
dWxkIGJlIG9uIHRoZSBjYyBsaXN0IGZvciBlYWNoDQo+PiBpbmRpdmlkdWFsIHBhdGNoLg0KPiBU
aGV5IGZpbmFsbHkgbWFkZSBpdCwgYWx0aG91Z2ggZXZlbiB3aXRoIHRoZSBkZWxheSB0aGV5IG9u
bHkgZW5kZWQgdXANCj4gaW4gdGhlIHNwYW0gbWFpbGJveC4gIEkgc3RpbGwgY2FuJ3Qgc2VlIHRo
ZW0gb24gdGhlIHZhcmlvdXMgbWFpbGluZw0KPiBsaXN0cy4NCg0K
