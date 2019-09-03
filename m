Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E800A5F3B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 04:13:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Mr973TKDzDqcW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 12:13:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.6.55; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="sIMVZeDQ"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60055.outbound.protection.outlook.com [40.107.6.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Mr6t1m9WzDqbq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 12:11:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=io6/yf0jz7jwl7LzHJYWpAyeVjC8oXpaGHgCHxXPwlA0A2s5LEWZMzyejY3aID6ekLbMyMCRX9uZFnlWrB+jerNHpEApGq61ssGq0OLQwiZiZFXUtT5Uv10MDHB7CDGguoI7twDcXkVHZq1MMAX6v5R7jCZha1RL2GRRKo3Mlq5iuY9KzmAtFC5xOf5PcfeDrsu12KFdIeZgMouDJlmTXH0+P2oukqEDMxFpyGlnTpXIbAcOTjsi6TkewgKAI/aK2Cl5Tnbk0BIYclTbB1hCIwd1yXxXNsg4tPnaTcC3r9rEglgR6CMYLuQFxrzkeHiKIyBPtP+TPB8WvJ6EgsGbFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RNDon0yAqg/SIj2pHFav4NeZJPpZWHfergy+NqOacI=;
 b=VBicSbOekVseTkrbw46QEVdIpoEUuMHTGANAHhAh6qdQ1JGByb4JrNeDAdYrDcAxHEupsULZKR538XgBW7JBuRbPHPqUrG/WQWUEfZg212uNQ55du7Il4lF78H+YKj0//8aNU8I3igkFeFd9JCmmKxznMuvQ1quwGU6+WLDNDcfUdgcMEHsC/XcEJVJdcrTq1Zare9DJEaiDhrBhO0kMJdVVjr0a2KKmGSiNuarRUgY+JoXuUPB4BJ2FX6Ib/9eXQXYuT9OOC12jqdxYR98ZGgUuR4mer2eEGjigaJR+ZvRxODmrZuRfCXxrc2MnK567Qw4G+pySDfLFhWLiXqtjxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RNDon0yAqg/SIj2pHFav4NeZJPpZWHfergy+NqOacI=;
 b=sIMVZeDQ7m+nj1zBbI32ruUDUDxLlJ1RwVzE4URVzAU0uXHEwAcuTeqWGk4HN4bG6BSJj8Q7llUxYIPwgEpgM4cZG07XD0eg/fUQkeplUqf+9JMU/Nn7LU2beYBeq9VO6uVCMeuZXv9hvD0O6VTPOySjpO+qxQejfANpELMNgsg=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3090.eurprd04.prod.outlook.com (10.167.169.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.20; Tue, 3 Sep 2019 02:11:39 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41%3]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 02:11:39 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v2 06/10] PCI: layerscape: Modify the way of getting
 capability with different PEX
Thread-Topic: [PATCH v2 06/10] PCI: layerscape: Modify the way of getting
 capability with different PEX
Thread-Index: AQHVWN1bxZWGihL6TkupN1zdrsSAQ6cHDAGAgAD5DQCAABIIAIAABvSwgBBXHwCAAND40A==
Date: Tue, 3 Sep 2019 02:11:39 +0000
Message-ID: <AM5PR04MB329993B8A20B3D05179B5E26F5B90@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-6-xiaowei.bao@nxp.com>
 <0c02ac52-e4b1-8071-bf9e-d10b28fc9029@ti.com>
 <AM5PR04MB3299DE7B57F31EA405E4FCBCF5A40@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <11e9b2c3-f4d0-2f82-bb14-45c38a1419e4@ti.com>
 <AM5PR04MB32995566CD6DF0AAAD1AE52EF5A40@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <20190902133637.GM9720@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190902133637.GM9720@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b20e824d-2624-4355-4cc4-08d730140e5f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3090; 
x-ms-traffictypediagnostic: AM5PR04MB3090:|AM5PR04MB3090:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB30905295F0AE2AC8B4353624F5B90@AM5PR04MB3090.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(13464003)(189003)(51444003)(199004)(86362001)(486006)(71200400001)(316002)(229853002)(26005)(478600001)(256004)(305945005)(7736002)(2906002)(54906003)(71190400001)(53936002)(6246003)(8676002)(81156014)(81166006)(33656002)(102836004)(8936002)(4326008)(66066001)(9686003)(6916009)(446003)(66476007)(25786009)(52536014)(6116002)(53546011)(6506007)(76176011)(66446008)(66946007)(64756008)(66556008)(55016002)(11346002)(476003)(76116006)(44832011)(99286004)(6436002)(3846002)(74316002)(7416002)(14454004)(5660300002)(7696005)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3090;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: T1y7ZL6bSf4nHGvn0TtmrUskqBn6P2/Lr4SXZUO+kX6vOdjKk7Jgc4V9ioQ30vUnHsvwFK7h6zxjO7VIQ2ZXMV5NbI/ec8Ie7YpPYlmnRExPxmI/qQ15Fk4g4+BQz5zCE76RRgwsKl4PeRogGDdRRS2PxdmMWGN0+Fs1/Zl42SOMo2t1Dm4zmP8HZcKk0gu8WnqMHucdSJJxje9pgGS3ebUjci6rrk9SMczGC8vvZi6LVy8utmnflOvCMo6+WLM8lZKhYZ7jlIvMyoJR8UhJSGCcr0AZ3/n5T2m2T4buax9g2j5PTwDWINURe1+wYk8D4QwO89OFKYtYOrIWcOC9SVzlj2Q4QZgXKTWxkWYtLUhnnB/sEhV2Munhheo/epEAOVUPZ5sEH0QwSRXOQuIOH74AzkLbFTuR4dVfc8dGxwA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20e824d-2624-4355-4cc4-08d730140e5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 02:11:39.3611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /gvzU2vCb0N/G6zsLtpjnhEgY/BlYLmetCg+Wx2SePtiSgvxNz+djnFsf8jVBvhll1JnFgzTUmjLxERSDPXAvw==
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Roy Zang <roy.zang@nxp.com>,
 "lorenzo.pieralisi@arm.co" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IE11cnJheSA8
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE55bm0OeaciDLml6UgMjE6MzcNCj4g
VG86IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiBDYzogS2lzaG9uIFZpamF5
IEFicmFoYW0gSSA8a2lzaG9uQHRpLmNvbT47IGJoZWxnYWFzQGdvb2dsZS5jb207DQo+IHJvYmgr
ZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207IHNoYXduZ3VvQGtlcm5lbC5vcmc7
IExlbyBMaQ0KPiA8bGVveWFuZy5saUBueHAuY29tPjsgbG9yZW56by5waWVyYWxpc2lAYXJtLmNv
DQo+IDxsb3JlbnpvLnBpZXJhbGlzaUBhcm0uY29tPjsgYXJuZEBhcm5kYi5kZTsgZ3JlZ2toQGxp
bnV4Zm91bmRhdGlvbi5vcmc7DQo+IE0uaC4gTGlhbiA8bWluZ2h1YW4ubGlhbkBueHAuY29tPjsg
TWluZ2thaSBIdSA8bWluZ2thaS5odUBueHAuY29tPjsNCj4gUm95IFphbmcgPHJveS56YW5nQG54
cC5jb20+OyBqaW5nb29oYW4xQGdtYWlsLmNvbTsNCj4gZ3VzdGF2by5waW1lbnRlbEBzeW5vcHN5
cy5jb207IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRldmljZXRyZWVAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1hcm0ta2VybmVs
QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+IFN1
YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMDYvMTBdIFBDSTogbGF5ZXJzY2FwZTogTW9kaWZ5IHRoZSB3
YXkgb2YgZ2V0dGluZw0KPiBjYXBhYmlsaXR5IHdpdGggZGlmZmVyZW50IFBFWA0KPiANCj4gT24g
RnJpLCBBdWcgMjMsIDIwMTkgYXQgMDQ6MTM6MzBBTSArMDAwMCwgWGlhb3dlaSBCYW8gd3JvdGU6
DQo+ID4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+IEZyb206
IEtpc2hvbiBWaWpheSBBYnJhaGFtIEkgPGtpc2hvbkB0aS5jb20+DQo+ID4gPiBTZW50OiAyMDE5
5bm0OOaciDIz5pelIDExOjQwDQo+ID4gPiBUbzogWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54
cC5jb20+OyBiaGVsZ2Fhc0Bnb29nbGUuY29tOw0KPiA+ID4gcm9iaCtkdEBrZXJuZWwub3JnOyBt
YXJrLnJ1dGxhbmRAYXJtLmNvbTsgc2hhd25ndW9Aa2VybmVsLm9yZzsgTGVvDQo+ID4gPiByb2Jo
K0xpDQo+ID4gPiA8bGVveWFuZy5saUBueHAuY29tPjsgbG9yZW56by5waWVyYWxpc2lAYXJtLmNv
DQo+ID4gPiA8bG9yZW56by5waWVyYWxpc2lAYXJtLmNvbT47IGFybmRAYXJuZGIuZGU7DQo+ID4g
PiBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgTS5oLiBMaWFuIDxtaW5naHVhbi5saWFuQG54
cC5jb20+Ow0KPiA+ID4gTWluZ2thaSBIdSA8bWluZ2thaS5odUBueHAuY29tPjsgUm95IFphbmcg
PHJveS56YW5nQG54cC5jb20+Ow0KPiA+ID4gamluZ29vaGFuMUBnbWFpbC5jb207IGd1c3Rhdm8u
cGltZW50ZWxAc3lub3BzeXMuY29tOw0KPiA+ID4gbGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsg
ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+ID4gPiBsaW51
eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsgYW5kcmV3Lm11cnJheUBhcm0uY29tDQo+ID4gPiBT
dWJqZWN0OiBSZTogW1BBVENIIHYyIDA2LzEwXSBQQ0k6IGxheWVyc2NhcGU6IE1vZGlmeSB0aGUg
d2F5IG9mDQo+ID4gPiBnZXR0aW5nIGNhcGFiaWxpdHkgd2l0aCBkaWZmZXJlbnQgUEVYDQo+ID4g
Pg0KPiA+ID4gSGksDQo+ID4gPg0KPiA+ID4gKEZpeGVkIExvcmVuem8ncyBlbWFpbCBhZGRyZXNz
LiBBbGwgdGhlIHBhdGNoZXMgaW4gdGhlIHNlcmllcyBoYXZlDQo+ID4gPiB3cm9uZyBlbWFpbA0K
PiA+ID4gaWQpDQo+ID4gPg0KPiA+ID4gT24gMjMvMDgvMTkgODowOSBBTSwgWGlhb3dlaSBCYW8g
d3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4gPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2Ut
LS0tLQ0KPiA+ID4gPj4gRnJvbTogS2lzaG9uIFZpamF5IEFicmFoYW0gSSA8a2lzaG9uQHRpLmNv
bT4NCj4gPiA+ID4+IFNlbnQ6IDIwMTnlubQ45pyIMjLml6UgMTk6NDQNCj4gPiA+ID4+IFRvOiBY
aWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT47IGJoZWxnYWFzQGdvb2dsZS5jb207DQo+
ID4gPiA+PiByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOyBzaGF3bmd1
b0BrZXJuZWwub3JnOw0KPiA+ID4gPj4gcm9iaCtMZW8NCj4gPiA+IExpDQo+ID4gPiA+PiA8bGVv
eWFuZy5saUBueHAuY29tPjsgbG9yZW56by5waWVyYWxpc2lAYXJtLmNvOyBhcm5kQGFybmRiLmRl
Ow0KPiA+ID4gPj4gZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IE0uaC4gTGlhbiA8bWluZ2h1
YW4ubGlhbkBueHAuY29tPjsNCj4gPiA+ID4+IE1pbmdrYWkgSHUgPG1pbmdrYWkuaHVAbnhwLmNv
bT47IFJveSBaYW5nIDxyb3kuemFuZ0BueHAuY29tPjsNCj4gPiA+ID4+IGppbmdvb2hhbjFAZ21h
aWwuY29tOyBndXN0YXZvLnBpbWVudGVsQHN5bm9wc3lzLmNvbTsNCj4gPiA+ID4+IGxpbnV4LXBj
aUB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0KPiA+ID4gPj4g
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+ID4+IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gPiA+ID4+IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMu
b3JnOyBhbmRyZXcubXVycmF5QGFybS5jb20NCj4gPiA+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
djIgMDYvMTBdIFBDSTogbGF5ZXJzY2FwZTogTW9kaWZ5IHRoZSB3YXkgb2YNCj4gPiA+ID4+IGdl
dHRpbmcgY2FwYWJpbGl0eSB3aXRoIGRpZmZlcmVudCBQRVgNCj4gPiA+ID4+DQo+ID4gPiA+PiBI
aSwNCj4gPiA+ID4+DQo+ID4gPiA+PiBPbiAyMi8wOC8xOSA0OjUyIFBNLCBYaWFvd2VpIEJhbyB3
cm90ZToNCj4gPiA+ID4+PiBUaGUgZGlmZmVyZW50IFBDSWUgY29udHJvbGxlciBpbiBvbmUgYm9h
cmQgbWF5IGJlIGhhdmUgZGlmZmVyZW50DQo+ID4gPiA+Pj4gY2FwYWJpbGl0eSBvZiBNU0kgb3Ig
TVNJWCwgc28gY2hhbmdlIHRoZSB3YXkgb2YgZ2V0dGluZyB0aGUgTVNJDQo+ID4gPiA+Pj4gY2Fw
YWJpbGl0eSwgbWFrZSBpdCBtb3JlIGZsZXhpYmxlLg0KPiA+ID4gPj4NCj4gPiA+ID4+IHBsZWFz
ZSB1c2UgZGlmZmVyZW50IHBjaV9lcGNfZmVhdHVyZXMgdGFibGUgZm9yIGRpZmZlcmVudCBib2Fy
ZHMuDQo+ID4gPiA+IFRoYW5rcywgSSB0aGluayB0aGF0IGl0IHdpbGwgYmUgbW9yZSBmbGV4aWJs
ZSB0byBkeW5hbWljYWxseSBnZXQNCj4gPiA+ID4gTVNJIG9yIE1TSVggY2FwYWJpbGl0eSwgVGh1
cywgd2Ugd2lsbCBub3QgbmVlZCB0byBkZWZpbmUgdGhlDQo+ID4gPiA+IHBjaV9lcGNfZmVhdHVy
ZSBmb3INCj4gPiA+IGRpZmZlcmVudCBib2FyZHMuDQo+ID4gPg0KPiA+ID4gSXMgdGhlIHJlc3Ry
aWN0aW9uIGJlY2F1c2UgeW91IGNhbm5vdCBoYXZlIGRpZmZlcmVudCBjb21wYXRpYmxlIGZvcg0K
PiA+ID4gZGlmZmVyZW50IGJvYXJkcz8NCj4gPiBTb3JyeSwgSSBhbSBub3QgdmVyeSBjbGVhciB3
aGF0IHlvdXIgbWVhbiwgSSB0aGluayBldmVuIGlmIEkgdXNlIHRoZQ0KPiA+IHNhbWUgY29tcGF0
aWJsZSB3aXRoIGRpZmZlcmVudCBib2FyZHMsIGVhY2ggYm9hcmRzIHdpbGwgZW50ZXIgdGhlDQo+
ID4gcHJvYmUgZnVuY3Rpb24sIGluIHRoZXJlIEkgd2lsbCBnZXQgdGhlIE1TSSBvciBNU0lYIFBD
SWUgY2FwYWJpbGl0eSBvZg0KPiA+IHRoZSBjdXJyZW50IGNvbnRyb2xsZXIgaW4gdGhpcyBib2Fy
ZC4gV2h5IGRvIEkgbmVlZCB0byBkZWZpbmUgdGhlDQo+IHBjaV9lcGNfZmVhdHVyZSBmb3IgZGlm
ZmVyZW50IGJvYXJkcz8NCj4gDQo+IEF0IHByZXNlbnQgeW91IGRldGVybWluZSBob3cgdG8gc2V0
IHRoZSBbbXNpLG1zaXhdX2NhcGFibGUgZmxhZ3Mgb2YNCj4gcGNpX2VwY19mZWF0dXJlcyBiYXNl
ZCBvbiByZWFkaW5nIHRoZSBmdW5jdGlvbiBjYXBhYmlsaXRpZXMgYXQgcHJvYmUgdGltZS4NCj4g
SW5zdGVhZCBvZiBkb2luZyB0aGlzLCBpcyBpdCBwb3NzaWJsZSB0aGF0IHlvdSBjYW4gZGV0ZXJt
aW5lIHRoZSBmbGFncyBiYXNlZCBvbg0KPiB0aGUgY29tcGF0aWJsZSB0eXBlIGFsb25lPyBGb3Ig
ZXhhbXBsZSwgaXMgdGhlIE1TSS9NU0lYIGNhcGFiaWxpdHkgdGhlIHNhbWUNCj4gZm9yIGFsbCBm
c2wsbHMyMDg4YS1wY2llLWVwIGRldmljZXM/DQo+IA0KPiBJZiBpdCBpc24ndCAqbmVjZXNzYXJ5
KiB0byBwcm9iZSBmb3IgdGhpcyBpbmZvcm1hdGlvbiBhdCBwcm9iZSB0aW1lLCB0aGVuIHlvdQ0K
PiBjb3VsZCBpbnN0ZWFkIGNyZWF0ZSBhIHN0YXRpYyBwY2lfZXBjX2ZlYXR1cmVzIHN0cnVjdHVy
ZSBhbmQgYXNzaWduIGl0IHRvDQo+IHNvbWV0aGluZyBpbiB5b3VyIGRydmRhdGEuIFRoaXMgbWF5
IHByb3ZpZGUgc29tZSBiZW5lZml0cy4NCj4gDQo+IFRoZSBkd19wY2llX2VwX2dldF9mZWF0dXJl
cyBmdW5jdGlvbiB3b3VsZCB0aGVuIGxvb2sgbGlrZToNCj4gDQo+IHN0YXRpYyBjb25zdCBzdHJ1
Y3QgcGNpX2VwY19mZWF0dXJlcyoNCj4gbHNfcGNpZV9lcF9nZXRfZmVhdHVyZXMoc3RydWN0IGR3
X3BjaWVfZXAgKmVwKSB7DQo+IAlzdHJ1Y3QgZHdfcGNpZSAqcGNpID0gdG9fZHdfcGNpZV9mcm9t
X3BwKGVwKTsNCj4gCXN0cnVjdCBsc19wY2llX2VwICpwY2llID0gZGV2X2dldF9kcnZkYXRhKHBj
aS0+ZGV2KTsNCj4gCXJldHVybiBwY2llLT5lcGNfZmVhdHVyZXM7DQo+IH0NCj4gDQo+IFRoaXMg
YWxzbyBtZWFucyB5b3UgY2FuIHJldmVydCAiW3YzLDAzLzExXSBQQ0k6IGRlc2lnbndhcmUtZXA6
IE1vdmUgdGhlIi4NCj4gDQo+IElzIHRoaXMgd2hhdCB5b3UgaGFkIGluIG1pbmQgS2lzaG9uPw0K
DQpZZXMsIEkgY29uc2lkZXIgdGhpcyBzY2hlbWUsIGJ1dCB0aGVyZSBpcyBhIGlzc3VlIHdpdGgg
bXkgYm9hcmQsIGUuZy4gbXkgYm9hcmQgaGF2ZQ0KdGhyZWUgUENJRSBjb250cm9sbGVycywgYnV0
IG9ubHkgdHdvIGNvbnRyb2xsZXJzIHN1cHBvcnQgTVNJLCBJIGNhbid0IHNhaWQgdGhhdCB0aGUg
DQpib2FyZCBzdXBwb3J0IHRoZSBNU0kgZmVhdHVyZSwgc28gSSBvbmx5IHNldCB0aGUgbXNpX2Nh
cGFiaXRpbHkgYnkgcmVhZGluZyB0aGUgTVNJDQpjYXBhYmlsaXR5IHN0cnVjdCB0aGUgY3VycmVu
dCBQQ0lFIGNvbnRyb2xsZXIsIEkgYW0gYWxzbyB2ZXJ5IGVudGFuZ2xlZCBpbiB0aGlzIGlzc3Vl
Lg0Kc28sIGRvIHlvdSBoYXZlIGJldHRlciBhZHZpY2U/IFRoYW5rcyBhIGxvdC4NCg0KVGhhbmtz
IA0KWGlhb3dlaQ0KDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBBbmRyZXcgTXVycmF5DQo+IA0KPiA+
ID4NCj4gPiA+IFRoYW5rcw0KPiA+ID4gS2lzaG9uDQo+ID4gPg0KPiA+ID4gPj4NCj4gPiA+ID4+
IFRoYW5rcw0KPiA+ID4gPj4gS2lzaG9uDQo+ID4gPiA+Pj4NCj4gPiA+ID4+PiBTaWduZWQtb2Zm
LWJ5OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gPiA+ID4+PiAtLS0NCj4g
PiA+ID4+PiB2MjoNCj4gPiA+ID4+PiAgLSBSZW1vdmUgdGhlIHJlcGVhdGVkIGFzc2lnbm1lbnQg
Y29kZS4NCj4gPiA+ID4+Pg0KPiA+ID4gPj4+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2ktbGF5ZXJzY2FwZS1lcC5jIHwgMjYNCj4gPiA+ID4+PiArKysrKysrKysrKysrKysrKysrLS0t
LS0tLQ0KPiA+ID4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNyBkZWxl
dGlvbnMoLSkNCj4gPiA+ID4+Pg0KPiA+ID4gPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9j
b250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gPiA+Pj4gYi9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gPiA+Pj4gaW5kZXggNGU5
MmE5NS4uODQ2MWY2MiAxMDA2NDQNCj4gPiA+ID4+PiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gPiA+Pj4gKysrIGIvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+ID4gPj4+IEBAIC0yMiw2ICsy
Miw3IEBADQo+ID4gPiA+Pj4NCj4gPiA+ID4+PiAgc3RydWN0IGxzX3BjaWVfZXAgew0KPiA+ID4g
Pj4+ICAJc3RydWN0IGR3X3BjaWUJCSpwY2k7DQo+ID4gPiA+Pj4gKwlzdHJ1Y3QgcGNpX2VwY19m
ZWF0dXJlcwkqbHNfZXBjOw0KPiA+ID4gPj4+ICB9Ow0KPiA+ID4gPj4+DQo+ID4gPiA+Pj4gICNk
ZWZpbmUgdG9fbHNfcGNpZV9lcCh4KQlkZXZfZ2V0X2RydmRhdGEoKHgpLT5kZXYpDQo+ID4gPiA+
Pj4gQEAgLTQwLDI1ICs0MSwyNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZA0K
PiA+ID4gPj4gbHNfcGNpZV9lcF9vZl9tYXRjaFtdID0gew0KPiA+ID4gPj4+ICAJeyB9LA0KPiA+
ID4gPj4+ICB9Ow0KPiA+ID4gPj4+DQo+ID4gPiA+Pj4gLXN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNp
X2VwY19mZWF0dXJlcyBsc19wY2llX2VwY19mZWF0dXJlcyA9IHsNCj4gPiA+ID4+PiAtCS5saW5r
dXBfbm90aWZpZXIgPSBmYWxzZSwNCj4gPiA+ID4+PiAtCS5tc2lfY2FwYWJsZSA9IHRydWUsDQo+
ID4gPiA+Pj4gLQkubXNpeF9jYXBhYmxlID0gZmFsc2UsDQo+ID4gPiA+Pj4gLX07DQo+ID4gPiA+
Pj4gLQ0KPiA+ID4gPj4+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9lcGNfZmVhdHVyZXMqDQo+
ID4gPiA+Pj4gbHNfcGNpZV9lcF9nZXRfZmVhdHVyZXMoc3RydWN0IGR3X3BjaWVfZXAgKmVwKSAg
ew0KPiA+ID4gPj4+IC0JcmV0dXJuICZsc19wY2llX2VwY19mZWF0dXJlczsNCj4gPiA+ID4+PiAr
CXN0cnVjdCBkd19wY2llICpwY2kgPSB0b19kd19wY2llX2Zyb21fZXAoZXApOw0KPiA+ID4gPj4+
ICsJc3RydWN0IGxzX3BjaWVfZXAgKnBjaWUgPSB0b19sc19wY2llX2VwKHBjaSk7DQo+ID4gPiA+
Pj4gKw0KPiA+ID4gPj4+ICsJcmV0dXJuIHBjaWUtPmxzX2VwYzsNCj4gPiA+ID4+PiAgfQ0KPiA+
ID4gPj4+DQo+ID4gPiA+Pj4gIHN0YXRpYyB2b2lkIGxzX3BjaWVfZXBfaW5pdChzdHJ1Y3QgZHdf
cGNpZV9lcCAqZXApICB7DQo+ID4gPiA+Pj4gIAlzdHJ1Y3QgZHdfcGNpZSAqcGNpID0gdG9fZHdf
cGNpZV9mcm9tX2VwKGVwKTsNCj4gPiA+ID4+PiArCXN0cnVjdCBsc19wY2llX2VwICpwY2llID0g
dG9fbHNfcGNpZV9lcChwY2kpOw0KPiA+ID4gPj4+ICAJZW51bSBwY2lfYmFybm8gYmFyOw0KPiA+
ID4gPj4+DQo+ID4gPiA+Pj4gIAlmb3IgKGJhciA9IEJBUl8wOyBiYXIgPD0gQkFSXzU7IGJhcisr
KQ0KPiA+ID4gPj4+ICAJCWR3X3BjaWVfZXBfcmVzZXRfYmFyKHBjaSwgYmFyKTsNCj4gPiA+ID4+
PiArDQo+ID4gPiA+Pj4gKwlwY2llLT5sc19lcGMtPm1zaV9jYXBhYmxlID0gZXAtPm1zaV9jYXAg
PyB0cnVlIDogZmFsc2U7DQo+ID4gPiA+Pj4gKwlwY2llLT5sc19lcGMtPm1zaXhfY2FwYWJsZSA9
IGVwLT5tc2l4X2NhcCA/IHRydWUgOiBmYWxzZTsNCj4gPiA+ID4+PiAgfQ0KPiA+ID4gPj4+DQo+
ID4gPiA+Pj4gIHN0YXRpYyBpbnQgbHNfcGNpZV9lcF9yYWlzZV9pcnEoc3RydWN0IGR3X3BjaWVf
ZXAgKmVwLCB1OA0KPiA+ID4gPj4+IGZ1bmNfbm8sIEBADQo+ID4gPiA+Pj4gLTExOCw2ICsxMjAs
NyBAQCBzdGF0aWMgaW50IF9faW5pdCBsc19wY2llX2VwX3Byb2JlKHN0cnVjdA0KPiA+ID4gPj4+
IHBsYXRmb3JtX2RldmljZQ0KPiA+ID4gPj4gKnBkZXYpDQo+ID4gPiA+Pj4gIAlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiA+ID4gPj4+ICAJc3RydWN0IGR3X3BjaWUgKnBjaTsN
Cj4gPiA+ID4+PiAgCXN0cnVjdCBsc19wY2llX2VwICpwY2llOw0KPiA+ID4gPj4+ICsJc3RydWN0
IHBjaV9lcGNfZmVhdHVyZXMgKmxzX2VwYzsNCj4gPiA+ID4+PiAgCXN0cnVjdCByZXNvdXJjZSAq
ZGJpX2Jhc2U7DQo+ID4gPiA+Pj4gIAlpbnQgcmV0Ow0KPiA+ID4gPj4+DQo+ID4gPiA+Pj4gQEAg
LTEyOSw2ICsxMzIsMTAgQEAgc3RhdGljIGludCBfX2luaXQgbHNfcGNpZV9lcF9wcm9iZShzdHJ1
Y3QNCj4gPiA+ID4+IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiA+ID4+PiAgCWlmICghcGNp
KQ0KPiA+ID4gPj4+ICAJCXJldHVybiAtRU5PTUVNOw0KPiA+ID4gPj4+DQo+ID4gPiA+Pj4gKwls
c19lcGMgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXplb2YoKmxzX2VwYyksIEdGUF9LRVJORUwpOw0K
PiA+ID4gPj4+ICsJaWYgKCFsc19lcGMpDQo+ID4gPiA+Pj4gKwkJcmV0dXJuIC1FTk9NRU07DQo+
ID4gPiA+Pj4gKw0KPiA+ID4gPj4+ICAJZGJpX2Jhc2UgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2Vf
YnluYW1lKHBkZXYsDQo+ID4gPiBJT1JFU09VUkNFX01FTSwNCj4gPiA+ID4+ICJyZWdzIik7DQo+
ID4gPiA+Pj4gIAlwY2ktPmRiaV9iYXNlID0gZGV2bV9wY2lfcmVtYXBfY2ZnX3Jlc291cmNlKGRl
diwNCj4gZGJpX2Jhc2UpOw0KPiA+ID4gPj4+ICAJaWYgKElTX0VSUihwY2ktPmRiaV9iYXNlKSkN
Cj4gPiA+ID4+PiBAQCAtMTM5LDYgKzE0NiwxMSBAQCBzdGF0aWMgaW50IF9faW5pdCBsc19wY2ll
X2VwX3Byb2JlKHN0cnVjdA0KPiA+ID4gPj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ID4g
Pj4+ICAJcGNpLT5vcHMgPSAmbHNfcGNpZV9lcF9vcHM7DQo+ID4gPiA+Pj4gIAlwY2llLT5wY2kg
PSBwY2k7DQo+ID4gPiA+Pj4NCj4gPiA+ID4+PiArCWxzX2VwYy0+bGlua3VwX25vdGlmaWVyID0g
ZmFsc2UsDQo+ID4gPiA+Pj4gKwlsc19lcGMtPmJhcl9maXhlZF82NGJpdCA9ICgxIDw8IEJBUl8y
KSB8ICgxIDw8IEJBUl80KSwNCj4gPiA+ID4+PiArDQo+ID4gPiA+Pj4gKwlwY2llLT5sc19lcGMg
PSBsc19lcGM7DQo+ID4gPiA+Pj4gKw0KPiA+ID4gPj4+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEo
cGRldiwgcGNpZSk7DQo+ID4gPiA+Pj4NCj4gPiA+ID4+PiAgCXJldCA9IGxzX2FkZF9wY2llX2Vw
KHBjaWUsIHBkZXYpOw0KPiA+ID4gPj4+DQo=
