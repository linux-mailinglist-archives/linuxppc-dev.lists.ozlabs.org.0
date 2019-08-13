Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4214A8B154
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 09:41:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4674RM0hDMzDqXt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 17:41:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.13.54; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="Ok0gZh2E"; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130054.outbound.protection.outlook.com [40.107.13.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4674PG43przDqWs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 17:39:59 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BK0AzB1hdHBxOpafcPVaLFe8BrALgNoiGLnWJxBWzRg2dON3jAx2tJ31feqQXAmzzbMbnozR3NKf+VLuuu/sZQsb8Aq1IceJqx0qStNv5D+oNPBC2vPWgb8U/yEMmAarhcjOD9qva24YCDXg/ldlqOpWTv3inFicxw4jHsoiImfHBFKf3xQ8YGWG5xXzmYeRoc4WhrItNE/Ly2T2VIGHFcpsy6Yrs2dEitaG4kg8AjCBSeQ4NOMp7r9IRElMgq0BeVN7mMvIAP3SkWearlFOqDfENKMYo93+zJ7ABXL/aYH4Cfb8N1JdkKUBgb4uNttC3Xx+fSn+BSOdRC6+cmLkYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P77/HK+A2hAAqQS5mdJRckP8Gm6gRbAnWpnCbKgAqhA=;
 b=W4z77RPwNT1MokFE8GQu9TpK+0RU9acGL4icr0+WLKctyXFIr8ckL0a2f53jCKTrT3lK4IPUeyvic9RNajbOas3tTTWBgqsrxBbWhiOkXBOB86/0hFnznKzhilUSvOguaTCItYNFcwUZ1lJkzHw84XlgDY7kxI4DOt+UHzHryY30bP3lZejoISNHdF9A22pPmF+aUsZVkNIWzz9bU3kVQ7A5K54nZ18QGqjVnIEUtkf5+yPcqZoGcLmBqt91i7AIm/GpwOP8ZmLk4FsZvshIUYQ04ooibsaJ8QduuImVMUEGnBs+m5yHIhSZwEXE1OOR7pXykpJqP2ZVq65QIc/fLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P77/HK+A2hAAqQS5mdJRckP8Gm6gRbAnWpnCbKgAqhA=;
 b=Ok0gZh2Es9x2hzw/IrbWiaGbRwcUje2iOtVfLbuVQkVhg+XioY9f3c8QqGim0eOIb0vBkZgm/8bdldnlO3Iv/eHq9CaHAwkNH3faigKmoKL+6dTnQrMDXGYqd+M022h0+tzQc/uUwaoceIKBDLcYbkwm88ncyubQwDM4AK9rNOo=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3220.eurprd04.prod.outlook.com (10.173.255.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Tue, 13 Aug 2019 07:39:48 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84%5]) with mapi id 15.20.2157.022; Tue, 13 Aug 2019
 07:39:48 +0000
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
Subject: RE: [EXT] Re: [PATCHv5 1/2] PCI: layerscape: Add the bar_fixed_64bit
 property in EP driver.
Thread-Topic: [EXT] Re: [PATCHv5 1/2] PCI: layerscape: Add the bar_fixed_64bit
 property in EP driver.
Thread-Index: AQHVUaHA8E+uV7sB3kSdNrIxtC9aDKb4rpUAgAAB5uA=
Date: Tue, 13 Aug 2019 07:39:48 +0000
Message-ID: <AM5PR04MB32993CC1344DD660A298C7E1F5D20@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190813062840.2733-1-xiaowei.bao@nxp.com>
 <61e6df1c-a0dc-8f05-f74a-85a3cac9823f@ti.com>
In-Reply-To: <61e6df1c-a0dc-8f05-f74a-85a3cac9823f@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93dab06e-14c7-4194-a128-08d71fc16b18
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3220; 
x-ms-traffictypediagnostic: AM5PR04MB3220:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB32200E45A421ADF53D5E1772F5D20@AM5PR04MB3220.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:284;
x-forefront-prvs: 01283822F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(13464003)(189003)(199004)(3846002)(305945005)(7736002)(2501003)(86362001)(6116002)(81166006)(478600001)(81156014)(8676002)(9686003)(486006)(53546011)(102836004)(110136005)(6506007)(186003)(446003)(6436002)(316002)(44832011)(76176011)(476003)(55016002)(99286004)(76116006)(64756008)(66556008)(66476007)(11346002)(2201001)(66946007)(66446008)(26005)(7696005)(8936002)(229853002)(25786009)(6246003)(74316002)(7416002)(53936002)(33656002)(2906002)(256004)(14454004)(71200400001)(71190400001)(52536014)(5660300002)(66066001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3220;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NYt9vtks3dsd/HX1VCxdj9d3e2+/yHC0hGytE1vGjHcvrpyNuz81tAnm2MsO/cAIn5Q4P8xDIO+tDdv91onLwNvx6e7IIuNdu+MeJNgId4PspWUlWe/o17Q/HtLYysfm5bWavkZmEGEeUNuAyqtGlWJNgzPYxC8NgFbL/I8X2LgZaXoMZXj3t7ucphlJ/v0eO3HgV5vYYtKSp68nhpE12JsUlv1JcIAxSVpoXUNIdD6mVeZV2rSSEtJE4uwjeA3LeekeUw8NJDLBh39lcCMmNwuCPjmOE/aQm1S6hrdE5Xe+R81oODllcSbOy3s6x/WigaYK+yuBbxgS9wRfiUTC9CJJEq2j8Vfs1H0++rXXWh0KBZgU4g+015m0YtqPryY2zjTHwi2LzNQRb3Vv5sF06PXwzypIeD6mM0Q63F0210o=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93dab06e-14c7-4194-a128-08d71fc16b18
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2019 07:39:48.1250 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NOJCq0LTRTlfKgrfA2vsSO9QDVdvwxIpshRkTDBJ937J+gU2Hlhm7R5oD6KZXHt7Y9LpviIok1yHwHdr4sbbHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3220
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
cmFoYW0gSSA8a2lzaG9uQHRpLmNvbT4NCj4gU2VudDogMjAxOeW5tDjmnIgxM+aXpSAxNTozMA0K
PiBUbzogWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54cC5jb20+OyBsb3JlbnpvLnBpZXJhbGlz
aUBhcm0uY29tOw0KPiBiaGVsZ2Fhc0Bnb29nbGUuY29tOyBNLmguIExpYW4gPG1pbmdodWFuLmxp
YW5AbnhwLmNvbT47IE1pbmdrYWkgSHUNCj4gPG1pbmdrYWkuaHVAbnhwLmNvbT47IFJveSBaYW5n
IDxyb3kuemFuZ0BueHAuY29tPjsNCj4gbC5zdGFjaEBwZW5ndXRyb25peC5kZTsgdHBpZXBob0Bp
bXBpbmouY29tOyBMZW9uYXJkIENyZXN0ZXoNCj4gPGxlb25hcmQuY3Jlc3RlekBueHAuY29tPjsg
YW5kcmV3LnNtaXJub3ZAZ21haWwuY29tOw0KPiB5dWUud2FuZ0BhbWxvZ2ljLmNvbTsgaGF5YXNo
aS5rdW5paGlrb0Bzb2Npb25leHQuY29tOw0KPiBkd213QGFtYXpvbi5jby51azsgam9ubnljQGFt
YXpvbi5jb207IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmc7IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnOw0KPiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4gU3ViamVjdDogW0VYVF0gUmU6IFtQQVRDSHY1
IDEvMl0gUENJOiBsYXllcnNjYXBlOiBBZGQgdGhlIGJhcl9maXhlZF82NGJpdA0KPiBwcm9wZXJ0
eSBpbiBFUCBkcml2ZXIuDQo+IA0KPiBDYXV0aW9uOiBFWFQgRW1haWwNCj4gDQo+IE9uIDEzLzA4
LzE5IDExOjU4IEFNLCBYaWFvd2VpIEJhbyB3cm90ZToNCj4gPiBUaGUgUENJZSBjb250cm9sbGVy
IG9mIGxheWVyc2NhcGUganVzdCBoYXZlIDQgQkFScywgQkFSMCBhbmQgQkFSMSBpcw0KPiA+IDMy
Yml0LCBCQVIyIGFuZCBCQVI0IGlzIDY0Yml0LCB0aGlzIGlzIGRldGVybWluZWQgYnkgaGFyZHdh
cmUsIHNvIHNldA0KPiA+IHRoZSBiYXJfZml4ZWRfNjRiaXQgd2l0aCAweDE0Lg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogWGlhb3dlaSBCYW8gPHhpYW93ZWkuYmFvQG54cC5jb20+DQo+IA0KPiBB
Y2tlZC1ieTogS2lzaG9uIFZpamF5IEFicmFoYW0gSSA8a2lzaG9uQHRpLmNvbT4NCj4gPiAtLS0N
Cj4gPiB2MjoNCj4gPiAgLSBSZXBsYWNlIHZhbHVlIDB4MTQgd2l0aCBhIG1hY3JvLg0KPiA+IHYz
Og0KPiA+ICAtIE5vIGNoYW5nZS4NCj4gPiB2NDoNCj4gPiAgLSBzZW5kIHRoZSBwYXRjaCBhZ2Fp
biB3aXRoICctLXRvJy4NCj4gPiB2NToNCj4gPiAgLSBmaXggdGhlIGNvbW1pdCBtZXNzYWdlLg0K
PiA+DQo+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMg
fCAxICsNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0K
PiA+IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+
IGluZGV4IGJlNjFkOTYuLmNhOWFhNDUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvZHdjL3BjaS1sYXllcnNjYXBlLWVwLmMNCj4gPiBAQCAtNDQsNiArNDQsNyBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHBjaV9lcGNfZmVhdHVyZXMNCj4gbHNfcGNpZV9lcGNfZmVhdHVy
ZXMgPSB7DQo+ID4gICAgICAgLmxpbmt1cF9ub3RpZmllciA9IGZhbHNlLA0KPiA+ICAgICAgIC5t
c2lfY2FwYWJsZSA9IHRydWUsDQo+ID4gICAgICAgLm1zaXhfY2FwYWJsZSA9IGZhbHNlLA0KPiA+
ICsgICAgIC5iYXJfZml4ZWRfNjRiaXQgPSAoMSA8PCBCQVJfMikgfCAoMSA8PCBCQVJfNCksDQo+
ID4gIH07DQo+ID4NCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBwY2lfZXBjX2ZlYXR1cmVzKg0K
SSBjaGVjayBvdGhlciBwbGF0Zm9ybXMsIGl0IGlzICdzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9l
cGNfZmVhdHVyZXMnLCBJIGNhbiBnZXQgdGhlIGNvcnJlY3QgDQpWYWx1ZSB1c2UgdGhpcyBkZWZp
bmUgd2F5IGluIHBjaS1lcGYtdGVzdC5jIGZpbGUuDQo+ID4NCg==
