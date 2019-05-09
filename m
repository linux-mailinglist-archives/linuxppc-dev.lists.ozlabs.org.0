Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D85183D3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 04:35:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zy9q1PmszDq5t
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 12:35:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.79; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=qiang.zhao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="lHKiZJsB"; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150079.outbound.protection.outlook.com [40.107.15.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zy854br8zDqJq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 12:33:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WT+gJvPsQ5SD0YY4s2IcEc6eR/1X/c0ITM+bFwrHgbA=;
 b=lHKiZJsBbLSbevLx1RdTOIfO2qaohMBAnfkglukWry/C2ZgYFBywY3X6BMn2VxzCCVd8PMzVfKENMOoLzAC6y1rJX6K4UdLVVkmvb5MjVmuzIBkQQu5ZLqCRhIBnd4ac06Qhzr1GH3UIicOUU5kt/5t8VyO1Su9pNK8AcrPCH38=
Received: from VI1PR04MB3247.eurprd04.prod.outlook.com (10.170.232.160) by
 VI1PR04MB5933.eurprd04.prod.outlook.com (20.178.205.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Thu, 9 May 2019 02:33:34 +0000
Received: from VI1PR04MB3247.eurprd04.prod.outlook.com
 ([fe80::cd99:d9b2:d90a:6c2]) by VI1PR04MB3247.eurprd04.prod.outlook.com
 ([fe80::cd99:d9b2:d90a:6c2%2]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 02:33:34 +0000
From: Qiang Zhao <qiang.zhao@nxp.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li
 <leoyang.li@nxp.com>
Subject: RE:  [PATCH v2 5/6] soc/fsl/qe: qe.c: support fsl,qe-snums property
Thread-Topic: [PATCH v2 5/6] soc/fsl/qe: qe.c: support fsl,qe-snums property
Thread-Index: AdUGD32ltqP1VC1gSGyaIizREbNmaQ==
Date: Thu, 9 May 2019 02:33:34 +0000
Message-ID: <VI1PR04MB3247F31E0B6604847058395491330@VI1PR04MB3247.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=qiang.zhao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 236602db-1e54-416a-be00-08d6d426bbbe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB5933; 
x-ms-traffictypediagnostic: VI1PR04MB5933:
x-microsoft-antispam-prvs: <VI1PR04MB5933F4865696ABABC09F9C0891330@VI1PR04MB5933.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(366004)(136003)(396003)(199004)(189003)(13464003)(86362001)(256004)(6436002)(55016002)(316002)(66946007)(73956011)(2501003)(6246003)(7696005)(6506007)(53546011)(3846002)(6116002)(102836004)(5660300002)(52536014)(7736002)(71200400001)(71190400001)(26005)(68736007)(2906002)(66476007)(8936002)(4326008)(14454004)(25786009)(229853002)(81156014)(81166006)(8676002)(64756008)(66446008)(478600001)(66556008)(6636002)(110136005)(99286004)(54906003)(486006)(74316002)(476003)(44832011)(66066001)(9686003)(186003)(33656002)(7416002)(53936002)(76116006)(305945005)(142933001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5933;
 H:VI1PR04MB3247.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: M1qGmsO20WONwOEOaedKUL6ic35ici+A4ebYOEdxYesGn+afa++hIDUp5VhQBl9pilhJHURdrIOaJzCkl+FkcinDOLYkWRdiCUpG/8VJjtq005vXwOIKrfARtlntWu9Cxe/xFJMEAm44Zyfmqups5MGF+nVwfABxDM835cO6R82557D/F60hZ0MKufxJxeVLeqPHnhuuP6Po1nvaAAZ1TxQ8+8gzAoHpB6MqiuAwgXmIUorIzJHg4GnT/CwlLm0QR3zy5sMqyWE9Tx+tuvTzPGuO6Al7kpgm+Sc2/y49+z5Ut5cB6s3GUcAFp5QI3kXF4f4mMw0PMXtLXb3XqL3Y1lwXISQTnt4SEaHtb6baWYaFhGCF/2LCGFNPk29P8pqL3/HkXkqu2AmhFI1UXBXvwvuOtLQtu6o5dGMC31z3rJQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 236602db-1e54-416a-be00-08d6d426bbbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 02:33:34.2398 (UTC)
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
PFJhc211cy5WaWxsZW1vZXNAcHJldmFzLnNlPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgNS82XSBz
b2MvZnNsL3FlOiBxZS5jOiBzdXBwb3J0IGZzbCxxZS1zbnVtcyBwcm9wZXJ0eQ0KPiANCj4gQWRk
IGRyaXZlciBzdXBwb3J0IGZvciB0aGUgbmV3bHkgaW50cm9kdWNlZCBmc2wscWUtc251bXMgcHJv
cGVydHkuDQo+IA0KPiBDb252ZW5pZW50bHksIG9mX3Byb3BlcnR5X3JlYWRfdmFyaWFibGVfdThf
YXJyYXkgZG9lcyBleGFjdGx5IHdoYXQgd2UNCj4gbmVlZDogSWYgdGhlIHByb3BlcnR5IGZzbCxx
ZS1zbnVtcyBpcyBmb3VuZCAoYW5kIGhhcyBhbiBhbGxvd2VkIHNpemUpLCB0aGUgYXJyYXkNCj4g
b2YgdmFsdWVzIGdldCBjb3BpZWQgdG8gc251bXMsIGFuZCB0aGUgcmV0dXJuIHZhbHVlIGlzIHRo
ZSBudW1iZXIgb2Ygc251bXMgLQ0KPiB3ZSBjYW5ub3QgYXNzaWduIGRpcmVjdGx5IHRvIG51bV9v
Zl9zbnVtcywgc2luY2Ugd2UgbmVlZCB0byBjaGVjayB3aGV0aGVyDQo+IHRoZSByZXR1cm4gdmFs
dWUgaXMgbmVnYXRpdmUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSYXNtdXMgVmlsbGVtb2VzIDxy
YXNtdXMudmlsbGVtb2VzQHByZXZhcy5kaz4NCj4gLS0tDQogDQpSZXZpZXdlZC1ieTogUWlhbmcg
WmhhbyA8cWlhbmcuemhhb0BueHAuY29tPg0KDQo+ICBkcml2ZXJzL3NvYy9mc2wvcWUvcWUuYyB8
IDE2ICsrKysrKysrKysrKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL2ZzbC9xZS9x
ZS5jIGIvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMgaW5kZXgNCj4gMGZiOGI1OWY2MWFkLi4zMjVk
Njg5Y2JmNWMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc29jL2ZzbC9xZS9xZS5jDQo+ICsrKyBi
L2RyaXZlcnMvc29jL2ZzbC9xZS9xZS5jDQo+IEBAIC0yODMsNyArMjgzLDYgQEAgRVhQT1JUX1NZ
TUJPTChxZV9jbG9ja19zb3VyY2UpOw0KPiAgICovDQo+ICBzdGF0aWMgdm9pZCBxZV9zbnVtc19p
bml0KHZvaWQpDQo+ICB7DQo+IC0gICAgICAgaW50IGk7DQo+ICAgICAgICAgc3RhdGljIGNvbnN0
IHU4IHNudW1faW5pdF83NltdID0gew0KPiAgICAgICAgICAgICAgICAgMHgwNCwgMHgwNSwgMHgw
QywgMHgwRCwgMHgxNCwgMHgxNSwgMHgxQywgMHgxRCwNCj4gICAgICAgICAgICAgICAgIDB4MjQs
IDB4MjUsIDB4MkMsIDB4MkQsIDB4MzQsIDB4MzUsIDB4ODgsIDB4ODksIEBADQo+IC0zMDQsNyAr
MzAzLDIxIEBAIHN0YXRpYyB2b2lkIHFlX3NudW1zX2luaXQodm9pZCkNCj4gICAgICAgICAgICAg
ICAgIDB4MjgsIDB4MjksIDB4MzgsIDB4MzksIDB4NDgsIDB4NDksIDB4NTgsIDB4NTksDQo+ICAg
ICAgICAgICAgICAgICAweDY4LCAweDY5LCAweDc4LCAweDc5LCAweDgwLCAweDgxLA0KPiAgICAg
ICAgIH07DQo+ICsgICAgICAgc3RydWN0IGRldmljZV9ub2RlICpxZTsNCj4gICAgICAgICBjb25z
dCB1OCAqc251bV9pbml0Ow0KPiArICAgICAgIGludCBpOw0KPiArDQo+ICsgICAgICAgYml0bWFw
X3plcm8oc251bV9zdGF0ZSwgUUVfTlVNX09GX1NOVU0pOw0KPiArICAgICAgIHFlID0gcWVfZ2V0
X2RldmljZV9ub2RlKCk7DQo+ICsgICAgICAgaWYgKHFlKSB7DQo+ICsgICAgICAgICAgICAgICBp
ID0gb2ZfcHJvcGVydHlfcmVhZF92YXJpYWJsZV91OF9hcnJheShxZSwgImZzbCxxZS1zbnVtcyIs
DQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzbnVtcywgMSwNCj4gUUVfTlVNX09GX1NOVU0pOw0KPiArICAgICAgICAgICAgICAgb2Zfbm9k
ZV9wdXQocWUpOw0KPiArICAgICAgICAgICAgICAgaWYgKGkgPiAwKSB7DQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHFlX251bV9vZl9zbnVtID0gaTsNCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuOw0KPiArICAgICAgICAgICAgICAgfQ0KPiArICAgICAgIH0NCj4gDQo+ICAgICAg
ICAgcWVfbnVtX29mX3NudW0gPSBxZV9nZXRfbnVtX29mX3NudW1zKCk7DQo+IA0KPiBAQCAtMzEz
LDcgKzMyNiw2IEBAIHN0YXRpYyB2b2lkIHFlX3NudW1zX2luaXQodm9pZCkNCj4gICAgICAgICBl
bHNlDQo+ICAgICAgICAgICAgICAgICBzbnVtX2luaXQgPSBzbnVtX2luaXRfNDY7DQo+IA0KPiAt
ICAgICAgIGJpdG1hcF96ZXJvKHNudW1fc3RhdGUsIFFFX05VTV9PRl9TTlVNKTsNCj4gICAgICAg
ICBtZW1jcHkoc251bXMsIHNudW1faW5pdCwgcWVfbnVtX29mX3NudW0pOyAgfQ0KPiANCj4gLS0N
Cj4gMi4yMC4xDQpCZXN0IFJlZ2FyZHMNClFpYW5nIFpoYW8NCg==
