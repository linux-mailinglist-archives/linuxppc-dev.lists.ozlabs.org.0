Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1F61BAE0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 18:20:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452mHm1j12zDqLY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 02:20:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.51; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="Ffgc+3H1"; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150051.outbound.protection.outlook.com [40.107.15.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452m475d5MzDqDh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 02:09:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EY0LRsRPtSU/gxC8mt7BCv3VogHZY/tg1SzMzDqUgcQ=;
 b=Ffgc+3H1nBeDsguxpnCdBJrvCJ0rxXh51MtiOix2xJ1Kk+n1uSzajzme/oXpDkGIDlJYJjbGB6DNT6yJTyKDCMtLjHJahWewbC3YB9/W7YVLkEm5kCuNEW9uwWkA7RXbPzNNUiXPy0F8kQd3UIU3hlcO0wHSxoRphFTN4cmCEMU=
Received: from DB6PR0402MB2727.eurprd04.prod.outlook.com (10.172.247.10) by
 DB6PR0402MB2709.eurprd04.prod.outlook.com (10.172.246.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Mon, 13 May 2019 16:09:44 +0000
Received: from DB6PR0402MB2727.eurprd04.prod.outlook.com
 ([fe80::e194:a71a:3497:783e]) by DB6PR0402MB2727.eurprd04.prod.outlook.com
 ([fe80::e194:a71a:3497:783e%8]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 16:09:44 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: [PATCH v1 3/8] soc/fsl/qbman: Cleanup QMan queues if device was
 already initialized
Thread-Topic: [PATCH v1 3/8] soc/fsl/qbman: Cleanup QMan queues if device was
 already initialized
Thread-Index: AQHVCaZHUnKeNRojtkWIB4isAjsyxA==
Date: Mon, 13 May 2019 16:09:44 +0000
Message-ID: <1557763756-24118-4-git-send-email-roy.pledge@nxp.com>
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
x-ms-office365-filtering-correlation-id: f32c38cf-227f-4c61-50d6-08d6d7bd69c0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DB6PR0402MB2709; 
x-ms-traffictypediagnostic: DB6PR0402MB2709:
x-microsoft-antispam-prvs: <DB6PR0402MB270916ADFFF9EF61AB2DEF08860F0@DB6PR0402MB2709.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2150;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(366004)(376002)(396003)(39860400002)(189003)(199004)(81166006)(81156014)(8936002)(2201001)(110136005)(54906003)(316002)(476003)(2501003)(86362001)(2616005)(50226002)(2906002)(66556008)(64756008)(66446008)(66946007)(66476007)(73956011)(478600001)(3450700001)(6636002)(305945005)(5660300002)(386003)(6506007)(102836004)(43066004)(6486002)(7736002)(26005)(186003)(6436002)(66066001)(4326008)(446003)(36756003)(99286004)(486006)(25786009)(11346002)(76176011)(52116002)(53936002)(44832011)(6512007)(8676002)(14454004)(68736007)(71200400001)(256004)(3846002)(71190400001)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0402MB2709;
 H:DB6PR0402MB2727.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: AFBBaOgHT6NrSajKPZ3Lu/Rie0fhEj4/61QLSrVdzCNE9fPL6belWuIxpETvKRyyB9qbExl6yMZ+Pe/6nwPhTymoDMDrkX4c5Nq2jlUXvFkMzZlxQ3qpznFcNMP+4UVOoTzuiou2FO7ldMHAa59G9dGy2jk3mRiyfUV198+0ePHr3WOckWa6lEe7pXSj+KKGbbeUhgL7rr3F9VhQaknc1g5j8p0AUmqPuLHlYL4r25vD+KudOQ0/XWW1fOVdUHW7DgYv2RceZTI8XK0F2RVTVSNwaHox0p5IWRITh20OEdipfajzdttGAAgGHuvuHkbUcXpldhXLOTLvQ/HZXinY7iNbSRh2sAua3mVUm3hFWYhQtP1NVdesyHQ93Xhl18igEorJn1B7DF8pnSIq073GCG57xiRDEkse9J9+SVkmdv0=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f32c38cf-227f-4c61-50d6-08d6d7bd69c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 16:09:44.5298 (UTC)
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

SWYgdGhlIFFNYW4gZGV2aWNlIHdhcyBwcmV2aW91c2x5IGluaXRpYWxpemVkIG1ha2Ugc3VyZSBh
bGwgdGhlDQpmcmFtZSBxdWV1ZXMgYXJlIG91dCBvZiBzZXJ2aWNlIG9uY2UgYWxsIHRoZSBwb3J0
YWxzIGFyZSBwcm9iZWQuDQpUaGlzIGhhbmRsZXMgdGhlIGNhc2Ugd2hlcmUgdGhlIGtlcm5lbCBp
cyByZXN0YXJ0ZWQgd2l0aG91dCB0aGUNClNvQyBiZWluZyByZXNldCAoa2V4ZWMgZm9yIGV4YW1w
bGUpDQoNClNpZ25lZC1vZmYtYnk6IFJveSBQbGVkZ2UgPHJveS5wbGVkZ2VAbnhwLmNvbT4NCi0t
LQ0KIGRyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFuLmMgICAgICAgIHwgIDQgKystLQ0KIGRyaXZl
cnMvc29jL2ZzbC9xYm1hbi9xbWFuX2Njc3IuYyAgIHwgMTMgKysrKysrKysrKysrLQ0KIGRyaXZl
cnMvc29jL2ZzbC9xYm1hbi9xbWFuX3BvcnRhbC5jIHwgMTggKysrKysrKysrKysrKysrKystDQog
ZHJpdmVycy9zb2MvZnNsL3FibWFuL3FtYW5fcHJpdi5oICAgfCAgNyArKysrKysrDQogNCBmaWxl
cyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zb2MvZnNsL3FibWFuL3FtYW4uYyBiL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9x
bWFuLmMNCmluZGV4IDYzNmY4M2YuLmYxMGY3N2QgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3NvYy9m
c2wvcWJtYW4vcW1hbi5jDQorKysgYi9kcml2ZXJzL3NvYy9mc2wvcWJtYW4vcW1hbi5jDQpAQCAt
MjU4MSw3ICsyNTgxLDcgQEAgc3RhdGljIGludCBfcW1fZHFycl9jb25zdW1lX2FuZF9tYXRjaChz
dHJ1Y3QgcW1fcG9ydGFsICpwLCB1MzIgZnFpZCwgaW50IHMsDQogI2RlZmluZSBxbV9kcXJyX2Ry
YWluX25vbWF0Y2gocCkgXA0KIAlfcW1fZHFycl9jb25zdW1lX2FuZF9tYXRjaChwLCAwLCAwLCBm
YWxzZSkNCiANCi1zdGF0aWMgaW50IHFtYW5fc2h1dGRvd25fZnEodTMyIGZxaWQpDQoraW50IHFt
YW5fc2h1dGRvd25fZnEodTMyIGZxaWQpDQogew0KIAlzdHJ1Y3QgcW1hbl9wb3J0YWwgKnA7DQog
CXN0cnVjdCBkZXZpY2UgKmRldjsNCkBAIC0yNzU0LDcgKzI3NTQsNyBAQCBzdGF0aWMgaW50IHFt
YW5fc2h1dGRvd25fZnEodTMyIGZxaWQpDQogDQogCQlEUEFBX0FTU0VSVCgobWNyLT52ZXJiICYg
UU1fTUNSX1ZFUkJfTUFTSykgPT0NCiAJCQkgICAgUU1fTUNSX1ZFUkJfQUxURVJfT09TKTsNCi0J
CWlmIChtY3ItPnJlc3VsdCkgew0KKwkJaWYgKG1jci0+cmVzdWx0ICE9IFFNX01DUl9SRVNVTFRf
T0spIHsNCiAJCQlkZXZfZXJyKGRldiwgIk9PUyBmYWlsOiBGUSAweCV4ICgweCV4KVxuIiwNCiAJ
CQkJZnFpZCwgbWNyLT5yZXN1bHQpOw0KIAkJCXJldCA9IC1FSU87DQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zb2MvZnNsL3FibWFuL3FtYW5fY2Nzci5jIGIvZHJpdmVycy9zb2MvZnNsL3FibWFuL3Ft
YW5fY2Nzci5jDQppbmRleCBkMDU0ZTM3Li5iZWUyZDBlIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9z
b2MvZnNsL3FibWFuL3FtYW5fY2Nzci5jDQorKysgYi9kcml2ZXJzL3NvYy9mc2wvcWJtYW4vcW1h
bl9jY3NyLmMNCkBAIC00ODMsNyArNDgzLDcgQEAgUkVTRVJWRURNRU1fT0ZfREVDTEFSRShxbWFu
X3BmZHIsICJmc2wscW1hbi1wZmRyIiwgcW1hbl9wZmRyKTsNCiANCiAjZW5kaWYNCiANCi1zdGF0
aWMgdW5zaWduZWQgaW50IHFtX2dldF9mcWlkX21heGNudCh2b2lkKQ0KK3Vuc2lnbmVkIGludCBx
bV9nZXRfZnFpZF9tYXhjbnQodm9pZCkNCiB7DQogCXJldHVybiBmcWRfc3ogLyA2NDsNCiB9DQpA
QCAtNzI4LDYgKzcyOCwxNyBAQCBpbnQgcW1hbl9pc19wcm9iZWQodm9pZCkNCiB9DQogRVhQT1JU
X1NZTUJPTF9HUEwocW1hbl9pc19wcm9iZWQpOw0KIA0KK2ludCBxbWFuX3JlcXVpcmVzX2NsZWFu
dXAodm9pZCkNCit7DQorCXJldHVybiBfX3FtYW5fcmVxdWlyZXNfY2xlYW51cDsNCit9DQorDQor
dm9pZCBxbWFuX2RvbmVfY2xlYW51cCh2b2lkKQ0KK3sNCisJX19xbWFuX3JlcXVpcmVzX2NsZWFu
dXAgPSAwOw0KK30NCisNCisNCiBzdGF0aWMgaW50IGZzbF9xbWFuX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQogew0KIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2
Ow0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9xbWFuX3BvcnRhbC5jIGIvZHJp
dmVycy9zb2MvZnNsL3FibWFuL3FtYW5fcG9ydGFsLmMNCmluZGV4IDI0NjA4MDIuLjgyOTVkNzUg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL3NvYy9mc2wvcWJtYW4vcW1hbl9wb3J0YWwuYw0KKysrIGIv
ZHJpdmVycy9zb2MvZnNsL3FibWFuL3FtYW5fcG9ydGFsLmMNCkBAIC0yMzMsNyArMjMzLDcgQEAg
c3RhdGljIGludCBxbWFuX3BvcnRhbF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUgPSBkZXYtPm9mX25vZGU7DQogCXN0cnVjdCBx
bV9wb3J0YWxfY29uZmlnICpwY2ZnOw0KIAlzdHJ1Y3QgcmVzb3VyY2UgKmFkZHJfcGh5c1syXTsN
Ci0JaW50IGlycSwgY3B1LCBlcnI7DQorCWludCBpcnEsIGNwdSwgZXJyLCBpOw0KIAl1MzIgdmFs
Ow0KIA0KIAllcnIgPSBxbWFuX2lzX3Byb2JlZCgpOw0KQEAgLTMyNyw2ICszMjcsMjIgQEAgc3Rh
dGljIGludCBxbWFuX3BvcnRhbF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
IAlpZiAoIWNwdV9vbmxpbmUoY3B1KSkNCiAJCXFtYW5fb2ZmbGluZV9jcHUoY3B1KTsNCiANCisJ
aWYgKF9fcW1hbl9wb3J0YWxzX3Byb2JlZCA9PSAxICYmIHFtYW5fcmVxdWlyZXNfY2xlYW51cCgp
KSB7DQorCQkvKg0KKwkJICogUU1hbiB3YXNuJ3QgcmVzZXQgcHJpb3IgdG8gYm9vdCAoS2V4ZWMg
Zm9yIGV4YW1wbGUpDQorCQkgKiBFbXB0eSBhbGwgdGhlIGZyYW1lIHF1ZXVlcyBzbyB0aGV5IGFy
ZSBpbiByZXNldCBzdGF0ZQ0KKwkJICovDQorCQlmb3IgKGkgPSAwOyBpIDwgcW1fZ2V0X2ZxaWRf
bWF4Y250KCk7IGkrKykgew0KKwkJCWVyciA9ICBxbWFuX3NodXRkb3duX2ZxKGkpOw0KKwkJCWlm
IChlcnIpIHsNCisJCQkJZGV2X2VycihkZXYsICJGYWlsZWQgdG8gc2h1dGRvd24gZnJhbWUgcXVl
dWUgJWRcbiIsDQorCQkJCQlpKTsNCisJCQkJZ290byBlcnJfcG9ydGFsX2luaXQ7DQorCQkJfQ0K
KwkJfQ0KKwkJcW1hbl9kb25lX2NsZWFudXAoKTsNCisJfQ0KKw0KIAlyZXR1cm4gMDsNCiANCiBl
cnJfcG9ydGFsX2luaXQ6DQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvZnNsL3FibWFuL3FtYW5f
cHJpdi5oIGIvZHJpdmVycy9zb2MvZnNsL3FibWFuL3FtYW5fcHJpdi5oDQppbmRleCA3NWE4Zjkw
Li5iZjUxYzE3IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9zb2MvZnNsL3FibWFuL3FtYW5fcHJpdi5o
DQorKysgYi9kcml2ZXJzL3NvYy9mc2wvcWJtYW4vcW1hbl9wcml2LmgNCkBAIC0yNjUsMyArMjY1
LDEwIEBAIGV4dGVybiBzdHJ1Y3QgcW1hbl9wb3J0YWwgKmFmZmluZV9wb3J0YWxzW05SX0NQVVNd
Ow0KIGV4dGVybiBzdHJ1Y3QgcW1hbl9wb3J0YWwgKnFtYW5fZG1hX3BvcnRhbDsNCiBjb25zdCBz
dHJ1Y3QgcW1fcG9ydGFsX2NvbmZpZyAqcW1hbl9nZXRfcW1fcG9ydGFsX2NvbmZpZygNCiAJCQkJ
CQlzdHJ1Y3QgcW1hbl9wb3J0YWwgKnBvcnRhbCk7DQorDQordW5zaWduZWQgaW50IHFtX2dldF9m
cWlkX21heGNudCh2b2lkKTsNCisNCitpbnQgcW1hbl9zaHV0ZG93bl9mcSh1MzIgZnFpZCk7DQor
DQoraW50IHFtYW5fcmVxdWlyZXNfY2xlYW51cCh2b2lkKTsNCit2b2lkIHFtYW5fZG9uZV9jbGVh
bnVwKHZvaWQpOw0KLS0gDQoyLjcuNA0KDQo=
