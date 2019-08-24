Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3019B951
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 02:10:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Fdvf3dPFzDrgN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 10:10:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.14.73; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="GI57Jvri"; 
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140073.outbound.protection.outlook.com [40.107.14.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Fdsb6FJbzDrHp
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 10:08:48 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hDVGL8Hh6fpQ+psCMrZygKc9veNlp2JoplF5yjd4m+ou0q+JIFD/06Ug9NWLvezqx5RZY7T6uKR+3AQ6nZ0ZS7rS0jLKyYW0o9FlIpzYm4L0bTNukpBBBaUQiZ4ZZNaeR9Tp959/pKoqsq9AhZ/4WGAAOTKdijke5i9qnutRKbjIz4Lilk4V1BHBHqKWmwo0FueVBseY7O0IA7rQUauAez60BO5MzcbL0OkNCUf6uFv92MJdyn+M8nJaWIvmPHE/9muKREBsfSw4f+wQVGCqbZC5jcFqBGtNb1KwGDUwmmQ5MGDwBl8ks99l5z5A89dSZQUxmbHWKJV0C9D4ubhvXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dap3kQVTaBTLLvLZPpb+PMLQsyGNS9sDpraZVIRoTNg=;
 b=E93gP029yZr26Me0VB+zB3cQjLseM6zHdu/Uo7WJyJjjqIduewg7rc1q/X1/x6MiYWvbaeW9uV9YA/LB2QDUxfivbZhg4rA9+Z6OnEZjdzUjaeYbIFtpWXFiZfJxdWYE33TzUTg5BoD4aeLZdAdZBsBbjJC24A/63ICHBSTpyWpDvzQXVelz3p8MOUSQEiDHUowR77Y6Hrhn2JMTffApD0oHs4L2Wcc7OWRDoeTLienY05SgqZqGzd2nvV+9y1gzE4JG/4y6Nk7rwCTt5VxNasm0CooPBa9YkwCe73+esdxlzXg8JzGx8uf9JNdpx9yZqVOfkrYj2ik9LGJkVTOUJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dap3kQVTaBTLLvLZPpb+PMLQsyGNS9sDpraZVIRoTNg=;
 b=GI57JvriMw927NzkkwPEzK7ND01A0ai0POsML5QYVK74uxEcNlR5fxhvHFNwvJE7i8We026t2Uh6GBipSpdPyr4LdnkbZRl0J5o+H9QL2rLyd1yAN87UR5VDw3L8RWwpD7VRAuwWGmC0Or1+KsspXCI6gHbuw2rD/qR0fT5ho0c=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3204.eurprd04.prod.outlook.com (10.167.169.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Sat, 24 Aug 2019 00:08:40 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043%7]) with mapi id 15.20.2178.020; Sat, 24 Aug 2019
 00:08:40 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the doorbell
 way
Thread-Topic: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the
 doorbell way
Thread-Index: AQHVWN1daYnbY17h2k2o9Z3qkBZ1lKcIw+QAgACoZvA=
Date: Sat, 24 Aug 2019 00:08:40 +0000
Message-ID: <AM5PR04MB3299E50BA5D7579D41B8B4F9F5A70@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-7-xiaowei.bao@nxp.com>
 <20190823135816.GH14582@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190823135816.GH14582@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2107153e-49b5-4d3c-b4df-08d728273832
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM5PR04MB3204; 
x-ms-traffictypediagnostic: AM5PR04MB3204:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB32048EBC7128BEC5EC97E920F5A70@AM5PR04MB3204.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0139052FDB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(396003)(346002)(376002)(189003)(199004)(13464003)(256004)(81166006)(476003)(8676002)(6246003)(3846002)(2906002)(6116002)(53936002)(8936002)(14444005)(76116006)(66946007)(44832011)(66476007)(7736002)(5660300002)(64756008)(66556008)(25786009)(4326008)(486006)(66446008)(86362001)(99286004)(55016002)(9686003)(7696005)(14454004)(76176011)(52536014)(81156014)(229853002)(54906003)(316002)(6916009)(478600001)(305945005)(74316002)(6506007)(7416002)(53546011)(26005)(186003)(102836004)(6436002)(66066001)(33656002)(11346002)(446003)(71200400001)(71190400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3204;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nWadkxb4oB6Tl9+NjWOFztPHDK/FwjWFH2D58LKYfCS9SkEo0Xxg0WlqWQbI+cyoq1rC2dqzPiG6/qy0fSzPiXrPSegrydTsHPKxxpVzWzPvLhOrSQuDUqVKWestfW/Bx82kvVFkBhWMhLg+zI5oAwKYZMG/Dgv7Bdo3n9Nr3rKx6G4A0M3bU0idS+qFp9HKhZ/QXOdKYWu+jXQkUsAH3k+PzrFjvWzJeqUSXNNJiSoInC7o4z4FTqYwM2gOJRY20U86zb4v2We60Slcfq8eFvWnr5hctIBzBqPMM3SjRJXdAAvRZoi4RBEWCju8o7af/D0Y+gOIJQ+8+bcijetTUPYaQaGeWLMvcqr5zP0ijPksVYMkM8fBToqnPlV/SXSLfhH+ZXJaPokcvU/ZBiE6jpNeNLeq459vdsqwjxCGcXc=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2107153e-49b5-4d3c-b4df-08d728273832
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2019 00:08:40.6078 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tOKlaXqrRvKp3EqxldhfNTitBR2pPY3mEdvuwPVyJHfTez4xuBDvlu7oAGoWmOZDJN+UjO2Tvhk32kNzx1mXjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3204
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
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE5xOo41MIyM8jVIDIxOjU4DQo+IFRv
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
amVjdDogUmU6IFtQQVRDSCB2MiAwNy8xMF0gUENJOiBsYXllcnNjYXBlOiBNb2RpZnkgdGhlIE1T
SVggdG8gdGhlDQo+IGRvb3JiZWxsIHdheQ0KPiANCj4gT24gVGh1LCBBdWcgMjIsIDIwMTkgYXQg
MDc6MjI6MzlQTSArMDgwMCwgWGlhb3dlaSBCYW8gd3JvdGU6DQo+ID4gVGhlIGxheWVyc2NhcGUg
cGxhdGZvcm0gdXNlIHRoZSBkb29yYmVsbCB3YXkgdG8gdHJpZ2dlciBNU0lYIGludGVycnVwdA0K
PiA+IGluIEVQIG1vZGUuDQo+ID4NCj4gDQo+IEkgaGF2ZSBubyBwcm9ibGVtcyB3aXRoIHRoaXMg
cGF0Y2gsIGhvd2V2ZXIuLi4NCj4gDQo+IEFyZSB5b3UgYWJsZSB0byBhZGQgdG8gdGhpcyBtZXNz
YWdlIGEgcmVhc29uIGZvciB3aHkgeW91IGFyZSBtYWtpbmcgdGhpcw0KPiBjaGFuZ2U/IERpZCBk
d19wY2llX2VwX3JhaXNlX21zaXhfaXJxIG5vdCB3b3JrIHdoZW4gZnVuY19ubyAhPSAwPyBPciBk
aWQNCj4gaXQgd29yayB5ZXQgZHdfcGNpZV9lcF9yYWlzZV9tc2l4X2lycV9kb29yYmVsbCBpcyBt
b3JlIGVmZmljaWVudD8NCg0KVGhlIGZhY3QgaXMgdGhhdCwgdGhpcyBkcml2ZXIgaXMgdmVyaWZp
ZWQgaW4gbHMxMDQ2YSBwbGF0Zm9ybSBvZiBOWFAgYmVmb3JlLCBhbmQgbHMxMDQ2YSBkb24ndA0K
c3VwcG9ydCBNU0lYIGZlYXR1cmUsIHNvIEkgc2V0IHRoZSBtc2l4X2NhcGFibGUgb2YgcGNpX2Vw
Y19mZWF0dXJlcyBzdHJ1Y3QgaXMgZmFsc2UsDQpidXQgaW4gb3RoZXIgcGxhdGZvcm0sIGUuZy4g
bHMxMDg4YSwgaXQgc3VwcG9ydCB0aGUgTVNJWCBmZWF0dXJlLCBJIHZlcmlmaWVkIHRoZSBNU0lY
DQpmZWF0dXJlIGluIGxzMTA4OGEsIGl0IGlzIG5vdCBPSywgc28gSSBjaGFuZ2VkIHRvIGFub3Ro
ZXIgd2F5LiBUaGFua3MuDQoNCj4gDQo+IFRoYW5rcywNCj4gDQo+IEFuZHJldyBNdXJyYXkNCj4g
DQo+ID4gU2lnbmVkLW9mZi1ieTogWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54cC5jb20+DQo+
ID4gLS0tDQo+ID4gdjI6DQo+ID4gIC0gTm8gY2hhbmdlLg0KPiA+DQo+ID4gIGRyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMgfCAzICsrLQ0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+
IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+IGlu
ZGV4IDg0NjFmNjIuLjdjYTVmZTggMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMNCj4gPiBAQCAtNzQsNyArNzQsOCBAQCBzdGF0
aWMgaW50IGxzX3BjaWVfZXBfcmFpc2VfaXJxKHN0cnVjdCBkd19wY2llX2VwICplcCwNCj4gdTgg
ZnVuY19ubywNCj4gPiAgCWNhc2UgUENJX0VQQ19JUlFfTVNJOg0KPiA+ICAJCXJldHVybiBkd19w
Y2llX2VwX3JhaXNlX21zaV9pcnEoZXAsIGZ1bmNfbm8sIGludGVycnVwdF9udW0pOw0KPiA+ICAJ
Y2FzZSBQQ0lfRVBDX0lSUV9NU0lYOg0KPiA+IC0JCXJldHVybiBkd19wY2llX2VwX3JhaXNlX21z
aXhfaXJxKGVwLCBmdW5jX25vLCBpbnRlcnJ1cHRfbnVtKTsNCj4gPiArCQlyZXR1cm4gZHdfcGNp
ZV9lcF9yYWlzZV9tc2l4X2lycV9kb29yYmVsbChlcCwgZnVuY19ubywNCj4gPiArCQkJCQkJCSAg
aW50ZXJydXB0X251bSk7DQo+ID4gIAlkZWZhdWx0Og0KPiA+ICAJCWRldl9lcnIocGNpLT5kZXYs
ICJVTktOT1dOIElSUSB0eXBlXG4iKTsNCj4gPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiAtLQ0K
PiA+IDIuOS41DQo+ID4NCg==
