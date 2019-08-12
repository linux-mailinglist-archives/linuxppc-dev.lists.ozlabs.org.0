Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8798A76E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 21:43:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466mV63VJszDqdf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 05:43:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.59; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="dxEq5xKY"; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70059.outbound.protection.outlook.com [40.107.7.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466mRn08dgzDqYb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 05:41:05 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D+xZsCUucq3VGeOZ2dVg4eyVN7+ZvxJ1OnCfXVXAlSATVPHqj3t3EqDJZQK2v+kzvglndKd/qzFG0TLUgjyojduLRo5IUwBDMS25WpPb5jD9v3WWLPHxYmYwEV0KgzZTZ5gtlzVqP2RBi6De4NKMRda8ZF88ZPSOZ+fXWdVZzIBcJB+QOv34ALvOtOKUVFPy8NlqikSKz4JLknYtJkJ64o9J6hsQjWLocKmjWBCjYeGFyRkCcRGdaadyZiEUdcaOoqZej8V76RBUQpKgBiypNRwFQTF5h7G8KpHWVmA14KEhcve5uPfGDBaptdHUv1Fned5lOlD1DDpgOnV2hR034Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hg2DmKUxfug3yUUwflDCB3ejSA4zSZtbC43QPCWR9j0=;
 b=fk/GpU3EUv+Vw5eJmMApnxTMfdE+iDpzJP3hMtTjWRLKb/h8v5x43T3Pb8G9HcYBwSm4sQLxY5bXg7LJbRP2u43T1JFuuKutS4OIWqa2f0urnBpHBJS6GJE7w59qKZN9MUWkkCygZBqKSjXSGy4cmDLsEdpjxpcH435qLLcq8M98G1dELkzutUn05zSCuTWYgCL/PRp/MSlG9xDGISklJU0v2lGLX6L6PZOkuNhWqhGf0w32KIuc0108pUuRrerLiiKNVd2JrpV36eKviiAzQqcLPcZ5Idn/cFrlKjxA4D+n07vNlIvrkUzTUT98a2APuhwRoO7Y10vWjqpvOlilwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hg2DmKUxfug3yUUwflDCB3ejSA4zSZtbC43QPCWR9j0=;
 b=dxEq5xKYVgsCnd2NWWqojjIYleGrS6p1s19kdehml1JPa6qzsRjG722SXdYIngbcghdd0QL75U++NiSgsgyKA5cuRmqN2CcRnc8sLk9L1Gj5mFoWkgoT32bK/hEWKaHdmwyPsXxDRicsICRpE9KGT7z+QzvtLTjGhlWLzX/VcZQ=
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com (20.179.235.152) by
 VE1PR04MB6509.eurprd04.prod.outlook.com (20.179.233.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Mon, 12 Aug 2019 19:40:58 +0000
Received: from VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::3d61:6e52:a83c:7c59]) by VE1PR04MB6687.eurprd04.prod.outlook.com
 ([fe80::3d61:6e52:a83c:7c59%6]) with mapi id 15.20.2136.018; Mon, 12 Aug 2019
 19:40:58 +0000
From: Leo Li <leoyang.li@nxp.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Zhang Wei
 <zw@zh-kernel.org>, Vinod Koul <vkoul@kernel.org>, Dan Williams
 <dan.j.williams@intel.com>
Subject: RE: [PATCH] dmaengine: fsldma: Mark expected switch fall-through
Thread-Topic: [PATCH] dmaengine: fsldma: Mark expected switch fall-through
Thread-Index: AQHVUKP5RUYlyDnoZkqg5dHV6OqYpqb36lNA
Date: Mon, 12 Aug 2019 19:40:58 +0000
Message-ID: <VE1PR04MB6687030F764BAAB24FDE80378FD30@VE1PR04MB6687.eurprd04.prod.outlook.com>
References: <20190812002159.GA26899@embeddedor>
In-Reply-To: <20190812002159.GA26899@embeddedor>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leoyang.li@nxp.com; 
x-originating-ip: [64.157.242.222]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1163b1d1-ffc2-4ea3-40fb-08d71f5d0001
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VE1PR04MB6509; 
x-ms-traffictypediagnostic: VE1PR04MB6509:
x-microsoft-antispam-prvs: <VE1PR04MB6509329803F117F61B9F85D18FD30@VE1PR04MB6509.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:843;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(13464003)(189003)(199004)(486006)(14454004)(476003)(53546011)(7736002)(26005)(8936002)(71190400001)(186003)(11346002)(81156014)(6506007)(305945005)(8676002)(81166006)(102836004)(71200400001)(446003)(14444005)(256004)(66066001)(6116002)(3846002)(99286004)(33656002)(478600001)(5660300002)(2906002)(55016002)(52536014)(316002)(6436002)(9686003)(66946007)(76176011)(25786009)(66556008)(66476007)(229853002)(66446008)(64756008)(6246003)(7696005)(53936002)(4326008)(110136005)(54906003)(86362001)(76116006)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6509;
 H:VE1PR04MB6687.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6/S78OHNcDcTbPW9gsiqQr8ozDoAMd3zikyIwZMBlQQpooo5VS2C4UNME+LIPOg3qTurfBIUOWlJaik1ZRjfUM/xv4bSZ4AH72U35swzmJegLIBXMf6vUUEdFwWWACljGAcNP/Jh2GQEcwkiXg460GzaO/w7namNnrmtPgmu31QM81iVBS3EORf3Zz78dPYDbym21poqaEYKHi2MYnooV9qPDnU78X3tS6yjOgUer6hr1TDmNvA5LWVI3cOsN0WplcrBIWEPtEZhzbA3cPO2aUm125BqvFmdAI/m381u1Ed6vP7oQg4lzu+oXi0TZysH9WmPdKkgWVBGgtFvce8yjo2SVlNoc7mRt399srgUodLs1XxskHJvqsJs90tt5clNxM+H/YEHrwnzp2VUSm+3UVIwSLyvIbxhbRORnxPH30c=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1163b1d1-ffc2-4ea3-40fb-08d71f5d0001
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 19:40:58.7347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: leoyang.li@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6509
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
Cc: "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR3VzdGF2byBBLiBSLiBT
aWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4NCj4gU2VudDogU3VuZGF5LCBBdWd1c3QgMTEs
IDIwMTkgNzoyMiBQTQ0KPiBUbzogTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBaaGFuZyBX
ZWkgPHp3QHpoLWtlcm5lbC5vcmc+OyBWaW5vZA0KPiBLb3VsIDx2a291bEBrZXJuZWwub3JnPjsg
RGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+DQo+IENjOiBsaW51eHBwYy1k
ZXZAbGlzdHMub3psYWJzLm9yZzsgZG1hZW5naW5lQHZnZXIua2VybmVsLm9yZzsgbGludXgtDQo+
IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9AZW1i
ZWRkZWRvci5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSF0gZG1hZW5naW5lOiBmc2xkbWE6IE1hcmsg
ZXhwZWN0ZWQgc3dpdGNoIGZhbGwtdGhyb3VnaA0KPiANCj4gTWFyayBzd2l0Y2ggY2FzZXMgd2hl
cmUgd2UgYXJlIGV4cGVjdGluZyB0byBmYWxsIHRocm91Z2guDQo+IA0KPiBGaXggdGhlIGZvbGxv
d2luZyB3YXJuaW5nIChCdWlsZGluZzogcG93ZXJwYy1wcGE4NTQ4X2RlZmNvbmZpZyBwb3dlcnBj
KToNCj4gDQo+IGRyaXZlcnMvZG1hL2ZzbGRtYS5jOiBJbiBmdW5jdGlvbiDigJhmc2xfZG1hX2No
YW5fcHJvYmXigJk6DQo+IGRyaXZlcnMvZG1hL2ZzbGRtYS5jOjExNjU6MjY6IHdhcm5pbmc6IHRo
aXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy0NCj4gV2ltcGxpY2l0LWZhbGx0aHJvdWdo
PV0NCj4gICAgY2hhbi0+dG9nZ2xlX2V4dF9wYXVzZSA9IGZzbF9jaGFuX3RvZ2dsZV9leHRfcGF1
c2U7DQo+ICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+DQo+IGRyaXZlcnMvZG1hL2ZzbGRtYS5jOjExNjY6Mjogbm90ZTogaGVyZQ0KPiAgIGNhc2Ug
RlNMX0RNQV9JUF84M1hYOg0KPiAgIF5+fn4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVz
dCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBT
aWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4NCg0KQWNrZWQtYnk6IExpIFlhbmcgPGxlb3lh
bmcubGlAbnhwLmNvbT4NCg0KPiAtLS0NCj4gIGRyaXZlcnMvZG1hL2ZzbGRtYS5jIHwgMSArDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2RtYS9mc2xkbWEuYyBiL2RyaXZlcnMvZG1hL2ZzbGRtYS5jIGluZGV4DQo+IDIzZTBhMzU2
ZjE2Ny4uYWQ3MmIzZjQyZmZhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2RtYS9mc2xkbWEuYw0K
PiArKysgYi9kcml2ZXJzL2RtYS9mc2xkbWEuYw0KPiBAQCAtMTE2Myw2ICsxMTYzLDcgQEAgc3Rh
dGljIGludCBmc2xfZG1hX2NoYW5fcHJvYmUoc3RydWN0DQo+IGZzbGRtYV9kZXZpY2UgKmZkZXYs
DQo+ICAJc3dpdGNoIChjaGFuLT5mZWF0dXJlICYgRlNMX0RNQV9JUF9NQVNLKSB7DQo+ICAJY2Fz
ZSBGU0xfRE1BX0lQXzg1WFg6DQo+ICAJCWNoYW4tPnRvZ2dsZV9leHRfcGF1c2UgPSBmc2xfY2hh
bl90b2dnbGVfZXh0X3BhdXNlOw0KPiArCQkvKiBGYWxsIHRocm91Z2ggKi8NCj4gIAljYXNlIEZT
TF9ETUFfSVBfODNYWDoNCj4gIAkJY2hhbi0+dG9nZ2xlX2V4dF9zdGFydCA9IGZzbF9jaGFuX3Rv
Z2dsZV9leHRfc3RhcnQ7DQo+ICAJCWNoYW4tPnNldF9zcmNfbG9vcF9zaXplID0gZnNsX2NoYW5f
c2V0X3NyY19sb29wX3NpemU7DQo+IC0tDQo+IDIuMjIuMA0KDQo=
