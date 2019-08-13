Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFE78B63B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 13:04:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4678xF1s37zDqdG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 21:04:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.40; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="qmgH3iXo"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80040.outbound.protection.outlook.com [40.107.8.40])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4678tv5VmpzDqbt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 21:02:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cu4QekkGaYQ3nhviXGoRLCrLj9eMms8Ke7D5DThgMIR21RsRrK3sZ5WPGkDu9rj5UfY/vGuyoxIMBm30Zh0n1Ck+pLSFiG2Gv6/al8srunNw/qRhBhJKcPol4NwawotTPv+GbtEfi5DTr25CbOnQDgcJGZ0ahxnueUb1gmlC6a0Zuc8Zffg/gGCpuLapCzN9Omhu+4aKV1w/6QcDwNu6SnXTOS5jXeZAR2qM3AkQPqLffmjx7lYslQZmWlOAeyBtpY1EcJgLBX8NgLz6BYPaVib6yH7RepbALPWBoOOq2tr2GXrf26DrzSvJZONhP0Yf2jSnXTFSnWlu+eYfjD6APA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nDGezeV1UjdK0Fo4A5Hn2h2YZL/DfS8au5Bnwgoe3Y=;
 b=Yr+b2v6XkrvqCrJQJisN7FSGHxv9ZsoStOEZV+iZbm3EruCqtaKBYWm9SsvaZ9M0lkQtphce4wHpyNh0fm/go/bvHAh7J3Ym2bAFvOJm19Rikr/gQcHEYhMnkDPkIrDKZt+3lyyOeyeOBQjEzo33QmmkaVRIWMIuyEfbfPgfrknF2sYkbhm9taUdh4ht5XJzmKbXKylrTAmANi+S0qqYOM5l/if3hX9rbkdVGG9k1wGATE6lPTgHulRwl1H2iynI51SvQnLxFFzzxiWJc2nSrhAIdwVk4jThFtCrLpo2XpX1saVJ2GNq1U3HvSem9sh1wypgQE0K/CphabRfbkCgfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4nDGezeV1UjdK0Fo4A5Hn2h2YZL/DfS8au5Bnwgoe3Y=;
 b=qmgH3iXoAM0AZNkEWvINcncBePHap4DHAdP4TGh1dsEW2RUvIocznVjlJz6kGQ1HMPotxHEX+FHwAfZeLnb1bmwUWW1kcLMeK4rleOe/zRusxPJ/UBYvICoSTDw7f4B8hTwS8rIpDC6PLsS8xuq1o088Hh9bUc8tJ6Z1y7A2vU0=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3268.eurprd04.prod.outlook.com (10.167.171.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Tue, 13 Aug 2019 11:02:20 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84%5]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 11:02:20 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: RE: [EXT] Re: [PATCHv5 1/2] PCI: layerscape: Add the bar_fixed_64bit
 property in EP driver.
Thread-Topic: [EXT] Re: [PATCHv5 1/2] PCI: layerscape: Add the bar_fixed_64bit
 property in EP driver.
Thread-Index: AQHVUaHA8E+uV7sB3kSdNrIxtC9aDKb42aKAgAAIM1A=
Date: Tue, 13 Aug 2019 11:02:19 +0000
Message-ID: <AM5PR04MB32995F572C3FB85B35E52563F5D20@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190813062840.2733-1-xiaowei.bao@nxp.com>
 <20190813100409.GB10070@red-moon>
In-Reply-To: <20190813100409.GB10070@red-moon>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a63507ec-10dd-4428-ab9b-08d71fddb627
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3268; 
x-ms-traffictypediagnostic: AM5PR04MB3268:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3268D5C3454AC1D01264F97CF5D20@AM5PR04MB3268.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2512;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(366004)(396003)(136003)(376002)(189003)(199004)(13464003)(71190400001)(33656002)(25786009)(99286004)(7416002)(54906003)(256004)(53936002)(478600001)(316002)(6246003)(81166006)(81156014)(8676002)(55016002)(4326008)(71200400001)(5660300002)(9686003)(305945005)(64756008)(74316002)(6506007)(2906002)(186003)(66446008)(7736002)(52536014)(66476007)(66556008)(6916009)(76176011)(229853002)(26005)(14454004)(53546011)(8936002)(86362001)(66946007)(476003)(102836004)(44832011)(6116002)(76116006)(486006)(66066001)(446003)(3846002)(7696005)(11346002)(6436002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3268;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: clh7wvxuDryNhG2xgurm4SYYjrHT3WKwwR56I20jsYNmMSYzTAVA3nIVYsVLXBC3LuOSzj0bwMS/BEAr/fXUKBxEF4Xdnc3x3bY+dt42X9+YotePdrPNnr13xQpQTETJD3DMsFYF85ba0QGyvsU8FtTzOKjVtjzLiXoSvZcawe0+6m2WUWITTdOfYK4zriE/ER+1tnP7sgzcrqHYHHDt/t6+ESEYeac94BKRZm2WunHoSBC/PS3rZW21rkz/RlB8XZ3gyrRMJ3rOmtTJzkAH3Uwi7QmxiV9/1MpgqO1nzWd5n/gSCKyJH1xA3chLfV1jOa7reoUPGLkVO0IMlpYsLjyzGAG+Gs+0uJIOWGMRsZYp4hSr7NYn7AngH7j5Vbd3bdre7wN9SQ5UvqU2vm7DoWRbdpzTuZndcyoYKzzpYNg=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a63507ec-10dd-4428-ab9b-08d71fddb627
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 11:02:19.8801 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S4DwoGpS2CpG+fYsOTnrqCu0XVg3eeqc8RGqd46TfH+Iby7U9rtxBwWNV6aG9zQqOZzIikRhqhxGepodVHBsHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3268
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Roy Zang <roy.zang@nxp.com>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
 "andrew.smirnov@gmail.com" <andrew.smirnov@gmail.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yue.wang@amlogic.com" <yue.wang@amlogic.com>, "kishon@ti.com" <kishon@ti.com>,
 "M.h. Lian" <minghuan.lian@nxp.com>, "dwmw@amazon.co.uk" <dwmw@amazon.co.uk>,
 "jonnyc@amazon.com" <jonnyc@amazon.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "tpiepho@impinj.com" <tpiepho@impinj.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Mingkai Hu <mingkai.hu@nxp.com>,
 "l.stach@pengutronix.de" <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTG9yZW56byBQaWVyYWxp
c2kgPGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20+DQo+IFNlbnQ6IDIwMTnE6jjUwjEzyNUgMTg6
MDQNCj4gVG86IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiBDYzogYmhlbGdh
YXNAZ29vZ2xlLmNvbTsgTS5oLiBMaWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+OyBNaW5na2Fp
IEh1DQo+IDxtaW5na2FpLmh1QG54cC5jb20+OyBSb3kgWmFuZyA8cm95LnphbmdAbnhwLmNvbT47
DQo+IGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU7IGtpc2hvbkB0aS5jb207IHRwaWVwaG9AaW1waW5q
LmNvbTsgTGVvbmFyZA0KPiBDcmVzdGV6IDxsZW9uYXJkLmNyZXN0ZXpAbnhwLmNvbT47IGFuZHJl
dy5zbWlybm92QGdtYWlsLmNvbTsNCj4geXVlLndhbmdAYW1sb2dpYy5jb207IGhheWFzaGkua3Vu
aWhpa29Ac29jaW9uZXh0LmNvbTsNCj4gZHdtd0BhbWF6b24uY28udWs7IGpvbm55Y0BhbWF6b24u
Y29tOyBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsNCj4gbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0h2NSAxLzJd
IFBDSTogbGF5ZXJzY2FwZTogQWRkIHRoZSBiYXJfZml4ZWRfNjRiaXQNCj4gcHJvcGVydHkgaW4g
RVAgZHJpdmVyLg0KPiANCj4gQ2F1dGlvbjogRVhUIEVtYWlsDQo+IA0KPiBnaXQgbG9nIC0tb25l
bGluZSAtLWZvbGxvdyBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS5j
DQo+IA0KPiBEbyB5b3Ugc2VlIGFueSBjb21taXQgd2l0aCBhICRTVUJKRUNUIGVuZGluZyB3aXRo
IGEgcGVyaW9kID8NCj4gDQo+IFRoZXJlIGlzIG5vdC4gU28gcmVtb3ZlIGl0IGZyb20geW91cnMg
dG9vLg0KT0ssIHRoYW5rcyBhIGxvdCwgSSB3aWxsIHJlbW92ZSBpdCBpbiB0aGUgbmV4dCB2ZXJz
aW9uIHBhdGNoLCBJIGhhdmUgdG8gZ2V0IHRoZSBhcHByb3ZlZA0KRm9ybSBJVCB0ZWFtIG9mIG91
ciBjb21wYW55LiANCj4gDQo+IE9uIFR1ZSwgQXVnIDEzLCAyMDE5IGF0IDAyOjI4OjM5UE0gKzA4
MDAsIFhpYW93ZWkgQmFvIHdyb3RlOg0KPiA+IFRoZSBQQ0llIGNvbnRyb2xsZXIgb2YgbGF5ZXJz
Y2FwZSBqdXN0IGhhdmUgNCBCQVJzLCBCQVIwIGFuZCBCQVIxIGlzDQo+ID4gMzJiaXQsIEJBUjIg
YW5kIEJBUjQgaXMgNjRiaXQsIHRoaXMgaXMgZGV0ZXJtaW5lZCBieSBoYXJkd2FyZSwgc28gc2V0
DQo+ID4gdGhlIGJhcl9maXhlZF82NGJpdCB3aXRoIDB4MTQuDQo+ID4NCj4gPiBTaWduZWQtb2Zm
LWJ5OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiB2MjoN
Cj4gPiAgLSBSZXBsYWNlIHZhbHVlIDB4MTQgd2l0aCBhIG1hY3JvLg0KPiA+IHYzOg0KPiA+ICAt
IE5vIGNoYW5nZS4NCj4gPiB2NDoNCj4gPiAgLSBzZW5kIHRoZSBwYXRjaCBhZ2FpbiB3aXRoICct
LXRvJy4NCj4gPiB2NToNCj4gPiAgLSBmaXggdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiA+DQo+ID4g
IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMgfCAxICsNCj4g
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBzY3JpcHRzL2dldF9tYWlu
dGFpbmVyLnBsIC1mIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVw
LmMNCj4gTm93LCB3aXRoIHRoZSBvdXRwdXQgeW91IGdldCBqdXN0aWZ5IGFsbCB0aGUgcGVvcGxl
IHlvdSBzZW5kIHRoaXMgZW1haWwgdG8uDQo+IA0KPiBTbywgYWdhaW4sIHRyaW0gdGhlIENDIGxp
c3QgYW5kIGl0IGlzIHRoZSBsYXN0IHRpbWUgSSB0ZWxsIHlvdS4NCkRvIHlvdSBtZWFuIHRoYXQg
SSB1c2Ugc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAtZiBkcml2ZXJzL3BjaS9jb250cm9sbGVy
Lw0KZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMgdG8gZ2V0IHRoZSBtYWlsIGxpc3Qgd2hvIEkgbmVl
ZCB0byBzZW5kPyBJIHVzZSB0aGUNCmNvbW1hbmQgb2YgJyBzY3JpcHRzL2dldF9tYWludGFpbmVy
LnBsICoucGF0Y2gnIHRvIGdldCB0aGUgbWFpbCBsaXN0IGJlZm9yZS4NCklmIHllcywgSSB3aWxs
IHVzZSB0aGUgY29tbWFuZCB0aGF0IHlvdSBwcm92aWRlZC4gVGhhbmtzIGEgbG90Lg0KPiANCj4g
QmVmb3JlIHNlbmRpbmcgcGF0Y2hlcyBvbiBtYWlsaW5nIGxpc3RzIHVzZSBnaXQgLS1kcnktcnVu
IHRvIGNoZWNrIHRoZSBlbWFpbHMNCj4geW91IGFyZSBzZW5kaW5nLg0KPiANCj4gVGhhbmtzLA0K
PiBMb3JlbnpvDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gaW5kZXggYmU2MWQ5Ni4uY2E5YWE0NSAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+
ID4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0K
PiA+IEBAIC00NCw2ICs0NCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2VwY19mZWF0dXJl
cw0KPiBsc19wY2llX2VwY19mZWF0dXJlcyA9IHsNCj4gPiAgICAgICAubGlua3VwX25vdGlmaWVy
ID0gZmFsc2UsDQo+ID4gICAgICAgLm1zaV9jYXBhYmxlID0gdHJ1ZSwNCj4gPiAgICAgICAubXNp
eF9jYXBhYmxlID0gZmFsc2UsDQo+ID4gKyAgICAgLmJhcl9maXhlZF82NGJpdCA9ICgxIDw8IEJB
Ul8yKSB8ICgxIDw8IEJBUl80KSwNCj4gPiAgfTsNCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IHBjaV9lcGNfZmVhdHVyZXMqDQo+ID4gLS0NCj4gPiAyLjkuNQ0KPiA+DQo=
