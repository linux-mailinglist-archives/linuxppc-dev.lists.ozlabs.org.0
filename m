Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDCEB29A8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2019 06:18:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VfPl6HbqzF5s2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2019 14:18:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.6.79; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="DUTIA9vN"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60079.outbound.protection.outlook.com [40.107.6.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VfLP3Wr5zF4km
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 14:15:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4sd5G4ztslXueEROxUfqkJ0qkxTVR9FJqj/QidGLfXpLih+mXNLAZCbNry4Cc+MAmLJ7PqjtHB0BTpyu5wy07FWd3QAF7psiysljMs4hsDOBsEDLQA+NMdqzh1yjc016bAzMRhuxpTzOT0tGtaRqFH2lrd0NI6JC7nvJCh1PlBKfN/GPuj4QMgxILLo/IMsz6KWEQZ/HCKOVLFnvaQKqSjuGmXE71HiQl3JLAyXIvxF4KdXz2OxDSE6ctfEfVjpvXLFWE6g7buLvg7h0suVCjd76z599qpB+ya5KQgp1PXMv8MbbE/hRC7l/l0pKyUxVLgj0VNu091JPD6+1n3XpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5Jr+i/FFRrI5HTy2QFh5Y8DBWcl2e3emWfrzU71oc4=;
 b=XVHcV9/s4Nd5AFUZ0mfYlMfM2y2K4KTSYCtv9OQdHyRv2KhO9R6ejFQVxD1W/SKre4d9wrUXlnzh4GsA8UgD2dALkAJP+Pi8A8sYF1nGgAFtCtJ54bx4kdJEV/OuCOt2sxOSIAH6AiZ+NhWIY9A7lnfe8ADqZfIfGevaubcfOI+X52ZGO3UmKMgFgaCi9kbrdcpGtZLT5SspU6DpxfTGVB5Q+nXiPlynlJtbY6uMJ/Xk0y+r9Rd7Zv8N2Z4enfjX/TbiR9myAm4OVgciHBTPP+1aoNtjQY6+O5bBVdZEPJcF/DqsuaUAXNwSfhTsnkH/mkrkRFHmH0Wo9MPt4GXFHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5Jr+i/FFRrI5HTy2QFh5Y8DBWcl2e3emWfrzU71oc4=;
 b=DUTIA9vNipXHJgMsCVfbWh2sua9xg5zqRo1JwHKgp6ChQxNi4wzZr/NKTPD+DXrXW8/wmKMUQSdnOzWvpKA47SF0YE3LHA9dCwT2XyQNttDVF7f/+Jh9ziFUtTOI/Ce6HeKiHbh/2CP2rcYLgkCI0CrVbVLYSjLN/IFUB00fPH8=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3057.eurprd04.prod.outlook.com (10.175.229.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Sat, 14 Sep 2019 04:15:20 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41%3]) with mapi id 15.20.2241.022; Sat, 14 Sep 2019
 04:15:20 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v3 10/11] arm64: dts: layerscape: Add PCIe EP node for
 ls1088a
Thread-Topic: [PATCH v3 10/11] arm64: dts: layerscape: Add PCIe EP node for
 ls1088a
Thread-Index: AQHVYT5oVK45giVaYUuJ12uPbJqjnacYW/kAgADW+HCADt8YgIACkTiA
Date: Sat, 14 Sep 2019 04:15:20 +0000
Message-ID: <AM5PR04MB3299212310A6F3B40AA073F7F5B20@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-11-xiaowei.bao@nxp.com>
 <20190902130628.GL9720@e119886-lin.cambridge.arm.com>
 <AM5PR04MB329926C6F424C4BE1CE9B787F5B90@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <20190912130159.GF9720@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190912130159.GF9720@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 42c70c6f-0c27-46d8-11e9-08d738ca2837
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3057; 
x-ms-traffictypediagnostic: AM5PR04MB3057:|AM5PR04MB3057:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB30578CBE61B14FEDAADEADE3F5B20@AM5PR04MB3057.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 01604FB62B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(39840400004)(136003)(376002)(199004)(189003)(13464003)(14444005)(81156014)(99286004)(229853002)(54906003)(9686003)(33656002)(6116002)(3846002)(53936002)(55016002)(316002)(6246003)(6436002)(478600001)(486006)(446003)(5660300002)(7416002)(11346002)(6916009)(14454004)(2906002)(86362001)(76176011)(6506007)(53546011)(8936002)(66066001)(7736002)(476003)(66946007)(7696005)(66476007)(66556008)(64756008)(66446008)(25786009)(76116006)(26005)(305945005)(74316002)(186003)(52536014)(71200400001)(71190400001)(44832011)(102836004)(4326008)(81166006)(8676002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3057;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q3KLzEX8/gTWM3dCWPqp2JjYcVYLkBQe4+6LKQdGaJzfYiw1CAGxm3yk0iH/TaQ/iiK9GBLdqbcUt5s/i4s+/GEAfEdNl9eX9r0hAKF2jzC9AA/RlLxdAPfXXOJBP9LJKgRCcn1nAErkq+5xMMzqypTfwb9lp4+HYYKqRRT1PjN7TakufZAQTNMU6bAFojXJrlWz1H2GLNLU2cTQBBjtKOR0EcgVzZT64vzQdBPQEyvl7h5+Ieb7nlJf7mV+Rc4GpqfLyJfGZgdFF9/EiCYJ2/u2LWAFYtFA628hK7rDbYSH+/R/Tnj7Ho1gNCCQOOQSUWi/H4njCJXa2q9k2x06n0AiVxXFCKy58WoNfb5yirvYkc2LZRPojbRuvSkkscZ86X+tG/S7WqyOjIeUWXx+9XfhXk1hsqdwMzSYjp7erjU=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c70c6f-0c27-46d8-11e9-08d738ca2837
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2019 04:15:20.3912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5yr9nCP6dxveLUjDMUGZMQU6+dpyTJjoYmwCOwGx6TQUawky+wabGRrXeHqF2j4Fj/7IFdVsbKcSvgwsYLSeCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3057
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "Z.q. Hou" <zhiqiang.hou@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IE11cnJheSA8
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE55bm0OeaciDEy5pelIDIxOjAyDQo+
IFRvOiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gQ2M6IHJvYmgrZHRAa2Vy
bmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207IHNoYXduZ3VvQGtlcm5lbC5vcmc7IExlbw0K
PiBMaSA8bGVveWFuZy5saUBueHAuY29tPjsga2lzaG9uQHRpLmNvbTsgbG9yZW56by5waWVyYWxp
c2lAYXJtLmNvbTsgTS5oLg0KPiBMaWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+OyBNaW5na2Fp
IEh1IDxtaW5na2FpLmh1QG54cC5jb20+OyBSb3kNCj4gWmFuZyA8cm95LnphbmdAbnhwLmNvbT47
IGppbmdvb2hhbjFAZ21haWwuY29tOw0KPiBndXN0YXZvLnBpbWVudGVsQHN5bm9wc3lzLmNvbTsg
bGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZzsgbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc7DQo+IGFybmRAYXJu
ZGIuZGU7IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOyBaLnEuIEhvdQ0KPiA8emhpcWlhbmcu
aG91QG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMTAvMTFdIGFybTY0OiBkdHM6
IGxheWVyc2NhcGU6IEFkZCBQQ0llIEVQIG5vZGUgZm9yDQo+IGxzMTA4OGENCj4gDQo+IE9uIFR1
ZSwgU2VwIDAzLCAyMDE5IGF0IDAyOjAxOjMyQU0gKzAwMDAsIFhpYW93ZWkgQmFvIHdyb3RlOg0K
PiA+DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBB
bmRyZXcgTXVycmF5IDxhbmRyZXcubXVycmF5QGFybS5jb20+DQo+ID4gPiBTZW50OiAyMDE55bm0
OeaciDLml6UgMjE6MDYNCj4gPiA+IFRvOiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNv
bT4NCj4gPiA+IENjOiByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOyBz
aGF3bmd1b0BrZXJuZWwub3JnOw0KPiA+ID4gTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBr
aXNob25AdGkuY29tOyBsb3JlbnpvLnBpZXJhbGlzaUBhcm0uY29tOw0KPiBNLmguDQo+ID4gPiBM
aWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+OyBNaW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5j
b20+OyBSb3kNCj4gPiA+IFphbmcgPHJveS56YW5nQG54cC5jb20+OyBqaW5nb29oYW4xQGdtYWls
LmNvbTsNCj4gPiA+IGd1c3Rhdm8ucGltZW50ZWxAc3lub3BzeXMuY29tOyBsaW51eC1wY2lAdmdl
ci5rZXJuZWwub3JnOw0KPiA+ID4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmc7IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnOw0KPiA+ID4gYXJuZEBhcm5k
Yi5kZTsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IFoucS4gSG91DQo+ID4gPiA8emhpcWlh
bmcuaG91QG54cC5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYzIDEwLzExXSBhcm02
NDogZHRzOiBsYXllcnNjYXBlOiBBZGQgUENJZSBFUA0KPiA+ID4gbm9kZSBmb3IgbHMxMDg4YQ0K
PiA+ID4NCj4gPiA+IE9uIE1vbiwgU2VwIDAyLCAyMDE5IGF0IDExOjE3OjE1QU0gKzA4MDAsIFhp
YW93ZWkgQmFvIHdyb3RlOg0KPiA+ID4gPiBBZGQgUENJZSBFUCBub2RlIGZvciBsczEwODhhIHRv
IHN1cHBvcnQgRVAgbW9kZS4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWGlhb3dl
aSBCYW8gPHhpYW93ZWkuYmFvQG54cC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiB2MjoNCj4g
PiA+ID4gIC0gUmVtb3ZlIHRoZSBwZi1vZmZzZXQgcHJvcGFydHkuDQo+ID4gPiA+IHYzOg0KPiA+
ID4gPiAgLSBObyBjaGFuZ2UuDQo+ID4gPiA+DQo+ID4gPiA+ICBhcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9mc2wtbHMxMDg4YS5kdHNpIHwgMzENCj4gPiA+ICsrKysrKysrKysrKysrKysr
KysrKysrKysrDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQ0KPiA+
ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
ZnNsLWxzMTA4OGEuZHRzaQ0KPiA+ID4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9m
c2wtbHMxMDg4YS5kdHNpDQo+ID4gPiA+IGluZGV4IGM2NzZkMDcuLmRhMjQ2YWIgMTAwNjQ0DQo+
ID4gPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwODhhLmR0
c2kNCj4gPiA+ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTA4
OGEuZHRzaQ0KPiA+ID4gPiBAQCAtNDgzLDYgKzQ4MywxNyBAQA0KPiA+ID4gPiAgCQkJc3RhdHVz
ID0gImRpc2FibGVkIjsNCj4gPiA+ID4gIAkJfTsNCj4gPiA+ID4NCj4gPiA+ID4gKwkJcGNpZV9l
cEAzNDAwMDAwIHsNCj4gPiA+ID4gKwkJCWNvbXBhdGlibGUgPSAiZnNsLGxzMTA4OGEtcGNpZS1l
cCIsImZzbCxscy1wY2llLWVwIjsNCj4gPiA+DQo+ID4gPiBIZXJlIHlvdSBzcGVjaWZ5IGEgZmFs
bGJhY2sgImZzbCxscy1wY2llLWVwIiB0aGF0IGlzIHJlbW92ZWQgYnkgdGhpcyBzZXJpZXMuDQo+
ID4gPg0KPiA+ID4gQmVzaWRlcyB0aGF0LCB0aGlzIGxvb2tzIE9LLg0KPiA+DQo+ID4gQXMgZXhw
bGFpbmVkLCB0aGUgImZzbCxscy1wY2llLWVwIiBpcyBuZWVkZWQsIGR1ZSB0byB0aGUgdS1ib290
IHdpbGwNCj4gPiBmaXh1cCB0aGUgc3RhdHVzIHByb3BlcnR5IGJhc2Ugb24gdGhpcyBjb21wYXRp
YmxlLCBJIHRoaW5rIHdlIHJlc2VydmUNCj4gPiB0aGlzIGNvbXBhdGlibGUgaXMgaGVscGZ1bGx5
LCBpZiBkZWxhdGUgdGhpcyBjb21wYXRpYmxlLCBJIGhhdmUgdG8gbW9kaWZ5IHRoZQ0KPiBjb2Rl
IG9mIGJvb3Rsb2FkZXIuDQo+IA0KPiBJIGFzc3VtZSB5b3UgbWVhbiB0aGF0IHUtYm9vdCBmaXhl
cyB1cCAiZnNsLGxzLXBjaWUtZXAiICpvbmx5KiBmb3IgbHMxMDQ2YQ0KPiBkZXZpY2VzPw0KDQpO
bywgYWxsIExheWVyc2NhcGUgcGxhdGZvcm0gb2YgTlhQLg0KDQo+IA0KPiBUaGFua3MsDQo+IA0K
PiBBbmRyZXcgTXVycmF5DQo+IA0KPiA+DQo+ID4gVGhhbmtzDQo+ID4gWElhb3dlaQ0KPiA+DQo+
ID4gPg0KPiA+ID4gVGhhbmtzLA0KPiA+ID4NCj4gPiA+IEFuZHJldyBNdXJyYXkNCj4gPiA+DQo+
ID4gPiA+ICsJCQlyZWcgPSA8MHgwMCAweDAzNDAwMDAwIDB4MCAweDAwMTAwMDAwDQo+ID4gPiA+
ICsJCQkgICAgICAgMHgyMCAweDAwMDAwMDAwIDB4OCAweDAwMDAwMDAwPjsNCj4gPiA+ID4gKwkJ
CXJlZy1uYW1lcyA9ICJyZWdzIiwgImFkZHJfc3BhY2UiOw0KPiA+ID4gPiArCQkJbnVtLWliLXdp
bmRvd3MgPSA8MjQ+Ow0KPiA+ID4gPiArCQkJbnVtLW9iLXdpbmRvd3MgPSA8MTI4PjsNCj4gPiA+
ID4gKwkJCW1heC1mdW5jdGlvbnMgPSAvYml0cy8gOCA8Mj47DQo+ID4gPiA+ICsJCQlzdGF0dXMg
PSAiZGlzYWJsZWQiOw0KPiA+ID4gPiArCQl9Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICAJCXBjaWVA
MzUwMDAwMCB7DQo+ID4gPiA+ICAJCQljb21wYXRpYmxlID0gImZzbCxsczEwODhhLXBjaWUiOw0K
PiA+ID4gPiAgCQkJcmVnID0gPDB4MDAgMHgwMzUwMDAwMCAweDAgMHgwMDEwMDAwMCAgIC8qIGNv
bnRyb2xsZXINCj4gPiA+IHJlZ2lzdGVycyAqLw0KPiA+ID4gPiBAQCAtNTA4LDYgKzUxOSwxNiBA
QA0KPiA+ID4gPiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiA+ID4gIAkJfTsNCj4gPiA+
ID4NCj4gPiA+ID4gKwkJcGNpZV9lcEAzNTAwMDAwIHsNCj4gPiA+ID4gKwkJCWNvbXBhdGlibGUg
PSAiZnNsLGxzMTA4OGEtcGNpZS1lcCIsImZzbCxscy1wY2llLWVwIjsNCj4gPiA+ID4gKwkJCXJl
ZyA9IDwweDAwIDB4MDM1MDAwMDAgMHgwIDB4MDAxMDAwMDANCj4gPiA+ID4gKwkJCSAgICAgICAw
eDI4IDB4MDAwMDAwMDAgMHg4IDB4MDAwMDAwMDA+Ow0KPiA+ID4gPiArCQkJcmVnLW5hbWVzID0g
InJlZ3MiLCAiYWRkcl9zcGFjZSI7DQo+ID4gPiA+ICsJCQludW0taWItd2luZG93cyA9IDw2PjsN
Cj4gPiA+ID4gKwkJCW51bS1vYi13aW5kb3dzID0gPDg+Ow0KPiA+ID4gPiArCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsNCj4gPiA+ID4gKwkJfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiAgCQlwY2llQDM2
MDAwMDAgew0KPiA+ID4gPiAgCQkJY29tcGF0aWJsZSA9ICJmc2wsbHMxMDg4YS1wY2llIjsNCj4g
PiA+ID4gIAkJCXJlZyA9IDwweDAwIDB4MDM2MDAwMDAgMHgwIDB4MDAxMDAwMDAgICAvKiBjb250
cm9sbGVyDQo+ID4gPiByZWdpc3RlcnMgKi8NCj4gPiA+ID4gQEAgLTUzMyw2ICs1NTQsMTYgQEAN
Cj4gPiA+ID4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gPiA+ICAJCX07DQo+ID4gPiA+
DQo+ID4gPiA+ICsJCXBjaWVfZXBAMzYwMDAwMCB7DQo+ID4gPiA+ICsJCQljb21wYXRpYmxlID0g
ImZzbCxsczEwODhhLXBjaWUtZXAiLCJmc2wsbHMtcGNpZS1lcCI7DQo+ID4gPiA+ICsJCQlyZWcg
PSA8MHgwMCAweDAzNjAwMDAwIDB4MCAweDAwMTAwMDAwDQo+ID4gPiA+ICsJCQkgICAgICAgMHgz
MCAweDAwMDAwMDAwIDB4OCAweDAwMDAwMDAwPjsNCj4gPiA+ID4gKwkJCXJlZy1uYW1lcyA9ICJy
ZWdzIiwgImFkZHJfc3BhY2UiOw0KPiA+ID4gPiArCQkJbnVtLWliLXdpbmRvd3MgPSA8Nj47DQo+
ID4gPiA+ICsJCQludW0tb2Itd2luZG93cyA9IDw4PjsNCj4gPiA+ID4gKwkJCXN0YXR1cyA9ICJk
aXNhYmxlZCI7DQo+ID4gPiA+ICsJCX07DQo+ID4gPiA+ICsNCj4gPiA+ID4gIAkJc21tdTogaW9t
bXVANTAwMDAwMCB7DQo+ID4gPiA+ICAJCQljb21wYXRpYmxlID0gImFybSxtbXUtNTAwIjsNCj4g
PiA+ID4gIAkJCXJlZyA9IDwwIDB4NTAwMDAwMCAwIDB4ODAwMDAwPjsNCj4gPiA+ID4gLS0NCj4g
PiA+ID4gMi45LjUNCj4gPiA+ID4NCg==
