Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C488AFF2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 08:31:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4672t45CFkzDqLt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 16:31:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.3.72; helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="l5PVNhDZ"; 
 dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30072.outbound.protection.outlook.com [40.107.3.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4672r90Y2SzDqZp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 16:29:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnK8hpoGkCEgkb8XdayXBXt5DzdOzzZTvNufEnW+o/HsZ7V+SjaERXOMzx3HJzKJAZyhRlPmqBsDTLuTmFvYrhNE+1OLgzNrK8abGIpwNnwuZL6KGscjZiv58BGUPJXihtnXrZSL0KoQUDlvT/oxLiPNaUNEDFfvtmYA8s2oT0DbMr6Kb/lKMZAfbr+qfSqPdNMSm3XPieCAyFgrF8G0nif/jhCTqmZ/2ZSc7bbA/BYNYDDPSOScFu/8PjFDk2xbuQcrL9+2MWVyeYQXKjQMFtfaR94OwfuLW/z60WVtY45YYqmrpVXMJWoca8xVzta/0mqaqps+vwRFdfcuHk6hgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iN38SAPpGh3M5H3fl7qAcEDa4JsDy6pvgoE5MRNmL2s=;
 b=hMYL4QQVF6DXxVwqVUGFVYhig3TDGGgfAC+3lDBVshgqyOI3tUIwq8UFrLbShNBmhjXtCVHizmxLyUjuviONNH/82Zwy2a4DYlO4pJRmvAaoXPrgHutsL+5iQxArSZ1bn0OrcRSxUvCGlvbRiTIpUHEonboEh1/JF6bkJ4ya+V2QIeZp3XbFcb5vLTyN4LfYclNs2nx7d/2QWeB9QjCSJHXw7zywFqUB0HHT4zIbhO2Lp7ZRCLRPa01cTR2XIYGPDC+HIGz4wR164YsM7k7ILzCXkVx0dZBeH8quRmLe2MWSD6cflayTezPS/Ygp8DrUiIv1xrE0AWUWs5Vd7S/YCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iN38SAPpGh3M5H3fl7qAcEDa4JsDy6pvgoE5MRNmL2s=;
 b=l5PVNhDZ9oipd1pdhrMR7gbs2Pr4qdf+u8bqUMRcPms9Mxbppc1o9W1qYkloqDVMeoTR1oqpEYz2uBDfMAQfDMq0Z824PzXaBH2Mtu0yyGXtqHwU7PlGeB5AJFbCIRpc8gsReOshJYQjeUWLNxcNlbQP4MzQM+rrMWSBBP5VMEY=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3090.eurprd04.prod.outlook.com (10.167.169.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Tue, 13 Aug 2019 06:29:33 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84%5]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 06:29:33 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Kishon Vijay Abraham I <kishon@ti.com>, "lorenzo.pieralisi@arm.com"
 <lorenzo.pieralisi@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "M.h. Lian" <minghuan.lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy
 Zang <roy.zang@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
 "tpiepho@impinj.com" <tpiepho@impinj.com>, Leonard Crestez
 <leonard.crestez@nxp.com>, "andrew.smirnov@gmail.com"
 <andrew.smirnov@gmail.com>, "yue.wang@amlogic.com" <yue.wang@amlogic.com>,
 "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
 "dwmw@amazon.co.uk" <dwmw@amazon.co.uk>, "jonnyc@amazon.com"
 <jonnyc@amazon.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCHv4 1/2] PCI: layerscape: Add the bar_fixed_64bit
 property in EP driver.
Thread-Topic: [EXT] Re: [PATCHv4 1/2] PCI: layerscape: Add the bar_fixed_64bit
 property in EP driver.
Thread-Index: AQHVUYOm7tfhNXqCL0aGeKjUvCbtGab4fkcAgAAe9XA=
Date: Tue, 13 Aug 2019 06:29:33 +0000
Message-ID: <AM5PR04MB329910AC59AD7DCE39A6F6CDF5D20@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190813025317.48290-1-xiaowei.bao@nxp.com>
 <4a456d72-f5b5-e860-0215-dd215e2edf09@ti.com>
In-Reply-To: <4a456d72-f5b5-e860-0215-dd215e2edf09@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49c6a725-aede-4ab1-cb9c-08d71fb79af0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3090; 
x-ms-traffictypediagnostic: AM5PR04MB3090:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB30901166DA59A71A06C871FEF5D20@AM5PR04MB3090.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1850;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(189003)(199004)(13464003)(52536014)(26005)(14454004)(66066001)(66946007)(66556008)(64756008)(66446008)(5660300002)(66476007)(2201001)(305945005)(486006)(478600001)(44832011)(110136005)(316002)(229853002)(8936002)(71190400001)(76116006)(74316002)(7736002)(6436002)(71200400001)(446003)(11346002)(76176011)(33656002)(8676002)(55016002)(7416002)(25786009)(2906002)(476003)(102836004)(99286004)(81166006)(86362001)(186003)(9686003)(81156014)(53546011)(7696005)(6506007)(256004)(6116002)(53936002)(3846002)(6246003)(2501003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3090;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: GF/JZLohP/WTxS7OazLCkA1CpnHOotiHyL296CXdGP9cyNrw9UzrrhMFcbT7PU218h6xl7UDgEuIyvV330ctenswf7oPSVoh3iUJus7dsB2iWE1THZiIvghxm9Z1NugtyjR1Dh4d4v1Lp5Ru+EJrQ4qn94fLZTQ3onD7yNl4irXcTQkSvhCNY83Mb8J2AlFiXsCardoDQUqTWckYbnSBItmIyoZwVO8Xgd0zMTaHst3d++58bjeenwIqvcUuU4AbBSObZ50LADZHTAaHcS1S9JaVl3Jl+nNY0wZ+0bU6q0Rf2eMJGEJ4+cN5TafkD2Yx/ArqCMG27/8wnXGq+aBI/AHR3IkJ2zq6qH+AoyLFW1uTP0qVq75U7JpH2WQwhg+lFTH3iSCZEIGjsiKYxx30OnPDcTY5whN5cEZ4F50+NtA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c6a725-aede-4ab1-cb9c-08d71fb79af0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 06:29:33.4183 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CvHyMyV9UNPYPpyNji1401XTkisHyKaWHvS5w+qiXP+kFb0imNRTUA9pR14X9JA8C9xPnkpqLgyPh1Y1bCXV/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3090
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
cmFoYW0gSSA8a2lzaG9uQHRpLmNvbT4NCj4gU2VudDogMjAxOeW5tDjmnIgxM+aXpSAxMjozNg0K
PiBUbzogWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54cC5jb20+OyBsb3JlbnpvLnBpZXJhbGlz
aUBhcm0uY29tOw0KPiBiaGVsZ2Fhc0Bnb29nbGUuY29tOyBNLmguIExpYW4gPG1pbmdodWFuLmxp
YW5AbnhwLmNvbT47IE1pbmdrYWkgSHUNCj4gPG1pbmdrYWkuaHVAbnhwLmNvbT47IFJveSBaYW5n
IDxyb3kuemFuZ0BueHAuY29tPjsNCj4gbC5zdGFjaEBwZW5ndXRyb25peC5kZTsgdHBpZXBob0Bp
bXBpbmouY29tOyBMZW9uYXJkIENyZXN0ZXoNCj4gPGxlb25hcmQuY3Jlc3RlekBueHAuY29tPjsg
YW5kcmV3LnNtaXJub3ZAZ21haWwuY29tOw0KPiB5dWUud2FuZ0BhbWxvZ2ljLmNvbTsgaGF5YXNo
aS5rdW5paGlrb0Bzb2Npb25leHQuY29tOw0KPiBkd213QGFtYXpvbi5jby51azsgam9ubnljQGFt
YXpvbi5jb207IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnOw0KPiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSHY0
IDEvMl0gUENJOiBsYXllcnNjYXBlOiBBZGQgdGhlIGJhcl9maXhlZF82NGJpdA0KPiBwcm9wZXJ0
eSBpbiBFUCBkcml2ZXIuDQo+IA0KPiBDYXV0aW9uOiBFWFQgRW1haWwNCj4gDQo+IE9uIDEzLzA4
LzE5IDg6MjMgQU0sIFhpYW93ZWkgQmFvIHdyb3RlOg0KPiA+IFRoZSBQQ0llIGNvbnRyb2xsZXIg
b2YgbGF5ZXJzY2FwZSBqdXN0IGhhdmUgNCBCQVJzLCBCQVIwIGFuZCBCQVIxIGlzDQo+ID4gMzJi
aXQsIEJBUjMgYW5kIEJBUjQgaXMgNjRiaXQsIHRoaXMgaXMgZGV0ZXJtaW5lZCBieSBoYXJkd2Fy
ZSwNCj4gDQo+IERvIHlvdSBtZWFuIEJBUjIgaW5zdGVhZCBvZiBCQVIzIGhlcmU/DQpZZXMuDQo+
IA0KPiBUaGFua3MNCj4gS2lzaG9uDQo+IA0KPiA+IHNvIHNldCB0aGUgYmFyX2ZpeGVkXzY0Yml0
IHdpdGggMHgxNC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFhpYW93ZWkgQmFvIDx4aWFvd2Vp
LmJhb0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+IHYyOg0KPiA+ICAtIFJlcGxhY2UgdmFsdWUgMHgx
NCB3aXRoIGEgbWFjcm8uDQo+ID4gdjM6DQo+ID4gIC0gTm8gY2hhbmdlLg0KPiA+IHY0Og0KPiA+
ICAtIHNlbmQgdGhlIHBhdGNoIGFnYWluIHdpdGggJy0tdG8nLg0KPiA+DQo+ID4gIGRyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMgfCAgICAxICsNCj4gPiAgMSBm
aWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbnMoKyksIDAgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAu
Yw0KPiA+IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0K
PiA+IGluZGV4IGJlNjFkOTYuLjIyN2MzM2IgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMNCj4gPiBAQCAtNDQsNiArNDQsNyBA
QCBzdGF0aWMgaW50IGxzX3BjaWVfZXN0YWJsaXNoX2xpbmsoc3RydWN0IGR3X3BjaWUgKnBjaSkN
Cj4gPiAgICAgICAubGlua3VwX25vdGlmaWVyID0gZmFsc2UsDQo+ID4gICAgICAgLm1zaV9jYXBh
YmxlID0gdHJ1ZSwNCj4gPiAgICAgICAubXNpeF9jYXBhYmxlID0gZmFsc2UsDQo+ID4gKyAgICAg
LmJhcl9maXhlZF82NGJpdCA9ICgxIDw8IEJBUl8yKSB8ICgxIDw8IEJBUl80KSwNCj4gPiAgfTsN
Cj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9lcGNfZmVhdHVyZXMqDQo+ID4NCg==
