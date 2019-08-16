Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C60A99009B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 13:18:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4691633K7hzDrC8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 21:18:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=2a01:111:f400:fe1f::60c;
 helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="KRJP5CH2"; 
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on060c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1f::60c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4691213HbCzDrC1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 21:15:01 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BgXn8u3KIbjkhc3LX/r6wVWe5kuCeeyCDF1kiLhdWXEj4m8GXZ7zlO/rQOQKNFtMPj2L+IjSj2oyQsqAYfn5LPIpbLoiQp4N0YkyR6YCEkskiv0mXtbQqDG9r0vpnBTT+X0h6jyPMwx7iL3eajKI/zmjwouis9fnL4P2pdL0/oYCiqbLjoqYfSgHJkM/kcwLdO1aWkI3gNKzAWztvCfSok39el3xChZ+DI44eAe+7Gxmzhgz95q/hItvHaRlI2qUjZDtvEuepwGTghHHyFl/yBRaYCR2zR4cKGU7CsEPbwT3XpOY8t6iAqXF0DbuuQ13gUJYqTlxGBSeXGtqBAnufQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEfrIoj1VeXCsC/pNaoff2qXNr3bp0X1kxe6Q7Qxi6E=;
 b=iH8zgK632UfMrtmRUhaQ0DQ3MiFoGv2+Mnp1OR2E5qY/FIRS/QxKtuSortqx5jjs1i02HjUtiHnXETIkP//RXMKatzCdBa3oEVV0n0ZdAxJvZWZnu/1glUq80YvooRFBRY2akjR6SGZ8W9oC6UAkvs6bWGzZWRewrD85SCitiF2zgVz96dySihHnEjQDjkayRrIuzHUGhWgD5l/SxWumIh7gRe8TYUnCY7j+aAtxri5ylRpn6E5tBRKSVAAaYhe0FPXPRhAPgMS0MfjGARFwm0M/wo+Hzxtz4TW/iLYnx1zPx6vQB7Q/v386TB+2OgWllxk6jvCho3QedFMEgczBjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sEfrIoj1VeXCsC/pNaoff2qXNr3bp0X1kxe6Q7Qxi6E=;
 b=KRJP5CH2VnEGHZtTIkeuGuo3ys9+x93x9LApL/BZ7hA7KLS9jk5YR9PfqfuK5ylL3UE5Re+Etuqe3t7B5SsN/R4uKFU5JDmcxpSH5/aDOYW55oBRRhiD8wRuLyeaBLsSO3Qa8+J12CqqW/vAt79gF/1X/GxYdxUR8z7EhbRWYxg=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3057.eurprd04.prod.outlook.com (10.175.229.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 11:14:53 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84%5]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 11:14:53 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, Andrew Murray
 <andrew.murray@arm.com>
Subject: RE: [PATCH 02/10] PCI: designware-ep: Add the doorbell mode of MSI-X
 in EP mode
Thread-Topic: [PATCH 02/10] PCI: designware-ep: Add the doorbell mode of MSI-X
 in EP mode
Thread-Index: AQHVU0YcWJbNSPGnu0G+CTkSpUEVo6b8GZ2AgAD8KOCAAIRHgIAABSCw
Date: Fri, 16 Aug 2019 11:14:53 +0000
Message-ID: <AM5PR04MB3299ABCA78FB6B105F4BCDC7F5AF0@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190815083716.4715-1-xiaowei.bao@nxp.com>
 <20190815083716.4715-2-xiaowei.bao@nxp.com>
 <20190815115340.GG43882@e119886-lin.cambridge.arm.com>
 <AM5PR04MB329973845D6396624AFDE547F5AF0@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <02cf2f3d-336c-85bb-1fb5-a141c5a9cf79@ti.com>
In-Reply-To: <02cf2f3d-336c-85bb-1fb5-a141c5a9cf79@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5539a45-1e6a-4677-a336-08d7223af671
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3057; 
x-ms-traffictypediagnostic: AM5PR04MB3057:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3057D557D535F0DA321B64A1F5AF0@AM5PR04MB3057.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(199004)(189003)(13464003)(64756008)(8936002)(66476007)(76116006)(476003)(66446008)(66556008)(66946007)(256004)(14444005)(3846002)(6116002)(9686003)(71190400001)(71200400001)(316002)(33656002)(53936002)(6246003)(14454004)(186003)(54906003)(110136005)(102836004)(26005)(2906002)(478600001)(25786009)(7736002)(486006)(99286004)(11346002)(446003)(305945005)(76176011)(7696005)(4326008)(74316002)(86362001)(44832011)(52536014)(66066001)(6436002)(8676002)(81166006)(81156014)(229853002)(6506007)(7416002)(55016002)(5660300002)(53546011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3057;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: fdhy5R5jELOfUiROEo7Fkj2CfMgM6Gtguq470p6miBvPotC3FUO+r7/e3snOpJYKFTB0otpLmZKqpOw2PTBMEWrbVzJiiYuWZv7miDYWwPYms4jH03RhBArGzZWVPGjBbPu5/Lsya0mi8UqwMBTavSwuL4kl/odtq+1wa7GiZwhdFMym9P2jR6QdYSLat1CKkMXTR0QARLhDthSJMqT4QLXH+efjdMuy8OHSuEQxavqPCT1yMcXnoa9JZGzOfmz/tzXnZTpM0UXT+U3gYvbVKmFOn+67gkQfdM7jtDmErs2c5sD+76sk+fhUZvbsYg76syYdC4FyTaQEXIVYkzqVs8FZ51Ox5J6jGzt5FyHpgRzjEvZkLv9QGtswUnn41MYdkN8KqC4d7RC9qGeoNQtDLU/OJAXttGJnC0VTrq7BMbA=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5539a45-1e6a-4677-a336-08d7223af671
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 11:14:53.3495 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3Xi3f+bvqmi6h3a1mYu+ZDZzhxxg0u7qPG5apHAO4BCtw/l/R02ArMcq3nXEb13wvjRWHpGHLoj74am5mcPITw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3057
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "Z.q. Hou" <zhiqiang.hou@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2lzaG9uIFZpamF5IEFi
cmFoYW0gSSA8a2lzaG9uQHRpLmNvbT4NCj4gU2VudDogMjAxOcTqONTCMTbI1SAxODo1MA0KPiBU
bzogWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54cC5jb20+OyBBbmRyZXcgTXVycmF5DQo+IDxh
bmRyZXcubXVycmF5QGFybS5jb20+DQo+IENjOiBqaW5nb29oYW4xQGdtYWlsLmNvbTsgZ3VzdGF2
by5waW1lbnRlbEBzeW5vcHN5cy5jb207DQo+IGJoZWxnYWFzQGdvb2dsZS5jb207IHJvYmgrZHRA
a2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7
IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPjsNCj4gbG9yZW56by5waWVyYWxpc2lAYXJtLmNv
bTsgYXJuZEBhcm5kYi5kZTsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7DQo+IE0uaC4gTGlh
biA8bWluZ2h1YW4ubGlhbkBueHAuY29tPjsgTWluZ2thaSBIdSA8bWluZ2thaS5odUBueHAuY29t
PjsNCj4gbGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc7IFoucS4g
SG91IDx6aGlxaWFuZy5ob3VAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCAwMi8xMF0g
UENJOiBkZXNpZ253YXJlLWVwOiBBZGQgdGhlIGRvb3JiZWxsIG1vZGUgb2YNCj4gTVNJLVggaW4g
RVAgbW9kZQ0KPiANCj4gSGksDQo+IA0KPiBPbiAxNi8wOC8xOSA4OjI4IEFNLCBYaWFvd2VpIEJh
byB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
IEZyb206IEFuZHJldyBNdXJyYXkgPGFuZHJldy5tdXJyYXlAYXJtLmNvbT4NCj4gPj4gU2VudDog
MjAxOcTqONTCMTXI1SAxOTo1NA0KPiA+PiBUbzogWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54
cC5jb20+DQo+ID4+IENjOiBqaW5nb29oYW4xQGdtYWlsLmNvbTsgZ3VzdGF2by5waW1lbnRlbEBz
eW5vcHN5cy5jb207DQo+ID4+IGJoZWxnYWFzQGdvb2dsZS5jb207IHJvYmgrZHRAa2VybmVsLm9y
ZzsgbWFyay5ydXRsYW5kQGFybS5jb207DQo+ID4+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IExlbyBM
aSA8bGVveWFuZy5saUBueHAuY29tPjsga2lzaG9uQHRpLmNvbTsNCj4gPj4gbG9yZW56by5waWVy
YWxpc2lAYXJtLmNvbTsgYXJuZEBhcm5kYi5kZTsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7
DQo+ID4+IE0uaC4gTGlhbiA8bWluZ2h1YW4ubGlhbkBueHAuY29tPjsgTWluZ2thaSBIdQ0KPiA8
bWluZ2thaS5odUBueHAuY29tPjsNCj4gPj4gUm95IFphbmcgPHJveS56YW5nQG54cC5jb20+OyBs
aW51eC1wY2lAdmdlci5rZXJuZWwub3JnOw0KPiA+PiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9y
ZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gPj4gbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZw0KPiA+PiBT
dWJqZWN0OiBSZTogW1BBVENIIDAyLzEwXSBQQ0k6IGRlc2lnbndhcmUtZXA6IEFkZCB0aGUgZG9v
cmJlbGwgbW9kZQ0KPiA+PiBvZiBNU0ktWCBpbiBFUCBtb2RlDQo+ID4+DQo+ID4+IE9uIFRodSwg
QXVnIDE1LCAyMDE5IGF0IDA0OjM3OjA4UE0gKzA4MDAsIFhpYW93ZWkgQmFvIHdyb3RlOg0KPiA+
Pj4gQWRkIHRoZSBkb29yYmVsbCBtb2RlIG9mIE1TSS1YIGluIEVQIG1vZGUuDQo+ID4+Pg0KPiA+
Pj4gU2lnbmVkLW9mZi1ieTogWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54cC5jb20+DQo+ID4+
PiAtLS0NCj4gPj4+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUt
ZXAuYyB8IDE0DQo+ICsrKysrKysrKysrKysrDQo+ID4+PiAgZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvcGNpZS1kZXNpZ253YXJlLmggICAgfCAxNA0KPiArKysrKysrKysrKysrKw0KPiA+Pj4g
IDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUtZXAuYw0KPiA+
Pj4gYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUtZXAuYw0KPiA+
Pj4gaW5kZXggNzVlMjk1NS4uZTNhN2NkZiAxMDA2NDQNCj4gPj4+IC0tLSBhL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1lcC5jDQo+ID4+PiArKysgYi9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUtZXAuYw0KPiA+Pj4gQEAgLTQ1NCw2
ICs0NTQsMjAgQEAgaW50IGR3X3BjaWVfZXBfcmFpc2VfbXNpX2lycShzdHJ1Y3QNCj4gZHdfcGNp
ZV9lcA0KPiA+PiAqZXAsIHU4IGZ1bmNfbm8sDQo+ID4+PiAgCXJldHVybiAwOw0KPiA+Pj4gIH0N
Cj4gPj4+DQo+ID4+PiAraW50IGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnFfZG9vcmJlbGwoc3Ry
dWN0IGR3X3BjaWVfZXAgKmVwLCB1OA0KPiA+PiBmdW5jX25vLA0KPiA+Pj4gKwkJCQkgICAgICAg
dTE2IGludGVycnVwdF9udW0pDQo+ID4+PiArew0KPiA+Pj4gKwlzdHJ1Y3QgZHdfcGNpZSAqcGNp
ID0gdG9fZHdfcGNpZV9mcm9tX2VwKGVwKTsNCj4gPj4+ICsJdTMyIG1zZ19kYXRhOw0KPiA+Pj4g
Kw0KPiA+Pj4gKwltc2dfZGF0YSA9IChmdW5jX25vIDw8IFBDSUVfTVNJWF9ET09SQkVMTF9QRl9T
SElGVCkgfA0KPiA+Pj4gKwkJICAgKGludGVycnVwdF9udW0gLSAxKTsNCj4gPj4+ICsNCj4gPj4+
ICsJZHdfcGNpZV93cml0ZWxfZGJpKHBjaSwgUENJRV9NU0lYX0RPT1JCRUxMLCBtc2dfZGF0YSk7
DQo+ID4+PiArDQo+ID4+PiArCXJldHVybiAwOw0KPiA+Pj4gK30NCj4gPj4+ICsNCj4gPj4+ICBp
bnQgZHdfcGNpZV9lcF9yYWlzZV9tc2l4X2lycShzdHJ1Y3QgZHdfcGNpZV9lcCAqZXAsIHU4IGZ1
bmNfbm8sDQo+ID4+PiAgCQkJICAgICAgdTE2IGludGVycnVwdF9udW0pDQo+ID4+DQo+ID4+IEhh
dmUgSSB1bmRlcnN0b29kIGNvcnJlY3RseSB0aGF0IHRoZSBoYXJkd2FyZSBwcm92aWRlcyBhbiBh
bHRlcm5hdGl2ZQ0KPiA+PiBtZWNoYW5pc20gdGhhdCBhbGxvd3MgZm9yIHJhaXNpbmcgTVNJLVgg
aW50ZXJydXB0cyB3aXRob3V0IHRoZSBib3RoZXINCj4gPj4gb2YgcmVhZGluZyB0aGUgY2FwYWJp
bGl0aWVzIHJlZ2lzdGVycz8NCj4gPiBZZXMsIHRoZSBoYXJkd2FyZSBwcm92aWRlIHR3byB3YXkg
dG8gTVNJLVgsIHBsZWFzZSBjaGVjayB0aGUgcGFnZSA0OTINCj4gPiBvZg0KPiA+IERXQ19wY2ll
X2RtX3JlZ2lzdGVyc180LjMwIE1lbnUuDQo+ID4gTVNJWF9ET09SQkVMTF9PRkYgb24gcGFnZSA0
OTIgMHg5NDggRGVzY3JpcHRpb246IE1TSS1YIERvb3JiZWxsDQo+ID4gUmVnaXN0ZXIuLi4uPg0K
PiA+Pg0KPiA+PiBJZiBzbyBpcyB0aGVyZSBhbnkgZ29vZCByZWFzb24gdG8ga2VlcCBkd19wY2ll
X2VwX3JhaXNlX21zaXhfaXJxPw0KPiA+PiAoQW5kIHRodXMgdXNlIGl0IGluIGR3X3BsYXRfcGNp
ZV9lcF9yYWlzZV9pcnEgYWxzbyk/DQo+ID4gSSBhbSBub3Qgc3VyZSwgYnV0IEkgdGhpbmsgdGhl
IGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnEgZnVuY3Rpb24gaXMNCj4gPiBub3QgY29ycmVjdCwg
YmVjYXVzZSBJIHRoaW5rIHdlIGNhbid0IGdldCB0aGUgTVNJWCB0YWJsZSBmcm9tIHRoZQ0KPiA+
IGFkZHJlc3MgZXAtPnBoeXNfYmFzZSArIHRibF9hZGRyLCBidXQgSSBhbHNvIGRvbid0IGtub3cg
d2hlcmUgSSBjYW4gZ2V0IHRoZQ0KPiBjb3JyZWN0IE1TSVggdGFibGUuDQo+IA0KPiBTb21ldGlt
ZSBiYWNrIHdoZW4gSSB0cmllZCByYWlzaW5nIE1TSS1YIGZyb20gRVAsIGl0IHdhcyBmYWlsaW5n
LiBJdCdzIHF1aXRlDQo+IHBvc3NpYmxlIGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnEgZnVuY3Rp
b24gaXMgbm90IGNvcnJlY3QuDQo+IA0KPiBNU0ktWCB0YWJsZSBjYW4gYmUgb2J0YWluZWQgZnJv
bSB0aGUgaW5ib3VuZCBBVFUgY29ycmVzcG9uZGluZyB0byB0aGUgTVNJWA0KPiBiYXIuDQo+IElN
TyBNU0ktWCBzdXBwb3J0IGluIEVQIG1vZGUgbmVlZHMgcmV3b3JrLiBGb3IgaW5zdGFuY2Ugc2V0
X21zaXggc2hvdWxkDQo+IGFsc28gdGFrZSBCQVIgbnVtYmVyIGFzIGlucHV0IHRvIGJlIGNvbmZp
Z3VyZWQgaW4gdGhlIE1TSS1YIGNhcGFiaWxpdHkuIFRoZQ0KPiBmdW5jdGlvbiBkcml2ZXIgKHBj
aS1lcGYtdGVzdC5jKSBzaG91bGQgYWxsb2NhdGUgbWVtb3J5IHRha2luZyBpbnRvIGFjY291bnQg
dGhlDQo+IE1TSS1YIHRhYmxlLg0KSGkgS2lzaG9uLA0KDQpUaGFua3MgYSBsb3QgZm9yIHlvdXIg
ZXhwbGFpbiwgeWVzLCB3ZSBjYW4gZ2V0IHRoZSBNU0ktWCB0YWJsZSBmcm9tIHRoZSBpbmJvdW5k
IEFUVSBvZg0KdGhlIE1TSVggQkFSLg0KPiANCj4gVGhhbmtzDQo+IEtpc2hvbg0K
