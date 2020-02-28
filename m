Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38064173A62
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 15:53:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TXc34qkhzDr9H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Feb 2020 01:53:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.41; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=X1xExVzb; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70041.outbound.protection.outlook.com [40.107.7.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TXZF3lD0zDr7J
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Feb 2020 01:52:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RAIk1k8eMbO8ZyZgK8eMl0uTIqlqLydPlG5h0Qg/rG4aRsM/UReI+ekv57NwLOFsoXlQ5sApth/17rgiv91gh3EB+ZmZvEsTpp8v1MeADaeD7FJlw4o1R7cNfq/4nSOcs2pyCnRwT902zyGbPT8FN684K6QXLMeOY4427UFtUEjo5ro+j1EXozpIUmJx8UUIFaG4CzysukozxsDAtk2G7WcDdWx43z6ELfGf7d5vlzJmgogYT8Z3q33ETEKJ8ca9orz3E3lYbq4SLW5yYp5Xg76PE2r3MHetPeFFS7QHjQSOfc8WmaACKlKniCahWU/I8NOBaTgspbz/xHVZaAVS8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNTXBRab+x0fjSokK+3pQO5/o5JicSJJCfzZzHOC5JA=;
 b=BBMqQ0OK98c/BhirrWlTIW29XSs/OtefUF3DmPHHv9XFIUxYSTinFKsCdwe0cym26fy4kIIUJsTf/mpsshR2bE04HcNFZAgTkg2X0CJlVaN+0jAHE/mdk2onsI7/74jg1AAMwK/uulyZezBpc2PmTrY6fsRXwk6Ar4gBeylArzq6JJDxZYaWVUvYpvZAa6e6kaz9RxMgoduAzthlJQdoBMx0xx80kWlVwK6/IR8wKxFtkp+Q2bbFUvAwOF4AaFO/X4dBTShu7bIlI1XM0lUv3s9OyoYlmzTm4/c3HK9o5qJjVveUoMBScbKwT2BVN6okyKIUKV548UcYQY8d23u8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KNTXBRab+x0fjSokK+3pQO5/o5JicSJJCfzZzHOC5JA=;
 b=X1xExVzb7ob7afsZLt/MbmP5Pyh0zqdUq247ELIhSTuZbRT8jh3mTGLxOEIhZb44pXL4gTNG+8QO/oF+xh3Ub4QphPb9AwTdmmPVALTIkA1WyzU0xqullxVKVc+upNrtO6ffDSd/sNA455sujfAQwDEKDU6TulEo5y9zfJzAECE=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3124.eurprd04.prod.outlook.com (10.173.255.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18; Fri, 28 Feb 2020 14:52:12 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::308c:e154:899b:507e]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::308c:e154:899b:507e%5]) with mapi id 15.20.2772.018; Fri, 28 Feb 2020
 14:52:12 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: RE: [PATCH v4 00/11] Add the multiple PF support for DWC and
 Layerscape
Thread-Topic: [PATCH v4 00/11] Add the multiple PF support for DWC and
 Layerscape
Thread-Index: AQHVcn/lC20i2ULX8E628ZkyYVZ3RKgxb94AgAA3kbA=
Date: Fri, 28 Feb 2020 14:52:09 +0000
Message-ID: <AM5PR04MB32993255D9C6DC6D675E209AF5E80@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190924021849.3185-1-xiaowei.bao@nxp.com>
 <20200228113010.GB4064@e121166-lin.cambridge.arm.com>
In-Reply-To: <20200228113010.GB4064@e121166-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 159ba7b0-b287-48ef-f840-08d7bc5dcb14
x-ms-traffictypediagnostic: AM5PR04MB3124:|AM5PR04MB3124:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB31240453A4D78B434800387CF5E80@AM5PR04MB3124.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0327618309
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(376002)(396003)(346002)(136003)(199004)(189003)(7696005)(6666004)(86362001)(8676002)(4326008)(26005)(81166006)(71200400001)(186003)(33656002)(81156014)(5660300002)(54906003)(53546011)(6506007)(44832011)(316002)(55016002)(478600001)(52536014)(9686003)(6916009)(8936002)(2906002)(7416002)(66446008)(76116006)(64756008)(66476007)(66556008)(66946007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3124;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uvoVvBMdPx7TE6RJdoQq6+n9Vkj2B40TR9vd2wvhqoAkmDK9+UIyYjWtcmEB32frj1OBT+MaHvSQHgercttF7flgdWd7YYaYH0fw+L+aEJYvx7w5L3kKVdn+TtPAGURJXXVaIcWBi75tsRg6WgwXjj7mo/mJU3k9B969on+Dl+ctVqSnGSsjRTCDo//Xc24N/tehK4iCWYi4SRfeIdo//M2oV2TGt6MOJvgcr/BeB6J475uXMUzUB1tP0+qDk3w+HI4ZAS42Cc13GHeqx0pDPOOozZyv4gCBfSzsY6XgOsYrDZ33xT5IY1BM91dpVDpnmh/6qfhMEfSAXJOwUadsis3kZHshzQihSahPa6mhJAfc1JtoSX10+gvKeIlwVMuzpVZLVNO7pcVLB9i/4dWom42pZMoG6C4fF7ZwaNOZWHCQJZVEHgoS7snpwq5pHz24
x-ms-exchange-antispam-messagedata: goiEv3FV23wV5Ed5qKQRDmIO2W0gz3Mhz/q9KF0IAGsWWM8SEV3OJt+jXHW4U0+BXZMiOXwk5F4LrVXlv4pza5TfpsONDJ26k0z30gBzV0C1YX6SQhBgFCLdtcuG9ClzMGs4Aw3fSpCHKeovxi6MPw==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 159ba7b0-b287-48ef-f840-08d7bc5dcb14
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2020 14:52:11.3308 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C/9+tyrRWqBa9mI6CP2YpuFpLSjsm/cezMSHbXaDazThZXjQwGj6uqXAIAYVLg+tup5XkWBC/Qws82J1r/uAOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3124
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 Mingkai Hu <mingkai.hu@nxp.com>, Andrew Murray <amurray@thegoodpenguin.co.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTG9yZW56byBQaWVyYWxp
c2kgPGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20+DQo+IFNlbnQ6IDIwMjDE6jLUwjI4yNUgMTk6
MzANCj4gVG86IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiBDYzogcm9iaCtk
dEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgc2hhd25ndW9Aa2VybmVsLm9yZzsg
TGVvDQo+IExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBraXNob25AdGkuY29tOyBNLmguIExpYW4N
Cj4gPG1pbmdodWFuLmxpYW5AbnhwLmNvbT47IE1pbmdrYWkgSHUgPG1pbmdrYWkuaHVAbnhwLmNv
bT47IFJveSBaYW5nDQo+IDxyb3kuemFuZ0BueHAuY29tPjsgamluZ29vaGFuMUBnbWFpbC5jb207
DQo+IGd1c3Rhdm8ucGltZW50ZWxAc3lub3BzeXMuY29tOyBsaW51eC1wY2lAdmdlci5rZXJuZWwu
b3JnOw0KPiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGRldmljZXRyZWVA
dmdlci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eHBw
Yy1kZXZAbGlzdHMub3psYWJzLm9yZzsgQW5kcmV3IE11cnJheQ0KPiA8YW11cnJheUB0aGVnb29k
cGVuZ3Vpbi5jby51az4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwMC8xMV0gQWRkIHRoZSBt
dWx0aXBsZSBQRiBzdXBwb3J0IGZvciBEV0MgYW5kDQo+IExheWVyc2NhcGUNCj4gDQo+IE9uIFR1
ZSwgU2VwIDI0LCAyMDE5IGF0IDEwOjE4OjM4QU0gKzA4MDAsIFhpYW93ZWkgQmFvIHdyb3RlOg0K
PiA+IEFkZCB0aGUgUENJZSBFUCBtdWx0aXBsZSBQRiBzdXBwb3J0IGZvciBEV0MgYW5kIExheWVy
c2NhcGUsIGFkZCB0aGUNCj4gPiBkb29yYmVsbCBNU0lYIGZ1bmN0aW9uIGZvciBEV0MsIHVzZSBs
aXN0IHRvIG1hbmFnZSB0aGUgUEYgb2Ygb25lIFBDSWUNCj4gPiBjb250cm9sbGVyLCBhbmQgcmVm
YWN0b3IgdGhlIExheWVyc2NhcGUgRVAgZHJpdmVyIGR1ZSB0byBzb21lDQo+ID4gcGxhdGZvcm1z
IGRpZmZlcmVuY2UuDQo+ID4NCj4gPiBYaWFvd2VpIEJhbyAoMTEpOg0KPiA+ICAgUENJOiBkZXNp
Z253YXJlLWVwOiBBZGQgbXVsdGlwbGUgUEZzIHN1cHBvcnQgZm9yIERXQw0KPiA+ICAgUENJOiBk
ZXNpZ253YXJlLWVwOiBBZGQgdGhlIGRvb3JiZWxsIG1vZGUgb2YgTVNJLVggaW4gRVAgbW9kZQ0K
PiA+ICAgUENJOiBkZXNpZ253YXJlLWVwOiBNb3ZlIHRoZSBmdW5jdGlvbiBvZiBnZXR0aW5nIE1T
SSBjYXBhYmlsaXR5DQo+ID4gICAgIGZvcndhcmQNCj4gPiAgIFBDSTogZGVzaWdud2FyZS1lcDog
TW9kaWZ5IE1TSSBhbmQgTVNJWCBDQVAgd2F5IG9mIGZpbmRpbmcNCj4gPiAgIGR0LWJpbmRpbmdz
OiBwY2k6IGxheWVyc2NhcGUtcGNpOiBhZGQgY29tcGF0aWJsZSBzdHJpbmdzIGZvciBsczEwODhh
DQo+ID4gICAgIGFuZCBsczIwODhhDQo+ID4gICBQQ0k6IGxheWVyc2NhcGU6IEZpeCBzb21lIGZv
cm1hdCBpc3N1ZSBvZiB0aGUgY29kZQ0KPiA+ICAgUENJOiBsYXllcnNjYXBlOiBNb2RpZnkgdGhl
IHdheSBvZiBnZXR0aW5nIGNhcGFiaWxpdHkgd2l0aCBkaWZmZXJlbnQNCj4gPiAgICAgUEVYDQo+
ID4gICBQQ0k6IGxheWVyc2NhcGU6IE1vZGlmeSB0aGUgTVNJWCB0byB0aGUgZG9vcmJlbGwgbW9k
ZQ0KPiA+ICAgUENJOiBsYXllcnNjYXBlOiBBZGQgRVAgbW9kZSBzdXBwb3J0IGZvciBsczEwODhh
IGFuZCBsczIwODhhDQo+ID4gICBhcm02NDogZHRzOiBsYXllcnNjYXBlOiBBZGQgUENJZSBFUCBu
b2RlIGZvciBsczEwODhhDQo+ID4gICBtaXNjOiBwY2lfZW5kcG9pbnRfdGVzdDogQWRkIExTMTA4
OGEgaW4gcGNpX2RldmljZV9pZCB0YWJsZQ0KPiA+DQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3BjaS9sYXllcnNjYXBlLXBjaS50eHQgICAgIHwgICAyICsNCj4gPiAgYXJjaC9hcm02NC9i
b290L2R0cy9mcmVlc2NhbGUvZnNsLWxzMTA4OGEuZHRzaSAgICAgfCAgMzEgKysrDQo+ID4gIGRy
aXZlcnMvbWlzYy9wY2lfZW5kcG9pbnRfdGVzdC5jICAgICAgICAgICAgICAgICAgIHwgICAyICsN
Cj4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYyAgICAg
fCAxMDAgKysrKysrLS0NCj4gPiAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNp
Z253YXJlLWVwLmMgICAgfCAyNTUNCj4gKysrKysrKysrKysrKysrKystLS0tDQo+ID4gIGRyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5jICAgICAgIHwgIDU5ICsrKy0t
DQo+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5oICAgICAg
IHwgIDQ4ICsrKy0NCj4gPiAgNyBmaWxlcyBjaGFuZ2VkLCA0MDQgaW5zZXJ0aW9ucygrKSwgOTMg
ZGVsZXRpb25zKC0pDQo+IA0KPiBIaSwNCj4gDQo+IGFyZSB5b3UgcmVzZW5kaW5nIHRoaXMgcGF0
Y2hzZXQgPyBJIHdvdWxkIGFsc28gbGlrZSBBbmRyZXcgYW5kIEtpc2hvbiB0byBoYXZlDQo+IGEg
bG9vayBhbmQgQUNLIHJlbGV2YW50IGNvZGUgYmVmb3JlIG1lcmdpbmcgaXQuDQoNClRoYW5rIHlv
dSBmb3IgZm9sbG93aW5nIHRoZXNlIHBhdGNoZXMsIEkgaGF2ZSByZXBsYXkgdGhlIGVtYWlsIHRv
IEtpc2hvbiwgYW5kIEkgd2lsbA0KZGVjaWRlIHdoZXRoZXIgdG8gcmVzZW5kIHRoZSBzZXRzIHBh
dGNoZXMgYmFzZWQgb24gaGlzIGNvbW1lbnRzLg0KDQpUaGFua3MgDQpYaWFvd2VpDQogDQo+IFRo
YW5rcywNCj4gTG9yZW56bw0K
