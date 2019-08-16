Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D58590079
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 13:06:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4690rC4s2qzDqPw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 21:06:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.3.82; helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="aKhq5B4Q"; 
 dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30082.outbound.protection.outlook.com [40.107.3.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4690ml5TRjzDrTs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 21:03:34 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hI/ylECEVy0V3HbWWoXhNKSHSGCvhTrp0u4GFprjAGC6wSlbqT3SQe8AK6NCHszODLOo6B8Kls8Is27gUhMz2WBLld3/eo3GOi3RHC9aBNw0aZAIg1XkU2TLxMi+YkpPkHWPh0pOpBR9GpmsZCNKPPoF6yaBemLqW8qVL8UAiLQkBcuxtaD3sjqaxuRepkE9x0AQhPePlJUtfGonF76eiPLVr6lkGPGceQQxyJFJHgJFFaxMkbW6IhZ31h5EBRVrUwANiKMf8aISHgkksYTrAjdYYAwT4X5YUCxhqXrOU+GTwyEChi8waqnHDPyGWWdH+7b8RNASBWYe4ZvSd7jICQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oo2QWpu9MemQmPnNNrQCkibUh7UqG6CAaKxrcGIK3vw=;
 b=mAYxBD0B3rIbs5KeggKQPv5fC59ZEakcsFQ0wsrFWx6EG8QRpGHjwBfy8Po3A9yI4B4E25ZOP9vp62K1q25VRzLrFI1hYrNJOlrCI7vboa4veuBjF6nqBdBJaRCq9Ny7KLVlGBpAT8pGWXELTOuWZHiKGerdhrrywOrH/BTsdlanz08JiQGUSWW2AUU+bTCkOmQBERPmoboc5zM3QrbCi/cWFWxtPFULJ+WrT9zyyczULCGBI6uI/BCJONtYV659Dl/I530N2vzC8OXgs63f0rj0g3ny3xKubpQNGgK6cZ/7KfhzkhZ1c+Xh1M3dVx3dShWsN7kkmth5WO3a7ZZpOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oo2QWpu9MemQmPnNNrQCkibUh7UqG6CAaKxrcGIK3vw=;
 b=aKhq5B4QO/WOcboto4L717u4Kf/Pl796J+srEtsYLKetL5e0hlOb3ALQnubMvG091DSFLDlMp4Hf0lAXW9Eobxbi0RCRd3lqZ5i53f16KttN+1xBGg/WpG/KjPjfhOKbx3h9he+VVbnmte/7TH4QrycG7sXna/T+ACTF/3sUWIA=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3202.eurprd04.prod.outlook.com (10.167.171.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Fri, 16 Aug 2019 11:03:29 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84%5]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 11:03:29 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH 05/10] PCI: layerscape: Modify the way of getting
 capability with different PEX
Thread-Topic: [PATCH 05/10] PCI: layerscape: Modify the way of getting
 capability with different PEX
Thread-Index: AQHVU0Yf1dFxsptJWkSb+ZGFXdO2C6b8KaSAgADs2oCAAHzkAIAAChAQ
Date: Fri, 16 Aug 2019 11:03:29 +0000
Message-ID: <AM5PR04MB329928AF2A079C7EE2520FC2F5AF0@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190815083716.4715-1-xiaowei.bao@nxp.com>
 <20190815083716.4715-5-xiaowei.bao@nxp.com>
 <20190815125103.GH43882@e119886-lin.cambridge.arm.com>
 <AM5PR04MB329966792C66E9AAB6C0B30DF5AF0@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <20190816102545.GC14111@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190816102545.GC14111@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee55ff18-9665-460d-fef0-08d722395ec4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3202; 
x-ms-traffictypediagnostic: AM5PR04MB3202:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB32027B3E94B0C4C5A721DE24F5AF0@AM5PR04MB3202.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(199004)(13464003)(189003)(5660300002)(7696005)(76176011)(52536014)(7416002)(66446008)(7736002)(305945005)(74316002)(26005)(66066001)(55016002)(6916009)(6436002)(229853002)(102836004)(53546011)(6506007)(476003)(44832011)(186003)(486006)(11346002)(25786009)(33656002)(446003)(54906003)(2906002)(9686003)(3846002)(99286004)(71200400001)(8936002)(4326008)(71190400001)(316002)(76116006)(14454004)(6246003)(66946007)(53936002)(64756008)(81156014)(478600001)(86362001)(8676002)(66476007)(66556008)(6116002)(256004)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3202;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: dF3f7/xV3dXT9UBU/Sbg/SczEuiZPsYbMjlyMal2PYUDXw8oYdD5FsiYUPZDKF5XtUBpdS6AIlxya7M1Bu3EiuabXQ5Gqc1gTY/ATa5Pd1pU0O4OaU3dZM6rBmwSuzkphDNDpXW0AeSKgnT3VUC2aQkFuDNmy7vO5yCggBBfO1WS9Aey4dN7F7qAZYlqNtiIBYU+bvgG1VIvrZCIInJ7cUtGRmfZlc1yl+/kmqxeqOIAbT0b/M4ydMIzdLRs4wuZcpcMLBAXQBt51ZD2mKYHP8RVJzBjZmoAFex+4j810W3NOoOdLsPfrRfUGQwuAFWQHFJJvh5tDcpIJlIs/UGfvCoY9CgsKtvMcQ3fS0+IPVmtPMCaG1lbMgQsQu1axvz4948IHEwJ2DnfE2+XyconrJ+R69A1siGtZfcOGNbJfaE=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee55ff18-9665-460d-fef0-08d722395ec4
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 11:03:29.3044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ntlrsmmdAwCQxrvv4px3KxhIkZYUzVHzCniyS4cOlC/U1SdN5hPSGBlzrTwSz96xGjrJ0+FQtlSszxlkFNZCwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3202
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
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "Z.q. Hou" <zhiqiang.hou@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "kishon@ti.com" <kishon@ti.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IE11cnJheSA8
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE55bm0OOaciDE25pelIDE4OjI2DQo+
IFRvOiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gQ2M6IGppbmdvb2hhbjFA
Z21haWwuY29tOyBndXN0YXZvLnBpbWVudGVsQHN5bm9wc3lzLmNvbTsNCj4gYmhlbGdhYXNAZ29v
Z2xlLmNvbTsgcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsNCj4gc2hh
d25ndW9Aa2VybmVsLm9yZzsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBraXNob25AdGku
Y29tOw0KPiBsb3JlbnpvLnBpZXJhbGlzaUBhcm0uY29tOyBhcm5kQGFybmRiLmRlOyBncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZzsNCj4gTS5oLiBMaWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+
OyBNaW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5jb20+Ow0KPiBSb3kgWmFuZyA8cm95LnphbmdA
bnhwLmNvbT47IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnOyBa
LnEuIEhvdQ0KPiA8emhpcWlhbmcuaG91QG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
MDUvMTBdIFBDSTogbGF5ZXJzY2FwZTogTW9kaWZ5IHRoZSB3YXkgb2YgZ2V0dGluZw0KPiBjYXBh
YmlsaXR5IHdpdGggZGlmZmVyZW50IFBFWA0KPiANCj4gT24gRnJpLCBBdWcgMTYsIDIwMTkgYXQg
MDM6MDA6MDBBTSArMDAwMCwgWGlhb3dlaSBCYW8gd3JvdGU6DQo+ID4NCj4gPg0KPiA+ID4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206IEFuZHJldyBNdXJyYXkgPGFuZHJl
dy5tdXJyYXlAYXJtLmNvbT4NCj4gPiA+IFNlbnQ6IDIwMTnlubQ45pyIMTXml6UgMjA6NTENCj4g
PiA+IFRvOiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gPiA+IENjOiBqaW5n
b29oYW4xQGdtYWlsLmNvbTsgZ3VzdGF2by5waW1lbnRlbEBzeW5vcHN5cy5jb207DQo+ID4gPiBi
aGVsZ2Fhc0Bnb29nbGUuY29tOyByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0u
Y29tOw0KPiA+ID4gc2hhd25ndW9Aa2VybmVsLm9yZzsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5j
b20+OyBraXNob25AdGkuY29tOw0KPiA+ID4gbG9yZW56by5waWVyYWxpc2lAYXJtLmNvbTsgYXJu
ZEBhcm5kYi5kZTsNCj4gPiA+IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBNLmguIExpYW4g
PG1pbmdodWFuLmxpYW5AbnhwLmNvbT47DQo+ID4gPiBNaW5na2FpIEh1IDxtaW5na2FpLmh1QG54
cC5jb20+OyBSb3kgWmFuZyA8cm95LnphbmdAbnhwLmNvbT47DQo+ID4gPiBsaW51eC1wY2lAdmdl
ci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9y
ZzsNCj4gPiA+IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+ID4gPiBTdWJqZWN0OiBS
ZTogW1BBVENIIDA1LzEwXSBQQ0k6IGxheWVyc2NhcGU6IE1vZGlmeSB0aGUgd2F5IG9mDQo+ID4g
PiBnZXR0aW5nIGNhcGFiaWxpdHkgd2l0aCBkaWZmZXJlbnQgUEVYDQo+ID4gPg0KPiA+ID4gT24g
VGh1LCBBdWcgMTUsIDIwMTkgYXQgMDQ6Mzc6MTFQTSArMDgwMCwgWGlhb3dlaSBCYW8gd3JvdGU6
DQo+ID4gPiA+IFRoZSBkaWZmZXJlbnQgUENJZSBjb250cm9sbGVyIGluIG9uZSBib2FyZCBtYXkg
YmUgaGF2ZSBkaWZmZXJlbnQNCj4gPiA+ID4gY2FwYWJpbGl0eSBvZiBNU0kgb3IgTVNJWCwgc28g
Y2hhbmdlIHRoZSB3YXkgb2YgZ2V0dGluZyB0aGUgTVNJDQo+ID4gPiA+IGNhcGFiaWxpdHksIG1h
a2UgaXQgbW9yZSBmbGV4aWJsZS4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWGlh
b3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54cC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiAgZHJp
dmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYyB8IDI4DQo+ID4gPiA+
ICsrKysrKysrKysrKysrKysrKystLS0tLS0tDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjEg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMNCj4gPiA+
ID4gYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4g
PiA+IGluZGV4IGJlNjFkOTYuLjk0MDRjYTAgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMNCj4gPiA+ID4gKysrIGIvZHJp
dmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+ID4gPiBAQCAt
MjIsNiArMjIsNyBAQA0KPiA+ID4gPg0KPiA+ID4gPiAgc3RydWN0IGxzX3BjaWVfZXAgew0KPiA+
ID4gPiAgCXN0cnVjdCBkd19wY2llCQkqcGNpOw0KPiA+ID4gPiArCXN0cnVjdCBwY2lfZXBjX2Zl
YXR1cmVzCSpsc19lcGM7DQo+ID4gPiA+ICB9Ow0KPiA+ID4gPg0KPiA+ID4gPiAgI2RlZmluZSB0
b19sc19wY2llX2VwKHgpCWRldl9nZXRfZHJ2ZGF0YSgoeCktPmRldikNCj4gPiA+ID4gQEAgLTQw
LDI1ICs0MSwyNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0KPiA+ID4gbHNf
cGNpZV9lcF9vZl9tYXRjaFtdID0gew0KPiA+ID4gPiAgCXsgfSwNCj4gPiA+ID4gIH07DQo+ID4g
PiA+DQo+ID4gPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9lcGNfZmVhdHVyZXMgbHNfcGNp
ZV9lcGNfZmVhdHVyZXMgPSB7DQo+ID4gPiA+IC0JLmxpbmt1cF9ub3RpZmllciA9IGZhbHNlLA0K
PiA+ID4gPiAtCS5tc2lfY2FwYWJsZSA9IHRydWUsDQo+ID4gPiA+IC0JLm1zaXhfY2FwYWJsZSA9
IGZhbHNlLA0KPiA+ID4gPiAtfTsNCj4gPiA+ID4gLQ0KPiA+ID4gPiAgc3RhdGljIGNvbnN0IHN0
cnVjdCBwY2lfZXBjX2ZlYXR1cmVzKg0KPiA+ID4gPiBsc19wY2llX2VwX2dldF9mZWF0dXJlcyhz
dHJ1Y3QgZHdfcGNpZV9lcCAqZXApICB7DQo+ID4gPiA+IC0JcmV0dXJuICZsc19wY2llX2VwY19m
ZWF0dXJlczsNCj4gPiA+ID4gKwlzdHJ1Y3QgZHdfcGNpZSAqcGNpID0gdG9fZHdfcGNpZV9mcm9t
X2VwKGVwKTsNCj4gPiA+ID4gKwlzdHJ1Y3QgbHNfcGNpZV9lcCAqcGNpZSA9IHRvX2xzX3BjaWVf
ZXAocGNpKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCXJldHVybiBwY2llLT5sc19lcGM7DQo+ID4g
PiA+ICB9DQo+ID4gPiA+DQo+ID4gPiA+ICBzdGF0aWMgdm9pZCBsc19wY2llX2VwX2luaXQoc3Ry
dWN0IGR3X3BjaWVfZXAgKmVwKSAgew0KPiA+ID4gPiAgCXN0cnVjdCBkd19wY2llICpwY2kgPSB0
b19kd19wY2llX2Zyb21fZXAoZXApOw0KPiA+ID4gPiArCXN0cnVjdCBsc19wY2llX2VwICpwY2ll
ID0gdG9fbHNfcGNpZV9lcChwY2kpOw0KPiA+ID4gPiAgCWVudW0gcGNpX2Jhcm5vIGJhcjsNCj4g
PiA+ID4NCj4gPiA+ID4gIAlmb3IgKGJhciA9IEJBUl8wOyBiYXIgPD0gQkFSXzU7IGJhcisrKQ0K
PiA+ID4gPiAgCQlkd19wY2llX2VwX3Jlc2V0X2JhcihwY2ksIGJhcik7DQo+ID4gPiA+ICsNCj4g
PiA+ID4gKwlwY2llLT5sc19lcGMtPm1zaV9jYXBhYmxlID0gZXAtPm1zaV9jYXAgPyB0cnVlIDog
ZmFsc2U7DQo+ID4gPiA+ICsJcGNpZS0+bHNfZXBjLT5tc2l4X2NhcGFibGUgPSBlcC0+bXNpeF9j
YXAgPyB0cnVlIDogZmFsc2U7DQo+ID4gPiA+ICB9DQo+ID4gPiA+DQo+ID4gPiA+ICBzdGF0aWMg
aW50IGxzX3BjaWVfZXBfcmFpc2VfaXJxKHN0cnVjdCBkd19wY2llX2VwICplcCwgdTgNCj4gPiA+
ID4gZnVuY19ubywgQEANCj4gPiA+ID4gLTExOCw2ICsxMjAsNyBAQCBzdGF0aWMgaW50IF9faW5p
dCBsc19wY2llX2VwX3Byb2JlKHN0cnVjdA0KPiA+ID4gPiBwbGF0Zm9ybV9kZXZpY2UNCj4gPiA+
ICpwZGV2KQ0KPiA+ID4gPiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7DQo+ID4g
PiA+ICAJc3RydWN0IGR3X3BjaWUgKnBjaTsNCj4gPiA+ID4gIAlzdHJ1Y3QgbHNfcGNpZV9lcCAq
cGNpZTsNCj4gPiA+ID4gKwlzdHJ1Y3QgcGNpX2VwY19mZWF0dXJlcyAqbHNfZXBjOw0KPiA+ID4g
PiAgCXN0cnVjdCByZXNvdXJjZSAqZGJpX2Jhc2U7DQo+ID4gPiA+ICAJaW50IHJldDsNCj4gPiA+
ID4NCj4gPiA+ID4gQEAgLTEyOSw2ICsxMzIsMTAgQEAgc3RhdGljIGludCBfX2luaXQgbHNfcGNp
ZV9lcF9wcm9iZShzdHJ1Y3QNCj4gPiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+ID4g
IAlpZiAoIXBjaSkNCj4gPiA+ID4gIAkJcmV0dXJuIC1FTk9NRU07DQo+ID4gPiA+DQo+ID4gPiA+
ICsJbHNfZXBjID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpsc19lcGMpLCBHRlBfS0VSTkVM
KTsNCj4gPiA+ID4gKwlpZiAoIWxzX2VwYykNCj4gPiA+ID4gKwkJcmV0dXJuIC1FTk9NRU07DQo+
ID4gPiA+ICsNCj4gPiA+ID4gIAlkYmlfYmFzZSA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5h
bWUocGRldiwNCj4gSU9SRVNPVVJDRV9NRU0sDQo+ID4gPiAicmVncyIpOw0KPiA+ID4gPiAgCXBj
aS0+ZGJpX2Jhc2UgPSBkZXZtX3BjaV9yZW1hcF9jZmdfcmVzb3VyY2UoZGV2LCBkYmlfYmFzZSk7
DQo+ID4gPiA+ICAJaWYgKElTX0VSUihwY2ktPmRiaV9iYXNlKSkNCj4gPiA+ID4gQEAgLTEzOSw2
ICsxNDYsMTMgQEAgc3RhdGljIGludCBfX2luaXQgbHNfcGNpZV9lcF9wcm9iZShzdHJ1Y3QNCj4g
PiA+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+ID4gIAlwY2ktPm9wcyA9ICZsc19wY2ll
X2VwX29wczsNCj4gPiA+ID4gIAlwY2llLT5wY2kgPSBwY2k7DQo+ID4gPiA+DQo+ID4gPiA+ICsJ
bHNfZXBjLT5saW5rdXBfbm90aWZpZXIgPSBmYWxzZSwNCj4gPiA+ID4gKwlsc19lcGMtPm1zaV9j
YXBhYmxlID0gdHJ1ZSwNCj4gPiA+ID4gKwlsc19lcGMtPm1zaXhfY2FwYWJsZSA9IHRydWUsDQo+
ID4gPg0KPiA+ID4gQXMgW21zaSxtc2l4XV9jYXBhYmxlIGlzIHNob3J0bHkgc2V0IGZyb20gbHNf
cGNpZV9lcF9pbml0IC0gaXMgdGhlcmUNCj4gPiA+IGFueSByZWFzb24gdG8gc2V0IHRoZW0gaGVy
ZSAodG8gcG90ZW50aWFsbHkgaW5jb3JyZWN0IHZhbHVlcyk/DQo+ID4gVGhpcyBpcyBhIElOSVQg
dmFsdWUsIG1heWJlIGZhbHNlIGlzIGJldHRlciBmb3IgbXNpX2NhcGFibGUgYW5kDQo+ID4gbXNp
eF9jYXBhYmxlLCBvZiBjb3Vyc2UsIHdlIGRvbid0IG5lZWQgdG8gc2V0IGl0Lg0KPiANCj4gbHNf
ZXBjIGlzIGt6YWxsb2MnZCBhbmQgc28gYWxsIHplcm9zLCBzbyB5b3UgZ2V0IGZhbHNlIGZvciBm
cmVlLiBJIHRoaW5rIHlvdSBjYW4NCj4gcmVtb3ZlIHRoZXNlIHR3byBsaW5lcyAob3IgYWxsIHRo
cmVlIGlmIHlvdSBkb24ndCBjYXJlIHRoYXQgbGlua3VwX25vdGlmaWVyIGlzbid0DQo+IGV4cGxp
Y2l0bHkgc2V0KS4NCkFncmVlLCBUaGlzIGlzIGNvcnJlY3QsIHRoYW5rcyBhIGxvdC4NCj4gDQo+
IFRoYW5rcywNCj4gDQo+IEFuZHJldyBNdXJyYXkNCj4gDQo+ID4gPg0KPiA+ID4gVGhhbmtzLA0K
PiA+ID4NCj4gPiA+IEFuZHJldyBNdXJyYXkNCj4gPiA+DQo+ID4gPiA+ICsJbHNfZXBjLT5iYXJf
Zml4ZWRfNjRiaXQgPSAoMSA8PCBCQVJfMikgfCAoMSA8PCBCQVJfNCksDQo+ID4gPiA+ICsNCj4g
PiA+ID4gKwlwY2llLT5sc19lcGMgPSBsc19lcGM7DQo+ID4gPiA+ICsNCj4gPiA+ID4gIAlwbGF0
Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBwY2llKTsNCj4gPiA+ID4NCj4gPiA+ID4gIAlyZXQgPSBs
c19hZGRfcGNpZV9lcChwY2llLCBwZGV2KTsNCj4gPiA+ID4gLS0NCj4gPiA+ID4gMi45LjUNCj4g
PiA+ID4NCg==
