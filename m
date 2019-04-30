Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 269C3FE24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 18:48:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tnY13x4czDqXJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 02:48:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur02-ve1-obe.outbound.protection.outlook.com
 (client-ip=40.107.2.102; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="bPUQCFYZ"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20102.outbound.protection.outlook.com [40.107.2.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tjHH0rTTzDqHV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 23:36:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NOQxN47T6FsbpolumeF5W6vP2DKEHqMWsBgLFRA0aI=;
 b=bPUQCFYZ3aUpXEvnppd1ZIJ9ZmTASMXo4+VO8jV6/cfS4iGtafBzguV/g7HtJoDpxlWSD2HA9asy+d1ddxKwusmZ0QLeHR3+38jgaXzCyOsOiHOCWlJYRXCMzRWYjH3ZeEis0Dvue4kmzXVaohlAdyt/alG6OuUKCQ1aBcNCZWY=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB0735.EURPRD10.PROD.OUTLOOK.COM (10.167.203.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 13:36:34 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 13:36:34 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 5/5] soc/fsl/qe: qe.c: fold qe_get_num_of_snums into
 qe_snums_init
Thread-Topic: [PATCH 5/5] soc/fsl/qe: qe.c: fold qe_get_num_of_snums into
 qe_snums_init
Thread-Index: AQHU/1m6D8VAO09VR06t84TvSK4Mww==
Date: Tue, 30 Apr 2019 13:36:34 +0000
Message-ID: <20190430133615.25721-6-rasmus.villemoes@prevas.dk>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1P18901CA0005.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:3:8b::15) To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [5.186.118.63]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72bbfeae-6636-4c74-e405-08d6cd70dcd2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB0735; 
x-ms-traffictypediagnostic: VI1PR10MB0735:
x-microsoft-antispam-prvs: <VI1PR10MB07353B1C89623EE6AFA151068A3A0@VI1PR10MB0735.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(39850400004)(366004)(376002)(346002)(199004)(189003)(81156014)(36756003)(8676002)(6436002)(478600001)(81166006)(107886003)(50226002)(52116002)(8976002)(8936002)(74482002)(72206003)(4326008)(7736002)(6486002)(6506007)(386003)(25786009)(1076003)(53936002)(54906003)(76176011)(305945005)(110136005)(316002)(99286004)(14454004)(6512007)(476003)(11346002)(446003)(5660300002)(44832011)(66446008)(26005)(73956011)(42882007)(2616005)(6116002)(2906002)(71200400001)(66556008)(66476007)(64756008)(66066001)(97736004)(66946007)(3846002)(256004)(68736007)(71446004)(186003)(486006)(102836004)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB0735;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xRkTiuj/aGBwatyIuWkwJOoy+4oNvWxN7jNH2YXkf5yFZVkNWuguWJbSrbyW/R48XwV45OdBJ44BIg9NB6pfPiA86qIpE2+JPSu4rOuSVbTSUZmoxDRVslQM3l0yypgZq3aDXPi4vVgI+U10E9DvIj4ai+ToVfNkgJizgB8HQ3lIcdyjTeja2XSUquTjDu/WlVR2ElFyupHIq1F9KLvpQe/xkFmX+Gc6ICIKguTm8olpjF4ABAli/85bHseM2VXf5B8604KqKaRu9RKRSVfsFbUixC1Sk+74TdRGLMBIkq87R9ZUNiMVW5MCvaYVBuT03bDhmaxe/rJ44+GM2aA7h+KYPoWSMyBVdPYEfPeJ6ytaM9BzLf8FaXQc2OKLSgQWZtmBXcoAFqcoRQNJl8FVGiDZJPm17kT2eFMHt8FSbig=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bbfeae-6636-4c74-e405-08d6cd70dcd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 13:36:34.6955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB0735
X-Mailman-Approved-At: Wed, 01 May 2019 02:38:35 +1000
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
Cc: Valentin Longchamp <valentin.longchamp@keymile.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
 Rob Herring <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

VGhlIGNvbW1lbnQgIk5vIFFFIGV2ZXIgaGFzIGZld2VyIHRoYW4gMjggU05VTXMiIGlzIGZhbHNl
OyBlLmcuIHRoZQ0KTVBDODMwOSBoYXMgMTQuIFRoZSBjb2RlIHBhdGggcmV0dXJuaW5nIC1FSU5W
QUwgaXMgYWxzbyBhIHJlY2lwZSBmb3INCmluc3RhbnQgZGlzYXN0ZXIsIHNpbmNlIHRoZSBjYWxs
ZXIgKHFlX3NudW1zX2luaXQpIHVuY3JpdGljYWxseQ0KYXNzaWducyB0aGUgcmV0dXJuIHZhbHVl
IHRvIHRoZSB1bnNpZ25lZCBxZV9udW1fb2Zfc251bSwgYW5kIHdvdWxkDQp0aHVzIHByb2NlZWQg
dG8gYXR0ZW1wdCB0byBjb3B5IDRHQiBmcm9tIHNudW1faW5pdF80NltdIHRvIHRoZSBzbnVtW10N
CmFycmF5Lg0KDQpTbyBmb2xkIHRoZSBoYW5kbGluZyBvZiB0aGUgbGVnYWN5IGZzbCxxZS1udW0t
c251bXMgaW50bw0KcWVfc251bXNfaW5pdCwgYW5kIG1ha2Ugc3VyZSB3ZSBkbyBub3QgZW5kIHVw
IHVzaW5nIHRoZSBzbnVtX2luaXRfNDYNCmFycmF5IGluIGNhc2VzIG90aGVyIHRoYW4gdGhlIHR3
byB3aGVyZSB3ZSBrbm93IGl0IG1ha2VzIHNlbnNlLg0KDQpTaWduZWQtb2ZmLWJ5OiBSYXNtdXMg
VmlsbGVtb2VzIDxyYXNtdXMudmlsbGVtb2VzQHByZXZhcy5kaz4NCi0tLQ0KIGRyaXZlcnMvbmV0
L2V0aGVybmV0L2ZyZWVzY2FsZS91Y2NfZ2V0aC5jIHwgIDIgKy0NCiBkcml2ZXJzL3NvYy9mc2wv
cWUvcWUuYyAgICAgICAgICAgICAgICAgICB8IDU0ICsrKysrKystLS0tLS0tLS0tLS0tLS0tDQog
aW5jbHVkZS9zb2MvZnNsL3FlL3FlLmggICAgICAgICAgICAgICAgICAgfCAgMiArLQ0KIDMgZmls
ZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMzkgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvdWNjX2dldGguYyBiL2RyaXZlcnMv
bmV0L2V0aGVybmV0L2ZyZWVzY2FsZS91Y2NfZ2V0aC5jDQppbmRleCBlYjNlNjVlODg2OGYuLjU3
NDhlYjg0NjRkMCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L2ZyZWVzY2FsZS91
Y2NfZ2V0aC5jDQorKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9mcmVlc2NhbGUvdWNjX2dldGgu
Yw0KQEAgLTM4MzcsNyArMzgzNyw3IEBAIHN0YXRpYyBpbnQgdWNjX2dldGhfcHJvYmUoc3RydWN0
IHBsYXRmb3JtX2RldmljZSogb2ZkZXYpDQogCQl9DQogDQogCWlmIChtYXhfc3BlZWQgPT0gU1BF
RURfMTAwMCkgew0KLQkJdW5zaWduZWQgaW50IHNudW1zID0gcWVfZ2V0X251bV9vZl9zbnVtcygp
Ow0KKwkJdW5zaWduZWQgaW50IHNudW1zID0gcWVfbnVtX29mX3NudW07DQogDQogCQkvKiBjb25m
aWd1cmUgbXVyYW0gRklGT3MgZm9yIGdpZ2FiaXQgb3BlcmF0aW9uICovDQogCQl1Z19pbmZvLT51
Zl9pbmZvLnVyZnMgPSBVQ0NfR0VUSF9VUkZTX0dJR0FfSU5JVDsNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3NvYy9mc2wvcWUvcWUuYyBiL2RyaXZlcnMvc29jL2ZzbC9xZS9xZS5jDQppbmRleCBhZjNj
MmIyYjI2OGYuLjhjM2IzYzYyZDgxYiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvc29jL2ZzbC9xZS9x
ZS5jDQorKysgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcWUuYw0KQEAgLTUyLDcgKzUyLDggQEAgRVhQ
T1JUX1NZTUJPTChxZV9pbW1yKTsNCiANCiBzdGF0aWMgdTggc251bXNbUUVfTlVNX09GX1NOVU1d
OwkvKiBEeW5hbWljYWxseSBhbGxvY2F0ZWQgU05VTXMgKi8NCiBzdGF0aWMgREVDTEFSRV9CSVRN
QVAoc251bV9zdGF0ZSwgUUVfTlVNX09GX1NOVU0pOw0KLXN0YXRpYyB1bnNpZ25lZCBpbnQgcWVf
bnVtX29mX3NudW07DQordW5zaWduZWQgaW50IHFlX251bV9vZl9zbnVtOw0KK0VYUE9SVF9TWU1C
T0wocWVfbnVtX29mX3NudW0pOw0KIA0KIHN0YXRpYyBwaHlzX2FkZHJfdCBxZWJhc2UgPSAtMTsN
CiANCkBAIC0zMDgsMjYgKzMwOSwzNCBAQCBzdGF0aWMgdm9pZCBxZV9zbnVtc19pbml0KHZvaWQp
DQogCWludCBpOw0KIA0KIAliaXRtYXBfemVybyhzbnVtX3N0YXRlLCBRRV9OVU1fT0ZfU05VTSk7
DQorCXFlX251bV9vZl9zbnVtID0gMjg7IC8qIFRoZSBkZWZhdWx0IG51bWJlciBvZiBzbnVtIGZv
ciB0aHJlYWRzIGlzIDI4ICovDQogCXFlID0gcWVfZ2V0X2RldmljZV9ub2RlKCk7DQogCWlmIChx
ZSkgew0KIAkJaSA9IG9mX3Byb3BlcnR5X3JlYWRfdmFyaWFibGVfdThfYXJyYXkocWUsICJmc2ws
cWUtc251bXMiLA0KIAkJCQkJCSAgICAgICBzbnVtcywgMSwgUUVfTlVNX09GX1NOVU0pOw0KLQkJ
b2Zfbm9kZV9wdXQocWUpOw0KIAkJaWYgKGkgPiAwKSB7DQorCQkJb2Zfbm9kZV9wdXQocWUpOw0K
IAkJCXFlX251bV9vZl9zbnVtID0gaTsNCiAJCQlyZXR1cm47DQogCQl9DQorCQkvKg0KKwkJICog
RmFsbCBiYWNrIHRvIGxlZ2FjeSBiaW5kaW5nIG9mIHVzaW5nIHRoZSB2YWx1ZSBvZg0KKwkJICog
ZnNsLHFlLW51bS1zbnVtcyB0byBjaG9vc2Ugb25lIG9mIHRoZSBzdGF0aWMgYXJyYXlzDQorCQkg
KiBhYm92ZS4NCisJCSAqLw0KKwkJb2ZfcHJvcGVydHlfcmVhZF91MzIocWUsICJmc2wscWUtbnVt
LXNudW1zIiwgJnFlX251bV9vZl9zbnVtKTsNCisJCW9mX25vZGVfcHV0KHFlKTsNCiAJfQ0KIA0K
LQlxZV9udW1fb2Zfc251bSA9IHFlX2dldF9udW1fb2Zfc251bXMoKTsNCi0NCiAJaWYgKHFlX251
bV9vZl9zbnVtID09IDc2KQ0KIAkJc251bV9pbml0ID0gc251bV9pbml0Xzc2Ow0KLQllbHNlDQor
CWVsc2UgaWYgKHFlX251bV9vZl9zbnVtID09IDI4IHx8IHFlX251bV9vZl9zbnVtID09IDQ2KQ0K
IAkJc251bV9pbml0ID0gc251bV9pbml0XzQ2Ow0KLQ0KLQlmb3IgKGkgPSAwOyBpIDwgcWVfbnVt
X29mX3NudW07IGkrKykNCi0JCXNudW1zW2ldID0gc251bV9pbml0W2ldOw0KKwllbHNlIHsNCisJ
CXByX2VycigiUUU6IHVuc3VwcG9ydGVkIHZhbHVlIG9mIGZzbCxxZS1udW0tc251bXM6ICV1XG4i
LCBxZV9udW1fb2Zfc251bSk7DQorCQlyZXR1cm47DQorCX0NCisJbWVtY3B5KHNudW1zLCBzbnVt
X2luaXQsIHFlX251bV9vZl9zbnVtKTsNCiB9DQogDQogaW50IHFlX2dldF9zbnVtKHZvaWQpDQpA
QCAtNjQ1LDM1ICs2NTQsNiBAQCB1bnNpZ25lZCBpbnQgcWVfZ2V0X251bV9vZl9yaXNjKHZvaWQp
DQogfQ0KIEVYUE9SVF9TWU1CT0wocWVfZ2V0X251bV9vZl9yaXNjKTsNCiANCi11bnNpZ25lZCBp
bnQgcWVfZ2V0X251bV9vZl9zbnVtcyh2b2lkKQ0KLXsNCi0Jc3RydWN0IGRldmljZV9ub2RlICpx
ZTsNCi0JaW50IHNpemU7DQotCXVuc2lnbmVkIGludCBudW1fb2Zfc251bXM7DQotCWNvbnN0IHUz
MiAqcHJvcDsNCi0NCi0JbnVtX29mX3NudW1zID0gMjg7IC8qIFRoZSBkZWZhdWx0IG51bWJlciBv
ZiBzbnVtIGZvciB0aHJlYWRzIGlzIDI4ICovDQotCXFlID0gcWVfZ2V0X2RldmljZV9ub2RlKCk7
DQotCWlmICghcWUpDQotCQlyZXR1cm4gbnVtX29mX3NudW1zOw0KLQ0KLQlwcm9wID0gb2ZfZ2V0
X3Byb3BlcnR5KHFlLCAiZnNsLHFlLW51bS1zbnVtcyIsICZzaXplKTsNCi0JaWYgKHByb3AgJiYg
c2l6ZSA9PSBzaXplb2YoKnByb3ApKSB7DQotCQludW1fb2Zfc251bXMgPSAqcHJvcDsNCi0JCWlm
ICgobnVtX29mX3NudW1zIDwgMjgpIHx8IChudW1fb2Zfc251bXMgPiBRRV9OVU1fT0ZfU05VTSkp
IHsNCi0JCQkvKiBObyBRRSBldmVyIGhhcyBmZXdlciB0aGFuIDI4IFNOVU1zICovDQotCQkJcHJf
ZXJyKCJRRTogbnVtYmVyIG9mIHNudW0gaXMgaW52YWxpZFxuIik7DQotCQkJb2Zfbm9kZV9wdXQo
cWUpOw0KLQkJCXJldHVybiAtRUlOVkFMOw0KLQkJfQ0KLQl9DQotDQotCW9mX25vZGVfcHV0KHFl
KTsNCi0NCi0JcmV0dXJuIG51bV9vZl9zbnVtczsNCi19DQotRVhQT1JUX1NZTUJPTChxZV9nZXRf
bnVtX29mX3NudW1zKTsNCi0NCiBzdGF0aWMgaW50IF9faW5pdCBxZV9pbml0KHZvaWQpDQogew0K
IAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wOw0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvc29jL2ZzbC9x
ZS9xZS5oIGIvaW5jbHVkZS9zb2MvZnNsL3FlL3FlLmgNCmluZGV4IGIzZDFhZmY1ZThhZC4uYWY1
NzM5ODUwYmY0IDEwMDY0NA0KLS0tIGEvaW5jbHVkZS9zb2MvZnNsL3FlL3FlLmgNCisrKyBiL2lu
Y2x1ZGUvc29jL2ZzbC9xZS9xZS5oDQpAQCAtMjEyLDcgKzIxMiw3IEBAIGludCBxZV9zZXRicmco
ZW51bSBxZV9jbG9jayBicmcsIHVuc2lnbmVkIGludCByYXRlLCB1bnNpZ25lZCBpbnQgbXVsdGlw
bGllcik7DQogaW50IHFlX2dldF9zbnVtKHZvaWQpOw0KIHZvaWQgcWVfcHV0X3NudW0odTggc251
bSk7DQogdW5zaWduZWQgaW50IHFlX2dldF9udW1fb2ZfcmlzYyh2b2lkKTsNCi11bnNpZ25lZCBp
bnQgcWVfZ2V0X251bV9vZl9zbnVtcyh2b2lkKTsNCitleHRlcm4gdW5zaWduZWQgaW50IHFlX251
bV9vZl9zbnVtOw0KIA0KIHN0YXRpYyBpbmxpbmUgaW50IHFlX2FsaXZlX2R1cmluZ19zbGVlcCh2
b2lkKQ0KIHsNCi0tIA0KMi4yMC4xDQoNCg==
