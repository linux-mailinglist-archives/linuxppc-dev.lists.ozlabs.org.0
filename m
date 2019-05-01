Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E9510661
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 11:32:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vCph4kpHzDqWH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 19:32:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur02-ve1-obe.outbound.protection.outlook.com
 (client-ip=40.107.2.131; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="NOoN2kcQ"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20131.outbound.protection.outlook.com [40.107.2.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vClH3zvkzDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 19:29:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oV0yfpe0rfM5Tggrn/ZXZXpWsTCnh7Qw0XjpUhuyORw=;
 b=NOoN2kcQu1pS5IUYGvD3ZkkDQA3CpBIqGce8gkYWIm4TWJARfkBVdSDRgb+Q7lczVMkKvmM4C3H2te6Tgn9qo1KkonKua4ZQo2BZOXNL6jZlc1fKWv5COtWwgrgyBV8NL/tYsF5RJVeFb3cNUIBz7xqwJi2Rq91SkbYwJlGT0Rw=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB2143.EURPRD10.PROD.OUTLOOK.COM (20.177.60.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Wed, 1 May 2019 09:29:05 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1856.008; Wed, 1 May 2019
 09:29:05 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Qiang Zhao
 <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH v2 2/6] soc/fsl/qe: qe.c: reduce static memory footprint by
 1.7K
Thread-Topic: [PATCH v2 2/6] soc/fsl/qe: qe.c: reduce static memory footprint
 by 1.7K
Thread-Index: AQHVAABR1o7sDOpAS063f+anh88+2w==
Date: Wed, 1 May 2019 09:29:05 +0000
Message-ID: <20190501092841.9026-3-rasmus.villemoes@prevas.dk>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0102CA0052.eurprd01.prod.exchangelabs.com
 (2603:10a6:7:7d::29) To VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e3::20)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Rasmus.Villemoes@prevas.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [81.216.59.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4073b50e-fb21-4e5e-2995-08d6ce17740b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB2143; 
x-ms-traffictypediagnostic: VI1PR10MB2143:
x-microsoft-antispam-prvs: <VI1PR10MB21438CDE63974442D36D2AD88A3B0@VI1PR10MB2143.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(39850400004)(346002)(396003)(366004)(189003)(199004)(14454004)(81166006)(110136005)(54906003)(26005)(68736007)(8676002)(6512007)(4326008)(8976002)(486006)(74482002)(71200400001)(2906002)(7416002)(6486002)(72206003)(186003)(316002)(478600001)(2501003)(36756003)(6436002)(71190400001)(25786009)(1076003)(6506007)(2616005)(305945005)(3846002)(44832011)(256004)(11346002)(6116002)(5660300002)(8936002)(14444005)(446003)(476003)(50226002)(76176011)(42882007)(7736002)(99286004)(66446008)(64756008)(53936002)(52116002)(107886003)(386003)(66066001)(66946007)(66476007)(102836004)(66556008)(81156014)(73956011)(2004002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB2143;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8aPYwuYDGTZIsvYUHdjgWWVWzHF1fVq6wMf/0Xgurng7JuicD4dYp8s4cXZ+v4zW00YHr/BXwbowRlgJCbEaBa8Wgm3ihhKWuX/qoBfqlV2LVkqKpRkyR41ZyUkKRPmP0xlXEqWhh60bkfDM1L7fG2uIJsWcAmn8t5ugnxF9DkB87rk1vRZvZg9GjtV+KmRRaM6g4++BFDwbcIOnVbX/Z8IKuOkF7w02mq3FMkqb/9nZbvZ32M0t68u5j6/qJGljnknDlTs3/f66/2jELDfIXZVNJWtdMeQDuYyZ5hlK17cGqRDoTNbXhXZhais3sl7+FEhxncNu3Q8kkpAzVF0Mcre3a2aa3Ts2LyNVH2AdUeiuwXE6KuFuqMhEBtxT8kYBDyxpuo3cdS5ftArJsxlpPOgnjZjw/KzvXpfbFN06boQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 4073b50e-fb21-4e5e-2995-08d6ce17740b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 09:29:05.0655 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB2143
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

VGhlIGN1cnJlbnQgYXJyYXkgb2Ygc3RydWN0IHFlX3NudW0gdXNlIDI1Nio0IGJ5dGVzIGZvciBq
dXN0IGtlZXBpbmcNCnRyYWNrIG9mIHRoZSBmcmVlL3VzZWQgc3RhdGUgb2YgZWFjaCBpbmRleCwg
YW5kIHRoZSBzdHJ1Y3QgbGF5b3V0DQptZWFucyB0aGVyZSdzIGFub3RoZXIgNzY4IGJ5dGVzIG9m
IHBhZGRpbmcuIElmIHdlIGp1c3QgdW56aXAgdGhhdA0Kc3RydWN0dXJlLCB0aGUgYXJyYXkgb2Yg
c251bSB2YWx1ZXMganVzdCB1c2UgMjU2IGJ5dGVzLCB3aGlsZSB0aGUNCmZyZWUvaW51c2Ugc3Rh
dGUgY2FuIGJlIHRyYWNrZWQgaW4gYSAzMiBieXRlIGJpdG1hcC4NCg0KU28gdGhpcyByZWR1Y2Vz
IHRoZSAuZGF0YSBmb290cHJpbnQgYnkgMTc2MCBieXRlcy4gSXQgYWxzbyBzZXJ2ZXMgYXMNCnBy
ZXBhcmF0aW9uIGZvciBpbnRyb2R1Y2luZyBhbm90aGVyIERUIGJpbmRpbmcgZm9yIHNwZWNpZnlp
bmcgdGhlIHNudW0NCnZhbHVlcy4NCg0KU2lnbmVkLW9mZi1ieTogUmFzbXVzIFZpbGxlbW9lcyA8
cmFzbXVzLnZpbGxlbW9lc0BwcmV2YXMuZGs+DQotLS0NCiBkcml2ZXJzL3NvYy9mc2wvcWUvcWUu
YyB8IDQzICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQogMSBmaWxl
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMxIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcWUuYw0KaW5k
ZXggODU1MzczZGViNzQ2Li4zMDNhYTI5Y2IyN2QgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3NvYy9m
c2wvcWUvcWUuYw0KKysrIGIvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMNCkBAIC0xNCw2ICsxNCw3
IEBADQogICogRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uOyAgZWl0aGVyIHZlcnNpb24gMiBvZiB0
aGUgIExpY2Vuc2UsIG9yIChhdCB5b3VyDQogICogb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4N
CiAgKi8NCisjaW5jbHVkZSA8bGludXgvYml0bWFwLmg+DQogI2luY2x1ZGUgPGxpbnV4L2Vycm5v
Lmg+DQogI2luY2x1ZGUgPGxpbnV4L3NjaGVkLmg+DQogI2luY2x1ZGUgPGxpbnV4L2tlcm5lbC5o
Pg0KQEAgLTQzLDI1ICs0NCwxNCBAQCBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKHFlX2xvY2spOw0K
IERFRklORV9TUElOTE9DSyhjbXhnY3JfbG9jayk7DQogRVhQT1JUX1NZTUJPTChjbXhnY3JfbG9j
ayk7DQogDQotLyogUUUgc251bSBzdGF0ZSAqLw0KLWVudW0gcWVfc251bV9zdGF0ZSB7DQotCVFF
X1NOVU1fU1RBVEVfVVNFRCwNCi0JUUVfU05VTV9TVEFURV9GUkVFDQotfTsNCi0NCi0vKiBRRSBz
bnVtICovDQotc3RydWN0IHFlX3NudW0gew0KLQl1OCBudW07DQotCWVudW0gcWVfc251bV9zdGF0
ZSBzdGF0ZTsNCi19Ow0KLQ0KIC8qIFdlIGFsbG9jYXRlIHRoaXMgaGVyZSBiZWNhdXNlIGl0IGlz
IHVzZWQgYWxtb3N0IGV4Y2x1c2l2ZWx5IGZvcg0KICAqIHRoZSBjb21tdW5pY2F0aW9uIHByb2Nl
c3NvciBkZXZpY2VzLg0KICAqLw0KIHN0cnVjdCBxZV9pbW1hcCBfX2lvbWVtICpxZV9pbW1yOw0K
IEVYUE9SVF9TWU1CT0wocWVfaW1tcik7DQogDQotc3RhdGljIHN0cnVjdCBxZV9zbnVtIHNudW1z
W1FFX05VTV9PRl9TTlVNXTsJLyogRHluYW1pY2FsbHkgYWxsb2NhdGVkIFNOVU1zICovDQorc3Rh
dGljIHU4IHNudW1zW1FFX05VTV9PRl9TTlVNXTsJLyogRHluYW1pY2FsbHkgYWxsb2NhdGVkIFNO
VU1zICovDQorc3RhdGljIERFQ0xBUkVfQklUTUFQKHNudW1fc3RhdGUsIFFFX05VTV9PRl9TTlVN
KTsNCiBzdGF0aWMgdW5zaWduZWQgaW50IHFlX251bV9vZl9zbnVtOw0KIA0KIHN0YXRpYyBwaHlz
X2FkZHJfdCBxZWJhc2UgPSAtMTsNCkBAIC0zMTUsMTAgKzMwNSw4IEBAIHN0YXRpYyB2b2lkIHFl
X3NudW1zX2luaXQodm9pZCkNCiAJZWxzZQ0KIAkJc251bV9pbml0ID0gc251bV9pbml0XzQ2Ow0K
IA0KLQlmb3IgKGkgPSAwOyBpIDwgcWVfbnVtX29mX3NudW07IGkrKykgew0KLQkJc251bXNbaV0u
bnVtID0gc251bV9pbml0W2ldOw0KLQkJc251bXNbaV0uc3RhdGUgPSBRRV9TTlVNX1NUQVRFX0ZS
RUU7DQotCX0NCisJYml0bWFwX3plcm8oc251bV9zdGF0ZSwgUUVfTlVNX09GX1NOVU0pOw0KKwlt
ZW1jcHkoc251bXMsIHNudW1faW5pdCwgcWVfbnVtX29mX3NudW0pOw0KIH0NCiANCiBpbnQgcWVf
Z2V0X3NudW0odm9pZCkNCkBAIC0zMjgsMTIgKzMxNiwxMCBAQCBpbnQgcWVfZ2V0X3NudW0odm9p
ZCkNCiAJaW50IGk7DQogDQogCXNwaW5fbG9ja19pcnFzYXZlKCZxZV9sb2NrLCBmbGFncyk7DQot
CWZvciAoaSA9IDA7IGkgPCBxZV9udW1fb2Zfc251bTsgaSsrKSB7DQotCQlpZiAoc251bXNbaV0u
c3RhdGUgPT0gUUVfU05VTV9TVEFURV9GUkVFKSB7DQotCQkJc251bXNbaV0uc3RhdGUgPSBRRV9T
TlVNX1NUQVRFX1VTRUQ7DQotCQkJc251bSA9IHNudW1zW2ldLm51bTsNCi0JCQlicmVhazsNCi0J
CX0NCisJaSA9IGZpbmRfZmlyc3RfemVyb19iaXQoc251bV9zdGF0ZSwgcWVfbnVtX29mX3NudW0p
Ow0KKwlpZiAoaSA8IHFlX251bV9vZl9zbnVtKSB7DQorCQlzZXRfYml0KGksIHNudW1fc3RhdGUp
Ow0KKwkJc251bSA9IHNudW1zW2ldOw0KIAl9DQogCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnFl
X2xvY2ssIGZsYWdzKTsNCiANCkBAIC0zNDMsMTQgKzMyOSw5IEBAIEVYUE9SVF9TWU1CT0wocWVf
Z2V0X3NudW0pOw0KIA0KIHZvaWQgcWVfcHV0X3NudW0odTggc251bSkNCiB7DQotCWludCBpOw0K
LQ0KLQlmb3IgKGkgPSAwOyBpIDwgcWVfbnVtX29mX3NudW07IGkrKykgew0KLQkJaWYgKHNudW1z
W2ldLm51bSA9PSBzbnVtKSB7DQotCQkJc251bXNbaV0uc3RhdGUgPSBRRV9TTlVNX1NUQVRFX0ZS
RUU7DQotCQkJYnJlYWs7DQotCQl9DQotCX0NCisJY29uc3QgdTggKnAgPSBtZW1jaHIoc251bXMs
IHNudW0sIHFlX251bV9vZl9zbnVtKTsNCisJaWYgKHApDQorCQljbGVhcl9iaXQocCAtIHNudW1z
LCBzbnVtX3N0YXRlKTsNCiB9DQogRVhQT1JUX1NZTUJPTChxZV9wdXRfc251bSk7DQogDQotLSAN
CjIuMjAuMQ0KDQo=
