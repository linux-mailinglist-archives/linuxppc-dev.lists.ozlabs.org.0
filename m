Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E7A8F959
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 05:02:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468p5S1T9bzDqxD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 13:02:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=2a01:111:f400:fe1e::62e;
 helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="TvopJkDY"; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe1e::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468p2y18yqzDrH6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 13:00:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMxrSfVuK+vkhBJuE+ZrivJJraaHNnUL5nTsaL3iegk+oKOG5sYhPNcKUkppM8lDVO5wJMjX2FdF/MStUHWp5/cqKlMCEO1NwzMzxYFYnnE/wUT+/orhhqnb22VRMD8Zn4AvQWDQoNlrJb92oEmm2rkgvnHfADZ7jpRT4/bXYG6cwm78GnSzrO+UhO4sxChevg4FVl9z/BjWpsjX1k1yWDk8fMGFqKvy6mfNZauf3x2JEmdvrFKV6s2kSLLZ6VMl9BqIH7y+gryf8M3pSSGP1IWX3ZkTq3YMj4mIIrfjq8J41lu5S33str/mko+PXRrJB/pbZHjSuN08PfauydGvyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtoX3Cb93PK95hcN2zFTwZhzoT08rLIhdLK3eDaRh7E=;
 b=TldLOIt59dylZ003dzl2GSHVKdbNI0nPB4YRI8qrs2q/9j7LEODcFkrR7L/Htp9AlL0QTN2liFa7BgJS1Z/ZZsJ01lzyypwSB2iwoDryYEwzRuN+rxpa/xd46VlDYekgJlzVcbHJu4EBB0vdIZtZ9F/xQSP+axnGDFpAXJMOR8sXL3O+jJrbpVKdc+lt1/ZRwz11Az5H/zmTH+0HPgnEU1XDhAygvGWrtj2CVr18T6MuBUsUxeLC8ovmWxAu2cQXf8OJUs/N+KeFVujl3196b7NoTB00BBvJ8RqF6cWv0stIbOnM9T3TjRk25ZmqSMJ8Ykr99HRZYY5Dyy/Z1Tl8Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtoX3Cb93PK95hcN2zFTwZhzoT08rLIhdLK3eDaRh7E=;
 b=TvopJkDYbU6sKent3HB4AV3BTghrBxC6veaA4cpt9FQhX/qiEUNbfXHLWL+3ob120ZRBeG7wvR2hGErlTTtf8W7HL1k54Kuj1B2bIeXgczehoKUtSaouqsCqQd4n6ZzmnYFgkDwYa61p0HjUDvhtarlW7wDGVL/FkAgUKafT7/k=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3282.eurprd04.prod.outlook.com (10.167.168.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 16 Aug 2019 03:00:00 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84%5]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 03:00:00 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH 05/10] PCI: layerscape: Modify the way of getting
 capability with different PEX
Thread-Topic: [PATCH 05/10] PCI: layerscape: Modify the way of getting
 capability with different PEX
Thread-Index: AQHVU0Yf1dFxsptJWkSb+ZGFXdO2C6b8KaSAgADs2oA=
Date: Fri, 16 Aug 2019 03:00:00 +0000
Message-ID: <AM5PR04MB329966792C66E9AAB6C0B30DF5AF0@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190815083716.4715-1-xiaowei.bao@nxp.com>
 <20190815083716.4715-5-xiaowei.bao@nxp.com>
 <20190815125103.GH43882@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190815125103.GH43882@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d46b043-bb47-45f7-7cce-08d721f5d415
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3282; 
x-ms-traffictypediagnostic: AM5PR04MB3282:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB32829AC07E4FA19185D4F2B3F5AF0@AM5PR04MB3282.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(39860400002)(396003)(376002)(189003)(199004)(13464003)(26005)(7416002)(316002)(74316002)(7736002)(6916009)(305945005)(66066001)(7696005)(86362001)(76176011)(25786009)(54906003)(478600001)(8936002)(99286004)(102836004)(53546011)(6506007)(476003)(486006)(6246003)(81156014)(53936002)(66946007)(3846002)(11346002)(55016002)(44832011)(446003)(64756008)(8676002)(81166006)(256004)(9686003)(33656002)(6436002)(2906002)(71200400001)(229853002)(71190400001)(52536014)(4326008)(5660300002)(66446008)(66556008)(6116002)(66476007)(76116006)(14454004)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3282;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 96Qh7b+Wff6VLecSKFtgA9zDS0vu1Ss3tz4eDrNeUd0E+v2aO+a2cpRdxQKVuziIbCXVhn4C1WPsgaPmeAdPSKThIaLX1ieqvLWKE+GSqsyVpUQlE/nKDEAZQH8WdiLcx2bowNBOukn1th+lKhQel+cXBwZPVVjP+vJcQqsphdcLWx1kByq9VDsfRxfoqOuqlQhewJqZRvYike4uYH2f6wXeVJLg7ZdF/kg53ubOTitfE08axre8tt27mEhBDiHiornElaJEmFnDA5dZb/b3g/VUoCgmqMXhyAmuGjEoa5Yt8KT/OfrUfRv4ukuuGJx33PtaCvwOPOIg7ZPfzAl1uzfscKNUOKXk84VuWULZkFioOQk4RA75YLfvz7YDy98uf4Jgihk2TEN9ON2N7FgQqaVamXSKl6/QF37l1MCqdQg=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d46b043-bb47-45f7-7cce-08d721f5d415
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 03:00:00.2887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DPPeMUrth7cwivZDTEO5I7LuEZtVpL3YehQTHQScY6wmfZCZGWpIsWaqbfRsgmS0OO5PLpB62FOp0LpyHAGPmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3282
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
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "Z.q. Hou" <zhiqiang.hou@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "kishon@ti.com" <kishon@ti.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IE11cnJheSA8
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE5xOo41MIxNcjVIDIwOjUxDQo+IFRv
OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gQ2M6IGppbmdvb2hhbjFAZ21h
aWwuY29tOyBndXN0YXZvLnBpbWVudGVsQHN5bm9wc3lzLmNvbTsNCj4gYmhlbGdhYXNAZ29vZ2xl
LmNvbTsgcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsNCj4gc2hhd25n
dW9Aa2VybmVsLm9yZzsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBraXNob25AdGkuY29t
Ow0KPiBsb3JlbnpvLnBpZXJhbGlzaUBhcm0uY29tOyBhcm5kQGFybmRiLmRlOyBncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZzsNCj4gTS5oLiBMaWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+OyBN
aW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5jb20+Ow0KPiBSb3kgWmFuZyA8cm95LnphbmdAbnhw
LmNvbT47IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggMDUvMTBdIFBDSTogbGF5ZXJzY2FwZTogTW9kaWZ5IHRoZSB3YXkg
b2YgZ2V0dGluZw0KPiBjYXBhYmlsaXR5IHdpdGggZGlmZmVyZW50IFBFWA0KPiANCj4gT24gVGh1
LCBBdWcgMTUsIDIwMTkgYXQgMDQ6Mzc6MTFQTSArMDgwMCwgWGlhb3dlaSBCYW8gd3JvdGU6DQo+
ID4gVGhlIGRpZmZlcmVudCBQQ0llIGNvbnRyb2xsZXIgaW4gb25lIGJvYXJkIG1heSBiZSBoYXZl
IGRpZmZlcmVudA0KPiA+IGNhcGFiaWxpdHkgb2YgTVNJIG9yIE1TSVgsIHNvIGNoYW5nZSB0aGUg
d2F5IG9mIGdldHRpbmcgdGhlIE1TSQ0KPiA+IGNhcGFiaWxpdHksIG1ha2UgaXQgbW9yZSBmbGV4
aWJsZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0Bu
eHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5
ZXJzY2FwZS1lcC5jIHwgMjgNCj4gPiArKysrKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1l
cC5jDQo+ID4gYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5j
DQo+ID4gaW5kZXggYmU2MWQ5Ni4uOTQwNGNhMCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gKysrIGIvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+IEBAIC0yMiw2ICsyMiw3
IEBADQo+ID4NCj4gPiAgc3RydWN0IGxzX3BjaWVfZXAgew0KPiA+ICAJc3RydWN0IGR3X3BjaWUJ
CSpwY2k7DQo+ID4gKwlzdHJ1Y3QgcGNpX2VwY19mZWF0dXJlcwkqbHNfZXBjOw0KPiA+ICB9Ow0K
PiA+DQo+ID4gICNkZWZpbmUgdG9fbHNfcGNpZV9lcCh4KQlkZXZfZ2V0X2RydmRhdGEoKHgpLT5k
ZXYpDQo+ID4gQEAgLTQwLDI1ICs0MSwyNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rldmlj
ZV9pZA0KPiBsc19wY2llX2VwX29mX21hdGNoW10gPSB7DQo+ID4gIAl7IH0sDQo+ID4gIH07DQo+
ID4NCj4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZXBjX2ZlYXR1cmVzIGxzX3BjaWVfZXBj
X2ZlYXR1cmVzID0gew0KPiA+IC0JLmxpbmt1cF9ub3RpZmllciA9IGZhbHNlLA0KPiA+IC0JLm1z
aV9jYXBhYmxlID0gdHJ1ZSwNCj4gPiAtCS5tc2l4X2NhcGFibGUgPSBmYWxzZSwNCj4gPiAtfTsN
Cj4gPiAtDQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2VwY19mZWF0dXJlcyogIGxzX3Bj
aWVfZXBfZ2V0X2ZlYXR1cmVzKHN0cnVjdA0KPiA+IGR3X3BjaWVfZXAgKmVwKSAgew0KPiA+IC0J
cmV0dXJuICZsc19wY2llX2VwY19mZWF0dXJlczsNCj4gPiArCXN0cnVjdCBkd19wY2llICpwY2kg
PSB0b19kd19wY2llX2Zyb21fZXAoZXApOw0KPiA+ICsJc3RydWN0IGxzX3BjaWVfZXAgKnBjaWUg
PSB0b19sc19wY2llX2VwKHBjaSk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHBjaWUtPmxzX2VwYzsN
Cj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRpYyB2b2lkIGxzX3BjaWVfZXBfaW5pdChzdHJ1Y3QgZHdf
cGNpZV9lcCAqZXApICB7DQo+ID4gIAlzdHJ1Y3QgZHdfcGNpZSAqcGNpID0gdG9fZHdfcGNpZV9m
cm9tX2VwKGVwKTsNCj4gPiArCXN0cnVjdCBsc19wY2llX2VwICpwY2llID0gdG9fbHNfcGNpZV9l
cChwY2kpOw0KPiA+ICAJZW51bSBwY2lfYmFybm8gYmFyOw0KPiA+DQo+ID4gIAlmb3IgKGJhciA9
IEJBUl8wOyBiYXIgPD0gQkFSXzU7IGJhcisrKQ0KPiA+ICAJCWR3X3BjaWVfZXBfcmVzZXRfYmFy
KHBjaSwgYmFyKTsNCj4gPiArDQo+ID4gKwlwY2llLT5sc19lcGMtPm1zaV9jYXBhYmxlID0gZXAt
Pm1zaV9jYXAgPyB0cnVlIDogZmFsc2U7DQo+ID4gKwlwY2llLT5sc19lcGMtPm1zaXhfY2FwYWJs
ZSA9IGVwLT5tc2l4X2NhcCA/IHRydWUgOiBmYWxzZTsNCj4gPiAgfQ0KPiA+DQo+ID4gIHN0YXRp
YyBpbnQgbHNfcGNpZV9lcF9yYWlzZV9pcnEoc3RydWN0IGR3X3BjaWVfZXAgKmVwLCB1OCBmdW5j
X25vLCBAQA0KPiA+IC0xMTgsNiArMTIwLDcgQEAgc3RhdGljIGludCBfX2luaXQgbHNfcGNpZV9l
cF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiA+ICAJc3RydWN0IGRl
dmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gPiAgCXN0cnVjdCBkd19wY2llICpwY2k7DQo+ID4g
IAlzdHJ1Y3QgbHNfcGNpZV9lcCAqcGNpZTsNCj4gPiArCXN0cnVjdCBwY2lfZXBjX2ZlYXR1cmVz
ICpsc19lcGM7DQo+ID4gIAlzdHJ1Y3QgcmVzb3VyY2UgKmRiaV9iYXNlOw0KPiA+ICAJaW50IHJl
dDsNCj4gPg0KPiA+IEBAIC0xMjksNiArMTMyLDEwIEBAIHN0YXRpYyBpbnQgX19pbml0IGxzX3Bj
aWVfZXBfcHJvYmUoc3RydWN0DQo+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgCWlmICgh
cGNpKQ0KPiA+ICAJCXJldHVybiAtRU5PTUVNOw0KPiA+DQo+ID4gKwlsc19lcGMgPSBkZXZtX2t6
YWxsb2MoZGV2LCBzaXplb2YoKmxzX2VwYyksIEdGUF9LRVJORUwpOw0KPiA+ICsJaWYgKCFsc19l
cGMpDQo+ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+ID4gKw0KPiA+ICAJZGJpX2Jhc2UgPSBwbGF0
Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLA0KPiAicmVncyIp
Ow0KPiA+ICAJcGNpLT5kYmlfYmFzZSA9IGRldm1fcGNpX3JlbWFwX2NmZ19yZXNvdXJjZShkZXYs
IGRiaV9iYXNlKTsNCj4gPiAgCWlmIChJU19FUlIocGNpLT5kYmlfYmFzZSkpDQo+ID4gQEAgLTEz
OSw2ICsxNDYsMTMgQEAgc3RhdGljIGludCBfX2luaXQgbHNfcGNpZV9lcF9wcm9iZShzdHJ1Y3QN
Cj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAJcGNpLT5vcHMgPSAmbHNfcGNpZV9lcF9v
cHM7DQo+ID4gIAlwY2llLT5wY2kgPSBwY2k7DQo+ID4NCj4gPiArCWxzX2VwYy0+bGlua3VwX25v
dGlmaWVyID0gZmFsc2UsDQo+ID4gKwlsc19lcGMtPm1zaV9jYXBhYmxlID0gdHJ1ZSwNCj4gPiAr
CWxzX2VwYy0+bXNpeF9jYXBhYmxlID0gdHJ1ZSwNCj4gDQo+IEFzIFttc2ksbXNpeF1fY2FwYWJs
ZSBpcyBzaG9ydGx5IHNldCBmcm9tIGxzX3BjaWVfZXBfaW5pdCAtIGlzIHRoZXJlIGFueSByZWFz
b24NCj4gdG8gc2V0IHRoZW0gaGVyZSAodG8gcG90ZW50aWFsbHkgaW5jb3JyZWN0IHZhbHVlcyk/
DQpUaGlzIGlzIGEgSU5JVCB2YWx1ZSwgbWF5YmUgZmFsc2UgaXMgYmV0dGVyIGZvciBtc2lfY2Fw
YWJsZSBhbmQgbXNpeF9jYXBhYmxlLCANCm9mIGNvdXJzZSwgd2UgZG9uJ3QgbmVlZCB0byBzZXQg
aXQuDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBBbmRyZXcgTXVycmF5DQo+IA0KPiA+ICsJbHNfZXBj
LT5iYXJfZml4ZWRfNjRiaXQgPSAoMSA8PCBCQVJfMikgfCAoMSA8PCBCQVJfNCksDQo+ID4gKw0K
PiA+ICsJcGNpZS0+bHNfZXBjID0gbHNfZXBjOw0KPiA+ICsNCj4gPiAgCXBsYXRmb3JtX3NldF9k
cnZkYXRhKHBkZXYsIHBjaWUpOw0KPiA+DQo+ID4gIAlyZXQgPSBsc19hZGRfcGNpZV9lcChwY2ll
LCBwZGV2KTsNCj4gPiAtLQ0KPiA+IDIuOS41DQo+ID4NCg==
