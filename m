Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 652A19B920
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 01:52:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FdVV6YWQzDrTL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 09:52:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=2a01:111:f400:fe06::62e;
 helo=eur02-ve1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="LVOiuIkd"; 
 dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::62e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FdSX4WCPzDrj0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 09:50:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJuMl3xCyFeBHl2T57o2p3ziYL2jq6kRh/R/cAG4N/PlrxMCVMzi0OP6hreHevoq6E5bULY3C+BWiEsLE+UeHj1YvkuiGTtIcpI0Xjki9oGeftoHJKfraZPTcRmMsxCXXRhcfwkC6tYF2SwIBvs7kVC34Xjxke/Fj6EHI9bbvsv6awoKyfwqtRGK23vJAcSyvEm1Ah+bs4BI1JHqHE+KlOf+FPqDpkVZbdV7W6JVvtsbWx6UyzjMBaAhZSLUgeVpbpfGh5//YdV2Ht/3OAjEITx5zjtMCZqArcjsz23/ZXZISuV6uytogp0WbJmSJgUf6mpsE38do8pYBidSncFDug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjkJVG2wmvosWEb6dgTdwtjCNlxYeDwm8dzidUUvO4g=;
 b=hMe5Pgl7ZKOdnbX5het3iOnFMRN5zog4fBtlngfNRRcTLPOPfPP8tU3SjghVuNjyzm/CABdeH8LKFivHsbw4DO5Fr7FRnDMKVSA5f4Xqcpkb6+wjhtyfwi1Y4LmZeL41ozFqA2RBnQbgWY2ay1s5YdRzj0IxMzz+uLqPAwdb/DUjFMMXmZ+AtxTaSnYPdgoqUS45m2DFg41K4NGg9g2ZIdsNEMwU1PWXOPn/Y4YdhWXy1eNY0aq4Wqe9XqcO+tmqy5wKT/3q7WGakZGSFQbvO6SdELSA2FucXGeOcfeyJLKSHKkaosvdLD6UIQQr2GjJfDqyxAP38UBJ+0vbgbDwmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cjkJVG2wmvosWEb6dgTdwtjCNlxYeDwm8dzidUUvO4g=;
 b=LVOiuIkd4rnYqXVOQZ0/Onvf+F0RNOk2LgUvO2Qj8eVGKX5EMJzzXq6JY9YO3RRHa+E7fGV/9cYcjiIemY6zcNjhCieMzVsn0AanV/pj64PRNLSnGO+2sw/1LWYxWpYG+GDAylUhlVTEfjkIhdUB7YK/PmnYO1sIQlnH+lQMAZk=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3204.eurprd04.prod.outlook.com (10.167.169.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 23 Aug 2019 23:50:20 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043%7]) with mapi id 15.20.2178.020; Fri, 23 Aug 2019
 23:50:20 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v2 01/10] PCI: designware-ep: Add multiple PFs support for
 DWC
Thread-Topic: [PATCH v2 01/10] PCI: designware-ep: Add multiple PFs support
 for DWC
Thread-Index: AQHVWN1XqJsEwTOtZUerW0hTYPLFmKcIurgAgACceVA=
Date: Fri, 23 Aug 2019 23:50:20 +0000
Message-ID: <AM5PR04MB32997FFCD08E2C34541D2F9BF5A40@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190823132526.GD14582@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190823132526.GD14582@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a8d5280-3059-4f20-92bd-08d72824a868
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:AM5PR04MB3204; 
x-ms-traffictypediagnostic: AM5PR04MB3204:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3204C7D7E72E152FFF21DAABF5A40@AM5PR04MB3204.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(13464003)(199004)(189003)(81156014)(76176011)(52536014)(6916009)(229853002)(316002)(54906003)(99286004)(86362001)(55016002)(478600001)(9686003)(30864003)(14454004)(7696005)(66066001)(6436002)(33656002)(71190400001)(71200400001)(446003)(11346002)(6506007)(7416002)(305945005)(74316002)(102836004)(26005)(53546011)(186003)(8676002)(6246003)(81166006)(476003)(6116002)(3846002)(2906002)(53936002)(256004)(7736002)(5660300002)(66946007)(76116006)(66476007)(44832011)(66446008)(486006)(66556008)(64756008)(25786009)(4326008)(8936002)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3204;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZntXTw0KVmJaqICsUcPcEESWRX+DeJrBer2VvsMXqfHCJE0WyskUhMVFvG2Rpbdzf+E/Z3sKNTjeaS/cgaEhvm/hAmad035lkrstKOxFWQT5jLxl7xdrYN4/CvLwbsfYV85l94SGSfQfm88IQXkGvHwb+f3WPBwA348gv4WBkfE1KXsXaarRYcNObUyA023Ar2oQYOIM8+HtoirIzAxExgyvb4wvHVnW8NrWxuHQg4ocANMAB3LIWK1dZHHOGZECtd58kg4EgJnUOGLCL3/iC3cq+bOQgvwE/M3s2mKyC0RhTiFQQ7K0EfY5hSd+78a2bSY6blEYgS3nY+mhYCtQPO7/0OFM09B6wYNaf6phBPPMZ4n+4DWa0tMaktYeESUzB7esi9mzhGKRlmCyRorntwkrK4WH6lv0a5NatwanVJc=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a8d5280-3059-4f20-92bd-08d72824a868
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 23:50:20.3584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YIClDPlimB+jDC+Tc41dqQlsuIDpmOhkEHVXWDUgMy+AlDdE4ry23U7Lh5ogdcymOqLctFdA2f5uqdrcD0hqBg==
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
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE5xOo41MIyM8jVIDIxOjI1DQo+IFRv
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
amVjdDogUmU6IFtQQVRDSCB2MiAwMS8xMF0gUENJOiBkZXNpZ253YXJlLWVwOiBBZGQgbXVsdGlw
bGUgUEZzIHN1cHBvcnQNCj4gZm9yIERXQw0KPiANCj4gT24gVGh1LCBBdWcgMjIsIDIwMTkgYXQg
MDc6MjI6MzNQTSArMDgwMCwgWGlhb3dlaSBCYW8gd3JvdGU6DQo+ID4gQWRkIG11bHRpcGxlIFBG
cyBzdXBwb3J0IGZvciBEV0MsIGRpZmZlcmVudCBQRiBoYXZlIGRpZmZlcmVudCBjb25maWcNCj4g
PiBzcGFjZSB3ZSB1c2UgcGYtb2Zmc2V0IHByb3BlcnR5IHdoaWNoIGdldCBmcm9tIHRoZSBEVFMg
dG8gYWNjZXNzIHRoZQ0KPiA+IGRpZmZlcmVudCBwRiBjb25maWcgc3BhY2UuDQo+IA0KPiBJdCBs
b29rcyBsaWtlIHlvdSdyZSBtaXNzaW5nIGEgLS1jb3Zlci1sZXR0ZXIgYWdhaW4uDQo+IA0KPiA+
DQo+ID4gU2lnbmVkLW9mZi1ieTogWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54cC5jb20+DQo+
ID4gLS0tDQo+ID4gdjI6DQo+ID4gIC0gUmVtb3ZlIGR1cGxpY2F0ZSByZWR1bmRhbnQgY29kZS4N
Cj4gPiAgLSBSZWltcGxlbWVudCB0aGUgUEYgY29uZmlnIHNwYWNlIGFjY2VzcyB3YXkuDQo+ID4N
Cj4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWVwLmMgfCAx
MjINCj4gKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xs
ZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5jICAgIHwgIDU5ICsrKysrKysrLS0tLQ0KPiA+ICBkcml2
ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUuaCAgICB8ICAxMSArKy0NCj4g
PiAgMyBmaWxlcyBjaGFuZ2VkLCAxMzQgaW5zZXJ0aW9ucygrKSwgNTggZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNp
Z253YXJlLWVwLmMNCj4gPiBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdu
d2FyZS1lcC5jDQo+ID4gaW5kZXggMmJmNWEzNS4uM2UyYjc0MCAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUtZXAuYw0KPiA+ICsrKyBi
L2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1lcC5jDQo+ID4gQEAg
LTE5LDEyICsxOSwxNyBAQCB2b2lkIGR3X3BjaWVfZXBfbGlua3VwKHN0cnVjdCBkd19wY2llX2Vw
ICplcCkNCj4gPiAgCXBjaV9lcGNfbGlua3VwKGVwYyk7DQo+ID4gIH0NCj4gPg0KPiA+IC1zdGF0
aWMgdm9pZCBfX2R3X3BjaWVfZXBfcmVzZXRfYmFyKHN0cnVjdCBkd19wY2llICpwY2ksIGVudW0g
cGNpX2Jhcm5vDQo+IGJhciwNCj4gPiAtCQkJCSAgIGludCBmbGFncykNCj4gPiArc3RhdGljIHZv
aWQgX19kd19wY2llX2VwX3Jlc2V0X2JhcihzdHJ1Y3QgZHdfcGNpZSAqcGNpLCB1OCBmdW5jX25v
LA0KPiA+ICsJCQkJICAgZW51bSBwY2lfYmFybm8gYmFyLCBpbnQgZmxhZ3MpDQo+ID4gIHsNCj4g
PiAgCXUzMiByZWc7DQo+ID4gKwl1bnNpZ25lZCBpbnQgZnVuY19vZmZzZXQgPSAwOw0KPiA+ICsJ
c3RydWN0IGR3X3BjaWVfZXAgKmVwID0gJnBjaS0+ZXA7DQo+ID4NCj4gPiAtCXJlZyA9IFBDSV9C
QVNFX0FERFJFU1NfMCArICg0ICogYmFyKTsNCj4gPiArCWlmIChlcC0+b3BzLT5mdW5jX2NvbmZf
c2VsZWN0KQ0KPiA+ICsJCWZ1bmNfb2Zmc2V0ID0gZXAtPm9wcy0+ZnVuY19jb25mX3NlbGVjdChl
cCwgZnVuY19ubyk7DQo+ID4gKw0KPiA+ICsJcmVnID0gZnVuY19vZmZzZXQgKyBQQ0lfQkFTRV9B
RERSRVNTXzAgKyAoNCAqIGJhcik7DQo+IA0KPiBUaGlzIHBhdHRlcm4gb2YgY2hlY2tpbmcgaWYg
ZnVuY19jb25mX3NlbGVjdCBleGlzdHMgYW5kIHVzaW5nIGl0IHRvIGdldCBhbiBvZmZzZXQNCj4g
aXMgcmVwZWF0ZWQgYSBsb3QgdGhyb3VnaG91dCB0aGlzIGZpbGUuIFlvdSBjb3VsZCBtb3ZlIHRo
aXMgZnVuY3Rpb25hbGl0eSBpbnRvIGENCj4gbmV3IGZ1bmN0aW9uIChzaW1pbGFyIHRvIGR3X3Bj
aWVfcmVhZF9kYmkgZXRjKS4gT3IgcGVyaGFwcyBhIG5ldyB2YXJpYW50IG9mDQo+IGR3X3BjaWVf
d3JpdGVsXyBzaG91bGQgYmUgY3JlYXRlZCB0aGF0IHdyaXRlcyB0YWtlcyBhIGZ1bmNfbm8gYXJn
dW1lbnQuDQoNClRoYW5rcyBmb3IgeW91ciBjb21tZW50cywgSSB0aG91Z2h0IGFib3V0IHRoaXMg
bWV0aG9kIGJlZm9yZSwgYnV0IHRoZXJlIGlzIGEgaXNzdWUNCmFib3V0IHRoZSBtZXRob2Qgb2Yg
YWNjZXNzIHRoZSBkaWZmZXJlbnQgZnVuYyBjb25maWcgc3BhY2UsIGR1ZSB0byBvdXIgcGxhdGZv
cm0gdXNlDQp0aGlzIG1ldGhvZCB0aGF0IGRpZmZlcmVudCBmdW5jIGhhdmUgZGlmZmVyZW50IG9m
ZnNldCBmcm9tIGRiaV9iYXNlIHRvIGFjY2VzcyB0aGUNCmRpZmZlcmVudCBjb25maWcgc3BhY2Us
IGJ1dCBvdGhlcnMgcGxhdGZvcm0gbWF5YmUgdXNlIHRoZSB3YXkgdGhhdCB3cml0ZSBhIHJlZ2lz
dGVyDQp0byBpbXBsZW1lbnQgZGlmZmVyZW50IGZ1bmMgY29uZmlnIHNwYWNlIGFjY2Vzcywgc28g
SSB0aGluayByZXNlcnZlIGEgY2FsbGJhY2sgZnVuY3Rpb24gDQp0byBkaWZmZXJlbnQgcGxhdGZv
cm0gdG8gaW1wbGVtZW50IHRoZSBvd24gbWV0aG9kLCBteSBwb2ludCBpcyB0aGF0LCBpZiB1c2Ug
cmVnaXN0ZXIgDQptZXRob2QgdGhleSBjYW4gaW1wbGVtZW50IHRoZSBjb2RlIGluIHRoaXMgZnVu
Y3Rpb24gYW5kIHJldHVybiBvZmZzZXQgaXMgMCwgaWYgdXNlIA0Kb2Zmc2V0IG1ldGhvZCwgdGhl
eSBjYW4gcmV0dXJuIHRoZSBvZmZzZXQgdmFsdWUgd2hpY2ggY2FuIGJlIHVzZSBieSBkd19wY2ll
X2VwIGRyaXZlci4NCiANCj4gDQo+IA0KPiA+ICAJZHdfcGNpZV9kYmlfcm9fd3JfZW4ocGNpKTsN
Cj4gPiAgCWR3X3BjaWVfd3JpdGVsX2RiaTIocGNpLCByZWcsIDB4MCk7DQo+ID4gIAlkd19wY2ll
X3dyaXRlbF9kYmkocGNpLCByZWcsIDB4MCk7DQo+IA0KPiANCj4gPiBAQCAtMjM1LDcgKzI1Nyw3
IEBAIHN0YXRpYyBpbnQgZHdfcGNpZV9lcF9tYXBfYWRkcihzdHJ1Y3QgcGNpX2VwYw0KPiAqZXBj
LCB1OCBmdW5jX25vLA0KPiA+ICAJc3RydWN0IGR3X3BjaWVfZXAgKmVwID0gZXBjX2dldF9kcnZk
YXRhKGVwYyk7DQo+ID4gIAlzdHJ1Y3QgZHdfcGNpZSAqcGNpID0gdG9fZHdfcGNpZV9mcm9tX2Vw
KGVwKTsNCj4gPg0KPiA+IC0JcmV0ID0gZHdfcGNpZV9lcF9vdXRib3VuZF9hdHUoZXAsIGFkZHIs
IHBjaV9hZGRyLCBzaXplKTsNCj4gPiArCXJldCA9IGR3X3BjaWVfZXBfb3V0Ym91bmRfYXR1KGVw
LCBmdW5jX25vLCBhZGRyLCBwY2lfYWRkciwgc2l6ZSk7DQo+ID4gIAlpZiAocmV0KSB7DQo+ID4g
IAkJZGV2X2VycihwY2ktPmRldiwgIkZhaWxlZCB0byBlbmFibGUgYWRkcmVzc1xuIik7DQo+ID4g
IAkJcmV0dXJuIHJldDsNCj4gPiBAQCAtMjQ5LDExICsyNzEsMTUgQEAgc3RhdGljIGludCBkd19w
Y2llX2VwX2dldF9tc2koc3RydWN0IHBjaV9lcGMNCj4gKmVwYywgdTggZnVuY19ubykNCj4gPiAg
CXN0cnVjdCBkd19wY2llX2VwICplcCA9IGVwY19nZXRfZHJ2ZGF0YShlcGMpOw0KPiA+ICAJc3Ry
dWN0IGR3X3BjaWUgKnBjaSA9IHRvX2R3X3BjaWVfZnJvbV9lcChlcCk7DQo+ID4gIAl1MzIgdmFs
LCByZWc7DQo+ID4gKwl1bnNpZ25lZCBpbnQgZnVuY19vZmZzZXQgPSAwOw0KPiA+ICsNCj4gPiAr
CWlmIChlcC0+b3BzLT5mdW5jX2NvbmZfc2VsZWN0KQ0KPiA+ICsJCWZ1bmNfb2Zmc2V0ID0gZXAt
Pm9wcy0+ZnVuY19jb25mX3NlbGVjdChlcCwgZnVuY19ubyk7DQo+ID4NCj4gPiAgCWlmICghZXAt
Pm1zaV9jYXApDQo+ID4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ID4NCj4gPiAtCXJlZyA9IGVwLT5t
c2lfY2FwICsgUENJX01TSV9GTEFHUzsNCj4gPiArCXJlZyA9IGVwLT5tc2lfY2FwICsgZnVuY19v
ZmZzZXQgKyBQQ0lfTVNJX0ZMQUdTOw0KPiANCj4gVGhpcyBtYWtlcyBtZSBuZXJ2b3VzLg0KPiAN
Cj4gRnJvbSBhIFBDSSB2aWV3cG9pbnQsIGVhY2ggZnVuY3Rpb24gaGFzIGl0J3Mgb3duIGNhcGFi
aWxpdHkgc3RydWN0dXJlIGFuZA0KPiB3aXRoaW4gZWFjaCBmdW5jdGlvbiB0aGVyZSBtYXkgZXhp
c3QgYSBNU0kgY2FwYWJpbGl0eS4gWWV0IHdoYXQgd2UncmUgZG9pbmcNCj4gaGVyZSBpcyB1c2lu
ZyBkd19wY2llX2VwX2ZpbmRfY2FwYWJpbGl0eSB0byBnZXQgdGhlIGxpc3Qgb2YgY2FwYWJpbGl0
aWVzIGZvcg0KPiBmdW5jdGlvbiAwLCBhbmQgdGhlbiBhcHBseWluZyBvZmZzZXRzIGZyb20gdGhh
dCBmb3Igc3Vic2VxdWVudCBmdW5jdGlvbnMuIEkuZS4NCj4gd2UncmUgYXBwbHlpbmcgRFcgc3Bl
Y2lmaWMga25vd2xlZGdlIHRvIGZpbmQgdGhlIGNvcnJlY3QgY2FwYWJpbGl0eSwgcmF0aGVyDQo+
IHRoYW4gZm9sbG93aW5nIHRoZSBnZW5lcmFsIFBDSSBhcHByb2FjaC4NCj4gDQo+IEkgdGhpbmsg
dGhlIGFib3ZlIGh1bmsgc2hvdWxkbid0IGJlIHJlcXVpcmVkIC0gYnV0IGluc3RlYWQNCj4gZHdf
cGNpZV9lcF9maW5kX2NhcGFiaWxpdHkgaXMgdXBkYXRlZCB0byB0YWtlIGEgZnVuY19ubyBwYXJh
bWV0ZXIuDQo+IA0KPiBIYXZlIEkgdW5kZXJzdG9vZCB0aGlzIGNvcnJlY3RseT8NCg0KWWVzLCB0
aGlzIGlzIGEgaXNzdWUsIEkgdGhpbmsgdGhlIGRpZmZlcmVudCBmdW5jIG1heWJlIGhhdmUgZGlm
ZmVyZW50IGNhcGFiaWxpdHksDQpidXQgdGhlIGR3X3BjaWVfZXBfZmluZF9jYXBhYmlsaXR5IGZ1
bmN0aW9uIGlzIGNhbGxlZCBieSBkd19wY2llX2VwX2luaXQgDQpmdW5jdGlvbiwgd2UgY2FuJ3Qg
YWRkIGZ1bmNfbm8gcGFyYW1ldGVyIHRvIGR3X3BjaWVfZXBfZmluZF9jYXBhYmlsaXR5LA0KSSB3
aWxsIHRyeSB0byBmaXggaXQgdXNlIGEgbmV3IHBhdGNoLCBJIHRoaW5rIG1vdmUgdGhpcyBmdW5j
dGlvbiB0byBlcF9pbml0IGNhbGxiYWNrDQpmdW5jdGlvbiBJZiBiZXR0ZXIsIHRoYW5rcy4gDQoN
Cg0KPiANCj4gPiAgCXZhbCA9IGR3X3BjaWVfcmVhZHdfZGJpKHBjaSwgcmVnKTsNCj4gPiAgCWlm
ICghKHZhbCAmIFBDSV9NU0lfRkxBR1NfRU5BQkxFKSkNCj4gPiAgCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gPiBAQCAtMjY4LDExICsyOTQsMTUgQEAgc3RhdGljIGludCBkd19wY2llX2VwX3NldF9tc2ko
c3RydWN0IHBjaV9lcGMNCj4gKmVwYywgdTggZnVuY19ubywgdTggaW50ZXJydXB0cykNCj4gPiAg
CXN0cnVjdCBkd19wY2llX2VwICplcCA9IGVwY19nZXRfZHJ2ZGF0YShlcGMpOw0KPiA+ICAJc3Ry
dWN0IGR3X3BjaWUgKnBjaSA9IHRvX2R3X3BjaWVfZnJvbV9lcChlcCk7DQo+ID4gIAl1MzIgdmFs
LCByZWc7DQo+ID4gKwl1bnNpZ25lZCBpbnQgZnVuY19vZmZzZXQgPSAwOw0KPiA+ICsNCj4gPiAr
CWlmIChlcC0+b3BzLT5mdW5jX2NvbmZfc2VsZWN0KQ0KPiA+ICsJCWZ1bmNfb2Zmc2V0ID0gZXAt
Pm9wcy0+ZnVuY19jb25mX3NlbGVjdChlcCwgZnVuY19ubyk7DQo+ID4NCj4gPiAgCWlmICghZXAt
Pm1zaV9jYXApDQo+ID4gIAkJcmV0dXJuIC1FSU5WQUw7DQo+ID4NCj4gPiAtCXJlZyA9IGVwLT5t
c2lfY2FwICsgUENJX01TSV9GTEFHUzsNCj4gPiArCXJlZyA9IGVwLT5tc2lfY2FwICsgZnVuY19v
ZmZzZXQgKyBQQ0lfTVNJX0ZMQUdTOw0KPiA+ICAJdmFsID0gZHdfcGNpZV9yZWFkd19kYmkocGNp
LCByZWcpOw0KPiA+ICAJdmFsICY9IH5QQ0lfTVNJX0ZMQUdTX1FNQVNLOw0KPiA+ICAJdmFsIHw9
IChpbnRlcnJ1cHRzIDw8IDEpICYgUENJX01TSV9GTEFHU19RTUFTSzsgQEAgLTI4OCwxMSArMzE4
LDE1DQo+ID4gQEAgc3RhdGljIGludCBkd19wY2llX2VwX2dldF9tc2l4KHN0cnVjdCBwY2lfZXBj
ICplcGMsIHU4IGZ1bmNfbm8pDQo+ID4gIAlzdHJ1Y3QgZHdfcGNpZV9lcCAqZXAgPSBlcGNfZ2V0
X2RydmRhdGEoZXBjKTsNCj4gPiAgCXN0cnVjdCBkd19wY2llICpwY2kgPSB0b19kd19wY2llX2Zy
b21fZXAoZXApOw0KPiA+ICAJdTMyIHZhbCwgcmVnOw0KPiA+ICsJdW5zaWduZWQgaW50IGZ1bmNf
b2Zmc2V0ID0gMDsNCj4gPiArDQo+ID4gKwlpZiAoZXAtPm9wcy0+ZnVuY19jb25mX3NlbGVjdCkN
Cj4gPiArCQlmdW5jX29mZnNldCA9IGVwLT5vcHMtPmZ1bmNfY29uZl9zZWxlY3QoZXAsIGZ1bmNf
bm8pOw0KPiA+DQo+ID4gIAlpZiAoIWVwLT5tc2l4X2NhcCkNCj4gPiAgCQlyZXR1cm4gLUVJTlZB
TDsNCj4gPg0KPiA+IC0JcmVnID0gZXAtPm1zaXhfY2FwICsgUENJX01TSVhfRkxBR1M7DQo+ID4g
KwlyZWcgPSBlcC0+bXNpeF9jYXAgKyBmdW5jX29mZnNldCArIFBDSV9NU0lYX0ZMQUdTOw0KPiAN
Cj4gU2FtZSBmb3IgTVNJWC4NCg0KWWVzLg0KDQo+IA0KPiA+ICAJdmFsID0gZHdfcGNpZV9yZWFk
d19kYmkocGNpLCByZWcpOw0KPiA+ICAJaWYgKCEodmFsICYgUENJX01TSVhfRkxBR1NfRU5BQkxF
KSkNCj4gPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiBAQCAtMzA3LDExICszNDEsMTUgQEAgc3Rh
dGljIGludCBkd19wY2llX2VwX3NldF9tc2l4KHN0cnVjdCBwY2lfZXBjDQo+ICplcGMsIHU4IGZ1
bmNfbm8sIHUxNiBpbnRlcnJ1cHRzKQ0KPiA+ICAJc3RydWN0IGR3X3BjaWVfZXAgKmVwID0gZXBj
X2dldF9kcnZkYXRhKGVwYyk7DQo+ID4gIAlzdHJ1Y3QgZHdfcGNpZSAqcGNpID0gdG9fZHdfcGNp
ZV9mcm9tX2VwKGVwKTsNCj4gPiAgCXUzMiB2YWwsIHJlZzsNCj4gPiArCXVuc2lnbmVkIGludCBm
dW5jX29mZnNldCA9IDA7DQo+ID4gKw0KPiA+ICsJaWYgKGVwLT5vcHMtPmZ1bmNfY29uZl9zZWxl
Y3QpDQo+ID4gKwkJZnVuY19vZmZzZXQgPSBlcC0+b3BzLT5mdW5jX2NvbmZfc2VsZWN0KGVwLCBm
dW5jX25vKTsNCj4gPg0KPiA+ICAJaWYgKCFlcC0+bXNpeF9jYXApDQo+ID4gIAkJcmV0dXJuIC1F
SU5WQUw7DQo+ID4NCj4gPiAtCXJlZyA9IGVwLT5tc2l4X2NhcCArIFBDSV9NU0lYX0ZMQUdTOw0K
PiA+ICsJcmVnID0gZXAtPm1zaXhfY2FwICsgZnVuY19vZmZzZXQgKyBQQ0lfTVNJWF9GTEFHUzsN
Cj4gPiAgCXZhbCA9IGR3X3BjaWVfcmVhZHdfZGJpKHBjaSwgcmVnKTsNCj4gPiAgCXZhbCAmPSB+
UENJX01TSVhfRkxBR1NfUVNJWkU7DQo+ID4gIAl2YWwgfD0gaW50ZXJydXB0czsNCj4gPiBAQCAt
Mzk4LDI5ICs0MzYsMzMgQEAgaW50IGR3X3BjaWVfZXBfcmFpc2VfbXNpX2lycShzdHJ1Y3QNCj4g
ZHdfcGNpZV9lcCAqZXAsIHU4IGZ1bmNfbm8sDQo+ID4gIAlzdHJ1Y3QgZHdfcGNpZSAqcGNpID0g
dG9fZHdfcGNpZV9mcm9tX2VwKGVwKTsNCj4gPiAgCXN0cnVjdCBwY2lfZXBjICplcGMgPSBlcC0+
ZXBjOw0KPiA+ICAJdW5zaWduZWQgaW50IGFsaWduZWRfb2Zmc2V0Ow0KPiA+ICsJdW5zaWduZWQg
aW50IGZ1bmNfb2Zmc2V0ID0gMDsNCj4gPiAgCXUxNiBtc2dfY3RybCwgbXNnX2RhdGE7DQo+ID4g
IAl1MzIgbXNnX2FkZHJfbG93ZXIsIG1zZ19hZGRyX3VwcGVyLCByZWc7DQo+ID4gIAl1NjQgbXNn
X2FkZHI7DQo+ID4gIAlib29sIGhhc191cHBlcjsNCj4gPiAgCWludCByZXQ7DQo+ID4NCj4gPiAr
CWlmIChlcC0+b3BzLT5mdW5jX2NvbmZfc2VsZWN0KQ0KPiA+ICsJCWZ1bmNfb2Zmc2V0ID0gZXAt
Pm9wcy0+ZnVuY19jb25mX3NlbGVjdChlcCwgZnVuY19ubyk7DQo+ID4gKw0KPiANCj4gWW91IGNv
dWxkIHByb2JhYmx5IG1vdmUgdGhpcyBodW5rIGJlbG93IHRoZSB0ZXN0IGZvciBtc2lfY2FwIHRv
IHNhdmUgc29tZQ0KPiBjeWNsZXMuDQoNClNvcnJ5LCBJIGRpZG4ndCB1bmRlcnN0YW5kIHRoZSBt
ZWFucywgcGxlYXNlIGV4cGxhaW4gaXQgZGV0YWlsbHksIHRoYW5rcyBhIGxvdCwgXl9eDQo+IA0K
PiA+ICAJaWYgKCFlcC0+bXNpX2NhcCkNCj4gPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gPg0KPiA+
ICAJLyogUmFpc2UgTVNJIHBlciB0aGUgUENJIExvY2FsIEJ1cyBTcGVjaWZpY2F0aW9uIFJldmlz
aW9uIDMuMCwgNi44LjEuICovDQo+ID4gLQlyZWcgPSBlcC0+bXNpX2NhcCArIFBDSV9NU0lfRkxB
R1M7DQo+ID4gKwlyZWcgPSBlcC0+bXNpX2NhcCArIGZ1bmNfb2Zmc2V0ICsgUENJX01TSV9GTEFH
UzsNCj4gPiAgCW1zZ19jdHJsID0gZHdfcGNpZV9yZWFkd19kYmkocGNpLCByZWcpOw0KPiA+ICAJ
aGFzX3VwcGVyID0gISEobXNnX2N0cmwgJiBQQ0lfTVNJX0ZMQUdTXzY0QklUKTsNCj4gPiAtCXJl
ZyA9IGVwLT5tc2lfY2FwICsgUENJX01TSV9BRERSRVNTX0xPOw0KPiA+ICsJcmVnID0gZXAtPm1z
aV9jYXAgKyBmdW5jX29mZnNldCArIFBDSV9NU0lfQUREUkVTU19MTzsNCj4gPiAgCW1zZ19hZGRy
X2xvd2VyID0gZHdfcGNpZV9yZWFkbF9kYmkocGNpLCByZWcpOw0KPiA+ICAJaWYgKGhhc191cHBl
cikgew0KPiA+IC0JCXJlZyA9IGVwLT5tc2lfY2FwICsgUENJX01TSV9BRERSRVNTX0hJOw0KPiA+
ICsJCXJlZyA9IGVwLT5tc2lfY2FwICsgZnVuY19vZmZzZXQgKyBQQ0lfTVNJX0FERFJFU1NfSEk7
DQo+ID4gIAkJbXNnX2FkZHJfdXBwZXIgPSBkd19wY2llX3JlYWRsX2RiaShwY2ksIHJlZyk7DQo+
ID4gLQkJcmVnID0gZXAtPm1zaV9jYXAgKyBQQ0lfTVNJX0RBVEFfNjQ7DQo+ID4gKwkJcmVnID0g
ZXAtPm1zaV9jYXAgKyBmdW5jX29mZnNldCArIFBDSV9NU0lfREFUQV82NDsNCj4gPiAgCQltc2df
ZGF0YSA9IGR3X3BjaWVfcmVhZHdfZGJpKHBjaSwgcmVnKTsNCj4gPiAgCX0gZWxzZSB7DQo+ID4g
IAkJbXNnX2FkZHJfdXBwZXIgPSAwOw0KPiA+IC0JCXJlZyA9IGVwLT5tc2lfY2FwICsgUENJX01T
SV9EQVRBXzMyOw0KPiA+ICsJCXJlZyA9IGVwLT5tc2lfY2FwICsgZnVuY19vZmZzZXQgKyBQQ0lf
TVNJX0RBVEFfMzI7DQo+ID4gIAkJbXNnX2RhdGEgPSBkd19wY2llX3JlYWR3X2RiaShwY2ksIHJl
Zyk7DQo+ID4gIAl9DQo+ID4gIAlhbGlnbmVkX29mZnNldCA9IG1zZ19hZGRyX2xvd2VyICYgKGVw
Yy0+bWVtLT5wYWdlX3NpemUgLSAxKTsNCj4gDQo+IA0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLmMNCj4gPiBiL2RyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5jDQo+ID4gaW5kZXggN2QyNTEwMi4u
MzA1ZTczZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LWRlc2lnbndhcmUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUt
ZGVzaWdud2FyZS5jDQo+ID4gQEAgLTE1OCw5ICsxNTgsMTAgQEAgc3RhdGljIHZvaWQgZHdfcGNp
ZV93cml0ZWxfb2JfdW5yb2xsKHN0cnVjdA0KPiBkd19wY2llICpwY2ksIHUzMiBpbmRleCwgdTMy
IHJlZywNCj4gPiAgCWR3X3BjaWVfd3JpdGVsX2F0dShwY2ksIG9mZnNldCArIHJlZywgdmFsKTsg
IH0NCj4gPg0KPiA+IC1zdGF0aWMgdm9pZCBkd19wY2llX3Byb2dfb3V0Ym91bmRfYXR1X3Vucm9s
bChzdHJ1Y3QgZHdfcGNpZSAqcGNpLCBpbnQNCj4gaW5kZXgsDQo+ID4gLQkJCQkJICAgICBpbnQg
dHlwZSwgdTY0IGNwdV9hZGRyLA0KPiA+IC0JCQkJCSAgICAgdTY0IHBjaV9hZGRyLCB1MzIgc2l6
ZSkNCj4gPiArc3RhdGljIHZvaWQgZHdfcGNpZV9wcm9nX291dGJvdW5kX2F0dV91bnJvbGwoc3Ry
dWN0IGR3X3BjaWUgKnBjaSwgdTgNCj4gZnVuY19ubywNCj4gPiArCQkJCQkgICAgIGludCBpbmRl
eCwgaW50IHR5cGUsDQo+ID4gKwkJCQkJICAgICB1NjQgY3B1X2FkZHIsIHU2NCBwY2lfYWRkciwN
Cj4gPiArCQkJCQkgICAgIHUzMiBzaXplKQ0KPiA+ICB7DQo+ID4gIAl1MzIgcmV0cmllcywgdmFs
Ow0KPiA+DQo+ID4gQEAgLTE3NSw3ICsxNzYsNyBAQCBzdGF0aWMgdm9pZA0KPiBkd19wY2llX3By
b2dfb3V0Ym91bmRfYXR1X3Vucm9sbChzdHJ1Y3QgZHdfcGNpZSAqcGNpLCBpbnQgaW5kZXgsDQo+
ID4gIAlkd19wY2llX3dyaXRlbF9vYl91bnJvbGwocGNpLCBpbmRleCwgUENJRV9BVFVfVU5SX1VQ
UEVSX1RBUkdFVCwNCj4gPiAgCQkJCSB1cHBlcl8zMl9iaXRzKHBjaV9hZGRyKSk7DQo+ID4gIAlk
d19wY2llX3dyaXRlbF9vYl91bnJvbGwocGNpLCBpbmRleCwgUENJRV9BVFVfVU5SX1JFR0lPTl9D
VFJMMSwNCj4gPiAtCQkJCSB0eXBlKTsNCj4gPiArCQkJCSB0eXBlIHwgUENJRV9BVFVfRlVOQ19O
VU0oZnVuY19ubykpOw0KPiANCj4gTXVjaCBiZXR0ZXIgOikNCg0KRG8geW91IG1lYW4gdGhhdCB1
c2UgdGhlIGV4cHJlc3Npb24gImE/IGI6YyINCg0KPiANCj4gPiAgCWR3X3BjaWVfd3JpdGVsX29i
X3Vucm9sbChwY2ksIGluZGV4LCBQQ0lFX0FUVV9VTlJfUkVHSU9OX0NUUkwyLA0KPiA+ICAJCQkJ
IFBDSUVfQVRVX0VOQUJMRSk7DQo+ID4NCj4gPiBAQCAtMTk0LDggKzE5NSw5IEBAIHN0YXRpYyB2
b2lkDQo+IGR3X3BjaWVfcHJvZ19vdXRib3VuZF9hdHVfdW5yb2xsKHN0cnVjdCBkd19wY2llICpw
Y2ksIGludCBpbmRleCwNCj4gPiAgCWRldl9lcnIocGNpLT5kZXYsICJPdXRib3VuZCBpQVRVIGlz
IG5vdCBiZWluZyBlbmFibGVkXG4iKTsgIH0NCj4gPg0KPiA+IC12b2lkIGR3X3BjaWVfcHJvZ19v
dXRib3VuZF9hdHUoc3RydWN0IGR3X3BjaWUgKnBjaSwgaW50IGluZGV4LCBpbnQgdHlwZSwNCj4g
PiAtCQkJICAgICAgIHU2NCBjcHVfYWRkciwgdTY0IHBjaV9hZGRyLCB1MzIgc2l6ZSkNCj4gPiAr
c3RhdGljIHZvaWQgX19kd19wY2llX3Byb2dfb3V0Ym91bmRfYXR1KHN0cnVjdCBkd19wY2llICpw
Y2ksIHU4DQo+IGZ1bmNfbm8sDQo+ID4gKwkJCQkJaW50IGluZGV4LCBpbnQgdHlwZSwgdTY0IGNw
dV9hZGRyLA0KPiA+ICsJCQkJCXU2NCBwY2lfYWRkciwgdTMyIHNpemUpDQo+ID4gIHsNCj4gPiAg
CXUzMiByZXRyaWVzLCB2YWw7DQo+ID4NCj4gPiBAQCAtMjAzLDggKzIwNSw4IEBAIHZvaWQgZHdf
cGNpZV9wcm9nX291dGJvdW5kX2F0dShzdHJ1Y3QgZHdfcGNpZQ0KPiAqcGNpLCBpbnQgaW5kZXgs
IGludCB0eXBlLA0KPiA+ICAJCWNwdV9hZGRyID0gcGNpLT5vcHMtPmNwdV9hZGRyX2ZpeHVwKHBj
aSwgY3B1X2FkZHIpOw0KPiA+DQo+ID4gIAlpZiAocGNpLT5pYXR1X3Vucm9sbF9lbmFibGVkKSB7
DQo+ID4gLQkJZHdfcGNpZV9wcm9nX291dGJvdW5kX2F0dV91bnJvbGwocGNpLCBpbmRleCwgdHlw
ZSwgY3B1X2FkZHIsDQo+ID4gLQkJCQkJCSBwY2lfYWRkciwgc2l6ZSk7DQo+ID4gKwkJZHdfcGNp
ZV9wcm9nX291dGJvdW5kX2F0dV91bnJvbGwocGNpLCBmdW5jX25vLCBpbmRleCwgdHlwZSwNCj4g
PiArCQkJCQkJIGNwdV9hZGRyLCBwY2lfYWRkciwgc2l6ZSk7DQo+ID4gIAkJcmV0dXJuOw0KPiA+
ICAJfQ0KPiA+DQo+IA0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxl
ci9kd2MvcGNpZS1kZXNpZ253YXJlLmgNCj4gPiBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaWUtZGVzaWdud2FyZS5oDQo+ID4gaW5kZXggZmZlZDA4NC4uYTBmZGJmNyAxMDA2NDQNCj4g
PiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUuaA0KPiA+
ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5oDQo+ID4g
QEAgLTcxLDkgKzcxLDExIEBADQo+ID4gICNkZWZpbmUgUENJRV9BVFVfVFlQRV9JTwkJMHgyDQo+
ID4gICNkZWZpbmUgUENJRV9BVFVfVFlQRV9DRkcwCQkweDQNCj4gPiAgI2RlZmluZSBQQ0lFX0FU
VV9UWVBFX0NGRzEJCTB4NQ0KPiA+ICsjZGVmaW5lIFBDSUVfQVRVX0ZVTkNfTlVNKHBmKSAgICAg
ICAgICAgKHBmIDw8IDIwKQ0KPiANCj4gIk1hY3JvIGFyZ3VtZW50ICdwZicgbWF5IGJlIGJldHRl
ciBhcyAnKHBmKScgdG8gYXZvaWQgcHJlY2VkZW5jZSBpc3N1ZXMiDQo+IA0KPiA+ICAjZGVmaW5l
IFBDSUVfQVRVX0NSMgkJCTB4OTA4DQo+ID4gICNkZWZpbmUgUENJRV9BVFVfRU5BQkxFCQkJQklU
KDMxKQ0KPiA+ICAjZGVmaW5lIFBDSUVfQVRVX0JBUl9NT0RFX0VOQUJMRQlCSVQoMzApDQo+ID4g
KyNkZWZpbmUgUENJRV9BVFVfRlVOQ19OVU1fTUFUQ0hfRU4gICAgICBCSVQoMTkpDQo+ID4gICNk
ZWZpbmUgUENJRV9BVFVfTE9XRVJfQkFTRQkJMHg5MEMNCj4gPiAgI2RlZmluZSBQQ0lFX0FUVV9V
UFBFUl9CQVNFCQkweDkxMA0KPiA+ICAjZGVmaW5lIFBDSUVfQVRVX0xJTUlUCQkJMHg5MTQNCj4g
PiBAQCAtMTk3LDYgKzE5OSw3IEBAIHN0cnVjdCBkd19wY2llX2VwX29wcyB7DQo+ID4gIAlpbnQJ
KCpyYWlzZV9pcnEpKHN0cnVjdCBkd19wY2llX2VwICplcCwgdTggZnVuY19ubywNCj4gPiAgCQkJ
ICAgICBlbnVtIHBjaV9lcGNfaXJxX3R5cGUgdHlwZSwgdTE2IGludGVycnVwdF9udW0pOw0KPiA+
ICAJY29uc3Qgc3RydWN0IHBjaV9lcGNfZmVhdHVyZXMqICgqZ2V0X2ZlYXR1cmVzKShzdHJ1Y3Qg
ZHdfcGNpZV9lcA0KPiA+ICplcCk7DQo+ID4gKwl1bnNpZ25lZCBpbnQgKCpmdW5jX2NvbmZfc2Vs
ZWN0KShzdHJ1Y3QgZHdfcGNpZV9lcCAqZXAsIHU4IGZ1bmNfbm8pOw0KPiANCj4gR2l2ZW4gdGhh
dCB0aGlzIGZ1bmN0aW9uIHdpbGwgcmV0dXJuIGFuIG9mZnNldCwgSSdtIG5vdCBzdXJlIHRoZSBu
YW1lIHlvdSBoYXZlDQo+IGlzIHN1aXRhYmxlLiBTb21ldGhpbmcgbGlrZSBnZXRfcGZfb2Zmc2V0
IG9yIHNpbWlsYXIgaXMgbW9yZSBkZXNjcmlwdGl2ZS4NCg0KQXMgYWJvdmUgZXhwbGFpbiwgbXkg
aW5pdGlhbCB2aWV3IGlzIHRoYXQgdGhpcyBmdW5jdGlvbiBjYW4gcmV0dXJuIDAgb3Igb2Zmc2V0
IGRlcGVuZHMgb24NCnRoZSBwbGF0Zm9ybSBpbXBsZW1lbnQgbWVjaGFuaXNtLCBzbyBJIG5hbWVk
IGl0IGZ1bmNfY29uZl9zZWxlY3QsIEkgdGhpbmsgYWRkIGENCmNvbW1lbnQgZm9yIHRoaXMgZnVu
Y3Rpb24sIGxpa2UgdGhpczoNCi8qDQogKiBwcm92aWRlIGEgbWV0aG9kIHRvIGltcGxlbWVudCB0
aGUgbWV0aG9kIG9mIGRpZmZlcmVudCBmdW5jIGNvbmZpZyBzcGFjZSBhY2Nlc3MsDQogKiBpZiB1
c2Ugb2Zmc2V0IG1ldGhvZCwgcmV0dXJuIHRoZSBvZmZzZXQgZnJvbSBkYmlfYmFzZSwgaWYgeW91
ciByZWdpc3RlciBtZXRob2QsIGltcGxlbWVudA0KICogdGhlIGNvZGUgaW4gdGhpcyBjYWxsYmFj
ayBmdW5jdGlvbiBhbmQgcmV0dXJuIDAuDQogKi8NCkhvdyBhYm91dCBpdD8NCg0KPiANCj4gVGhh
bmtzLA0KPiANCj4gQW5kcmV3IE11cnJheQ0KPiANCj4gPiAgfTsNCj4gPg0KPiA+ICBzdHJ1Y3Qg
ZHdfcGNpZV9lcCB7DQo+ID4gQEAgLTI2NSw4ICsyNjgsMTIgQEAgaW50IGR3X3BjaWVfd2FpdF9m
b3JfbGluayhzdHJ1Y3QgZHdfcGNpZSAqcGNpKTsNCj4gPiB2b2lkIGR3X3BjaWVfcHJvZ19vdXRi
b3VuZF9hdHUoc3RydWN0IGR3X3BjaWUgKnBjaSwgaW50IGluZGV4LA0KPiA+ICAJCQkgICAgICAg
aW50IHR5cGUsIHU2NCBjcHVfYWRkciwgdTY0IHBjaV9hZGRyLA0KPiA+ICAJCQkgICAgICAgdTMy
IHNpemUpOw0KPiA+IC1pbnQgZHdfcGNpZV9wcm9nX2luYm91bmRfYXR1KHN0cnVjdCBkd19wY2ll
ICpwY2ksIGludCBpbmRleCwgaW50IGJhciwNCj4gPiAtCQkJICAgICB1NjQgY3B1X2FkZHIsIGVu
dW0gZHdfcGNpZV9hc190eXBlIGFzX3R5cGUpOw0KPiA+ICt2b2lkIGR3X3BjaWVfcHJvZ19lcF9v
dXRib3VuZF9hdHUoc3RydWN0IGR3X3BjaWUgKnBjaSwgdTggZnVuY19ubywgaW50DQo+IGluZGV4
LA0KPiA+ICsJCQkJICBpbnQgdHlwZSwgdTY0IGNwdV9hZGRyLCB1NjQgcGNpX2FkZHIsDQo+ID4g
KwkJCQkgIHUzMiBzaXplKTsNCj4gPiAraW50IGR3X3BjaWVfcHJvZ19pbmJvdW5kX2F0dShzdHJ1
Y3QgZHdfcGNpZSAqcGNpLCB1OCBmdW5jX25vLCBpbnQgaW5kZXgsDQo+ID4gKwkJCSAgICAgaW50
IGJhciwgdTY0IGNwdV9hZGRyLA0KPiA+ICsJCQkgICAgIGVudW0gZHdfcGNpZV9hc190eXBlIGFz
X3R5cGUpOw0KPiA+ICB2b2lkIGR3X3BjaWVfZGlzYWJsZV9hdHUoc3RydWN0IGR3X3BjaWUgKnBj
aSwgaW50IGluZGV4LA0KPiA+ICAJCQkgZW51bSBkd19wY2llX3JlZ2lvbl90eXBlIHR5cGUpOw0K
PiA+ICB2b2lkIGR3X3BjaWVfc2V0dXAoc3RydWN0IGR3X3BjaWUgKnBjaSk7DQo+ID4gLS0NCj4g
PiAyLjkuNQ0KPiA+DQo=
