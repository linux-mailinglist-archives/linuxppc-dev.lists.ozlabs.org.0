Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABD110564
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 08:01:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44v77y0wvFzDqVp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 16:01:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur04-db3-obe.outbound.protection.outlook.com
 (client-ip=40.107.6.138; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="V8VpVdLU"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60138.outbound.protection.outlook.com [40.107.6.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44v76W6kdJzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 16:00:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8K5xgdlg0/k1J6n0iovZ671aInNMOQMSU4q2c7QVMZA=;
 b=V8VpVdLUGBQQ+6pYSmH8nKMRahSXzlEZX2pDSuRkrRnNhMc9bp1dhS8uHkvxy+cGLEJGzfjSEzwtjtbiiH/mlpr+jGfhJr9WzNNtKfTftp6x1v+BLAiT4A2FB9T+qiem0eoq2wd07K7xYEiQZAw4117RF78XZ45yHQlDnQdN/EE=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB1568.EURPRD10.PROD.OUTLOOK.COM (10.165.191.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Wed, 1 May 2019 06:00:28 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1856.008; Wed, 1 May 2019
 06:00:28 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Christophe Leroy <christophe.leroy@c-s.fr>, Qiang Zhao
 <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: Re: [PATCH 4/5] soc/fsl/qe: qe.c: support fsl,qe-snums property
Thread-Topic: [PATCH 4/5] soc/fsl/qe: qe.c: support fsl,qe-snums property
Thread-Index: AQHU/1m5/ppidONGckmXHq9mm5btW6ZU8u6AgADUtYA=
Date: Wed, 1 May 2019 06:00:28 +0000
Message-ID: <1927421e-f7c5-453d-586f-d2427adab961@prevas.dk>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190430133615.25721-5-rasmus.villemoes@prevas.dk>
 <4c1c4fe8-9412-2543-e9bc-83b7e5d7c202@c-s.fr>
In-Reply-To: <4c1c4fe8-9412-2543-e9bc-83b7e5d7c202@c-s.fr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P189CA0015.EURP189.PROD.OUTLOOK.COM (2603:10a6:7:53::28)
 To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fde35d43-53fc-4838-97f1-08d6cdfa4fb1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB1568; 
x-ms-traffictypediagnostic: VI1PR10MB1568:
x-microsoft-antispam-prvs: <VI1PR10MB15680276D976078DFC35157F8A3B0@VI1PR10MB1568.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(346002)(376002)(39850400004)(136003)(40224003)(189003)(199004)(81156014)(476003)(11346002)(2906002)(486006)(64756008)(66946007)(68736007)(5660300002)(66556008)(66476007)(42882007)(6486002)(71190400001)(73956011)(66446008)(6436002)(71200400001)(305945005)(3846002)(316002)(66066001)(6116002)(110136005)(54906003)(31696002)(99286004)(53936002)(229853002)(446003)(2616005)(31686004)(8936002)(186003)(14454004)(8976002)(8676002)(72206003)(7736002)(44832011)(4326008)(26005)(256004)(52116002)(478600001)(6512007)(102836004)(25786009)(386003)(6246003)(36756003)(76176011)(74482002)(81166006)(6506007)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB1568;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8mim5vu1/AygnRWJJIrSda6L3U1NVyB712YE4Mrwx7bjqgf6Y5z1WQIKAtXumQ51LmDhcRkfv8bzJTMejWBAoSSQkMnzbjt1KJlXSMOVmjo7P0I8uhCZAkw9E0fXD5Z5rKxmlM6A2pMG9NSXhZUExDtEwMDi5NpXd5perj89VkYeKjoBpfrbKA+TKWtq8Tai2Why7/L1FrzBeokQERQJfHHwpqpQnTbw88aFMXHhDC1IDTFOuNTe06ymStDVRoGpLRvjKOcoaGD9W9YXTUDPx+yLzN9uFNNcrlbE9Nmonq/OYAS9SDdebeifYYd09419BSrt7Upu/wLURabCpcwo/yUuM8VzkQk01cS2PVS8x7RqLwqx+58nKEO7vHSSTcbJvMaTAe/PZUIJj/yA//hRUDcGe5RrlPg2sYqmgXS8cus=
Content-Type: text/plain; charset="utf-8"
Content-ID: <65BADB671623194A9E732DA6AE293E5E@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: fde35d43-53fc-4838-97f1-08d6cdfa4fb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 06:00:28.4632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1568
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
Cc: Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, Rob Herring <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gMzAvMDQvMjAxOSAxOS4xOSwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToNCj4gDQo+IA0KPiBM
ZSAzMC8wNC8yMDE5IMOgIDE1OjM2LCBSYXNtdXMgVmlsbGVtb2VzIGEgw6ljcml0wqA6DQo+PiBU
aGUgY3VycmVudCBjb2RlIGFzc3VtZXMgdGhhdCB0aGUgc2V0IG9mIHNudW0gX3ZhbHVlc18gdG8g
cG9wdWxhdGUgdGhlDQo+PiBzbnVtc1tdIGFycmF5IHdpdGggaXMgYSBmdW5jdGlvbiBvZiB0aGUg
X251bWJlcl8gb2Ygc251bXMNCj4+IGFsb25lLiBIb3dldmVyLCByZWFkaW5nIHRhYmxlIDQtMzAs
IGFuZCBpdHMgZm9vdG5vdGVzLCBvZiB0aGUgUVVJQ0MNCj4+IEVuZ2luZSBCbG9jayBSZWZlcmVu
Y2UgTWFudWFsIHNob3dzIHRoYXQgdGhhdCBpcyBhIGJpdCB0b28gbmFpdmUuDQo+Pg0KPj4gQXMg
YW4gYWx0ZXJuYXRpdmUsIHRoaXMgaW50cm9kdWNlcyBhIG5ldyBiaW5kaW5nIGZzbCxxZS1zbnVt
cywgd2hpY2gNCj4+IGF1dG9tYXRpY2FsbHkgZW5jb2RlcyBib3RoIHRoZSBudW1iZXIgb2Ygc251
bXMgYW5kIHRoZSBhY3R1YWwgdmFsdWVzIHRvDQo+PiB1c2UuIENvbnZlbmllbnRseSwgb2ZfcHJv
cGVydHlfcmVhZF92YXJpYWJsZV91OF9hcnJheSBkb2VzIGV4YWN0bHkNCj4+IHdoYXQgd2UgbmVl
ZC4NCj4+DQo+PiBGb3IgZXhhbXBsZSwgZm9yIHRoZSBNUEM4MzA5LCBvbmUgd291bGQgc3BlY2lm
eSB0aGUgcHJvcGVydHkgYXMNCj4+DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
ZnNsLHFlLXNudW1zID0gL2JpdHMvIDggPA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAweDg4IDB4ODkgMHg5OCAweDk5IDB4YTggMHhhOSAweGI4IDB4
YjkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMHhj
OCAweGM5IDB4ZDggMHhkOSAweGU4IDB4ZTk+Ow0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFJhc211
cyBWaWxsZW1vZXMgPHJhc211cy52aWxsZW1vZXNAcHJldmFzLmRrPg0KPj4gLS0tDQo+PiDCoCAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvZnNsL2NwbV9xZS9xZS50eHTCoMKgwqDCoMKgIHzC
oCA4ICsrKysrKystDQo+PiDCoCBkcml2ZXJzL3NvYy9mc2wvcWUvcWUuY8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDE0ICsrKysrKysrKysr
KystDQo+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb2MvZnNsL2NwbV9xZS9xZS50eHQNCj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3NvYy9mc2wvY3BtX3FlL3FlLnR4dA0KPj4gaW5kZXggZDdhZmFmZjVmYWZmLi4wNWY1
ZjQ4NTU2MmEgMTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc29jL2ZzbC9jcG1fcWUvcWUudHh0DQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc29jL2ZzbC9jcG1fcWUvcWUudHh0DQo+PiBAQCAtMTgsNyArMTgsOCBAQCBS
ZXF1aXJlZCBwcm9wZXJ0aWVzOg0KPj4gwqAgLSByZWcgOiBvZmZzZXQgYW5kIGxlbmd0aCBvZiB0
aGUgZGV2aWNlIHJlZ2lzdGVycy4NCj4+IMKgIC0gYnVzLWZyZXF1ZW5jeSA6IHRoZSBjbG9jayBm
cmVxdWVuY3kgZm9yIFFVSUNDIEVuZ2luZS4NCj4+IMKgIC0gZnNsLHFlLW51bS1yaXNjczogZGVm
aW5lIGhvdyBtYW55IFJJU0MgZW5naW5lcyB0aGUgUUUgaGFzLg0KPj4gLS0gZnNsLHFlLW51bS1z
bnVtczogZGVmaW5lIGhvdyBtYW55IHNlcmlhbCBudW1iZXIoU05VTSkgdGhlIFFFIGNhbg0KPj4g
dXNlIGZvciB0aGUNCj4+ICstIGZzbCxxZS1zbnVtczogVGhpcyBwcm9wZXJ0eSBoYXMgdG8gYmUg
c3BlY2lmaWVkIGFzICcvYml0cy8gOCcgdmFsdWUsDQo+PiArwqAgZGVmaW5pbmcgdGhlIGFycmF5
IG9mIHNlcmlhbCBudW1iZXIgKFNOVU0pIHZhbHVlcyBmb3IgdGhlIHZpcnR1YWwNCj4+IMKgwqDC
oCB0aHJlYWRzLg0KPj4gwqAgwqAgT3B0aW9uYWwgcHJvcGVydGllczoNCj4+IEBAIC0zNCw2ICsz
NSwxMSBAQCBSZWNvbW1lbmRlZCBwcm9wZXJ0aWVzDQo+PiDCoCAtIGJyZy1mcmVxdWVuY3kgOiB0
aGUgaW50ZXJuYWwgY2xvY2sgc291cmNlIGZyZXF1ZW5jeSBmb3IgYmF1ZC1yYXRlDQo+PiDCoMKg
wqAgZ2VuZXJhdG9ycyBpbiBIei4NCj4+IMKgICtEZXByZWNhdGVkIHByb3BlcnRpZXMNCj4+ICst
IGZzbCxxZS1udW0tc251bXM6IGRlZmluZSBob3cgbWFueSBzZXJpYWwgbnVtYmVyKFNOVU0pIHRo
ZSBRRSBjYW4gdXNlDQo+PiArwqAgZm9yIHRoZSB0aHJlYWRzLiBVc2UgZnNsLHFlLXNudW1zIGlu
c3RlYWQgdG8gbm90IG9ubHkgc3BlY2lmeSB0aGUNCj4+ICvCoCBudW1iZXIgb2Ygc251bXMsIGJ1
dCBhbHNvIHRoZWlyIHZhbHVlcy4NCj4+ICsNCj4+IMKgIEV4YW1wbGU6DQo+PiDCoMKgwqDCoMKg
wqAgcWVAZTAxMDAwMDAgew0KPj4gwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9mc2wvcWUvcWUuYyBiL2RyaXZlcnMvc29jL2ZzbC9x
ZS9xZS5jDQo+PiBpbmRleCBhZmY5ZDEzNzM1MjkuLmFmM2MyYjJiMjY4ZiAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvc29jL2ZzbC9xZS9xZS5jDQo+PiArKysgYi9kcml2ZXJzL3NvYy9mc2wvcWUv
cWUuYw0KPj4gQEAgLTI4Myw3ICsyODMsNiBAQCBFWFBPUlRfU1lNQk9MKHFlX2Nsb2NrX3NvdXJj
ZSk7DQo+PiDCoMKgICovDQo+PiDCoCBzdGF0aWMgdm9pZCBxZV9zbnVtc19pbml0KHZvaWQpDQo+
PiDCoCB7DQo+PiAtwqDCoMKgIGludCBpOw0KPiANCj4gV2h5IGRvIHlvdSBtb3ZlIHRoaXMgb25l
ID8NCg0KVG8ga2VlcCB0aGUgZGVjbGFyYXRpb25zIG9mIHRoZSBhdXRvIHZhcmlhYmxlcyB0b2dl
dGhlci4gV2hlbiByZWFkaW5nDQp0aGUgY29kZSBhbmQgbmVlZGluZyB0byBrbm93IHRoZSB0eXBl
IG9mIGksIGl0J3MgbXVjaCBoYXJkZXIgdG8gZmluZCBpdHMNCmRlY2xhcmF0aW9uIGlmIG9uZSBo
YXMgdG8gc2tpcCBiYWNrIG92ZXIgdGhlIHR3byB0YWJsZXMsIGFuZCBpdCdzDQp1bm5hdHVyYWwg
dG8gaGF2ZSBpdCBzZXBhcmF0ZSBmcm9tIHRoZSBvdGhlcnMuDQoNCj4+IMKgwqDCoMKgwqAgc3Rh
dGljIGNvbnN0IHU4IHNudW1faW5pdF83NltdID0gew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIDB4
MDQsIDB4MDUsIDB4MEMsIDB4MEQsIDB4MTQsIDB4MTUsIDB4MUMsIDB4MUQsDQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgMHgyNCwgMHgyNSwgMHgyQywgMHgyRCwgMHgzNCwgMHgzNSwgMHg4OCwgMHg4
OSwNCj4+IEBAIC0zMDQsOSArMzAzLDIyIEBAIHN0YXRpYyB2b2lkIHFlX3NudW1zX2luaXQodm9p
ZCkNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAweDI4LCAweDI5LCAweDM4LCAweDM5LCAweDQ4LCAw
eDQ5LCAweDU4LCAweDU5LA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIDB4NjgsIDB4NjksIDB4Nzgs
IDB4NzksIDB4ODAsIDB4ODEsDQo+PiDCoMKgwqDCoMKgIH07DQo+PiArwqDCoMKgIHN0cnVjdCBk
ZXZpY2Vfbm9kZSAqcWU7DQo+PiDCoMKgwqDCoMKgIGNvbnN0IHU4ICpzbnVtX2luaXQ7DQo+PiAr
wqDCoMKgIGludCBpOw0KPj4gwqAgwqDCoMKgwqDCoCBiaXRtYXBfemVybyhzbnVtX3N0YXRlLCBR
RV9OVU1fT0ZfU05VTSk7DQo+PiArwqDCoMKgIHFlID0gcWVfZ2V0X2RldmljZV9ub2RlKCk7DQo+
PiArwqDCoMKgIGlmIChxZSkgew0KPj4gK8KgwqDCoMKgwqDCoMKgIGkgPSBvZl9wcm9wZXJ0eV9y
ZWFkX3ZhcmlhYmxlX3U4X2FycmF5KHFlLCAiZnNsLHFlLXNudW1zIiwNCj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc251bXMs
IDEsIFFFX05VTV9PRl9TTlVNKTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBvZl9ub2RlX3B1dChxZSk7
DQo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGkgPiAwKSB7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBxZV9udW1fb2Zfc251bSA9IGk7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1
cm47DQo+IA0KPiBJbiB0aGF0IGNhc2UgeW91IHNraXAgdGhlIHJlc3Qgb2YgdGhlIGluaXQgPyBD
YW4geW91IGV4cGxhaW4gPw0KDQpJZiBvZl9wcm9wZXJ0eV9yZWFkX3ZhcmlhYmxlX3U4X2FycmF5
IGlzIHN1Y2Nlc2Z1bCwgaXQgaGFzIGFscmVhZHkNCnN0b3JlZCB0aGUgdmFsdWVzIGludG8gdGhl
IHNudW1zIGFycmF5LCBzbyB0aGVyZSdzIG5vIGNvcHlpbmcgbGVmdCB0bw0KZG8sIGFuZCB0aGUg
cmV0dXJuIHZhbHVlIGlzIHRoZSBsZW5ndGggb2YgdGhlIGFycmF5ICh3aGljaCB3ZSBzYXZlIGZv
cg0KbGF0ZXIgaW4gcWVfbnVtX29mX3NudW0pLiBTbyB0aGVyZSdzIHJlYWxseSBub3RoaW5nIG1v
cmUgdG8gZG8uDQoNClRoaXMgd2FzIHdoYXQgSSB0cmllZCB0byBoaW50IGF0IHdpdGggIkNvbnZl
bmllbnRseSwNCm9mX3Byb3BlcnR5X3JlYWRfdmFyaWFibGVfdThfYXJyYXkgZG9lcyBleGFjdGx5
DQp3aGF0IHdlIG5lZWQuIiwgYnV0IEkgY2FuIHNlZSB0aGF0IHRoYXQgbWlnaHQgbmVlZCBlbGFi
b3JhdGluZyBhIGxpdHRsZS4NCg0KUmFzbXVzDQo=
