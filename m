Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4881B4C1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 13:18:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452dbH4KdMzDqJg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 21:18:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur04-db3-obe.outbound.protection.outlook.com
 (client-ip=40.107.6.130; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="bzn+jfDW"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60130.outbound.protection.outlook.com [40.107.6.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452dWs2svLzDqFh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:15:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQ+Vu1B7o4nUf0HtPMhFACUNFbgaLB1ESmjsz6wJxf4=;
 b=bzn+jfDWwo8KzGuNTqEElJ4p062d852hqj7JJqiOhHrJiLwa84f6wbS/ztaaT87zfbJiRM0IQkYbHo6O3OJCT2b18dQ6vMbfrwabbOjQO7JNdQLydyjwqCM1/5IFVPLaUkbLdFuTV9BU97x+47+pF+ZiLWW/N57OUiGjmzAT39k=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB1950.EURPRD10.PROD.OUTLOOK.COM (52.134.27.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Mon, 13 May 2019 11:14:56 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 11:14:56 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Qiang Zhao
 <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH v3 2/6] soc/fsl/qe: qe.c: reduce static memory footprint by
 1.7K
Thread-Topic: [PATCH v3 2/6] soc/fsl/qe: qe.c: reduce static memory footprint
 by 1.7K
Thread-Index: AQHVCX0YHaTN9I1nZ0mTjY4/MGa+1g==
Date: Mon, 13 May 2019 11:14:56 +0000
Message-ID: <20190513111442.25724-3-rasmus.villemoes@prevas.dk>
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
x-ms-office365-filtering-correlation-id: e116e3c1-1d4e-4e3c-9350-08d6d7943a9f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB1950; 
x-ms-traffictypediagnostic: VI1PR10MB1950:
x-microsoft-antispam-prvs: <VI1PR10MB1950432702C788FC4A5ECE568A0F0@VI1PR10MB1950.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39850400004)(366004)(376002)(136003)(396003)(189003)(199004)(6512007)(66066001)(53936002)(107886003)(52116002)(68736007)(256004)(14444005)(71200400001)(71190400001)(76176011)(6436002)(478600001)(6486002)(1076003)(36756003)(5660300002)(72206003)(74482002)(446003)(81156014)(8676002)(14454004)(99286004)(2501003)(66946007)(66476007)(66556008)(64756008)(66446008)(73956011)(54906003)(11346002)(2616005)(42882007)(476003)(81166006)(44832011)(50226002)(486006)(8936002)(110136005)(8976002)(6116002)(7416002)(316002)(3846002)(2906002)(305945005)(7736002)(186003)(25786009)(102836004)(6506007)(386003)(4326008)(26005)(2004002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB1950;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /MzA1gMzdmwXeo0B+phDTnQTsjVLbVMjknSi9MggE1xlwzbm55Ke8j6v3DuupP7wMJZZaVh8QjSyRPVporVefDeIvQdaUvzFxo0axPtOvbz8flaRqAW67+Prgz8kj/V1f4Y8h57Ky1qwDwKJjMKXr1Yx3l+a01qW/TxUD/Sw0jlFWbTKUckaZ/LNEZ/J/R0EzuGVppLtl/u/2PGS5BrcSXAu1BehUQ3zo+i972bFN+Dt5nLFUQNXYAEo9dFlKN6wydOEioSJ3DU009xx0ATcxkVpcK5hkzt/OVy2kiTnmKz3x/PDDquLd70HgbUPZcngmIAZAeSKShPWus5pJ4Tx6KnjJmUgc1dsrYyEz2jGkxGytJqZ1r81OxMC875S7J8BMF3UleO6I4o3opcqjWYpcbYOIeWA0ZVczDEugbfzGTw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: e116e3c1-1d4e-4e3c-9350-08d6d7943a9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 11:14:56.0733 (UTC)
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

VGhlIGN1cnJlbnQgYXJyYXkgb2Ygc3RydWN0IHFlX3NudW0gdXNlIDI1Nio0IGJ5dGVzIGZvciBq
dXN0IGtlZXBpbmcNCnRyYWNrIG9mIHRoZSBmcmVlL3VzZWQgc3RhdGUgb2YgZWFjaCBpbmRleCwg
YW5kIHRoZSBzdHJ1Y3QgbGF5b3V0DQptZWFucyB0aGVyZSdzIGFub3RoZXIgNzY4IGJ5dGVzIG9m
IHBhZGRpbmcuIElmIHdlIGp1c3QgdW56aXAgdGhhdA0Kc3RydWN0dXJlLCB0aGUgYXJyYXkgb2Yg
c251bSB2YWx1ZXMganVzdCB1c2UgMjU2IGJ5dGVzLCB3aGlsZSB0aGUNCmZyZWUvaW51c2Ugc3Rh
dGUgY2FuIGJlIHRyYWNrZWQgaW4gYSAzMiBieXRlIGJpdG1hcC4NCg0KU28gdGhpcyByZWR1Y2Vz
IHRoZSAuZGF0YSBmb290cHJpbnQgYnkgMTc2MCBieXRlcy4gSXQgYWxzbyBzZXJ2ZXMgYXMNCnBy
ZXBhcmF0aW9uIGZvciBpbnRyb2R1Y2luZyBhbm90aGVyIERUIGJpbmRpbmcgZm9yIHNwZWNpZnlp
bmcgdGhlIHNudW0NCnZhbHVlcy4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNo
cmlzdG9waGUubGVyb3lAYy1zLmZyPg0KUmV2aWV3ZWQtYnk6IFFpYW5nIFpoYW8gPHFpYW5nLnpo
YW9AbnhwLmNvbT4NClNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxsZW1vZXMgPHJhc211cy52aWxs
ZW1vZXNAcHJldmFzLmRrPg0KLS0tDQogZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMgfCA0MiArKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c29jL2ZzbC9xZS9xZS5jIGIvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMNCmluZGV4IDg1NTM3M2Rl
Yjc0Ni4uNGI1OTEwOWRmMjJiIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMN
CisrKyBiL2RyaXZlcnMvc29jL2ZzbC9xZS9xZS5jDQpAQCAtMTQsNiArMTQsNyBAQA0KICAqIEZy
ZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgIGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlICBMaWNlbnNl
LCBvciAoYXQgeW91cg0KICAqIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24uDQogICovDQorI2lu
Y2x1ZGUgPGxpbnV4L2JpdG1hcC5oPg0KICNpbmNsdWRlIDxsaW51eC9lcnJuby5oPg0KICNpbmNs
dWRlIDxsaW51eC9zY2hlZC5oPg0KICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4NCkBAIC00Mywy
NSArNDQsMTQgQEAgc3RhdGljIERFRklORV9TUElOTE9DSyhxZV9sb2NrKTsNCiBERUZJTkVfU1BJ
TkxPQ0soY214Z2NyX2xvY2spOw0KIEVYUE9SVF9TWU1CT0woY214Z2NyX2xvY2spOw0KIA0KLS8q
IFFFIHNudW0gc3RhdGUgKi8NCi1lbnVtIHFlX3NudW1fc3RhdGUgew0KLQlRRV9TTlVNX1NUQVRF
X1VTRUQsDQotCVFFX1NOVU1fU1RBVEVfRlJFRQ0KLX07DQotDQotLyogUUUgc251bSAqLw0KLXN0
cnVjdCBxZV9zbnVtIHsNCi0JdTggbnVtOw0KLQllbnVtIHFlX3NudW1fc3RhdGUgc3RhdGU7DQot
fTsNCi0NCiAvKiBXZSBhbGxvY2F0ZSB0aGlzIGhlcmUgYmVjYXVzZSBpdCBpcyB1c2VkIGFsbW9z
dCBleGNsdXNpdmVseSBmb3INCiAgKiB0aGUgY29tbXVuaWNhdGlvbiBwcm9jZXNzb3IgZGV2aWNl
cy4NCiAgKi8NCiBzdHJ1Y3QgcWVfaW1tYXAgX19pb21lbSAqcWVfaW1tcjsNCiBFWFBPUlRfU1lN
Qk9MKHFlX2ltbXIpOw0KIA0KLXN0YXRpYyBzdHJ1Y3QgcWVfc251bSBzbnVtc1tRRV9OVU1fT0Zf
U05VTV07CS8qIER5bmFtaWNhbGx5IGFsbG9jYXRlZCBTTlVNcyAqLw0KK3N0YXRpYyB1OCBzbnVt
c1tRRV9OVU1fT0ZfU05VTV07CS8qIER5bmFtaWNhbGx5IGFsbG9jYXRlZCBTTlVNcyAqLw0KK3N0
YXRpYyBERUNMQVJFX0JJVE1BUChzbnVtX3N0YXRlLCBRRV9OVU1fT0ZfU05VTSk7DQogc3RhdGlj
IHVuc2lnbmVkIGludCBxZV9udW1fb2Zfc251bTsNCiANCiBzdGF0aWMgcGh5c19hZGRyX3QgcWVi
YXNlID0gLTE7DQpAQCAtMzE1LDEwICszMDUsOCBAQCBzdGF0aWMgdm9pZCBxZV9zbnVtc19pbml0
KHZvaWQpDQogCWVsc2UNCiAJCXNudW1faW5pdCA9IHNudW1faW5pdF80NjsNCiANCi0JZm9yIChp
ID0gMDsgaSA8IHFlX251bV9vZl9zbnVtOyBpKyspIHsNCi0JCXNudW1zW2ldLm51bSA9IHNudW1f
aW5pdFtpXTsNCi0JCXNudW1zW2ldLnN0YXRlID0gUUVfU05VTV9TVEFURV9GUkVFOw0KLQl9DQor
CWJpdG1hcF96ZXJvKHNudW1fc3RhdGUsIFFFX05VTV9PRl9TTlVNKTsNCisJbWVtY3B5KHNudW1z
LCBzbnVtX2luaXQsIHFlX251bV9vZl9zbnVtKTsNCiB9DQogDQogaW50IHFlX2dldF9zbnVtKHZv
aWQpDQpAQCAtMzI4LDEyICszMTYsMTAgQEAgaW50IHFlX2dldF9zbnVtKHZvaWQpDQogCWludCBp
Ow0KIA0KIAlzcGluX2xvY2tfaXJxc2F2ZSgmcWVfbG9jaywgZmxhZ3MpOw0KLQlmb3IgKGkgPSAw
OyBpIDwgcWVfbnVtX29mX3NudW07IGkrKykgew0KLQkJaWYgKHNudW1zW2ldLnN0YXRlID09IFFF
X1NOVU1fU1RBVEVfRlJFRSkgew0KLQkJCXNudW1zW2ldLnN0YXRlID0gUUVfU05VTV9TVEFURV9V
U0VEOw0KLQkJCXNudW0gPSBzbnVtc1tpXS5udW07DQotCQkJYnJlYWs7DQotCQl9DQorCWkgPSBm
aW5kX2ZpcnN0X3plcm9fYml0KHNudW1fc3RhdGUsIHFlX251bV9vZl9zbnVtKTsNCisJaWYgKGkg
PCBxZV9udW1fb2Zfc251bSkgew0KKwkJc2V0X2JpdChpLCBzbnVtX3N0YXRlKTsNCisJCXNudW0g
PSBzbnVtc1tpXTsNCiAJfQ0KIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZxZV9sb2NrLCBmbGFn
cyk7DQogDQpAQCAtMzQzLDE0ICszMjksMTAgQEAgRVhQT1JUX1NZTUJPTChxZV9nZXRfc251bSk7
DQogDQogdm9pZCBxZV9wdXRfc251bSh1OCBzbnVtKQ0KIHsNCi0JaW50IGk7DQorCWNvbnN0IHU4
ICpwID0gbWVtY2hyKHNudW1zLCBzbnVtLCBxZV9udW1fb2Zfc251bSk7DQogDQotCWZvciAoaSA9
IDA7IGkgPCBxZV9udW1fb2Zfc251bTsgaSsrKSB7DQotCQlpZiAoc251bXNbaV0ubnVtID09IHNu
dW0pIHsNCi0JCQlzbnVtc1tpXS5zdGF0ZSA9IFFFX1NOVU1fU1RBVEVfRlJFRTsNCi0JCQlicmVh
azsNCi0JCX0NCi0JfQ0KKwlpZiAocCkNCisJCWNsZWFyX2JpdChwIC0gc251bXMsIHNudW1fc3Rh
dGUpOw0KIH0NCiBFWFBPUlRfU1lNQk9MKHFlX3B1dF9zbnVtKTsNCiANCi0tIA0KMi4yMC4xDQoN
Cg==
