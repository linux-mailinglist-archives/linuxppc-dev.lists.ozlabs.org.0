Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F64183C9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 04:31:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zy5n2jFBzDqQH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 12:31:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.43; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=qiang.zhao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="EeWeZL2P"; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150043.outbound.protection.outlook.com [40.107.15.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zy4Q38XrzDqJq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 12:30:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pW5BzZjQLlxkVc1eetGVZECsUOclUujYSIIs/G1EL3U=;
 b=EeWeZL2Pg0ActY23Yv1FemExZCWElBgObxxd4gGUFgxFktgwYbmOt1/nVSzn+z8hd5YI+mzHkvdE41UU2ZhKzuty0dR1Me1HGmkiJx/0lAq8oMg2TcZOJNRyPKRGQCgbokzSNZWEvw6sPZtRaIoPO98MHeHZHSIx3lBQhIk+7xA=
Received: from VI1PR04MB3247.eurprd04.prod.outlook.com (10.170.232.160) by
 VI1PR04MB5933.eurprd04.prod.outlook.com (20.178.205.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Thu, 9 May 2019 02:30:24 +0000
Received: from VI1PR04MB3247.eurprd04.prod.outlook.com
 ([fe80::cd99:d9b2:d90a:6c2]) by VI1PR04MB3247.eurprd04.prod.outlook.com
 ([fe80::cd99:d9b2:d90a:6c2%2]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 02:30:24 +0000
From: Qiang Zhao <qiang.zhao@nxp.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li
 <leoyang.li@nxp.com>
Subject: RE: PATCH v2 2/6] soc/fsl/qe: qe.c: reduce static memory footprint by
 1.7K
Thread-Topic: PATCH v2 2/6] soc/fsl/qe: qe.c: reduce static memory footprint
 by 1.7K
Thread-Index: AdUGDvJsxH/GwTlzQJOYnr/7RIp6Ag==
Date: Thu, 9 May 2019 02:30:24 +0000
Message-ID: <VI1PR04MB3247B7164E4BB289A7211B1D91330@VI1PR04MB3247.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=qiang.zhao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d65fbfa6-0835-4fe0-e329-08d6d4264a64
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB5933; 
x-ms-traffictypediagnostic: VI1PR04MB5933:
x-microsoft-antispam-prvs: <VI1PR04MB5933168466D1C6DAD0C6443B91330@VI1PR04MB5933.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(39860400002)(346002)(376002)(13464003)(189003)(199004)(66446008)(64756008)(8676002)(81166006)(81156014)(6636002)(478600001)(66556008)(229853002)(68736007)(26005)(66476007)(2906002)(7736002)(71190400001)(71200400001)(8936002)(14454004)(25786009)(4326008)(486006)(33656002)(186003)(7416002)(76116006)(305945005)(53936002)(54906003)(110136005)(99286004)(74316002)(476003)(9686003)(66066001)(44832011)(6246003)(2501003)(66946007)(316002)(55016002)(73956011)(7696005)(86362001)(14444005)(256004)(6436002)(5660300002)(52536014)(6116002)(53546011)(6506007)(3846002)(102836004)(2004002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5933;
 H:VI1PR04MB3247.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 81TPDspRqKaoPh4tUeMmp2D5Yqwk9fFSvJ2UyJljL5PntqaRM8dOLqdQbcJ96318Wv8e8r0GX16RuBuef3VdFVLTyDmu2xvYxrjMEDYl6ts7xV5uMQIuJNcG/Vhy7vtvlXXyygMjhVAfIG1LxHWyZ5tTaVImrgo1jKeK8lK05lLGsO9B4GTm8KNQ/MLD2kZ8DcVb2Nix6+K+35opvzUJVBSwnRRL68q50XJpDsSnA6LOxcDHUwm1IwGW4wLFAx2wIv2atSbdn9OyM/9DJ+O1uotGbEDIrYoSdxmC7Bx8OiRO1jJXWlOIFcfTwLa28haXWQvhlM/eZBXp32YbMtZxBbkokXfuUmelOd6LFL+jj0LHZwUHa/zMUEKabppd/8hYw/EEMd2ZjYe/Ie2ZvaxWfgGHGKUQpIW/eHdbFJtn1lc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d65fbfa6-0835-4fe0-e329-08d6d4264a64
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 02:30:24.0674 (UTC)
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
dmFzLmRrPiB3cm90ZToNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBS
YXNtdXMgVmlsbGVtb2VzIDxyYXNtdXMudmlsbGVtb2VzQHByZXZhcy5kaz4NCj4gU2VudDogMjAx
OeW5tDXmnIgx5pelIDE3OjI5DQo+IFRvOiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgUWlh
bmcgWmhhbyA8cWlhbmcuemhhb0BueHAuY29tPjsgTGVvIExpDQo+IDxsZW95YW5nLmxpQG54cC5j
b20+DQo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsgbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBS
b2IgSGVycmluZyA8cm9iaCtkdEBrZXJuZWwub3JnPjsgU2NvdHQgV29vZA0KPiA8b3NzQGJ1c2Vy
cm9yLm5ldD47IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAYy1zLmZyPjsgTWFy
aw0KPiBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJtLmNvbT47IFJhc211cyBWaWxsZW1vZXMNCj4g
PFJhc211cy5WaWxsZW1vZXNAcHJldmFzLnNlPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMi82XSBz
b2MvZnNsL3FlOiBxZS5jOiByZWR1Y2Ugc3RhdGljIG1lbW9yeSBmb290cHJpbnQNCj4gYnkgMS43
Sw0KPiANCj4gVGhlIGN1cnJlbnQgYXJyYXkgb2Ygc3RydWN0IHFlX3NudW0gdXNlIDI1Nio0IGJ5
dGVzIGZvciBqdXN0IGtlZXBpbmcgdHJhY2sgb2YNCj4gdGhlIGZyZWUvdXNlZCBzdGF0ZSBvZiBl
YWNoIGluZGV4LCBhbmQgdGhlIHN0cnVjdCBsYXlvdXQgbWVhbnMgdGhlcmUncyBhbm90aGVyDQo+
IDc2OCBieXRlcyBvZiBwYWRkaW5nLiBJZiB3ZSBqdXN0IHVuemlwIHRoYXQgc3RydWN0dXJlLCB0
aGUgYXJyYXkgb2Ygc251bSB2YWx1ZXMNCj4ganVzdCB1c2UgMjU2IGJ5dGVzLCB3aGlsZSB0aGUg
ZnJlZS9pbnVzZSBzdGF0ZSBjYW4gYmUgdHJhY2tlZCBpbiBhIDMyIGJ5dGUNCj4gYml0bWFwLg0K
PiANCj4gU28gdGhpcyByZWR1Y2VzIHRoZSAuZGF0YSBmb290cHJpbnQgYnkgMTc2MCBieXRlcy4g
SXQgYWxzbyBzZXJ2ZXMgYXMgcHJlcGFyYXRpb24NCj4gZm9yIGludHJvZHVjaW5nIGFub3RoZXIg
RFQgYmluZGluZyBmb3Igc3BlY2lmeWluZyB0aGUgc251bSB2YWx1ZXMuDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBSYXNtdXMgVmlsbGVtb2VzIDxyYXNtdXMudmlsbGVtb2VzQHByZXZhcy5kaz4NCiAN
ClJldmlld2VkLWJ5OiBRaWFuZyBaaGFvIDxxaWFuZy56aGFvQG54cC5jb20+DQoNCj4gLS0tDQo+
ICBkcml2ZXJzL3NvYy9mc2wvcWUvcWUuYyB8IDQzICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMzEg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMg
Yi9kcml2ZXJzL3NvYy9mc2wvcWUvcWUuYyBpbmRleA0KPiA4NTUzNzNkZWI3NDYuLjMwM2FhMjlj
YjI3ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMNCj4gKysrIGIvZHJp
dmVycy9zb2MvZnNsL3FlL3FlLmMNCj4gQEAgLTE0LDYgKzE0LDcgQEANCj4gICAqIEZyZWUgU29m
dHdhcmUgRm91bmRhdGlvbjsgIGVpdGhlciB2ZXJzaW9uIDIgb2YgdGhlICBMaWNlbnNlLCBvciAo
YXQgeW91cg0KPiAgICogb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4NCj4gICAqLw0KPiArI2lu
Y2x1ZGUgPGxpbnV4L2JpdG1hcC5oPg0KPiAgI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+DQo+ICAj
aW5jbHVkZSA8bGludXgvc2NoZWQuaD4NCj4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4NCj4g
QEAgLTQzLDI1ICs0NCwxNCBAQCBzdGF0aWMgREVGSU5FX1NQSU5MT0NLKHFlX2xvY2spOw0KPiBE
RUZJTkVfU1BJTkxPQ0soY214Z2NyX2xvY2spOyAgRVhQT1JUX1NZTUJPTChjbXhnY3JfbG9jayk7
DQo+IA0KPiAtLyogUUUgc251bSBzdGF0ZSAqLw0KPiAtZW51bSBxZV9zbnVtX3N0YXRlIHsNCj4g
LSAgICAgICBRRV9TTlVNX1NUQVRFX1VTRUQsDQo+IC0gICAgICAgUUVfU05VTV9TVEFURV9GUkVF
DQo+IC19Ow0KPiAtDQo+IC0vKiBRRSBzbnVtICovDQo+IC1zdHJ1Y3QgcWVfc251bSB7DQo+IC0g
ICAgICAgdTggbnVtOw0KPiAtICAgICAgIGVudW0gcWVfc251bV9zdGF0ZSBzdGF0ZTsNCj4gLX07
DQo+IC0NCj4gIC8qIFdlIGFsbG9jYXRlIHRoaXMgaGVyZSBiZWNhdXNlIGl0IGlzIHVzZWQgYWxt
b3N0IGV4Y2x1c2l2ZWx5IGZvcg0KPiAgICogdGhlIGNvbW11bmljYXRpb24gcHJvY2Vzc29yIGRl
dmljZXMuDQo+ICAgKi8NCj4gIHN0cnVjdCBxZV9pbW1hcCBfX2lvbWVtICpxZV9pbW1yOw0KPiAg
RVhQT1JUX1NZTUJPTChxZV9pbW1yKTsNCj4gDQo+IC1zdGF0aWMgc3RydWN0IHFlX3NudW0gc251
bXNbUUVfTlVNX09GX1NOVU1dOyAgIC8qIER5bmFtaWNhbGx5DQo+IGFsbG9jYXRlZCBTTlVNcyAq
Lw0KPiArc3RhdGljIHU4IHNudW1zW1FFX05VTV9PRl9TTlVNXTsgICAgICAgLyogRHluYW1pY2Fs
bHkgYWxsb2NhdGVkDQo+IFNOVU1zICovDQo+ICtzdGF0aWMgREVDTEFSRV9CSVRNQVAoc251bV9z
dGF0ZSwgUUVfTlVNX09GX1NOVU0pOw0KPiAgc3RhdGljIHVuc2lnbmVkIGludCBxZV9udW1fb2Zf
c251bTsNCj4gDQo+ICBzdGF0aWMgcGh5c19hZGRyX3QgcWViYXNlID0gLTE7DQo+IEBAIC0zMTUs
MTAgKzMwNSw4IEBAIHN0YXRpYyB2b2lkIHFlX3NudW1zX2luaXQodm9pZCkNCj4gICAgICAgICBl
bHNlDQo+ICAgICAgICAgICAgICAgICBzbnVtX2luaXQgPSBzbnVtX2luaXRfNDY7DQo+IA0KPiAt
ICAgICAgIGZvciAoaSA9IDA7IGkgPCBxZV9udW1fb2Zfc251bTsgaSsrKSB7DQo+IC0gICAgICAg
ICAgICAgICBzbnVtc1tpXS5udW0gPSBzbnVtX2luaXRbaV07DQo+IC0gICAgICAgICAgICAgICBz
bnVtc1tpXS5zdGF0ZSA9IFFFX1NOVU1fU1RBVEVfRlJFRTsNCj4gLSAgICAgICB9DQo+ICsgICAg
ICAgYml0bWFwX3plcm8oc251bV9zdGF0ZSwgUUVfTlVNX09GX1NOVU0pOw0KPiArICAgICAgIG1l
bWNweShzbnVtcywgc251bV9pbml0LCBxZV9udW1fb2Zfc251bSk7DQo+ICB9DQo+IA0KPiAgaW50
IHFlX2dldF9zbnVtKHZvaWQpDQo+IEBAIC0zMjgsMTIgKzMxNiwxMCBAQCBpbnQgcWVfZ2V0X3Nu
dW0odm9pZCkNCj4gICAgICAgICBpbnQgaTsNCj4gDQo+ICAgICAgICAgc3Bpbl9sb2NrX2lycXNh
dmUoJnFlX2xvY2ssIGZsYWdzKTsNCj4gLSAgICAgICBmb3IgKGkgPSAwOyBpIDwgcWVfbnVtX29m
X3NudW07IGkrKykgew0KPiAtICAgICAgICAgICAgICAgaWYgKHNudW1zW2ldLnN0YXRlID09IFFF
X1NOVU1fU1RBVEVfRlJFRSkgew0KPiAtICAgICAgICAgICAgICAgICAgICAgICBzbnVtc1tpXS5z
dGF0ZSA9IFFFX1NOVU1fU1RBVEVfVVNFRDsNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgc251
bSA9IHNudW1zW2ldLm51bTsNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7DQo+IC0g
ICAgICAgICAgICAgICB9DQo+ICsgICAgICAgaSA9IGZpbmRfZmlyc3RfemVyb19iaXQoc251bV9z
dGF0ZSwgcWVfbnVtX29mX3NudW0pOw0KPiArICAgICAgIGlmIChpIDwgcWVfbnVtX29mX3NudW0p
IHsNCj4gKyAgICAgICAgICAgICAgIHNldF9iaXQoaSwgc251bV9zdGF0ZSk7DQo+ICsgICAgICAg
ICAgICAgICBzbnVtID0gc251bXNbaV07DQo+ICAgICAgICAgfQ0KPiAgICAgICAgIHNwaW5fdW5s
b2NrX2lycXJlc3RvcmUoJnFlX2xvY2ssIGZsYWdzKTsNCj4gDQo+IEBAIC0zNDMsMTQgKzMyOSw5
IEBAIEVYUE9SVF9TWU1CT0wocWVfZ2V0X3NudW0pOw0KPiANCj4gIHZvaWQgcWVfcHV0X3NudW0o
dTggc251bSkNCj4gIHsNCj4gLSAgICAgICBpbnQgaTsNCj4gLQ0KPiAtICAgICAgIGZvciAoaSA9
IDA7IGkgPCBxZV9udW1fb2Zfc251bTsgaSsrKSB7DQo+IC0gICAgICAgICAgICAgICBpZiAoc251
bXNbaV0ubnVtID09IHNudW0pIHsNCj4gLSAgICAgICAgICAgICAgICAgICAgICAgc251bXNbaV0u
c3RhdGUgPSBRRV9TTlVNX1NUQVRFX0ZSRUU7DQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGJy
ZWFrOw0KPiAtICAgICAgICAgICAgICAgfQ0KPiAtICAgICAgIH0NCj4gKyAgICAgICBjb25zdCB1
OCAqcCA9IG1lbWNocihzbnVtcywgc251bSwgcWVfbnVtX29mX3NudW0pOw0KPiArICAgICAgIGlm
IChwKQ0KPiArICAgICAgICAgICAgICAgY2xlYXJfYml0KHAgLSBzbnVtcywgc251bV9zdGF0ZSk7
DQo+ICB9DQo+ICBFWFBPUlRfU1lNQk9MKHFlX3B1dF9zbnVtKTsNCj4gDQo+IC0tDQo+IDIuMjAu
MQ0KQmVzdCBSZWdhcmRzDQpRaWFuZyBaaGFvDQo=
