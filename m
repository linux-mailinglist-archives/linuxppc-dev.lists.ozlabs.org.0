Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E60C9F875
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 04:52:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46J9J50N0yzDqh3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 12:52:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.41; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="VjsEEkMZ"; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150041.outbound.protection.outlook.com [40.107.15.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46J9Fs1RV0zDqwy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 12:50:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIHfSOMmC12rzwj8mhVUZGrAsSt0G0UaIekrHXaFg9VknNYE/Jkvz/dtwDpxr3gUvqyjjed2pICT6BOfDJYrrYTn3akapGUt+UffHKyebMrF65Kyvm45bM1m1dh3Zki6RLEF7QldCC9RFajha5uByBxK+jkJHCKHNxC8/HUZEIY+bVuOxlu6A7qR/pDgZaauEDTnokpWkyXEWNpCpWLQFQCVE+cXZEMj0l6BaKcnj7LTb93YhA/fdvFtxmGa/EmidmF6PL3sDR5Z5zD/FBNk4BMmZ2fdjDrNazs432356JDEoRFTBafeXTFKUvz4oS8nBVi7MY1kG+mykK9h9MAHDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jMZziyBA34WMO2UjfbGq/zrlTez7PF1LqUsNcnrg1Y=;
 b=JVihENO16u50P4Q4hTOUdkltxLvSKQif3QcM69wteO0vOdw473/pfbEXTXH3iE4wHEfrpMYi2G5fVvWTmjzK2v0X9Q0gJhXc2pCQqkAycUtOjpGzu/o04wD99Skpyl7S8IljL5Q0C0CXTDMOlvT845o6l2BsagEckia8xCWsllMZ80iSvPYsbjlu9hO7PPseZ55HOm1gz6/wns16A+1jv6DRzPsJGilMzSXQcQqLjh58jwb1rJ3/92T6Vaiay9YsvJAzACp8DaSxboQ1kIdirzVPNfYzmNOlA8wg9nHM3h6cETjVUl/+eiAStnRJBMQaM3vRiIaTB3nIXTcz2Nnfhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jMZziyBA34WMO2UjfbGq/zrlTez7PF1LqUsNcnrg1Y=;
 b=VjsEEkMZh+MQJ7jtx30W0zTecTtX+n3XRCcIwQTnLLNOJsZY8KEXWd+9GDrEeO3+UD+Fx+tByWzdnicJ8lM4juy8MFjt7anjTy7ziV6UQKHk5TTvHL+VhlrjNZm1kJDfM1yOvH4keURV7sX0cylKlGOv08Zop6m64hkCv90ZUM0=
Received: from VI1PR04MB3310.eurprd04.prod.outlook.com (10.170.231.148) by
 VI1PR04MB4317.eurprd04.prod.outlook.com (52.134.31.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 28 Aug 2019 02:49:56 +0000
Received: from VI1PR04MB3310.eurprd04.prod.outlook.com
 ([fe80::cc5f:fa01:329d:7179]) by VI1PR04MB3310.eurprd04.prod.outlook.com
 ([fe80::cc5f:fa01:329d:7179%7]) with mapi id 15.20.2199.021; Wed, 28 Aug 2019
 02:49:56 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the doorbell
 way
Thread-Topic: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the
 doorbell way
Thread-Index: AQHVWN1daYnbY17h2k2o9Z3qkBZ1lKcIw+QAgACoZvCABZeogIAA4Bgw
Date: Wed, 28 Aug 2019 02:49:56 +0000
Message-ID: <VI1PR04MB3310A1C5D6E4B7A35D6AC4D6F5A30@VI1PR04MB3310.eurprd04.prod.outlook.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-7-xiaowei.bao@nxp.com>
 <20190823135816.GH14582@e119886-lin.cambridge.arm.com>
 <AM5PR04MB3299E50BA5D7579D41B8B4F9F5A70@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <20190827132504.GL14582@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190827132504.GL14582@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 446357c4-b8bd-4418-d007-08d72b6268d8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1PR04MB4317; 
x-ms-traffictypediagnostic: VI1PR04MB4317:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB431785D1AA9D73A3A23B14FAF5A30@VI1PR04MB4317.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 014304E855
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(199004)(189003)(13464003)(86362001)(486006)(71190400001)(76116006)(66476007)(66556008)(64756008)(66446008)(26005)(71200400001)(44832011)(186003)(66066001)(478600001)(8676002)(81156014)(54906003)(81166006)(8936002)(229853002)(66946007)(53546011)(55016002)(102836004)(7416002)(3846002)(74316002)(305945005)(6116002)(14454004)(7736002)(6916009)(25786009)(52536014)(446003)(4326008)(5660300002)(6246003)(11346002)(76176011)(14444005)(256004)(2906002)(9686003)(476003)(53936002)(7696005)(6436002)(99286004)(316002)(33656002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB4317;
 H:VI1PR04MB3310.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gJnkk3DN2u3qPwZTArQpvfXQHfmiboeC5qr8wsENEmt95eO0WxbLaJdmW944gtpQkq3p5rF98u27w4u7gKAhsVouczTeEQM/EtHlaFXxgsTQBfBVpmU3WKP8JnJeVhps7j7xhkZP1Be2DYKQofcs6mQ6In6ZFebrxduAjrjs+GrRWm25D3z8YyQztL3VvnevxxR/0GqdAzAiDdveNpgCRIVf1I2MY3rmKfJvbBY+I/ETOP03DhTjv6MgQW09QMfm2h1/jM5avnaNElpc31aCULh73t+m+LjiDa17Y1QyDpOG+n0Xs6yUkEHlnUUWkuLA7/f1vf3kXrsSSQd4aa6l+2kolpi7C7WuoPM54RCNu/2kivCX5vPv9wW7/nArw8facvsYrSZgacGT6uov5MUo+UkNflR+V+meHn7CiggZMW4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 446357c4-b8bd-4418-d007-08d72b6268d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Aug 2019 02:49:56.1343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SzIhTt6idQcdLWfAS1PsE7dsai07ETeGvkiW7RCKJLuQxguzxVOrkAQ/OjJneTag5+YI9WBi6nMyut6wtYZYFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4317
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
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE55bm0OOaciDI35pelIDIxOjI1DQo+
IFRvOiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gQ2M6IGJoZWxnYWFzQGdv
b2dsZS5jb207IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207DQo+IHNo
YXduZ3VvQGtlcm5lbC5vcmc7IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPjsga2lzaG9uQHRp
LmNvbTsNCj4gbG9yZW56by5waWVyYWxpc2lAYXJtLmNvOyBhcm5kQGFybmRiLmRlOyBncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZzsgTS5oLg0KPiBMaWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+
OyBNaW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5jb20+OyBSb3kNCj4gWmFuZyA8cm95LnphbmdA
bnhwLmNvbT47IGppbmdvb2hhbjFAZ21haWwuY29tOw0KPiBndXN0YXZvLnBpbWVudGVsQHN5bm9w
c3lzLmNvbTsgbGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcNCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2MiAwNy8xMF0gUENJOiBsYXllcnNjYXBlOiBNb2RpZnkgdGhl
IE1TSVggdG8gdGhlDQo+IGRvb3JiZWxsIHdheQ0KPiANCj4gT24gU2F0LCBBdWcgMjQsIDIwMTkg
YXQgMTI6MDg6NDBBTSArMDAwMCwgWGlhb3dlaSBCYW8gd3JvdGU6DQo+ID4NCj4gPg0KPiA+ID4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEFuZHJldyBNdXJyYXkgPGFu
ZHJldy5tdXJyYXlAYXJtLmNvbT4NCj4gPiA+IFNlbnQ6IDIwMTnlubQ45pyIMjPml6UgMjE6NTgN
Cj4gPiA+IFRvOiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gPiA+IENjOiBi
aGVsZ2Fhc0Bnb29nbGUuY29tOyByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0u
Y29tOw0KPiA+ID4gc2hhd25ndW9Aa2VybmVsLm9yZzsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5j
b20+OyBraXNob25AdGkuY29tOw0KPiA+ID4gbG9yZW56by5waWVyYWxpc2lAYXJtLmNvOyBhcm5k
QGFybmRiLmRlOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsNCj4gTS5oLg0KPiA+ID4gTGlh
biA8bWluZ2h1YW4ubGlhbkBueHAuY29tPjsgTWluZ2thaSBIdSA8bWluZ2thaS5odUBueHAuY29t
PjsgUm95DQo+ID4gPiBaYW5nIDxyb3kuemFuZ0BueHAuY29tPjsgamluZ29vaGFuMUBnbWFpbC5j
b207DQo+ID4gPiBndXN0YXZvLnBpbWVudGVsQHN5bm9wc3lzLmNvbTsgbGludXgtcGNpQHZnZXIu
a2VybmVsLm9yZzsNCj4gPiA+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnOw0KPiA+ID4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnOyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZw0KPiA+ID4gU3ViamVjdDogUmU6
IFtQQVRDSCB2MiAwNy8xMF0gUENJOiBsYXllcnNjYXBlOiBNb2RpZnkgdGhlIE1TSVggdG8NCj4g
PiA+IHRoZSBkb29yYmVsbCB3YXkNCj4gPiA+DQo+ID4gPiBPbiBUaHUsIEF1ZyAyMiwgMjAxOSBh
dCAwNzoyMjozOVBNICswODAwLCBYaWFvd2VpIEJhbyB3cm90ZToNCj4gPiA+ID4gVGhlIGxheWVy
c2NhcGUgcGxhdGZvcm0gdXNlIHRoZSBkb29yYmVsbCB3YXkgdG8gdHJpZ2dlciBNU0lYDQo+ID4g
PiA+IGludGVycnVwdCBpbiBFUCBtb2RlLg0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IEkgaGF2ZSBu
byBwcm9ibGVtcyB3aXRoIHRoaXMgcGF0Y2gsIGhvd2V2ZXIuLi4NCj4gPiA+DQo+ID4gPiBBcmUg
eW91IGFibGUgdG8gYWRkIHRvIHRoaXMgbWVzc2FnZSBhIHJlYXNvbiBmb3Igd2h5IHlvdSBhcmUg
bWFraW5nDQo+ID4gPiB0aGlzIGNoYW5nZT8gRGlkIGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnEg
bm90IHdvcmsgd2hlbiBmdW5jX25vICE9DQo+ID4gPiAwPyBPciBkaWQgaXQgd29yayB5ZXQgZHdf
cGNpZV9lcF9yYWlzZV9tc2l4X2lycV9kb29yYmVsbCBpcyBtb3JlDQo+IGVmZmljaWVudD8NCj4g
Pg0KPiA+IFRoZSBmYWN0IGlzIHRoYXQsIHRoaXMgZHJpdmVyIGlzIHZlcmlmaWVkIGluIGxzMTA0
NmEgcGxhdGZvcm0gb2YgTlhQDQo+ID4gYmVmb3JlLCBhbmQgbHMxMDQ2YSBkb24ndCBzdXBwb3J0
IE1TSVggZmVhdHVyZSwgc28gSSBzZXQgdGhlDQo+ID4gbXNpeF9jYXBhYmxlIG9mIHBjaV9lcGNf
ZmVhdHVyZXMgc3RydWN0IGlzIGZhbHNlLCBidXQgaW4gb3RoZXINCj4gPiBwbGF0Zm9ybSwgZS5n
LiBsczEwODhhLCBpdCBzdXBwb3J0IHRoZSBNU0lYIGZlYXR1cmUsIEkgdmVyaWZpZWQgdGhlIE1T
SVgNCj4gZmVhdHVyZSBpbiBsczEwODhhLCBpdCBpcyBub3QgT0ssIHNvIEkgY2hhbmdlZCB0byBh
bm90aGVyIHdheS4gVGhhbmtzLg0KPiANCj4gUmlnaHQsIHNvIHRoZSBleGlzdGluZyBwY2ktbGF5
ZXJzY2FwZS1lcC5jIGRyaXZlciBuZXZlciBzdXBwb3J0ZWQgTVNJWCB5ZXQgaXQNCj4gZXJyb25l
b3VzbHkgaGFkIGEgc3dpdGNoIGNhc2Ugc3RhdGVtZW50IHRvIGNhbGwgZHdfcGNpZV9lcF9yYWlz
ZV9tc2l4X2lycQ0KPiB3aGljaCB3b3VsZCBuZXZlciBnZXQgdXNlZC4NCj4gDQo+IE5vdyB0aGF0
IHdlJ3JlIGFkZGluZyBhIHBsYXRmb3JtIHdpdGggTVNJWCBzdXBwb3J0IHRoZSBleGlzdGluZw0K
PiBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJxIGRvZXNuJ3Qgd29yayAoZm9yIHRoaXMgcGxhdGZv
cm0pIHNvIHdlIGFyZSBhZGRpbmcNCj4gYSBkaWZmZXJlbnQgbWV0aG9kLg0KPiANCj4gR2l2ZW4g
dGhhdCBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJxIGlzIHVzZWQgYnkgcGNpZS1kZXNpZ253YXJl
LXBsYXQuYyB3ZQ0KPiBjYW4gYXNzdW1lIHRoaXMgZnVuY3Rpb24gYXQgbGVhc3Qgd29ya3MgZm9y
IGl0J3MgdXNlIGNhc2UuDQo+IA0KPiBQbGVhc2UgdXBkYXRlIHRoZSBjb21taXQgbWVzc2FnZSAt
IEl0IHdvdWxkIGJlIGhlbHBmdWwgdG8gc3VnZ2VzdCB0aGF0DQo+IGR3X3BjaWVfZXBfcmFpc2Vf
bXNpeF9pcnEgd2FzIG5ldmVyIGNhbGxlZCBpbiB0aGUgZXhpc2l0bmcgZHJpdmVyIGJlY2F1c2UN
Cj4gbXNpeF9jYXBhYmxlIHdhcyBhbHdheXMgc2V0IHRvIGZhbHNlLg0KDQpBZ3JlZSwgdGhpcyBp
cyBtdWNoIGNsZWFyZXIsIEkgd2lsbCBtb2RpZnkgdGhlIGNvbW1pdCBtZXNzYWdlIGluIHRoZSBu
ZXh0IHZlcnNpb24gcGF0Y2gsDQp0aGFua3MgYSBsb3QuDQoNCj4gDQo+IFRoYW5rcywNCj4gDQo+
IEFuZHJldyBNdXJyYXkNCj4gDQo+ID4NCj4gPiA+DQo+ID4gPiBUaGFua3MsDQo+ID4gPg0KPiA+
ID4gQW5kcmV3IE11cnJheQ0KPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWGlhb3dlaSBC
YW8gPHhpYW93ZWkuYmFvQG54cC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiB2MjoNCj4gPiA+
ID4gIC0gTm8gY2hhbmdlLg0KPiA+ID4gPg0KPiA+ID4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYyB8IDMgKystDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+
ID4gPiA+IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0K
PiA+ID4gPiBpbmRleCA4NDYxZjYyLi43Y2E1ZmU4IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gPiA+ICsrKyBi
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMNCj4gPiA+ID4g
QEAgLTc0LDcgKzc0LDggQEAgc3RhdGljIGludCBsc19wY2llX2VwX3JhaXNlX2lycShzdHJ1Y3QN
Cj4gPiA+ID4gZHdfcGNpZV9lcCAqZXAsDQo+ID4gPiB1OCBmdW5jX25vLA0KPiA+ID4gPiAgCWNh
c2UgUENJX0VQQ19JUlFfTVNJOg0KPiA+ID4gPiAgCQlyZXR1cm4gZHdfcGNpZV9lcF9yYWlzZV9t
c2lfaXJxKGVwLCBmdW5jX25vLCBpbnRlcnJ1cHRfbnVtKTsNCj4gPiA+ID4gIAljYXNlIFBDSV9F
UENfSVJRX01TSVg6DQo+ID4gPiA+IC0JCXJldHVybiBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJx
KGVwLCBmdW5jX25vLA0KPiBpbnRlcnJ1cHRfbnVtKTsNCj4gPiA+ID4gKwkJcmV0dXJuIGR3X3Bj
aWVfZXBfcmFpc2VfbXNpeF9pcnFfZG9vcmJlbGwoZXAsIGZ1bmNfbm8sDQo+ID4gPiA+ICsJCQkJ
CQkJICBpbnRlcnJ1cHRfbnVtKTsNCj4gPiA+ID4gIAlkZWZhdWx0Og0KPiA+ID4gPiAgCQlkZXZf
ZXJyKHBjaS0+ZGV2LCAiVU5LTk9XTiBJUlEgdHlwZVxuIik7DQo+ID4gPiA+ICAJCXJldHVybiAt
RUlOVkFMOw0KPiA+ID4gPiAtLQ0KPiA+ID4gPiAyLjkuNQ0KPiA+ID4gPg0K
