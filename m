Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1182633962
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 21:57:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Hm6V4VM3zDqXT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2019 05:57:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.15.71; helo=eur01-db5-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="fN90t4Kt"; 
 dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-eopbgr150071.outbound.protection.outlook.com [40.107.15.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Hm5F4yZBzDqNs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2019 05:55:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yw9U0BA/Rbnuost0XrXLpPpt3YzVCVxPdRWpRM9ggvc=;
 b=fN90t4Kti5ZuuGzE/ORrPJ9AOByQdJKZeQX/rMkn0WHWSVa9HOyuGXMqwv715CWlS2FFL0xtH+vKNhVGK9GNfrEPEe96+qk+vQ2c6V5KIYIehqVX7uypr0FCUSytv8w+Yud9HeAHiLDydiChq8sGlVMNj1t/+cukzJo60UxqD9A=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (20.179.235.152) by
 VE1PR04MB6670.eurprd04.prod.outlook.com (20.179.235.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.17; Mon, 3 Jun 2019 19:55:51 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::9e6:e136:4c09:fe67]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::9e6:e136:4c09:fe67%5]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 19:55:51 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Qiang Zhao
 <qiang.zhao@nxp.com>
Subject: RE: [PATCH v3 0/6] soc/fsl/qe: cleanups and new DT binding
Thread-Topic: [PATCH v3 0/6] soc/fsl/qe: cleanups and new DT binding
Thread-Index: AQHVCX0ZigTT3b8e40uvrg8HEyl+g6aKeRUAgAAAdGA=
Date: Mon, 3 Jun 2019 19:55:51 +0000
Message-ID: <VE1PR04MB6687FF805430978ED307EA2D8F140@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
 <20190513111442.25724-1-rasmus.villemoes@prevas.dk>
 <e11c1e55-1e11-7ce3-3c0f-0b723ab260aa@prevas.se>
In-Reply-To: <e11c1e55-1e11-7ce3-3c0f-0b723ab260aa@prevas.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 579c5b46-ed17-4d70-dd88-08d6e85d7b38
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:VE1PR04MB6670; 
x-ms-traffictypediagnostic: VE1PR04MB6670:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <VE1PR04MB667010E870DE62DA6AC70C118F140@VE1PR04MB6670.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(39860400002)(346002)(396003)(136003)(13464003)(199004)(189003)(7736002)(305945005)(76176011)(2501003)(99286004)(7696005)(6506007)(486006)(74316002)(33656002)(478600001)(52536014)(6116002)(476003)(68736007)(2906002)(102836004)(3846002)(256004)(26005)(5660300002)(186003)(7416002)(11346002)(86362001)(53546011)(14454004)(25786009)(6436002)(6246003)(4326008)(8676002)(66946007)(446003)(73956011)(71200400001)(71190400001)(66476007)(66446008)(9686003)(64756008)(66066001)(66556008)(229853002)(54906003)(110136005)(53936002)(55016002)(316002)(8936002)(81166006)(81156014)(6636002)(76116006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6670;
 H:VE1PR04MB6687.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pICCQVEdCAjHBf+x3/AVVw6qC65ksmgT482DiEDw0msXak+Ss4Sp0KSWtBoeO9yfJefrjtvHpvoBORrakmvIleL+65fO5kMlGMfYaGShSOYsgnOc6GDgIwHzwOPqJHtG7+YZTWzzaNFQSUJTBy+FX+o1XZypMAWMjZZXHaCQWjExo3bzeFYrJgvhKNiyGTdzcKh0QtaRphfwRjR3q4MF5ZU/5/1OPDtNlhEPAzdzrAa5ywmgm6QYQd01hTTs/5fihLLBe1cDk4bOKvpqzRHc/+cuNAMhoWomQfwPgxU5ngqPFyPz3hPhOucqzW2b6QvGYp5MnmyfeuNH+s8KcrzUOuqmgXp4ZOckFWMP8WeCthlE/Fg29wf0vWr8env7mqxYUS78+C8IcZW16YpQ7EkepA6ETtuGdOaLdpbC2FN1758=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 579c5b46-ed17-4d70-dd88-08d6e85d7b38
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 19:55:51.5311 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leoyang.li@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6670
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, Rob Herring <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmFzbXVzIFZpbGxlbW9l
cyA8UmFzbXVzLlZpbGxlbW9lc0BwcmV2YXMuc2U+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAzLCAy
MDE5IDI6NTQgUE0NCj4gVG86IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOyBRaWFuZyBaaGFv
IDxxaWFuZy56aGFvQG54cC5jb20+OyBMZW8gTGkNCj4gPGxlb3lhbmcubGlAbnhwLmNvbT4NCj4g
Q2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3Rz
LmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IFJvYiBIZXJy
aW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBTY290dA0KPiBXb29kIDxvc3NAYnVzZXJyb3IubmV0
PjsgQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+Ow0KPiBNYXJrIFJ1
dGxhbmQgPG1hcmsucnV0bGFuZEBhcm0uY29tPjsgam9ja2VAaW5maW5lcmEuY29tDQo+IDxqb2Fr
aW0udGplcm5sdW5kQGluZmluZXJhLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwLzZd
IHNvYy9mc2wvcWU6IGNsZWFudXBzIGFuZCBuZXcgRFQgYmluZGluZw0KPiANCj4gT24gMTMvMDUv
MjAxOSAxMy4xNCwgUmFzbXVzIFZpbGxlbW9lcyB3cm90ZToNCj4gPiBUaGlzIHNtYWxsIHNlcmll
cyBjb25zaXN0cyBvZiBzb21lIHNtYWxsIGNsZWFudXBzIGFuZCBzaW1wbGlmaWNhdGlvbnMNCj4g
PiBvZiB0aGUgUVVJQ0MgZW5naW5lIGRyaXZlciwgYW5kIGludHJvZHVjZXMgYSBuZXcgRFQgYmlu
ZGluZyB0aGF0IG1ha2VzDQo+ID4gaXQgbXVjaCBlYXNpZXIgdG8gc3VwcG9ydCBvdGhlciB2YXJp
YW50cyBvZiB0aGUgUVVJQ0MgZW5naW5lIElQIGJsb2NrDQo+ID4gdGhhdCBhcHBlYXJzIGluIHRo
ZSB3aWxkOiBUaGVyZSdzIG5vIHJlYXNvbiB0byBleHBlY3QgaW4gZ2VuZXJhbCB0aGF0DQo+ID4g
dGhlIG51bWJlciBvZiB2YWxpZCBTTlVNcyB1bmlxdWVseSBkZXRlcm1pbmVzIHRoZSBzZXQgb2Yg
c3VjaCwgc28gaXQncw0KPiA+IGJldHRlciB0byBzaW1wbHkgbGV0IHRoZSBkZXZpY2UgdHJlZSBz
cGVjaWZ5IHRoZSB2YWx1ZXMgKGFuZCwNCj4gPiBpbXBsaWNpdGx5IHZpYSB0aGUgYXJyYXkgbGVu
Z3RoLCBhbHNvIHRoZSBjb3VudCkuDQo+ID4NCj4gPiBXaGljaCB0cmVlIHNob3VsZCB0aGlzIGdv
IHRocm91Z2g/DQo+IA0KPiBQaW5nPyBUaGVzZSBwYXRjaGVzIHNob3VsZCBiZSByZWFkeSB0byBn
byBpbiwgYnV0IEkgZG9uJ3Qga25vdyB3aG8gaXMNCj4gc3VwcG9zZWQgdG8gcGljayB0aGVtIHVw
Lg0KDQpJIGNhbiBwaWNrIHRoZW0gdXAgdGhyb3VnaCB0aGUgc29jL2ZzbCB0cmVlLg0KDQpSZWdh
cmRzLA0KTGVvDQo=
