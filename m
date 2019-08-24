Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFA19B983
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 02:20:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Ff6y1tr7zDsM9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 10:20:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.3.71; helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="QRAtO70o"; 
 dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30071.outbound.protection.outlook.com [40.107.3.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Ff4f2R8JzDrR6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 10:18:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FsXvtexkl3dmM0bhTTAa4IIX7mNdUpJUS9W/t6/8fqtTlrnIWGIz4faiufv06wv7u36YL275FOTo9tt5he5pn89wbeGPUpgOKtNZBrUX95VH7J9v0MPo7D4O48wSqbGcsHKyClrIcCSXYwSaFI7P2paxdcj8RnDnYlhdBBpVcc1A+/qmK5jLqGKSiec4mwIpIE+bYiSsKiV1tNcqWYx/Er87zNp8M/pIDalWS/9Ql3FimzVK5ujgK4x0ZRLxzA68zj436e0ErFW5bCgMKPoa79Uywouub0z+YpO9sl1EkDc60g6/KBA/DOj1D3lI5sS2GVEel0FRmvspyXnx3d8MwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0IoV9GpDD1jrJnuBiVjBHbz9FfhNcLF0F1OO+k+jBQ=;
 b=AXAY/GFMpRXzkAZnOi7KhU6EPjUeysH/14oOHdXz98XSV8NeZXZOo/b53/CavJuHM8TsH/NK7UjZ9cxqw8TWxSKKlIi5Jr/yrIcMChD6oy0Fak1FcHdvDCuCQaZrVh4KB3ntDHHulWb96Wq0++wEgfH8Cbm0AIBObVDUTBC8r/8SWBWI/lfW2nPn8nLRfj2vWfpCOWb8vALufzHRgj18v1ibMLoeHoMk7bBbB1MVgLNWxARQNXIDvq73dpI9J6KqCqFinsT5egIUlVzdXM4n/toTd0mPJiq4lN1Nxpof7UdIwtIgR6abn5OmhirTiVM4ZqvsR+wMDMvOVr3PxJfjoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0IoV9GpDD1jrJnuBiVjBHbz9FfhNcLF0F1OO+k+jBQ=;
 b=QRAtO70oTHm0/3fEVmJB3mwzTWEaJkLGyUUnYPLCQG245KVpofMIHPXIYtrzw6BYx7nzzj6xhRcWibn9cGWhwOyvuRM60nWWxkq/UAlFJGnNpjg4HMPiG09oMgxQ0RX3DxnHB8QRLHEk2zFHsXRPZO4bR2CUKQdWa6/W7uiMzS0=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5SPR01MB01.eurprd04.prod.outlook.com (10.161.64.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Sat, 24 Aug 2019 00:18:17 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043%7]) with mapi id 15.20.2178.020; Sat, 24 Aug 2019
 00:18:17 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v2 08/10] PCI: layerscape: Add EP mode support for ls1088a
 and ls2088a
Thread-Topic: [PATCH v2 08/10] PCI: layerscape: Add EP mode support for
 ls1088a and ls2088a
Thread-Index: AQHVWN1gKEkcDc/BT0q+LkXHF2Gt76cIzC+AgACiVVA=
Date: Sat, 24 Aug 2019 00:18:17 +0000
Message-ID: <AM5PR04MB32990473D4AD65354B5B2235F5A70@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-8-xiaowei.bao@nxp.com>
 <20190823142756.GI14582@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190823142756.GI14582@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 96f1539f-1c5a-4303-eeb5-08d72828902e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5SPR01MB01; 
x-ms-traffictypediagnostic: AM5SPR01MB01:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5SPR01MB01F79CE75F5DD271D969FEF5A70@AM5SPR01MB01.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0139052FDB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(13464003)(199004)(189003)(81166006)(446003)(64756008)(66446008)(53546011)(102836004)(81156014)(26005)(4326008)(8676002)(229853002)(5660300002)(86362001)(316002)(66476007)(54906003)(66946007)(76116006)(6506007)(6246003)(6916009)(486006)(44832011)(14454004)(476003)(256004)(7416002)(6116002)(3846002)(76176011)(55016002)(9686003)(71190400001)(71200400001)(53936002)(66556008)(33656002)(186003)(52536014)(478600001)(2906002)(74316002)(66066001)(6436002)(8936002)(11346002)(7736002)(305945005)(7696005)(25786009)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5SPR01MB01;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZNT9xOAS8hBwdobIh207q4JXzQYHMvfBQMZDc0f2TxIxbhp6YportzwAO2Vdk9fpUjvsHtnOZGCSwv2T8zDibnwbwutBBOGhZ6nRuzYkycCmqBD+sxACKfHvtLOqFUG6eA86Sk9F0RB/SQpLBSM1BunqLD9WCuFkI3EJibEerzpoqGNzzSq5sP5BrjTJvii6K1T/qyV+kw62bKcuYhm3ASmQ0tfpLziosHROTIoTJnjOKSVhTdjN28D1QwfeZoUhboo2Whq9/BJTf28N/2xt3aK+ALCWSp4eS/pW6a0UH95cs/iNPZNdVo1tChC1RKIC37KoKg9Nql4sKYgCusw1qKzdE3Bk6ypjf372SUJPnxa3w50u5u2UgTyNmyS8xwQPSiYRu0/Ls436WOixk6nQVBCG9nJiYh9S+4M5wCwP3K8=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f1539f-1c5a-4303-eeb5-08d72828902e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2019 00:18:17.7063 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9K07FQ6nGToDgsJdm/bwXugvKTkfzHxc4Duy6CD1ri/RJb2S4461m1+WRQMR8+DHBl74t29m1srtKTrfSl7/5Q==
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
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE5xOo41MIyM8jVIDIyOjI4DQo+IFRv
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
amVjdDogUmU6IFtQQVRDSCB2MiAwOC8xMF0gUENJOiBsYXllcnNjYXBlOiBBZGQgRVAgbW9kZSBz
dXBwb3J0IGZvcg0KPiBsczEwODhhIGFuZCBsczIwODhhDQo+IA0KPiBPbiBUaHUsIEF1ZyAyMiwg
MjAxOSBhdCAwNzoyMjo0MFBNICswODAwLCBYaWFvd2VpIEJhbyB3cm90ZToNCj4gPiBBZGQgUENJ
ZSBFUCBtb2RlIHN1cHBvcnQgZm9yIGxzMTA4OGEgYW5kIGxzMjA4OGEsIHRoZXJlIGFyZSBzb21l
DQo+ID4gZGlmZmVyZW5jZSBiZXR3ZWVuIExTMSBhbmQgTFMyIHBsYXRmb3JtLCBzbyByZWZhY3Rv
ciB0aGUgY29kZSBvZiB0aGUNCj4gPiBFUCBkcml2ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiB2MjoNCj4g
PiAgLSBOZXcgbWVjaGFuaXNtIGZvciBsYXllcnNjYXBlIEVQIGRyaXZlci4NCj4gDQo+IFdhcyB0
aGVyZSBhIHYxIG9mIHRoaXMgcGF0Y2g/DQoNClllcywgYnV0IEkgZG9uJ3Qga25vdyBob3cgdG8g
Y29tbWVudHMsIF5fXg0KDQo+IA0KPiA+DQo+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaS1sYXllcnNjYXBlLWVwLmMgfCA3Ng0KPiA+ICsrKysrKysrKysrKysrKysrKysrLS0tLS0t
DQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5
ZXJzY2FwZS1lcC5jDQo+ID4gYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJz
Y2FwZS1lcC5jDQo+ID4gaW5kZXggN2NhNWZlOC4uMmE2NmYwNyAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gKysrIGIv
ZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+IEBAIC0y
MCwyNyArMjAsMjkgQEANCj4gPg0KPiA+ICAjZGVmaW5lIFBDSUVfREJJMl9PRkZTRVQJCTB4MTAw
MAkvKiBEQkkyIGJhc2UgYWRkcmVzcyovDQo+ID4NCj4gPiAtc3RydWN0IGxzX3BjaWVfZXAgew0K
PiA+IC0Jc3RydWN0IGR3X3BjaWUJCSpwY2k7DQo+ID4gLQlzdHJ1Y3QgcGNpX2VwY19mZWF0dXJl
cwkqbHNfZXBjOw0KPiA+ICsjZGVmaW5lIHRvX2xzX3BjaWVfZXAoeCkJZGV2X2dldF9kcnZkYXRh
KCh4KS0+ZGV2KQ0KPiA+ICsNCj4gPiArc3RydWN0IGxzX3BjaWVfZXBfZHJ2ZGF0YSB7DQo+ID4g
Kwl1MzIJCQkJZnVuY19vZmZzZXQ7DQo+ID4gKwljb25zdCBzdHJ1Y3QgZHdfcGNpZV9lcF9vcHMJ
Km9wczsNCj4gPiArCWNvbnN0IHN0cnVjdCBkd19wY2llX29wcwkqZHdfcGNpZV9vcHM7DQo+ID4g
IH07DQo+ID4NCj4gPiAtI2RlZmluZSB0b19sc19wY2llX2VwKHgpCWRldl9nZXRfZHJ2ZGF0YSgo
eCktPmRldikNCj4gPiArc3RydWN0IGxzX3BjaWVfZXAgew0KPiA+ICsJc3RydWN0IGR3X3BjaWUJ
CQkqcGNpOw0KPiA+ICsJc3RydWN0IHBjaV9lcGNfZmVhdHVyZXMJCSpsc19lcGM7DQo+ID4gKwlj
b25zdCBzdHJ1Y3QgbHNfcGNpZV9lcF9kcnZkYXRhICpkcnZkYXRhOyB9Ow0KPiA+DQo+ID4gIHN0
YXRpYyBpbnQgbHNfcGNpZV9lc3RhYmxpc2hfbGluayhzdHJ1Y3QgZHdfcGNpZSAqcGNpKSAgew0K
PiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGR3
X3BjaWVfb3BzIGxzX3BjaWVfZXBfb3BzID0gew0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGR3
X3BjaWVfb3BzIGR3X2xzX3BjaWVfZXBfb3BzID0gew0KPiA+ICAJLnN0YXJ0X2xpbmsgPSBsc19w
Y2llX2VzdGFibGlzaF9saW5rLCAgfTsNCj4gPg0KPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBsc19wY2llX2VwX29mX21hdGNoW10gPSB7DQo+ID4gLQl7IC5jb21wYXRpYmxl
ID0gImZzbCxscy1wY2llLWVwIix9LA0KPiA+IC0JeyB9LA0KPiA+IC19Ow0KPiA+IC0NCj4gPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZXBjX2ZlYXR1cmVzKiAgbHNfcGNpZV9lcF9nZXRfZmVh
dHVyZXMoc3RydWN0DQo+ID4gZHdfcGNpZV9lcCAqZXApICB7IEBAIC04MiwxMCArODQsNDQgQEAg
c3RhdGljIGludA0KPiA+IGxzX3BjaWVfZXBfcmFpc2VfaXJxKHN0cnVjdCBkd19wY2llX2VwICpl
cCwgdTggZnVuY19ubywNCj4gPiAgCX0NCj4gPiAgfQ0KPiA+DQo+ID4gLXN0YXRpYyBjb25zdCBz
dHJ1Y3QgZHdfcGNpZV9lcF9vcHMgcGNpZV9lcF9vcHMgPSB7DQo+ID4gK3N0YXRpYyB1bnNpZ25l
ZCBpbnQgbHNfcGNpZV9lcF9mdW5jX2NvbmZfc2VsZWN0KHN0cnVjdCBkd19wY2llX2VwICplcCwN
Cj4gPiArCQkJCQkJdTggZnVuY19ubykNCj4gPiArew0KPiA+ICsJc3RydWN0IGR3X3BjaWUgKnBj
aSA9IHRvX2R3X3BjaWVfZnJvbV9lcChlcCk7DQo+ID4gKwlzdHJ1Y3QgbHNfcGNpZV9lcCAqcGNp
ZSA9IHRvX2xzX3BjaWVfZXAocGNpKTsNCj4gPiArCXU4IGhlYWRlcl90eXBlOw0KPiA+ICsNCj4g
PiArCWhlYWRlcl90eXBlID0gaW9yZWFkOChwY2ktPmRiaV9iYXNlICsgUENJX0hFQURFUl9UWVBF
KTsNCj4gPiArDQo+ID4gKwlpZiAoaGVhZGVyX3R5cGUgJiAoMSA8PCA3KSkNCj4gPiArCQlyZXR1
cm4gcGNpZS0+ZHJ2ZGF0YS0+ZnVuY19vZmZzZXQgKiBmdW5jX25vOw0KPiA+ICsJZWxzZQ0KPiA+
ICsJCXJldHVybiAwOw0KPiANCj4gSXQgbG9va3MgbGlrZSB0aGVyZSBpc24ndCBhIFBDSSBkZWZp
bmUgZm9yIG11bHRpIGZ1bmN0aW9uLCB0aGUgbmVhcmVzdCBJIGNvdWxkIGZpbmQNCj4gd2FzIFBD
SV9IRUFERVJfVFlQRV9NVUxUSURFVklDRSBpbiBob3RwbHVnL2libXBocC5oLiBBIGNvbW1lbnQN
Cj4gYWJvdmUgdGhlIHRlc3QgbWlnaHQgYmUgaGVscGZ1bCB0byBleHBsYWluIHRoZSB0ZXN0Lg0K
DQpZZXMsIEkgaGF2ZSBub3QgZmluZCB0aGUgUENJX0hFQURFUl9UWVBFX01VTFRJREVWSUNFIGRl
ZmluZS4gT0ssIEkgd2lsbCBhZGQNClRoZSBjb21tZW50cyBpbiBuZXh0IHZlcnNpb24gcGF0Y2gu
DQoNCj4gDQo+IEFzIHRoZSBsc19wY2llX2VwX2RydmRhdGEgc3RydWN0dXJlcyBhcmUgc3RhdGlj
LCB0aGUgdW5zZXQgLmZ1bmNfb2Zmc2V0IHdpbGwgYmUNCj4gaW5pdGlhbGlzZWQgdG8gMCwgc28g
eW91IGNvdWxkIGp1c3QgZHJvcCB0aGUgdGVzdCBhYm92ZS4NCg0KT0ssIHRoYW5rcw0KDQo+IA0K
PiBIb3dldmVyIHNvbWV0aGluZyB0byB0aGUgZWZmZWN0IG9mIHRoZSBmb2xsb3dpbmcgbWF5IGhl
bHAgc3BvdA0KPiBtaXNjb25maWd1cmF0aW9uOg0KPiANCj4gV0FSTl9PTihmdW5jX25vICYmICFw
Y2llLT5kcnZkYXRhLT5mdW5jX29mZnNldCk7IHJldHVybg0KPiBwY2llLT5kcnZkYXRhLT5mdW5j
X29mZnNldCAqIGZ1bmNfbm87DQoNClRoYW5rcyBhIGxvdCwgdGhpcyBsb29rcyBiZXR0ZXIuDQoN
Cj4gDQo+IFRoZSBXQVJOIGlzIHByb2JhYmx5IHF1aXRlIHVzZWZ1bCBhcyBpZiB5b3UgYXJlIGF0
dGVtcHRpbmcgdG8gdXNlIG5vbi16ZXJvDQo+IGZ1bmN0aW9ucyBhbmQgZnVuY19vZmZzZXQgaXNu
J3Qgc2V0IC0gdGhlbiB0aGluZ3MgbWF5IGFwcGVhciB0byB3b3JrIG5vcm1hbGx5DQo+IGJ1dCBh
Y3R1YWxseSB3aWxsIGJyZWFrIGhvcnJpYmx5Lg0KDQpnb3QgaXQsIHRoYW5rcy4NCg0KPiANCj4g
VGhhbmtzLA0KPiANCj4gQW5kcmV3IE11cnJheQ0KPiANCj4gPiArfQ0KPiA+ICsNCj4gPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBkd19wY2llX2VwX29wcyBsc19wY2llX2VwX29wcyA9IHsNCj4gPiAg
CS5lcF9pbml0ID0gbHNfcGNpZV9lcF9pbml0LA0KPiA+ICAJLnJhaXNlX2lycSA9IGxzX3BjaWVf
ZXBfcmFpc2VfaXJxLA0KPiA+ICAJLmdldF9mZWF0dXJlcyA9IGxzX3BjaWVfZXBfZ2V0X2ZlYXR1
cmVzLA0KPiA+ICsJLmZ1bmNfY29uZl9zZWxlY3QgPSBsc19wY2llX2VwX2Z1bmNfY29uZl9zZWxl
Y3QsIH07DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGxzX3BjaWVfZXBfZHJ2ZGF0
YSBsczFfZXBfZHJ2ZGF0YSA9IHsNCj4gPiArCS5vcHMgPSAmbHNfcGNpZV9lcF9vcHMsDQo+ID4g
KwkuZHdfcGNpZV9vcHMgPSAmZHdfbHNfcGNpZV9lcF9vcHMsDQo+ID4gK307DQo+ID4gKw0KPiA+
ICtzdGF0aWMgY29uc3Qgc3RydWN0IGxzX3BjaWVfZXBfZHJ2ZGF0YSBsczJfZXBfZHJ2ZGF0YSA9
IHsNCj4gPiArCS5mdW5jX29mZnNldCA9IDB4MjAwMDAsDQo+ID4gKwkub3BzID0gJmxzX3BjaWVf
ZXBfb3BzLA0KPiA+ICsJLmR3X3BjaWVfb3BzID0gJmR3X2xzX3BjaWVfZXBfb3BzLA0KPiA+ICt9
Ow0KPiA+ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbHNfcGNpZV9l
cF9vZl9tYXRjaFtdID0gew0KPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJmc2wsbHMxMDQ2YS1wY2ll
LWVwIiwgLmRhdGEgPSAmbHMxX2VwX2RydmRhdGEgfSwNCj4gPiArCXsgLmNvbXBhdGlibGUgPSAi
ZnNsLGxzMTA4OGEtcGNpZS1lcCIsIC5kYXRhID0gJmxzMl9lcF9kcnZkYXRhIH0sDQo+ID4gKwl7
IC5jb21wYXRpYmxlID0gImZzbCxsczIwODhhLXBjaWUtZXAiLCAuZGF0YSA9ICZsczJfZXBfZHJ2
ZGF0YSB9LA0KPiA+ICsJeyB9LA0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0YXRpYyBpbnQgX19pbml0
IGxzX2FkZF9wY2llX2VwKHN0cnVjdCBsc19wY2llX2VwICpwY2llLCBAQCAtOTgsNw0KPiA+ICsx
MzQsNyBAQCBzdGF0aWMgaW50IF9faW5pdCBsc19hZGRfcGNpZV9lcChzdHJ1Y3QgbHNfcGNpZV9l
cCAqcGNpZSwNCj4gPiAgCWludCByZXQ7DQo+ID4NCj4gPiAgCWVwID0gJnBjaS0+ZXA7DQo+ID4g
LQllcC0+b3BzID0gJnBjaWVfZXBfb3BzOw0KPiA+ICsJZXAtPm9wcyA9IHBjaWUtPmRydmRhdGEt
Pm9wczsNCj4gPg0KPiA+ICAJcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2
LCBJT1JFU09VUkNFX01FTSwNCj4gImFkZHJfc3BhY2UiKTsNCj4gPiAgCWlmICghcmVzKQ0KPiA+
IEBAIC0xMzcsMTQgKzE3MywxMSBAQCBzdGF0aWMgaW50IF9faW5pdCBsc19wY2llX2VwX3Byb2Jl
KHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gIAlpZiAoIWxzX2VwYykNCj4g
PiAgCQlyZXR1cm4gLUVOT01FTTsNCj4gPg0KPiA+IC0JZGJpX2Jhc2UgPSBwbGF0Zm9ybV9nZXRf
cmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLA0KPiAicmVncyIpOw0KPiA+IC0J
cGNpLT5kYmlfYmFzZSA9IGRldm1fcGNpX3JlbWFwX2NmZ19yZXNvdXJjZShkZXYsIGRiaV9iYXNl
KTsNCj4gPiAtCWlmIChJU19FUlIocGNpLT5kYmlfYmFzZSkpDQo+ID4gLQkJcmV0dXJuIFBUUl9F
UlIocGNpLT5kYmlfYmFzZSk7DQo+ID4gKwlwY2llLT5kcnZkYXRhID0gb2ZfZGV2aWNlX2dldF9t
YXRjaF9kYXRhKGRldik7DQo+ID4NCj4gPiAtCXBjaS0+ZGJpX2Jhc2UyID0gcGNpLT5kYmlfYmFz
ZSArIFBDSUVfREJJMl9PRkZTRVQ7DQo+ID4gIAlwY2ktPmRldiA9IGRldjsNCj4gPiAtCXBjaS0+
b3BzID0gJmxzX3BjaWVfZXBfb3BzOw0KPiA+ICsJcGNpLT5vcHMgPSBwY2llLT5kcnZkYXRhLT5k
d19wY2llX29wczsNCj4gPiArDQo+ID4gIAlwY2llLT5wY2kgPSBwY2k7DQo+ID4NCj4gPiAgCWxz
X2VwYy0+bGlua3VwX25vdGlmaWVyID0gZmFsc2UsDQo+ID4gQEAgLTE1Miw2ICsxODUsMTMgQEAg
c3RhdGljIGludCBfX2luaXQgbHNfcGNpZV9lcF9wcm9iZShzdHJ1Y3QNCj4gPiBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpDQo+ID4NCj4gPiAgCXBjaWUtPmxzX2VwYyA9IGxzX2VwYzsNCj4gPg0KPiA+
ICsJZGJpX2Jhc2UgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VS
Q0VfTUVNLA0KPiAicmVncyIpOw0KPiA+ICsJcGNpLT5kYmlfYmFzZSA9IGRldm1fcGNpX3JlbWFw
X2NmZ19yZXNvdXJjZShkZXYsIGRiaV9iYXNlKTsNCj4gPiArCWlmIChJU19FUlIocGNpLT5kYmlf
YmFzZSkpDQo+ID4gKwkJcmV0dXJuIFBUUl9FUlIocGNpLT5kYmlfYmFzZSk7DQo+ID4gKw0KPiA+
ICsJcGNpLT5kYmlfYmFzZTIgPSBwY2ktPmRiaV9iYXNlICsgUENJRV9EQkkyX09GRlNFVDsNCj4g
PiArDQo+ID4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwY2llKTsNCj4gPg0KPiA+ICAJ
cmV0ID0gbHNfYWRkX3BjaWVfZXAocGNpZSwgcGRldik7DQo+ID4gLS0NCj4gPiAyLjkuNQ0KPiA+
DQo=
