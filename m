Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D58F1BACE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 18:14:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452m8x4y50zDqFs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 02:14:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.1.43; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="k3B+m2Ep"; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10043.outbound.protection.outlook.com [40.107.1.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452m4000bYzDqDP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 02:09:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3tDPVaKIKIlPQRhyLSR746hhcJ0XIzk3tRMTpL9Uu8=;
 b=k3B+m2EpEBEaF6MRSZ67e4cwll/By8pLdJODGOSrxsDqPeLX7mnZHBrANESsmv7pn3kMGRXm4QQaE3iYrIcNfFdWw6T3tyKAUIQfalUL+6vPetnVLjMctrg3lcMQWY/9GyigEPw01GxT1n/6Re8zDQO3T9aZAhq95zxGwA+uSbM=
Received: from DB6PR0402MB2727.eurprd04.prod.outlook.com (10.172.247.10) by
 DB6PR0402MB2709.eurprd04.prod.outlook.com (10.172.246.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Mon, 13 May 2019 16:09:40 +0000
Received: from DB6PR0402MB2727.eurprd04.prod.outlook.com
 ([fe80::e194:a71a:3497:783e]) by DB6PR0402MB2727.eurprd04.prod.outlook.com
 ([fe80::e194:a71a:3497:783e%8]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 16:09:40 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: [PATCH v1 1/8] soc/fsl/qbman: Rework QBMan private memory setup
Thread-Topic: [PATCH v1 1/8] soc/fsl/qbman: Rework QBMan private memory setup
Thread-Index: AQHVCaZFjUNNNQ05uk+bzdAzenpPYA==
Date: Mon, 13 May 2019 16:09:40 +0000
Message-ID: <1557763756-24118-2-git-send-email-roy.pledge@nxp.com>
References: <1557763756-24118-1-git-send-email-roy.pledge@nxp.com>
In-Reply-To: <1557763756-24118-1-git-send-email-roy.pledge@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.7.4
x-clientproxiedby: SN4PR0501CA0144.namprd05.prod.outlook.com
 (2603:10b6:803:2c::22) To DB6PR0402MB2727.eurprd04.prod.outlook.com
 (2603:10a6:4:98::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=roy.pledge@nxp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [72.142.119.78]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a157450-146b-4661-b9b4-08d6d7bd6756
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DB6PR0402MB2709; 
x-ms-traffictypediagnostic: DB6PR0402MB2709:
x-microsoft-antispam-prvs: <DB6PR0402MB270926B8263FA1154CB7CE33860F0@DB6PR0402MB2709.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(366004)(376002)(396003)(39860400002)(189003)(199004)(81166006)(81156014)(8936002)(2201001)(110136005)(54906003)(316002)(476003)(2501003)(86362001)(2616005)(50226002)(2906002)(66556008)(64756008)(66446008)(66946007)(66476007)(73956011)(478600001)(3450700001)(6636002)(305945005)(5660300002)(386003)(6506007)(102836004)(43066004)(6486002)(7736002)(26005)(186003)(6436002)(66066001)(4326008)(446003)(36756003)(99286004)(486006)(25786009)(11346002)(76176011)(52116002)(53936002)(44832011)(6512007)(8676002)(14454004)(68736007)(71200400001)(14444005)(256004)(3846002)(71190400001)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0402MB2709;
 H:DB6PR0402MB2727.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mMPZsJO+GDb/rz+GQSqmG+YuDBAtKjGOXjbe8kTeMdrd9f2dkmYGAO6Pi4WaZaaF1m+qbLGEzxihUEN6Pv4nJO9tPmeuPgAV3I6T4zDk62IPALtez4Orrq6Y9KkDkKyKwIntO7bZi5ulLPHDam/i4S618GyYgjQAfo+mWV7WucSRIErklfVaNqK4z4SrOFtoXJds/E2pCybWe4TbkT0CAg05+JrdYLvuYudx22GYM3nYmxUgqRRo5X7IeClW5BVk2v3pPKtNrIYi4bP2SyW2eLiuUystq3o+Njl1bU5VT5R50YmHiQQ7nA8j3PJ8u/ihrSj7H7NsIBukAONuvE5YpyIQEw3RU4T1r03E9quMTr7j/bkKzaPtET7wHWedg+d0Y3ccJ263OHl67muzMHbhr2Anx6UN8tisTim+oZwUQoQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a157450-146b-4661-b9b4-08d6d7bd6756
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 16:09:40.8537 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2709
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
Reply-To: Roy Pledge <roy.pledge@nxp.com>
Cc: Roy Pledge <roy.pledge@nxp.com>, Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Madalin-cristian Bucur <madalin.bucur@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

UmV3b3JrIFFCTWFuIHByaXZhdGUgbWVtb3J5IHNldHVwIHNvIHRoYXQgdGhlIGFyZWFzIGFyZSBu
b3QNCnplcm9lZCBpZiB0aGUgZGV2aWNlIHdhcyBwcmV2aW91c2x5IGluaXRpYWxpemVkDQoNCklm
IHRoZSBRTWFuIHByaXZhdGUgbWVtb3J5IHdhcyBhbHJlYWR5IGluaXRpYWxpemVkIHNraXAgdGhl
IFBGRFINCmluaXRpYWxpemF0aW9uLg0KDQpTaWduZWQtb2ZmLWJ5OiBSb3kgUGxlZGdlIDxyb3ku
cGxlZGdlQG54cC5jb20+DQotLS0NCiBkcml2ZXJzL3NvYy9mc2wvcWJtYW4vYm1hbl9jY3NyLmMg
fCAyNiArKysrKysrKysrKysrKysrKysrKy0tDQogZHJpdmVycy9zb2MvZnNsL3FibWFuL2RwYWFf
c3lzLmMgIHwgIDcgKysrLS0tDQogZHJpdmVycy9zb2MvZnNsL3FibWFuL3FtYW5fY2Nzci5jIHwg
NDUgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tDQogMyBmaWxlcyBjaGFu
Z2VkLCA2NyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc29jL2ZzbC9xYm1hbi9ibWFuX2Njc3IuYyBiL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9i
bWFuX2Njc3IuYw0KaW5kZXggN2MzY2M5Ni4uZGM2ZDdlNSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
c29jL2ZzbC9xYm1hbi9ibWFuX2Njc3IuYw0KKysrIGIvZHJpdmVycy9zb2MvZnNsL3FibWFuL2Jt
YW5fY2Nzci5jDQpAQCAtOTcsMTcgKzk3LDQwIEBAIHN0YXRpYyB2b2lkIGJtX2dldF92ZXJzaW9u
KHUxNiAqaWQsIHU4ICptYWpvciwgdTggKm1pbm9yKQ0KIC8qIHNpZ25hbCB0cmFuc2FjdGlvbnMg
Zm9yIEZCUFJzIHdpdGggaGlnaGVyIHByaW9yaXR5ICovDQogI2RlZmluZSBGQlBSX0FSX1JQUklP
X0hJIEJJVCgzMCkNCiANCi1zdGF0aWMgdm9pZCBibV9zZXRfbWVtb3J5KHU2NCBiYSwgdTMyIHNp
emUpDQorLyogVHJhY2sgaWYgcHJvYmUgaGFzIG9jY3VycmVkIGFuZCBpZiBjbGVhbnVwIGlzIHJl
cXVpcmVkICovDQorc3RhdGljIGludCBfX2JtYW5fcHJvYmVkOw0KK3N0YXRpYyBpbnQgX19ibWFu
X3JlcXVpcmVzX2NsZWFudXA7DQorDQorDQorc3RhdGljIGludCBibV9zZXRfbWVtb3J5KHU2NCBi
YSwgdTMyIHNpemUpDQogew0KKwl1MzIgYmFyLCBiYXJlOw0KIAl1MzIgZXhwID0gaWxvZzIoc2l6
ZSk7DQogCS8qIGNob2tlIGlmIHNpemUgaXNuJ3Qgd2l0aGluIHJhbmdlICovDQogCURQQUFfQVNT
RVJUKHNpemUgPj0gNDA5NiAmJiBzaXplIDw9IDEwMjQqMTAyNCoxMDI0ICYmDQogCQkgICBpc19w
b3dlcl9vZl8yKHNpemUpKTsNCiAJLyogY2hva2UgaWYgJ1tlXWJhJyBoYXMgbG93ZXItYWxpZ25t
ZW50IHRoYW4gJ3NpemUnICovDQogCURQQUFfQVNTRVJUKCEoYmEgJiAoc2l6ZSAtIDEpKSk7DQor
DQorCS8qIENoZWNrIHRvIHNlZSBpZiBCTWFuIGhhcyBhbHJlYWR5IGJlZW4gaW5pdGlhbGl6ZWQg
Ki8NCisJYmFyID0gYm1fY2Nzcl9pbihSRUdfRkJQUl9CQVIpOw0KKwlpZiAoYmFyKSB7DQorCQkv
KiBNYWtlciBzdXJlIGJhID09IHdoYXQgd2FzIHByb2dyYW1tZWQpICovDQorCQliYXJlID0gYm1f
Y2Nzcl9pbihSRUdfRkJQUl9CQVJFKTsNCisJCWlmIChiYXJlICE9IHVwcGVyXzMyX2JpdHMoYmEp
IHx8IGJhciAhPSBsb3dlcl8zMl9iaXRzKGJhKSkgew0KKwkJCXByX2VycigiQXR0ZW1wdGVkIHRv
IHJlaW5pdGlhbGl6ZSBCTWFuIHdpdGggZGlmZmVyZW50IEJBUiwgZ290IDB4JWxseCByZWFkIEJB
UkU9MHgleCBCQVI9MHgleFxuIiwNCisJCQkgICAgICAgYmEsIGJhcmUsIGJhcik7DQorCQkJcmV0
dXJuIC1FTk9NRU07DQorCQl9DQorCQlwcl9pbmZvKCJCTWFuIEJBUiBhbHJlYWR5IGNvbmZpZ3Vy
ZWRcbiIpOw0KKwkJX19ibWFuX3JlcXVpcmVzX2NsZWFudXAgPSAxOw0KKwkJcmV0dXJuIDE7DQor
CX0NCisNCiAJYm1fY2Nzcl9vdXQoUkVHX0ZCUFJfQkFSRSwgdXBwZXJfMzJfYml0cyhiYSkpOw0K
IAlibV9jY3NyX291dChSRUdfRkJQUl9CQVIsIGxvd2VyXzMyX2JpdHMoYmEpKTsNCiAJYm1fY2Nz
cl9vdXQoUkVHX0ZCUFJfQVIsIGV4cCAtIDEpOw0KKwlyZXR1cm4gMDsNCiB9DQogDQogLyoNCkBA
IC0xMjAsNyArMTQzLDYgQEAgc3RhdGljIHZvaWQgYm1fc2V0X21lbW9yeSh1NjQgYmEsIHUzMiBz
aXplKQ0KICAqLw0KIHN0YXRpYyBkbWFfYWRkcl90IGZicHJfYTsNCiBzdGF0aWMgc2l6ZV90IGZi
cHJfc3o7DQotc3RhdGljIGludCBfX2JtYW5fcHJvYmVkOw0KIA0KIHN0YXRpYyBpbnQgYm1hbl9m
YnByKHN0cnVjdCByZXNlcnZlZF9tZW0gKnJtZW0pDQogew0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c29jL2ZzbC9xYm1hbi9kcGFhX3N5cy5jIGIvZHJpdmVycy9zb2MvZnNsL3FibWFuL2RwYWFfc3lz
LmMNCmluZGV4IGU2ZDQ4ZGMuLjNlMGE3ZjMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3NvYy9mc2wv
cWJtYW4vZHBhYV9zeXMuYw0KKysrIGIvZHJpdmVycy9zb2MvZnNsL3FibWFuL2RwYWFfc3lzLmMN
CkBAIC00MCw2ICs0MCw3IEBAIGludCBxYm1hbl9pbml0X3ByaXZhdGVfbWVtKHN0cnVjdCBkZXZp
Y2UgKmRldiwgaW50IGlkeCwgZG1hX2FkZHJfdCAqYWRkciwNCiAJaW50IHJldDsNCiAJc3RydWN0
IGRldmljZV9ub2RlICptZW1fbm9kZTsNCiAJdTY0IHNpemU2NDsNCisJc3RydWN0IHJlc2VydmVk
X21lbSAqcm1lbTsNCiANCiAJcmV0ID0gb2ZfcmVzZXJ2ZWRfbWVtX2RldmljZV9pbml0X2J5X2lk
eChkZXYsIGRldi0+b2Zfbm9kZSwgaWR4KTsNCiAJaWYgKHJldCkgew0KQEAgLTYyLDEwICs2Myw4
IEBAIGludCBxYm1hbl9pbml0X3ByaXZhdGVfbWVtKHN0cnVjdCBkZXZpY2UgKmRldiwgaW50IGlk
eCwgZG1hX2FkZHJfdCAqYWRkciwNCiAJCXJldHVybiAtRU5PREVWOw0KIAl9DQogDQotCWlmICgh
ZG1hX2FsbG9jX2NvaGVyZW50KGRldiwgKnNpemUsIGFkZHIsIDApKSB7DQotCQlkZXZfZXJyKGRl
diwgIkRNQSBBbGxvYyBtZW1vcnkgZmFpbGVkXG4iKTsNCi0JCXJldHVybiAtRU5PREVWOw0KLQl9
DQorCXJtZW0gPSBvZl9yZXNlcnZlZF9tZW1fbG9va3VwKG1lbV9ub2RlKTsNCisJKmFkZHIgPSBy
bWVtLT5iYXNlOw0KIA0KIAkvKg0KIAkgKiBEaXNhc3NvY2lhdGUgdGhlIHJlc2VydmVkIG1lbW9y
eSBhcmVhIGZyb20gdGhlIGRldmljZQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL2ZzbC9xYm1h
bi9xbWFuX2Njc3IuYyBiL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFuX2Njc3IuYw0KaW5kZXgg
MTA5YjM4ZC4uZDA1NGUzNyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFu
X2Njc3IuYw0KKysrIGIvZHJpdmVycy9zb2MvZnNsL3FibWFuL3FtYW5fY2Nzci5jDQpAQCAtMjc0
LDYgKzI3NCw3IEBAIHN0YXRpYyB1MzIgX19pb21lbSAqcW1fY2Nzcl9zdGFydDsNCiAvKiBBIFNE
UUNSIG1hc2sgY29tcHJpc2luZyBhbGwgdGhlIGF2YWlsYWJsZS92aXNpYmxlIHBvb2wgY2hhbm5l
bHMgKi8NCiBzdGF0aWMgdTMyIHFtX3Bvb2xzX3NkcWNyOw0KIHN0YXRpYyBpbnQgX19xbWFuX3By
b2JlZDsNCitzdGF0aWMgaW50ICBfX3FtYW5fcmVxdWlyZXNfY2xlYW51cDsNCiANCiBzdGF0aWMg
aW5saW5lIHUzMiBxbV9jY3NyX2luKHUzMiBvZmZzZXQpDQogew0KQEAgLTM0MCwxOSArMzQxLDQ2
IEBAIHN0YXRpYyB2b2lkIHFtX2dldF92ZXJzaW9uKHUxNiAqaWQsIHU4ICptYWpvciwgdTggKm1p
bm9yKQ0KIH0NCiANCiAjZGVmaW5lIFBGRFJfQVJfRU4JCUJJVCgzMSkNCi1zdGF0aWMgdm9pZCBx
bV9zZXRfbWVtb3J5KGVudW0gcW1fbWVtb3J5IG1lbW9yeSwgdTY0IGJhLCB1MzIgc2l6ZSkNCitz
dGF0aWMgaW50IHFtX3NldF9tZW1vcnkoZW51bSBxbV9tZW1vcnkgbWVtb3J5LCB1NjQgYmEsIHUz
MiBzaXplKQ0KIHsNCisJdm9pZCAqcHRyOw0KIAl1MzIgb2Zmc2V0ID0gKG1lbW9yeSA9PSBxbV9t
ZW1vcnlfZnFkKSA/IFJFR19GUURfQkFSRSA6IFJFR19QRkRSX0JBUkU7DQogCXUzMiBleHAgPSBp
bG9nMihzaXplKTsNCisJdTMyIGJhciwgYmFyZTsNCiANCiAJLyogY2hva2UgaWYgc2l6ZSBpc24n
dCB3aXRoaW4gcmFuZ2UgKi8NCiAJRFBBQV9BU1NFUlQoKHNpemUgPj0gNDA5NikgJiYgKHNpemUg
PD0gMTAyNCoxMDI0KjEwMjQpICYmDQogCQkgICAgaXNfcG93ZXJfb2ZfMihzaXplKSk7DQogCS8q
IGNob2tlIGlmICdiYScgaGFzIGxvd2VyLWFsaWdubWVudCB0aGFuICdzaXplJyAqLw0KIAlEUEFB
X0FTU0VSVCghKGJhICYgKHNpemUgLSAxKSkpOw0KKw0KKwkvKiBDaGVjayB0byBzZWUgaWYgUU1h
biBoYXMgYWxyZWFkeSBiZWVuIGluaXRpYWxpemVkICovDQorCWJhciA9IHFtX2Njc3JfaW4ob2Zm
c2V0ICsgUkVHX29mZnNldF9CQVIpOw0KKwlpZiAoYmFyKSB7DQorCQkvKiBNYWtlciBzdXJlIGJh
ID09IHdoYXQgd2FzIHByb2dyYW1tZWQpICovDQorCQliYXJlID0gcW1fY2Nzcl9pbihvZmZzZXQp
Ow0KKwkJaWYgKGJhcmUgIT0gdXBwZXJfMzJfYml0cyhiYSkgfHwgYmFyICE9IGxvd2VyXzMyX2Jp
dHMoYmEpKSB7DQorCQkJcHJfZXJyKCJBdHRlbXB0ZWQgdG8gcmVpbml0aWFsaXplIFFNYW4gd2l0
aCBkaWZmZXJlbnQgQkFSLCBnb3QgMHglbGx4IHJlYWQgQkFSRT0weCV4IEJBUj0weCV4XG4iLA0K
KwkJCSAgICAgICBiYSwgYmFyZSwgYmFyKTsNCisJCQlyZXR1cm4gLUVOT01FTTsNCisJCX0NCisJ
CV9fcW1hbl9yZXF1aXJlc19jbGVhbnVwID0gMTsNCisJCS8qIFJldHVybiAxIHRvIGluZGljYXRl
IG1lbW9yeSB3YXMgcHJldmlvdXNseSBwcm9ncmFtbWVkICovDQorCQlyZXR1cm4gMTsNCisJfQ0K
KwkvKiBOZWVkIHRvIHRlbXBvcmFyaWx5IG1hcCB0aGUgYXJlYSB0byBtYWtlIHN1cmUgaXQgaXMg
emVyb2VkICovDQorCXB0ciA9IG1lbXJlbWFwKGJhLCBzaXplLCBNRU1SRU1BUF9XQik7DQorCWlm
ICghcHRyKSB7DQorCQlwcl9jcml0KCJtZW1yZW1hcCgpIG9mIFFNYW4gcHJpdmF0ZSBtZW1vcnkg
ZmFpbGVkXG4iKTsNCisJCXJldHVybiAtRU5PTUVNOw0KKwl9DQorCW1lbXNldChwdHIsIDAsIHNp
emUpOw0KKwltZW11bm1hcChwdHIpOw0KKw0KIAlxbV9jY3NyX291dChvZmZzZXQsIHVwcGVyXzMy
X2JpdHMoYmEpKTsNCiAJcW1fY2Nzcl9vdXQob2Zmc2V0ICsgUkVHX29mZnNldF9CQVIsIGxvd2Vy
XzMyX2JpdHMoYmEpKTsNCiAJcW1fY2Nzcl9vdXQob2Zmc2V0ICsgUkVHX29mZnNldF9BUiwgUEZE
Ul9BUl9FTiB8IChleHAgLSAxKSk7DQorCXJldHVybiAwOw0KIH0NCiANCiBzdGF0aWMgdm9pZCBx
bV9zZXRfcGZkcl90aHJlc2hvbGQodTMyIHRoLCB1OCBrKQ0KQEAgLTU3MSwxMiArNTk5LDE5IEBA
IHN0YXRpYyBpbnQgcW1hbl9pbml0X2Njc3Ioc3RydWN0IGRldmljZSAqZGV2KQ0KIAlpbnQgaSwg
ZXJyOw0KIA0KIAkvKiBGUUQgbWVtb3J5ICovDQotCXFtX3NldF9tZW1vcnkocW1fbWVtb3J5X2Zx
ZCwgZnFkX2EsIGZxZF9zeik7DQorCWVyciA9IHFtX3NldF9tZW1vcnkocW1fbWVtb3J5X2ZxZCwg
ZnFkX2EsIGZxZF9zeik7DQorCWlmIChlcnIgPCAwKQ0KKwkJcmV0dXJuIGVycjsNCiAJLyogUEZE
UiBtZW1vcnkgKi8NCi0JcW1fc2V0X21lbW9yeShxbV9tZW1vcnlfcGZkciwgcGZkcl9hLCBwZmRy
X3N6KTsNCi0JZXJyID0gcW1faW5pdF9wZmRyKGRldiwgOCwgcGZkcl9zeiAvIDY0IC0gOCk7DQot
CWlmIChlcnIpDQorCWVyciA9IHFtX3NldF9tZW1vcnkocW1fbWVtb3J5X3BmZHIsIHBmZHJfYSwg
cGZkcl9zeik7DQorCWlmIChlcnIgPCAwKQ0KIAkJcmV0dXJuIGVycjsNCisJLyogT25seSBpbml0
aWFsaXplIFBGRFJzIGlmIHRoZSBRTWFuIHdhcyBub3QgaW5pdGlhbGl6ZWQgYmVmb3JlICovDQor
CWlmIChlcnIgPT0gMCkgew0KKwkJZXJyID0gcW1faW5pdF9wZmRyKGRldiwgOCwgcGZkcl9zeiAv
IDY0IC0gOCk7DQorCQlpZiAoZXJyKQ0KKwkJCXJldHVybiBlcnI7DQorCX0NCiAJLyogdGhyZXNo
b2xkcyAqLw0KIAlxbV9zZXRfcGZkcl90aHJlc2hvbGQoNTEyLCA2NCk7DQogCXFtX3NldF9zZmRy
X3RocmVzaG9sZCgxMjgpOw0KLS0gDQoyLjcuNA0KDQo=
