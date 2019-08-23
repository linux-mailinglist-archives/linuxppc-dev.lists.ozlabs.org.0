Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 758FB9A67F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 06:15:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46F7NK0lJ9zDrRc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 14:15:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.5.71; helo=eur03-ve1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="VMUp4JEz"; 
 dkim-atps=neutral
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50071.outbound.protection.outlook.com [40.107.5.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46F7LX1PG5zDqLs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 14:13:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kwbYFN0QbQiL+L3HSKU719Op68mkra5wiER7Wx8AfAWQRPLGJvjtRqhphAT5DdBuzRWeDEUNwTCLbNtHL9Fz08azSZSeTp8x8VhAdx79grXkIpzv0c6nBvCoHiJdHZq56IVXPVSSFlDY1OUg6PkY7Emg5W7PsFDVkDrdn21y0W8MzOrwOlG1jjhEfkPPvLrbYOXYo6YpEdccjIAVSilooo/bVrTP9u6XBv00pC5qJUnD3NiUEtu0WdCRmdP62Pf88XxEV5zMpf6hG+ZH8iyC9h+SiXccvig47ZNQGchVhLSu6vKgrQ56s6Adah5HRFzni1sLci9i0fxgLBkEXCFSVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b252q7MAxK+j2sOrTyjFp9eavLQg9Sd/wFygJuCesO8=;
 b=nefTR1DjIt8iASddt913qhZnHnx9BkPbBrgA7yRz8wwJvLxPyZFEvXi6AUJy4TZ68+QNFPoVD/HjU+irN91DeEJLg/C8iicv4lK7knWVKVMu1V48lRufk+ivMxaSSAVTEOdPsqygPIKQ0ey88C7N20sY6z0Tq9Kl57+O6xsxY8/ninJLU3+z/pnaprVyplnaI8uZVJiPexmaQa5kA0KmEtLMkz2+A6kWmt6LvrGzGtAr6WW3C5zPip0risY4JhViUuVZaWy86Cq6H/EwFBvSXnxjZMIuhk6Vqw0HPzki+kFZX3uHjRwpUsBEtNW5JBfvRNpUJFG9/15uRPIsuSH+qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b252q7MAxK+j2sOrTyjFp9eavLQg9Sd/wFygJuCesO8=;
 b=VMUp4JEzn7YbUA8RMdHbcpTRFGmGWNHP+mMHZBwpFx0ipDjSvVWmEY7FRYM+4+I10auQ5LciI47JcMpuBZEE5bgvC0SEePFQLP6rXBSu+OsZiuIZnHvPLZIUATUo0qauAZW2pbIFHtNQPurJUKfDVjqNwIgcuFA5+2KVb/t2atQ=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB2995.eurprd04.prod.outlook.com (10.167.171.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.20; Fri, 23 Aug 2019 04:13:31 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043%7]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 04:13:31 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, "bhelgaas@google.com"
 <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>,
 "lorenzo.pieralisi@arm.co" <lorenzo.pieralisi@arm.com>, "arnd@arndb.de"
 <arnd@arndb.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "M.h. Lian" <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy
 Zang <roy.zang@nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "andrew.murray@arm.com"
 <andrew.murray@arm.com>
Subject: RE: [PATCH v2 06/10] PCI: layerscape: Modify the way of getting
 capability with different PEX
Thread-Topic: [PATCH v2 06/10] PCI: layerscape: Modify the way of getting
 capability with different PEX
Thread-Index: AQHVWN1bxZWGihL6TkupN1zdrsSAQ6cHDAGAgAD5DQCAABIIAIAABvSw
Date: Fri, 23 Aug 2019 04:13:30 +0000
Message-ID: <AM5PR04MB32995566CD6DF0AAAD1AE52EF5A40@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-6-xiaowei.bao@nxp.com>
 <0c02ac52-e4b1-8071-bf9e-d10b28fc9029@ti.com>
 <AM5PR04MB3299DE7B57F31EA405E4FCBCF5A40@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <11e9b2c3-f4d0-2f82-bb14-45c38a1419e4@ti.com>
In-Reply-To: <11e9b2c3-f4d0-2f82-bb14-45c38a1419e4@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f9c9188-31b6-466e-0edb-08d7278041df
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM5PR04MB2995; 
x-ms-traffictypediagnostic: AM5PR04MB2995:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB2995E6C6F387DBF824FE12AEF5A40@AM5PR04MB2995.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(199004)(189003)(13464003)(51444003)(3846002)(110136005)(6116002)(55016002)(81166006)(81156014)(74316002)(316002)(305945005)(64756008)(66446008)(2201001)(2501003)(14454004)(53936002)(6246003)(478600001)(7736002)(6436002)(52536014)(7416002)(66556008)(8676002)(86362001)(229853002)(2906002)(5660300002)(76176011)(71200400001)(66066001)(71190400001)(53546011)(6506007)(102836004)(7696005)(99286004)(66476007)(25786009)(9686003)(446003)(44832011)(76116006)(476003)(486006)(11346002)(186003)(256004)(66946007)(33656002)(8936002)(26005)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB2995;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: b33XuZM/jx1MBG0kMeCNh5Umain39hV3Zl5qI6cgeeIZd9GQlb0PehjqB0skEX2mvnIu3tDniMl7Wb8wEMpi11lyBXm54jdYm0CqLZswZRltgkv+0pQjEB80nHnVUYbAEDtpyIeur5N6Cg4v3S7Nj+wXBAPGdQg1p8q7qzYSNp5yGDUYd6euEx5HKEpAuMla+jV443bNsJ6Ha54xziTNIb4ySg0fKw7QwehCKTohEI6B6mdaZfSZXL1sb8uZHG+qGLy/xY3G5lyex1gaGO0yLrIsiS5KE1/BYYp7wzlyYQbKk7hwwIJG0Dvy2KzHRBMiFOcBKuxpFln/lC5Mq1BLGIVIreZL7JWyIPJ7AqC8svI546E7i4DegPIXlrBi08M+OZsLerKioZLagnnCeTRE8xhX6jL8zglbgRrKea61Eiw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f9c9188-31b6-466e-0edb-08d7278041df
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 04:13:30.7650 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /H5tU8ZLak8uWeqBTm5vH5rT6ZVYXLtdiyxqt0Nm77zIzWqFjxdmsGLd8jaawlHPqQvcRMFa5whjKe4lZ5fwqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2995
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2lzaG9uIFZpamF5IEFi
cmFoYW0gSSA8a2lzaG9uQHRpLmNvbT4NCj4gU2VudDogMjAxOeW5tDjmnIgyM+aXpSAxMTo0MA0K
PiBUbzogWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54cC5jb20+OyBiaGVsZ2Fhc0Bnb29nbGUu
Y29tOw0KPiByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOyBzaGF3bmd1
b0BrZXJuZWwub3JnOyBMZW8gTGkNCj4gPGxlb3lhbmcubGlAbnhwLmNvbT47IGxvcmVuem8ucGll
cmFsaXNpQGFybS5jbw0KPiA8bG9yZW56by5waWVyYWxpc2lAYXJtLmNvbT47IGFybmRAYXJuZGIu
ZGU7IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOw0KPiBNLmguIExpYW4gPG1pbmdodWFuLmxp
YW5AbnhwLmNvbT47IE1pbmdrYWkgSHUgPG1pbmdrYWkuaHVAbnhwLmNvbT47DQo+IFJveSBaYW5n
IDxyb3kuemFuZ0BueHAuY29tPjsgamluZ29vaGFuMUBnbWFpbC5jb207DQo+IGd1c3Rhdm8ucGlt
ZW50ZWxAc3lub3BzeXMuY29tOyBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eHBwYy1kZXZAbGlzdHMub3ps
YWJzLm9yZzsNCj4gYW5kcmV3Lm11cnJheUBhcm0uY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djIgMDYvMTBdIFBDSTogbGF5ZXJzY2FwZTogTW9kaWZ5IHRoZSB3YXkgb2YgZ2V0dGluZw0KPiBj
YXBhYmlsaXR5IHdpdGggZGlmZmVyZW50IFBFWA0KPiANCj4gSGksDQo+IA0KPiAoRml4ZWQgTG9y
ZW56bydzIGVtYWlsIGFkZHJlc3MuIEFsbCB0aGUgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzIGhhdmUg
d3JvbmcgZW1haWwNCj4gaWQpDQo+IA0KPiBPbiAyMy8wOC8xOSA4OjA5IEFNLCBYaWFvd2VpIEJh
byB3cm90ZToNCj4gPg0KPiA+DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
IEZyb206IEtpc2hvbiBWaWpheSBBYnJhaGFtIEkgPGtpc2hvbkB0aS5jb20+DQo+ID4+IFNlbnQ6
IDIwMTnlubQ45pyIMjLml6UgMTk6NDQNCj4gPj4gVG86IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJh
b0BueHAuY29tPjsgYmhlbGdhYXNAZ29vZ2xlLmNvbTsNCj4gPj4gcm9iaCtkdEBrZXJuZWwub3Jn
OyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgc2hhd25ndW9Aa2VybmVsLm9yZzsgTGVvDQo+IExpDQo+
ID4+IDxsZW95YW5nLmxpQG54cC5jb20+OyBsb3JlbnpvLnBpZXJhbGlzaUBhcm0uY287IGFybmRA
YXJuZGIuZGU7DQo+ID4+IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBNLmguIExpYW4gPG1p
bmdodWFuLmxpYW5AbnhwLmNvbT47DQo+ID4+IE1pbmdrYWkgSHUgPG1pbmdrYWkuaHVAbnhwLmNv
bT47IFJveSBaYW5nIDxyb3kuemFuZ0BueHAuY29tPjsNCj4gPj4gamluZ29vaGFuMUBnbWFpbC5j
b207IGd1c3Rhdm8ucGltZW50ZWxAc3lub3BzeXMuY29tOw0KPiA+PiBsaW51eC1wY2lAdmdlci5r
ZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gPj4gbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0K
PiA+PiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsgYW5kcmV3Lm11cnJheUBhcm0uY29t
DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDYvMTBdIFBDSTogbGF5ZXJzY2FwZTogTW9k
aWZ5IHRoZSB3YXkgb2YNCj4gPj4gZ2V0dGluZyBjYXBhYmlsaXR5IHdpdGggZGlmZmVyZW50IFBF
WA0KPiA+Pg0KPiA+PiBIaSwNCj4gPj4NCj4gPj4gT24gMjIvMDgvMTkgNDo1MiBQTSwgWGlhb3dl
aSBCYW8gd3JvdGU6DQo+ID4+PiBUaGUgZGlmZmVyZW50IFBDSWUgY29udHJvbGxlciBpbiBvbmUg
Ym9hcmQgbWF5IGJlIGhhdmUgZGlmZmVyZW50DQo+ID4+PiBjYXBhYmlsaXR5IG9mIE1TSSBvciBN
U0lYLCBzbyBjaGFuZ2UgdGhlIHdheSBvZiBnZXR0aW5nIHRoZSBNU0kNCj4gPj4+IGNhcGFiaWxp
dHksIG1ha2UgaXQgbW9yZSBmbGV4aWJsZS4NCj4gPj4NCj4gPj4gcGxlYXNlIHVzZSBkaWZmZXJl
bnQgcGNpX2VwY19mZWF0dXJlcyB0YWJsZSBmb3IgZGlmZmVyZW50IGJvYXJkcy4NCj4gPiBUaGFu
a3MsIEkgdGhpbmsgdGhhdCBpdCB3aWxsIGJlIG1vcmUgZmxleGlibGUgdG8gZHluYW1pY2FsbHkg
Z2V0IE1TSQ0KPiA+IG9yIE1TSVggY2FwYWJpbGl0eSwgVGh1cywgd2Ugd2lsbCBub3QgbmVlZCB0
byBkZWZpbmUgdGhlIHBjaV9lcGNfZmVhdHVyZSBmb3INCj4gZGlmZmVyZW50IGJvYXJkcy4NCj4g
DQo+IElzIHRoZSByZXN0cmljdGlvbiBiZWNhdXNlIHlvdSBjYW5ub3QgaGF2ZSBkaWZmZXJlbnQg
Y29tcGF0aWJsZSBmb3IgZGlmZmVyZW50DQo+IGJvYXJkcz8NClNvcnJ5LCBJIGFtIG5vdCB2ZXJ5
IGNsZWFyIHdoYXQgeW91ciBtZWFuLCBJIHRoaW5rIGV2ZW4gaWYgSSB1c2UgdGhlIHNhbWUgY29t
cGF0aWJsZQ0Kd2l0aCBkaWZmZXJlbnQgYm9hcmRzLCBlYWNoIGJvYXJkcyB3aWxsIGVudGVyIHRo
ZSBwcm9iZSBmdW5jdGlvbiwgaW4gdGhlcmUgSSB3aWxsIGdldA0KdGhlIE1TSSBvciBNU0lYIFBD
SWUgY2FwYWJpbGl0eSBvZiB0aGUgY3VycmVudCBjb250cm9sbGVyIGluIHRoaXMgYm9hcmQuIFdo
eSBkbyBJIG5lZWQNCnRvIGRlZmluZSB0aGUgcGNpX2VwY19mZWF0dXJlIGZvciBkaWZmZXJlbnQg
Ym9hcmRzPyANCj4gDQo+IFRoYW5rcw0KPiBLaXNob24NCj4gDQo+ID4+DQo+ID4+IFRoYW5rcw0K
PiA+PiBLaXNob24NCj4gPj4+DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBYaWFvd2VpIEJhbyA8eGlh
b3dlaS5iYW9AbnhwLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gdjI6DQo+ID4+PiAgLSBSZW1vdmUg
dGhlIHJlcGVhdGVkIGFzc2lnbm1lbnQgY29kZS4NCj4gPj4+DQo+ID4+PiAgZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYyB8IDI2DQo+ID4+PiArKysrKysrKysr
KysrKysrKysrLS0tLS0tLQ0KPiA+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCsp
LCA3IGRlbGV0aW9ucygtKQ0KPiA+Pj4NCj4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4+PiBiL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMNCj4gPj4+IGluZGV4IDRlOTJhOTUuLjg0
NjFmNjIgMTAwNjQ0DQo+ID4+PiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kt
bGF5ZXJzY2FwZS1lcC5jDQo+ID4+PiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4+PiBAQCAtMjIsNiArMjIsNyBAQA0KPiA+Pj4NCj4gPj4+
ICBzdHJ1Y3QgbHNfcGNpZV9lcCB7DQo+ID4+PiAgCXN0cnVjdCBkd19wY2llCQkqcGNpOw0KPiA+
Pj4gKwlzdHJ1Y3QgcGNpX2VwY19mZWF0dXJlcwkqbHNfZXBjOw0KPiA+Pj4gIH07DQo+ID4+Pg0K
PiA+Pj4gICNkZWZpbmUgdG9fbHNfcGNpZV9lcCh4KQlkZXZfZ2V0X2RydmRhdGEoKHgpLT5kZXYp
DQo+ID4+PiBAQCAtNDAsMjUgKzQxLDI2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNl
X2lkDQo+ID4+IGxzX3BjaWVfZXBfb2ZfbWF0Y2hbXSA9IHsNCj4gPj4+ICAJeyB9LA0KPiA+Pj4g
IH07DQo+ID4+Pg0KPiA+Pj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2VwY19mZWF0dXJlcyBs
c19wY2llX2VwY19mZWF0dXJlcyA9IHsNCj4gPj4+IC0JLmxpbmt1cF9ub3RpZmllciA9IGZhbHNl
LA0KPiA+Pj4gLQkubXNpX2NhcGFibGUgPSB0cnVlLA0KPiA+Pj4gLQkubXNpeF9jYXBhYmxlID0g
ZmFsc2UsDQo+ID4+PiAtfTsNCj4gPj4+IC0NCj4gPj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHBj
aV9lcGNfZmVhdHVyZXMqDQo+ID4+PiBsc19wY2llX2VwX2dldF9mZWF0dXJlcyhzdHJ1Y3QgZHdf
cGNpZV9lcCAqZXApICB7DQo+ID4+PiAtCXJldHVybiAmbHNfcGNpZV9lcGNfZmVhdHVyZXM7DQo+
ID4+PiArCXN0cnVjdCBkd19wY2llICpwY2kgPSB0b19kd19wY2llX2Zyb21fZXAoZXApOw0KPiA+
Pj4gKwlzdHJ1Y3QgbHNfcGNpZV9lcCAqcGNpZSA9IHRvX2xzX3BjaWVfZXAocGNpKTsNCj4gPj4+
ICsNCj4gPj4+ICsJcmV0dXJuIHBjaWUtPmxzX2VwYzsNCj4gPj4+ICB9DQo+ID4+Pg0KPiA+Pj4g
IHN0YXRpYyB2b2lkIGxzX3BjaWVfZXBfaW5pdChzdHJ1Y3QgZHdfcGNpZV9lcCAqZXApICB7DQo+
ID4+PiAgCXN0cnVjdCBkd19wY2llICpwY2kgPSB0b19kd19wY2llX2Zyb21fZXAoZXApOw0KPiA+
Pj4gKwlzdHJ1Y3QgbHNfcGNpZV9lcCAqcGNpZSA9IHRvX2xzX3BjaWVfZXAocGNpKTsNCj4gPj4+
ICAJZW51bSBwY2lfYmFybm8gYmFyOw0KPiA+Pj4NCj4gPj4+ICAJZm9yIChiYXIgPSBCQVJfMDsg
YmFyIDw9IEJBUl81OyBiYXIrKykNCj4gPj4+ICAJCWR3X3BjaWVfZXBfcmVzZXRfYmFyKHBjaSwg
YmFyKTsNCj4gPj4+ICsNCj4gPj4+ICsJcGNpZS0+bHNfZXBjLT5tc2lfY2FwYWJsZSA9IGVwLT5t
c2lfY2FwID8gdHJ1ZSA6IGZhbHNlOw0KPiA+Pj4gKwlwY2llLT5sc19lcGMtPm1zaXhfY2FwYWJs
ZSA9IGVwLT5tc2l4X2NhcCA/IHRydWUgOiBmYWxzZTsNCj4gPj4+ICB9DQo+ID4+Pg0KPiA+Pj4g
IHN0YXRpYyBpbnQgbHNfcGNpZV9lcF9yYWlzZV9pcnEoc3RydWN0IGR3X3BjaWVfZXAgKmVwLCB1
OCBmdW5jX25vLA0KPiA+Pj4gQEANCj4gPj4+IC0xMTgsNiArMTIwLDcgQEAgc3RhdGljIGludCBf
X2luaXQgbHNfcGNpZV9lcF9wcm9iZShzdHJ1Y3QNCj4gPj4+IHBsYXRmb3JtX2RldmljZQ0KPiA+
PiAqcGRldikNCj4gPj4+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4gPj4+
ICAJc3RydWN0IGR3X3BjaWUgKnBjaTsNCj4gPj4+ICAJc3RydWN0IGxzX3BjaWVfZXAgKnBjaWU7
DQo+ID4+PiArCXN0cnVjdCBwY2lfZXBjX2ZlYXR1cmVzICpsc19lcGM7DQo+ID4+PiAgCXN0cnVj
dCByZXNvdXJjZSAqZGJpX2Jhc2U7DQo+ID4+PiAgCWludCByZXQ7DQo+ID4+Pg0KPiA+Pj4gQEAg
LTEyOSw2ICsxMzIsMTAgQEAgc3RhdGljIGludCBfX2luaXQgbHNfcGNpZV9lcF9wcm9iZShzdHJ1
Y3QNCj4gPj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+Pj4gIAlpZiAoIXBjaSkNCj4gPj4+
ICAJCXJldHVybiAtRU5PTUVNOw0KPiA+Pj4NCj4gPj4+ICsJbHNfZXBjID0gZGV2bV9remFsbG9j
KGRldiwgc2l6ZW9mKCpsc19lcGMpLCBHRlBfS0VSTkVMKTsNCj4gPj4+ICsJaWYgKCFsc19lcGMp
DQo+ID4+PiArCQlyZXR1cm4gLUVOT01FTTsNCj4gPj4+ICsNCj4gPj4+ICAJZGJpX2Jhc2UgPSBw
bGF0Zm9ybV9nZXRfcmVzb3VyY2VfYnluYW1lKHBkZXYsDQo+IElPUkVTT1VSQ0VfTUVNLA0KPiA+
PiAicmVncyIpOw0KPiA+Pj4gIAlwY2ktPmRiaV9iYXNlID0gZGV2bV9wY2lfcmVtYXBfY2ZnX3Jl
c291cmNlKGRldiwgZGJpX2Jhc2UpOw0KPiA+Pj4gIAlpZiAoSVNfRVJSKHBjaS0+ZGJpX2Jhc2Up
KQ0KPiA+Pj4gQEAgLTEzOSw2ICsxNDYsMTEgQEAgc3RhdGljIGludCBfX2luaXQgbHNfcGNpZV9l
cF9wcm9iZShzdHJ1Y3QNCj4gPj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+Pj4gIAlwY2kt
Pm9wcyA9ICZsc19wY2llX2VwX29wczsNCj4gPj4+ICAJcGNpZS0+cGNpID0gcGNpOw0KPiA+Pj4N
Cj4gPj4+ICsJbHNfZXBjLT5saW5rdXBfbm90aWZpZXIgPSBmYWxzZSwNCj4gPj4+ICsJbHNfZXBj
LT5iYXJfZml4ZWRfNjRiaXQgPSAoMSA8PCBCQVJfMikgfCAoMSA8PCBCQVJfNCksDQo+ID4+PiAr
DQo+ID4+PiArCXBjaWUtPmxzX2VwYyA9IGxzX2VwYzsNCj4gPj4+ICsNCj4gPj4+ICAJcGxhdGZv
cm1fc2V0X2RydmRhdGEocGRldiwgcGNpZSk7DQo+ID4+Pg0KPiA+Pj4gIAlyZXQgPSBsc19hZGRf
cGNpZV9lcChwY2llLCBwZGV2KTsNCj4gPj4+DQo=
