Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6E69B93E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 02:02:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FdkZ2TrYzDrfq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 10:02:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.55; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="ArC14jSp"; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150055.outbound.protection.outlook.com [40.107.15.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Fdgv2Z2kzDrZC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 10:00:24 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iy+rsh5fb6tgXuGd1MBrl7j+wAPiQQbYzV6+vofCzIovqQZ+VhjQXsfo+kecRBEKp8kwI6rtI9HEHEdCJo+m4tUmxs/E8yVHZbEZfqfO8jm/J7Eme6V/sf71yb/Zez/tEuI7GSqq9ulnbUr3WNF62AnCEC3YNoqquyQafMQhV86wVGC2IwjofoSzq2xmJzgGoYPYhsFkmcBUkGu9J6yfq7YlO5IsJ/33+QR+sd5fyVL80dPTtH79B4qTmxjwEKeZZTnggjBIp5esi02f+fqDZ9ADCUbd9OdXc74CO1sJj/EjzDPZwBvGeC4NIM81tabCOIfbguU3Jbafwi6eGFqmEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPxoB/6tQ5IZBdlhOzOuKbHz/sMLqgGnjH9VmgN69Y4=;
 b=hYWSvS6zc8zGkTJjUwagWt6CkSEzG2BB6rTbmTFDlip/1tuDPeVTiEh3pF57VCIv6LlUFY1x7IY7DNN5Wq594yaFM1ecf7wh9fgE4+wrP/fclct4OHc7ZVP0ySyX385gEtH/f56XLTKVB3Ywh+j53Xcm8AHQZ2qVDpeFjeCcdMWdPDrAMJyyvtfG2tnbdaSh9JxCw9wq+zm2PCewmnVyM88zEwBbHRyQCLIMSgzktDvNm00xSBvSo6hgTwW7SMmCSAx8CIrRJ5BCtBBNuRMu53dM6j6T2T6jh0Wpig7J+bIibvuFeoDeid8T4jwTeNF6rOR14+qbesI7i+7Mi4aaZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPxoB/6tQ5IZBdlhOzOuKbHz/sMLqgGnjH9VmgN69Y4=;
 b=ArC14jSp/ojy2dTQHRJzxdAMbVsx48d8urFK0wTBURBXf7lpJ0H4i4w6sd5oqc/qrPdNryrdwjenAR1NtMyHlfGijJ6dak2cEzqwGAra4UThe9NpJwahhW4LykfTx2mTZZviMRW2yCrJdE9BNSnjaffOMjVxAq1iZkszHIrd7Aw=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5SPR01MB01.eurprd04.prod.outlook.com (10.161.64.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Sat, 24 Aug 2019 00:00:18 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043%7]) with mapi id 15.20.2178.020; Sat, 24 Aug 2019
 00:00:18 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v2 05/10] PCI: layerscape: Fix some format issue of the
 code
Thread-Topic: [PATCH v2 05/10] PCI: layerscape: Fix some format issue of the
 code
Thread-Index: AQHVWN1actLMKNn1i0eUCtn8fCusAqcIwE+AgACrqjA=
Date: Sat, 24 Aug 2019 00:00:18 +0000
Message-ID: <AM5PR04MB3299C0303B83E9EF0AE7E5F9F5A70@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-5-xiaowei.bao@nxp.com>
 <20190823134527.GG14582@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190823134527.GG14582@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b59f1f8a-e783-41e1-110d-08d728260cd7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5SPR01MB01; 
x-ms-traffictypediagnostic: AM5SPR01MB01:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5SPR01MB011EF61DF786F44DF0F5EBF5A70@AM5SPR01MB01.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0139052FDB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(346002)(39860400002)(396003)(376002)(13464003)(189003)(199004)(186003)(33656002)(66556008)(53936002)(52536014)(478600001)(3846002)(76176011)(6116002)(71200400001)(71190400001)(9686003)(55016002)(11346002)(25786009)(7696005)(305945005)(99286004)(7736002)(6436002)(8936002)(2906002)(74316002)(66066001)(229853002)(26005)(8676002)(4326008)(5660300002)(86362001)(64756008)(66446008)(81166006)(446003)(53546011)(81156014)(102836004)(14454004)(44832011)(486006)(7416002)(256004)(476003)(76116006)(316002)(66476007)(66946007)(54906003)(6246003)(6506007)(6916009);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5SPR01MB01;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: zW5ZGzkvT5PtATv3htVVdyKugDkwABeFh9QLXDHH4w+PBY2h7G4rGJN0Ejy3KURRfizSQFHKItZ0Z1Cu+LV2yBeAZ9IfogGNJDo3tDkOcTo3OYDTKIfyoRuXkWjq3fDxXRxAKn+YJ2VcrJiTHIUEX4FO+GIgnRjk5S72c6qgtbZKp/d2SKRzrahzlJqNEh70LzJc0G7GJq4GRYQQzNIX4kgqrCx0eaXgxoyrnmB7pkmAplifHDX0uKx3FvfXijSHZKsgc7KlKU+1UabrFOdt1//0u1GAN6uftKmkPMOzuH+SIs/5mzbibWpGy9WXGDPiB8c60fBStpVmYQwMj0GHNymC7sB7cadnz6rTtzL6h90x9FrjTh+rgm6/N90mUi5Dzuwxz9T1e+E9QMLSsiM/qcBQv08KK860m5sYT8PMaJI=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b59f1f8a-e783-41e1-110d-08d728260cd7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2019 00:00:18.3465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KLaTF/VRFn9+fOsexlHMNCkx0KE20ItMAGl3e7aCsb9UpDfy5oKTIKzDGfkwQhn+ZCDtIct7VCN/LfuNYhdu1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5SPR01MB01
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
 "lorenzo.pieralisi@arm.co" <lorenzo.pieralisi@arm.co>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, Leo Li <leoyang.li@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IE11cnJheSA8
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE5xOo41MIyM8jVIDIxOjQ1DQo+IFRv
OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gQ2M6IGJoZWxnYWFzQGdvb2ds
ZS5jb207IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207DQo+IHNoYXdu
Z3VvQGtlcm5lbC5vcmc7IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPjsga2lzaG9uQHRpLmNv
bTsNCj4gbG9yZW56by5waWVyYWxpc2lAYXJtLmNvOyBhcm5kQGFybmRiLmRlOyBncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZzsgTS5oLg0KPiBMaWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+OyBN
aW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5jb20+OyBSb3kNCj4gWmFuZyA8cm95LnphbmdAbnhw
LmNvbT47IGppbmdvb2hhbjFAZ21haWwuY29tOw0KPiBndXN0YXZvLnBpbWVudGVsQHN5bm9wc3lz
LmNvbTsgbGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MiAwNS8xMF0gUENJOiBsYXllcnNjYXBlOiBGaXggc29tZSBmb3Jt
YXQgaXNzdWUgb2YgdGhlDQo+IGNvZGUNCj4gDQo+IE9uIFRodSwgQXVnIDIyLCAyMDE5IGF0IDA3
OjIyOjM3UE0gKzA4MDAsIFhpYW93ZWkgQmFvIHdyb3RlOg0KPiA+IEZpeCBzb21lIGZvcm1hdCBp
c3N1ZSBvZiB0aGUgY29kZSBpbiBFUCBkcml2ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBY
aWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gDQo+IFJldmlld2VkLWJ5OiBBbmRy
ZXcgTXVycmF5IDxhbmRyZXcubXVycmF5QGFybS5jb20+DQoNClRoYW5rcy4NCg0KPiANCj4gDQo+
ID4gLS0tDQo+ID4gdjI6DQo+ID4gIC0gTm8gY2hhbmdlLg0KPiA+DQo+ID4gIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMgfCA0ICsrLS0NCj4gPiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+
ID4gYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4g
aW5kZXggYmU2MWQ5Ni4uNGU5MmE5NSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gKysrIGIvZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+IEBAIC02Miw3ICs2Miw3IEBAIHN0
YXRpYyB2b2lkIGxzX3BjaWVfZXBfaW5pdChzdHJ1Y3QgZHdfcGNpZV9lcCAqZXApDQo+ID4gfQ0K
PiA+DQo+ID4gIHN0YXRpYyBpbnQgbHNfcGNpZV9lcF9yYWlzZV9pcnEoc3RydWN0IGR3X3BjaWVf
ZXAgKmVwLCB1OCBmdW5jX25vLA0KPiA+IC0JCQkJICBlbnVtIHBjaV9lcGNfaXJxX3R5cGUgdHlw
ZSwgdTE2IGludGVycnVwdF9udW0pDQo+ID4gKwkJCQllbnVtIHBjaV9lcGNfaXJxX3R5cGUgdHlw
ZSwgdTE2IGludGVycnVwdF9udW0pDQo+ID4gIHsNCj4gPiAgCXN0cnVjdCBkd19wY2llICpwY2kg
PSB0b19kd19wY2llX2Zyb21fZXAoZXApOw0KPiA+DQo+ID4gQEAgLTg2LDcgKzg2LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBkd19wY2llX2VwX29wcyBwY2llX2VwX29wcyA9IHsNCj4gPiB9Ow0K
PiA+DQo+ID4gIHN0YXRpYyBpbnQgX19pbml0IGxzX2FkZF9wY2llX2VwKHN0cnVjdCBsc19wY2ll
X2VwICpwY2llLA0KPiA+IC0JCQkJCXN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4g
KwkJCQkgc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgew0KPiA+ICAJc3RydWN0
IGR3X3BjaWUgKnBjaSA9IHBjaWUtPnBjaTsNCj4gPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9IHBj
aS0+ZGV2Ow0KPiA+IC0tDQo+ID4gMi45LjUNCj4gPg0K
