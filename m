Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FB690074
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 13:04:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4690nv67jKzDrQs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 21:04:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.43; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="Hi4odvRr"; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70043.outbound.protection.outlook.com [40.107.7.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4690kR5Jp8zDrS3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 21:01:35 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LUZRWdzpBFRCdWHRv0v/6th7q5R0Dl3ZotCS2BHcR8Tk7bmnJIZRlSqR5aLgEt0nEUkyRvxBS8OaxGu8O4SASifOpJk03STF0tB3a1gb6HTWj8qn5Ko0jWR/kUPGXEPr/R0IyLfCUqwUphykXSMDSJGqHL+4BwCgv0zrjS0GlFYJAbSUGtY3EI8hLijjnh3YvhiPgMiCVwMAPW34mMBxautbFaoy5xa4AoQifetlhwOwctwBLlqyJbQKB4SCIQMZuZCxvEqE76wDfa/QgwDxf2DM6oBhia0iXIIiks66dVx7ay9T+602I6Lfa2rmStbLaL44I8+LjIpAYX/prIFOOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfk++PVfuaIdTfs6P3cdENhtU31AbNmmzlT7AwncHSw=;
 b=ZiSKz5i/OY85idW8q9CL37pIc/A01Qv5uydiCFjgJLwYisUfnmAxJfo+tKjk0MmgciOGkRCV7OWFTbN+O0KrlwEjwTfKuC/t6IbvhmO9m54DW1eeJbvbJOn+30mt1LFqcbgn8EEtIvZ2AbCDsvb0xMpnBWkovFuyyKRVWp9IxzTWOxYZtcBVtjh0cZOPUGI5mRPKgB7qL4BEtbKaus43D8Cjq7qFFOChNG1uBiTmXOfvDEjoqeV3kQyGI1hIvfpQxFgieKlMIah5sHcTSlGsNw/WQzvHXqhHyXmiNsFuLxG8Iiwna0ZpH+DOA/WXGNHjQKHEbv2NsyaMVbpnRpYl7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bfk++PVfuaIdTfs6P3cdENhtU31AbNmmzlT7AwncHSw=;
 b=Hi4odvRriGLwZ0F+rUn8R2hF6aN+9V7o4jBIdLCYo+GrrL216UH5XgnzdwO66nHHH04ocPiKRSB85yO2ax+H4W1CiepkXGwkE+56R11ucBPQ2SN2mZ0EuSVXaJsxHU6rLFNXdrpk6GuVsHodtUUdtvZYaVPf4x6ToAiZv8iC7MM=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB2964.eurprd04.prod.outlook.com (10.167.169.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Fri, 16 Aug 2019 11:01:28 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84%5]) with mapi id 15.20.2157.022; Fri, 16 Aug 2019
 11:01:28 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>
Subject: RE: [PATCH 02/10] PCI: designware-ep: Add the doorbell mode of MSI-X
 in EP mode
Thread-Topic: [PATCH 02/10] PCI: designware-ep: Add the doorbell mode of MSI-X
 in EP mode
Thread-Index: AQHVU0YcWJbNSPGnu0G+CTkSpUEVo6b8GZ2AgAD8KOCAAHwegIAACx4g
Date: Fri, 16 Aug 2019 11:01:28 +0000
Message-ID: <AM5PR04MB32998E7DE3CF9A16EC2FF97FF5AF0@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190815083716.4715-1-xiaowei.bao@nxp.com>
 <20190815083716.4715-2-xiaowei.bao@nxp.com>
 <20190815115340.GG43882@e119886-lin.cambridge.arm.com>
 <AM5PR04MB329973845D6396624AFDE547F5AF0@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <20190816102025.GB14111@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190816102025.GB14111@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4841b40-7084-427a-675e-08d7223916b5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB2964; 
x-ms-traffictypediagnostic: AM5PR04MB2964:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB29646BD21FADD28CE895BB30F5AF0@AM5PR04MB2964.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 0131D22242
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(199004)(51914003)(13464003)(189003)(966005)(7416002)(14454004)(52536014)(7736002)(305945005)(5660300002)(6116002)(8676002)(229853002)(186003)(26005)(3846002)(74316002)(25786009)(71200400001)(6916009)(71190400001)(6306002)(66066001)(99286004)(316002)(9686003)(6246003)(54906003)(64756008)(6436002)(76176011)(53936002)(102836004)(6506007)(86362001)(53546011)(81166006)(44832011)(8936002)(2906002)(4326008)(55016002)(66476007)(486006)(476003)(478600001)(446003)(11346002)(66946007)(33656002)(256004)(66556008)(66446008)(7696005)(76116006)(81156014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB2964;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DNV/TG8AETVDcwRXRtBLJUTj0Z4YuiqCd3me0VEs2SnDJRy4ntQIpvGKwta/HGMETAx1xPexTjvGhtZVqDdXofA25iHxVy+Z08IQuzxqVYPcEAcdZ4sHk+N+ngn6SZzvUAllKhlqRpb5SQ9l3emhnl1Q6cj5JTqVr3/Ndlxaq+VuLw5J9bd/NgkFG5RM/Dbin09MX4MfRPKNiKJDKbBqrpeqlG3+WEyLSet2VJT7ekvjZSi/latHk3lV1SBae3Jm82lhfS3Qltc8AWl6+x2+Wg3HUFMcztuz+1Y8X7/JCblVs6DPoWA5MjntsZWbkj1cWno1FuKmq9RHPY/53JZguSJgfYLc2euyGD1f/o1tTWGolbmqX6e2ycSLrCv0fpfDklbDnzVAr417QL/vcmqQpyiPuHa9DYbIGS88yVhouTw=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4841b40-7084-427a-675e-08d7223916b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2019 11:01:28.3853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o+D8fny8KZyYtvCcqumC/djA0h+pBcpa2Bjk8JzIkjPHYi/zTu/6e03OE5MYKWIHWlYRW06jKbsklH+BIdTEZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB2964
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "Z.q. Hou" <zhiqiang.hou@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "gustavo.pimentel@synopsys.com" <gustavo.pimentel@synopsys.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, "kishon@ti.com" <kishon@ti.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kcmV3IE11cnJheSA8
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE55bm0OOaciDE25pelIDE4OjIwDQo+
IFRvOiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gQ2M6IGppbmdvb2hhbjFA
Z21haWwuY29tOyBndXN0YXZvLnBpbWVudGVsQHN5bm9wc3lzLmNvbTsNCj4gYmhlbGdhYXNAZ29v
Z2xlLmNvbTsgcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsNCj4gc2hh
d25ndW9Aa2VybmVsLm9yZzsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBraXNob25AdGku
Y29tOw0KPiBsb3JlbnpvLnBpZXJhbGlzaUBhcm0uY29tOyBhcm5kQGFybmRiLmRlOyBncmVna2hA
bGludXhmb3VuZGF0aW9uLm9yZzsNCj4gTS5oLiBMaWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+
OyBNaW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5jb20+Ow0KPiBsaW51eC1wY2lAdmdlci5rZXJu
ZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51
eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsgWi5xLiBIb3UgPHpoaXFpYW5nLmhvdUBueHAuY29t
Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDAyLzEwXSBQQ0k6IGRlc2lnbndhcmUtZXA6IEFkZCB0
aGUgZG9vcmJlbGwgbW9kZSBvZg0KPiBNU0ktWCBpbiBFUCBtb2RlDQo+IA0KPiBPbiBGcmksIEF1
ZyAxNiwgMjAxOSBhdCAwMjo1ODozMUFNICswMDAwLCBYaWFvd2VpIEJhbyB3cm90ZToNCj4gPg0K
PiA+DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogQW5kcmV3
IE11cnJheSA8YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiA+ID4gU2VudDogMjAxOeW5tDjmnIgx
NeaXpSAxOTo1NA0KPiA+ID4gVG86IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0K
PiA+ID4gQ2M6IGppbmdvb2hhbjFAZ21haWwuY29tOyBndXN0YXZvLnBpbWVudGVsQHN5bm9wc3lz
LmNvbTsNCj4gPiA+IGJoZWxnYWFzQGdvb2dsZS5jb207IHJvYmgrZHRAa2VybmVsLm9yZzsgbWFy
ay5ydXRsYW5kQGFybS5jb207DQo+ID4gPiBzaGF3bmd1b0BrZXJuZWwub3JnOyBMZW8gTGkgPGxl
b3lhbmcubGlAbnhwLmNvbT47IGtpc2hvbkB0aS5jb207DQo+ID4gPiBsb3JlbnpvLnBpZXJhbGlz
aUBhcm0uY29tOyBhcm5kQGFybmRiLmRlOw0KPiA+ID4gZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc7IE0uaC4gTGlhbiA8bWluZ2h1YW4ubGlhbkBueHAuY29tPjsNCj4gPiA+IE1pbmdrYWkgSHUg
PG1pbmdrYWkuaHVAbnhwLmNvbT47IFJveSBaYW5nIDxyb3kuemFuZ0BueHAuY29tPjsNCj4gPiA+
IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwub3JnOw0K
PiA+ID4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0
cy5pbmZyYWRlYWQub3JnOw0KPiA+ID4gbGludXhwcGMtZGV2QGxpc3RzLm96bGFicy5vcmcNCj4g
PiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDIvMTBdIFBDSTogZGVzaWdud2FyZS1lcDogQWRkIHRo
ZSBkb29yYmVsbCBtb2RlDQo+ID4gPiBvZiBNU0ktWCBpbiBFUCBtb2RlDQo+ID4gPg0KPiA+ID4g
T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMDQ6Mzc6MDhQTSArMDgwMCwgWGlhb3dlaSBCYW8gd3Jv
dGU6DQo+ID4gPiA+IEFkZCB0aGUgZG9vcmJlbGwgbW9kZSBvZiBNU0ktWCBpbiBFUCBtb2RlLg0K
PiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9A
bnhwLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9wY2llLWRlc2lnbndhcmUtZXAuYyB8IDE0DQo+ICsrKysrKysrKysrKysrDQo+ID4gPiA+ICBk
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUuaCAgICB8IDE0DQo+ICsr
KysrKysrKysrKysrDQo+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykN
Cj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdj
L3BjaWUtZGVzaWdud2FyZS1lcC5jDQo+ID4gPiA+IGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9k
d2MvcGNpZS1kZXNpZ253YXJlLWVwLmMNCj4gPiA+ID4gaW5kZXggNzVlMjk1NS4uZTNhN2NkZiAx
MDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNp
Z253YXJlLWVwLmMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS1kZXNpZ253YXJlLWVwLmMNCj4gPiA+ID4gQEAgLTQ1NCw2ICs0NTQsMjAgQEAgaW50IGR3X3Bj
aWVfZXBfcmFpc2VfbXNpX2lycShzdHJ1Y3QNCj4gPiA+ID4gZHdfcGNpZV9lcA0KPiA+ID4gKmVw
LCB1OCBmdW5jX25vLA0KPiA+ID4gPiAgCXJldHVybiAwOw0KPiA+ID4gPiAgfQ0KPiA+ID4gPg0K
PiA+ID4gPiAraW50IGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnFfZG9vcmJlbGwoc3RydWN0IGR3
X3BjaWVfZXAgKmVwLCB1OA0KPiA+ID4gZnVuY19ubywNCj4gPiA+ID4gKwkJCQkgICAgICAgdTE2
IGludGVycnVwdF9udW0pDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsJc3RydWN0IGR3X3BjaWUgKnBj
aSA9IHRvX2R3X3BjaWVfZnJvbV9lcChlcCk7DQo+ID4gPiA+ICsJdTMyIG1zZ19kYXRhOw0KPiA+
ID4gPiArDQo+ID4gPiA+ICsJbXNnX2RhdGEgPSAoZnVuY19ubyA8PCBQQ0lFX01TSVhfRE9PUkJF
TExfUEZfU0hJRlQpIHwNCj4gPiA+ID4gKwkJICAgKGludGVycnVwdF9udW0gLSAxKTsNCj4gPiA+
ID4gKw0KPiA+ID4gPiArCWR3X3BjaWVfd3JpdGVsX2RiaShwY2ksIFBDSUVfTVNJWF9ET09SQkVM
TCwgbXNnX2RhdGEpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJcmV0dXJuIDA7DQo+ID4gPiA+ICt9
DQo+ID4gPiA+ICsNCj4gPiA+ID4gIGludCBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJxKHN0cnVj
dCBkd19wY2llX2VwICplcCwgdTggZnVuY19ubywNCj4gPiA+ID4gIAkJCSAgICAgIHUxNiBpbnRl
cnJ1cHRfbnVtKQ0KPiA+ID4NCj4gPiA+IEhhdmUgSSB1bmRlcnN0b29kIGNvcnJlY3RseSB0aGF0
IHRoZSBoYXJkd2FyZSBwcm92aWRlcyBhbg0KPiA+ID4gYWx0ZXJuYXRpdmUgbWVjaGFuaXNtIHRo
YXQgYWxsb3dzIGZvciByYWlzaW5nIE1TSS1YIGludGVycnVwdHMNCj4gPiA+IHdpdGhvdXQgdGhl
IGJvdGhlciBvZiByZWFkaW5nIHRoZSBjYXBhYmlsaXRpZXMgcmVnaXN0ZXJzPw0KPiA+IFllcywg
dGhlIGhhcmR3YXJlIHByb3ZpZGUgdHdvIHdheSB0byBNU0ktWCwgcGxlYXNlIGNoZWNrIHRoZSBw
YWdlIDQ5Mg0KPiA+IG9mDQo+ID4gRFdDX3BjaWVfZG1fcmVnaXN0ZXJzXzQuMzAgTWVudS4NCj4g
PiBNU0lYX0RPT1JCRUxMX09GRiBvbiBwYWdlIDQ5MiAweDk0OCBEZXNjcmlwdGlvbjogTVNJLVgg
RG9vcmJlbGwNCj4gPiBSZWdpc3Rlci4uLi4+DQo+IA0KPiBUaGFua3MgZm9yIHRoZSByZWZlcmVu
Y2UuDQo+IA0KPiA+ID4NCj4gPiA+IElmIHNvIGlzIHRoZXJlIGFueSBnb29kIHJlYXNvbiB0byBr
ZWVwIGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnE/DQo+ID4gPiAoQW5kIHRodXMgdXNlIGl0IGlu
IGR3X3BsYXRfcGNpZV9lcF9yYWlzZV9pcnEgYWxzbyk/DQo+ID4gSSBhbSBub3Qgc3VyZSwgYnV0
IEkgdGhpbmsgdGhlIGR3X3BjaWVfZXBfcmFpc2VfbXNpeF9pcnEgZnVuY3Rpb24gaXMNCj4gPiBu
b3QgY29ycmVjdCwgYmVjYXVzZSBJIHRoaW5rIHdlIGNhbid0IGdldCB0aGUgTVNJWCB0YWJsZSBm
cm9tIHRoZQ0KPiA+IGFkZHJlc3MgZXAtPnBoeXNfYmFzZSArIHRibF9hZGRyLCBidXQgSSBhbHNv
IGRvbid0IGtub3cgd2hlcmUgSSBjYW4gZ2V0IHRoZQ0KPiBjb3JyZWN0IE1TSVggdGFibGUuDQo+
IA0KPiBXZWxsIGl0IGxvb2tzIGxpa2UgdGhpcyBmdW5jdGlvbiBpcyB1c2VkIGJ5IHNucHMsZHct
cGNpZS1lcCBhbmQgc25wcyxkdy1wY2llLA0KPiBwZXJoYXBzIHRoZSBkb29yYmVsbCBtb2RlIGlz
bid0IGF2YWlsYWJsZSBvbiB0aGF0IGhhcmR3YXJlLg0KPiANCj4gPiA+DQo+ID4gPg0KPiA+ID4g
PiAgew0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNp
ZS1kZXNpZ253YXJlLmgNCj4gPiA+ID4gYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ll
LWRlc2lnbndhcmUuaA0KPiA+ID4gPiBpbmRleCAyYjI5MWU4Li5jZDkwM2U5IDEwMDY0NA0KPiA+
ID4gPiAtLS0gYS9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUuaA0K
PiA+ID4gPiArKysgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndhcmUu
aA0KPiA+ID4gPiBAQCAtODgsNiArODgsMTEgQEANCj4gPiA+ID4gICNkZWZpbmUgUENJRV9NSVND
X0NPTlRST0xfMV9PRkYJCTB4OEJDDQo+ID4gPiA+ICAjZGVmaW5lIFBDSUVfREJJX1JPX1dSX0VO
CQlCSVQoMCkNCj4gPiA+ID4NCj4gPiA+ID4gKyNkZWZpbmUgUENJRV9NU0lYX0RPT1JCRUxMCQkw
eDk0OA0KPiA+ID4gPiArI2RlZmluZSBQQ0lFX01TSVhfRE9PUkJFTExfUEZfU0hJRlQJMjQNCj4g
PiA+ID4gKyNkZWZpbmUgUENJRV9NU0lYX0RPT1JCRUxMX1ZGX1NISUZUCTE2DQo+ID4gPiA+ICsj
ZGVmaW5lIFBDSUVfTVNJWF9ET09SQkVMTF9WRl9BQ1RJVkUJQklUKDE1KQ0KPiA+ID4NCj4gPiA+
IFRoZSBfVkYgZGVmaW5lcyBhcmUgbm90IHVzZWQsIEknZCBzdWdnZXN0IHJlbW92aW5nIHRoZW0u
DQo+ID4gSW4gZmFjdCwgSSB3aWxsIGFkZCB0aGUgU1JJT1Ygc3VwcG9ydCBpbiB0aGlzIGZpbGUs
IHRoZSBTUklPViBmZWF0dXJlDQo+ID4gaGF2ZSB2ZXJpZmllZCBJbiBteSBib2FyZCwgYnV0IEkg
bmVlZCB3YWl0IHRoZSBFUCBmcmFtZXdvcmsgU1JJT1YNCj4gPiBwYXRjaCBtZXJnZSwgc28gSSBk
ZWZpbmVkIHRoZXNlIHR3byBtYWNyb3MuDQo+IA0KPiBJJ2Qgc3VnZ2VzdCBhZGRpbmcgdGhlIFZG
IG1hY3JvcyBhbG9uZyB3aXRoIHRoZSBTUklPViBmZWF0dXJlLg0KT0ssIEkgd2lsbCByZW1vdmUg
dGhlc2UgdHdvIG1hY3Jvcy4gVGhhbmtzLg0KPiANCj4gVGhhbmtzLA0KPiANCj4gQW5kcmV3IE11
cnJheQ0KPiANCj4gPiA+DQo+ID4gPiBUaGFua3MsDQo+ID4gPg0KPiA+ID4gQW5kcmV3IE11cnJh
eQ0KPiA+ID4NCj4gPiA+ID4gKw0KPiA+ID4gPiAgLyoNCj4gPiA+ID4gICAqIGlBVFUgVW5yb2xs
LXNwZWNpZmljIHJlZ2lzdGVyIGRlZmluaXRpb25zDQo+ID4gPiA+ICAgKiBGcm9tIDQuODAgY29y
ZSB2ZXJzaW9uIHRoZSBhZGRyZXNzIHRyYW5zbGF0aW9uIHdpbGwgYmUgbWFkZSBieQ0KPiA+ID4g
PiB1bnJvbGwgQEAgLTM5OSw2ICs0MDQsOCBAQCBpbnQgZHdfcGNpZV9lcF9yYWlzZV9tc2lfaXJx
KHN0cnVjdA0KPiA+ID4gZHdfcGNpZV9lcCAqZXAsIHU4IGZ1bmNfbm8sDQo+ID4gPiA+ICAJCQkg
ICAgIHU4IGludGVycnVwdF9udW0pOw0KPiA+ID4gPiAgaW50IGR3X3BjaWVfZXBfcmFpc2VfbXNp
eF9pcnEoc3RydWN0IGR3X3BjaWVfZXAgKmVwLCB1OCBmdW5jX25vLA0KPiA+ID4gPiAgCQkJICAg
ICB1MTYgaW50ZXJydXB0X251bSk7DQo+ID4gPiA+ICtpbnQgZHdfcGNpZV9lcF9yYWlzZV9tc2l4
X2lycV9kb29yYmVsbChzdHJ1Y3QgZHdfcGNpZV9lcCAqZXAsIHU4DQo+ID4gPiBmdW5jX25vLA0K
PiA+ID4gPiArCQkJCSAgICAgICB1MTYgaW50ZXJydXB0X251bSk7DQo+ID4gPiA+ICB2b2lkIGR3
X3BjaWVfZXBfcmVzZXRfYmFyKHN0cnVjdCBkd19wY2llICpwY2ksIGVudW0gcGNpX2Jhcm5vDQo+
ID4gPiA+IGJhcik7ICNlbHNlICBzdGF0aWMgaW5saW5lIHZvaWQgZHdfcGNpZV9lcF9saW5rdXAo
c3RydWN0DQo+ID4gPiA+IGR3X3BjaWVfZXAgKmVwKSBAQA0KPiA+ID4gPiAtNDMxLDYgKzQzOCwx
MyBAQCBzdGF0aWMgaW5saW5lIGludA0KPiA+ID4gPiBkd19wY2llX2VwX3JhaXNlX21zaXhfaXJx
KHN0cnVjdA0KPiA+ID4gZHdfcGNpZV9lcCAqZXAsIHU4IGZ1bmNfbm8sDQo+ID4gPiA+ICAJcmV0
dXJuIDA7DQo+ID4gPiA+ICB9DQo+ID4gPiA+DQo+ID4gPiA+ICtzdGF0aWMgaW5saW5lIGludCBk
d19wY2llX2VwX3JhaXNlX21zaXhfaXJxX2Rvb3JiZWxsKHN0cnVjdA0KPiA+ID4gPiArZHdfcGNp
ZV9lcA0KPiA+ID4gKmVwLA0KPiA+ID4gPiArCQkJCQkJICAgICB1OCBmdW5jX25vLA0KPiA+ID4g
PiArCQkJCQkJICAgICB1MTYgaW50ZXJydXB0X251bSkNCj4gPiA+ID4gK3sNCj4gPiA+ID4gKwly
ZXR1cm4gMDsNCj4gPiA+ID4gK30NCj4gPiA+ID4gKw0KPiA+ID4gPiAgc3RhdGljIGlubGluZSB2
b2lkIGR3X3BjaWVfZXBfcmVzZXRfYmFyKHN0cnVjdCBkd19wY2llICpwY2ksIGVudW0NCj4gPiA+
ID4gcGNpX2Jhcm5vIGJhcikgIHsgIH0NCj4gPiA+ID4gLS0NCj4gPiA+ID4gMi45LjUNCj4gPiA+
ID4NCj4gPiA+ID4NCj4gPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18NCj4gPiA+ID4gbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QNCj4gPiA+
ID4gbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnDQo+ID4gPiA+IGh0dHA6Ly9s
aXN0cw0KPiA+ID4gPiAuaW5mcmFkZWFkLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmxpbnV4
LWFybS1rZXJuZWwmYW1wO2RhdGE9MA0KPiAyDQo+ID4gPiA+ICUNCj4gPiA+IDdDMA0KPiA+ID4g
Pg0KPiA+ID4NCj4gMSU3Q3hpYW93ZWkuYmFvJTQwbnhwLmNvbSU3Qzg0ODk0OTMwMDNiYjQ4YTAx
MzlkMDhkNzIxNzczOTcyJQ0KPiA+ID4gN0M2ODZlYTFkDQo+ID4gPiA+DQo+ID4gPg0KPiAzYmMy
YjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzcwMTQ2NjgzNjk0OTkyOTgmYW1wO3Nk
DQo+ID4gPiBhdGE9ZHlyWEINCj4gPiA+ID4NCj4gPiA+DQo+IGF2bGpKQkZVU05YVzdLJTJGUm9Y
dndmV1RFJTJGb1UyS01kMWJaa0pvdyUzRCZhbXA7cmVzZXJ2ZWQ9MA0K
