Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C47B8F957
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 05:00:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468p3B6cNFzDqvr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 13:00:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.13.58; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="idX5fa6E"; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130058.outbound.protection.outlook.com [40.107.13.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468p1C10H7zDqCx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 12:58:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3cydMPYGcFeoLI1L+jp5zhk3Ro7Nfhsy2dDBM92io3BPmgSw+Rv8zR51Iwxi3YLVh2wO6laTnRN/V0sAhtMf8W7cm5NHfBM1dDX7Fer4dJxNTe78sLg3NdMnihKhxK0pVdyDrSVxjYo3PA0KuN3euIxiCS1TJ8OWSLXYY8O9wDum6HXITdo6kGeQeo0poV2dO6B6+C3+JuY2ZmK9QiL+4HBSeYEp+zD+5g9SIQZpWNsKnVeVH6Wp0YixzqRYjBS4H9KSX362ojfqF7E5CevA+HgJhEFB9yBxuzj9nSuTCFugDpKyly8x13U1xBHNUqMaQzx0tKE9H2Iv13isnLWXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yNcS8CnSmwplsd6mnrrGknOEAf+jW8Vr+ZZyWu1Ctk=;
 b=ehkobblM8p3sIyd+M7OGzemyB9Kv3iDLcrbPqMLyz0WzyQOlsUf/SuBiAwbKRb7+wCgfVJnhdnN0SXNA/WrwzMskI3cOdMBCMuf0EfOcstAnb/AUCKd63WUGQoqOgRVDZSAlibJ5m2KPlpAjn2YWioil1oCjddaGiX+pTfb/4hGJZ9mHX5fUCwUjHGjVhiLntiIk+2tlghnANVJvvAuslOc8lBadZlN1ptB4hsIFDgldFBiISN7E5lM4B9khktdIZ+B0iVIPSxGda2iVGFTFR6l5nwzuujiTc8Gif357HmvK4MxJArrjiSDu2Q8axpGPbVQC07K4yrTq5bkLXjqj1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yNcS8CnSmwplsd6mnrrGknOEAf+jW8Vr+ZZyWu1Ctk=;
 b=idX5fa6EyymB2La/Z0ctzSdW//vuFxi+LahaNtz0qNJt5yhH8qgGxwlYQyBx5qejgOnUijUSLDd2/t6tf14Xr/LKkkn9qLvfOMzffUMCMfQU0ty21I8BG1vgRyfECWy1Z3E/NmxYgjnWgdnkj40ClomlUaiwqriwn5tn+VO1fYg=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3282.eurprd04.prod.outlook.com (10.167.168.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Fri, 16 Aug 2019 02:58:31 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84%5]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 02:58:31 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH 02/10] PCI: designware-ep: Add the doorbell mode of MSI-X
 in EP mode
Thread-Topic: [PATCH 02/10] PCI: designware-ep: Add the doorbell mode of MSI-X
 in EP mode
Thread-Index: AQHVU0YcWJbNSPGnu0G+CTkSpUEVo6b8GZ2AgAD8KOA=
Date: Fri, 16 Aug 2019 02:58:31 +0000
Message-ID: <AM5PR04MB329973845D6396624AFDE547F5AF0@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190815083716.4715-1-xiaowei.bao@nxp.com>
 <20190815083716.4715-2-xiaowei.bao@nxp.com>
 <20190815115340.GG43882@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190815115340.GG43882@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 994dd958-fcb0-48a6-c52b-08d721f59f24
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3282; 
x-ms-traffictypediagnostic: AM5PR04MB3282:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3282C05463DF1321814FE486F5AF0@AM5PR04MB3282.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(13464003)(199004)(189003)(44832011)(55016002)(446003)(64756008)(3846002)(6306002)(66946007)(11346002)(9686003)(33656002)(8676002)(81166006)(256004)(486006)(476003)(45080400002)(53936002)(81156014)(6246003)(66446008)(66556008)(5660300002)(186003)(66476007)(966005)(6116002)(14454004)(76116006)(2906002)(6436002)(71190400001)(4326008)(52536014)(229853002)(71200400001)(7736002)(305945005)(6916009)(26005)(74316002)(316002)(7416002)(8936002)(6506007)(53546011)(99286004)(102836004)(7696005)(66066001)(478600001)(54906003)(25786009)(76176011)(86362001)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3282;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: StRCgFidkVAMHDnDj/yXFXo89DD+SSW/VxeObUZniHn/UJx4DF7Nq1VJfDVBz+Mr6zowE3KStqSGKSo2cxQcwlhJiQm0iI5XHLvpAXgPbgZpK3Vst4nz5drAGRS9npT1cQ4V0ehasrLoIseGYJEgQCvg81g5eKj9z6rBV1zTxMQlktS+t0FqrNQ6mbLO5Jj5aPd27ZwnLOkvKFEt19I8wvBT/txOQ3+xkrDXNuETgKcBRD9Xpp163+x/h1Y+oct4mGE74w3EUtD8yQ2E39EJhE8Mu7fwWvwb6fRgOyDr60Mo2vT0jrGeoPMuPsGKLvzx7cua9THj5/gXIrrFl9wJuQ3tCvpjgf/LAJsy+Dp1UZIJR/uy+dHUAGLZRAOLOZQnSe1eJ2YqIl0A+UMnPg+IeU7UftqKhUCpOJnERhdpSP8=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 994dd958-fcb0-48a6-c52b-08d721f59f24
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 02:58:31.4786 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TGeuLndgvORxYk141DwGHHSe41d48NKtXUyJq5auxZL8/905zgmxBFtJVRcyiMwo57jxn6HY51S12SVIC18cQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3282
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "Z.q. Hou" <zhiqiang.hou@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "kishon@ti.com" <kishon@ti.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IE11cnJheSA8
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE5xOo41MIxNcjVIDE5OjU0DQo+IFRv
OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gQ2M6IGppbmdvb2hhbjFAZ21h
aWwuY29tOyBndXN0YXZvLnBpbWVudGVsQHN5bm9wc3lzLmNvbTsNCj4gYmhlbGdhYXNAZ29vZ2xl
LmNvbTsgcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsNCj4gc2hhd25n
dW9Aa2VybmVsLm9yZzsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBraXNob25AdGkuY29t
Ow0KPiBsb3JlbnpvLnBpZXJhbGlzaUBhcm0uY29tOyBhcm5kQGFybmRiLmRlOyBncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZzsNCj4gTS5oLiBMaWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+OyBN
aW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5jb20+Ow0KPiBSb3kgWmFuZyA8cm95LnphbmdAbnhw
LmNvbT47IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggMDIvMTBdIFBDSTogZGVzaWdud2FyZS1lcDogQWRkIHRoZSBkb29y
YmVsbCBtb2RlIG9mDQo+IE1TSS1YIGluIEVQIG1vZGUNCj4gDQo+IE9uIFRodSwgQXVnIDE1LCAy
MDE5IGF0IDA0OjM3OjA4UE0gKzA4MDAsIFhpYW93ZWkgQmFvIHdyb3RlOg0KPiA+IEFkZCB0aGUg
ZG9vcmJlbGwgbW9kZSBvZiBNU0ktWCBpbiBFUCBtb2RlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1lcC5jIHwgMTQgKysrKysrKysr
KysrKysNCj4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLmgg
ICAgfCAxNCArKysrKysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlv
bnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2llLWRlc2lnbndhcmUtZXAuYw0KPiA+IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS1kZXNpZ253YXJlLWVwLmMNCj4gPiBpbmRleCA3NWUyOTU1Li5lM2E3Y2RmIDEwMDY0NA0KPiA+
IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1lcC5jDQo+
ID4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWVwLmMN
Cj4gPiBAQCAtNDU0LDYgKzQ1NCwyMCBAQCBpbnQgZHdfcGNpZV9lcF9yYWlzZV9tc2lfaXJxKHN0
cnVjdCBkd19wY2llX2VwDQo+ICplcCwgdTggZnVuY19ubywNCj4gPiAgCXJldHVybiAwOw0KPiA+
ICB9DQo+ID4NCj4gPiAraW50IGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnFfZG9vcmJlbGwoc3Ry
dWN0IGR3X3BjaWVfZXAgKmVwLCB1OA0KPiBmdW5jX25vLA0KPiA+ICsJCQkJICAgICAgIHUxNiBp
bnRlcnJ1cHRfbnVtKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgZHdfcGNpZSAqcGNpID0gdG9fZHdf
cGNpZV9mcm9tX2VwKGVwKTsNCj4gPiArCXUzMiBtc2dfZGF0YTsNCj4gPiArDQo+ID4gKwltc2df
ZGF0YSA9IChmdW5jX25vIDw8IFBDSUVfTVNJWF9ET09SQkVMTF9QRl9TSElGVCkgfA0KPiA+ICsJ
CSAgIChpbnRlcnJ1cHRfbnVtIC0gMSk7DQo+ID4gKw0KPiA+ICsJZHdfcGNpZV93cml0ZWxfZGJp
KHBjaSwgUENJRV9NU0lYX0RPT1JCRUxMLCBtc2dfZGF0YSk7DQo+ID4gKw0KPiA+ICsJcmV0dXJu
IDA7DQo+ID4gK30NCj4gPiArDQo+ID4gIGludCBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJxKHN0
cnVjdCBkd19wY2llX2VwICplcCwgdTggZnVuY19ubywNCj4gPiAgCQkJICAgICAgdTE2IGludGVy
cnVwdF9udW0pDQo+IA0KPiBIYXZlIEkgdW5kZXJzdG9vZCBjb3JyZWN0bHkgdGhhdCB0aGUgaGFy
ZHdhcmUgcHJvdmlkZXMgYW4gYWx0ZXJuYXRpdmUNCj4gbWVjaGFuaXNtIHRoYXQgYWxsb3dzIGZv
ciByYWlzaW5nIE1TSS1YIGludGVycnVwdHMgd2l0aG91dCB0aGUgYm90aGVyIG9mDQo+IHJlYWRp
bmcgdGhlIGNhcGFiaWxpdGllcyByZWdpc3RlcnM/DQpZZXMsIHRoZSBoYXJkd2FyZSBwcm92aWRl
IHR3byB3YXkgdG8gTVNJLVgsIHBsZWFzZSBjaGVjayB0aGUgcGFnZSA0OTIgb2YgDQpEV0NfcGNp
ZV9kbV9yZWdpc3RlcnNfNC4zMCBNZW51Lg0KTVNJWF9ET09SQkVMTF9PRkYgb24gcGFnZSA0OTIg
MHg5NDggRGVzY3JpcHRpb246IE1TSS1YIERvb3JiZWxsIFJlZ2lzdGVyLi4uLj4NCj4gDQo+IElm
IHNvIGlzIHRoZXJlIGFueSBnb29kIHJlYXNvbiB0byBrZWVwIGR3X3BjaWVfZXBfcmFpc2VfbXNp
eF9pcnE/IChBbmQgdGh1cw0KPiB1c2UgaXQgaW4gZHdfcGxhdF9wY2llX2VwX3JhaXNlX2lycSBh
bHNvKT8NCkkgYW0gbm90IHN1cmUsIGJ1dCBJIHRoaW5rIHRoZSBkd19wY2llX2VwX3JhaXNlX21z
aXhfaXJxIGZ1bmN0aW9uIGlzIG5vdCBjb3JyZWN0LCANCmJlY2F1c2UgSSB0aGluayB3ZSBjYW4n
dCBnZXQgdGhlIE1TSVggdGFibGUgZnJvbSB0aGUgYWRkcmVzcyBlcC0+cGh5c19iYXNlICsgdGJs
X2FkZHIsIA0KYnV0IEkgYWxzbyBkb24ndCBrbm93IHdoZXJlIEkgY2FuIGdldCB0aGUgY29ycmVj
dCBNU0lYIHRhYmxlLg0KPiANCj4gDQo+ID4gIHsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
Y2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLmgNCj4gPiBiL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5oDQo+ID4gaW5kZXggMmIyOTFlOC4uY2Q5MDNl
OSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2ln
bndhcmUuaA0KPiA+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdu
d2FyZS5oDQo+ID4gQEAgLTg4LDYgKzg4LDExIEBADQo+ID4gICNkZWZpbmUgUENJRV9NSVNDX0NP
TlRST0xfMV9PRkYJCTB4OEJDDQo+ID4gICNkZWZpbmUgUENJRV9EQklfUk9fV1JfRU4JCUJJVCgw
KQ0KPiA+DQo+ID4gKyNkZWZpbmUgUENJRV9NU0lYX0RPT1JCRUxMCQkweDk0OA0KPiA+ICsjZGVm
aW5lIFBDSUVfTVNJWF9ET09SQkVMTF9QRl9TSElGVAkyNA0KPiA+ICsjZGVmaW5lIFBDSUVfTVNJ
WF9ET09SQkVMTF9WRl9TSElGVAkxNg0KPiA+ICsjZGVmaW5lIFBDSUVfTVNJWF9ET09SQkVMTF9W
Rl9BQ1RJVkUJQklUKDE1KQ0KPiANCj4gVGhlIF9WRiBkZWZpbmVzIGFyZSBub3QgdXNlZCwgSSdk
IHN1Z2dlc3QgcmVtb3ZpbmcgdGhlbS4NCkluIGZhY3QsIEkgd2lsbCBhZGQgdGhlIFNSSU9WIHN1
cHBvcnQgaW4gdGhpcyBmaWxlLCB0aGUgU1JJT1YgZmVhdHVyZSBoYXZlIHZlcmlmaWVkIA0KSW4g
bXkgYm9hcmQsIGJ1dCBJIG5lZWQgd2FpdCB0aGUgRVAgZnJhbWV3b3JrIFNSSU9WIHBhdGNoIG1l
cmdlLCANCnNvIEkgZGVmaW5lZCB0aGVzZSB0d28gbWFjcm9zLg0KPiANCj4gVGhhbmtzLA0KPiAN
Cj4gQW5kcmV3IE11cnJheQ0KPiANCj4gPiArDQo+ID4gIC8qDQo+ID4gICAqIGlBVFUgVW5yb2xs
LXNwZWNpZmljIHJlZ2lzdGVyIGRlZmluaXRpb25zDQo+ID4gICAqIEZyb20gNC44MCBjb3JlIHZl
cnNpb24gdGhlIGFkZHJlc3MgdHJhbnNsYXRpb24gd2lsbCBiZSBtYWRlIGJ5DQo+ID4gdW5yb2xs
IEBAIC0zOTksNiArNDA0LDggQEAgaW50IGR3X3BjaWVfZXBfcmFpc2VfbXNpX2lycShzdHJ1Y3QN
Cj4gZHdfcGNpZV9lcCAqZXAsIHU4IGZ1bmNfbm8sDQo+ID4gIAkJCSAgICAgdTggaW50ZXJydXB0
X251bSk7DQo+ID4gIGludCBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJxKHN0cnVjdCBkd19wY2ll
X2VwICplcCwgdTggZnVuY19ubywNCj4gPiAgCQkJICAgICB1MTYgaW50ZXJydXB0X251bSk7DQo+
ID4gK2ludCBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJxX2Rvb3JiZWxsKHN0cnVjdCBkd19wY2ll
X2VwICplcCwgdTgNCj4gZnVuY19ubywNCj4gPiArCQkJCSAgICAgICB1MTYgaW50ZXJydXB0X251
bSk7DQo+ID4gIHZvaWQgZHdfcGNpZV9lcF9yZXNldF9iYXIoc3RydWN0IGR3X3BjaWUgKnBjaSwg
ZW51bSBwY2lfYmFybm8gYmFyKTsNCj4gPiAjZWxzZSAgc3RhdGljIGlubGluZSB2b2lkIGR3X3Bj
aWVfZXBfbGlua3VwKHN0cnVjdCBkd19wY2llX2VwICplcCkgQEANCj4gPiAtNDMxLDYgKzQzOCwx
MyBAQCBzdGF0aWMgaW5saW5lIGludCBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJxKHN0cnVjdA0K
PiBkd19wY2llX2VwICplcCwgdTggZnVuY19ubywNCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+
ID4NCj4gPiArc3RhdGljIGlubGluZSBpbnQgZHdfcGNpZV9lcF9yYWlzZV9tc2l4X2lycV9kb29y
YmVsbChzdHJ1Y3QgZHdfcGNpZV9lcA0KPiAqZXAsDQo+ID4gKwkJCQkJCSAgICAgdTggZnVuY19u
bywNCj4gPiArCQkJCQkJICAgICB1MTYgaW50ZXJydXB0X251bSkNCj4gPiArew0KPiA+ICsJcmV0
dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gIHN0YXRpYyBpbmxpbmUgdm9pZCBkd19wY2llX2Vw
X3Jlc2V0X2JhcihzdHJ1Y3QgZHdfcGNpZSAqcGNpLCBlbnVtDQo+ID4gcGNpX2Jhcm5vIGJhcikg
IHsgIH0NCj4gPiAtLQ0KPiA+IDIuOS41DQo+ID4NCj4gPg0KPiA+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4gbGludXgtYXJtLWtlcm5lbCBtYWls
aW5nIGxpc3QNCj4gPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gPiBo
dHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUz
QSUyRiUyRmxpc3RzDQo+ID4gLmluZnJhZGVhZC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZs
aW51eC1hcm0ta2VybmVsJmFtcDtkYXRhPTAyJQ0KPiA3QzANCj4gPg0KPiAxJTdDeGlhb3dlaS5i
YW8lNDBueHAuY29tJTdDODQ4OTQ5MzAwM2JiNDhhMDEzOWQwOGQ3MjE3NzM5NzIlDQo+IDdDNjg2
ZWExZA0KPiA+DQo+IDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzNzAxNDY2
ODM2OTQ5OTI5OCZhbXA7c2QNCj4gYXRhPWR5clhCDQo+ID4NCj4gYXZsakpCRlVTTlhXN0slMkZS
b1h2d2ZXVEUlMkZvVTJLTWQxYlprSm93JTNEJmFtcDtyZXNlcnZlZD0wDQo=
