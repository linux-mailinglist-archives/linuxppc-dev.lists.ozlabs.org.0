Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A10FDA5EF4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 03:49:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Mqd02k0gzDqNR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 11:49:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.1.88; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="kT2ua/dP"; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10088.outbound.protection.outlook.com [40.107.1.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Mqb55ktFzDqcS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 11:47:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+hII0giCPmxCT1SnLLomfa+V8rcwkshJ8Wo/Pn+MTXejI7hX4JMBodgg2mtoBML030Zy0Gi5RB68pqZZ3n+aaKrmfQZPuLvqjVwvOm+21wTZ542HmBoaHEt/HsYkWEh09uh+T1qavZJDrTcKk/IXkE3NAptko2ctLK2r0tX72wRXMBqPUUN9EWuvGDErtR/VIV9leRotPs8qBzbcS8KeRpjvdGIqOHu0aF6wC9jYxkpd0zM+9kX6AvHjkc3mS3HjmMUOSzOqKedqCicPSveGoEYUVexMd5CFRF8tRDW0pu0At83n5YN3stTIkVbuV8Pl70k5gWG0mMZBWn1n6GxIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noRvyUDxfAFJt0ID0V0DLTdiaFvpK5Yy3yFVExCnMTs=;
 b=HkhFpMNCyS9jmkisfKl2irwJ3GWUTGh9wAywHpAiV/fjw0G1T60f072ZZTNDvczEEayf6rIV3wTQsaAkp7QKupbUv+kMtABxPAQBSUsFtAUN6kQWl1Qlh3MrXNJWo00nzY4mf23YWzBf2rg9GeS9yrK6lOtFSYzakbHQiRKVVqpQxlqFXC8a7/z2T9tqVcly7VA3C/F3nwQj6bDLiIOAwzoqxtP9gAFBQBpcW/PBYK9CPXBpzctd3ajZe6P0GY46buuU+mJTtSFrLMIk2TYeRuWdt6mO1jvCszDBrOvMIy6+1fbI/q8dmtcOeZMQxm2eJ6S9uo92JdOrCDDLJm0TtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=noRvyUDxfAFJt0ID0V0DLTdiaFvpK5Yy3yFVExCnMTs=;
 b=kT2ua/dPObS2ISg6LGYdMYf8QVqRHUrIxeKvydGirUr7BNGR2qEr35TuGCcqpXZf4iNVhSXxDAQMGLsb+nZNX8PJGXXg+q5u+LzyHTkGQs4O1bdLw/hSMrtN5NDkQkQ7pJTSQsOFnOQbsNVI2E4l6wfvzi0ocEK9XLAWVUdnkZs=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3268.eurprd04.prod.outlook.com (10.167.171.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.21; Tue, 3 Sep 2019 01:47:36 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41%3]) with mapi id 15.20.2220.022; Tue, 3 Sep 2019
 01:47:36 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH v3 09/11] PCI: layerscape: Add EP mode support for ls1088a
 and ls2088a
Thread-Topic: [PATCH v3 09/11] PCI: layerscape: Add EP mode support for
 ls1088a and ls2088a
Thread-Index: AQHVYT5oPWSslHTrOEiBsmb0MgU076cYVkWAgADW08A=
Date: Tue, 3 Sep 2019 01:47:36 +0000
Message-ID: <AM5PR04MB329970AE2C1812E88B9DE5A2F5B90@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-10-xiaowei.bao@nxp.com>
 <20190902124603.GJ9720@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190902124603.GJ9720@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6bbdb53-e44f-4b39-8661-08d73010b260
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3268; 
x-ms-traffictypediagnostic: AM5PR04MB3268:|AM5PR04MB3268:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB326887D4235A0553A39E395EF5B90@AM5PR04MB3268.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(13464003)(189003)(199004)(9686003)(446003)(478600001)(74316002)(8676002)(305945005)(5660300002)(6916009)(76176011)(7696005)(81166006)(54906003)(2906002)(81156014)(186003)(52536014)(55016002)(229853002)(26005)(8936002)(7736002)(102836004)(64756008)(66556008)(66476007)(66446008)(76116006)(86362001)(25786009)(6506007)(53546011)(316002)(66946007)(6436002)(71200400001)(71190400001)(53936002)(4326008)(14444005)(256004)(14454004)(3846002)(44832011)(486006)(6116002)(476003)(11346002)(7416002)(66066001)(6246003)(99286004)(33656002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3268;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: F/f1gt4Mj4H2rlzDS/rcgY+DnFHSSFV4woz7vk6LBM6AFBgzGsGDW+3yqsboXh/DdlfnpZApR8G+34RFEJAVaEXVjDwjqGr3Eh9Zfz8H6ux2JF+OtlT1qpexf6M7JfqfnGtUg+DoYO7xFNzMrNfQHAazLOKwSJDIyJ0DTpA4xIk7gzy5ARYm9L580tVHztFiRhNiNNAoPtNE02osmsdvBDqF3ecb1BiwRNeUP+MXQ5XxuCWIRKDybkU1Xf2eYeUnZmhT/81YiFmlQcbWMnVVhIZiQTYntLs8ikOg1fv4mxohNb3xJXUJG2ZIRS31f4I7lrES44WVVIoTzCmrpyV2g+zbgJFM9BcVxMzsXGCQWBcgt66dnyi1b1HYNUSXo6TgTV99unMNP8tfZp8voEt906lKIrak+aFXMSo4KTQh810=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6bbdb53-e44f-4b39-8661-08d73010b260
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 01:47:36.4835 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5uSLGrmmsqlWSxzHx3Egqnr7LeWYC7Iw3QeV1scUq1brDy0D/jSwJ2qGSuLt0CaXa2lLihjAehkDz8Lt2NT0sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3268
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
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE5xOo51MIyyNUgMjA6NDYNCj4gVG86
IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiBDYzogcm9iaCtkdEBrZXJuZWwu
b3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgc2hhd25ndW9Aa2VybmVsLm9yZzsgTGVvDQo+IExp
IDxsZW95YW5nLmxpQG54cC5jb20+OyBraXNob25AdGkuY29tOyBsb3JlbnpvLnBpZXJhbGlzaUBh
cm0uY29tOyBNLmguDQo+IExpYW4gPG1pbmdodWFuLmxpYW5AbnhwLmNvbT47IE1pbmdrYWkgSHUg
PG1pbmdrYWkuaHVAbnhwLmNvbT47IFJveQ0KPiBaYW5nIDxyb3kuemFuZ0BueHAuY29tPjsgamlu
Z29vaGFuMUBnbWFpbC5jb207DQo+IGd1c3Rhdm8ucGltZW50ZWxAc3lub3BzeXMuY29tOyBsaW51
eC1wY2lAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnOyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsNCj4gYXJuZEBhcm5kYi5k
ZTsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IFoucS4gSG91DQo+IDx6aGlxaWFuZy5ob3VA
bnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MyAwOS8xMV0gUENJOiBsYXllcnNjYXBl
OiBBZGQgRVAgbW9kZSBzdXBwb3J0IGZvcg0KPiBsczEwODhhIGFuZCBsczIwODhhDQo+IA0KPiBP
biBNb24sIFNlcCAwMiwgMjAxOSBhdCAxMToxNzoxNEFNICswODAwLCBYaWFvd2VpIEJhbyB3cm90
ZToNCj4gPiBBZGQgUENJZSBFUCBtb2RlIHN1cHBvcnQgZm9yIGxzMTA4OGEgYW5kIGxzMjA4OGEs
IHRoZXJlIGFyZSBzb21lDQo+ID4gZGlmZmVyZW5jZSBiZXR3ZWVuIExTMSBhbmQgTFMyIHBsYXRm
b3JtLCBzbyByZWZhY3RvciB0aGUgY29kZSBvZiB0aGUNCj4gPiBFUCBkcml2ZXIuDQo+ID4NCj4g
PiBTaWduZWQtb2ZmLWJ5OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gPiAt
LS0NCj4gPiB2MjoNCj4gPiAgLSBUaGlzIGlzIGEgbmV3IHBhdGNoIGZvciBzdXBwb3J0aW5nIHRo
ZSBsczEwODhhIGFuZCBsczIwODhhIHBsYXRmb3JtLg0KPiA+IHYzOg0KPiA+ICAtIEFkanVzdCB0
aGUgc29tZSBzdHJ1Y3QgYXNzaWdubWVudCBvcmRlciBpbiBwcm9iZSBmdW5jdGlvbi4NCj4gPg0K
PiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS1lcC5jIHwgNzIN
Cj4gPiArKysrKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNTMg
aW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+IGIvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+IGluZGV4IDVmMGNi
OTkuLjcyM2JiZTUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2Mv
cGNpLWxheWVyc2NhcGUtZXAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaS1sYXllcnNjYXBlLWVwLmMNCj4gPiBAQCAtMjAsMjcgKzIwLDI5IEBADQo+ID4NCj4gPiAg
I2RlZmluZSBQQ0lFX0RCSTJfT0ZGU0VUCQkweDEwMDAJLyogREJJMiBiYXNlIGFkZHJlc3MqLw0K
PiA+DQo+ID4gLXN0cnVjdCBsc19wY2llX2VwIHsNCj4gPiAtCXN0cnVjdCBkd19wY2llCQkqcGNp
Ow0KPiA+IC0Jc3RydWN0IHBjaV9lcGNfZmVhdHVyZXMJKmxzX2VwYzsNCj4gPiArI2RlZmluZSB0
b19sc19wY2llX2VwKHgpCWRldl9nZXRfZHJ2ZGF0YSgoeCktPmRldikNCj4gPiArDQo+ID4gK3N0
cnVjdCBsc19wY2llX2VwX2RydmRhdGEgew0KPiA+ICsJdTMyCQkJCWZ1bmNfb2Zmc2V0Ow0KPiA+
ICsJY29uc3Qgc3RydWN0IGR3X3BjaWVfZXBfb3BzCSpvcHM7DQo+ID4gKwljb25zdCBzdHJ1Y3Qg
ZHdfcGNpZV9vcHMJKmR3X3BjaWVfb3BzOw0KPiA+ICB9Ow0KPiA+DQo+ID4gLSNkZWZpbmUgdG9f
bHNfcGNpZV9lcCh4KQlkZXZfZ2V0X2RydmRhdGEoKHgpLT5kZXYpDQo+ID4gK3N0cnVjdCBsc19w
Y2llX2VwIHsNCj4gPiArCXN0cnVjdCBkd19wY2llCQkJKnBjaTsNCj4gPiArCXN0cnVjdCBwY2lf
ZXBjX2ZlYXR1cmVzCQkqbHNfZXBjOw0KPiA+ICsJY29uc3Qgc3RydWN0IGxzX3BjaWVfZXBfZHJ2
ZGF0YSAqZHJ2ZGF0YTsgfTsNCj4gPg0KPiA+ICBzdGF0aWMgaW50IGxzX3BjaWVfZXN0YWJsaXNo
X2xpbmsoc3RydWN0IGR3X3BjaWUgKnBjaSkgIHsNCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+
ID4NCj4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBkd19wY2llX29wcyBsc19wY2llX2VwX29wcyA9
IHsNCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBkd19wY2llX29wcyBkd19sc19wY2llX2VwX29w
cyA9IHsNCj4gPiAgCS5zdGFydF9saW5rID0gbHNfcGNpZV9lc3RhYmxpc2hfbGluaywgIH07DQo+
ID4NCj4gPiAtc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgbHNfcGNpZV9lcF9vZl9t
YXRjaFtdID0gew0KPiA+IC0JeyAuY29tcGF0aWJsZSA9ICJmc2wsbHMtcGNpZS1lcCIsfSwNCj4g
PiAtCXsgfSwNCj4gPiAtfTsNCj4gPiAtDQo+ID4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGNpX2Vw
Y19mZWF0dXJlcyogIGxzX3BjaWVfZXBfZ2V0X2ZlYXR1cmVzKHN0cnVjdA0KPiA+IGR3X3BjaWVf
ZXAgKmVwKSAgeyBAQCAtODcsMTAgKzg5LDM5IEBAIHN0YXRpYyBpbnQNCj4gPiBsc19wY2llX2Vw
X3JhaXNlX2lycShzdHJ1Y3QgZHdfcGNpZV9lcCAqZXAsIHU4IGZ1bmNfbm8sDQo+ID4gIAl9DQo+
ID4gIH0NCj4gPg0KPiA+IC1zdGF0aWMgY29uc3Qgc3RydWN0IGR3X3BjaWVfZXBfb3BzIHBjaWVf
ZXBfb3BzID0gew0KPiA+ICtzdGF0aWMgdW5zaWduZWQgaW50IGxzX3BjaWVfZXBfZnVuY19jb25m
X3NlbGVjdChzdHJ1Y3QgZHdfcGNpZV9lcCAqZXAsDQo+ID4gKwkJCQkJCXU4IGZ1bmNfbm8pDQo+
ID4gK3sNCj4gPiArCXN0cnVjdCBkd19wY2llICpwY2kgPSB0b19kd19wY2llX2Zyb21fZXAoZXAp
Ow0KPiA+ICsJc3RydWN0IGxzX3BjaWVfZXAgKnBjaWUgPSB0b19sc19wY2llX2VwKHBjaSk7DQo+
ID4gKw0KPiA+ICsJV0FSTl9PTihmdW5jX25vICYmICFwY2llLT5kcnZkYXRhLT5mdW5jX29mZnNl
dCk7DQo+ID4gKwlyZXR1cm4gcGNpZS0+ZHJ2ZGF0YS0+ZnVuY19vZmZzZXQgKiBmdW5jX25vOyB9
DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGR3X3BjaWVfZXBfb3BzIGxzX3BjaWVf
ZXBfb3BzID0gew0KPiA+ICAJLmVwX2luaXQgPSBsc19wY2llX2VwX2luaXQsDQo+ID4gIAkucmFp
c2VfaXJxID0gbHNfcGNpZV9lcF9yYWlzZV9pcnEsDQo+ID4gIAkuZ2V0X2ZlYXR1cmVzID0gbHNf
cGNpZV9lcF9nZXRfZmVhdHVyZXMsDQo+ID4gKwkuZnVuY19jb25mX3NlbGVjdCA9IGxzX3BjaWVf
ZXBfZnVuY19jb25mX3NlbGVjdCwgfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qg
bHNfcGNpZV9lcF9kcnZkYXRhIGxzMV9lcF9kcnZkYXRhID0gew0KPiA+ICsJLm9wcyA9ICZsc19w
Y2llX2VwX29wcywNCj4gPiArCS5kd19wY2llX29wcyA9ICZkd19sc19wY2llX2VwX29wcywNCj4g
PiArfTsNCj4gPiArDQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgbHNfcGNpZV9lcF9kcnZkYXRh
IGxzMl9lcF9kcnZkYXRhID0gew0KPiA+ICsJLmZ1bmNfb2Zmc2V0ID0gMHgyMDAwMCwNCj4gPiAr
CS5vcHMgPSAmbHNfcGNpZV9lcF9vcHMsDQo+ID4gKwkuZHdfcGNpZV9vcHMgPSAmZHdfbHNfcGNp
ZV9lcF9vcHMsDQo+ID4gK307DQo+ID4gKw0KPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBsc19wY2llX2VwX29mX21hdGNoW10gPSB7DQo+ID4gKwl7IC5jb21wYXRpYmxlID0g
ImZzbCxsczEwNDZhLXBjaWUtZXAiLCAuZGF0YSA9ICZsczFfZXBfZHJ2ZGF0YSB9LA0KPiA+ICsJ
eyAuY29tcGF0aWJsZSA9ICJmc2wsbHMxMDg4YS1wY2llLWVwIiwgLmRhdGEgPSAmbHMyX2VwX2Ry
dmRhdGEgfSwNCj4gPiArCXsgLmNvbXBhdGlibGUgPSAiZnNsLGxzMjA4OGEtcGNpZS1lcCIsIC5k
YXRhID0gJmxzMl9lcF9kcnZkYXRhIH0sDQo+ID4gKwl7IH0sDQo+IA0KPiBUaGlzIHJlbW92ZXMg
c3VwcG9ydCBmb3IgImZzbCxscy1wY2llLWVwIiAtIHdhcyB0aGF0IGludGVudGlvbmFsPyBJZiB5
b3UgZG8gcGxhbg0KPiB0byBkcm9wIGl0IHBsZWFzZSBtYWtlIHN1cmUgeW91IGV4cGxhaW4gd2h5
IGluIHRoZSBjb21taXQgbWVzc2FnZS4gU2VlIGFsc28NCj4gbXkgY29tbWVudHMgaW4geW91ciBk
dC1iaW5kaW5nIHBhdGNoLg0KDQpJbiBmYWN0LCB0aGUgdS1ib290IHdpbGwgZml4dXAgdGhlIHN0
YXR1cyBwcm9wZXJ0eSB0byAnc3RhdHVzID0gZW5hYmxlZCcgaW4gUENJIG5vZGUgb2YgDQp0aGUg
RFRTIGJhc2Ugb24gImZzbCxscy1wY2llLWVwIiBjb21wYXRpYmxlLCBzbyAiZnNsLGxzLXBjaWUt
ZXAiIGlzIHVzZWQsIEkgdXNlZCB0aGlzDQpjb21wYXRpYmxlIGJlZm9yZSwgYmVjYXVzZSB0aGUg
ZHJpdmVyIG9ubHkgc3VwcG9ydCB0aGUgTFMxMDQ2YSwgYnV0IHRoaXMgdGltZSwgSSBhZGQNCnRo
ZSBMUzEwODhhIGFuZCBMUzIwODhhIHN1cHBvcnQsIGFuZCB0aGVzZSB0d28gYm9hcmRzIGhhdmUg
c29tZSBkaWZmZXJlbmNlIGZvcm0NCkxTMTA0NmEsIHNvIEkgY2hhbmdlZCB0aGUgY29tcGF0aWJs
ZS4gSSBhbSBub3Qgc3VyZSB3aGV0aGVyIG5lZWQgdG8gYWRkICJmc2wsbHMtcGNpZS1lcCINCmlu
IHRoZXJlLCBjb3VsZCB5b3UgZ2l2ZSBzb21lIGFkdmljZSwgdGhhbmtzIGEgbG90Lg0KDQpUaGFu
a3MgDQpYaWFvd2VpDQogDQo+IA0KPiBUaGFua3MsDQo+IA0KPiBBbmRyZXcgTXVycmF5DQo+IA0K
PiA+ICB9Ow0KPiA+DQo+ID4gIHN0YXRpYyBpbnQgX19pbml0IGxzX2FkZF9wY2llX2VwKHN0cnVj
dCBsc19wY2llX2VwICpwY2llLCBAQCAtMTAzLDcNCj4gPiArMTM0LDcgQEAgc3RhdGljIGludCBf
X2luaXQgbHNfYWRkX3BjaWVfZXAoc3RydWN0IGxzX3BjaWVfZXAgKnBjaWUsDQo+ID4gIAlpbnQg
cmV0Ow0KPiA+DQo+ID4gIAllcCA9ICZwY2ktPmVwOw0KPiA+IC0JZXAtPm9wcyA9ICZwY2llX2Vw
X29wczsNCj4gPiArCWVwLT5vcHMgPSBwY2llLT5kcnZkYXRhLT5vcHM7DQo+ID4NCj4gPiAgCXJl
cyA9IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9SRVNPVVJDRV9NRU0sDQo+
ICJhZGRyX3NwYWNlIik7DQo+ID4gIAlpZiAoIXJlcykNCj4gPiBAQCAtMTQyLDIwICsxNzMsMjMg
QEAgc3RhdGljIGludCBfX2luaXQgbHNfcGNpZV9lcF9wcm9iZShzdHJ1Y3QNCj4gcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KPiA+ICAJaWYgKCFsc19lcGMpDQo+ID4gIAkJcmV0dXJuIC1FTk9NRU07
DQo+ID4NCj4gPiAtCWRiaV9iYXNlID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2
LCBJT1JFU09VUkNFX01FTSwNCj4gInJlZ3MiKTsNCj4gPiAtCXBjaS0+ZGJpX2Jhc2UgPSBkZXZt
X3BjaV9yZW1hcF9jZmdfcmVzb3VyY2UoZGV2LCBkYmlfYmFzZSk7DQo+ID4gLQlpZiAoSVNfRVJS
KHBjaS0+ZGJpX2Jhc2UpKQ0KPiA+IC0JCXJldHVybiBQVFJfRVJSKHBjaS0+ZGJpX2Jhc2UpOw0K
PiA+ICsJcGNpZS0+ZHJ2ZGF0YSA9IG9mX2RldmljZV9nZXRfbWF0Y2hfZGF0YShkZXYpOw0KPiA+
DQo+ID4gLQlwY2ktPmRiaV9iYXNlMiA9IHBjaS0+ZGJpX2Jhc2UgKyBQQ0lFX0RCSTJfT0ZGU0VU
Ow0KPiA+ICAJcGNpLT5kZXYgPSBkZXY7DQo+ID4gLQlwY2ktPm9wcyA9ICZsc19wY2llX2VwX29w
czsNCj4gPiAtCXBjaWUtPnBjaSA9IHBjaTsNCj4gPiArCXBjaS0+b3BzID0gcGNpZS0+ZHJ2ZGF0
YS0+ZHdfcGNpZV9vcHM7DQo+ID4NCj4gPiAgCWxzX2VwYy0+YmFyX2ZpeGVkXzY0Yml0ID0gKDEg
PDwgQkFSXzIpIHwgKDEgPDwgQkFSXzQpLA0KPiA+DQo+ID4gKwlwY2llLT5wY2kgPSBwY2k7DQo+
ID4gIAlwY2llLT5sc19lcGMgPSBsc19lcGM7DQo+ID4NCj4gPiArCWRiaV9iYXNlID0gcGxhdGZv
cm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JFU09VUkNFX01FTSwNCj4gInJlZ3MiKTsN
Cj4gPiArCXBjaS0+ZGJpX2Jhc2UgPSBkZXZtX3BjaV9yZW1hcF9jZmdfcmVzb3VyY2UoZGV2LCBk
YmlfYmFzZSk7DQo+ID4gKwlpZiAoSVNfRVJSKHBjaS0+ZGJpX2Jhc2UpKQ0KPiA+ICsJCXJldHVy
biBQVFJfRVJSKHBjaS0+ZGJpX2Jhc2UpOw0KPiA+ICsNCj4gPiArCXBjaS0+ZGJpX2Jhc2UyID0g
cGNpLT5kYmlfYmFzZSArIFBDSUVfREJJMl9PRkZTRVQ7DQo+ID4gKw0KPiA+ICAJcGxhdGZvcm1f
c2V0X2RydmRhdGEocGRldiwgcGNpZSk7DQo+ID4NCj4gPiAgCXJldCA9IGxzX2FkZF9wY2llX2Vw
KHBjaWUsIHBkZXYpOw0KPiA+IC0tDQo+ID4gMi45LjUNCj4gPg0K
