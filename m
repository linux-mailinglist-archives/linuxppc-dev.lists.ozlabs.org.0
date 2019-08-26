Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F14E9CCD7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 11:51:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46H6hv2SW7zDqcx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 19:51:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.0.51; helo=eur02-am5-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="JNcsX3Rv"; 
 dkim-atps=neutral
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00051.outbound.protection.outlook.com [40.107.0.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46H6fy0tKszDqXW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 19:49:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alqfTbYhYku8FXGMMa03MPH42Hk+RMMSFykojNBcImlKI2pKmAyhkmd7/xa4vZSOnkWGwpgmg1iEftd/a3y1O4YwwLKwAmyaIlcHYNl1otVrt0TcD7gOHU4P1rpMlVTQ1Y51Sp39oXDf8Hq5txW6/cJK236jeWsGjgJWZ/Ih07L/uHdivIStM89bU+iJuoLOdMycdGsSsklYdFJbgnDHZj6F56AzD2buMdV5ZDhc4ifTwKTDKu1Hsj0jKOGjR0lhkwZ1GxOBAoqMgUFlHs8xnTHPbPRYyJi925L9zdth5hIUvCc2Lo2WNFM9vCOcK/Pnrms7YDBbupi+TyaYBZrE+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDOLIJxl8CDuCt7WSKWMTDz77vyQyC9SJ+UhXFjfUqc=;
 b=jzq9PdZSqhRXLEnhLslSPo+rZjBNiqZmcz/gYzIjSl7yyENrclQC4aReWTQhUvLUdNvVMHnFwwOzoaIiLf0wFoa0R6NfnDW83ZGci8LI0cdpMMtSrGO9fdi683RG9BOEvYTL2Dh4wl/zEC2846AmLog5uxZpBGZ8SJUOsZHElMIqyNZFj2zeifx2LyS7arTq308paHobT7sFrCsS+DpxK3yt/kj4X2UhcbK9we3T0PQ748+ZGLBVnx54Dmhtaku5Wk+dSpU6cVfXzBXm6OnvaDwWIC1P/JLHiI+/IpjkFfA/9DHHc6IOx/QoXBcqOt+L0KdPEJ9QINk2/dDbqcWE6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yDOLIJxl8CDuCt7WSKWMTDz77vyQyC9SJ+UhXFjfUqc=;
 b=JNcsX3RvOtUYp13tuEHLxhbB87jWvsbWmTwLyrEUDSQ4DmO4ThR72ocoo/8YfBjXLK7LV9JDVV0TNnGOF0tYdfJiBlFVHtHQ2L8B45ZirgG23w68hXuJlLYpQr+9wmlGULu0YrKjQ0gLuQ2JfujmhyRgV97dkZ7lfohaGJpVWBI=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3044.eurprd04.prod.outlook.com (10.167.171.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Mon, 26 Aug 2019 09:49:35 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043%7]) with mapi id 15.20.2178.023; Mon, 26 Aug 2019
 09:49:35 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v2 08/10] PCI: layerscape: Add EP mode support for ls1088a
 and ls2088a
Thread-Topic: [PATCH v2 08/10] PCI: layerscape: Add EP mode support for
 ls1088a and ls2088a
Thread-Index: AQHVWN1gKEkcDc/BT0q+LkXHF2Gt76cIzC+AgARekBA=
Date: Mon, 26 Aug 2019 09:49:35 +0000
Message-ID: <AM5PR04MB3299B100D1029E90945CF7DDF5A10@AM5PR04MB3299.eurprd04.prod.outlook.com>
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
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d6448dd2-4bd2-409b-c505-08d72a0ab40f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3044; 
x-ms-traffictypediagnostic: AM5PR04MB3044:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB304438D958ADE4D335323532F5A10@AM5PR04MB3044.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01415BB535
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(366004)(346002)(376002)(396003)(13464003)(189003)(199004)(4326008)(256004)(66946007)(9686003)(66476007)(66556008)(64756008)(66446008)(14444005)(229853002)(86362001)(5660300002)(25786009)(76116006)(478600001)(52536014)(55016002)(66066001)(54906003)(316002)(6246003)(71190400001)(71200400001)(53936002)(7416002)(14454004)(81166006)(81156014)(8936002)(3846002)(6116002)(2906002)(33656002)(446003)(476003)(11346002)(99286004)(44832011)(486006)(6916009)(53546011)(6506007)(186003)(74316002)(7736002)(305945005)(6436002)(102836004)(26005)(7696005)(76176011)(8676002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3044;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ks6SS0M/leNP1C9vKu/VzoaIiNug4tUQtwM/rASMyfY1Gu/IbCg0oQl693c/9uFECK+AyxdqoQ+jDJl6zHLZ0uQN7+KcxlqjNx58w97EDS2lQRcm2rfJfWlhtG/klAN2bSHeCzVzZMJtcWJg+FDHqJa1QmEQQaNz+F0UAGdNtPbAYdGoB+RCKNV+xhxgZwhQIV2Z5ZTiLIxuxYxfCYYFy+aS0/ReS9bvYr4C+SGTrpllavvOjGgOgZ4p/zWDSI/FsuxvYtfAccMbTM6mIbg7m0TMVwYmXzWOo5FjpC0Cm9W2Y6+cp+W0vzFMPLRjw1/EFbFrNIcw2IbsYrzojlIO/q+wvxZix+A8LVk25h/tm31cChJBv9FqZ8MywK7FrFfir2KZWd0U5FQ1Q53vDhMJuT47BoGNFOkLY0n/ErlJYP0=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6448dd2-4bd2-409b-c505-08d72a0ab40f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2019 09:49:35.4296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nZ7xX3/iY6NkamHpNyfyOvGcZCzebKCncqb4dmoLsSpHBT5IS10cnq5RylrnGY8JB17CLV47WFwvfVHWhjicKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3044
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
aGVyZSBhIHYxIG9mIHRoaXMgcGF0Y2g/DQo+IA0KPiA+DQo+ID4gIGRyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMgfCA3Ng0KPiA+ICsrKysrKysrKysrKysrKysr
KysrLS0tLS0tDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspLCAxOCBkZWxl
dGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gaW5kZXggN2NhNWZlOC4uMmE2NmYwNyAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+
ID4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0K
PiA+IEBAIC0yMCwyNyArMjAsMjkgQEANCj4gPg0KPiA+ICAjZGVmaW5lIFBDSUVfREJJMl9PRkZT
RVQJCTB4MTAwMAkvKiBEQkkyIGJhc2UgYWRkcmVzcyovDQo+ID4NCj4gPiAtc3RydWN0IGxzX3Bj
aWVfZXAgew0KPiA+IC0Jc3RydWN0IGR3X3BjaWUJCSpwY2k7DQo+ID4gLQlzdHJ1Y3QgcGNpX2Vw
Y19mZWF0dXJlcwkqbHNfZXBjOw0KPiA+ICsjZGVmaW5lIHRvX2xzX3BjaWVfZXAoeCkJZGV2X2dl
dF9kcnZkYXRhKCh4KS0+ZGV2KQ0KPiA+ICsNCj4gPiArc3RydWN0IGxzX3BjaWVfZXBfZHJ2ZGF0
YSB7DQo+ID4gKwl1MzIJCQkJZnVuY19vZmZzZXQ7DQo+ID4gKwljb25zdCBzdHJ1Y3QgZHdfcGNp
ZV9lcF9vcHMJKm9wczsNCj4gPiArCWNvbnN0IHN0cnVjdCBkd19wY2llX29wcwkqZHdfcGNpZV9v
cHM7DQo+ID4gIH07DQo+ID4NCj4gPiAtI2RlZmluZSB0b19sc19wY2llX2VwKHgpCWRldl9nZXRf
ZHJ2ZGF0YSgoeCktPmRldikNCj4gPiArc3RydWN0IGxzX3BjaWVfZXAgew0KPiA+ICsJc3RydWN0
IGR3X3BjaWUJCQkqcGNpOw0KPiA+ICsJc3RydWN0IHBjaV9lcGNfZmVhdHVyZXMJCSpsc19lcGM7
DQo+ID4gKwljb25zdCBzdHJ1Y3QgbHNfcGNpZV9lcF9kcnZkYXRhICpkcnZkYXRhOyB9Ow0KPiA+
DQo+ID4gIHN0YXRpYyBpbnQgbHNfcGNpZV9lc3RhYmxpc2hfbGluayhzdHJ1Y3QgZHdfcGNpZSAq
cGNpKSAgew0KPiA+ICAJcmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+IC1zdGF0aWMgY29uc3Qg
c3RydWN0IGR3X3BjaWVfb3BzIGxzX3BjaWVfZXBfb3BzID0gew0KPiA+ICtzdGF0aWMgY29uc3Qg
c3RydWN0IGR3X3BjaWVfb3BzIGR3X2xzX3BjaWVfZXBfb3BzID0gew0KPiA+ICAJLnN0YXJ0X2xp
bmsgPSBsc19wY2llX2VzdGFibGlzaF9saW5rLCAgfTsNCj4gPg0KPiA+IC1zdGF0aWMgY29uc3Qg
c3RydWN0IG9mX2RldmljZV9pZCBsc19wY2llX2VwX29mX21hdGNoW10gPSB7DQo+ID4gLQl7IC5j
b21wYXRpYmxlID0gImZzbCxscy1wY2llLWVwIix9LA0KPiA+IC0JeyB9LA0KPiA+IC19Ow0KPiA+
IC0NCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZXBjX2ZlYXR1cmVzKiAgbHNfcGNpZV9l
cF9nZXRfZmVhdHVyZXMoc3RydWN0DQo+ID4gZHdfcGNpZV9lcCAqZXApICB7IEBAIC04MiwxMCAr
ODQsNDQgQEAgc3RhdGljIGludA0KPiA+IGxzX3BjaWVfZXBfcmFpc2VfaXJxKHN0cnVjdCBkd19w
Y2llX2VwICplcCwgdTggZnVuY19ubywNCj4gPiAgCX0NCj4gPiAgfQ0KPiA+DQo+ID4gLXN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHdfcGNpZV9lcF9vcHMgcGNpZV9lcF9vcHMgPSB7DQo+ID4gK3N0YXRp
YyB1bnNpZ25lZCBpbnQgbHNfcGNpZV9lcF9mdW5jX2NvbmZfc2VsZWN0KHN0cnVjdCBkd19wY2ll
X2VwICplcCwNCj4gPiArCQkJCQkJdTggZnVuY19ubykNCj4gPiArew0KPiA+ICsJc3RydWN0IGR3
X3BjaWUgKnBjaSA9IHRvX2R3X3BjaWVfZnJvbV9lcChlcCk7DQo+ID4gKwlzdHJ1Y3QgbHNfcGNp
ZV9lcCAqcGNpZSA9IHRvX2xzX3BjaWVfZXAocGNpKTsNCj4gPiArCXU4IGhlYWRlcl90eXBlOw0K
PiA+ICsNCj4gPiArCWhlYWRlcl90eXBlID0gaW9yZWFkOChwY2ktPmRiaV9iYXNlICsgUENJX0hF
QURFUl9UWVBFKTsNCj4gPiArDQo+ID4gKwlpZiAoaGVhZGVyX3R5cGUgJiAoMSA8PCA3KSkNCj4g
PiArCQlyZXR1cm4gcGNpZS0+ZHJ2ZGF0YS0+ZnVuY19vZmZzZXQgKiBmdW5jX25vOw0KPiA+ICsJ
ZWxzZQ0KPiA+ICsJCXJldHVybiAwOw0KPiANCj4gSXQgbG9va3MgbGlrZSB0aGVyZSBpc24ndCBh
IFBDSSBkZWZpbmUgZm9yIG11bHRpIGZ1bmN0aW9uLCB0aGUgbmVhcmVzdCBJIGNvdWxkIGZpbmQN
Cj4gd2FzIFBDSV9IRUFERVJfVFlQRV9NVUxUSURFVklDRSBpbiBob3RwbHVnL2libXBocC5oLiBB
IGNvbW1lbnQNCj4gYWJvdmUgdGhlIHRlc3QgbWlnaHQgYmUgaGVscGZ1bCB0byBleHBsYWluIHRo
ZSB0ZXN0Lg0KDQpPSywgSSB3aWxsIGFkZCBhIGNvbW1lbnQgYWJvdmUgdGhpcyBjb2RlLg0KDQo+
IA0KPiBBcyB0aGUgbHNfcGNpZV9lcF9kcnZkYXRhIHN0cnVjdHVyZXMgYXJlIHN0YXRpYywgdGhl
IHVuc2V0IC5mdW5jX29mZnNldCB3aWxsIGJlDQo+IGluaXRpYWxpc2VkIHRvIDAsIHNvIHlvdSBj
b3VsZCBqdXN0IGRyb3AgdGhlIHRlc3QgYWJvdmUuDQoNCkR1ZSB0byB0aGUgZGlmZmVyZW50IFBD
SWUgY29udHJvbGxlciBoYXZlIGRpZmZlcmVudCBwcm9wZXJ0eSwgZS5nLiBQQ0llIGNvbnRyb2xs
ZXIxIHN1cHBvcnQNCm11bHRpcGxlIGZ1bmN0aW9uIGZlYXR1cmUsIGJ1dCBQQ0llIGNvbnRyb2xs
ZXIyIGRvbid0IHN1cHBvcnQgdGhpcyBmZWF0dXJlLCBzbyBJIG5lZWQgdG8gY2hlY2sNCndoaWNo
IGNvbnRyb2xsZXIgc3VwcG9ydCBpdCBhbmQgcmV0dXJuIHRoZSBjb3JyZWN0IG9mZnNldCB2YWx1
ZSwgYnV0IGVhY2ggYm9hcmQgb25seSBoYXZlIG9uZQ0KbHNfcGNpZV9lcF9kcnZkYXRhLCBeX14u
DQoNCj4gDQo+IEhvd2V2ZXIgc29tZXRoaW5nIHRvIHRoZSBlZmZlY3Qgb2YgdGhlIGZvbGxvd2lu
ZyBtYXkgaGVscCBzcG90DQo+IG1pc2NvbmZpZ3VyYXRpb246DQo+IA0KPiBXQVJOX09OKGZ1bmNf
bm8gJiYgIXBjaWUtPmRydmRhdGEtPmZ1bmNfb2Zmc2V0KTsgcmV0dXJuDQo+IHBjaWUtPmRydmRh
dGEtPmZ1bmNfb2Zmc2V0ICogZnVuY19ubzsNCj4gDQo+IFRoZSBXQVJOIGlzIHByb2JhYmx5IHF1
aXRlIHVzZWZ1bCBhcyBpZiB5b3UgYXJlIGF0dGVtcHRpbmcgdG8gdXNlIG5vbi16ZXJvDQo+IGZ1
bmN0aW9ucyBhbmQgZnVuY19vZmZzZXQgaXNuJ3Qgc2V0IC0gdGhlbiB0aGluZ3MgbWF5IGFwcGVh
ciB0byB3b3JrIG5vcm1hbGx5DQo+IGJ1dCBhY3R1YWxseSB3aWxsIGJyZWFrIGhvcnJpYmx5Lg0K
DQpBcyBkaXNjdXNzaW9uIGJlZm9yZSwgSSB0aGluayB0aGUgZnVuY19vZmZzZXQgc2hvdWxkIG5v
dCBkZXBlbmRzIG9uIHRoZSBmdW5jdGlvbg0KbnVtYmVyLCBldmVuIGlmIG90aGVyIHBsYXRmb3Jt
cyBvZiBOWFAgbWF5IGJlIHVzZSB3cml0ZSByZWdpc3RlcnMgd2F5IHRvIGFjY2VzcyANCnRoZSBk
aWZmZXJlbnQgZnVuY3Rpb24gY29uZmlnIHNwYWNlLiANCg0KSSBoYXZlIGFkZGVkIHRoZSBjb21t
ZW50cyBhYm92ZSB0aGUgY29kZSwgYXMgZm9sbG93LCBkbyB5b3UgaGF2ZSBhbnkgYWR2aWNlPw0K
K3N0YXRpYyB1bnNpZ25lZCBpbnQgbHNfcGNpZV9lcF9mdW5jX2NvbmZfc2VsZWN0KHN0cnVjdCBk
d19wY2llX2VwICplcCwNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHU4IGZ1bmNfbm8pDQorew0KKyAgICAgICBzdHJ1Y3QgZHdfcGNpZSAqcGNpID0gdG9f
ZHdfcGNpZV9mcm9tX2VwKGVwKTsNCisgICAgICAgc3RydWN0IGxzX3BjaWVfZXAgKnBjaWUgPSB0
b19sc19wY2llX2VwKHBjaSk7DQorICAgICAgIHU4IGhlYWRlcl90eXBlOw0KKw0KKyAgICAgICBo
ZWFkZXJfdHlwZSA9IGlvcmVhZDgocGNpLT5kYmlfYmFzZSArIFBDSV9IRUFERVJfVFlQRSk7DQor
DQorICAgICAgIC8qDQorICAgICAgICAqIFJlYWQgdGhlIEhlYWRlciBUeXBlIHJlZ2lzdGVyIG9m
IGNvbmZpZyBzcGFjZSB0byBjaGVjaw0KKyAgICAgICAgKiB3aGV0aGVyIHRoaXMgUENJIGRldmlj
ZSBzdXBwb3J0IHRoZSBtdWx0aXBsZSBmdW5jdGlvbi4NCisgICAgICAgICovDQorICAgICAgIGlm
IChoZWFkZXJfdHlwZSAmICgxIDw8IDcpKQ0KKyAgICAgICAgICAgICAgIHJldHVybiBwY2llLT5k
cnZkYXRhLT5mdW5jX29mZnNldCAqIGZ1bmNfbm87DQorDQorICAgICAgIHJldHVybiAwOw0KK30N
Cg0KVGhhbmtzIGEgbG90IGZvciB5b3VyIGRldGFpbCBjb21tZW50cy4NCg0KPiANCj4gVGhhbmtz
LA0KPiANCj4gQW5kcmV3IE11cnJheQ0KPiANCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGNv
bnN0IHN0cnVjdCBkd19wY2llX2VwX29wcyBsc19wY2llX2VwX29wcyA9IHsNCj4gPiAgCS5lcF9p
bml0ID0gbHNfcGNpZV9lcF9pbml0LA0KPiA+ICAJLnJhaXNlX2lycSA9IGxzX3BjaWVfZXBfcmFp
c2VfaXJxLA0KPiA+ICAJLmdldF9mZWF0dXJlcyA9IGxzX3BjaWVfZXBfZ2V0X2ZlYXR1cmVzLA0K
PiA+ICsJLmZ1bmNfY29uZl9zZWxlY3QgPSBsc19wY2llX2VwX2Z1bmNfY29uZl9zZWxlY3QsIH07
DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGxzX3BjaWVfZXBfZHJ2ZGF0YSBsczFf
ZXBfZHJ2ZGF0YSA9IHsNCj4gPiArCS5vcHMgPSAmbHNfcGNpZV9lcF9vcHMsDQo+ID4gKwkuZHdf
cGNpZV9vcHMgPSAmZHdfbHNfcGNpZV9lcF9vcHMsDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0
aWMgY29uc3Qgc3RydWN0IGxzX3BjaWVfZXBfZHJ2ZGF0YSBsczJfZXBfZHJ2ZGF0YSA9IHsNCj4g
PiArCS5mdW5jX29mZnNldCA9IDB4MjAwMDAsDQo+ID4gKwkub3BzID0gJmxzX3BjaWVfZXBfb3Bz
LA0KPiA+ICsJLmR3X3BjaWVfb3BzID0gJmR3X2xzX3BjaWVfZXBfb3BzLA0KPiA+ICt9Ow0KPiA+
ICsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbHNfcGNpZV9lcF9vZl9t
YXRjaFtdID0gew0KPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJmc2wsbHMxMDQ2YS1wY2llLWVwIiwg
LmRhdGEgPSAmbHMxX2VwX2RydmRhdGEgfSwNCj4gPiArCXsgLmNvbXBhdGlibGUgPSAiZnNsLGxz
MTA4OGEtcGNpZS1lcCIsIC5kYXRhID0gJmxzMl9lcF9kcnZkYXRhIH0sDQo+ID4gKwl7IC5jb21w
YXRpYmxlID0gImZzbCxsczIwODhhLXBjaWUtZXAiLCAuZGF0YSA9ICZsczJfZXBfZHJ2ZGF0YSB9
LA0KPiA+ICsJeyB9LA0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0YXRpYyBpbnQgX19pbml0IGxzX2Fk
ZF9wY2llX2VwKHN0cnVjdCBsc19wY2llX2VwICpwY2llLCBAQCAtOTgsNw0KPiA+ICsxMzQsNyBA
QCBzdGF0aWMgaW50IF9faW5pdCBsc19hZGRfcGNpZV9lcChzdHJ1Y3QgbHNfcGNpZV9lcCAqcGNp
ZSwNCj4gPiAgCWludCByZXQ7DQo+ID4NCj4gPiAgCWVwID0gJnBjaS0+ZXA7DQo+ID4gLQllcC0+
b3BzID0gJnBjaWVfZXBfb3BzOw0KPiA+ICsJZXAtPm9wcyA9IHBjaWUtPmRydmRhdGEtPm9wczsN
Cj4gPg0KPiA+ICAJcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JF
U09VUkNFX01FTSwNCj4gImFkZHJfc3BhY2UiKTsNCj4gPiAgCWlmICghcmVzKQ0KPiA+IEBAIC0x
MzcsMTQgKzE3MywxMSBAQCBzdGF0aWMgaW50IF9faW5pdCBsc19wY2llX2VwX3Byb2JlKHN0cnVj
dA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gIAlpZiAoIWxzX2VwYykNCj4gPiAgCQly
ZXR1cm4gLUVOT01FTTsNCj4gPg0KPiA+IC0JZGJpX2Jhc2UgPSBwbGF0Zm9ybV9nZXRfcmVzb3Vy
Y2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVNLA0KPiAicmVncyIpOw0KPiA+IC0JcGNpLT5k
YmlfYmFzZSA9IGRldm1fcGNpX3JlbWFwX2NmZ19yZXNvdXJjZShkZXYsIGRiaV9iYXNlKTsNCj4g
PiAtCWlmIChJU19FUlIocGNpLT5kYmlfYmFzZSkpDQo+ID4gLQkJcmV0dXJuIFBUUl9FUlIocGNp
LT5kYmlfYmFzZSk7DQo+ID4gKwlwY2llLT5kcnZkYXRhID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9k
YXRhKGRldik7DQo+ID4NCj4gPiAtCXBjaS0+ZGJpX2Jhc2UyID0gcGNpLT5kYmlfYmFzZSArIFBD
SUVfREJJMl9PRkZTRVQ7DQo+ID4gIAlwY2ktPmRldiA9IGRldjsNCj4gPiAtCXBjaS0+b3BzID0g
JmxzX3BjaWVfZXBfb3BzOw0KPiA+ICsJcGNpLT5vcHMgPSBwY2llLT5kcnZkYXRhLT5kd19wY2ll
X29wczsNCj4gPiArDQo+ID4gIAlwY2llLT5wY2kgPSBwY2k7DQo+ID4NCj4gPiAgCWxzX2VwYy0+
bGlua3VwX25vdGlmaWVyID0gZmFsc2UsDQo+ID4gQEAgLTE1Miw2ICsxODUsMTMgQEAgc3RhdGlj
IGludCBfX2luaXQgbHNfcGNpZV9lcF9wcm9iZShzdHJ1Y3QNCj4gPiBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpDQo+ID4NCj4gPiAgCXBjaWUtPmxzX2VwYyA9IGxzX2VwYzsNCj4gPg0KPiA+ICsJZGJp
X2Jhc2UgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsIElPUkVTT1VSQ0VfTUVN
LA0KPiAicmVncyIpOw0KPiA+ICsJcGNpLT5kYmlfYmFzZSA9IGRldm1fcGNpX3JlbWFwX2NmZ19y
ZXNvdXJjZShkZXYsIGRiaV9iYXNlKTsNCj4gPiArCWlmIChJU19FUlIocGNpLT5kYmlfYmFzZSkp
DQo+ID4gKwkJcmV0dXJuIFBUUl9FUlIocGNpLT5kYmlfYmFzZSk7DQo+ID4gKw0KPiA+ICsJcGNp
LT5kYmlfYmFzZTIgPSBwY2ktPmRiaV9iYXNlICsgUENJRV9EQkkyX09GRlNFVDsNCj4gPiArDQo+
ID4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwY2llKTsNCj4gPg0KPiA+ICAJcmV0ID0g
bHNfYWRkX3BjaWVfZXAocGNpZSwgcGRldik7DQo+ID4gLS0NCj4gPiAyLjkuNQ0KPiA+DQo=
