Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00875FE14
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 18:44:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tnS623gJzDqPM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 02:44:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=eur02-ve1-obe.outbound.protection.outlook.com
 (client-ip=40.107.2.102; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=rasmus.villemoes@prevas.se; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=prevas.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=prevas.se header.i=@prevas.se header.b="TDoKfp1D"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20102.outbound.protection.outlook.com [40.107.2.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tjHD0S8lzDqHn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 23:36:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.se; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=15YlhkkngP7FTeHnNre9hbREldWz2c9n4Ff+15e5dWI=;
 b=TDoKfp1DDwvvF4iMeDdInxpdeqtgb63fjrKKFlbtPu1B73JIJvk9/ssmqWI863mb2cgislYdIlsu88QOQzKufRDjPJenSW38J9Ci0Z369c2KJnD+G6YlBKDLtWnOXQZ9eU2VLgwJLagxhQC+7mNuVFcrK/4OeHQJByq/JB3/9E8=
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM (20.178.126.212) by
 VI1PR10MB0735.EURPRD10.PROD.OUTLOOK.COM (10.167.203.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 13:36:31 +0000
Received: from VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8]) by VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::48b8:9cff:182:f3d8%2]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 13:36:31 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 2/5] soc/fsl/qe: qe.c: reduce static memory footprint by 1.7K
Thread-Topic: [PATCH 2/5] soc/fsl/qe: qe.c: reduce static memory footprint by
 1.7K
Thread-Index: AQHU/1m4QeMNIhRtn0+qXCERrOOPqg==
Date: Tue, 30 Apr 2019 13:36:31 +0000
Message-ID: <20190430133615.25721-3-rasmus.villemoes@prevas.dk>
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
x-ms-office365-filtering-correlation-id: 8c025aa9-dff8-4545-8958-08d6cd70da9c
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR10MB0735; 
x-ms-traffictypediagnostic: VI1PR10MB0735:
x-microsoft-antispam-prvs: <VI1PR10MB0735F18DBE4EC1043411AB918A3A0@VI1PR10MB0735.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(979002)(396003)(136003)(39850400004)(366004)(376002)(346002)(199004)(189003)(81156014)(36756003)(8676002)(6436002)(478600001)(81166006)(107886003)(50226002)(52116002)(8976002)(8936002)(74482002)(72206003)(4326008)(7736002)(6486002)(6506007)(386003)(25786009)(1076003)(53936002)(54906003)(76176011)(305945005)(110136005)(316002)(99286004)(14454004)(6512007)(476003)(11346002)(446003)(5660300002)(44832011)(66446008)(26005)(73956011)(42882007)(2616005)(6116002)(2906002)(71200400001)(66556008)(66476007)(64756008)(66066001)(97736004)(66946007)(3846002)(256004)(14444005)(68736007)(71446004)(186003)(486006)(102836004)(71190400001)(2004002)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB0735;
 H:VI1PR10MB2672.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: prevas.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YiAhazi1t2rMgonoDLCmTaFaWESZsaOeVF9nNJT/rLLm1/BbEdIo/cOM3LNK84jgtaHikEpmZu7gNtaltUFEX5QpzqkGmXKkc5Y4jrnnkJjsHEmmQA+ZLwz5QrOpopwo4Jwwv/L+dfPAjutNmQNZl3jDNDF+39kv4ELGKoN6XJnLwbUB5Ip6GjNMpJUBXLzjoCNMponpiwos2PBMlZ47/KGuKimAVfMXwpn4AqXBQuUq9jRwfB2LQxkMsKI1uiS5u9CjeKQX1gWFcuoSaHai5GWxjz+dfHUa2c8tgILfKgnPMktsRdMIXPU127sQDfqfS71tQ7tKE8fd0EqJKcOFQ2CeD9Knh9YUZXe6OtQNSx699VZUluPJ1lwo3z7NEc8f/9gFCFQ1OIUb+ZnIwMIoLgOcPo56tYXDAdBJS5EWLco=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c025aa9-dff8-4545-8958-08d6cd70da9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 13:36:31.0259 (UTC)
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
YyB8IDM3ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCiAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMjUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3NvYy9mc2wvcWUvcWUuYyBiL2RyaXZlcnMvc29jL2ZzbC9xZS9xZS5jDQppbmRleCA4
NTUzNzNkZWI3NDYuLmQwMzkzZjgzMTQ1YyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvc29jL2ZzbC9x
ZS9xZS5jDQorKysgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcWUuYw0KQEAgLTE0LDYgKzE0LDcgQEAN
CiAgKiBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb247ICBlaXRoZXIgdmVyc2lvbiAyIG9mIHRoZSAg
TGljZW5zZSwgb3IgKGF0IHlvdXINCiAgKiBvcHRpb24pIGFueSBsYXRlciB2ZXJzaW9uLg0KICAq
Lw0KKyNpbmNsdWRlIDxsaW51eC9iaXRtYXAuaD4NCiAjaW5jbHVkZSA8bGludXgvZXJybm8uaD4N
CiAjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4NCiAjaW5jbHVkZSA8bGludXgva2VybmVsLmg+DQpA
QCAtNDMsMjUgKzQ0LDE0IEBAIHN0YXRpYyBERUZJTkVfU1BJTkxPQ0socWVfbG9jayk7DQogREVG
SU5FX1NQSU5MT0NLKGNteGdjcl9sb2NrKTsNCiBFWFBPUlRfU1lNQk9MKGNteGdjcl9sb2NrKTsN
CiANCi0vKiBRRSBzbnVtIHN0YXRlICovDQotZW51bSBxZV9zbnVtX3N0YXRlIHsNCi0JUUVfU05V
TV9TVEFURV9VU0VELA0KLQlRRV9TTlVNX1NUQVRFX0ZSRUUNCi19Ow0KLQ0KLS8qIFFFIHNudW0g
Ki8NCi1zdHJ1Y3QgcWVfc251bSB7DQotCXU4IG51bTsNCi0JZW51bSBxZV9zbnVtX3N0YXRlIHN0
YXRlOw0KLX07DQotDQogLyogV2UgYWxsb2NhdGUgdGhpcyBoZXJlIGJlY2F1c2UgaXQgaXMgdXNl
ZCBhbG1vc3QgZXhjbHVzaXZlbHkgZm9yDQogICogdGhlIGNvbW11bmljYXRpb24gcHJvY2Vzc29y
IGRldmljZXMuDQogICovDQogc3RydWN0IHFlX2ltbWFwIF9faW9tZW0gKnFlX2ltbXI7DQogRVhQ
T1JUX1NZTUJPTChxZV9pbW1yKTsNCiANCi1zdGF0aWMgc3RydWN0IHFlX3NudW0gc251bXNbUUVf
TlVNX09GX1NOVU1dOwkvKiBEeW5hbWljYWxseSBhbGxvY2F0ZWQgU05VTXMgKi8NCitzdGF0aWMg
dTggc251bXNbUUVfTlVNX09GX1NOVU1dOwkvKiBEeW5hbWljYWxseSBhbGxvY2F0ZWQgU05VTXMg
Ki8NCitzdGF0aWMgREVDTEFSRV9CSVRNQVAoc251bV9zdGF0ZSwgUUVfTlVNX09GX1NOVU0pOw0K
IHN0YXRpYyB1bnNpZ25lZCBpbnQgcWVfbnVtX29mX3NudW07DQogDQogc3RhdGljIHBoeXNfYWRk
cl90IHFlYmFzZSA9IC0xOw0KQEAgLTMwOCw2ICsyOTgsNyBAQCBzdGF0aWMgdm9pZCBxZV9zbnVt
c19pbml0KHZvaWQpDQogCX07DQogCWNvbnN0IHU4ICpzbnVtX2luaXQ7DQogDQorCWJpdG1hcF96
ZXJvKHNudW1fc3RhdGUsIFFFX05VTV9PRl9TTlVNKTsNCiAJcWVfbnVtX29mX3NudW0gPSBxZV9n
ZXRfbnVtX29mX3NudW1zKCk7DQogDQogCWlmIChxZV9udW1fb2Zfc251bSA9PSA3NikNCkBAIC0z
MTUsMTAgKzMwNiw4IEBAIHN0YXRpYyB2b2lkIHFlX3NudW1zX2luaXQodm9pZCkNCiAJZWxzZQ0K
IAkJc251bV9pbml0ID0gc251bV9pbml0XzQ2Ow0KIA0KLQlmb3IgKGkgPSAwOyBpIDwgcWVfbnVt
X29mX3NudW07IGkrKykgew0KLQkJc251bXNbaV0ubnVtID0gc251bV9pbml0W2ldOw0KLQkJc251
bXNbaV0uc3RhdGUgPSBRRV9TTlVNX1NUQVRFX0ZSRUU7DQotCX0NCisJZm9yIChpID0gMDsgaSA8
IHFlX251bV9vZl9zbnVtOyBpKyspDQorCQlzbnVtc1tpXSA9IHNudW1faW5pdFtpXTsNCiB9DQog
DQogaW50IHFlX2dldF9zbnVtKHZvaWQpDQpAQCAtMzI4LDEyICszMTcsMTAgQEAgaW50IHFlX2dl
dF9zbnVtKHZvaWQpDQogCWludCBpOw0KIA0KIAlzcGluX2xvY2tfaXJxc2F2ZSgmcWVfbG9jaywg
ZmxhZ3MpOw0KLQlmb3IgKGkgPSAwOyBpIDwgcWVfbnVtX29mX3NudW07IGkrKykgew0KLQkJaWYg
KHNudW1zW2ldLnN0YXRlID09IFFFX1NOVU1fU1RBVEVfRlJFRSkgew0KLQkJCXNudW1zW2ldLnN0
YXRlID0gUUVfU05VTV9TVEFURV9VU0VEOw0KLQkJCXNudW0gPSBzbnVtc1tpXS5udW07DQotCQkJ
YnJlYWs7DQotCQl9DQorCWkgPSBmaW5kX2ZpcnN0X3plcm9fYml0KHNudW1fc3RhdGUsIHFlX251
bV9vZl9zbnVtKTsNCisJaWYgKGkgPCBxZV9udW1fb2Zfc251bSkgew0KKwkJc2V0X2JpdChpLCBz
bnVtX3N0YXRlKTsNCisJCXNudW0gPSBzbnVtc1tpXTsNCiAJfQ0KIAlzcGluX3VubG9ja19pcnFy
ZXN0b3JlKCZxZV9sb2NrLCBmbGFncyk7DQogDQpAQCAtMzQ2LDggKzMzMyw4IEBAIHZvaWQgcWVf
cHV0X3NudW0odTggc251bSkNCiAJaW50IGk7DQogDQogCWZvciAoaSA9IDA7IGkgPCBxZV9udW1f
b2Zfc251bTsgaSsrKSB7DQotCQlpZiAoc251bXNbaV0ubnVtID09IHNudW0pIHsNCi0JCQlzbnVt
c1tpXS5zdGF0ZSA9IFFFX1NOVU1fU1RBVEVfRlJFRTsNCisJCWlmIChzbnVtc1tpXSA9PSBzbnVt
KSB7DQorCQkJY2xlYXJfYml0KGksIHNudW1fc3RhdGUpOw0KIAkJCWJyZWFrOw0KIAkJfQ0KIAl9
DQotLSANCjIuMjAuMQ0KDQo=
