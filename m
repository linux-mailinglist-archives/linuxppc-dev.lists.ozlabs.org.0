Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE93F1270
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 10:36:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477LyZ2PtCzF5Pb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 20:36:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.2.67; helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="D9WQBq35"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20067.outbound.protection.outlook.com [40.107.2.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477LvJ5GQXzF4FX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 20:33:44 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JDf0CuAwCiiJSFMdYacAUY1i4I40AWd9o4od3UXQFQ1O8k1W75W/62r2Sf5TLSQrnS5IEm779clLX9qUopZlnJF07nSGUOr9SfrZhkx9mP1TV1i7azt7k55z14bd25Jlviakm3MTlWbdQ8QvXp9k6viteadktPkBgOC1Ryf+D3W088Xzvez3xQBEdEGxdMqJ+J68N78Y6RDfn3h5CkpOtcir96l+AbOUB7iy7D5bigUEI8UwQo/4SZp38bx+QgqJ6A9kYKFtNra9bvEw4nJGgBoWClFlPxkS7DV6scf5j/BqVJBBWrLbZNUtpSThdfxkt5JzO7Yz7U2tJfnP+7xi0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYA4Mmo/kIpbj24XnxIX0rubTxkRsR3ojJNUHua/q+Q=;
 b=J3YUFWmfkiUuVS1GYFGAKTOP6FmQHXCsnYFv7YsMW8jNZlU4ZKxNkwbANbscT0lCk9/ck/IxEgLbA5XtYRIfO+WGvwdTm6NEPPpK5IPI5wvcg8wq5B/rGpyeZWvyOJMwd/v9kjASUxb0ucR5BKN8MJ8ZkjGcBwqw+S3cTdlU4O/q9IX5NoOWBoacK/CXTuVdGcvwlleAVHqZo6FPWf/RytyNIow0MVj1Sc/I6QDQ6FtN7oVTuYR1dDtgGovMa9MVTuRLvXyKLCgcJTTSxXSxr5crrJoy73nYlgQZl3m4/CeYVvtYzJn6IfO7Z470JKEMm8Xnf3m4jym/9+Q53FBcSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYA4Mmo/kIpbj24XnxIX0rubTxkRsR3ojJNUHua/q+Q=;
 b=D9WQBq35FGSwpwuJ3oplStRKTsGjKqOLQ8qkmDKCZ/QhyvGhhtZzMH+Rxp4UE9PSry7I+3HMujDZgUMLx/6pGc94GxL3kjSd7piOpGz82EasicOnAQgQ7Bz0pIIwdbg37NtXbOcexPjPey1cJuZKrIxw+vc2kvdbRuWOquFGanA=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Wed, 6 Nov 2019 09:33:37 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::8ce8:9eaf:3916:4bc9]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::8ce8:9eaf:3916:4bc9%6]) with mapi id 15.20.2408.025; Wed, 6 Nov 2019
 09:33:37 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Kishon Vijay Abraham I
 <kishon@ti.com>
Subject: RE: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the doorbell
 way
Thread-Topic: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the
 doorbell way
Thread-Index: AQHVWN1daYnbY17h2k2o9Z3qkBZ1lKcIw+QAgACoZvCABZeogIACm0MAgGtaroCAAV1ZQA==
Date: Wed, 6 Nov 2019 09:33:37 +0000
Message-ID: <AM5PR04MB329993172A352E46D325D66BF5790@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-7-xiaowei.bao@nxp.com>
 <20190823135816.GH14582@e119886-lin.cambridge.arm.com>
 <AM5PR04MB3299E50BA5D7579D41B8B4F9F5A70@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <20190827132504.GL14582@e119886-lin.cambridge.arm.com>
 <e64a484c-7cf5-5f65-400c-47128ab45e52@ti.com>
 <20191105123739.GB26960@e121166-lin.cambridge.arm.com>
In-Reply-To: <20191105123739.GB26960@e121166-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: aa121ff6-301c-48e9-82c7-08d7629c66c9
x-ms-traffictypediagnostic: AM5PR04MB3299:|AM5PR04MB3299:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB329985A67026616C48D5BAC1F5790@AM5PR04MB3299.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(346002)(376002)(136003)(39860400002)(366004)(189003)(199004)(13464003)(86362001)(99286004)(7696005)(102836004)(316002)(446003)(55016002)(71190400001)(71200400001)(486006)(53546011)(5660300002)(6506007)(305945005)(44832011)(33656002)(74316002)(76176011)(2906002)(7736002)(66066001)(476003)(54906003)(7416002)(229853002)(52536014)(26005)(25786009)(14444005)(11346002)(478600001)(256004)(6436002)(81166006)(14454004)(8676002)(81156014)(6116002)(3846002)(66446008)(110136005)(9686003)(8936002)(186003)(4326008)(6246003)(66946007)(64756008)(66556008)(76116006)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3299;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: on3dLkXOE3Y8YQkbNmk+IeyUmfi29w+BlrUOcfFX5hs8BnbaSDTh6a6HpJCdofVt9OOper2B/8nbBZ5k/cH0Ssp5rXtK/Rxp3LcbceJQV5BF6zt6RxM6waH6FhiKJGCXD31AJkbczSQ7XVKws81HrCj4rKtiSqA/D4yi4dJlnERjwiAdOQTeEN3mlxa4gpZ1ZfVGcJ0tU0FddOxdB4lRz16JpVj450hDyvB1MAIgZ6Hi2Ip/m6nelebID29JmTHQZPT8w1rI2iDyhz1hrJO2swkwbUCIDiSEQn2gX6M+AZ4U1IW8n2V8SRcnuWvSam+wibBXDuL9rdrDTfA/SSsdhbf9I3dXFIpgo7NqwrTGr/ubtVBTKX047ljg3BTrYh5L7hmObPcFKnzDeyCBQoOWzRhjCWAIVYYyOgpGxy4HUoOdUC4mYjfWyyw2cHfw5E60
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa121ff6-301c-48e9-82c7-08d7629c66c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 09:33:37.4087 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TCndZOPKuZLsXX1BmcLfiVPN39OealellLk534J2HfacgEzrVc+UqFpGu1TOYxQItgC//49mffp9KHcpedxcdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3299
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
 "arnd@arndb.de" <arnd@arndb.de>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 Andrew Murray <andrew.murray@arm.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTG9yZW56byBQaWVyYWxp
c2kgPGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20+DQo+IFNlbnQ6IDIwMTnlubQxMeaciDXml6Ug
MjA6MzgNCj4gVG86IEtpc2hvbiBWaWpheSBBYnJhaGFtIEkgPGtpc2hvbkB0aS5jb20+DQo+IENj
OiBBbmRyZXcgTXVycmF5IDxhbmRyZXcubXVycmF5QGFybS5jb20+OyBYaWFvd2VpIEJhbw0KPiA8
eGlhb3dlaS5iYW9AbnhwLmNvbT47IGd1c3Rhdm8ucGltZW50ZWxAc3lub3BzeXMuY29tOw0KPiBi
aGVsZ2Fhc0Bnb29nbGUuY29tOyByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0u
Y29tOw0KPiBzaGF3bmd1b0BrZXJuZWwub3JnOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47
DQo+IGxvcmVuem8ucGllcmFsaXNpQGFybS5jbzsgYXJuZEBhcm5kYi5kZTsgZ3JlZ2toQGxpbnV4
Zm91bmRhdGlvbi5vcmc7IE0uaC4NCj4gTGlhbiA8bWluZ2h1YW4ubGlhbkBueHAuY29tPjsgTWlu
Z2thaSBIdSA8bWluZ2thaS5odUBueHAuY29tPjsgUm95DQo+IFphbmcgPHJveS56YW5nQG54cC5j
b20+OyBqaW5nb29oYW4xQGdtYWlsLmNvbTsNCj4gbGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsg
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXhwcGMtZGV2
QGxpc3RzLm96bGFicy5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwNy8xMF0gUENJOiBs
YXllcnNjYXBlOiBNb2RpZnkgdGhlIE1TSVggdG8gdGhlDQo+IGRvb3JiZWxsIHdheQ0KPiANCj4g
T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMTA6NDM6MThBTSArMDUzMCwgS2lzaG9uIFZpamF5IEFi
cmFoYW0gSSB3cm90ZToNCj4gPiBHdXN0YXZvLA0KPiA+DQo+ID4gT24gMjcvMDgvMTkgNjo1NSBQ
TSwgQW5kcmV3IE11cnJheSB3cm90ZToNCj4gPiA+IE9uIFNhdCwgQXVnIDI0LCAyMDE5IGF0IDEy
OjA4OjQwQU0gKzAwMDAsIFhpYW93ZWkgQmFvIHdyb3RlOg0KPiA+ID4+DQo+ID4gPj4NCj4gPiA+
Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+Pj4gRnJvbTogQW5kcmV3IE11cnJh
eSA8YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiA+ID4+PiBTZW50OiAyMDE55bm0OOaciDIz5pel
IDIxOjU4DQo+ID4gPj4+IFRvOiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4g
PiA+Pj4gQ2M6IGJoZWxnYWFzQGdvb2dsZS5jb207IHJvYmgrZHRAa2VybmVsLm9yZzsNCj4gbWFy
ay5ydXRsYW5kQGFybS5jb207DQo+ID4gPj4+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IExlbyBMaSA8
bGVveWFuZy5saUBueHAuY29tPjsga2lzaG9uQHRpLmNvbTsNCj4gPiA+Pj4gbG9yZW56by5waWVy
YWxpc2lAYXJtLmNvOyBhcm5kQGFybmRiLmRlOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsN
Cj4gTS5oLg0KPiA+ID4+PiBMaWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+OyBNaW5na2FpIEh1
IDxtaW5na2FpLmh1QG54cC5jb20+Ow0KPiBSb3kNCj4gPiA+Pj4gWmFuZyA8cm95LnphbmdAbnhw
LmNvbT47IGppbmdvb2hhbjFAZ21haWwuY29tOw0KPiA+ID4+PiBndXN0YXZvLnBpbWVudGVsQHN5
bm9wc3lzLmNvbTsgbGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+Pj4gZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPj4+
IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gPiA+Pj4gbGludXhwcGMt
ZGV2QGxpc3RzLm96bGFicy5vcmcNCj4gPiA+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAwNy8x
MF0gUENJOiBsYXllcnNjYXBlOiBNb2RpZnkgdGhlIE1TSVggdG8NCj4gPiA+Pj4gdGhlIGRvb3Ji
ZWxsIHdheQ0KPiA+ID4+Pg0KPiA+ID4+PiBPbiBUaHUsIEF1ZyAyMiwgMjAxOSBhdCAwNzoyMjoz
OVBNICswODAwLCBYaWFvd2VpIEJhbyB3cm90ZToNCj4gPiA+Pj4+IFRoZSBsYXllcnNjYXBlIHBs
YXRmb3JtIHVzZSB0aGUgZG9vcmJlbGwgd2F5IHRvIHRyaWdnZXIgTVNJWA0KPiA+ID4+Pj4gaW50
ZXJydXB0IGluIEVQIG1vZGUuDQo+ID4gPj4+Pg0KPiA+ID4+Pg0KPiA+ID4+PiBJIGhhdmUgbm8g
cHJvYmxlbXMgd2l0aCB0aGlzIHBhdGNoLCBob3dldmVyLi4uDQo+ID4gPj4+DQo+ID4gPj4+IEFy
ZSB5b3UgYWJsZSB0byBhZGQgdG8gdGhpcyBtZXNzYWdlIGEgcmVhc29uIGZvciB3aHkgeW91IGFy
ZQ0KPiA+ID4+PiBtYWtpbmcgdGhpcyBjaGFuZ2U/IERpZCBkd19wY2llX2VwX3JhaXNlX21zaXhf
aXJxIG5vdCB3b3JrIHdoZW4NCj4gPiA+Pj4gZnVuY19ubyAhPSAwPyBPciBkaWQgaXQgd29yayB5
ZXQgZHdfcGNpZV9lcF9yYWlzZV9tc2l4X2lycV9kb29yYmVsbCBpcw0KPiBtb3JlIGVmZmljaWVu
dD8NCj4gPiA+Pg0KPiA+ID4+IFRoZSBmYWN0IGlzIHRoYXQsIHRoaXMgZHJpdmVyIGlzIHZlcmlm
aWVkIGluIGxzMTA0NmEgcGxhdGZvcm0gb2YNCj4gPiA+PiBOWFAgYmVmb3JlLCBhbmQgbHMxMDQ2
YSBkb24ndCBzdXBwb3J0IE1TSVggZmVhdHVyZSwgc28gSSBzZXQgdGhlDQo+ID4gPj4gbXNpeF9j
YXBhYmxlIG9mIHBjaV9lcGNfZmVhdHVyZXMgc3RydWN0IGlzIGZhbHNlLCBidXQgaW4gb3RoZXIN
Cj4gPiA+PiBwbGF0Zm9ybSwgZS5nLiBsczEwODhhLCBpdCBzdXBwb3J0IHRoZSBNU0lYIGZlYXR1
cmUsIEkgdmVyaWZpZWQgdGhlIE1TSVgNCj4gZmVhdHVyZSBpbiBsczEwODhhLCBpdCBpcyBub3Qg
T0ssIHNvIEkgY2hhbmdlZCB0byBhbm90aGVyIHdheS4gVGhhbmtzLg0KPiA+ID4NCj4gPiA+IFJp
Z2h0LCBzbyB0aGUgZXhpc3RpbmcgcGNpLWxheWVyc2NhcGUtZXAuYyBkcml2ZXIgbmV2ZXIgc3Vw
cG9ydGVkDQo+ID4gPiBNU0lYIHlldCBpdCBlcnJvbmVvdXNseSBoYWQgYSBzd2l0Y2ggY2FzZSBz
dGF0ZW1lbnQgdG8gY2FsbA0KPiA+ID4gZHdfcGNpZV9lcF9yYWlzZV9tc2l4X2lycSB3aGljaCB3
b3VsZCBuZXZlciBnZXQgdXNlZC4NCj4gPiA+DQo+ID4gPiBOb3cgdGhhdCB3ZSdyZSBhZGRpbmcg
YSBwbGF0Zm9ybSB3aXRoIE1TSVggc3VwcG9ydCB0aGUgZXhpc3RpbmcNCj4gPiA+IGR3X3BjaWVf
ZXBfcmFpc2VfbXNpeF9pcnEgZG9lc24ndCB3b3JrIChmb3IgdGhpcyBwbGF0Zm9ybSkgc28gd2Ug
YXJlDQo+ID4gPiBhZGRpbmcgYSBkaWZmZXJlbnQgbWV0aG9kLg0KPiA+DQo+ID4gR3VzdGF2bywg
Y2FuIHlvdSBjb25maXJtIGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnEoKSB3b3JrcyBmb3INCj4g
PiBkZXNpZ253YXJlIGFzIGl0IGRpZG4ndCB3b3JrIGZvciBib3RoIG1lIGFuZCBYaWFvd2VpPw0K
PiANCj4gVGhpcyBxdWVzdGlvbiBuZWVkcyBhbiBhbnN3ZXIuDQoNClRoaXMgcXVlc3Rpb24gaGF2
ZSBhbnN3ZXJlZCBieSBHdXN0YXZvIGluICJbUEFUQ0ggdjMgMDgvMTFdIFBDSTogbGF5ZXJzY2Fw
ZTogDQpNb2RpZnkgdGhlIE1TSVggdG8gdGhlIGRvb3JiZWxsIG1vZGUiLCBwbGVhc2UgcmVmZXIg
dG8gdGhlIGNvbW1lbnRzLCBkdWUgdG8NCmFkZCBhIG5ldyBwYXRjaCBmb3IgdGhpcyBzZXRzIG9m
IHBhdGNoLCB0aGlzIHBhdGNoIG51bWJlciBjaGFuZ2VkIGZyb20gMDcvMTAgb2YgdjINCnRvIDA4
LzExIG9mIHYzLCBzb3JyeSBmb3IgY2F1c2luZyB5b3VyIGNvbmZ1c2UuDQoNCg0KVGhhbmtzIA0K
WGlhb3dlaSAgDQoNCg0KPiANCj4gVGhhbmtzLA0KPiBMb3JlbnpvDQo=
