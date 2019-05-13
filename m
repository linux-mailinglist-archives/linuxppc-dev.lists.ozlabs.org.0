Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 246C01B4DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 13:23:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452djB4qLHzDqMG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 21:23:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur04-db3-obe.outbound.protection.outlook.com
 (client-ip=40.107.6.130; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="rBowXL4L"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60130.outbound.protection.outlook.com [40.107.6.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452dWx3KZVzDqFZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:15:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FLwTavdf2f5v45DlX8rnErmRk2XNba9+SN9MfIcFeaE=;
 b=rBowXL4LjvL0wsugji/KKaNyLowGb8DUWweNcuEJbTrJlVIyZ31flCrdaz9H6EJRcu/9ixDtmaaNeBzOKVH0fD2xg2Hbx5GzJkOi4PkVgvY5LcCpIhLqxGF5UU6pqzvd01PwAb0Au6oTQKoaJukTxZFEHobl3DNoP21hXBC6Qjs=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB1950.EURPRD10.PROD.OUTLOOK.COM (52.134.27.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Mon, 13 May 2019 11:15:01 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 11:15:01 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Qiang Zhao
 <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH v3 6/6] soc/fsl/qe: qe.c: fold qe_get_num_of_snums into
 qe_snums_init
Thread-Topic: [PATCH v3 6/6] soc/fsl/qe: qe.c: fold qe_get_num_of_snums into
 qe_snums_init
Thread-Index: AQHVCX0bEKLJFUyWYkaQDXSFkv+0GA==
Date: Mon, 13 May 2019 11:15:01 +0000
Message-ID: <20190513111442.25724-7-rasmus.villemoes@prevas.dk>
References: <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
 <20190513111442.25724-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20190513111442.25724-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0101CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:3:77::32) To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c56ed77-12be-4613-dc27-08d6d7943df2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB1950; 
x-ms-traffictypediagnostic: VI1PR10MB1950:
x-microsoft-antispam-prvs: <VI1PR10MB195082C259840BA14E2193578A0F0@VI1PR10MB1950.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(346002)(39850400004)(366004)(376002)(136003)(396003)(189003)(199004)(6512007)(66066001)(53936002)(107886003)(52116002)(68736007)(256004)(71200400001)(71190400001)(76176011)(6436002)(478600001)(6486002)(1076003)(36756003)(5660300002)(72206003)(74482002)(446003)(81156014)(8676002)(14454004)(99286004)(2501003)(66946007)(66476007)(66556008)(64756008)(66446008)(73956011)(54906003)(11346002)(2616005)(42882007)(476003)(81166006)(44832011)(50226002)(486006)(8936002)(110136005)(8976002)(6116002)(7416002)(316002)(3846002)(2906002)(305945005)(7736002)(186003)(25786009)(102836004)(6506007)(386003)(4326008)(26005)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB1950;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ae+KoThFXl+AYG5NmiAhCz+jvu73ZiG+fI5e2PZj362uALr9ieKBFc7kPC9sPKMqAAt97IM1457BPaeqr1JD2hZJcuR4TsJ8e8f/SqyOCmhXubQ1/+SYTpzQFV0Fj3avEBHDAKOwXLwk4FXfFHA7eZjWycEw4gjZJ0gh1Aky1Ul4HUnUi2MX8/+H0+VQ16LnMPzB5wpI6wLpoIXKgUujMbbxXRGl62cIzXiPuQKfEfVjD8d8jWQMIOj+REd9EHLG3EIuW9TAK9G2ZDOqbepmQoxCiE+7N09T4bQAonsVXsXiVS5/9rqrSgt3IRqDxkRyleRt+lSOZQO8wm2OomWvj5GThA3DOdbXIY8lLLgOUW1pBeR11aqBWHr8I4XcFofRqT2IdNoiMsQk3nAqN2V8733YYOMVlvhEaeHzd45jC4Q=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c56ed77-12be-4613-dc27-08d6d7943df2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 11:15:01.7434 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1950
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
Cc: Mark Rutland <mark.rutland@arm.com>,
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
byB3aGVyZSB3ZSBrbm93IGl0IG1ha2VzIHNlbnNlLg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3Bo
ZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+DQpSZXZpZXdlZC1ieTogUWlhbmcgWmhh
byA8cWlhbmcuemhhb0BueHAuY29tPg0KU2lnbmVkLW9mZi1ieTogUmFzbXVzIFZpbGxlbW9lcyA8
cmFzbXVzLnZpbGxlbW9lc0BwcmV2YXMuZGs+DQotLS0NCiBkcml2ZXJzL3NvYy9mc2wvcWUvcWUu
YyB8IDQ2ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQogMSBmaWxl
IGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcWUuYw0KaW5k
ZXggMWQyNzE4N2IyNTFjLi44NTIwNjBjYWZmMjQgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3NvYy9m
c2wvcWUvcWUuYw0KKysrIGIvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMNCkBAIC0zMDgsMjQgKzMw
OCwzMyBAQCBzdGF0aWMgdm9pZCBxZV9zbnVtc19pbml0KHZvaWQpDQogCWludCBpOw0KIA0KIAli
aXRtYXBfemVybyhzbnVtX3N0YXRlLCBRRV9OVU1fT0ZfU05VTSk7DQorCXFlX251bV9vZl9zbnVt
ID0gMjg7IC8qIFRoZSBkZWZhdWx0IG51bWJlciBvZiBzbnVtIGZvciB0aHJlYWRzIGlzIDI4ICov
DQogCXFlID0gcWVfZ2V0X2RldmljZV9ub2RlKCk7DQogCWlmIChxZSkgew0KIAkJaSA9IG9mX3By
b3BlcnR5X3JlYWRfdmFyaWFibGVfdThfYXJyYXkocWUsICJmc2wscWUtc251bXMiLA0KIAkJCQkJ
CSAgICAgICBzbnVtcywgMSwgUUVfTlVNX09GX1NOVU0pOw0KLQkJb2Zfbm9kZV9wdXQocWUpOw0K
IAkJaWYgKGkgPiAwKSB7DQorCQkJb2Zfbm9kZV9wdXQocWUpOw0KIAkJCXFlX251bV9vZl9zbnVt
ID0gaTsNCiAJCQlyZXR1cm47DQogCQl9DQorCQkvKg0KKwkJICogRmFsbCBiYWNrIHRvIGxlZ2Fj
eSBiaW5kaW5nIG9mIHVzaW5nIHRoZSB2YWx1ZSBvZg0KKwkJICogZnNsLHFlLW51bS1zbnVtcyB0
byBjaG9vc2Ugb25lIG9mIHRoZSBzdGF0aWMgYXJyYXlzDQorCQkgKiBhYm92ZS4NCisJCSAqLw0K
KwkJb2ZfcHJvcGVydHlfcmVhZF91MzIocWUsICJmc2wscWUtbnVtLXNudW1zIiwgJnFlX251bV9v
Zl9zbnVtKTsNCisJCW9mX25vZGVfcHV0KHFlKTsNCiAJfQ0KIA0KLQlxZV9udW1fb2Zfc251bSA9
IHFlX2dldF9udW1fb2Zfc251bXMoKTsNCi0NCi0JaWYgKHFlX251bV9vZl9zbnVtID09IDc2KQ0K
KwlpZiAocWVfbnVtX29mX3NudW0gPT0gNzYpIHsNCiAJCXNudW1faW5pdCA9IHNudW1faW5pdF83
NjsNCi0JZWxzZQ0KKwl9IGVsc2UgaWYgKHFlX251bV9vZl9zbnVtID09IDI4IHx8IHFlX251bV9v
Zl9zbnVtID09IDQ2KSB7DQogCQlzbnVtX2luaXQgPSBzbnVtX2luaXRfNDY7DQotDQorCX0gZWxz
ZSB7DQorCQlwcl9lcnIoIlFFOiB1bnN1cHBvcnRlZCB2YWx1ZSBvZiBmc2wscWUtbnVtLXNudW1z
OiAldVxuIiwgcWVfbnVtX29mX3NudW0pOw0KKwkJcmV0dXJuOw0KKwl9DQogCW1lbWNweShzbnVt
cywgc251bV9pbml0LCBxZV9udW1fb2Zfc251bSk7DQogfQ0KIA0KQEAgLTY0MiwzMCArNjUxLDcg
QEAgRVhQT1JUX1NZTUJPTChxZV9nZXRfbnVtX29mX3Jpc2MpOw0KIA0KIHVuc2lnbmVkIGludCBx
ZV9nZXRfbnVtX29mX3NudW1zKHZvaWQpDQogew0KLQlzdHJ1Y3QgZGV2aWNlX25vZGUgKnFlOw0K
LQlpbnQgc2l6ZTsNCi0JdW5zaWduZWQgaW50IG51bV9vZl9zbnVtczsNCi0JY29uc3QgdTMyICpw
cm9wOw0KLQ0KLQludW1fb2Zfc251bXMgPSAyODsgLyogVGhlIGRlZmF1bHQgbnVtYmVyIG9mIHNu
dW0gZm9yIHRocmVhZHMgaXMgMjggKi8NCi0JcWUgPSBxZV9nZXRfZGV2aWNlX25vZGUoKTsNCi0J
aWYgKCFxZSkNCi0JCXJldHVybiBudW1fb2Zfc251bXM7DQotDQotCXByb3AgPSBvZl9nZXRfcHJv
cGVydHkocWUsICJmc2wscWUtbnVtLXNudW1zIiwgJnNpemUpOw0KLQlpZiAocHJvcCAmJiBzaXpl
ID09IHNpemVvZigqcHJvcCkpIHsNCi0JCW51bV9vZl9zbnVtcyA9ICpwcm9wOw0KLQkJaWYgKChu
dW1fb2Zfc251bXMgPCAyOCkgfHwgKG51bV9vZl9zbnVtcyA+IFFFX05VTV9PRl9TTlVNKSkgew0K
LQkJCS8qIE5vIFFFIGV2ZXIgaGFzIGZld2VyIHRoYW4gMjggU05VTXMgKi8NCi0JCQlwcl9lcnIo
IlFFOiBudW1iZXIgb2Ygc251bSBpcyBpbnZhbGlkXG4iKTsNCi0JCQlvZl9ub2RlX3B1dChxZSk7
DQotCQkJcmV0dXJuIC1FSU5WQUw7DQotCQl9DQotCX0NCi0NCi0Jb2Zfbm9kZV9wdXQocWUpOw0K
LQ0KLQlyZXR1cm4gbnVtX29mX3NudW1zOw0KKwlyZXR1cm4gcWVfbnVtX29mX3NudW07DQogfQ0K
IEVYUE9SVF9TWU1CT0wocWVfZ2V0X251bV9vZl9zbnVtcyk7DQogDQotLSANCjIuMjAuMQ0KDQo=
