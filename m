Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 796898D00D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 11:50:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467lDn3F8NzDqRd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 19:50:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.14.59; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="JFGDgndU"; 
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140059.outbound.protection.outlook.com [40.107.14.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467lBg4DbHzDqRd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 19:48:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bwkwpaawxu1ym0E7wQUUX6fOFksPdn/tK+awmcHqL5zEJHE0Y6Th3kAHQvJCKAXkWJKYqakKJyjENo5GFfflBqi1A5it3GoBvAP3lRtAPS1vSsOVzs878b3xcX1R5brzwSSjGdTkejo2yiiDhuP5vutsBI5XMrxcnv+xeGHWGPMDirT48iliRRMXzwagzW7VFzeq+ftwltE9v76JkTuTf+MN+QAIeDgZg/urQ91wiaD8vsa/hS7fDEuwOBy/giG1HHWIcvcuYeTi6EOCAZE+r+XtSFQsVfHeHFrhvYddZ5kszNJ0VyWvyAD4IVlH4WOIUmv6/n+ovRjbEfTnLA+ETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znncMx6vllCfJyxWkEqGwlGZhaNvryEUZOqe1Jjrcd0=;
 b=L0Coq4SyFL5R4lZAkMmN4C0QcIF8LshE54h6YjWjfXzcBq1QAvcbxit43jyxwfghIYoFQ2WdLJli9/UXH8s+A6UcheeOU/KG4IYtxmomtV6K9KjJYyesqR+Mg4S3/k8jB7FY0DCQmG483qRE7G2ThK1eUH/700k2Q3mZH7DeTFyViE6Mfa+NMA6P+9a+wOD66Fuo7VFI9oZDpKBca+juAJOPWceez26lQ+KWTvp2SyW/MJCnGS+V8wEASmS2LfhylkJfsUqMrpPvAIdscz2qvv0DdvvHFj5rZnKzPMQIojgpyUqLQBbhAZHOSjbe7XRB1pcHBmz8R1o0mHbMBJskyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znncMx6vllCfJyxWkEqGwlGZhaNvryEUZOqe1Jjrcd0=;
 b=JFGDgndUsMc97MhxjLtbPFC9uKb0Sm14mZo+hhxLraAFTXQMiI0yzV8a4wQVZsDXzTEmQoPJxiE7uv8p6bESqTECq1t8Pje3NzlSJWE2sS++I9n7npn54zIHEYobpxoq3MHd7Ym6gWFZX0iUPh9M4kjkXUgZOEGz4K26L2bFwb0=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3297.eurprd04.prod.outlook.com (10.167.168.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.21; Wed, 14 Aug 2019 09:48:01 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84%5]) with mapi id 15.20.2157.022; Wed, 14 Aug 2019
 09:48:01 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: RE: [PATCHv6 1/2] PCI: layerscape: Add the bar_fixed_64bit property
 in EP driver.
Thread-Topic: [PATCHv6 1/2] PCI: layerscape: Add the bar_fixed_64bit property
 in EP driver.
Thread-Index: AQHVUkXX4F7jGdZiC0eiDW46LdzUUKb6YRoAgAABy8A=
Date: Wed, 14 Aug 2019 09:48:00 +0000
Message-ID: <AM5PR04MB32994A55A2951DD071C19F66F5AD0@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190814020330.12133-1-xiaowei.bao@nxp.com>
 <20190814092952.GA26840@e121166-lin.cambridge.arm.com>
In-Reply-To: <20190814092952.GA26840@e121166-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 032b63a8-b94d-4125-2196-08d7209c7eec
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3297; 
x-ms-traffictypediagnostic: AM5PR04MB3297:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB32976EABAFAF0D81F000D736F5AD0@AM5PR04MB3297.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 01294F875B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(366004)(136003)(376002)(346002)(189003)(199004)(13464003)(99286004)(25786009)(53936002)(54906003)(478600001)(55016002)(5660300002)(316002)(6246003)(71190400001)(33656002)(256004)(81166006)(81156014)(8676002)(71200400001)(4326008)(9686003)(305945005)(74316002)(14454004)(26005)(52536014)(66446008)(76176011)(53546011)(6506007)(186003)(476003)(66476007)(6916009)(64756008)(66556008)(2906002)(7736002)(229853002)(86362001)(66946007)(8936002)(486006)(102836004)(76116006)(44832011)(66066001)(446003)(6436002)(11346002)(7696005)(3846002)(6116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3297;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BintUsxUwyYfBwckeoBu+OFlqDFsxSIAnuXdOTAYVrrZTWpckI3i4NqhN4OpuXX9GEhwh3bedmU2tie9YnY4A3m1OgUNzJHgMIpJqu40T3NI8NzAdJPDY7qdSGC8ZkoJ/20XQf60z+X/vZBoVWj85su8NYoauJKuMp7gRc59kYmXoF7VbRskwPGpc2z8c896KCgqop9TvBpsXwOFekRZG/gJ4c+fqNLrKEpjxqbq47800VjMAAccJ0V6hloKFRJevZ1jyVKCbp7Y/G18EDfrYXTJIQYoHXuHQht2iZYB5bQDmRFk+26MOxnFYpxN61WC2RPPEl1hyTZeyEHEXgBBqHT1QoX34EoJQVbcQWZ6c59bVm9qlVxpzrgRsfdrSxrj6XxlQRVY3Qb1kQQvPavhR5UiazaIvmlll5cWimigZb4=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 032b63a8-b94d-4125-2196-08d7209c7eec
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2019 09:48:01.0497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1cJup7C74HSirz/J66OznZIM1P/EwIGFvZsok3ZPDe6olYwbwdaMWNnUERoEVibIJ/bUri7b1oM6WCPZiXEAcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3297
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
Cc: Roy Zang <roy.zang@nxp.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "M.h. Lian" <minghuan.lian@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTG9yZW56byBQaWVyYWxp
c2kgPGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20+DQo+IFNlbnQ6IDIwMTnE6jjUwjE0yNUgMTc6
MzANCj4gVG86IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiBDYzogTS5oLiBM
aWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+OyBNaW5na2FpIEh1DQo+IDxtaW5na2FpLmh1QG54
cC5jb20+OyBSb3kgWmFuZyA8cm95LnphbmdAbnhwLmNvbT47DQo+IGJoZWxnYWFzQGdvb2dsZS5j
b207IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnOw0KPiBsaW51eC1wY2lAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtQQVRDSHY2IDEvMl0gUENJOiBs
YXllcnNjYXBlOiBBZGQgdGhlIGJhcl9maXhlZF82NGJpdCBwcm9wZXJ0eQ0KPiBpbiBFUCBkcml2
ZXIuDQo+IA0KPiBJIGFza2VkIHlvdSB0byByZW1vdmUgdGhlIHBlcmlvZCBhdCB0aGUgZW5kIG9m
IHRoZSBwYXRjaCAkU1VCSkVDVCBhbmQgeW91DQo+IGRpZCBub3QsIGVpdGhlciB5b3UgZG8gbm90
IHJlYWQgd2hhdCBJIHdyaXRlIG9yIGV4cGxhaW4gbWUgd2hhdCdzIGdvaW5nIG9uLg0KU29ycnks
IEkgZGlkbid0IHVuZGVyc3RhbmQgdGhlIG1lYW5pbmcgb2YgcGVyaW9kIGNvcnJlY3RseSBiZWZv
cmUuIA0KPiANCj4gT24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMTA6MDM6MjlBTSArMDgwMCwgWGlh
b3dlaSBCYW8gd3JvdGU6DQo+ID4gVGhlIFBDSWUgY29udHJvbGxlciBvZiBsYXllcnNjYXBlIGp1
c3QgaGF2ZSA0IEJBUnMsIEJBUjAgYW5kIEJBUjEgaXMNCj4gPiAzMmJpdCwgQkFSMiBhbmQgQkFS
NCBpcyA2NGJpdCwgdGhpcyBpcyBkZXRlcm1pbmVkIGJ5IGhhcmR3YXJlLCBzbyBzZXQNCj4gPiB0
aGUgYmFyX2ZpeGVkXzY0Yml0IHdpdGggMHgxNC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFhp
YW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiANCj4gS2lzaG9uIEFDSydlZCB0aGlz
IHBhdGNoIGFuZCB5b3UgaGF2ZSBub3QgY2FycmllZCBoaXMgdGFnLg0KPiANCj4gSSB3aWxsIG1h
a2UgdGhlc2UgY2hhbmdlcyBidXQgdGhhdCdzIHRoZSBsYXN0IHRpbWUgSSBkbyB0aGF0IGZvciB5
b3UuDQpUaGFua3MgYSBsb3QsIHlvdXIgbWVhbnMgaXMgdGhhdCBJIGRvbid0IG5lZWQgdG8gc2Vu
ZCB0aGUgdjcgcGF0Y2ggYW5kIHlvdSBoZWxwIG1lIHRvDQpDb3JyZWN0IHRoaXMgcGF0Y2gsIHll
cz8gVGhhbmtzIGEgbG90IGZvciB5b3VyIGhlbHAgYWJvdXQgdGhlIHJ1bGVzIG9mIHRoZSB1cHN0
cmVhbS4gSSB3aWxsDQpDb3JyZWN0IHRoaXMgZXJyb3IgbmV4dCB0aW1lLiBeLl4gDQo+IA0KPiBM
b3JlbnpvDQo+IA0KPiA+IC0tLQ0KPiA+IHYyOg0KPiA+ICAtIFJlcGxhY2UgdmFsdWUgMHgxNCB3
aXRoIGEgbWFjcm8uDQo+ID4gdjM6DQo+ID4gIC0gTm8gY2hhbmdlLg0KPiA+IHY0Og0KPiA+ICAt
IHNlbmQgdGhlIHBhdGNoIGFnYWluIHdpdGggJy0tdG8nLg0KPiA+IHY1Og0KPiA+ICAtIGZpeCB0
aGUgY29tbWl0IG1lc3NhZ2UuDQo+ID4gdjY6DQo+ID4gIC0gcmVtb3ZlIHRoZSBbRVhUXSB0YWcg
b2YgdGhlICRTVUJKRUNUIGluIGVtYWlsLg0KPiA+DQo+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMgfCAxICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+IGluZGV4IGJlNjFkOTYuLmNhOWFhNDUgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAu
Yw0KPiA+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVw
LmMNCj4gPiBAQCAtNDQsNiArNDQsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9lcGNfZmVh
dHVyZXMNCj4gbHNfcGNpZV9lcGNfZmVhdHVyZXMgPSB7DQo+ID4gIAkubGlua3VwX25vdGlmaWVy
ID0gZmFsc2UsDQo+ID4gIAkubXNpX2NhcGFibGUgPSB0cnVlLA0KPiA+ICAJLm1zaXhfY2FwYWJs
ZSA9IGZhbHNlLA0KPiA+ICsJLmJhcl9maXhlZF82NGJpdCA9ICgxIDw8IEJBUl8yKSB8ICgxIDw8
IEJBUl80KSwNCj4gPiAgfTsNCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9lcGNf
ZmVhdHVyZXMqDQo+ID4gLS0NCj4gPiAyLjkuNQ0KPiA+DQo=
