Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F7FF1365
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 11:09:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477Mhn5nyCzF5lp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 21:09:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.81; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="rjANmQlB"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80081.outbound.protection.outlook.com [40.107.8.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477MYy040pzF1nR
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 21:03:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsCQsNsGBDI6GUTJI3f2dLO+Upqbl2Rqbr4GS5ujHvAAD3I+0Cb1VtOMSpFJyWu+78cLdwdOrGTXmT1Ej8cmEmhNMVZqCD/y935JqC0C4/VJD82JfDXuBi3z8zoJxB06vc+1Vnf+HfuU3HedLoXnc0Tw1csV2NBys1zHbvNn4C6eTOLTIgD9MYGcXtFoDfKzS5Iqp7UPDvZNLu57AQ2iagXFqLCMgcvkvNwQ3rQXwKIFZfEcyky7wnPt6E4VtYLQsFw3+E4ejTH8dWMqTL7V5yMrEHP2MNmABl6wk3QYnlbvnUx97PdgPXmpy7MRifkvaWWpwfZaBru649yJiKI8Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAoT+wxhSRm0Hgk3dwWx3cTQuy4Xk+IB7waESxySWm8=;
 b=hK/d4EnDU/M6+LM39OAKPwwl3IYGQjOE1l/jeX25c/5cEhoCispwZaF679JXt4/K11RLN1Cze+mKP8gS9uJO01D/9q+wtIqaB4fVUGfNI41BPx3IK39iFUh+Ae/7yqxPxUY68NAzdueUSwxrGZcc4KxRKQ25FkPy8dcPeB3VSg1xy6rzZ6/FMoNdAtsybdZvY9Ts8FHelGmhkTNvddOtMypjbUgMwyiVSMX1LbV+2ImdDRKugxyei88cBxzZ1NvDTsytqKTPK7sx+4AhIBDaCkQ3NzoyURghPSEt4IWpUHGVkD38tnSjZNwhCCkchZWO/Y/dSkBylU0Jb+DAmlmuQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAoT+wxhSRm0Hgk3dwWx3cTQuy4Xk+IB7waESxySWm8=;
 b=rjANmQlBRavWR5AppaOxfd0vDQOO1gNOyd0AwHeIg3rU+lhPkWF8jx37x9eVP8+/NnVumAaZrvpA613XVYkrGnFGVLGr1ejAI266IwpcXfIAXLnnNDBGNcpeL5iPVck4NXv5AIKckXX3/y4/pxsNHw4y6z+wi+cLLz+TeR/J4i4=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3073.eurprd04.prod.outlook.com (10.167.171.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Wed, 6 Nov 2019 10:03:40 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::8ce8:9eaf:3916:4bc9]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::8ce8:9eaf:3916:4bc9%6]) with mapi id 15.20.2408.025; Wed, 6 Nov 2019
 10:03:40 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the doorbell
 way
Thread-Topic: [PATCH v2 07/10] PCI: layerscape: Modify the MSIX to the
 doorbell way
Thread-Index: AQHVWN1daYnbY17h2k2o9Z3qkBZ1lKcIw+QAgACoZvCABZeogIACm0MAgGy7coCAAASG0A==
Date: Wed, 6 Nov 2019 10:03:40 +0000
Message-ID: <AM5PR04MB32992FD517575C26685845ADF5790@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-7-xiaowei.bao@nxp.com>
 <20190823135816.GH14582@e119886-lin.cambridge.arm.com>
 <AM5PR04MB3299E50BA5D7579D41B8B4F9F5A70@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <20190827132504.GL14582@e119886-lin.cambridge.arm.com>
 <e64a484c-7cf5-5f65-400c-47128ab45e52@ti.com>
 <DM6PR12MB40107A9B97A8DAF32A4C651EDA790@DM6PR12MB4010.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB40107A9B97A8DAF32A4C651EDA790@DM6PR12MB4010.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: aee5ad05-330d-4eeb-41d1-08d762a0997b
x-ms-traffictypediagnostic: AM5PR04MB3073:|AM5PR04MB3073:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3073A7FF8D06159573C955D6F5790@AM5PR04MB3073.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(396003)(376002)(39860400002)(346002)(189003)(199004)(13464003)(6116002)(71200400001)(76176011)(71190400001)(7416002)(102836004)(33656002)(86362001)(486006)(446003)(11346002)(6436002)(74316002)(305945005)(53546011)(66066001)(14454004)(7736002)(8676002)(478600001)(229853002)(316002)(476003)(44832011)(3846002)(81156014)(81166006)(110136005)(99286004)(54906003)(25786009)(6506007)(9686003)(55016002)(6246003)(7696005)(186003)(26005)(66556008)(66946007)(52536014)(2906002)(66476007)(76116006)(5660300002)(64756008)(66446008)(8936002)(256004)(14444005)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3073;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4jqkvF67ynA/OOXjI8fdrmnVdmKscUlVcHmGNDFUMQntE3lUhHXpNTF/RM4QCrrw+3LFsO0HS11wtD9COL8K1TVaviua0YfdgvKQHmYDE8qeYj4f+fn02nYkV160MAYbx9D9px9HbgnNL3TJ6yLZKPdo8qYAjTOeyhpAW2Apj4uLDmKRVSNRJWKsHvR3xdN2XOYU+cWMPgaAom80LBpiQka6hjf+yDcM+dW0mjcubzCyCkz8cQZ7emsxrIfKZeXyE35SGF4LBiGgVIkEs8AWz+/9cxcl5oewHsZF/CHml2F4MA+NM8fhqEYyaparkcFt3X+9WI4VwFjRwLNjDuFR8euyG/RF2WDFphatgkhW7vgAZh1+J9KF7SPoGowv/X31eSruFE2ZN58uoA+SpFm85/DRpn9PPD5iWVU5j8sMlKu94WuKaOCAi1VaR4tERr40
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee5ad05-330d-4eeb-41d1-08d762a0997b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 10:03:40.3267 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e8PdAgcgpGHuAcNbw2s5vQYR6O54/UiNlzTw66AioMcpllYkVl/usp88sgfM6V8G8C6dW2QeyTY5CHFfqTN7PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3073
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
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VzdGF2byBQaW1lbnRl
bCA8R3VzdGF2by5QaW1lbnRlbEBzeW5vcHN5cy5jb20+DQo+IFNlbnQ6IDIwMTnlubQxMeaciDbm
l6UgMTc6NDANCj4gVG86IEtpc2hvbiBWaWpheSBBYnJhaGFtIEkgPGtpc2hvbkB0aS5jb20+OyBB
bmRyZXcgTXVycmF5DQo+IDxhbmRyZXcubXVycmF5QGFybS5jb20+OyBYaWFvd2VpIEJhbyA8eGlh
b3dlaS5iYW9AbnhwLmNvbT47DQo+IGd1c3Rhdm8ucGltZW50ZWxAc3lub3BzeXMuY29tDQo+IENj
OiBiaGVsZ2Fhc0Bnb29nbGUuY29tOyByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBh
cm0uY29tOw0KPiBzaGF3bmd1b0BrZXJuZWwub3JnOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNv
bT47DQo+IGxvcmVuem8ucGllcmFsaXNpQGFybS5jbzsgYXJuZEBhcm5kYi5kZTsgZ3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc7IE0uaC4NCj4gTGlhbiA8bWluZ2h1YW4ubGlhbkBueHAuY29tPjsg
TWluZ2thaSBIdSA8bWluZ2thaS5odUBueHAuY29tPjsgUm95DQo+IFphbmcgPHJveS56YW5nQG54
cC5jb20+OyBqaW5nb29oYW4xQGdtYWlsLmNvbTsNCj4gbGludXgtcGNpQHZnZXIua2VybmVsLm9y
ZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXhwcGMt
ZGV2QGxpc3RzLm96bGFicy5vcmcNCj4gU3ViamVjdDogUkU6IFtQQVRDSCB2MiAwNy8xMF0gUENJ
OiBsYXllcnNjYXBlOiBNb2RpZnkgdGhlIE1TSVggdG8gdGhlDQo+IGRvb3JiZWxsIHdheQ0KPiAN
Cj4gT24gVGh1LCBBdWcgMjksIDIwMTkgYXQgNjoxMzoxOCwgS2lzaG9uIFZpamF5IEFicmFoYW0g
SSA8a2lzaG9uQHRpLmNvbT4NCj4gd3JvdGU6DQo+IA0KPiBIaSwgdGhpcyBlbWFpbCBzbGlwIGF3
YXkgZnJvbSBteSBhdHRlbnRpb24uLi4NCj4gDQo+ID4gR3VzdGF2bywNCj4gPg0KPiA+IE9uIDI3
LzA4LzE5IDY6NTUgUE0sIEFuZHJldyBNdXJyYXkgd3JvdGU6DQo+ID4gPiBPbiBTYXQsIEF1ZyAy
NCwgMjAxOSBhdCAxMjowODo0MEFNICswMDAwLCBYaWFvd2VpIEJhbyB3cm90ZToNCj4gPiA+Pg0K
PiA+ID4+DQo+ID4gPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPj4+IEZyb206
IEFuZHJldyBNdXJyYXkgPGFuZHJldy5tdXJyYXlAYXJtLmNvbT4NCj4gPiA+Pj4gU2VudDogMjAx
OeW5tDjmnIgyM+aXpSAyMTo1OA0KPiA+ID4+PiBUbzogWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFv
QG54cC5jb20+DQo+ID4gPj4+IENjOiBiaGVsZ2Fhc0Bnb29nbGUuY29tOyByb2JoK2R0QGtlcm5l
bC5vcmc7DQo+IG1hcmsucnV0bGFuZEBhcm0uY29tOw0KPiA+ID4+PiBzaGF3bmd1b0BrZXJuZWwu
b3JnOyBMZW8gTGkgPGxlb3lhbmcubGlAbnhwLmNvbT47IGtpc2hvbkB0aS5jb207DQo+ID4gPj4+
IGxvcmVuem8ucGllcmFsaXNpQGFybS5jbzsgYXJuZEBhcm5kYi5kZTsgZ3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmc7DQo+IE0uaC4NCj4gPiA+Pj4gTGlhbiA8bWluZ2h1YW4ubGlhbkBueHAuY29t
PjsgTWluZ2thaSBIdSA8bWluZ2thaS5odUBueHAuY29tPjsNCj4gUm95DQo+ID4gPj4+IFphbmcg
PHJveS56YW5nQG54cC5jb20+OyBqaW5nb29oYW4xQGdtYWlsLmNvbTsNCj4gPiA+Pj4gZ3VzdGF2
by5waW1lbnRlbEBzeW5vcHN5cy5jb207IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4g
Pj4+IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOw0KPiA+ID4+PiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+ID4g
Pj4+IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+ID4gPj4+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMDcvMTBdIFBDSTogbGF5ZXJzY2FwZTogTW9kaWZ5IHRoZSBNU0lYIHRvDQo+ID4g
Pj4+IHRoZSBkb29yYmVsbCB3YXkNCj4gPiA+Pj4NCj4gPiA+Pj4gT24gVGh1LCBBdWcgMjIsIDIw
MTkgYXQgMDc6MjI6MzlQTSArMDgwMCwgWGlhb3dlaSBCYW8gd3JvdGU6DQo+ID4gPj4+PiBUaGUg
bGF5ZXJzY2FwZSBwbGF0Zm9ybSB1c2UgdGhlIGRvb3JiZWxsIHdheSB0byB0cmlnZ2VyIE1TSVgN
Cj4gPiA+Pj4+IGludGVycnVwdCBpbiBFUCBtb2RlLg0KPiA+ID4+Pj4NCj4gPiA+Pj4NCj4gPiA+
Pj4gSSBoYXZlIG5vIHByb2JsZW1zIHdpdGggdGhpcyBwYXRjaCwgaG93ZXZlci4uLg0KPiA+ID4+
Pg0KPiA+ID4+PiBBcmUgeW91IGFibGUgdG8gYWRkIHRvIHRoaXMgbWVzc2FnZSBhIHJlYXNvbiBm
b3Igd2h5IHlvdSBhcmUNCj4gPiA+Pj4gbWFraW5nIHRoaXMgY2hhbmdlPyBEaWQgZHdfcGNpZV9l
cF9yYWlzZV9tc2l4X2lycSBub3Qgd29yayB3aGVuDQo+ID4gPj4+IGZ1bmNfbm8gIT0gMD8gT3Ig
ZGlkIGl0IHdvcmsgeWV0IGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnFfZG9vcmJlbGwgaXMNCj4g
bW9yZSBlZmZpY2llbnQ/DQo+ID4gPj4NCj4gPiA+PiBUaGUgZmFjdCBpcyB0aGF0LCB0aGlzIGRy
aXZlciBpcyB2ZXJpZmllZCBpbiBsczEwNDZhIHBsYXRmb3JtIG9mDQo+ID4gPj4gTlhQIGJlZm9y
ZSwgYW5kIGxzMTA0NmEgZG9uJ3Qgc3VwcG9ydCBNU0lYIGZlYXR1cmUsIHNvIEkgc2V0IHRoZQ0K
PiA+ID4+IG1zaXhfY2FwYWJsZSBvZiBwY2lfZXBjX2ZlYXR1cmVzIHN0cnVjdCBpcyBmYWxzZSwg
YnV0IGluIG90aGVyDQo+ID4gPj4gcGxhdGZvcm0sIGUuZy4gbHMxMDg4YSwgaXQgc3VwcG9ydCB0
aGUgTVNJWCBmZWF0dXJlLCBJIHZlcmlmaWVkIHRoZSBNU0lYDQo+IGZlYXR1cmUgaW4gbHMxMDg4
YSwgaXQgaXMgbm90IE9LLCBzbyBJIGNoYW5nZWQgdG8gYW5vdGhlciB3YXkuIFRoYW5rcy4NCj4g
PiA+DQo+ID4gPiBSaWdodCwgc28gdGhlIGV4aXN0aW5nIHBjaS1sYXllcnNjYXBlLWVwLmMgZHJp
dmVyIG5ldmVyIHN1cHBvcnRlZA0KPiA+ID4gTVNJWCB5ZXQgaXQgZXJyb25lb3VzbHkgaGFkIGEg
c3dpdGNoIGNhc2Ugc3RhdGVtZW50IHRvIGNhbGwNCj4gPiA+IGR3X3BjaWVfZXBfcmFpc2VfbXNp
eF9pcnEgd2hpY2ggd291bGQgbmV2ZXIgZ2V0IHVzZWQuDQo+ID4gPg0KPiA+ID4gTm93IHRoYXQg
d2UncmUgYWRkaW5nIGEgcGxhdGZvcm0gd2l0aCBNU0lYIHN1cHBvcnQgdGhlIGV4aXN0aW5nDQo+
ID4gPiBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJxIGRvZXNuJ3Qgd29yayAoZm9yIHRoaXMgcGxh
dGZvcm0pIHNvIHdlIGFyZQ0KPiA+ID4gYWRkaW5nIGEgZGlmZmVyZW50IG1ldGhvZC4NCj4gPg0K
PiA+IEd1c3Rhdm8sIGNhbiB5b3UgY29uZmlybSBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJxKCkg
d29ya3MgZm9yDQo+ID4gZGVzaWdud2FyZSBhcyBpdCBkaWRuJ3Qgd29yayBmb3IgYm90aCBtZSBh
bmQgWGlhb3dlaT8NCj4gDQo+IFdoZW4gSSBpbXBsZW1lbnRlZCB0aGUgZHdfcGNpZV9lcF9yYWlz
ZV9tc2l4X2lycSgpLCB0aGUgaW1wbGVtZW50YXRpb24NCj4gd2FzIHdvcmtpbmcgcXVpdGUgZmlu
ZSBvbiBEZXNpZ25XYXJlIHNvbHV0aW9uLiBPdGhlcndpc2UsIEkgd291bGRuJ3Qgc3VibWl0DQo+
IGl0IHRvIHRoZSBrZXJuZWwuDQo+IEZyb20gd2hhdCBJIGhhdmUgc2VlbiBhbmQgaWYgSSByZWNh
bGwgd2VsbCwgWGlhb3dlaSBpbXBsZW1lbnRhdGlvbiB3YXMgZG9uZQ0KPiBoYXZpbmcgUEYncyBj
b25maWd1cmF0ZWQgb24gaGlzIHNvbHV0aW9uLCB3aGljaCBpcyBhIGNvbmZpZ3VyYXRpb24gdGhh
dCBJIGRvbid0DQo+IGhhdmUgaW4gbXkgc29sdXRpb24sIEkgYmVsaWV2ZSB0aGlzIGNvdWxkIGJl
IHRoZSBtaXNzaW5nIHBpZWNlIHRoYXQgZGlmZmVycw0KPiBiZXR3ZWVuIG91ciAyIGltcGxlbWVu
dGF0aW9ucy4NCj4gDQo+IFNpbmNlIHBhdGNoIHN1Ym1pc3Npb24gaW50byB0aGUga2VybmVsIHJl
bGF0ZWQgdG8gbXNpeCBmZWF0dXJlIG9uIHBjaXRlc3QgdG9vbCwgSQ0KPiBkaWRuJ3QgdG91Y2gg
b3IgcmUtdGVzdGVkIHRoZSBtc2l4IGZlYXR1cmUgYnkgbGFjayBvZiB0aW1lIChvdGhlciBwcm9q
ZWN0cw0KPiByZXF1aXJlcyBteSBmdWxsIGF0dGVudGlvbiBmb3Igbm93KS4gSG93ZXZlciBpcyBv
biBteSByb2FkbWFwIHRvIGNhbWUgYmFjaw0KPiB0byBhZGQgc29tZSBvdGhlciBmZWF0dXJlcyBv
biBEZXNpZ25XYXJlIGVETUEgZHJpdmVyIGFuZCBJIGNhbiBkbyBhdCB0aGF0DQo+IHRpbWUgc29t
ZSB0ZXN0cyB0byBzZWUgaWYgdGhlDQo+IGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnFfZG9vcmJl
bGwoKSBpcyBjb21wYXRpYmxlIG9yIG5vdCB3aXRoIG15IHNvbHV0aW9uLg0KPiBJZiBzbywgSSBj
YW4gZG8gc29tZSBwYXRjaCB0byBzaW1wbGlmeSBhbmQgdXNlIHRoZQ0KPiBkd19wY2llX2VwX3Jh
aXNlX21zaXhfaXJxX2Rvb3JiZWxsKCkgaWYgaXQgc3RpbGwgd29ya3MgYXMgZXhwZWN0ZWQgbGlr
ZSBvbg0KPiBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJxKCkuIEFncmVlPw0KPiANCg0KVGhhbmtz
IEd1c3Rhdm8sIGl0IGxvb2tzIHdlbGwgZm9yIG1lLg0KDQpUaGFua3MNClhpYW93ZWkNCg0KPiBH
dXN0YXZvDQo+IA0KPiA+DQo+ID4gVGhhbmtzDQo+ID4gS2lzaG9uDQo+IA0KDQo=
