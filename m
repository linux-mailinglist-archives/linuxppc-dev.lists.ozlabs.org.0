Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 051B4268047
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Sep 2020 18:29:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BqFLr5FckzDqYp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Sep 2020 02:29:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.13.43; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=zhiqiang.hou@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=H9YV03Ix; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130043.outbound.protection.outlook.com [40.107.13.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BqFHq1vbGzDqXG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Sep 2020 02:26:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mWIir0TDe+29Fm5TAZf6uI4Rmde+nFHKEbMGhF5Eyls1kBKtKdOmNvJwdhoUvF/Jip8cCD7mRxbx76DFU8hnECG0NHpuc7RslC0/4XvURu4qCcixUJVGOyX1KKP+lm3R9CLYB3UNrvD87ExkydF44Igk0XhdtKUZf3g2OAVJuV0a7ZyZXojwI+tMMvvpx9JipIveQ+QAI+QP4q880bQgpn0VEMij1yZHoKi3wtl97E1MfVOob9IlQ3HRngVHz4XvHIME59RmTMaNoCN1slhJYWDEdHHkiqEmP1ZyLYjDR+L1bxHvNrAq5onyGD/y/1xJMgejtyRUiTrARdCmpqTmJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIM3iVXgA+6868j1bBPQGCqpOo5MuKN+IaEmRiXR8U0=;
 b=kRlWvFmkJlZw4OKLfqhwvA+SdYib4KHKQxjDjJ2kEPaZi3A0GBB9eRwER4R4wttOxbSMJvlPj7uIUnWw4rKagWwAJqO8vkX3gpYDP8dEN964pOSbv7VuDulwciU+NOzzBhIcn/gc5+f7YPsLm8lXsvVJ2g376vmVAKszuDXrW8TqGFAqLjIcPf+Wl3aUk2wmAl5tA+BpO0VPlsj6qPk3MUvqMhQRV1HeVFlaiyFUgZaKYY56PhFVoj4oed9/d9yg5IgUyRkOcxsl9912ItktHFlCShvzI7V+hxg7hU3Horxzjgfy69N4a1KFdttbE4n9kEPWf/Dma+8NXj16nXeg1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIM3iVXgA+6868j1bBPQGCqpOo5MuKN+IaEmRiXR8U0=;
 b=H9YV03IxzDTmGAEpSkPCpzha0NL315voFjpOXWVzz2xhU2MCYNKTdZ6J3k5FedfznqdwzESerKANmf25o8lQcGJyF9P1HkFv+iONJXMIRlYCeb2gFX+17Ll8jnopCeHB3ksvTkQlR9ibLQl05rl+byDo6Hx0BgzVfb5DWZqdHdQ=
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com (2603:10a6:7:85::27)
 by HE1PR0402MB2730.eurprd04.prod.outlook.com (2603:10a6:3:e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Sun, 13 Sep
 2020 16:26:27 +0000
Received: from HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::c872:d354:7cf7:deb9]) by HE1PR0402MB3371.eurprd04.prod.outlook.com
 ([fe80::c872:d354:7cf7:deb9%3]) with mapi id 15.20.3370.018; Sun, 13 Sep 2020
 16:26:27 +0000
From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCHv7 10/12] arm64: dts: layerscape: Add PCIe EP node for
 ls1088a
Thread-Topic: [PATCHv7 10/12] arm64: dts: layerscape: Add PCIe EP node for
 ls1088a
Thread-Index: AQHWb8Z/OKKmhFlod0GNh35oCRgqyKliRLGAgASvHiA=
Date: Sun, 13 Sep 2020 16:26:26 +0000
Message-ID: <HE1PR0402MB33717F631D8243F835918AB084220@HE1PR0402MB3371.eurprd04.prod.outlook.com>
References: <20200811095441.7636-1-Zhiqiang.Hou@nxp.com>
 <20200811095441.7636-11-Zhiqiang.Hou@nxp.com> <20200910164751.GA501845@bogus>
In-Reply-To: <20200910164751.GA501845@bogus>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b970e4a5-b0bf-4757-f93e-08d85801c375
x-ms-traffictypediagnostic: HE1PR0402MB2730:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0402MB2730D6320EDE5859C756F27184220@HE1PR0402MB2730.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1fSxIHadJQNAObpgNwhOZxotwlG4lB9CViElXMDnpbaIZF36CGCmt6Vr2i84d8UoFC+fzQMrth5TGmNUBYtrv6EIXdBhNj/AeltUNjx9tMjZ8JsKmKAeFRKXNTJ4AxFwsNpfSKqeZ91aHWMjGDNVLKzKhJ88WU3RqIKQFyjSpzN+Ig/Kk9JdM0gLMhPH9SsvEsAuBdsaKGWhvK6mBW55qHrEs/5BqvPmrMdrFZEHhxviVtuo2S3sxzABDRDCB6nu3mjdAKWfWKABxVQNbi8pYAOJ9+Vln2JDC7OfIRC+aKsQydY+l/WjtBWg5mvoMKE5a0G+BNJQbjCNsQVueWtvmJ35lJiAKzNRjllJKzw+btuzkQhHkBTl77sozbpxocYS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0402MB3371.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(346002)(376002)(366004)(7696005)(66946007)(55016002)(66446008)(64756008)(66556008)(66476007)(9686003)(8676002)(26005)(6916009)(71200400001)(6506007)(53546011)(8936002)(186003)(478600001)(5660300002)(52536014)(7416002)(54906003)(83380400001)(4326008)(316002)(86362001)(33656002)(76116006)(2906002)(21314003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: dIX4zuuq6pdJkFJ+XuPOhTnm6eMSS/FRzKOsOrtI3zV3V9da4Tu5eHG+Fg89WaCNhFPAq/g3NSq0UbaEDFVa6UiezJg48vA55ujIrjc3fqnYv8o+RpDAHCQWM+9OvGLnu40f2HesyL3KFa/ILuJDCiH2YcSn1zhI0e16/jjYVCaz+iX42+wYvajLxt8oc9YqmTDR0pNxXBVOs47VTLs1VdnD1nICxTMDx8l/eJgMaAQF6gLSSnpdBb+VvCR3qLLRgujT/5aEJudwJrv1PTe0HaMXpdSKTbyJwKQYjkF5hp2+tq9UTR73qH2/djZxnhSaFiHpKUDLFnPd4MBWnd4RBRwhId1Na3bA8ykBHXMrux+dIn+G4Yy7WtMJxoE3YHOp3g04NF0K1qtEmHh37rUg17Rh2KkxRJf9vAaWrNizjCDvwkucPw/Kp3XmY5E73ZRF7pfAayqxjQmEU03dm0IEm6HnIlqs78JFgdIAzVryUvgH4WVyCfm2DMSEgw5XkSknU7xiuL2rcpTxgivT64ZHuu9s/HTFWKEY0Ls+lSE8FjQtblXEpdKlASKhzKYLa9K28e/EbygIZOKuVtdiajvuEPatcitBgKSoxf5JRCcMx/cDG+rs7+Dgr4R7y+SJntDjTzz5Y1eWoyWpze0jtkOURg==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0402MB3371.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b970e4a5-b0bf-4757-f93e-08d85801c375
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2020 16:26:26.8746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iR9qpWFll7m2WYdRyCoSzdKJvbQBNX8ALGenciPm4biZzHAwIrmb45l1C1dOfd0QCsK+xYfi86KDqKq8cwyEig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB2730
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 Xiaowei Bao <xiaowei.bao@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "andrew.murray@arm.com" <andrew.murray@arm.com>,
 Mingkai Hu <mingkai.hu@nxp.com>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "kishon@ti.com" <kishon@ti.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgUm9iLA0KDQpUaGFua3MgYSBsb3QgZm9yIHlvdXIgY29tbWVudHMhDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4N
Cj4gU2VudDogMjAyMMTqOdTCMTHI1SAwOjQ4DQo+IFRvOiBaLnEuIEhvdSA8emhpcWlhbmcuaG91
QG54cC5jb20+DQo+IENjOiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnOyBkZXZpY2V0cmVlQHZn
ZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJz
Lm9yZzsgYmhlbGdhYXNAZ29vZ2xlLmNvbTsNCj4gbG9yZW56by5waWVyYWxpc2lAYXJtLmNvbTsg
c2hhd25ndW9Aa2VybmVsLm9yZzsgTGVvIExpDQo+IDxsZW95YW5nLmxpQG54cC5jb20+OyBraXNo
b25AdGkuY29tOyBndXN0YXZvLnBpbWVudGVsQHN5bm9wc3lzLmNvbTsNCj4gUm95IFphbmcgPHJv
eS56YW5nQG54cC5jb20+OyBqaW5nb29oYW4xQGdtYWlsLmNvbTsNCj4gYW5kcmV3Lm11cnJheUBh
cm0uY29tOyBNaW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5jb20+OyBNLmguIExpYW4NCj4gPG1p
bmdodWFuLmxpYW5AbnhwLmNvbT47IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0K
PiBTdWJqZWN0OiBSZTogW1BBVENIdjcgMTAvMTJdIGFybTY0OiBkdHM6IGxheWVyc2NhcGU6IEFk
ZCBQQ0llIEVQIG5vZGUgZm9yDQo+IGxzMTA4OGENCj4gDQo+IE9uIFR1ZSwgQXVnIDExLCAyMDIw
IGF0IDA1OjU0OjM5UE0gKzA4MDAsIFpoaXFpYW5nIEhvdSB3cm90ZToNCj4gPiBGcm9tOiBYaWFv
d2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gPg0KPiA+IEFkZCBQQ0llIEVQIG5vZGUg
Zm9yIGxzMTA4OGEgdG8gc3VwcG9ydCBFUCBtb2RlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
WGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54cC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEFuZHJl
dyBNdXJyYXkgPGFuZHJldy5tdXJyYXlAYXJtLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBIb3Ug
WmhpcWlhbmcgPFpoaXFpYW5nLkhvdUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+IFY3Og0KPiA+ICAt
IFJlYmFzZSB0aGUgcGF0Y2ggd2l0aG91dCBmdW5jdGlvbmFsaXR5IGNoYW5nZS4NCj4gPg0KPiA+
ICAuLi4vYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwODhhLmR0c2kgfCAzMQ0KPiAr
KysrKysrKysrKysrKysrKysrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCsp
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNs
LWxzMTA4OGEuZHRzaQ0KPiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEw
ODhhLmR0c2kNCj4gPiBpbmRleCAxNjlmNDc0MmFlM2IuLjkxNTU5MjE0MWYxYiAxMDA2NDQNCj4g
PiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDg4YS5kdHNpDQo+
ID4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTA4OGEuZHRzaQ0K
PiA+IEBAIC00OTksNiArNDk5LDE3IEBADQo+ID4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+
ID4gIAkJfTsNCj4gPg0KPiA+ICsJCXBjaWVfZXBAMzQwMDAwMCB7DQo+IA0KPiBwY2ktZXBALi4u
DQoNClRoZSBEVCBub2RlIG5hbWUgbXVzdCBiZSAieHh4LXh4IiBzdHlsZT8gSWYgeWVzLCB0aGUg
TFMxMDQ2QSBFUCBub2RlIGFsc28gaGFzIHRoZSBuYW1lICJwY2llX2VwIiwgaXQgYWxzbyBuZWVk
IHRvIGJlIGZpeGVkLg0KDQpUaGFua3MsDQpaaGlxaWFuZw0KDQo+IA0KPiA+ICsJCQljb21wYXRp
YmxlID0gImZzbCxsczEwODhhLXBjaWUtZXAiLCJmc2wsbHMtcGNpZS1lcCI7DQo+ID4gKwkJCXJl
ZyA9IDwweDAwIDB4MDM0MDAwMDAgMHgwIDB4MDAxMDAwMDANCj4gPiArCQkJICAgICAgIDB4MjAg
MHgwMDAwMDAwMCAweDggMHgwMDAwMDAwMD47DQo+ID4gKwkJCXJlZy1uYW1lcyA9ICJyZWdzIiwg
ImFkZHJfc3BhY2UiOw0KPiA+ICsJCQludW0taWItd2luZG93cyA9IDwyND47DQo+ID4gKwkJCW51
bS1vYi13aW5kb3dzID0gPDEyOD47DQo+ID4gKwkJCW1heC1mdW5jdGlvbnMgPSAvYml0cy8gOCA8
Mj47DQo+ID4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+ID4gKwkJfTsNCj4gPiArDQo+ID4g
IAkJcGNpZUAzNTAwMDAwIHsNCj4gPiAgCQkJY29tcGF0aWJsZSA9ICJmc2wsbHMxMDg4YS1wY2ll
IjsNCj4gPiAgCQkJcmVnID0gPDB4MDAgMHgwMzUwMDAwMCAweDAgMHgwMDEwMDAwMCAgIC8qIGNv
bnRyb2xsZXINCj4gcmVnaXN0ZXJzICovDQo+ID4gQEAgLTUyNSw2ICs1MzYsMTYgQEANCj4gPiAg
CQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gPiAgCQl9Ow0KPiA+DQo+ID4gKwkJcGNpZV9lcEAz
NTAwMDAwIHsNCj4gPiArCQkJY29tcGF0aWJsZSA9ICJmc2wsbHMxMDg4YS1wY2llLWVwIiwiZnNs
LGxzLXBjaWUtZXAiOw0KPiA+ICsJCQlyZWcgPSA8MHgwMCAweDAzNTAwMDAwIDB4MCAweDAwMTAw
MDAwDQo+ID4gKwkJCSAgICAgICAweDI4IDB4MDAwMDAwMDAgMHg4IDB4MDAwMDAwMDA+Ow0KPiA+
ICsJCQlyZWctbmFtZXMgPSAicmVncyIsICJhZGRyX3NwYWNlIjsNCj4gPiArCQkJbnVtLWliLXdp
bmRvd3MgPSA8Nj47DQo+ID4gKwkJCW51bS1vYi13aW5kb3dzID0gPDg+Ow0KPiA+ICsJCQlzdGF0
dXMgPSAiZGlzYWJsZWQiOw0KPiA+ICsJCX07DQo+ID4gKw0KPiA+ICAJCXBjaWVAMzYwMDAwMCB7
DQo+ID4gIAkJCWNvbXBhdGlibGUgPSAiZnNsLGxzMTA4OGEtcGNpZSI7DQo+ID4gIAkJCXJlZyA9
IDwweDAwIDB4MDM2MDAwMDAgMHgwIDB4MDAxMDAwMDAgICAvKiBjb250cm9sbGVyDQo+IHJlZ2lz
dGVycyAqLw0KPiA+IEBAIC01NTEsNiArNTcyLDE2IEBADQo+ID4gIAkJCXN0YXR1cyA9ICJkaXNh
YmxlZCI7DQo+ID4gIAkJfTsNCj4gPg0KPiA+ICsJCXBjaWVfZXBAMzYwMDAwMCB7DQo+ID4gKwkJ
CWNvbXBhdGlibGUgPSAiZnNsLGxzMTA4OGEtcGNpZS1lcCIsImZzbCxscy1wY2llLWVwIjsNCj4g
PiArCQkJcmVnID0gPDB4MDAgMHgwMzYwMDAwMCAweDAgMHgwMDEwMDAwMA0KPiA+ICsJCQkgICAg
ICAgMHgzMCAweDAwMDAwMDAwIDB4OCAweDAwMDAwMDAwPjsNCj4gPiArCQkJcmVnLW5hbWVzID0g
InJlZ3MiLCAiYWRkcl9zcGFjZSI7DQo+ID4gKwkJCW51bS1pYi13aW5kb3dzID0gPDY+Ow0KPiA+
ICsJCQludW0tb2Itd2luZG93cyA9IDw4PjsNCj4gPiArCQkJc3RhdHVzID0gImRpc2FibGVkIjsN
Cj4gPiArCQl9Ow0KPiA+ICsNCj4gPiAgCQlzbW11OiBpb21tdUA1MDAwMDAwIHsNCj4gPiAgCQkJ
Y29tcGF0aWJsZSA9ICJhcm0sbW11LTUwMCI7DQo+ID4gIAkJCXJlZyA9IDwwIDB4NTAwMDAwMCAw
IDB4ODAwMDAwPjsNCj4gPiAtLQ0KPiA+IDIuMTcuMQ0KPiA+DQo=
