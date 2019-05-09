Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDEFF183CE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 04:33:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zy7Z6RnpzDqMh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2019 12:33:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.49; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=qiang.zhao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="fQFVX2pJ"; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150049.outbound.protection.outlook.com [40.107.15.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zy6D0FhnzDqJq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2019 12:32:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGVyPKQUGI6N7WyDaxOkEg1WSZXIStaN1KNWBMC3bIA=;
 b=fQFVX2pJ3nxuyDR1zoLmSym11QpvpntVJI4mcsgoCETPbPFrQS56HorLsxPylTqnLDJPPivTzn0JM8hMTfrj1/i3epM/A6/K3ni+zVJn05IrZYXV+k9Bhq9KzTzSpQbkafWcphmlHK/a4llVftmbT3Xlj3ib8h9cjItBJsxaOrw=
Received: from VI1PR04MB3247.eurprd04.prod.outlook.com (10.170.232.160) by
 VI1PR04MB5933.eurprd04.prod.outlook.com (20.178.205.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.21; Thu, 9 May 2019 02:31:57 +0000
Received: from VI1PR04MB3247.eurprd04.prod.outlook.com
 ([fe80::cd99:d9b2:d90a:6c2]) by VI1PR04MB3247.eurprd04.prod.outlook.com
 ([fe80::cd99:d9b2:d90a:6c2%2]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 02:31:57 +0000
From: Qiang Zhao <qiang.zhao@nxp.com>
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Leo Li
 <leoyang.li@nxp.com>
Subject: RE: [PATCH v2 3/6] soc/fsl/qe: qe.c: introduce qe_get_device_node
 helper
Thread-Topic: [PATCH v2 3/6] soc/fsl/qe: qe.c: introduce qe_get_device_node
 helper
Thread-Index: AdUGD0vdZaCon61EQOSKoCqvu36yJA==
Date: Thu, 9 May 2019 02:31:57 +0000
Message-ID: <VI1PR04MB324790118B79E0A04082FE4A91330@VI1PR04MB3247.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=qiang.zhao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 55d79bd4-5f0b-414b-8008-08d6d426823b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB5933; 
x-ms-traffictypediagnostic: VI1PR04MB5933:
x-microsoft-antispam-prvs: <VI1PR04MB5933A1A802E9E3241BE247F891330@VI1PR04MB5933.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:628;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(396003)(39860400002)(346002)(376002)(13464003)(189003)(199004)(66446008)(64756008)(8676002)(81166006)(81156014)(6636002)(478600001)(66556008)(229853002)(68736007)(26005)(66476007)(2906002)(7736002)(71190400001)(71200400001)(8936002)(14454004)(25786009)(4326008)(486006)(33656002)(186003)(7416002)(76116006)(305945005)(53936002)(54906003)(110136005)(99286004)(74316002)(476003)(9686003)(66066001)(44832011)(6246003)(2501003)(66946007)(316002)(55016002)(73956011)(7696005)(86362001)(256004)(6436002)(5660300002)(52536014)(6116002)(53546011)(6506007)(3846002)(102836004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB5933;
 H:VI1PR04MB3247.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: sdLGlcIcK5F0zFZHgGk2r1oHBIVAwLBVPVp01rktrxxMkKm7oJtSYzEV2rIyKGdQk+xblKzCRlWZY4ZECJ0AfRdGU2htWaYQ4VG0QwsTHijAzaS5oS8krZA2QY9f2P5CZj0zcCx+78r4fWY6L3+zWXXsV56n4NDzRxop7NMYYUo6c6rDgpw+DqHp2CIkWN0vwfU+S9KiORgjP1C+q5BqxasDr8mn7TJCD6hsnbAiSXuyTmrqMZ0MFUKfZUrwzR7ubWLdwtRc3FPL9n5TSkCt6sLQaC7RcOFAQD16VpCM+BWBfEJBVkemzLxX83umV/tZpzXNFK47TaY649blYPGBRU7TVZpWAyj9pPwzC0BjbftPejM9I3DHZOje3qSZJjf42vMztfmgM4ZRORMtf2hyrh1eYHKzrluZmUSzpAB2xCM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d79bd4-5f0b-414b-8008-08d6d426823b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 02:31:57.6786 (UTC)
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
PFJhc211cy5WaWxsZW1vZXNAcHJldmFzLnNlPg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjIgMy82XSBz
b2MvZnNsL3FlOiBxZS5jOiBpbnRyb2R1Y2UgcWVfZ2V0X2RldmljZV9ub2RlDQo+IGhlbHBlcg0K
PiANCj4gVGhlICd0cnkgb2ZfZmluZF9jb21wYXRpYmxlX25vZGUoTlVMTCwgTlVMTCwgImZzbCxx
ZSIpLCBmYWxsIGJhY2sgdG8NCj4gb2ZfZmluZF9ub2RlX2J5X3R5cGUoTlVMTCwgInFlIiknIHBh
dHRlcm4gaXMgcmVwZWF0ZWQgZml2ZSB0aW1lcy4gRmFjdG9yIGl0DQo+IGludG8gYSBjb21tb24g
aGVscGVyLg0KPiANCj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUu
bGVyb3lAYy1zLmZyPg0KPiBTaWduZWQtb2ZmLWJ5OiBSYXNtdXMgVmlsbGVtb2VzIDxyYXNtdXMu
dmlsbGVtb2VzQHByZXZhcy5kaz4NCj4gLS0tDQogDQpSZXZpZXdlZC1ieTogUWlhbmcgWmhhbyA8
cWlhbmcuemhhb0BueHAuY29tPg0KDQo+ICBkcml2ZXJzL3NvYy9mc2wvcWUvcWUuYyB8IDcxICsr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMjkgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMgYi9kcml2ZXJzL3NvYy9mc2wvcWUvcWUuYyBpbmRleA0K
PiAzMDNhYTI5Y2IyN2QuLjBmYjhiNTlmNjFhZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9zb2Mv
ZnNsL3FlL3FlLmMNCj4gKysrIGIvZHJpdmVycy9zb2MvZnNsL3FlL3FlLmMNCj4gQEAgLTU2LDYg
KzU2LDIwIEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgcWVfbnVtX29mX3NudW07DQo+IA0KPiAgc3Rh
dGljIHBoeXNfYWRkcl90IHFlYmFzZSA9IC0xOw0KPiANCj4gK3N0YXRpYyBzdHJ1Y3QgZGV2aWNl
X25vZGUgKnFlX2dldF9kZXZpY2Vfbm9kZSh2b2lkKSB7DQo+ICsgICAgICAgc3RydWN0IGRldmlj
ZV9ub2RlICpxZTsNCj4gKw0KPiArICAgICAgIC8qDQo+ICsgICAgICAgICogTmV3ZXIgZGV2aWNl
IHRyZWVzIGhhdmUgYW4gImZzbCxxZSIgY29tcGF0aWJsZSBwcm9wZXJ0eSBmb3IgdGhlDQo+IFFF
DQo+ICsgICAgICAgICogbm9kZSwgYnV0IHdlIHN0aWxsIG5lZWQgdG8gc3VwcG9ydCBvbGRlciBk
ZXZpY2UgdHJlZXMuDQo+ICsgICAgICAgICovDQo+ICsgICAgICAgcWUgPSBvZl9maW5kX2NvbXBh
dGlibGVfbm9kZShOVUxMLCBOVUxMLCAiZnNsLHFlIik7DQo+ICsgICAgICAgaWYgKHFlKQ0KPiAr
ICAgICAgICAgICAgICAgcmV0dXJuIHFlOw0KPiArICAgICAgIHJldHVybiBvZl9maW5kX25vZGVf
YnlfdHlwZShOVUxMLCAicWUiKTsgfQ0KPiArDQo+ICBzdGF0aWMgcGh5c19hZGRyX3QgZ2V0X3Fl
X2Jhc2Uodm9pZCkNCj4gIHsNCj4gICAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgKnFlOw0KPiBA
QCAtNjUsMTIgKzc5LDkgQEAgc3RhdGljIHBoeXNfYWRkcl90IGdldF9xZV9iYXNlKHZvaWQpDQo+
ICAgICAgICAgaWYgKHFlYmFzZSAhPSAtMSkNCj4gICAgICAgICAgICAgICAgIHJldHVybiBxZWJh
c2U7DQo+IA0KPiAtICAgICAgIHFlID0gb2ZfZmluZF9jb21wYXRpYmxlX25vZGUoTlVMTCwgTlVM
TCwgImZzbCxxZSIpOw0KPiAtICAgICAgIGlmICghcWUpIHsNCj4gLSAgICAgICAgICAgICAgIHFl
ID0gb2ZfZmluZF9ub2RlX2J5X3R5cGUoTlVMTCwgInFlIik7DQo+IC0gICAgICAgICAgICAgICBp
ZiAoIXFlKQ0KPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcWViYXNlOw0KPiAtICAg
ICAgIH0NCj4gKyAgICAgICBxZSA9IHFlX2dldF9kZXZpY2Vfbm9kZSgpOw0KPiArICAgICAgIGlm
ICghcWUpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcWViYXNlOw0KPiANCj4gICAgICAgICBy
ZXQgPSBvZl9hZGRyZXNzX3RvX3Jlc291cmNlKHFlLCAwLCAmcmVzKTsNCj4gICAgICAgICBpZiAo
IXJldCkNCj4gQEAgLTE2NCwxMiArMTc1LDkgQEAgdW5zaWduZWQgaW50IHFlX2dldF9icmdfY2xr
KHZvaWQpDQo+ICAgICAgICAgaWYgKGJyZ19jbGspDQo+ICAgICAgICAgICAgICAgICByZXR1cm4g
YnJnX2NsazsNCj4gDQo+IC0gICAgICAgcWUgPSBvZl9maW5kX2NvbXBhdGlibGVfbm9kZShOVUxM
LCBOVUxMLCAiZnNsLHFlIik7DQo+IC0gICAgICAgaWYgKCFxZSkgew0KPiAtICAgICAgICAgICAg
ICAgcWUgPSBvZl9maW5kX25vZGVfYnlfdHlwZShOVUxMLCAicWUiKTsNCj4gLSAgICAgICAgICAg
ICAgIGlmICghcWUpDQo+IC0gICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBicmdfY2xrOw0K
PiAtICAgICAgIH0NCj4gKyAgICAgICBxZSA9IHFlX2dldF9kZXZpY2Vfbm9kZSgpOw0KPiArICAg
ICAgIGlmICghcWUpDQo+ICsgICAgICAgICAgICAgICByZXR1cm4gYnJnX2NsazsNCj4gDQo+ICAg
ICAgICAgcHJvcCA9IG9mX2dldF9wcm9wZXJ0eShxZSwgImJyZy1mcmVxdWVuY3kiLCAmc2l6ZSk7
DQo+ICAgICAgICAgaWYgKHByb3AgJiYgc2l6ZSA9PSBzaXplb2YoKnByb3ApKSBAQCAtNTU3LDE2
ICs1NjUsOSBAQCBzdHJ1Y3QNCj4gcWVfZmlybXdhcmVfaW5mbyAqcWVfZ2V0X2Zpcm13YXJlX2lu
Zm8odm9pZCkNCj4gDQo+ICAgICAgICAgaW5pdGlhbGl6ZWQgPSAxOw0KPiANCj4gLSAgICAgICAv
Kg0KPiAtICAgICAgICAqIE5ld2VyIGRldmljZSB0cmVlcyBoYXZlIGFuICJmc2wscWUiIGNvbXBh
dGlibGUgcHJvcGVydHkgZm9yIHRoZSBRRQ0KPiAtICAgICAgICAqIG5vZGUsIGJ1dCB3ZSBzdGls
bCBuZWVkIHRvIHN1cHBvcnQgb2xkZXIgZGV2aWNlIHRyZWVzLg0KPiAtICAgICAgICovDQo+IC0g
ICAgICAgcWUgPSBvZl9maW5kX2NvbXBhdGlibGVfbm9kZShOVUxMLCBOVUxMLCAiZnNsLHFlIik7
DQo+IC0gICAgICAgaWYgKCFxZSkgew0KPiAtICAgICAgICAgICAgICAgcWUgPSBvZl9maW5kX25v
ZGVfYnlfdHlwZShOVUxMLCAicWUiKTsNCj4gLSAgICAgICAgICAgICAgIGlmICghcWUpDQo+IC0g
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBOVUxMOw0KPiAtICAgICAgIH0NCj4gKyAgICAg
ICBxZSA9IHFlX2dldF9kZXZpY2Vfbm9kZSgpOw0KPiArICAgICAgIGlmICghcWUpDQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gTlVMTDsNCj4gDQo+ICAgICAgICAgLyogRmluZCB0aGUgJ2Zpcm13
YXJlJyBjaGlsZCBub2RlICovDQo+ICAgICAgICAgZncgPSBvZl9nZXRfY2hpbGRfYnlfbmFtZShx
ZSwgImZpcm13YXJlIik7IEBAIC02MTIsMTYgKzYxMyw5DQo+IEBAIHVuc2lnbmVkIGludCBxZV9n
ZXRfbnVtX29mX3Jpc2Modm9pZCkNCj4gICAgICAgICB1bnNpZ25lZCBpbnQgbnVtX29mX3Jpc2Mg
PSAwOw0KPiAgICAgICAgIGNvbnN0IHUzMiAqcHJvcDsNCj4gDQo+IC0gICAgICAgcWUgPSBvZl9m
aW5kX2NvbXBhdGlibGVfbm9kZShOVUxMLCBOVUxMLCAiZnNsLHFlIik7DQo+IC0gICAgICAgaWYg
KCFxZSkgew0KPiAtICAgICAgICAgICAgICAgLyogT2xkZXIgZGV2aWNlcyB0cmVlcyBkaWQgbm90
IGhhdmUgYW4gImZzbCxxZSINCj4gLSAgICAgICAgICAgICAgICAqIGNvbXBhdGlibGUgcHJvcGVy
dHksIHNvIHdlIG5lZWQgdG8gbG9vayBmb3INCj4gLSAgICAgICAgICAgICAgICAqIHRoZSBRRSBu
b2RlIGJ5IG5hbWUuDQo+IC0gICAgICAgICAgICAgICAgKi8NCj4gLSAgICAgICAgICAgICAgIHFl
ID0gb2ZfZmluZF9ub2RlX2J5X3R5cGUoTlVMTCwgInFlIik7DQo+IC0gICAgICAgICAgICAgICBp
ZiAoIXFlKQ0KPiAtICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gbnVtX29mX3Jpc2M7DQo+
IC0gICAgICAgfQ0KPiArICAgICAgIHFlID0gcWVfZ2V0X2RldmljZV9ub2RlKCk7DQo+ICsgICAg
ICAgaWYgKCFxZSkNCj4gKyAgICAgICAgICAgICAgIHJldHVybiBudW1fb2ZfcmlzYzsNCj4gDQo+
ICAgICAgICAgcHJvcCA9IG9mX2dldF9wcm9wZXJ0eShxZSwgImZzbCxxZS1udW0tcmlzY3MiLCAm
c2l6ZSk7DQo+ICAgICAgICAgaWYgKHByb3AgJiYgc2l6ZSA9PSBzaXplb2YoKnByb3ApKSBAQCAt
NjQxLDE2ICs2MzUsOSBAQCB1bnNpZ25lZA0KPiBpbnQgcWVfZ2V0X251bV9vZl9zbnVtcyh2b2lk
KQ0KPiAgICAgICAgIGNvbnN0IHUzMiAqcHJvcDsNCj4gDQo+ICAgICAgICAgbnVtX29mX3NudW1z
ID0gMjg7IC8qIFRoZSBkZWZhdWx0IG51bWJlciBvZiBzbnVtIGZvciB0aHJlYWRzIGlzIDI4DQo+
ICovDQo+IC0gICAgICAgcWUgPSBvZl9maW5kX2NvbXBhdGlibGVfbm9kZShOVUxMLCBOVUxMLCAi
ZnNsLHFlIik7DQo+IC0gICAgICAgaWYgKCFxZSkgew0KPiAtICAgICAgICAgICAgICAgLyogT2xk
ZXIgZGV2aWNlcyB0cmVlcyBkaWQgbm90IGhhdmUgYW4gImZzbCxxZSINCj4gLSAgICAgICAgICAg
ICAgICAqIGNvbXBhdGlibGUgcHJvcGVydHksIHNvIHdlIG5lZWQgdG8gbG9vayBmb3INCj4gLSAg
ICAgICAgICAgICAgICAqIHRoZSBRRSBub2RlIGJ5IG5hbWUuDQo+IC0gICAgICAgICAgICAgICAg
Ki8NCj4gLSAgICAgICAgICAgICAgIHFlID0gb2ZfZmluZF9ub2RlX2J5X3R5cGUoTlVMTCwgInFl
Iik7DQo+IC0gICAgICAgICAgICAgICBpZiAoIXFlKQ0KPiAtICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gbnVtX29mX3NudW1zOw0KPiAtICAgICAgIH0NCj4gKyAgICAgICBxZSA9IHFlX2dl
dF9kZXZpY2Vfbm9kZSgpOw0KPiArICAgICAgIGlmICghcWUpDQo+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gbnVtX29mX3NudW1zOw0KPiANCj4gICAgICAgICBwcm9wID0gb2ZfZ2V0X3Byb3BlcnR5
KHFlLCAiZnNsLHFlLW51bS1zbnVtcyIsICZzaXplKTsNCj4gICAgICAgICBpZiAocHJvcCAmJiBz
aXplID09IHNpemVvZigqcHJvcCkpIHsNCj4gLS0NCj4gMi4yMC4xDQoNCg0KQmVzdCBSZWdhcmRz
DQpRaWFuZyBaaGFvDQo=
