Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5BDB299C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2019 06:12:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VfGz5STjzF5qb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2019 14:12:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.6.57; helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="VsDBeE9X"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60057.outbound.protection.outlook.com [40.107.6.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VfF351T0zF5Jd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 14:10:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQwT0vZme0gyXE6vuzeNCPnKeTjoOEXr0agML8l6LTRyeEq4JiF99T1+sl0WOhVuQjufR/UcSWeWhua7gVNtA+06waResbgEuXZiKq9C1aVIUjXH/DF2uzMWBhoXH0YY2VTfPWRc+Sd28DaRkA9Sq5yOoYeCh3O6xNWx82S+6iICg1OrCes0h4XEvQKYyc1djePkCfzndWENLiQrZLRc11CW3GHeQSTUBgBUb8lw4X2i7k2STXcwu0H+CrhNVt1Tpk29gwjxky4hEkiFqgdhhgK4iDY3wPs4iZrBJ4I3vitYWqYauT2YVdygQITbnBBASUpx4maCzWD8/x3Ql37SwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRHHSJt1mxrDmDeAv1lbjbqBZV0f6IAhtFzg4v2d4gA=;
 b=BEGFFvtEV+KW+4+xsBkMLHU1cDeeMQq45eSybY0G9IX+U5iD8YddeP9cUv3HfYSM0mxBico7HOyK/FoWodiezO39QpWT9POd+vsQ62GeCTBvtaeqf/HLIRteVuD3qp6eaym16CqE+xDEnP59ORC/0uBh4sP8SZ6yCTRPk02OUWyokQGgyUEJ08d6GX0fEkp3tFtbYfwIpCnI/AQFUuiZ0905r2EQXkZuXpIEpUHtIg294SBMdT4mkKRGsPkzY3Rlqx3skc5gjZxegWAe0NXcRpZ/2ZQmIInpwCDhbmDaowIbkAdZwOZJRhG7ABlyLztGUXFfFtrQh93KMJxrUgaj/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRHHSJt1mxrDmDeAv1lbjbqBZV0f6IAhtFzg4v2d4gA=;
 b=VsDBeE9Xe+X2R0kOoY7Gc+X8w6KGqim8sJhaVgjN5yv+EYm2YHzimH97kripEiKT6ITyQhMcQ2O1WDm5z3zYjfAOsoYXcq90zy0tu4YIeqlfN3pYutngO7BChenMPx9F8+SaOcFAHNdY357CuJJPboFp2CZSAr3Rkg/st0kv5aA=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3057.eurprd04.prod.outlook.com (10.175.229.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Sat, 14 Sep 2019 04:10:35 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41%3]) with mapi id 15.20.2241.022; Sat, 14 Sep 2019
 04:10:23 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v3 09/11] PCI: layerscape: Add EP mode support for ls1088a
 and ls2088a
Thread-Topic: [PATCH v3 09/11] PCI: layerscape: Add EP mode support for
 ls1088a and ls2088a
Thread-Index: AQHVYT5oPWSslHTrOEiBsmb0MgU076cYVkWAgADW08CADuGHAIACjmqA
Date: Sat, 14 Sep 2019 04:10:22 +0000
Message-ID: <AM5PR04MB3299CE219E17931066E1DA3CF5B20@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-10-xiaowei.bao@nxp.com>
 <20190902124603.GJ9720@e119886-lin.cambridge.arm.com>
 <AM5PR04MB329970AE2C1812E88B9DE5A2F5B90@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <20190912124943.GD9720@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190912124943.GD9720@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1beed297-61e9-4bd9-7b2a-08d738c976fe
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3057; 
x-ms-traffictypediagnostic: AM5PR04MB3057:|AM5PR04MB3057:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3057BC120C8DBD38978A4A89F5B20@AM5PR04MB3057.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01604FB62B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(39840400004)(136003)(376002)(199004)(189003)(13464003)(14444005)(81156014)(99286004)(229853002)(54906003)(9686003)(33656002)(6116002)(3846002)(53936002)(55016002)(316002)(6246003)(6436002)(478600001)(486006)(446003)(5660300002)(7416002)(11346002)(6916009)(14454004)(2906002)(86362001)(76176011)(6506007)(53546011)(8936002)(66066001)(7736002)(476003)(66946007)(7696005)(66476007)(66556008)(64756008)(66446008)(25786009)(76116006)(26005)(305945005)(74316002)(186003)(52536014)(71200400001)(71190400001)(44832011)(102836004)(4326008)(81166006)(8676002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3057;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: LJTT6mVSdeqUSbLAtYDDvfErmBi7aIs41mAv5hGeZhsX9M7Do3Ig0kXkDEFb92yl8K1uPCbUf2KuRih7BRvEU76Ks+MOeE0mfVBOixj5d3wkGmFDqfQ7lZmdXAFaSCOCWMaOCh9pD3fxI/5BGm7tXl3Sx4H5SQNjVXByVA5TaFUk9UDppB10DCeG7KNgwB09KRgi08CETVwouP6HfKuyOyo5YvcJq2ZPuQ4OMN/j+sT1V8tZ9TlAMgEsE8bkMnPzwshFIdBNOigNfUEmjprwXD+B3g60IjeZyxJWhjdhT2ibb2EOpJAK0GjVsxP8f1JxZuWzv1vqvUjnj8tCqz/w//qsFbzB6Cm4a2fkVWlS3TVKOiMxDWEiqnqmp/3Xdjig5EVNOcQrrP+wA7MGMBk70uQ/w3TKMojkxCdZIZIIpqQ=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1beed297-61e9-4bd9-7b2a-08d738c976fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2019 04:10:23.0836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QeRHVrJpJKHpbCTFRP2NSXPpo3Q37+VwEgSP3ZGwH7lo6q1a3Ti9Vk2VjpKucQJ2N5Ob0OsJZSkbLLxqfhl/7w==
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
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE55bm0OeaciDEy5pelIDIwOjUwDQo+
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
aG91QG54cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMDkvMTFdIFBDSTogbGF5ZXJz
Y2FwZTogQWRkIEVQIG1vZGUgc3VwcG9ydCBmb3INCj4gbHMxMDg4YSBhbmQgbHMyMDg4YQ0KPiAN
Cj4gT24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDE6NDc6MzZBTSArMDAwMCwgWGlhb3dlaSBCYW8g
d3JvdGU6DQo+ID4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+
IEZyb206IEFuZHJldyBNdXJyYXkgPGFuZHJldy5tdXJyYXlAYXJtLmNvbT4NCj4gPiA+IFNlbnQ6
IDIwMTnlubQ55pyIMuaXpSAyMDo0Ng0KPiA+ID4gVG86IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJh
b0BueHAuY29tPg0KPiA+ID4gQ2M6IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFy
bS5jb207IHNoYXduZ3VvQGtlcm5lbC5vcmc7DQo+ID4gPiBMZW8gTGkgPGxlb3lhbmcubGlAbnhw
LmNvbT47IGtpc2hvbkB0aS5jb207IGxvcmVuem8ucGllcmFsaXNpQGFybS5jb207DQo+IE0uaC4N
Cj4gPiA+IExpYW4gPG1pbmdodWFuLmxpYW5AbnhwLmNvbT47IE1pbmdrYWkgSHUgPG1pbmdrYWku
aHVAbnhwLmNvbT47IFJveQ0KPiA+ID4gWmFuZyA8cm95LnphbmdAbnhwLmNvbT47IGppbmdvb2hh
bjFAZ21haWwuY29tOw0KPiA+ID4gZ3VzdGF2by5waW1lbnRlbEBzeW5vcHN5cy5jb207IGxpbnV4
LXBjaUB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gPiA+IGxpbnV4LWFybS1rZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsgbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmc7DQo+ID4gPiBh
cm5kQGFybmRiLmRlOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsgWi5xLiBIb3UNCj4gPiA+
IDx6aGlxaWFuZy5ob3VAbnhwLmNvbT4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMDkv
MTFdIFBDSTogbGF5ZXJzY2FwZTogQWRkIEVQIG1vZGUgc3VwcG9ydA0KPiA+ID4gZm9yIGxzMTA4
OGEgYW5kIGxzMjA4OGENCj4gPiA+DQo+ID4gPiBPbiBNb24sIFNlcCAwMiwgMjAxOSBhdCAxMTox
NzoxNEFNICswODAwLCBYaWFvd2VpIEJhbyB3cm90ZToNCj4gPiA+ID4gQWRkIFBDSWUgRVAgbW9k
ZSBzdXBwb3J0IGZvciBsczEwODhhIGFuZCBsczIwODhhLCB0aGVyZSBhcmUgc29tZQ0KPiA+ID4g
PiBkaWZmZXJlbmNlIGJldHdlZW4gTFMxIGFuZCBMUzIgcGxhdGZvcm0sIHNvIHJlZmFjdG9yIHRo
ZSBjb2RlIG9mDQo+ID4gPiA+IHRoZSBFUCBkcml2ZXIuDQo+ID4gPiA+DQo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiA+ID4gPiAtLS0N
Cj4gPiA+ID4gdjI6DQo+ID4gPiA+ICAtIFRoaXMgaXMgYSBuZXcgcGF0Y2ggZm9yIHN1cHBvcnRp
bmcgdGhlIGxzMTA4OGEgYW5kIGxzMjA4OGEgcGxhdGZvcm0uDQo+ID4gPiA+IHYzOg0KPiA+ID4g
PiAgLSBBZGp1c3QgdGhlIHNvbWUgc3RydWN0IGFzc2lnbm1lbnQgb3JkZXIgaW4gcHJvYmUgZnVu
Y3Rpb24uDQo+ID4gPiA+DQo+ID4gPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kt
bGF5ZXJzY2FwZS1lcC5jIHwgNzINCj4gPiA+ID4gKysrKysrKysrKysrKysrKysrKy0tLS0tLS0N
Cj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1MyBpbnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMo
LSkNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMNCj4gPiA+ID4gYi9kcml2ZXJzL3BjaS9jb250cm9sbGVy
L2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jDQo+ID4gPiA+IGluZGV4IDVmMGNiOTkuLjcyM2JiZTUg
MTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1sYXll
cnNjYXBlLWVwLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
LWxheWVyc2NhcGUtZXAuYw0KPiA+ID4gPiBAQCAtMjAsMjcgKzIwLDI5IEBADQo+ID4gPiA+DQo+
ID4gPiA+ICAjZGVmaW5lIFBDSUVfREJJMl9PRkZTRVQJCTB4MTAwMAkvKiBEQkkyIGJhc2UgYWRk
cmVzcyovDQo+ID4gPiA+DQo+ID4gPiA+IC1zdHJ1Y3QgbHNfcGNpZV9lcCB7DQo+ID4gPiA+IC0J
c3RydWN0IGR3X3BjaWUJCSpwY2k7DQo+ID4gPiA+IC0Jc3RydWN0IHBjaV9lcGNfZmVhdHVyZXMJ
KmxzX2VwYzsNCj4gPiA+ID4gKyNkZWZpbmUgdG9fbHNfcGNpZV9lcCh4KQlkZXZfZ2V0X2RydmRh
dGEoKHgpLT5kZXYpDQo+ID4gPiA+ICsNCj4gPiA+ID4gK3N0cnVjdCBsc19wY2llX2VwX2RydmRh
dGEgew0KPiA+ID4gPiArCXUzMgkJCQlmdW5jX29mZnNldDsNCj4gPiA+ID4gKwljb25zdCBzdHJ1
Y3QgZHdfcGNpZV9lcF9vcHMJKm9wczsNCj4gPiA+ID4gKwljb25zdCBzdHJ1Y3QgZHdfcGNpZV9v
cHMJKmR3X3BjaWVfb3BzOw0KPiA+ID4gPiAgfTsNCj4gPiA+ID4NCj4gPiA+ID4gLSNkZWZpbmUg
dG9fbHNfcGNpZV9lcCh4KQlkZXZfZ2V0X2RydmRhdGEoKHgpLT5kZXYpDQo+ID4gPiA+ICtzdHJ1
Y3QgbHNfcGNpZV9lcCB7DQo+ID4gPiA+ICsJc3RydWN0IGR3X3BjaWUJCQkqcGNpOw0KPiA+ID4g
PiArCXN0cnVjdCBwY2lfZXBjX2ZlYXR1cmVzCQkqbHNfZXBjOw0KPiA+ID4gPiArCWNvbnN0IHN0
cnVjdCBsc19wY2llX2VwX2RydmRhdGEgKmRydmRhdGE7IH07DQo+ID4gPiA+DQo+ID4gPiA+ICBz
dGF0aWMgaW50IGxzX3BjaWVfZXN0YWJsaXNoX2xpbmsoc3RydWN0IGR3X3BjaWUgKnBjaSkgIHsN
Cj4gPiA+ID4gIAlyZXR1cm4gMDsNCj4gPiA+ID4gIH0NCj4gPiA+ID4NCj4gPiA+ID4gLXN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHdfcGNpZV9vcHMgbHNfcGNpZV9lcF9vcHMgPSB7DQo+ID4gPiA+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IGR3X3BjaWVfb3BzIGR3X2xzX3BjaWVfZXBfb3BzID0gew0KPiA+
ID4gPiAgCS5zdGFydF9saW5rID0gbHNfcGNpZV9lc3RhYmxpc2hfbGluaywgIH07DQo+ID4gPiA+
DQo+ID4gPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBsc19wY2llX2VwX29m
X21hdGNoW10gPSB7DQo+ID4gPiA+IC0JeyAuY29tcGF0aWJsZSA9ICJmc2wsbHMtcGNpZS1lcCIs
fSwNCj4gPiA+ID4gLQl7IH0sDQo+ID4gPiA+IC19Ow0KPiA+ID4gPiAtDQo+ID4gPiA+ICBzdGF0
aWMgY29uc3Qgc3RydWN0IHBjaV9lcGNfZmVhdHVyZXMqDQo+ID4gPiA+IGxzX3BjaWVfZXBfZ2V0
X2ZlYXR1cmVzKHN0cnVjdCBkd19wY2llX2VwICplcCkgIHsgQEAgLTg3LDEwICs4OSwzOQ0KPiA+
ID4gPiBAQCBzdGF0aWMgaW50IGxzX3BjaWVfZXBfcmFpc2VfaXJxKHN0cnVjdCBkd19wY2llX2Vw
ICplcCwgdTggZnVuY19ubywNCj4gPiA+ID4gIAl9DQo+ID4gPiA+ICB9DQo+ID4gPiA+DQo+ID4g
PiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGR3X3BjaWVfZXBfb3BzIHBjaWVfZXBfb3BzID0gew0K
PiA+ID4gPiArc3RhdGljIHVuc2lnbmVkIGludCBsc19wY2llX2VwX2Z1bmNfY29uZl9zZWxlY3Qo
c3RydWN0IGR3X3BjaWVfZXANCj4gKmVwLA0KPiA+ID4gPiArCQkJCQkJdTggZnVuY19ubykNCj4g
PiA+ID4gK3sNCj4gPiA+ID4gKwlzdHJ1Y3QgZHdfcGNpZSAqcGNpID0gdG9fZHdfcGNpZV9mcm9t
X2VwKGVwKTsNCj4gPiA+ID4gKwlzdHJ1Y3QgbHNfcGNpZV9lcCAqcGNpZSA9IHRvX2xzX3BjaWVf
ZXAocGNpKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCVdBUk5fT04oZnVuY19ubyAmJiAhcGNpZS0+
ZHJ2ZGF0YS0+ZnVuY19vZmZzZXQpOw0KPiA+ID4gPiArCXJldHVybiBwY2llLT5kcnZkYXRhLT5m
dW5jX29mZnNldCAqIGZ1bmNfbm87IH0NCj4gPiA+ID4gKw0KPiA+ID4gPiArc3RhdGljIGNvbnN0
IHN0cnVjdCBkd19wY2llX2VwX29wcyBsc19wY2llX2VwX29wcyA9IHsNCj4gPiA+ID4gIAkuZXBf
aW5pdCA9IGxzX3BjaWVfZXBfaW5pdCwNCj4gPiA+ID4gIAkucmFpc2VfaXJxID0gbHNfcGNpZV9l
cF9yYWlzZV9pcnEsDQo+ID4gPiA+ICAJLmdldF9mZWF0dXJlcyA9IGxzX3BjaWVfZXBfZ2V0X2Zl
YXR1cmVzLA0KPiA+ID4gPiArCS5mdW5jX2NvbmZfc2VsZWN0ID0gbHNfcGNpZV9lcF9mdW5jX2Nv
bmZfc2VsZWN0LCB9Ow0KPiA+ID4gPiArDQo+ID4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGxz
X3BjaWVfZXBfZHJ2ZGF0YSBsczFfZXBfZHJ2ZGF0YSA9IHsNCj4gPiA+ID4gKwkub3BzID0gJmxz
X3BjaWVfZXBfb3BzLA0KPiA+ID4gPiArCS5kd19wY2llX29wcyA9ICZkd19sc19wY2llX2VwX29w
cywgfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBsc19wY2llX2Vw
X2RydmRhdGEgbHMyX2VwX2RydmRhdGEgPSB7DQo+ID4gPiA+ICsJLmZ1bmNfb2Zmc2V0ID0gMHgy
MDAwMCwNCj4gPiA+ID4gKwkub3BzID0gJmxzX3BjaWVfZXBfb3BzLA0KPiA+ID4gPiArCS5kd19w
Y2llX29wcyA9ICZkd19sc19wY2llX2VwX29wcywgfTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArc3Rh
dGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbHNfcGNpZV9lcF9vZl9tYXRjaFtdID0gew0K
PiA+ID4gPiArCXsgLmNvbXBhdGlibGUgPSAiZnNsLGxzMTA0NmEtcGNpZS1lcCIsIC5kYXRhID0g
JmxzMV9lcF9kcnZkYXRhIH0sDQo+ID4gPiA+ICsJeyAuY29tcGF0aWJsZSA9ICJmc2wsbHMxMDg4
YS1wY2llLWVwIiwgLmRhdGEgPSAmbHMyX2VwX2RydmRhdGEgfSwNCj4gPiA+ID4gKwl7IC5jb21w
YXRpYmxlID0gImZzbCxsczIwODhhLXBjaWUtZXAiLCAuZGF0YSA9ICZsczJfZXBfZHJ2ZGF0YSB9
LA0KPiA+ID4gPiArCXsgfSwNCj4gPiA+DQo+ID4gPiBUaGlzIHJlbW92ZXMgc3VwcG9ydCBmb3Ig
ImZzbCxscy1wY2llLWVwIiAtIHdhcyB0aGF0IGludGVudGlvbmFsPyBJZg0KPiA+ID4geW91IGRv
IHBsYW4gdG8gZHJvcCBpdCBwbGVhc2UgbWFrZSBzdXJlIHlvdSBleHBsYWluIHdoeSBpbiB0aGUN
Cj4gPiA+IGNvbW1pdCBtZXNzYWdlLiBTZWUgYWxzbyBteSBjb21tZW50cyBpbiB5b3VyIGR0LWJp
bmRpbmcgcGF0Y2guDQo+ID4NCj4gPiBJbiBmYWN0LCB0aGUgdS1ib290IHdpbGwgZml4dXAgdGhl
IHN0YXR1cyBwcm9wZXJ0eSB0byAnc3RhdHVzID0NCj4gPiBlbmFibGVkJyBpbiBQQ0kgbm9kZSBv
ZiB0aGUgRFRTIGJhc2Ugb24gImZzbCxscy1wY2llLWVwIiBjb21wYXRpYmxlLA0KPiA+IHNvICJm
c2wsbHMtcGNpZS1lcCIgaXMgdXNlZCwgSSB1c2VkIHRoaXMgY29tcGF0aWJsZSBiZWZvcmUsIGJl
Y2F1c2UNCj4gPiB0aGUgZHJpdmVyIG9ubHkgc3VwcG9ydCB0aGUgTFMxMDQ2YSwgYnV0IHRoaXMg
dGltZSwgSSBhZGQgdGhlIExTMTA4OGENCj4gPiBhbmQgTFMyMDg4YSBzdXBwb3J0LCBhbmQgdGhl
c2UgdHdvIGJvYXJkcyBoYXZlIHNvbWUgZGlmZmVyZW5jZSBmb3JtDQo+IExTMTA0NmEsIHNvIEkg
Y2hhbmdlZCB0aGUgY29tcGF0aWJsZS4gSSBhbSBub3Qgc3VyZSB3aGV0aGVyIG5lZWQgdG8gYWRk
DQo+ICJmc2wsbHMtcGNpZS1lcCINCj4gPiBpbiB0aGVyZSwgY291bGQgeW91IGdpdmUgc29tZSBh
ZHZpY2UsIHRoYW5rcyBhIGxvdC4NCj4gDQo+IEl0IHNvdW5kcyBsaWtlICJmc2wsbHMtcGNpZS1l
cCIgY2FuIGJlIGEgZmFsbGJhY2sgZm9yICJmc2wsbHMxMDQ2YS1wY2llLWVwIi4NCg0KVGhpcyBp
cyBub3QgYSBmYWxsYmFjaywgdGhlIGNvbXBhdGlibGUgImZzbCxsczEwNDZhLXBjaWUtZXAiIGlz
IHVzZWQgYnkgYm9vdGxvYWRlciwNCnRoZSBib290bG9hZGVyIHdpbGwgbW9kaWZ5IHRoZSBzdGF0
dXMgcHJvcGVydHksIHRoZSBib290bG9hZGVyIGNvZGUgZ2V0IHRoZQ0KUENJX0hFQURFUl9UWVBF
KDB4ZSkgb2YgY29uZmlnIHNwYWNlIHRvIGRlY2lkZSBlbmFibGUgd2hpY2ggbm9kZShFUCBvciBS
QykNCnN0YXR1cyBwcm9wZXJ0eS4gQXQgdGhlIGJlZ2lubmluZywgd2UgcGxhbiB0byB1c2Ugb25l
IGNvbXBhdGlibGUgImZzbCxsczEwNDZhLXBjaWUtZXAiDQpzdXBwb3J0IGFsbCBOWFAncyBwbGF0
Zm9ybSwgYnV0IGFjdHVhbGx5LCBkdWUgdG8gdGhlIGRpZmZlcmVuY2Ugb2YgZWFjaCBwbGF0Zm9y
bSwNCml0IGlzIGRpZmZpY3VsdC4NCg0KPiANCj4gSSdtIGFzc3VtaW5nIHRoYXQgaWYgc29tZW9u
ZSB1c2VkICJmc2wsbHMxMDQ2YS1wY2llLWVwIiBvbiBsczEwODhhIG9yDQo+IGxzMjA4OGEgaGFy
ZHdhcmUgaXQgd291bGQgc3RpbGwgd29yaywgYnV0IHdpdGhvdXQgdGhlIG11bHRpcGxlIFBGIHN1
cHBvcnQuDQo+IA0KDQpJIHRoaW5rIHRoZSBFUCBkcml2ZXIgd2lsbCBub3Qgd29yayBpZiB1c2Ug
Y3VycmVudCBjb2RlLCBkdWUgdG8gdGhlIGN1cnJlbnQgZHJpdmVyDQpuZWVkIGRyaXZlciBkYXRh
LiANCg0KPiBJLmUuIGlmICJmc2wsbHMtcGNpZS1lcCIgaXMgZ2l2ZW4sIHRyZWF0IGl0IGFzIGxz
MTA0NmEuDQoNCg0KDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBBbmRyZXcgTXVycmF5DQo+IA0KPiA+
DQo+ID4gVGhhbmtzDQo+ID4gWGlhb3dlaQ0KPiA+DQo+ID4gPg0KPiA+ID4gVGhhbmtzLA0KPiA+
ID4NCj4gPiA+IEFuZHJldyBNdXJyYXkNCj4gPiA+DQo+ID4gPiA+ICB9Ow0KPiA+ID4gPg0KPiA+
ID4gPiAgc3RhdGljIGludCBfX2luaXQgbHNfYWRkX3BjaWVfZXAoc3RydWN0IGxzX3BjaWVfZXAg
KnBjaWUsIEBADQo+ID4gPiA+IC0xMDMsNw0KPiA+ID4gPiArMTM0LDcgQEAgc3RhdGljIGludCBf
X2luaXQgbHNfYWRkX3BjaWVfZXAoc3RydWN0IGxzX3BjaWVfZXANCj4gPiA+ID4gKypwY2llLA0K
PiA+ID4gPiAgCWludCByZXQ7DQo+ID4gPiA+DQo+ID4gPiA+ICAJZXAgPSAmcGNpLT5lcDsNCj4g
PiA+ID4gLQllcC0+b3BzID0gJnBjaWVfZXBfb3BzOw0KPiA+ID4gPiArCWVwLT5vcHMgPSBwY2ll
LT5kcnZkYXRhLT5vcHM7DQo+ID4gPiA+DQo+ID4gPiA+ICAJcmVzID0gcGxhdGZvcm1fZ2V0X3Jl
c291cmNlX2J5bmFtZShwZGV2LCBJT1JFU09VUkNFX01FTSwNCj4gPiA+ICJhZGRyX3NwYWNlIik7
DQo+ID4gPiA+ICAJaWYgKCFyZXMpDQo+ID4gPiA+IEBAIC0xNDIsMjAgKzE3MywyMyBAQCBzdGF0
aWMgaW50IF9faW5pdCBsc19wY2llX2VwX3Byb2JlKHN0cnVjdA0KPiA+ID4gcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KPiA+ID4gPiAgCWlmICghbHNfZXBjKQ0KPiA+ID4gPiAgCQlyZXR1cm4gLUVO
T01FTTsNCj4gPiA+ID4NCj4gPiA+ID4gLQlkYmlfYmFzZSA9IHBsYXRmb3JtX2dldF9yZXNvdXJj
ZV9ieW5hbWUocGRldiwNCj4gSU9SRVNPVVJDRV9NRU0sDQo+ID4gPiAicmVncyIpOw0KPiA+ID4g
PiAtCXBjaS0+ZGJpX2Jhc2UgPSBkZXZtX3BjaV9yZW1hcF9jZmdfcmVzb3VyY2UoZGV2LCBkYmlf
YmFzZSk7DQo+ID4gPiA+IC0JaWYgKElTX0VSUihwY2ktPmRiaV9iYXNlKSkNCj4gPiA+ID4gLQkJ
cmV0dXJuIFBUUl9FUlIocGNpLT5kYmlfYmFzZSk7DQo+ID4gPiA+ICsJcGNpZS0+ZHJ2ZGF0YSA9
IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOw0KPiA+ID4gPg0KPiA+ID4gPiAtCXBjaS0+
ZGJpX2Jhc2UyID0gcGNpLT5kYmlfYmFzZSArIFBDSUVfREJJMl9PRkZTRVQ7DQo+ID4gPiA+ICAJ
cGNpLT5kZXYgPSBkZXY7DQo+ID4gPiA+IC0JcGNpLT5vcHMgPSAmbHNfcGNpZV9lcF9vcHM7DQo+
ID4gPiA+IC0JcGNpZS0+cGNpID0gcGNpOw0KPiA+ID4gPiArCXBjaS0+b3BzID0gcGNpZS0+ZHJ2
ZGF0YS0+ZHdfcGNpZV9vcHM7DQo+ID4gPiA+DQo+ID4gPiA+ICAJbHNfZXBjLT5iYXJfZml4ZWRf
NjRiaXQgPSAoMSA8PCBCQVJfMikgfCAoMSA8PCBCQVJfNCksDQo+ID4gPiA+DQo+ID4gPiA+ICsJ
cGNpZS0+cGNpID0gcGNpOw0KPiA+ID4gPiAgCXBjaWUtPmxzX2VwYyA9IGxzX2VwYzsNCj4gPiA+
ID4NCj4gPiA+ID4gKwlkYmlfYmFzZSA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRl
diwNCj4gSU9SRVNPVVJDRV9NRU0sDQo+ID4gPiAicmVncyIpOw0KPiA+ID4gPiArCXBjaS0+ZGJp
X2Jhc2UgPSBkZXZtX3BjaV9yZW1hcF9jZmdfcmVzb3VyY2UoZGV2LCBkYmlfYmFzZSk7DQo+ID4g
PiA+ICsJaWYgKElTX0VSUihwY2ktPmRiaV9iYXNlKSkNCj4gPiA+ID4gKwkJcmV0dXJuIFBUUl9F
UlIocGNpLT5kYmlfYmFzZSk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlwY2ktPmRiaV9iYXNlMiA9
IHBjaS0+ZGJpX2Jhc2UgKyBQQ0lFX0RCSTJfT0ZGU0VUOw0KPiA+ID4gPiArDQo+ID4gPiA+ICAJ
cGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgcGNpZSk7DQo+ID4gPiA+DQo+ID4gPiA+ICAJcmV0
ID0gbHNfYWRkX3BjaWVfZXAocGNpZSwgcGRldik7DQo+ID4gPiA+IC0tDQo+ID4gPiA+IDIuOS41
DQo+ID4gPiA+DQo=
