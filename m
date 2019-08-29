Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B04EA1493
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 11:21:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Jxtq0TrczDrJq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 19:21:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.58; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="i4oIrHDJ"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20058.outbound.protection.outlook.com [40.107.2.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Jxrk3Cx9zDr9T
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 19:19:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEhKXu6ZOSqpxdM+UbyORssKFyj4Rk1EEK1piF/ojMdVl269VmqjRK7+k0fZOoVGmRLR5kP3euVM1E/bvi5e4rIKd5axMXkZ1E10+3GzZu10tW3O+Ii5aBxmT6wSXKE3/faj5CyE7A79b8oWYg3jT0ltakaVGv4hyAemakNokq5fhZ5hCjS/RZsF6CqTtcbfQ2FSlh3D8dfobDXzzLmPCt52rHaRag5b/Bi8NmD84+K6epiHM1H4cFdF0LBTUkwReST+lHLvofWg8YOz6kCifLgf+rSb/ldH0TIOHmgX646zLU5o8PgM6IKCdclqY0+MBJyEydQmfl/SLUx8Xdvdrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKQ+It/Y1qKp0sE9paqVHUB6QbjZql3P5qY7HLr6bzE=;
 b=Nly3uMCO8tqToQ248JTeukP6Lhv12Bf37WHsMCVAe14fyKrV+ycj9FR06aFtCRDzpZcTdpCywuyVihkmsfop37M6GyPUV3pbIpq++gqz9Fk7Cfoo/JAYNRTM//LPlbCJe32/i1hWKDrsX/v6kiRTFaBJ5hQWi2oNFI7/AfQ+DKs4/MOTIk3n8EhTNlgfzOyLuS8Lr/yp2dqqkztbS1UmqZbmXI7BbDJd+2PjTLiO7d1qzpYiLKqMT4OdtTtVunP3G+Ap1ORpBR2bMJ0rQrpQdhFhq2P3WFnt89UdhUv/t6YDATVl7XCUu0Hns6ccJG7klT7yJaAxLbcUXH/GQzbFeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cKQ+It/Y1qKp0sE9paqVHUB6QbjZql3P5qY7HLr6bzE=;
 b=i4oIrHDJtxSV4ujxBCTr6siZotREHYg/FYO8I2aj+46OVTM3MM8U9YJUAOZPhNmFPLblZjYANzu7vVLcwiw0k99bqNOLZzuTSg6Lfnk7QSpuYK5Q7ipdFoDV8nNpUDWWZ07M4P5Q2E4JBLAiTlDDjMtiRcleNCKVumKFrsk+wLQ=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3267.eurprd04.prod.outlook.com (10.173.255.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.20; Thu, 29 Aug 2019 09:19:24 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41%3]) with mapi id 15.20.2220.013; Thu, 29 Aug 2019
 09:19:24 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v2 04/10] dt-bindings: pci: layerscape-pci: add compatible
 strings for ls1088a and ls2088a
Thread-Topic: [PATCH v2 04/10] dt-bindings: pci: layerscape-pci: add
 compatible strings for ls1088a and ls2088a
Thread-Index: AQHVWN1ZOdHJPAlxM0KCMq+jo3exvqcPmykAgAJIbeA=
Date: Thu, 29 Aug 2019 09:19:24 +0000
Message-ID: <AM5PR04MB32990FE14E5B60D4C66A9E5DF5A20@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-4-xiaowei.bao@nxp.com> <20190827222617.GA16361@bogus>
In-Reply-To: <20190827222617.GA16361@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb4fc085-4fbf-46c7-d599-08d72c61fbec
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM5PR04MB3267; 
x-ms-traffictypediagnostic: AM5PR04MB3267:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3267C6493C2D25E73BB3A711F5A20@AM5PR04MB3267.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0144B30E41
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(376002)(136003)(396003)(346002)(39860400002)(13464003)(199004)(189003)(81156014)(229853002)(54906003)(76176011)(6916009)(53936002)(14454004)(86362001)(44832011)(76116006)(7416002)(25786009)(7696005)(6506007)(316002)(4326008)(3846002)(99286004)(6116002)(71190400001)(66946007)(64756008)(66556008)(66476007)(478600001)(6436002)(102836004)(55016002)(14444005)(8676002)(53546011)(71200400001)(2906002)(305945005)(33656002)(6246003)(66446008)(26005)(476003)(5660300002)(11346002)(7736002)(186003)(256004)(81166006)(52536014)(74316002)(486006)(446003)(66066001)(9686003)(8936002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3267;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Vbzr+TaMD21VAFlizswxqJdb+5c0BvO18zw5U/bLcn/y4HwdMrocB7O2YMyhyPrblKlFa3WJibOh9gzrZmJyoehnRPcT7BVViLIayCTHVTnM4TBgJjjr7X8nw/TwYHX/aWIMFxz+QcUZCxYCQo7UEE2KqE3nyXTsaCRbiFSnB26SVQD9F7dzMQxIz57i0Lr02OSZfKV4FS9fgVdJhAeD5pF1VH5o833unTOLKWht/b8BTE2WmDn32uBfucu+yIIP/CNx9gx8Qnb0yJggZ1jUXBH2o5Lfc0RuoRHJDjM3etePtYLFV5c0SAgUPAZQInptfxYWGEJA6bURqhuepzN2oqZZejWvnBuopl+2jwA7A1lL1Rs6FasKE/XjMds74QiYEvb4U49jZOvQbAItuOzUZYp5CxTETc1O8uPura/3H4k=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb4fc085-4fbf-46c7-d599-08d72c61fbec
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2019 09:19:24.4607 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 85B/XSfp/KfH1wKV13mFK/eyzptQRAbGoUpC1Rej9uo5F6oW3daTRKwX0cAAsPfrWzBOAH0DYujfUt+u/W/66g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3267
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Roy Zang <roy.zang@nxp.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "andrew.murray@arm.com" <andrew.murray@arm.com>, Leo Li <leoyang.li@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz4NCj4gU2VudDogMjAxOcTqONTCMjjI1SA2OjI2DQo+IFRvOiBYaWFvd2Vp
IEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gQ2M6IGJoZWxnYWFzQGdvb2dsZS5jb207IG1h
cmsucnV0bGFuZEBhcm0uY29tOyBzaGF3bmd1b0BrZXJuZWwub3JnOw0KPiBMZW8gTGkgPGxlb3lh
bmcubGlAbnhwLmNvbT47IGtpc2hvbkB0aS5jb207IGxvcmVuem8ucGllcmFsaXNpQGFybS5jbzsN
Cj4gYXJuZEBhcm5kYi5kZTsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IE0uaC4gTGlhbg0K
PiA8bWluZ2h1YW4ubGlhbkBueHAuY29tPjsgTWluZ2thaSBIdSA8bWluZ2thaS5odUBueHAuY29t
PjsgUm95IFphbmcNCj4gPHJveS56YW5nQG54cC5jb20+OyBqaW5nb29oYW4xQGdtYWlsLmNvbTsN
Cj4gZ3VzdGF2by5waW1lbnRlbEBzeW5vcHN5cy5jb207IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5v
cmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4cHBj
LWRldkBsaXN0cy5vemxhYnMub3JnOw0KPiBhbmRyZXcubXVycmF5QGFybS5jb20NCj4gU3ViamVj
dDogUmU6IFtQQVRDSCB2MiAwNC8xMF0gZHQtYmluZGluZ3M6IHBjaTogbGF5ZXJzY2FwZS1wY2k6
IGFkZCBjb21wYXRpYmxlDQo+IHN0cmluZ3MgZm9yIGxzMTA4OGEgYW5kIGxzMjA4OGENCj4gDQo+
IE9uIFRodSwgQXVnIDIyLCAyMDE5IGF0IDA3OjIyOjM2UE0gKzA4MDAsIFhpYW93ZWkgQmFvIHdy
b3RlOg0KPiA+IEFkZCBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIGxzMTA4OGEgYW5kIGxzMjA4OGEu
DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNv
bT4NCj4gPiAtLS0NCj4gPiB2MjoNCj4gPiAgLSBObyBjaGFuZ2UuDQo+ID4NCj4gPiAgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9sYXllcnNjYXBlLXBjaS50eHQgfCA1ICsr
KystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGNpL2xheWVyc2NhcGUtcGNpLnR4dA0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BjaS9sYXllcnNjYXBlLXBjaS50eHQNCj4gPiBpbmRleCBlMjBjZWFhLi4xNmY1OTJl
IDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kv
bGF5ZXJzY2FwZS1wY2kudHh0DQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3BjaS9sYXllcnNjYXBlLXBjaS50eHQNCj4gPiBAQCAtMjIsNyArMjIsMTAgQEAgUmVx
dWlyZWQgcHJvcGVydGllczoNCj4gPiAgICAgICAgICAiZnNsLGxzMTA0M2EtcGNpZSINCj4gPiAg
ICAgICAgICAiZnNsLGxzMTAxMmEtcGNpZSINCj4gPiAgICBFUCBtb2RlOg0KPiA+IC0JImZzbCxs
czEwNDZhLXBjaWUtZXAiLCAiZnNsLGxzLXBjaWUtZXAiDQo+ID4gKwkiZnNsLGxzLXBjaWUtZXAi
DQo+IA0KPiBXYXNuJ3QgdGhpcyBhIGZhbGxiYWNrPyBFYWNoIGxpbmUgc2hvdWxkIGJlIG9uZSB2
YWxpZCBjb21iaW5hdGlvbiBvZg0KPiBjb21wYXRpYmxlIHN0cmluZ3MuDQoNClRoYW5rcywgZ290
IGl0LCBJIHdpbGwgbW9kaWZ5IGl0IGluIG5leHQgdmVyc2lvbiBwYXRjaC4NCg0KVGhhbmtzIA0K
WGlhb3dlaQ0KDQo+IA0KPiA+ICsJImZzbCxsczEwNDZhLXBjaWUtZXAiDQo+ID4gKwkiZnNsLGxz
MTA4OGEtcGNpZS1lcCINCj4gPiArCSJmc2wsbHMyMDg4YS1wY2llLWVwIg0KPiA+ICAtIHJlZzog
YmFzZSBhZGRyZXNzZXMgYW5kIGxlbmd0aHMgb2YgdGhlIFBDSWUgY29udHJvbGxlciByZWdpc3Rl
ciBibG9ja3MuDQo+ID4gIC0gaW50ZXJydXB0czogQSBsaXN0IG9mIGludGVycnVwdCBvdXRwdXRz
IG9mIHRoZSBjb250cm9sbGVyLiBNdXN0IGNvbnRhaW4gYW4NCj4gPiAgICBlbnRyeSBmb3IgZWFj
aCBlbnRyeSBpbiB0aGUgaW50ZXJydXB0LW5hbWVzIHByb3BlcnR5Lg0KPiA+IC0tDQo+ID4gMi45
LjUNCj4gPg0K
