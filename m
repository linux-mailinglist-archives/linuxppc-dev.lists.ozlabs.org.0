Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF731BAD2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 18:16:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452mC64cJTzDqDy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 02:16:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.1.88; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="TGqm8bWZ"; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10088.outbound.protection.outlook.com [40.107.1.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452m441P5PzDqDP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 02:09:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqmS1Wvr0SSsg26E2C3Ige4Jd8rgaFjihegp+OwQBfw=;
 b=TGqm8bWZNhxMp9eFvIS5LlWUwhjIdpIcyjUVgsgcIWGoRCUB7KInjHNc8gi2Pcm2Z0gjC/tYlw2RG2UnKJME8r1bdPfQeQjSITSfJrg7xVQngCfl/tsCNSAVvPNxiQsdPIlKAwRcKfSQaaWrMSIX483yjomvsJkeoAZjeThT2Iw=
Received: from DB6PR0402MB2727.eurprd04.prod.outlook.com (10.172.247.10) by
 DB6PR0402MB2709.eurprd04.prod.outlook.com (10.172.246.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Mon, 13 May 2019 16:09:42 +0000
Received: from DB6PR0402MB2727.eurprd04.prod.outlook.com
 ([fe80::e194:a71a:3497:783e]) by DB6PR0402MB2727.eurprd04.prod.outlook.com
 ([fe80::e194:a71a:3497:783e%8]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 16:09:42 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: [PATCH v1 2/8] soc/fsl/qbman: Cleanup buffer pools if BMan was
 initialized prior to bootup
Thread-Topic: [PATCH v1 2/8] soc/fsl/qbman: Cleanup buffer pools if BMan was
 initialized prior to bootup
Thread-Index: AQHVCaZGBsQ22UU/s06XbqnO82VgUw==
Date: Mon, 13 May 2019 16:09:42 +0000
Message-ID: <1557763756-24118-3-git-send-email-roy.pledge@nxp.com>
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
x-ms-office365-filtering-correlation-id: a1a8d328-b6ea-43ff-7f49-08d6d7bd68a3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DB6PR0402MB2709; 
x-ms-traffictypediagnostic: DB6PR0402MB2709:
x-microsoft-antispam-prvs: <DB6PR0402MB27093707016C3CD8947938A2860F0@DB6PR0402MB2709.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:494;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(366004)(376002)(396003)(39860400002)(189003)(199004)(81166006)(81156014)(8936002)(2201001)(110136005)(54906003)(316002)(476003)(2501003)(86362001)(2616005)(50226002)(2906002)(66556008)(64756008)(66446008)(66946007)(66476007)(73956011)(478600001)(3450700001)(6636002)(305945005)(5660300002)(386003)(6506007)(102836004)(43066004)(6486002)(7736002)(26005)(186003)(6436002)(66066001)(4326008)(446003)(36756003)(99286004)(486006)(25786009)(11346002)(76176011)(52116002)(53936002)(44832011)(6512007)(8676002)(14454004)(68736007)(71200400001)(256004)(3846002)(71190400001)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0402MB2709;
 H:DB6PR0402MB2727.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZrWWF91ltjzetW/2WDmd3MiZDhPthghVvzQfz6tLGITy1UEo9n+nuSTi3Dp4TSo9UMXT6InpYWaEBBsXVjNEoWPDOUcDfBCHpOiJo9S8IbQf/GMrR+THC3ywO9YoBAZqM/nakmXNrMEENB4gYJdwPNvlCgEjj4t+nvv8LTKFj6/LPnXGvwjRfhLx3U1H7nxeCfufcl5+Cm0GqcA4u11yxORC9bGqC8+5wIS1mmtgJ0JqIIaCWaAnnac26mpPq+K4u2kDQ2DLx3K0uGu80coqwQUUM1hrMvk9nGJv6LL5Z1iUakATj3SUW2S/iTu9Fp9QVke314xOlc+CmVWYYH2jwK6GEuODGQ1N9Oyb+/LbzbeANB9m/bkGMeZxIu53kVvfCsQaO8XHW6vdqCeYZUaniu7Jpl58pUJstnHaq6fNrgY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a8d328-b6ea-43ff-7f49-08d6d7bd68a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 16:09:42.7353 (UTC)
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

Q2xlYW4gdGhlIEJNYW4gYnVmZmVyIHBvb2xzIGlmIHRoZSBkZXZpY2UgaGFkIGJlZW4gaW5pdGlh
bGl6ZWQNCnByZXZpb3VzbHkuICBUaGlzIHdpbGwgZW5zdXJlIGEgY29uc2lzdGVudCBzdGF0ZSBp
ZiB0aGUga2VybmVsDQp3YXMgc29mdCByZXN0YXJ0ZWQgKGtleGVjIGZvciBleGFtcGxlKQ0KDQpT
aWduZWQtb2ZmLWJ5OiBSb3kgUGxlZGdlIDxyb3kucGxlZGdlQG54cC5jb20+DQotLS0NCiBkcml2
ZXJzL3NvYy9mc2wvcWJtYW4vYm1hbi5jICAgICAgICB8IDE3ICsrKysrKysrKy0tLS0tLS0tDQog
ZHJpdmVycy9zb2MvZnNsL3FibWFuL2JtYW5fY2Nzci5jICAgfCAxMCArKysrKysrKysrDQogZHJp
dmVycy9zb2MvZnNsL3FibWFuL2JtYW5fcG9ydGFsLmMgfCAxOCArKysrKysrKysrKysrKysrKy0N
CiBkcml2ZXJzL3NvYy9mc2wvcWJtYW4vYm1hbl9wcml2LmggICB8ICA1ICsrKysrDQogNCBmaWxl
cyBjaGFuZ2VkLCA0MSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zb2MvZnNsL3FibWFuL2JtYW4uYyBiL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9i
bWFuLmMNCmluZGV4IGY4NGFiNTkuLmY0ZmI1MjcgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3NvYy9m
c2wvcWJtYW4vYm1hbi5jDQorKysgYi9kcml2ZXJzL3NvYy9mc2wvcWJtYW4vYm1hbi5jDQpAQCAt
NjM1LDMwICs2MzUsMzEgQEAgaW50IGJtYW5fcF9pcnFzb3VyY2VfYWRkKHN0cnVjdCBibWFuX3Bv
cnRhbCAqcCwgdTMyIGJpdHMpDQogCXJldHVybiAwOw0KIH0NCiANCi1zdGF0aWMgaW50IGJtX3No
dXRkb3duX3Bvb2wodTMyIGJwaWQpDQoraW50IGJtX3NodXRkb3duX3Bvb2wodTMyIGJwaWQpDQog
ew0KKwlpbnQgZXJyID0gMDsNCiAJc3RydWN0IGJtX21jX2NvbW1hbmQgKmJtX2NtZDsNCiAJdW5p
b24gYm1fbWNfcmVzdWx0ICpibV9yZXM7DQogDQorDQorCXN0cnVjdCBibWFuX3BvcnRhbCAqcCA9
IGdldF9hZmZpbmVfcG9ydGFsKCk7DQogCXdoaWxlICgxKSB7DQotCQlzdHJ1Y3QgYm1hbl9wb3J0
YWwgKnAgPSBnZXRfYWZmaW5lX3BvcnRhbCgpOw0KIAkJLyogQWNxdWlyZSBidWZmZXJzIHVudGls
IGVtcHR5ICovDQogCQlibV9jbWQgPSBibV9tY19zdGFydCgmcC0+cCk7DQogCQlibV9jbWQtPmJw
aWQgPSBicGlkOw0KIAkJYm1fbWNfY29tbWl0KCZwLT5wLCBCTV9NQ0NfVkVSQl9DTURfQUNRVUlS
RSB8IDEpOw0KIAkJaWYgKCFibV9tY19yZXN1bHRfdGltZW91dCgmcC0+cCwgJmJtX3JlcykpIHsN
Ci0JCQlwdXRfYWZmaW5lX3BvcnRhbCgpOw0KIAkJCXByX2NyaXQoIkJNYW4gQWNxdWlyZSBDb21t
YW5kIHRpbWVkb3V0XG4iKTsNCi0JCQlyZXR1cm4gLUVUSU1FRE9VVDsNCisJCQllcnIgPSAtRVRJ
TUVET1VUOw0KKwkJCWdvdG8gZG9uZTsNCiAJCX0NCiAJCWlmICghKGJtX3Jlcy0+dmVyYiAmIEJN
X01DUl9WRVJCX0FDUVVJUkVfQlVGQ09VTlQpKSB7DQotCQkJcHV0X2FmZmluZV9wb3J0YWwoKTsN
CiAJCQkvKiBQb29sIGlzIGVtcHR5ICovDQotCQkJcmV0dXJuIDA7DQorCQkJZ290byBkb25lOw0K
IAkJfQ0KLQkJcHV0X2FmZmluZV9wb3J0YWwoKTsNCiAJfQ0KLQ0KK2RvbmU6DQorCXB1dF9hZmZp
bmVfcG9ydGFsKCk7DQogCXJldHVybiAwOw0KIH0NCiANCmRpZmYgLS1naXQgYS9kcml2ZXJzL3Nv
Yy9mc2wvcWJtYW4vYm1hbl9jY3NyLmMgYi9kcml2ZXJzL3NvYy9mc2wvcWJtYW4vYm1hbl9jY3Ny
LmMNCmluZGV4IGRjNmQ3ZTUuLmNiMjRhMDggMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3NvYy9mc2wv
cWJtYW4vYm1hbl9jY3NyLmMNCisrKyBiL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9ibWFuX2Njc3Iu
Yw0KQEAgLTE5NSw2ICsxOTUsMTYgQEAgaW50IGJtYW5faXNfcHJvYmVkKHZvaWQpDQogfQ0KIEVY
UE9SVF9TWU1CT0xfR1BMKGJtYW5faXNfcHJvYmVkKTsNCiANCitpbnQgYm1hbl9yZXF1aXJlc19j
bGVhbnVwKHZvaWQpDQorew0KKwlyZXR1cm4gX19ibWFuX3JlcXVpcmVzX2NsZWFudXA7DQorfQ0K
Kw0KK3ZvaWQgYm1hbl9kb25lX2NsZWFudXAodm9pZCkNCit7DQorCV9fYm1hbl9yZXF1aXJlc19j
bGVhbnVwID0gMDsNCit9DQorDQogc3RhdGljIGludCBmc2xfYm1hbl9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KIHsNCiAJaW50IHJldCwgZXJyX2lycTsNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3NvYy9mc2wvcWJtYW4vYm1hbl9wb3J0YWwuYyBiL2RyaXZlcnMvc29jL2ZzbC9x
Ym1hbi9ibWFuX3BvcnRhbC5jDQppbmRleCA3ODE5YmMyLi42YzFhNzM0IDEwMDY0NA0KLS0tIGEv
ZHJpdmVycy9zb2MvZnNsL3FibWFuL2JtYW5fcG9ydGFsLmMNCisrKyBiL2RyaXZlcnMvc29jL2Zz
bC9xYm1hbi9ibWFuX3BvcnRhbC5jDQpAQCAtMTAwLDcgKzEwMCw3IEBAIHN0YXRpYyBpbnQgYm1h
bl9wb3J0YWxfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAJc3RydWN0IGRl
dmljZV9ub2RlICpub2RlID0gZGV2LT5vZl9ub2RlOw0KIAlzdHJ1Y3QgYm1fcG9ydGFsX2NvbmZp
ZyAqcGNmZzsNCiAJc3RydWN0IHJlc291cmNlICphZGRyX3BoeXNbMl07DQotCWludCBpcnEsIGNw
dSwgZXJyOw0KKwlpbnQgaXJxLCBjcHUsIGVyciwgaTsNCiANCiAJZXJyID0gYm1hbl9pc19wcm9i
ZWQoKTsNCiAJaWYgKCFlcnIpDQpAQCAtMTgwLDYgKzE4MCwyMiBAQCBzdGF0aWMgaW50IGJtYW5f
cG9ydGFsX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQogCWlmICghY3B1X29u
bGluZShjcHUpKQ0KIAkJYm1hbl9vZmZsaW5lX2NwdShjcHUpOw0KIA0KKwlpZiAoX19ibWFuX3Bv
cnRhbHNfcHJvYmVkID09IDEgJiYgYm1hbl9yZXF1aXJlc19jbGVhbnVwKCkpIHsNCisJCS8qDQor
CQkgKiBCTWFuIHdhc24ndCByZXNldCBwcmlvciB0byBib290IChLZXhlYyBmb3IgZXhhbXBsZSkN
CisJCSAqIEVtcHR5IGFsbCB0aGUgYnVmZmVyIHBvb2xzIHNvIHRoZXkgYXJlIGluIHJlc2V0IHN0
YXRlDQorCQkgKi8NCisJCWZvciAoaSA9IDA7IGkgPCBCTV9QT09MX01BWDsgaSsrKSB7DQorCQkJ
ZXJyID0gIGJtX3NodXRkb3duX3Bvb2woaSk7DQorCQkJaWYgKGVycikgew0KKwkJCQlkZXZfZXJy
KGRldiwgIkZhaWxlZCB0byBzaHV0ZG93biBicG9vbCAlZFxuIiwNCisJCQkJCWkpOw0KKwkJCQln
b3RvIGVycl9wb3J0YWxfaW5pdDsNCisJCQl9DQorCQl9DQorCQlibWFuX2RvbmVfY2xlYW51cCgp
Ow0KKwl9DQorDQogCXJldHVybiAwOw0KIA0KIGVycl9wb3J0YWxfaW5pdDoNCmRpZmYgLS1naXQg
YS9kcml2ZXJzL3NvYy9mc2wvcWJtYW4vYm1hbl9wcml2LmggYi9kcml2ZXJzL3NvYy9mc2wvcWJt
YW4vYm1hbl9wcml2LmgNCmluZGV4IDc1MWNlOTAuLmFhMzk4MWUgMTAwNjQ0DQotLS0gYS9kcml2
ZXJzL3NvYy9mc2wvcWJtYW4vYm1hbl9wcml2LmgNCisrKyBiL2RyaXZlcnMvc29jL2ZzbC9xYm1h
bi9ibWFuX3ByaXYuaA0KQEAgLTc2LDMgKzc2LDggQEAgaW50IGJtYW5fcF9pcnFzb3VyY2VfYWRk
KHN0cnVjdCBibWFuX3BvcnRhbCAqcCwgdTMyIGJpdHMpOw0KIA0KIGNvbnN0IHN0cnVjdCBibV9w
b3J0YWxfY29uZmlnICoNCiBibWFuX2dldF9ibV9wb3J0YWxfY29uZmlnKGNvbnN0IHN0cnVjdCBi
bWFuX3BvcnRhbCAqcG9ydGFsKTsNCisNCitpbnQgYm1hbl9yZXF1aXJlc19jbGVhbnVwKHZvaWQp
Ow0KK3ZvaWQgYm1hbl9kb25lX2NsZWFudXAodm9pZCk7DQorDQoraW50IGJtX3NodXRkb3duX3Bv
b2wodTMyIGJwaWQpOw0KLS0gDQoyLjcuNA0KDQo=
