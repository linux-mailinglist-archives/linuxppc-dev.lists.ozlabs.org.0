Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7371B4D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 13:21:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452dgm4LPfzDqFm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 21:21:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur04-db3-obe.outbound.protection.outlook.com
 (client-ip=40.107.6.130; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="bH6O7GUI"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60130.outbound.protection.outlook.com [40.107.6.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452dWw3hLszDqFZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 21:15:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hFXFaYxZbDf4YVKZ2AuPrr15Glit1zEkKAeApbr5ys0=;
 b=bH6O7GUIk0a6YuBfsMyJb+HX88KimZLLAxKOsJ8vhs4JqRPD2IfddEkgGnIRfPDg+XfepG3uCE0vi3/3hdazZMScX5f/gKqPnb/eON79SJsLN0gxryE3zelbKV4FE7R91CmSNpdvdzQ1128BURsZTJFbXvZSbWasz/x4Ld3L9w8=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB1950.EURPRD10.PROD.OUTLOOK.COM (52.134.27.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Mon, 13 May 2019 11:15:00 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 11:15:00 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Qiang Zhao
 <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH v3 5/6] soc/fsl/qe: qe.c: support fsl,qe-snums property
Thread-Topic: [PATCH v3 5/6] soc/fsl/qe: qe.c: support fsl,qe-snums property
Thread-Index: AQHVCX0azViUEmjOIE6yA42BiGSQgw==
Date: Mon, 13 May 2019 11:15:00 +0000
Message-ID: <20190513111442.25724-6-rasmus.villemoes@prevas.dk>
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
x-ms-office365-filtering-correlation-id: ba6d851b-b994-4ae2-98d2-08d6d7943d20
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB1950; 
x-ms-traffictypediagnostic: VI1PR10MB1950:
x-microsoft-antispam-prvs: <VI1PR10MB19505FC88D4C475383E4A8F38A0F0@VI1PR10MB1950.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39850400004)(366004)(376002)(136003)(396003)(189003)(199004)(6512007)(66066001)(53936002)(107886003)(52116002)(68736007)(256004)(71200400001)(71190400001)(76176011)(6436002)(478600001)(6486002)(1076003)(36756003)(5660300002)(72206003)(74482002)(446003)(81156014)(8676002)(14454004)(99286004)(2501003)(66946007)(66476007)(66556008)(64756008)(66446008)(73956011)(54906003)(11346002)(2616005)(42882007)(476003)(81166006)(44832011)(50226002)(486006)(8936002)(110136005)(8976002)(6116002)(7416002)(316002)(3846002)(2906002)(305945005)(7736002)(186003)(25786009)(102836004)(6506007)(386003)(4326008)(26005)(142933001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB1950;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uJp8v4HOR+DW0xmeKxRc1EOdLFAgYrI0AEqNoNqyhOG6PqFo7qwAU3dytXRXzDPBn4f2FN1iOVNasjvZIY9V65dZyPX+my2KzNnvBdT33X8Km364xW7ISus11ZKTSpAPXmuNKEQUzwfnKukCLd+6y6+3g9P6c5dE0lkM6gMZPp4hBkrwt9nHAeVlU8a6E5t1C4g8HrOr/CsCYxQykV+2E2sNOmKy5m59d50Ugyu0PIm0uKOe8pNLG8xkSYTu8QoYBsLjXlSrVW4z8Nm/5rHOVu+kWRnWe4vwOmJXjLfLY8bWHAcEa5t9S4ctYwE+cjPIsAKXrj8RydZJDOF7q+mFCr+xloUwAiwEOHWlxeJAA3nilTOPHV1iyBRLkhT4AsXe/JtWPgF7AxpTI/ZRuDwDVEOyJjjX5vy57prB1D9QIss=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6d851b-b994-4ae2-98d2-08d6d7943d20
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 11:15:00.2763 (UTC)
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

QWRkIGRyaXZlciBzdXBwb3J0IGZvciB0aGUgbmV3bHkgaW50cm9kdWNlZCBmc2wscWUtc251bXMg
cHJvcGVydHkuDQoNCkNvbnZlbmllbnRseSwgb2ZfcHJvcGVydHlfcmVhZF92YXJpYWJsZV91OF9h
cnJheSBkb2VzIGV4YWN0bHkgd2hhdCB3ZQ0KbmVlZDogSWYgdGhlIHByb3BlcnR5IGZzbCxxZS1z
bnVtcyBpcyBmb3VuZCAoYW5kIGhhcyBhbiBhbGxvd2VkIHNpemUpLA0KdGhlIGFycmF5IG9mIHZh
bHVlcyBnZXQgY29waWVkIHRvIHNudW1zLCBhbmQgdGhlIHJldHVybiB2YWx1ZSBpcyB0aGUNCm51
bWJlciBvZiBzbnVtcyAtIHdlIGNhbm5vdCBhc3NpZ24gZGlyZWN0bHkgdG8gbnVtX29mX3NudW1z
LCBzaW5jZSB3ZQ0KbmVlZCB0byBjaGVjayB3aGV0aGVyIHRoZSByZXR1cm4gdmFsdWUgaXMgbmVn
YXRpdmUuDQoNClJldmlld2VkLWJ5OiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95
QGMtcy5mcj4NClJldmlld2VkLWJ5OiBRaWFuZyBaaGFvIDxxaWFuZy56aGFvQG54cC5jb20+DQpT
aWduZWQtb2ZmLWJ5OiBSYXNtdXMgVmlsbGVtb2VzIDxyYXNtdXMudmlsbGVtb2VzQHByZXZhcy5k
az4NCi0tLQ0KIGRyaXZlcnMvc29jL2ZzbC9xZS9xZS5jIHwgMTYgKysrKysrKysrKysrKystLQ0K
IDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcWUu
Yw0KaW5kZXggNGI0NDQ4NDZkNTkwLi4xZDI3MTg3YjI1MWMgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L3NvYy9mc2wvcWUvcWUuYw0KKysrIGIvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMNCkBAIC0yODMs
NyArMjgzLDYgQEAgRVhQT1JUX1NZTUJPTChxZV9jbG9ja19zb3VyY2UpOw0KICAqLw0KIHN0YXRp
YyB2b2lkIHFlX3NudW1zX2luaXQodm9pZCkNCiB7DQotCWludCBpOw0KIAlzdGF0aWMgY29uc3Qg
dTggc251bV9pbml0Xzc2W10gPSB7DQogCQkweDA0LCAweDA1LCAweDBDLCAweDBELCAweDE0LCAw
eDE1LCAweDFDLCAweDFELA0KIAkJMHgyNCwgMHgyNSwgMHgyQywgMHgyRCwgMHgzNCwgMHgzNSwg
MHg4OCwgMHg4OSwNCkBAIC0zMDQsNyArMzAzLDIxIEBAIHN0YXRpYyB2b2lkIHFlX3NudW1zX2lu
aXQodm9pZCkNCiAJCTB4MjgsIDB4MjksIDB4MzgsIDB4MzksIDB4NDgsIDB4NDksIDB4NTgsIDB4
NTksDQogCQkweDY4LCAweDY5LCAweDc4LCAweDc5LCAweDgwLCAweDgxLA0KIAl9Ow0KKwlzdHJ1
Y3QgZGV2aWNlX25vZGUgKnFlOw0KIAljb25zdCB1OCAqc251bV9pbml0Ow0KKwlpbnQgaTsNCisN
CisJYml0bWFwX3plcm8oc251bV9zdGF0ZSwgUUVfTlVNX09GX1NOVU0pOw0KKwlxZSA9IHFlX2dl
dF9kZXZpY2Vfbm9kZSgpOw0KKwlpZiAocWUpIHsNCisJCWkgPSBvZl9wcm9wZXJ0eV9yZWFkX3Zh
cmlhYmxlX3U4X2FycmF5KHFlLCAiZnNsLHFlLXNudW1zIiwNCisJCQkJCQkgICAgICAgc251bXMs
IDEsIFFFX05VTV9PRl9TTlVNKTsNCisJCW9mX25vZGVfcHV0KHFlKTsNCisJCWlmIChpID4gMCkg
ew0KKwkJCXFlX251bV9vZl9zbnVtID0gaTsNCisJCQlyZXR1cm47DQorCQl9DQorCX0NCiANCiAJ
cWVfbnVtX29mX3NudW0gPSBxZV9nZXRfbnVtX29mX3NudW1zKCk7DQogDQpAQCAtMzEzLDcgKzMy
Niw2IEBAIHN0YXRpYyB2b2lkIHFlX3NudW1zX2luaXQodm9pZCkNCiAJZWxzZQ0KIAkJc251bV9p
bml0ID0gc251bV9pbml0XzQ2Ow0KIA0KLQliaXRtYXBfemVybyhzbnVtX3N0YXRlLCBRRV9OVU1f
T0ZfU05VTSk7DQogCW1lbWNweShzbnVtcywgc251bV9pbml0LCBxZV9udW1fb2Zfc251bSk7DQog
fQ0KIA0KLS0gDQoyLjIwLjENCg0K
