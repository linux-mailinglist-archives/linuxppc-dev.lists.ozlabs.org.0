Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6700910667
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 11:36:02 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vCv400mhzDqY7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 19:36:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur02-ve1-obe.outbound.protection.outlook.com
 (client-ip=40.107.2.131; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="OeYjfEDp"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20131.outbound.protection.outlook.com [40.107.2.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vClL661XzDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 19:29:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fJ5U+IHVXUTRS8hFPfc2dZSSvB14ADgBZmFg2WCmtQs=;
 b=OeYjfEDpgtDJ/kG3mI31icA3RGyHyOtMUJRd9Ov+NAmmYdlsQhUaNimb1mKlTS70YybJ/Xyis/e7v3tWPefCVaEIk/Z3N59jThMPp3jAYmKpSHVUsbqvqQF35Rs1xkPB2TcbYimLbCLgbfiRinOH++QwjQuEp/VAggbIoKJ0Qng=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB2143.EURPRD10.PROD.OUTLOOK.COM (20.177.60.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.14; Wed, 1 May 2019 09:29:10 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1856.008; Wed, 1 May 2019
 09:29:09 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Qiang Zhao
 <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH v2 5/6] soc/fsl/qe: qe.c: support fsl,qe-snums property
Thread-Topic: [PATCH v2 5/6] soc/fsl/qe: qe.c: support fsl,qe-snums property
Thread-Index: AQHVAABUi/3Pp+xrakGPF1gXQ7udLQ==
Date: Wed, 1 May 2019 09:29:09 +0000
Message-ID: <20190501092841.9026-6-rasmus.villemoes@prevas.dk>
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
x-ms-office365-filtering-correlation-id: dc97cc28-bef8-46a5-7123-08d6ce1776d9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB2143; 
x-ms-traffictypediagnostic: VI1PR10MB2143:
x-microsoft-antispam-prvs: <VI1PR10MB21431FB843BED5460C6999B98A3B0@VI1PR10MB2143.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 00246AB517
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(39850400004)(346002)(396003)(366004)(189003)(199004)(14454004)(81166006)(110136005)(54906003)(26005)(68736007)(8676002)(6512007)(4326008)(8976002)(486006)(74482002)(71200400001)(2906002)(7416002)(6486002)(72206003)(186003)(316002)(478600001)(2501003)(36756003)(6436002)(71190400001)(25786009)(1076003)(6506007)(2616005)(305945005)(3846002)(44832011)(256004)(11346002)(6116002)(5660300002)(8936002)(446003)(476003)(50226002)(76176011)(42882007)(7736002)(99286004)(66446008)(64756008)(53936002)(52116002)(107886003)(386003)(66066001)(66946007)(66476007)(102836004)(66556008)(81156014)(73956011)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB2143;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3YJSKbs3ZK4ERtCT6aOJk5VP68QOpc1fNwgDcqDr5j+M9XBY40RyU5J6viJ7B4RbWRg6Yf7Yazp8WoAfqWHGkawnH1dXJ/lFSxXvI4uTrUbSK3NAxJVjCHPyWBek4Pat2LDwxwElTV4lciagWbRhpgZ0tfiQo8hbqHDRbpEwvKIELwsJDNsK3V+pEMvCoG3YoxCv6mhlBvqcOvHpbKJ9I3L3OntZsVVpQNjjRuOEAq3tpX7W5iNA/ryqiQvpj58ioEciE2pAz3JFF3VZzgiUMz0wBg80MWZFwgIsELKzpHiC0qRnstXoC36ITx5R1z/dPg03WXUplVqFSH8nP9XkacYfsyj2wtrgoupZMgkqrxRPhH6kv6jiq5UH6TBKXWCr80d/l5xKYfKjTRH3mcZ7wMfzfRBa0P7w8MPpng6hU4A=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: dc97cc28-bef8-46a5-7123-08d6ce1776d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 May 2019 09:29:09.7998 (UTC)
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

QWRkIGRyaXZlciBzdXBwb3J0IGZvciB0aGUgbmV3bHkgaW50cm9kdWNlZCBmc2wscWUtc251bXMg
cHJvcGVydHkuDQoNCkNvbnZlbmllbnRseSwgb2ZfcHJvcGVydHlfcmVhZF92YXJpYWJsZV91OF9h
cnJheSBkb2VzIGV4YWN0bHkgd2hhdCB3ZQ0KbmVlZDogSWYgdGhlIHByb3BlcnR5IGZzbCxxZS1z
bnVtcyBpcyBmb3VuZCAoYW5kIGhhcyBhbiBhbGxvd2VkIHNpemUpLA0KdGhlIGFycmF5IG9mIHZh
bHVlcyBnZXQgY29waWVkIHRvIHNudW1zLCBhbmQgdGhlIHJldHVybiB2YWx1ZSBpcyB0aGUNCm51
bWJlciBvZiBzbnVtcyAtIHdlIGNhbm5vdCBhc3NpZ24gZGlyZWN0bHkgdG8gbnVtX29mX3NudW1z
LCBzaW5jZSB3ZQ0KbmVlZCB0byBjaGVjayB3aGV0aGVyIHRoZSByZXR1cm4gdmFsdWUgaXMgbmVn
YXRpdmUuDQoNClNpZ25lZC1vZmYtYnk6IFJhc211cyBWaWxsZW1vZXMgPHJhc211cy52aWxsZW1v
ZXNAcHJldmFzLmRrPg0KLS0tDQogZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMgfCAxNiArKysrKysr
KysrKysrKy0tDQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9mc2wvcWUvcWUuYyBiL2RyaXZlcnMvc29j
L2ZzbC9xZS9xZS5jDQppbmRleCAwZmI4YjU5ZjYxYWQuLjMyNWQ2ODljYmY1YyAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvc29jL2ZzbC9xZS9xZS5jDQorKysgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcWUu
Yw0KQEAgLTI4Myw3ICsyODMsNiBAQCBFWFBPUlRfU1lNQk9MKHFlX2Nsb2NrX3NvdXJjZSk7DQog
ICovDQogc3RhdGljIHZvaWQgcWVfc251bXNfaW5pdCh2b2lkKQ0KIHsNCi0JaW50IGk7DQogCXN0
YXRpYyBjb25zdCB1OCBzbnVtX2luaXRfNzZbXSA9IHsNCiAJCTB4MDQsIDB4MDUsIDB4MEMsIDB4
MEQsIDB4MTQsIDB4MTUsIDB4MUMsIDB4MUQsDQogCQkweDI0LCAweDI1LCAweDJDLCAweDJELCAw
eDM0LCAweDM1LCAweDg4LCAweDg5LA0KQEAgLTMwNCw3ICszMDMsMjEgQEAgc3RhdGljIHZvaWQg
cWVfc251bXNfaW5pdCh2b2lkKQ0KIAkJMHgyOCwgMHgyOSwgMHgzOCwgMHgzOSwgMHg0OCwgMHg0
OSwgMHg1OCwgMHg1OSwNCiAJCTB4NjgsIDB4NjksIDB4NzgsIDB4NzksIDB4ODAsIDB4ODEsDQog
CX07DQorCXN0cnVjdCBkZXZpY2Vfbm9kZSAqcWU7DQogCWNvbnN0IHU4ICpzbnVtX2luaXQ7DQor
CWludCBpOw0KKw0KKwliaXRtYXBfemVybyhzbnVtX3N0YXRlLCBRRV9OVU1fT0ZfU05VTSk7DQor
CXFlID0gcWVfZ2V0X2RldmljZV9ub2RlKCk7DQorCWlmIChxZSkgew0KKwkJaSA9IG9mX3Byb3Bl
cnR5X3JlYWRfdmFyaWFibGVfdThfYXJyYXkocWUsICJmc2wscWUtc251bXMiLA0KKwkJCQkJCSAg
ICAgICBzbnVtcywgMSwgUUVfTlVNX09GX1NOVU0pOw0KKwkJb2Zfbm9kZV9wdXQocWUpOw0KKwkJ
aWYgKGkgPiAwKSB7DQorCQkJcWVfbnVtX29mX3NudW0gPSBpOw0KKwkJCXJldHVybjsNCisJCX0N
CisJfQ0KIA0KIAlxZV9udW1fb2Zfc251bSA9IHFlX2dldF9udW1fb2Zfc251bXMoKTsNCiANCkBA
IC0zMTMsNyArMzI2LDYgQEAgc3RhdGljIHZvaWQgcWVfc251bXNfaW5pdCh2b2lkKQ0KIAllbHNl
DQogCQlzbnVtX2luaXQgPSBzbnVtX2luaXRfNDY7DQogDQotCWJpdG1hcF96ZXJvKHNudW1fc3Rh
dGUsIFFFX05VTV9PRl9TTlVNKTsNCiAJbWVtY3B5KHNudW1zLCBzbnVtX2luaXQsIHFlX251bV9v
Zl9zbnVtKTsNCiB9DQogDQotLSANCjIuMjAuMQ0KDQo=
