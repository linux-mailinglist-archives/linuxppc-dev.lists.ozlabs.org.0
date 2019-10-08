Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 074EBCF08D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 03:33:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nKbr5Sg0zDqPC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 12:32:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.75; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="SAECd+P9"; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70075.outbound.protection.outlook.com [40.107.7.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nKPd02J5zDqBh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2019 12:24:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AGbRK+cO4Hn0tyormGesEL6umKnqcKc6bwMlcis/jgMTAKxgizhLi/Rm54uFQai8C1HFHJ/EgucERlSgK3OfsQS3oIe+YK1icTpz69OxxiBGKuTFKx1SmTwDG/HMRAhBcaC01ZZeDeHx+/qZqq6eYHKRzbEDfk1QJWpJ2cwSf52PLdkIFey0tXy2LSfEk0ujHZ2J0GgGjifs32um7BN35yfkvUO4rI2Cc/GBHOpTOuKhpjW2dXRpmbLRxaQXl43Iko5x81uL+q98U/ZRDNDC5b+vBDXovuvDuCVqaRISpDQkdxrHiJxSghqmCHw+jNJI7JDO7SJSJvYIYIVNhqg1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXdl6zGKYQr3UqXF+Q4qnSOYWnnZNBZXfydR2SOhWtU=;
 b=LSUEce54jO6KJzGfvd1QaMH34HkQ8UTuMo/C/WI6LCAxjYNm7+mQta9Mbg0lqbyUlW5tZlSqAlssJ3Ig+u30W/i94SAAr/fN+/ywlETT53tWU3xlxbHJc5oT/5H1aaW6pCS8993nhBoY6s94vI8tsOBrxPlWGdZhR/zdZ9RavygnlFKlReEQ6DQ+F6JQySDfeEMzaNULL+3VtGd1MhXv81XSe/T9PAi/qawFZW0GxBAkow3Q5VRCKIxvTju0BuHS6i9BNEC0NhyW00cH0T1p+DtYAYi+hGuW1svcllDj3ASVYIOgLlFlXZx+WzyJR/tCYh0Y3ZK1Ez4fVQ6DrklMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PXdl6zGKYQr3UqXF+Q4qnSOYWnnZNBZXfydR2SOhWtU=;
 b=SAECd+P9mCNGogUFk24tXdUux0039itunft1wp/sEvZiVVKfa4TY5xvxoCuXIWn22uyrWhhcsDi2Uio6zdMOdbU5E45ET0Cpi8Hdy9ApYHCb9avwmiVRINteUuBRBh5jbEa0xEYhew49SOSOCVa2QQNR6fU8L+bIxc/ZodY4SKY=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3027.eurprd04.prod.outlook.com (10.173.254.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Tue, 8 Oct 2019 01:23:55 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41%3]) with mapi id 15.20.2305.023; Tue, 8 Oct 2019
 01:23:55 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v4 11/11] misc: pci_endpoint_test: Add LS1088a in
 pci_device_id table
Thread-Topic: [PATCH v4 11/11] misc: pci_endpoint_test: Add LS1088a in
 pci_device_id table
Thread-Index: AQHVcn/x16DzWe6fqE+HQYFU7grjl6dEWbwAgAuvO5A=
Date: Tue, 8 Oct 2019 01:23:55 +0000
Message-ID: <AM5PR04MB329958D65C0D0B5172FEBE07F59A0@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190924021849.3185-1-xiaowei.bao@nxp.com>
 <20190924021849.3185-12-xiaowei.bao@nxp.com>
 <20190930145723.GC42880@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190930145723.GC42880@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6a50e3b-2525-438e-9b04-08d74b8e3005
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: AM5PR04MB3027:|AM5PR04MB3027:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3027E3B88FE9BA9C30801119F59A0@AM5PR04MB3027.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(366004)(376002)(13464003)(199004)(189003)(305945005)(66446008)(64756008)(9686003)(6436002)(102836004)(76176011)(53546011)(229853002)(6506007)(256004)(8936002)(7416002)(14454004)(33656002)(81166006)(81156014)(4326008)(44832011)(54906003)(66476007)(478600001)(66556008)(74316002)(316002)(8676002)(6246003)(55016002)(52536014)(6116002)(86362001)(25786009)(26005)(71190400001)(71200400001)(7696005)(7736002)(486006)(2906002)(76116006)(11346002)(446003)(5660300002)(66066001)(66946007)(6916009)(3846002)(186003)(99286004)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3027;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wTa4eLZVGRwiH5mvZdD9d4dvHBKed8mHXgExF3snZqV7NTFpr3f2NzQKH5l9mdRhVdyTUDide3mtdHPA/8ccdU2s68cXiO9iDkL1rd6yktcC4cohu6Qdm/+r7+3f76ze9tTe3phqrshiypZ2WuMtPjWIu2U/cTn5sdNpMOmbf3EmHP8z5kQLp7eyKR/BTx4UXPke901+SdjEtlVJJ/zB+MdmYrYR8wj1W4WmOk/HmKeKT1a+OuoU+Ol3qEKvCYcACQVRqv9UL6gqeMYLbg7INqYkS+vPg2hVnON+FbxKJ4awdZgWdF16WA+W5C7hpXcre702+cSbioWvzouNX+/EWdSNKSr2Kg5Wp5F63NN1gvUTcnhSsGhO7G4zLYwHNr+tyBJ7v/lqRnbxgfbf4O6SvCYq1dv5OoMHAFnUFp6eDO8=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a50e3b-2525-438e-9b04-08d74b8e3005
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 01:23:55.8358 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ZQfdJQG7kEn+VRMm8DaviIrY2kXwnl/5vHTpx0CRCdmdxwlh+x+XFJA9wmJPdb18GvHWMBTGxqZQoVruRw8EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3027
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
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IE11cnJheSA8
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE5xOo51MIzMMjVIDIyOjU3DQo+IFRv
OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gQ2M6IHJvYmgrZHRAa2VybmVs
Lm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207IHNoYXduZ3VvQGtlcm5lbC5vcmc7IExlbw0KPiBM
aSA8bGVveWFuZy5saUBueHAuY29tPjsga2lzaG9uQHRpLmNvbTsgbG9yZW56by5waWVyYWxpc2lA
YXJtLmNvbTsgTS5oLg0KPiBMaWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+OyBNaW5na2FpIEh1
IDxtaW5na2FpLmh1QG54cC5jb20+OyBSb3kNCj4gWmFuZyA8cm95LnphbmdAbnhwLmNvbT47IGpp
bmdvb2hhbjFAZ21haWwuY29tOw0KPiBndXN0YXZvLnBpbWVudGVsQHN5bm9wc3lzLmNvbTsgbGlu
dXgtcGNpQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRl
YWQub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2NCAxMS8xMV0gbWlzYzogcGNpX2VuZHBvaW50X3Rlc3Q6IEFkZCBMUzEwODhhIGlu
DQo+IHBjaV9kZXZpY2VfaWQgdGFibGUNCj4gDQo+IE9uIFR1ZSwgU2VwIDI0LCAyMDE5IGF0IDEw
OjE4OjQ5QU0gKzA4MDAsIFhpYW93ZWkgQmFvIHdyb3RlOg0KPiA+IEFkZCBMUzEwODhhIGluIHBj
aV9kZXZpY2VfaWQgdGFibGUgc28gdGhhdCBwY2ktZXBmLXRlc3QgY2FuIGJlIHVzZWQNCj4gPiBm
b3IgdGVzdGluZyBQQ0llIEVQIGluIExTMTA4OGEuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBY
aWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gPiAtLS0NCj4gPiB2MjoNCj4gPiAg
LSBObyBjaGFuZ2UuDQo+ID4gdjM6DQo+ID4gIC0gTm8gY2hhbmdlLg0KPiA+IHY0Og0KPiA+ICAt
IFVzZSBhIG1hY28gdG8gZGVmaW5lIHRoZSBMUzEwODhhIGRldmljZSBJRC4NCj4gPg0KPiA+ICBk
cml2ZXJzL21pc2MvcGNpX2VuZHBvaW50X3Rlc3QuYyB8IDIgKysNCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9w
Y2lfZW5kcG9pbnRfdGVzdC5jDQo+ID4gYi9kcml2ZXJzL21pc2MvcGNpX2VuZHBvaW50X3Rlc3Qu
Yw0KPiA+IGluZGV4IDZlMjA4YTAuLjhjMjIyYTYgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9t
aXNjL3BjaV9lbmRwb2ludF90ZXN0LmMNCj4gPiArKysgYi9kcml2ZXJzL21pc2MvcGNpX2VuZHBv
aW50X3Rlc3QuYw0KPiA+IEBAIC02NSw2ICs2NSw3IEBADQo+ID4gICNkZWZpbmUgUENJX0VORFBP
SU5UX1RFU1RfSVJRX05VTUJFUgkJMHgyOA0KPiA+DQo+ID4gICNkZWZpbmUgUENJX0RFVklDRV9J
RF9USV9BTTY1NAkJCTB4YjAwYw0KPiA+ICsjZGVmaW5lIFBDSV9ERVZJQ0VfSURfTFMxMDg4QQkJ
CTB4ODBjMA0KPiANCj4gUmV2aWV3ZWQtYnk6IEFuZHJldyBNdXJyYXkgPGFuZHJldy5tdXJyYXlA
YXJtLmNvbT4NCg0KVGhhbmtzIEFuZHJldy4NCg0KPiANCj4gPg0KPiA+ICAjZGVmaW5lIGlzX2Ft
NjU0X3BjaV9kZXYocGRldikJCVwNCj4gPiAgCQkoKHBkZXYpLT5kZXZpY2UgPT0gUENJX0RFVklD
RV9JRF9USV9BTTY1NCkgQEAgLTc5Myw2ICs3OTQsNw0KPiBAQA0KPiA+IHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lfZW5kcG9pbnRfdGVzdF90YmxbXSA9IHsNCj4gPiAgCXsg
UENJX0RFVklDRShQQ0lfVkVORE9SX0lEX1RJLCBQQ0lfREVWSUNFX0lEX1RJX0RSQTc0eCkgfSwN
Cj4gPiAgCXsgUENJX0RFVklDRShQQ0lfVkVORE9SX0lEX1RJLCBQQ0lfREVWSUNFX0lEX1RJX0RS
QTcyeCkgfSwNCj4gPiAgCXsgUENJX0RFVklDRShQQ0lfVkVORE9SX0lEX0ZSRUVTQ0FMRSwgMHg4
MWMwKSB9LA0KPiA+ICsJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfRlJFRVNDQUxFLCBQQ0lf
REVWSUNFX0lEX0xTMTA4OEEpIH0sDQo+ID4gIAl7IFBDSV9ERVZJQ0VfREFUQShTWU5PUFNZUywg
RUREQSwgTlVMTCkgfSwNCj4gPiAgCXsgUENJX0RFVklDRShQQ0lfVkVORE9SX0lEX1RJLCBQQ0lf
REVWSUNFX0lEX1RJX0FNNjU0KSwNCj4gPiAgCSAgLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9u
Z190KSZhbTY1NF9kYXRhDQo+ID4gLS0NCj4gPiAyLjkuNQ0KPiA+DQo=
