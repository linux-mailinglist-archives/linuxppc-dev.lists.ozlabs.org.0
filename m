Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 682D5183C4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 04:29:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zy3m75QZzDqPQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 12:29:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.41; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=qiang.zhao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="my3RMvXr"; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150041.outbound.protection.outlook.com [40.107.15.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zy2F445mzDqJq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 12:28:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ip7n9AFG3GxUpk63oDi/KbgxeWXp8M1gKT3+VVoXRo=;
 b=my3RMvXryZAW7jx8El3zec4P+1q9g1S+s3clNaEefQQCnW5Iwi8tXdUadOcZDvKlzFzbnP8mKkKbonNi6z+0jxFILeoFmkMEJGd+kl8QyAD/CZHXwXIy6tni9tX0E0dY2p7cBDYqgXp2SWK78odgkM88g2VKdHvWe4i1hCrrUcQ=
Received: from VI1PR04MB3247.eurprd04.prod.outlook.com (10.170.232.160) by
 VI1PR04MB5933.eurprd04.prod.outlook.com (20.178.205.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Thu, 9 May 2019 02:28:25 +0000
Received: from VI1PR04MB3247.eurprd04.prod.outlook.com
 ([fe80::cd99:d9b2:d90a:6c2]) by VI1PR04MB3247.eurprd04.prod.outlook.com
 ([fe80::cd99:d9b2:d90a:6c2%2]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 02:28:25 +0000
From: Qiang Zhao <qiang.zhao@nxp.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li
 <leoyang.li@nxp.com>
Subject: RE: PATCH v2 1/6] soc/fsl/qe: qe.c: drop useless static qualifier
Thread-Topic: PATCH v2 1/6] soc/fsl/qe: qe.c: drop useless static qualifier
Thread-Index: AdUGDoGv18ez4p5gT8mOmzU3wzfrpA==
Date: Thu, 9 May 2019 02:28:25 +0000
Message-ID: <VI1PR04MB324703AD3D285BA287A389FD91330@VI1PR04MB3247.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=qiang.zhao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb953fe4-cd5d-443b-d3d2-08d6d4260397
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB5933; 
x-ms-traffictypediagnostic: VI1PR04MB5933:
x-microsoft-antispam-prvs: <VI1PR04MB5933D504A95802B3C44E0AA491330@VI1PR04MB5933.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:103;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(39860400002)(346002)(376002)(13464003)(189003)(199004)(66446008)(64756008)(8676002)(81166006)(81156014)(6636002)(478600001)(66556008)(229853002)(68736007)(26005)(66476007)(2906002)(7736002)(71190400001)(71200400001)(8936002)(14454004)(25786009)(4326008)(486006)(33656002)(186003)(7416002)(76116006)(305945005)(53936002)(54906003)(110136005)(99286004)(74316002)(476003)(9686003)(66066001)(44832011)(6246003)(2501003)(66946007)(316002)(55016002)(73956011)(7696005)(86362001)(14444005)(256004)(6436002)(5660300002)(52536014)(6116002)(53546011)(6506007)(3846002)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5933;
 H:VI1PR04MB3247.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fWuZeMUaapwDxIOqF8MZZPABF5s/d1yTlUckU7uG0B4oISamQKRbSSVBUbO080ygdmbgVtEwOwNj12GyKQqQGCSjJZ+1d26ycYHwDiuU55dc4YvshPOhjQFIybTrtiOE4UichT1Ck5S/CCfO5ELitWn/yM0dvNwgCI+d3BFwFgAqrmI1wdT7Kzzp6djBufrCJDy5O825WId09DnT2kMVrRC13OWPOxxsD320JnIXhh0RXIoswL9fXOa2ozVCgHIOCEn5JMWI6ZqpwGij0rYW8E4X3ExlC4gEUzAKrrXu5lX0lrzvza4nTVtteovruXTUrGSJJtSMJMckZpvgZUSAtyr+ZYpPLsHxBkRLjGQbM8ZwcLcOOKKzxU6yzY6ciz2xAXqtr4FbCr0icPJ4QnH9CmcCJHakOMNDAgsivusiBhI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb953fe4-cd5d-443b-d3d2-08d6d4260397
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 02:28:25.2720 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5933
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

T24gMjAxOS81LzEgMTc6MjksIFJhc211cyBWaWxsZW1vZXMgPHJhc211cy52aWxsZW1vZXNAcHJl
dmFzLmRrPiB3cm90ZToNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmFz
bXVzIFZpbGxlbW9lcyA8cmFzbXVzLnZpbGxlbW9lc0BwcmV2YXMuZGs+DQo+IFNlbnQ6IDIwMTnl
ubQ15pyIMeaXpSAxNzoyOQ0KPiBUbzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IFFpYW5n
IFpoYW8gPHFpYW5nLnpoYW9AbnhwLmNvbT47IExlbyBMaQ0KPiA8bGVveWFuZy5saUBueHAuY29t
Pg0KPiBDYzogbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc7IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgUm9i
IEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IFNjb3R0IFdvb2QNCj4gPG9zc0BidXNlcnJv
ci5uZXQ+OyBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGMtcy5mcj47IE1hcmsN
Cj4gUnV0bGFuZCA8bWFyay5ydXRsYW5kQGFybS5jb20+OyBSYXNtdXMgVmlsbGVtb2VzDQo+IDxS
YXNtdXMuVmlsbGVtb2VzQHByZXZhcy5zZT4NCj4gU3ViamVjdDogW1BBVENIIHYyIDEvNl0gc29j
L2ZzbC9xZTogcWUuYzogZHJvcCB1c2VsZXNzIHN0YXRpYyBxdWFsaWZpZXINCj4gDQo+IFRoZSBs
b2NhbCB2YXJpYWJsZSBzbnVtX2luaXQgaGFzIG5vIHJlYXNvbiB0byBoYXZlIHN0YXRpYyBzdG9y
YWdlIGR1cmF0aW9uLg0KPiANCj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlz
dG9waGUubGVyb3lAYy1zLmZyPg0KPiBTaWduZWQtb2ZmLWJ5OiBSYXNtdXMgVmlsbGVtb2VzIDxy
YXNtdXMudmlsbGVtb2VzQHByZXZhcy5kaz4NCg0KUmV2aWV3ZWQtYnk6IFFpYW5nIFpoYW8gPHFp
YW5nLnpoYW9AbnhwLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvc29jL2ZzbC9xZS9xZS5jIHwg
MiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMgYi9kcml2ZXJzL3NvYy9m
c2wvcWUvcWUuYyBpbmRleA0KPiA2MTJkOWM1NTFiZTUuLjg1NTM3M2RlYjc0NiAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMNCj4gKysrIGIvZHJpdmVycy9zb2MvZnNsL3Fl
L3FlLmMNCj4gQEAgLTMwNiw3ICszMDYsNyBAQCBzdGF0aWMgdm9pZCBxZV9zbnVtc19pbml0KHZv
aWQpDQo+ICAgICAgICAgICAgICAgICAweDI4LCAweDI5LCAweDM4LCAweDM5LCAweDQ4LCAweDQ5
LCAweDU4LCAweDU5LA0KPiAgICAgICAgICAgICAgICAgMHg2OCwgMHg2OSwgMHg3OCwgMHg3OSwg
MHg4MCwgMHg4MSwNCj4gICAgICAgICB9Ow0KPiAtICAgICAgIHN0YXRpYyBjb25zdCB1OCAqc251
bV9pbml0Ow0KPiArICAgICAgIGNvbnN0IHU4ICpzbnVtX2luaXQ7DQo+IA0KPiAgICAgICAgIHFl
X251bV9vZl9zbnVtID0gcWVfZ2V0X251bV9vZl9zbnVtcygpOw0KPiANCj4gLS0NCj4gMi4yMC4x
DQoNCg0KQmVzdCBSZWdhcmRzDQpRaWFuZyBaaGFvDQo=
