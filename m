Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BDE8F9AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 06:19:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468qpS6WThzDqrV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 14:19:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.8.57; helo=eur04-vi1-obe.outbound.protection.outlook.com;
 envelope-from=zhiqiang.hou@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="LYaNoNTX"; 
 dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80057.outbound.protection.outlook.com [40.107.8.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468qmR0tZNzDqvD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 14:17:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtMrZN9lKlDITZaBHhlWtuZLUBt3ADFgpc9bqJcDJie28cFupWOVq5oAIl+NWECidokyLI2JsvCgUrHop4SbubkQKG5j3Sq3MQ6SjX3uuai1/1bB68MNmFwDCM39lvEA/tMAtiu8IC+1E5AQkOv6L8dZOOhVbSBpIDwhJWyvW1MLdh3cmJV5iD3PM5Yj4VkXWhP+Ob8IHjrHjCL34uDYnydrZe/Hfl6Y3E8p+/f4sPWiAnfoRNSI1z6/TDu5GWpuAp6NOriLsFCXYA22Qh5bPkwBHMgZjdcUT2HvCbJzsGownSI0udzepJmfQGIQrxX/wLeAs6CSuQhRvwJzW6TEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RK/iYKs6Vspdpl4eh5sRU6gcRe7bE+fPaezPFZ+/rJ0=;
 b=WMzEKM2Qy/6pWKEzcghcbKwS3y4yEoNnYl192dsYwv+FHxD7+/LfcyiBwpB8fOHFruxhxyQ6Kl3vyqHeETDAbqqW4BxHlNGenvwmk9gT21chksTDvOyo7tmhUeJgysJ8MQr8jrtewJJtRRN8WLYQxJ6wPYXWmMW+RQSc547PoMvM4nDUvYtz57ut6oWbBF7VygGrl9Nidx9g1MHGHyhwK/6H/Eceu226ETLebGY1yIb4Y1VhHFJ8ZjJ9IWnCDbsuxCzPcy0QPql1Fz5pIcE2scVswYZPLxHhMu8kNrlA0UDJlYoVg0kqH+m/9x+ivUSEGYEWHJJ3QEYT7EbiMqh5nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RK/iYKs6Vspdpl4eh5sRU6gcRe7bE+fPaezPFZ+/rJ0=;
 b=LYaNoNTX1dDjvxXZVzzJ4TJLg51ndP2KNG9sCLokchUakxgRAhAfyK1ZnhGKMxK0E+6aQ9HnuGfX7NTeMSsyhm9ZBqnBHMog8+7OKU8fiRIOM1ICSThli9EIWV/SS9YmCZlAGdImKE+NgRp8hb7RIfF2nE2dwGFWVkQ+k3LHvOQ=
Received: from DB8PR04MB6747.eurprd04.prod.outlook.com (20.179.250.159) by
 DB8PR04MB6377.eurprd04.prod.outlook.com (20.179.249.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Fri, 16 Aug 2019 04:17:32 +0000
Received: from DB8PR04MB6747.eurprd04.prod.outlook.com
 ([fe80::19ec:cddf:5e07:37eb]) by DB8PR04MB6747.eurprd04.prod.outlook.com
 ([fe80::19ec:cddf:5e07:37eb%3]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 04:17:32 +0000
From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
To: Xiaowei Bao <xiaowei.bao@nxp.com>, "bhelgaas@google.com"
 <bhelgaas@google.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, Leo Li <leoyang.li@nxp.com>, "kishon@ti.com"
 <kishon@ti.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "M.h. Lian" <minghuan.lian@nxp.com>, Mingkai Hu
 <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
 "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
 "pombredanne@nexb.com" <pombredanne@nexb.com>, "shawn.lin@rock-chips.com"
 <shawn.lin@rock-chips.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [PATCHv3 2/3] arm64: dts: ls1028a: Add PCIe controller DT nodes
Thread-Topic: [PATCHv3 2/3] arm64: dts: ls1028a: Add PCIe controller DT nodes
Thread-Index: AQHVTB/KBoO09X4lekyP4XfRyVrS26b9Ofyw
Date: Fri, 16 Aug 2019 04:17:32 +0000
Message-ID: <DB8PR04MB67473C3465BB12B12770683784AF0@DB8PR04MB6747.eurprd04.prod.outlook.com>
References: <20190806061553.19934-1-xiaowei.bao@nxp.com>
 <20190806061553.19934-2-xiaowei.bao@nxp.com>
In-Reply-To: <20190806061553.19934-2-xiaowei.bao@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=zhiqiang.hou@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5caaf0a7-7b9f-4b9e-f447-08d72200a910
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR04MB6377; 
x-ms-traffictypediagnostic: DB8PR04MB6377:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB637789F815BE7A4C009DDFB084AF0@DB8PR04MB6377.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1079;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(136003)(376002)(39860400002)(346002)(396003)(189003)(199004)(13464003)(81156014)(9686003)(81166006)(6306002)(14444005)(256004)(6436002)(66946007)(8936002)(66476007)(66556008)(66446008)(64756008)(8676002)(14454004)(55016002)(446003)(11346002)(476003)(99286004)(316002)(110136005)(71190400001)(486006)(76176011)(2501003)(7696005)(71200400001)(33656002)(966005)(186003)(53546011)(6506007)(102836004)(478600001)(26005)(7416002)(5660300002)(25786009)(2906002)(52536014)(66066001)(305945005)(7736002)(3846002)(6116002)(74316002)(4326008)(53936002)(2201001)(6246003)(229853002)(76116006)(86362001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB6377;
 H:DB8PR04MB6747.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: mYPtJ0+t6W0IW7Qw4Z6XTG2irmEP9LTNHBdzjp+cuw+hSfLJqsh3Z2374DtBf/ciL3tj5NBym8R/VVF9MlXZHKx0Z/XvexuZZMpru80rtFQyzjxgUJP2Ao4ydkFlyYUU0P6p6TlgAnq8w3v6mjnDEdglv8iHLDYr9oc3ecZir2/5V8QltBF/rcUdtRvDgLTAnslZlBbzmw1j6eOZ3xH1BCBryIB5gzXh+mIyw7hgeTpLmJ7aWqRjQjrAGROg1BFvgUrs3RPlFD5CituQhFjJKcYilafdc8Pi/3zraAkxbGNEbZNUY8PJZoWI/tjCqIqgCvLkVJ6xx3+4vhtDcSp2b+TDdsD0l09b2TIgqBsyZASbZw8R4yVwwBQJs4DHff6W2ViLCE/l7u/k7ZlcKU2e09ysB+3Jym/9asGBwK3Mw6E=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5caaf0a7-7b9f-4b9e-f447-08d72200a910
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 04:17:32.7000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9tg68oIP6gePyAfTpvLYtO2F5NK/9XceFNTWFFmh0pFgBstc3gSEMh21Q3MoxNhxs+p+ZaA9vNmP955dqpv3RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6377
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
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgWGlhb3dlaSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYaWFv
d2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gU2VudDogMjAxOcTqONTCNsjVIDE0OjE2
DQo+IFRvOiBiaGVsZ2Fhc0Bnb29nbGUuY29tOyByb2JoK2R0QGtlcm5lbC5vcmc7IG1hcmsucnV0
bGFuZEBhcm0uY29tOw0KPiBzaGF3bmd1b0BrZXJuZWwub3JnOyBMZW8gTGkgPGxlb3lhbmcubGlA
bnhwLmNvbT47IGtpc2hvbkB0aS5jb207DQo+IGxvcmVuem8ucGllcmFsaXNpQGFybS5jb207IGFy
bmRAYXJuZGIuZGU7IGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnOw0KPiBNLmguIExpYW4gPG1p
bmdodWFuLmxpYW5AbnhwLmNvbT47IE1pbmdrYWkgSHUgPG1pbmdrYWkuaHVAbnhwLmNvbT47DQo+
IFoucS4gSG91IDx6aGlxaWFuZy5ob3VAbnhwLmNvbT47IFJveSBaYW5nIDxyb3kuemFuZ0BueHAu
Y29tPjsNCj4ga3N0ZXdhcnRAbGludXhmb3VuZGF0aW9uLm9yZzsgcG9tYnJlZGFubmVAbmV4Yi5j
b207DQo+IHNoYXduLmxpbkByb2NrLWNoaXBzLmNvbTsgbGludXgtcGNpQHZnZXIua2VybmVsLm9y
ZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXhwcGMt
ZGV2QGxpc3RzLm96bGFicy5vcmcNCj4gQ2M6IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAu
Y29tPjsgWi5xLiBIb3UNCj4gPHpoaXFpYW5nLmhvdUBueHAuY29tPg0KPiBTdWJqZWN0OiBbUEFU
Q0h2MyAyLzNdIGFybTY0OiBkdHM6IGxzMTAyOGE6IEFkZCBQQ0llIGNvbnRyb2xsZXIgRFQgbm9k
ZXMNCj4gDQo+IExTMTAyOGEgaW1wbGVtZW50cyAyIFBDSWUgMy4wIGNvbnRyb2xsZXJzLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54cC5jb20+DQo+IFNp
Z25lZC1vZmYtYnk6IEhvdSBaaGlxaWFuZyA8WmhpcWlhbmcuSG91QG54cC5jb20+DQo+IC0tLQ0K
PiB2MjoNCj4gIC0gRml4IHVwIHRoZSBsZWdhY3kgSU5UeCBhbGxvY2F0ZSBmYWlsZWQgaXNzdWUu
DQo+IHYzOg0KPiAgLSBubyBjaGFuZ2UuDQo+IA0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9mcmVl
c2NhbGUvZnNsLWxzMTAyOGEuZHRzaSB8IDUyDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+ICAxIGZpbGUgY2hhbmdlZCwgNTIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1sczEwMjhhLmR0c2kNCj4gYi9hcmNo
L2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHMxMDI4YS5kdHNpDQo+IGluZGV4IGFlZjVi
MDYuLjBiNTQyZWQgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxl
L2ZzbC1sczEwMjhhLmR0c2kNCj4gKysrIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUv
ZnNsLWxzMTAyOGEuZHRzaQ0KPiBAQCAtNTAzLDYgKzUwMyw1OCBAQA0KPiAgCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsNCj4gIAkJfTsNCj4gDQo+ICsJCXBjaWVAMzQwMDAwMCB7DQo+ICsJCQljb21w
YXRpYmxlID0gImZzbCxsczEwMjhhLXBjaWUiOw0KPiArCQkJcmVnID0gPDB4MDAgMHgwMzQwMDAw
MCAweDAgMHgwMDEwMDAwMCAgIC8qIGNvbnRyb2xsZXINCj4gcmVnaXN0ZXJzICovDQo+ICsJCQkg
ICAgICAgMHg4MCAweDAwMDAwMDAwIDB4MCAweDAwMDAyMDAwPjsgLyogY29uZmlndXJhdGlvbg0K
PiBzcGFjZSAqLw0KPiArCQkJcmVnLW5hbWVzID0gInJlZ3MiLCAiY29uZmlnIjsNCj4gKwkJCWlu
dGVycnVwdHMgPSA8R0lDX1NQSSAxMDggSVJRX1RZUEVfTEVWRUxfSElHSD4sIC8qIFBNRQ0KPiBp
bnRlcnJ1cHQgKi8NCj4gKwkJCQkgICAgIDxHSUNfU1BJIDEwOSBJUlFfVFlQRV9MRVZFTF9ISUdI
PjsgLyogYWVyDQo+IGludGVycnVwdCAqLw0KPiArCQkJaW50ZXJydXB0LW5hbWVzID0gInBtZSIs
ICJhZXIiOw0KPiArCQkJI2FkZHJlc3MtY2VsbHMgPSA8Mz47DQo+ICsJCQkjc2l6ZS1jZWxscyA9
IDwyPjsNCj4gKwkJCWRldmljZV90eXBlID0gInBjaSI7DQo+ICsJCQlkbWEtY29oZXJlbnQ7DQo+
ICsJCQludW0tbGFuZXMgPSA8ND47DQoNClJlbW92ZSB0aGUgbnVtLWxhbmVzLCBpdCBpcyBub3Qg
bmVlZGVkIGJ5IExheWVyc2NhcGUgUENJZSBjb250cm9sbGVycy4gc2VlOiBodHRwOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC1wY2kvbGlzdC8/c2VyaWVzPTEyNDQ4OA0KDQo+
ICsJCQlidXMtcmFuZ2UgPSA8MHgwIDB4ZmY+Ow0KPiArCQkJcmFuZ2VzID0gPDB4ODEwMDAwMDAg
MHgwIDB4MDAwMDAwMDAgMHg4MCAweDAwMDEwMDAwIDB4MA0KPiAweDAwMDEwMDAwICAgLyogZG93
bnN0cmVhbSBJL08gKi8NCj4gKwkJCQkgIDB4ODIwMDAwMDAgMHgwIDB4NDAwMDAwMDAgMHg4MCAw
eDQwMDAwMDAwIDB4MA0KPiAweDQwMDAwMDAwPjsgLyogbm9uLXByZWZldGNoYWJsZSBtZW1vcnkg
Ki8NCj4gKwkJCW1zaS1wYXJlbnQgPSA8Jml0cz47DQo+ICsJCQkjaW50ZXJydXB0LWNlbGxzID0g
PDE+Ow0KPiArCQkJaW50ZXJydXB0LW1hcC1tYXNrID0gPDAgMCAwIDc+Ow0KPiArCQkJaW50ZXJy
dXB0LW1hcCA9IDwwMDAwIDAgMCAxICZnaWMgMCAwIEdJQ19TUEkgMTA5DQo+IElSUV9UWVBFX0xF
VkVMX0hJR0g+LA0KPiArCQkJCQk8MDAwMCAwIDAgMiAmZ2ljIDAgMCBHSUNfU1BJIDExMA0KPiBJ
UlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gKwkJCQkJPDAwMDAgMCAwIDMgJmdpYyAwIDAgR0lDX1NQ
SSAxMTENCj4gSVJRX1RZUEVfTEVWRUxfSElHSD4sDQo+ICsJCQkJCTwwMDAwIDAgMCA0ICZnaWMg
MCAwIEdJQ19TUEkgMTEyDQo+IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiArCQkJc3RhdHVzID0g
ImRpc2FibGVkIjsNCj4gKwkJfTsNCj4gKw0KPiArCQlwY2llQDM1MDAwMDAgew0KPiArCQkJY29t
cGF0aWJsZSA9ICJmc2wsbHMxMDI4YS1wY2llIjsNCj4gKwkJCXJlZyA9IDwweDAwIDB4MDM1MDAw
MDAgMHgwIDB4MDAxMDAwMDAgICAvKiBjb250cm9sbGVyDQo+IHJlZ2lzdGVycyAqLw0KPiArCQkJ
ICAgICAgIDB4ODggMHgwMDAwMDAwMCAweDAgMHgwMDAwMjAwMD47IC8qIGNvbmZpZ3VyYXRpb24N
Cj4gc3BhY2UgKi8NCj4gKwkJCXJlZy1uYW1lcyA9ICJyZWdzIiwgImNvbmZpZyI7DQo+ICsJCQlp
bnRlcnJ1cHRzID0gPEdJQ19TUEkgMTEzIElSUV9UWVBFX0xFVkVMX0hJR0g+LA0KPiArCQkJCSAg
ICAgPEdJQ19TUEkgMTE0IElSUV9UWVBFX0xFVkVMX0hJR0g+Ow0KPiArCQkJaW50ZXJydXB0LW5h
bWVzID0gInBtZSIsICJhZXIiOw0KPiArCQkJI2FkZHJlc3MtY2VsbHMgPSA8Mz47DQo+ICsJCQkj
c2l6ZS1jZWxscyA9IDwyPjsNCj4gKwkJCWRldmljZV90eXBlID0gInBjaSI7DQo+ICsJCQlkbWEt
Y29oZXJlbnQ7DQo+ICsJCQludW0tbGFuZXMgPSA8ND47DQoNCkRpdHRvDQoNCj4gKwkJCWJ1cy1y
YW5nZSA9IDwweDAgMHhmZj47DQo+ICsJCQlyYW5nZXMgPSA8MHg4MTAwMDAwMCAweDAgMHgwMDAw
MDAwMCAweDg4IDB4MDAwMTAwMDAgMHgwDQo+IDB4MDAwMTAwMDAgICAvKiBkb3duc3RyZWFtIEkv
TyAqLw0KPiArCQkJCSAgMHg4MjAwMDAwMCAweDAgMHg0MDAwMDAwMCAweDg4IDB4NDAwMDAwMDAg
MHgwDQo+IDB4NDAwMDAwMDA+OyAvKiBub24tcHJlZmV0Y2hhYmxlIG1lbW9yeSAqLw0KPiArCQkJ
bXNpLXBhcmVudCA9IDwmaXRzPjsNCj4gKwkJCSNpbnRlcnJ1cHQtY2VsbHMgPSA8MT47DQo+ICsJ
CQlpbnRlcnJ1cHQtbWFwLW1hc2sgPSA8MCAwIDAgNz47DQo+ICsJCQlpbnRlcnJ1cHQtbWFwID0g
PDAwMDAgMCAwIDEgJmdpYyAwIDAgR0lDX1NQSSAxMTQNCj4gSVJRX1RZUEVfTEVWRUxfSElHSD4s
DQo+ICsJCQkJCTwwMDAwIDAgMCAyICZnaWMgMCAwIEdJQ19TUEkgMTE1DQo+IElSUV9UWVBFX0xF
VkVMX0hJR0g+LA0KPiArCQkJCQk8MDAwMCAwIDAgMyAmZ2ljIDAgMCBHSUNfU1BJIDExNg0KPiBJ
UlFfVFlQRV9MRVZFTF9ISUdIPiwNCj4gKwkJCQkJPDAwMDAgMCAwIDQgJmdpYyAwIDAgR0lDX1NQ
SSAxMTcNCj4gSVJRX1RZUEVfTEVWRUxfSElHSD47DQo+ICsJCQlzdGF0dXMgPSAiZGlzYWJsZWQi
Ow0KPiArCQl9Ow0KPiArDQo+ICAJCXBjaWVAMWYwMDAwMDAwIHsgLyogSW50ZWdyYXRlZCBFbmRw
b2ludCBSb290IENvbXBsZXggKi8NCj4gIAkJCWNvbXBhdGlibGUgPSAicGNpLWhvc3QtZWNhbS1n
ZW5lcmljIjsNCj4gIAkJCXJlZyA9IDwweDAxIDB4ZjAwMDAwMDAgMHgwIDB4MTAwMDAwPjsNCj4g
LS0NCj4gMi45LjUNCg0K
