Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 064BC183DB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 04:37:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zyD841CwzDqPk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 12:37:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.82; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=qiang.zhao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="X9R3AlcC"; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150082.outbound.protection.outlook.com [40.107.15.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zyBq0SyVzDq5t
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 12:36:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OONjG6H4vLUi9w8g3oO4gpoe3wF5F0QcVtLtdHcCXwI=;
 b=X9R3AlcCKYC2kuEg3QDhqSJ84UDHvSYb7w5PAR+99sorcQ90XjGyHb1fKyilVT0zYJo0MQFwFGbo3NTDiPuUug76rPjAQhzLDO0EL98vYxMubGoZARrcM/rha1ujDVk276LMEIWpC+y9u9Pfn5pjryLktrYaJkttvgA2gObZG9E=
Received: from VI1PR04MB3247.eurprd04.prod.outlook.com (10.170.232.160) by
 VI1PR04MB5933.eurprd04.prod.outlook.com (20.178.205.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Thu, 9 May 2019 02:35:57 +0000
Received: from VI1PR04MB3247.eurprd04.prod.outlook.com
 ([fe80::cd99:d9b2:d90a:6c2]) by VI1PR04MB3247.eurprd04.prod.outlook.com
 ([fe80::cd99:d9b2:d90a:6c2%2]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 02:35:57 +0000
From: Qiang Zhao <qiang.zhao@nxp.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li
 <leoyang.li@nxp.com>
Subject: RE: [EXT] [PATCH v2 6/6] soc/fsl/qe: qe.c: fold qe_get_num_of_snums
 into qe_snums_init
Thread-Topic: [EXT] [PATCH v2 6/6] soc/fsl/qe: qe.c: fold qe_get_num_of_snums
 into qe_snums_init
Thread-Index: AQHVAABXTquhlkr+A0av+N7ek+LWPaZiH4/Q
Date: Thu, 9 May 2019 02:35:56 +0000
Message-ID: <VI1PR04MB3247EC77FE4096B891DFAA1F91330@VI1PR04MB3247.eurprd04.prod.outlook.com>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-7-rasmus.villemoes@prevas.dk>
In-Reply-To: <20190501092841.9026-7-rasmus.villemoes@prevas.dk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=qiang.zhao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55156121-536d-4330-2608-08d6d42710d5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB5933; 
x-ms-traffictypediagnostic: VI1PR04MB5933:
x-microsoft-antispam-prvs: <VI1PR04MB59336EFA497DB2EB2F815A3091330@VI1PR04MB5933.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(346002)(39860400002)(366004)(136003)(396003)(199004)(189003)(13464003)(86362001)(256004)(6436002)(55016002)(316002)(66946007)(73956011)(2501003)(6246003)(7696005)(6506007)(53546011)(3846002)(6116002)(102836004)(5660300002)(52536014)(7736002)(71200400001)(71190400001)(26005)(68736007)(2906002)(66476007)(8936002)(76176011)(4326008)(14454004)(25786009)(229853002)(81156014)(81166006)(8676002)(64756008)(66446008)(478600001)(66556008)(6636002)(11346002)(110136005)(99286004)(54906003)(486006)(74316002)(476003)(44832011)(66066001)(9686003)(186003)(33656002)(7416002)(53936002)(446003)(76116006)(305945005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5933;
 H:VI1PR04MB3247.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: H9Xo7D0f/02SuB3huP9Q1NItgM1lzRa9nKHyImg6HINtHNcslAtFqTkFPe1EL+nDChwNUtSYTiCavOiWfJ7G9eO0u+slj3iN2toO0a1JZFCzfC6WFx5ZSnKIpPwzxCdAqMjsdagXHpglCWWSMaNB4bj9GKGxynckCPRiyUYWwTnEg6lZ2lCjP8FR19mGr8BNWgKxmhFq5bEDQY+cH65AKWT1kcVWbrZXusqY/M4o9QzOmp1idmR3z7fXicNpzX95jEe2AdLOlhRXshmUwbJTtWrb6W6WtnkYnS+NOxxb5zIKtkWAwQsy+6uHN2c7DvrEL1UpCpUebHdnDTg7iOEBCwfvnflrg60QFlxmQ0+HIbC/lYbptqEhGAOUzAIYeos3oRr2Nzpj5xL+cElREoVzwOwVG7WRFZagWr+SuAR8QYE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55156121-536d-4330-2608-08d6d42710d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 02:35:56.9180 (UTC)
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
PFJhc211cy5WaWxsZW1vZXNAcHJldmFzLnNlPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgNi82XSBz
b2MvZnNsL3FlOiBxZS5jOiBmb2xkIHFlX2dldF9udW1fb2Zfc251bXMgaW50bw0KPiBxZV9zbnVt
c19pbml0DQo+IA0KPiBUaGUgY29tbWVudCAiTm8gUUUgZXZlciBoYXMgZmV3ZXIgdGhhbiAyOCBT
TlVNcyIgaXMgZmFsc2U7IGUuZy4gdGhlDQo+IE1QQzgzMDkgaGFzIDE0LiBUaGUgY29kZSBwYXRo
IHJldHVybmluZyAtRUlOVkFMIGlzIGFsc28gYSByZWNpcGUgZm9yIGluc3RhbnQNCj4gZGlzYXN0
ZXIsIHNpbmNlIHRoZSBjYWxsZXIgKHFlX3NudW1zX2luaXQpIHVuY3JpdGljYWxseSBhc3NpZ25z
IHRoZSByZXR1cm4gdmFsdWUgdG8NCj4gdGhlIHVuc2lnbmVkIHFlX251bV9vZl9zbnVtLCBhbmQg
d291bGQgdGh1cyBwcm9jZWVkIHRvIGF0dGVtcHQgdG8gY29weQ0KPiA0R0IgZnJvbSBzbnVtX2lu
aXRfNDZbXSB0byB0aGUgc251bVtdIGFycmF5Lg0KPiANCj4gU28gZm9sZCB0aGUgaGFuZGxpbmcg
b2YgdGhlIGxlZ2FjeSBmc2wscWUtbnVtLXNudW1zIGludG8gcWVfc251bXNfaW5pdCwgYW5kDQo+
IG1ha2Ugc3VyZSB3ZSBkbyBub3QgZW5kIHVwIHVzaW5nIHRoZSBzbnVtX2luaXRfNDYgYXJyYXkg
aW4gY2FzZXMgb3RoZXIgdGhhbg0KPiB0aGUgdHdvIHdoZXJlIHdlIGtub3cgaXQgbWFrZXMgc2Vu
c2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSYXNtdXMgVmlsbGVtb2VzIDxyYXNtdXMudmlsbGVt
b2VzQHByZXZhcy5kaz4NCj4gLS0tDQogDQpSZXZpZXdlZC1ieTogUWlhbmcgWmhhbyA8cWlhbmcu
emhhb0BueHAuY29tPg0KDQo+ICBkcml2ZXJzL3NvYy9mc2wvcWUvcWUuYyB8IDQ2ICsrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zb2MvZnNsL3FlL3FlLmMgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcWUuYyBpbmRleA0KPiAzMjVk
Njg5Y2JmNWMuLjI3NmQ3ZDc4ZWJmYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9zb2MvZnNsL3Fl
L3FlLmMNCj4gKysrIGIvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMNCj4gQEAgLTMwOCwyNCArMzA4
LDMzIEBAIHN0YXRpYyB2b2lkIHFlX3NudW1zX2luaXQodm9pZCkNCj4gICAgICAgICBpbnQgaTsN
Cj4gDQo+ICAgICAgICAgYml0bWFwX3plcm8oc251bV9zdGF0ZSwgUUVfTlVNX09GX1NOVU0pOw0K
PiArICAgICAgIHFlX251bV9vZl9zbnVtID0gMjg7IC8qIFRoZSBkZWZhdWx0IG51bWJlciBvZiBz
bnVtIGZvciB0aHJlYWRzDQo+ICsgaXMgMjggKi8NCj4gICAgICAgICBxZSA9IHFlX2dldF9kZXZp
Y2Vfbm9kZSgpOw0KPiAgICAgICAgIGlmIChxZSkgew0KPiAgICAgICAgICAgICAgICAgaSA9IG9m
X3Byb3BlcnR5X3JlYWRfdmFyaWFibGVfdThfYXJyYXkocWUsICJmc2wscWUtc251bXMiLA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc251
bXMsIDEsDQo+IFFFX05VTV9PRl9TTlVNKTsNCj4gLSAgICAgICAgICAgICAgIG9mX25vZGVfcHV0
KHFlKTsNCj4gICAgICAgICAgICAgICAgIGlmIChpID4gMCkgew0KPiArICAgICAgICAgICAgICAg
ICAgICAgICBvZl9ub2RlX3B1dChxZSk7DQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHFlX251
bV9vZl9zbnVtID0gaTsNCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOw0KPiAgICAg
ICAgICAgICAgICAgfQ0KPiArICAgICAgICAgICAgICAgLyoNCj4gKyAgICAgICAgICAgICAgICAq
IEZhbGwgYmFjayB0byBsZWdhY3kgYmluZGluZyBvZiB1c2luZyB0aGUgdmFsdWUgb2YNCj4gKyAg
ICAgICAgICAgICAgICAqIGZzbCxxZS1udW0tc251bXMgdG8gY2hvb3NlIG9uZSBvZiB0aGUgc3Rh
dGljIGFycmF5cw0KPiArICAgICAgICAgICAgICAgICogYWJvdmUuDQo+ICsgICAgICAgICAgICAg
ICAgKi8NCj4gKyAgICAgICAgICAgICAgIG9mX3Byb3BlcnR5X3JlYWRfdTMyKHFlLCAiZnNsLHFl
LW51bS1zbnVtcyIsDQo+ICZxZV9udW1fb2Zfc251bSk7DQo+ICsgICAgICAgICAgICAgICBvZl9u
b2RlX3B1dChxZSk7DQo+ICAgICAgICAgfQ0KPiANCj4gLSAgICAgICBxZV9udW1fb2Zfc251bSA9
IHFlX2dldF9udW1fb2Zfc251bXMoKTsNCj4gLQ0KPiAtICAgICAgIGlmIChxZV9udW1fb2Zfc251
bSA9PSA3NikNCj4gKyAgICAgICBpZiAocWVfbnVtX29mX3NudW0gPT0gNzYpIHsNCj4gICAgICAg
ICAgICAgICAgIHNudW1faW5pdCA9IHNudW1faW5pdF83NjsNCj4gLSAgICAgICBlbHNlDQo+ICsg
ICAgICAgfSBlbHNlIGlmIChxZV9udW1fb2Zfc251bSA9PSAyOCB8fCBxZV9udW1fb2Zfc251bSA9
PSA0Nikgew0KPiAgICAgICAgICAgICAgICAgc251bV9pbml0ID0gc251bV9pbml0XzQ2Ow0KPiAt
DQo+ICsgICAgICAgfSBlbHNlIHsNCj4gKyAgICAgICAgICAgICAgIHByX2VycigiUUU6IHVuc3Vw
cG9ydGVkIHZhbHVlIG9mIGZzbCxxZS1udW0tc251bXM6ICV1XG4iLA0KPiBxZV9udW1fb2Zfc251
bSk7DQo+ICsgICAgICAgICAgICAgICByZXR1cm47DQo+ICsgICAgICAgfQ0KPiAgICAgICAgIG1l
bWNweShzbnVtcywgc251bV9pbml0LCBxZV9udW1fb2Zfc251bSk7ICB9DQo+IA0KPiBAQCAtNjQx
LDMwICs2NTAsNyBAQCBFWFBPUlRfU1lNQk9MKHFlX2dldF9udW1fb2ZfcmlzYyk7DQo+IA0KPiAg
dW5zaWduZWQgaW50IHFlX2dldF9udW1fb2Zfc251bXModm9pZCkNCj4gIHsNCj4gLSAgICAgICBz
dHJ1Y3QgZGV2aWNlX25vZGUgKnFlOw0KPiAtICAgICAgIGludCBzaXplOw0KPiAtICAgICAgIHVu
c2lnbmVkIGludCBudW1fb2Zfc251bXM7DQo+IC0gICAgICAgY29uc3QgdTMyICpwcm9wOw0KPiAt
DQo+IC0gICAgICAgbnVtX29mX3NudW1zID0gMjg7IC8qIFRoZSBkZWZhdWx0IG51bWJlciBvZiBz
bnVtIGZvciB0aHJlYWRzIGlzIDI4DQo+ICovDQo+IC0gICAgICAgcWUgPSBxZV9nZXRfZGV2aWNl
X25vZGUoKTsNCj4gLSAgICAgICBpZiAoIXFlKQ0KPiAtICAgICAgICAgICAgICAgcmV0dXJuIG51
bV9vZl9zbnVtczsNCj4gLQ0KPiAtICAgICAgIHByb3AgPSBvZl9nZXRfcHJvcGVydHkocWUsICJm
c2wscWUtbnVtLXNudW1zIiwgJnNpemUpOw0KPiAtICAgICAgIGlmIChwcm9wICYmIHNpemUgPT0g
c2l6ZW9mKCpwcm9wKSkgew0KPiAtICAgICAgICAgICAgICAgbnVtX29mX3NudW1zID0gKnByb3A7
DQo+IC0gICAgICAgICAgICAgICBpZiAoKG51bV9vZl9zbnVtcyA8IDI4KSB8fCAobnVtX29mX3Nu
dW1zID4NCj4gUUVfTlVNX09GX1NOVU0pKSB7DQo+IC0gICAgICAgICAgICAgICAgICAgICAgIC8q
IE5vIFFFIGV2ZXIgaGFzIGZld2VyIHRoYW4gMjggU05VTXMgKi8NCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgcHJfZXJyKCJRRTogbnVtYmVyIG9mIHNudW0gaXMgaW52YWxpZFxuIik7DQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KHFlKTsNCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+IC0gICAgICAgICAgICAgICB9DQo+IC0gICAgICAg
fQ0KPiAtDQo+IC0gICAgICAgb2Zfbm9kZV9wdXQocWUpOw0KPiAtDQo+IC0gICAgICAgcmV0dXJu
IG51bV9vZl9zbnVtczsNCj4gKyAgICAgICByZXR1cm4gcWVfbnVtX29mX3NudW07DQo+ICB9DQo+
ICBFWFBPUlRfU1lNQk9MKHFlX2dldF9udW1fb2Zfc251bXMpOw0KPiANCj4gLS0NCj4gMi4yMC4x
DQoNCkJlc3QgUmVnYXJkcw0KUWlhbmcgWmhhbw0K
