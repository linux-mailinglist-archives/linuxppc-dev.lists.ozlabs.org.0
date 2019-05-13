Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E04121BAF1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 18:23:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452mNB3X4nzDqQd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 02:23:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.1.88; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=roy.pledge@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="FZ8bAXQ1"; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10088.outbound.protection.outlook.com [40.107.1.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452m49124CzDqFG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 02:10:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h7tGXlk44VrCEk3lRk5Ndm/wkqw/Ho00CM9OQoJGhKE=;
 b=FZ8bAXQ17fYOQ3m9dD0/kkbG6U8eSIA5/NCe6wvpbEA3MgRCdXqt+9FLn5fn4k4t279AUFhktvORFANZ0HhDh+KYB3Rb2RB9rEibGq5PYSxhUuodhxlRGBU0vX0ptv0ZjefqoBAumM1gkcRzZlhQ8H92CgM0pXEDLWwdtqsRFnA=
Received: from DB6PR0402MB2727.eurprd04.prod.outlook.com (10.172.247.10) by
 DB6PR0402MB2709.eurprd04.prod.outlook.com (10.172.246.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.25; Mon, 13 May 2019 16:09:53 +0000
Received: from DB6PR0402MB2727.eurprd04.prod.outlook.com
 ([fe80::e194:a71a:3497:783e]) by DB6PR0402MB2727.eurprd04.prod.outlook.com
 ([fe80::e194:a71a:3497:783e%8]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 16:09:53 +0000
From: Roy Pledge <roy.pledge@nxp.com>
To: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>
Subject: [PATCH v1 8/8] soc/fsl/qbman: Update device tree with reserved memory
Thread-Topic: [PATCH v1 8/8] soc/fsl/qbman: Update device tree with reserved
 memory
Thread-Index: AQHVCaZMC9A3JXjA7EWmSckX0C+ZXA==
Date: Mon, 13 May 2019 16:09:53 +0000
Message-ID: <1557763756-24118-9-git-send-email-roy.pledge@nxp.com>
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
x-ms-office365-filtering-correlation-id: 895fd7e1-08a3-4e64-1402-08d6d7bd6f49
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DB6PR0402MB2709; 
x-ms-traffictypediagnostic: DB6PR0402MB2709:
x-microsoft-antispam-prvs: <DB6PR0402MB27097A864EC2E63BF980CC67860F0@DB6PR0402MB2709.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(346002)(366004)(376002)(396003)(39860400002)(189003)(199004)(81166006)(81156014)(8936002)(2201001)(110136005)(54906003)(316002)(476003)(2501003)(86362001)(2616005)(50226002)(2906002)(66556008)(64756008)(66446008)(66946007)(66476007)(73956011)(478600001)(3450700001)(6636002)(305945005)(5660300002)(386003)(6506007)(102836004)(43066004)(6486002)(7736002)(26005)(186003)(6436002)(66066001)(4326008)(446003)(36756003)(99286004)(486006)(25786009)(11346002)(76176011)(52116002)(53936002)(44832011)(6512007)(8676002)(14454004)(68736007)(71200400001)(256004)(3846002)(71190400001)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0402MB2709;
 H:DB6PR0402MB2727.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JKPa05CMRwVDQ/WgwqE15na9WAqApSNqjZ+MaOE0u0kr6I4E9p9x0A9JCJbO0CZ+Dg1VvJxdv51Uhx5MKx5wQBK50MU3112XCfrIAfEr5LVEmC0HZxp4MQGePlNu+fx6HjEi/wsXCvHOgtZNTV1jNbyWlk04iASCI1v2OOCEF5q6IYibItfFwSmQ0M5Qxn1Djz4dmrREByf7CTaS4jtzKw4Zb6dXXouGgP8daITzImlJaBeOtjtp6/2jcRxV2qDnehkv0VbTZYMpdhHBgEzvdZ56qUTl5DEkSiENFHpXhVE4Uo4eZ0uX7SQ9lk7qC+yN5/udGzGAeQMWOdZQeXx8TW8L7IjknpKPl8qTiMbnXGU9c6/q2ad2ZAUxbesjbnsIodICVkk3+eaiHP4OC//rURKRGelTzkyjIVoezV+DCmo=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 895fd7e1-08a3-4e64-1402-08d6d7bd6f49
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 16:09:53.8227 (UTC)
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

V2hlbiB1c2luZyB0aGUgcmVzZXJ2ZWQgbWVtb3J5IG5vZGUgaW4gdGhlIGRldmljZSB0cmVlIHRo
ZXJlIGFyZQ0KdHdvIG9wdGlvbnMgLSBkeW5hbWljIG9yIHN0YXRpYy4gSWYgYSBkeW5hbWljIGFs
bG9jYXRpb24gd2FzDQpzZWxlY3RlZCAod2hlcmUgdGhlIGtlcm5lbCBzZWxlY3RzIHRoZSBhZGRy
ZXNzIGZvciB0aGUgYWxsb2NhdGlvbikNCmNvbnZlcnQgaXQgdG8gYSBzdGF0aWMgYWxsb2NhdGlv
biBieSBpbnNlcnRpbmcgdGhlIHJlZyBwcm9wZXJ0eS4NClRoaXMgd2lsbCBlbnN1cmUgdGhlIHNh
bWUgbWVtb3J5IGlzIHJldXNlZCBhZnRlciBhIGtleGVjKCkNCg0KU2lnbmVkLW9mZi1ieTogUm95
IFBsZWRnZSA8cm95LnBsZWRnZUBueHAuY29tPg0KLS0tDQogZHJpdmVycy9zb2MvZnNsL3FibWFu
L2RwYWFfc3lzLmMgfCA1OCArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
DQogMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQ0KDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvZnNsL3FibWFuL2RwYWFfc3lzLmMgYi9kcml2ZXJzL3Nv
Yy9mc2wvcWJtYW4vZHBhYV9zeXMuYw0KaW5kZXggMGI5MDFhOC4uOWRkOGJiNSAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvc29jL2ZzbC9xYm1hbi9kcGFhX3N5cy5jDQorKysgYi9kcml2ZXJzL3NvYy9m
c2wvcWJtYW4vZHBhYV9zeXMuYw0KQEAgLTM3LDQxICszNyw1MyBAQA0KIGludCBxYm1hbl9pbml0
X3ByaXZhdGVfbWVtKHN0cnVjdCBkZXZpY2UgKmRldiwgaW50IGlkeCwgZG1hX2FkZHJfdCAqYWRk
ciwNCiAJCQkJc2l6ZV90ICpzaXplKQ0KIHsNCi0JaW50IHJldDsNCiAJc3RydWN0IGRldmljZV9u
b2RlICptZW1fbm9kZTsNCi0JdTY0IHNpemU2NDsNCiAJc3RydWN0IHJlc2VydmVkX21lbSAqcm1l
bTsNCisJc3RydWN0IHByb3BlcnR5ICpwcm9wOw0KKwlpbnQgbGVuLCBlcnI7DQorCV9fYmUzMiAq
cmVzX2FycmF5Ow0KIA0KLQlyZXQgPSBvZl9yZXNlcnZlZF9tZW1fZGV2aWNlX2luaXRfYnlfaWR4
KGRldiwgZGV2LT5vZl9ub2RlLCBpZHgpOw0KLQlpZiAocmV0KSB7DQotCQlkZXZfZXJyKGRldiwN
Ci0JCQkib2ZfcmVzZXJ2ZWRfbWVtX2RldmljZV9pbml0X2J5X2lkeCglZCkgZmFpbGVkIDB4JXhc
biIsDQotCQkJaWR4LCByZXQpOw0KLQkJcmV0dXJuIC1FTk9ERVY7DQotCX0NCiAJbWVtX25vZGUg
PSBvZl9wYXJzZV9waGFuZGxlKGRldi0+b2Zfbm9kZSwgIm1lbW9yeS1yZWdpb24iLCBpZHgpOw0K
LQlpZiAobWVtX25vZGUpIHsNCi0JCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTY0KG1lbV9ub2Rl
LCAic2l6ZSIsICZzaXplNjQpOw0KLQkJaWYgKHJldCkgew0KLQkJCWRldl9lcnIoZGV2LCAib2Zf
YWRkcmVzc190b19yZXNvdXJjZSBmYWlscyAweCV4XG4iLA0KLQkJCSAgICAgICAgcmV0KTsNCi0J
CQlyZXR1cm4gLUVOT0RFVjsNCi0JCX0NCi0JCSpzaXplID0gc2l6ZTY0Ow0KLQl9IGVsc2Ugew0K
KwlpZiAoIW1lbV9ub2RlKSB7DQogCQlkZXZfZXJyKGRldiwgIk5vIG1lbW9yeS1yZWdpb24gZm91
bmQgZm9yIGluZGV4ICVkXG4iLCBpZHgpOw0KIAkJcmV0dXJuIC1FTk9ERVY7DQogCX0NCiANCiAJ
cm1lbSA9IG9mX3Jlc2VydmVkX21lbV9sb29rdXAobWVtX25vZGUpOw0KKwlpZiAoIXJtZW0pIHsN
CisJCWRldl9lcnIoZGV2LCAib2ZfcmVzZXJ2ZWRfbWVtX2xvb2t1cCgpIHJldHVybmVkIE5VTExc
biIpOw0KKwkJcmV0dXJuIC1FTk9ERVY7DQorCX0NCiAJKmFkZHIgPSBybWVtLT5iYXNlOw0KKwkq
c2l6ZSA9IHJtZW0tPnNpemU7DQogDQogCS8qDQotCSAqIERpc2Fzc29jaWF0ZSB0aGUgcmVzZXJ2
ZWQgbWVtb3J5IGFyZWEgZnJvbSB0aGUgZGV2aWNlDQotCSAqIGJlY2F1c2UgYSBkZXZpY2UgY2Fu
IG9ubHkgaGF2ZSBvbmUgRE1BIG1lbW9yeSBhcmVhLiBUaGlzDQotCSAqIHNob3VsZCBiZSBmaW5l
IHNpbmNlIHRoZSBtZW1vcnkgaXMgYWxsb2NhdGVkIGFuZCBpbml0aWFsaXplZA0KLQkgKiBhbmQg
b25seSBldmVyIGFjY2Vzc2VkIGJ5IHRoZSBRQk1hbiBkZXZpY2UgZnJvbSBub3cgb24NCisJICog
Q2hlY2sgaWYgdGhlIHJlZyBwcm9wZXJ0eSBleGlzdHMgLSBpZiBub3QgaW5zZXJ0IHRoZSBub2Rl
DQorCSAqIHNvIHVwb24ga2V4ZWMoKSB0aGUgc2FtZSBtZW1vcnkgcmVnaW9uIGFkZHJlc3Mgd2ls
bCBiZSBwcmVzZXJ2ZWQuDQorCSAqIFRoaXMgaXMgbmVlZGVkIGJlY2F1c2UgUUJNYW4gSFcgZG9l
cyBub3QgYWxsb3cgdGhlIGJhc2UgYWRkcmVzcy8NCisJICogc2l6ZSB0byBiZSBtb2RpZmllZCBv
bmNlIHNldC4NCiAJICovDQotCW9mX3Jlc2VydmVkX21lbV9kZXZpY2VfcmVsZWFzZShkZXYpOw0K
Kwlwcm9wID0gb2ZfZmluZF9wcm9wZXJ0eShtZW1fbm9kZSwgInJlZyIsICZsZW4pOw0KKwlpZiAo
IXByb3ApIHsNCisJCXByb3AgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKnByb3ApLCBHRlBf
S0VSTkVMKTsNCisJCWlmICghcHJvcCkNCisJCQlyZXR1cm4gLUVOT01FTTsNCisJCXByb3AtPnZh
bHVlID0gcmVzX2FycmF5ID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKF9fYmUzMikgKiA0LA0K
KwkJCQkJCSAgICAgICBHRlBfS0VSTkVMKTsNCisJCWlmICghcHJvcC0+dmFsdWUpDQorCQkJcmV0
dXJuIC1FTk9NRU07DQorCQlyZXNfYXJyYXlbMF0gPSBjcHVfdG9fYmUzMih1cHBlcl8zMl9iaXRz
KCphZGRyKSk7DQorCQlyZXNfYXJyYXlbMV0gPSBjcHVfdG9fYmUzMihsb3dlcl8zMl9iaXRzKCph
ZGRyKSk7DQorCQlyZXNfYXJyYXlbMl0gPSBjcHVfdG9fYmUzMih1cHBlcl8zMl9iaXRzKCpzaXpl
KSk7DQorCQlyZXNfYXJyYXlbM10gPSBjcHVfdG9fYmUzMihsb3dlcl8zMl9iaXRzKCpzaXplKSk7
DQorCQlwcm9wLT5sZW5ndGggPSBzaXplb2YoX19iZTMyKSAqIDQ7DQorCQlwcm9wLT5uYW1lID0g
ZGV2bV9rc3RyZHVwKGRldiwgInJlZyIsIEdGUF9LRVJORUwpOw0KKwkJaWYgKCFwcm9wLT5uYW1l
KQ0KKwkJCXJldHVybiAtRU5PTUVNOw0KKwkJZXJyID0gb2ZfYWRkX3Byb3BlcnR5KG1lbV9ub2Rl
LCBwcm9wKTsNCisJCWlmIChlcnIpDQorCQkJcmV0dXJuIGVycjsNCisJfQ0KKw0KIAlyZXR1cm4g
MDsNCiB9DQotLSANCjIuNy40DQoNCg==
