Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C48EA5EE7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 03:35:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MqK95BFQzDqQt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 11:35:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.43; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="A4TG8WeB"; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150043.outbound.protection.outlook.com [40.107.15.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MqHB5z62zDqbk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 11:33:54 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lVrqxpoDR+4TrGVjUqQ+gEGhPC1E2nx1mxw3LVU9Jnd+lEZSPp/DNSQEAup8qhzjVsx8ryfQ4CRMfUj9dlpI7my7MrKnFzKihwJKzPONKP5xqYnnP70xpvFYeuWGGnqixHu7azMdTWtohZI+EKhpJnwaaW1DcBHlcd2EMgklkXYNnEFze0qkFWL7+jZad8Rye9ZPBZjHANKwG6ICt2ISXQD6s8Tz+ePHhGcoI/kW7pvpHaFO4e4jJlrQqiRTF395HP1r/EW0wMtrCrH5dMAdI5cRuRSnVyoqFrvcOXxBRunsepAeL17ibSl/UJ1tgkSfO12Mfwf0O3WnlBTD2QPMDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DOADx+psDt4dToHwJNRvHYgrc8d4scsqS0URHGsMqY=;
 b=UZpcYBLqQIN3FRxatUTbYJDYOmChQeelrWHfArXAabCqVUprIuCrt6fRg+cybvK0HaqvT6bscUfKxdvH6qtWe6Ul6uOpkH6p9bVnC2s039te46tYLEcU4ofL7acupyunl13/HTLxzUDeRx0wH0UM8HbScaiBcAvB/Jws8Lzoism3uUYQvoNQfjFCPOCsVKMkAPiOWcW+kAVORFecaGuhQjb27odT7cZjLKyrp4F/1CJcekdmFeOzCB+H7l7XVtsr81c9j044RUk22o+U1vHJ2B2UFrlZu2O2mwCVNST3xMtqL1NUkt0/GXFWu5FtySE813M/oONC/bo4C6v49lDFoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/DOADx+psDt4dToHwJNRvHYgrc8d4scsqS0URHGsMqY=;
 b=A4TG8WeBO2t4888eRSpymDZNSiJEgCmZ0BQKRwKdBuez+zUywSPSiHdBZEV2wHI5GcHsRbiSTxKMRKOF9guYyt5h1Sa4vsdgCN6bE8EGzffm3pBHndsIJqX1lJX3G42RK1N4Nh622p8w8i53VQSw5GvxeU2UCdSFYce8zunZy+8=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3250.eurprd04.prod.outlook.com (10.173.254.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Tue, 3 Sep 2019 01:33:48 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41%3]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 01:33:48 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v3 05/11] dt-bindings: pci: layerscape-pci: add compatible
 strings for ls1088a and ls2088a
Thread-Topic: [PATCH v3 05/11] dt-bindings: pci: layerscape-pci: add
 compatible strings for ls1088a and ls2088a
Thread-Index: AQHVYT5jmPfE5iaogkycau2MGZNxFacYUkAAgADaAhA=
Date: Tue, 3 Sep 2019 01:33:47 +0000
Message-ID: <AM5PR04MB329957D1325CED60804D0C08F5B90@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-6-xiaowei.bao@nxp.com>
 <20190902123140.GI9720@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190902123140.GI9720@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9e2a9617-5fc6-4c20-f837-08d7300ec47e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3250; 
x-ms-traffictypediagnostic: AM5PR04MB3250:|AM5PR04MB3250:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3250A437F9476D024EF62E7BF5B90@AM5PR04MB3250.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(13464003)(199004)(189003)(11346002)(7736002)(25786009)(4326008)(8676002)(76116006)(66946007)(9686003)(305945005)(6436002)(66446008)(66476007)(66556008)(64756008)(52536014)(186003)(5660300002)(6246003)(81166006)(81156014)(54906003)(256004)(14444005)(8936002)(74316002)(66066001)(2906002)(53936002)(316002)(6116002)(3846002)(71200400001)(476003)(86362001)(55016002)(33656002)(446003)(229853002)(486006)(6916009)(44832011)(14454004)(7696005)(6506007)(53546011)(76176011)(478600001)(102836004)(99286004)(26005)(7416002)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3250;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: D4QgtriG5I47aYMdGldkYwh7Ir+CHuoSX+PqsZqd6QFnnVaGv+yGdXulnD/J4qO88bhWwjeagHkrJ0d883/jWkZ4ABN2EKoQpcKrVzzc0gfZj2/0mODj3JChrd47HJtHK2rzd6eFUjytQGWfml4W05Af/8Cg8xINjwIqAxrdXDUKyQZgs3U1otnE59mq7AYQaMRySMky/Lmlyj6sPsfpUo1O0kE5GW6N+/ws3L+snukBbv1+/1gg2eFQo41sL63eRxKdDfxYx7t0Ls+mfMoupz+37ONOpPay2xKXSrPdBpiFsJPMgmwvRNw1ZGq7RO3gkxSexdx+czbuVAsdDy/txjClpBTnMJRV9RGrBY2iSSEX9dZqXQYRJ28envDs7qqhY6HjTNm4Hxt2WWvQcANMuL7wB1YkQ6OF+AjoWa3Fg38=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e2a9617-5fc6-4c20-f837-08d7300ec47e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 01:33:47.9426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t11BTwtdiL4iWOpMHEWGXLpWmc4Yrog+ohSGFvnOeQj1pv+KW5e0gm6uPD4nMzMW0/DTYbdqNULec8+CH6j8XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3250
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
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "Z.q. Hou" <zhiqiang.hou@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IE11cnJheSA8
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE5xOo51MIyyNUgMjA6MzINCj4gVG86
IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiBDYzogcm9iaCtkdEBrZXJuZWwu
b3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgc2hhd25ndW9Aa2VybmVsLm9yZzsgTGVvDQo+IExp
IDxsZW95YW5nLmxpQG54cC5jb20+OyBraXNob25AdGkuY29tOyBsb3JlbnpvLnBpZXJhbGlzaUBh
cm0uY29tOyBNLmguDQo+IExpYW4gPG1pbmdodWFuLmxpYW5AbnhwLmNvbT47IE1pbmdrYWkgSHUg
PG1pbmdrYWkuaHVAbnhwLmNvbT47IFJveQ0KPiBaYW5nIDxyb3kuemFuZ0BueHAuY29tPjsgamlu
Z29vaGFuMUBnbWFpbC5jb207DQo+IGd1c3Rhdm8ucGltZW50ZWxAc3lub3BzeXMuY29tOyBsaW51
eC1wY2lAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnOyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsNCj4gYXJuZEBhcm5kYi5k
ZTsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IFoucS4gSG91DQo+IDx6aGlxaWFuZy5ob3VA
bnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwNS8xMV0gZHQtYmluZGluZ3M6IHBj
aTogbGF5ZXJzY2FwZS1wY2k6IGFkZCBjb21wYXRpYmxlDQo+IHN0cmluZ3MgZm9yIGxzMTA4OGEg
YW5kIGxzMjA4OGENCj4gDQo+IE9uIE1vbiwgU2VwIDAyLCAyMDE5IGF0IDExOjE3OjEwQU0gKzA4
MDAsIFhpYW93ZWkgQmFvIHdyb3RlOg0KPiA+IEFkZCBjb21wYXRpYmxlIHN0cmluZ3MgZm9yIGxz
MTA4OGEgYW5kIGxzMjA4OGEuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBYaWFvd2VpIEJhbyA8
eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiB2MjoNCj4gPiAgLSBObyBjaGFuZ2Uu
DQo+ID4gdjM6DQo+ID4gIC0gVXNlIG9uZSB2YWxpZCBjb21iaW5hdGlvbiBvZiBjb21wYXRpYmxl
IHN0cmluZ3MuDQo+ID4NCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Bj
aS9sYXllcnNjYXBlLXBjaS50eHQgfCA0ICsrKy0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wY2kvbGF5ZXJzY2FwZS1wY2kudHh0DQo+ID4gYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2xheWVyc2NhcGUtcGNpLnR4dA0K
PiA+IGluZGV4IGUyMGNlYWEuLjc2MmFlNDEgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3BjaS9sYXllcnNjYXBlLXBjaS50eHQNCj4gPiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGNpL2xheWVyc2NhcGUtcGNpLnR4dA0K
PiA+IEBAIC0yMiw3ICsyMiw5IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAg
ImZzbCxsczEwNDNhLXBjaWUiDQo+ID4gICAgICAgICAgImZzbCxsczEwMTJhLXBjaWUiDQo+ID4g
ICAgRVAgbW9kZToNCj4gPiAtCSJmc2wsbHMxMDQ2YS1wY2llLWVwIiwgImZzbCxscy1wY2llLWVw
Ig0KPiA+ICsJImZzbCxsczEwNDZhLXBjaWUtZXAiICJmc2wsbHMtcGNpZS1lcCINCj4gPiArCSJm
c2wsbHMxMDg4YS1wY2llLWVwIiAiZnNsLGxzLXBjaWUtZXAiDQo+ID4gKwkiZnNsLGxzMjA4OGEt
cGNpZS1lcCIgImZzbCxscy1wY2llLWVwIg0KPiANCj4gVGhpcyBpc24ndCBjb25zaXN0ZW50IHdp
dGggIltQQVRDSCB2MyAwOS8xMV0gUENJOiBsYXllcnNjYXBlOiBBZGQgRVAgbW9kZS4uLiINCj4g
YXMgdGhhdCBwYXRjaCBkcm9wcyB0aGUgZmFsbGJhY2sgImZzbCxscy1wY2llLWVwIi4gRWl0aGVy
IHRoZSBmYWxsYmFjayBtdXN0IGJlDQo+IHByZXNlcnZlZCBpbiB0aGUgZHJpdmVyLCBvciB5b3Ug
bmVlZCB0byBkcm9wIGl0IGhlcmUuDQo+IA0KPiBXaGF0IGlmIHRoZXJlIGFyZSBleGlzdGluZyB1
c2VycyB0aGF0IGRlcGVuZCBvbiB0aGUgZmFsbGJhY2s/DQo+IA0KPiAoSSdtIGFsc28gbm90IHN1
cmUgaWYgdGhhdCBjb21tYSBzaG91bGQgaGF2ZSBiZWVuIGRyb3BwZWQpLg0KDQpIaSBBbmRyZXcs
DQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50cywgSSBsb3NlIHRoZSBjb21tYS4NCg0KVGhhbmtz
IA0KWGlhb3dlaQ0KDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBBbmRyZXcgTXVycmF5DQo+IA0KPiA+
ICAtIHJlZzogYmFzZSBhZGRyZXNzZXMgYW5kIGxlbmd0aHMgb2YgdGhlIFBDSWUgY29udHJvbGxl
ciByZWdpc3RlciBibG9ja3MuDQo+ID4gIC0gaW50ZXJydXB0czogQSBsaXN0IG9mIGludGVycnVw
dCBvdXRwdXRzIG9mIHRoZSBjb250cm9sbGVyLiBNdXN0IGNvbnRhaW4gYW4NCj4gPiAgICBlbnRy
eSBmb3IgZWFjaCBlbnRyeSBpbiB0aGUgaW50ZXJydXB0LW5hbWVzIHByb3BlcnR5Lg0KPiA+IC0t
DQo+ID4gMi45LjUNCj4gPg0K
