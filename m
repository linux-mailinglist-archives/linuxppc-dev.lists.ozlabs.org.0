Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 286319B989
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 02:23:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FfBM4076zDrfZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2019 10:23:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.3.80; helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="bk2c+kEj"; 
 dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30080.outbound.protection.outlook.com [40.107.3.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Ff740L0mzDsFc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Aug 2019 10:20:30 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fk3ApKQ/nwvSQOLj7UdSktxH4EIyrT4cZ1YA4hvgR3SNW4thtL4+eedqWRnm0cx6D/MGwATYLjVdzzcwEluiwAk6JWaqo+M0r4l2usmxlgGvKrutskYKdt6+OlYgLpG2kpW7YnwmVXNCRqVJq0XwemyQvC3xpgXGF4jNpi0t8G78O+rpcIM0YrN2100IL7ElKDiUtHXiTK2IEW4vnoatHdPmtbc1YNqTSYWQfxxfZp5JMAlQ9ZOnBiE2GaWRfim3oicbDWy5oebiNslYQ+9L6TtlxDwM8EZTGa39DcLCiOacGqobNNNCZrA0p8PJ6GSMOnNrcW500pRhFA1j9zfrJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmovOBIKNrfjXWugTeGhMGs+CdzY0ZrLDT4uh8ESN+c=;
 b=YXhXoUhC7jbFkBKze57Ifo2tgqG47se7ErmJ3eMYyX+Vj+/8uKJulhB/G3GsSTxXsb4rmn3hKV2spsXpyhIm4TqXVcJ7p7iea2muh1vSlMtCqasY9sAfWRCiOn06nlhPGC6a5IiGlkR+wDeVJeKlPERkMBiPKJsbyvPoXQ8h1Onok6PkGsQsN1wvDEHDdcKX+I042UGeOguluKrmOF8O5pgUgoMbsgSIMu95rT100VbzB0RE9Fx1ovLmRQUKfceVk9B/NJxS+V9qBKgxJXhjL6P4sgYuI/gpb0EQODsYIXycJGadmjTa5/nJdI/xc9WUSpTbcMqq8DvWjez3ix62iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmovOBIKNrfjXWugTeGhMGs+CdzY0ZrLDT4uh8ESN+c=;
 b=bk2c+kEjM/ajOhHbB4n541R+wdf5K4hdLPYT3qTBQYzyybfiKc88kLp1ttzUiWwH3dxl849y9VYaxh8eMVNfy68mPTzGRswCo8ReJ2tl8U4Gh6YtpJRwIOFfseg/QQqtAz/Y0dYvBPlxYwnjdLe5zkgloCmD2YmMouxwBgo+s2g=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5SPR01MB01.eurprd04.prod.outlook.com (10.161.64.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.19; Sat, 24 Aug 2019 00:20:24 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::1ce8:464b:3edf:4043%7]) with mapi id 15.20.2178.020; Sat, 24 Aug 2019
 00:20:24 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v2 03/10] PCI: designware-ep: Move the function of getting
 MSI capability forward
Thread-Topic: [PATCH v2 03/10] PCI: designware-ep: Move the function of
 getting MSI capability forward
Thread-Index: AQHVWN1YD95dScG7KU2ImmGou/vsTKcIvmgAgACrOLA=
Date: Sat, 24 Aug 2019 00:20:24 +0000
Message-ID: <AM5PR04MB3299145781322FCBB134A8B1F5A70@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190822112242.16309-1-xiaowei.bao@nxp.com>
 <20190822112242.16309-3-xiaowei.bao@nxp.com>
 <20190823133837.GF14582@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190823133837.GF14582@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cc3a99a-f394-40fe-c83b-08d72828dbbb
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5SPR01MB01; 
x-ms-traffictypediagnostic: AM5SPR01MB01:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5SPR01MB01BCC850F0A87F0308F90BF5A70@AM5SPR01MB01.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0139052FDB
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(13464003)(199004)(189003)(81166006)(446003)(64756008)(66446008)(53546011)(102836004)(81156014)(26005)(4326008)(8676002)(229853002)(5660300002)(86362001)(316002)(66476007)(54906003)(66946007)(76116006)(6506007)(6246003)(6916009)(486006)(44832011)(14454004)(476003)(256004)(7416002)(6116002)(3846002)(76176011)(55016002)(9686003)(71190400001)(71200400001)(53936002)(66556008)(33656002)(186003)(52536014)(478600001)(2906002)(74316002)(66066001)(6436002)(8936002)(11346002)(7736002)(305945005)(7696005)(25786009)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5SPR01MB01;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: p+HQr/QkqH0w4O2smkcMgkxZKUwEOKJmJ4uFOys8F28kDFatkrv6ZLKA6Y+CIe0lKirdcd767FCoozAWlljk3ItFJ5ZFqKsSTJUPFNwh4qrIWuhU/3a98gKhNDygpAlV7AxgLpclTsePm8QX5hBjKAnMCU2lZehygxVLJdkTcBoZeer9w2EwXz4WFa34sMmrhPQVqOe/nyFDgbTKTWzMZssrOtqfjyvyeBpAY3b81kVRQCIyRjzwXWr/sraZ9b5s266fFR+UiIYtok7jXxxhRi/Ma03DeLz3yP6JmNCv3Yyt0y5IKGC3EBTyTQvFCMoNdIrBJt9E+V9ByuZi6Ym+NjoIcCvA41KRsTGsBS4RyrOnmijN9sTUiJHWo1PNF4egbORR9V063rW2bv9FEw5NVoNcfN6JfmXT2ItDoNYF4X4=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc3a99a-f394-40fe-c83b-08d72828dbbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2019 00:20:24.4515 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpZ06wOCrHVo+jLtvGpM88tXTKugOe+EVhaxGq3VYi3e6iTv4K0/iAOYNEoUtIvwKcIGVyHG3fSC25aR6JR5oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5SPR01MB01
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
 "lorenzo.pieralisi@arm.co" <lorenzo.pieralisi@arm.co>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, Leo Li <leoyang.li@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IE11cnJheSA8
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE5xOo41MIyM8jVIDIxOjM5DQo+IFRv
OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gQ2M6IGJoZWxnYWFzQGdvb2ds
ZS5jb207IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFyay5ydXRsYW5kQGFybS5jb207DQo+IHNoYXdu
Z3VvQGtlcm5lbC5vcmc7IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29tPjsga2lzaG9uQHRpLmNv
bTsNCj4gbG9yZW56by5waWVyYWxpc2lAYXJtLmNvOyBhcm5kQGFybmRiLmRlOyBncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZzsgTS5oLg0KPiBMaWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+OyBN
aW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5jb20+OyBSb3kNCj4gWmFuZyA8cm95LnphbmdAbnhw
LmNvbT47IGppbmdvb2hhbjFAZ21haWwuY29tOw0KPiBndXN0YXZvLnBpbWVudGVsQHN5bm9wc3lz
LmNvbTsgbGludXgtcGNpQHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWFybS1rZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcNCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCB2MiAwMy8xMF0gUENJOiBkZXNpZ253YXJlLWVwOiBNb3ZlIHRoZSBm
dW5jdGlvbiBvZg0KPiBnZXR0aW5nIE1TSSBjYXBhYmlsaXR5IGZvcndhcmQNCj4gDQo+IE9uIFRo
dSwgQXVnIDIyLCAyMDE5IGF0IDA3OjIyOjM1UE0gKzA4MDAsIFhpYW93ZWkgQmFvIHdyb3RlOg0K
PiA+IE1vdmUgdGhlIGZ1bmN0aW9uIG9mIGdldHRpbmcgTVNJIGNhcGFiaWxpdHkgdG8gdGhlIGZy
b250IG9mIGluaXQNCj4gPiBmdW5jdGlvbiwgYmVjYXVzZSB0aGUgaW5pdCBmdW5jdGlvbiBvZiB0
aGUgRVAgcGxhdGZvcm0gZHJpdmVyIHdpbGwgdXNlDQo+ID4gdGhlIHJldHVybiB2YWx1ZSBieSB0
aGUgZnVuY3Rpb24gb2YgZ2V0dGluZyBNU0kgY2FwYWJpbGl0eS4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiANCj4gUmV2aWV3ZWQt
Ynk6IEFuZHJldyBNdXJyYXkgPGFuZHJldy5tdXJyYXlAYXJtLmNvbT4NCg0KVGhhbmtzIGEgbG90
LCBJIHRoaW5rIG1vdmUgdGhpcyB0byBlcF9pbml0IGlzIGJldHRlci4NCg0KPiANCj4gPiAtLS0N
Cj4gPiB2MjoNCj4gPiAgLSBObyBjaGFuZ2UuDQo+ID4NCj4gPiAgZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWVwLmMgfCA3ICsrKystLS0NCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUtZXAuYw0KPiA+
IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWVwLmMNCj4gPiBp
bmRleCBiODM4OGY4Li4wYTZjMTk5IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1lcC5jDQo+ID4gKysrIGIvZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWVwLmMNCj4gPiBAQCAtNjU2LDYgKzY1NiwxMCBA
QCBpbnQgZHdfcGNpZV9lcF9pbml0KHN0cnVjdCBkd19wY2llX2VwICplcCkNCj4gPiAgCWlmIChy
ZXQgPCAwKQ0KPiA+ICAJCWVwYy0+bWF4X2Z1bmN0aW9ucyA9IDE7DQo+ID4NCj4gPiArCWVwLT5t
c2lfY2FwID0gZHdfcGNpZV9lcF9maW5kX2NhcGFiaWxpdHkocGNpLCBQQ0lfQ0FQX0lEX01TSSk7
DQo+ID4gKw0KPiA+ICsJZXAtPm1zaXhfY2FwID0gZHdfcGNpZV9lcF9maW5kX2NhcGFiaWxpdHko
cGNpLCBQQ0lfQ0FQX0lEX01TSVgpOw0KPiA+ICsNCj4gPiAgCWlmIChlcC0+b3BzLT5lcF9pbml0
KQ0KPiA+ICAJCWVwLT5vcHMtPmVwX2luaXQoZXApOw0KPiA+DQo+ID4gQEAgLTY3Miw5ICs2NzYs
NiBAQCBpbnQgZHdfcGNpZV9lcF9pbml0KHN0cnVjdCBkd19wY2llX2VwICplcCkNCj4gPiAgCQlk
ZXZfZXJyKGRldiwgIkZhaWxlZCB0byByZXNlcnZlIG1lbW9yeSBmb3IgTVNJL01TSS1YXG4iKTsN
Cj4gPiAgCQlyZXR1cm4gLUVOT01FTTsNCj4gPiAgCX0NCj4gPiAtCWVwLT5tc2lfY2FwID0gZHdf
cGNpZV9lcF9maW5kX2NhcGFiaWxpdHkocGNpLCBQQ0lfQ0FQX0lEX01TSSk7DQo+ID4gLQ0KPiA+
IC0JZXAtPm1zaXhfY2FwID0gZHdfcGNpZV9lcF9maW5kX2NhcGFiaWxpdHkocGNpLCBQQ0lfQ0FQ
X0lEX01TSVgpOw0KPiA+DQo+ID4gIAlvZmZzZXQgPSBkd19wY2llX2VwX2ZpbmRfZXh0X2NhcGFi
aWxpdHkocGNpLCBQQ0lfRVhUX0NBUF9JRF9SRUJBUik7DQo+ID4gIAlpZiAob2Zmc2V0KSB7DQo+
ID4gLS0NCj4gPiAyLjkuNQ0KPiA+DQo=
