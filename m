Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6E689B4B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 12:21:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466X1t2b3wzDqQS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 20:21:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.1.55; helo=eur02-he1-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="joT0mRTN"; 
 dkim-atps=neutral
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10055.outbound.protection.outlook.com [40.107.1.55])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466WzL4dCVzDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 20:19:06 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SWesNjiP3PBBABTjceFRC1oG86w8/7D/R+NNDZLTB6TXFW3nJDZTDoOkwkD/bPx8bVR725l9n+s49Q1gVpOusP/yuMERxVqcwLwSHilnO1p6iXK03xVoQod9h6BIZuehhDb9ThgT04YJEbtWQmBjrJLCIPxVOAGWmyd6rmQtHPHrh0ZCOBx2Ax1po199nQwMG2lFX5UICvPUkuRAtJHsPXm+NlKfsfgfQ9nJVi2Hk2UHZOI1uOqxkA3CLwD6M4MNE4PzGZ7zNweTC/qQitSXOjkqgAK6YVZDQd3eLUB6Cmclz73qxPvNgmCpGKwhEGhiRmGA1lxBL9HTNuqbFM7xKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vyhvPWbFVpYfvLpSfhG4SxjDcRjUrXrbQwZbQZ/pFA=;
 b=buiVP9Lw9kWvvvJ70BtVcGfjgysy6uulS+XEjVzQAQG85VeayK9Rqc76h4R4LUH8h+7QPEpKG71JqKCSgErgOMliFS75gNXdWR2UAuDukEQQqg6Ar0jQRB8E44KSP4tWx5fNl4CuHkXCKSPV+agt3u5XZ76Wo9YRnL5uxbZt/cYUCNmf3shc2QzP9cbUTTnXtJCcqx4xrVQeXTN6q406KmRmIxhouZuwhi8uM7B47Jn/ILnkQU04f3ateBHvCT9DGJGvuWlkjW/IXmKtEMDwLMU5HnHOIONlwNtSkbfipRCznEkwpJBzTttKtw62aZqL+gc4CXQa3gDfL3VpPgHWAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vyhvPWbFVpYfvLpSfhG4SxjDcRjUrXrbQwZbQZ/pFA=;
 b=joT0mRTNyhFtyQV6QomZFhweZJ1iOsoMmYteZvGKYc1lgBuPqMcHOoj05qy+2ObcR7Tr8eEQ6lOjtxXzgY6z+7kCZB0aUj0cBwiI51Dh8mFYudc93aRsKqDEJ6c3vzOvnErUrZAuI+DkY1Wqq+Oy5Cig78v2DpdadtwDE3qtHAQ=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3092.eurprd04.prod.outlook.com (10.167.171.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.20; Mon, 12 Aug 2019 10:18:59 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5012:d47a:1f5d:9b84%5]) with mapi id 15.20.2157.022; Mon, 12 Aug 2019
 10:18:59 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: RE: [EXT] Re: [PATCHv3 2/2] PCI: layerscape: Add
 CONFIG_PCI_LAYERSCAPE_EP to build EP/RC separately
Thread-Topic: [EXT] Re: [PATCHv3 2/2] PCI: layerscape: Add
 CONFIG_PCI_LAYERSCAPE_EP to build EP/RC separately
Thread-Index: AQHVLVN+UwiZIf9uLEeNJKWnCEomWKb3kG4AgAAApuA=
Date: Mon, 12 Aug 2019 10:18:59 +0000
Message-ID: <AM5PR04MB3299F2291ECDB3350C4CDCE8F5D30@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190628013826.4705-1-xiaowei.bao@nxp.com>
 <20190628013826.4705-2-xiaowei.bao@nxp.com>
 <20190812100600.GA20861@e121166-lin.cambridge.arm.com>
In-Reply-To: <20190812100600.GA20861@e121166-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 40730546-1684-4332-c193-08d71f0e7d95
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3092; 
x-ms-traffictypediagnostic: AM5PR04MB3092:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB3092D4A995451024E65B575BF5D30@AM5PR04MB3092.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:327;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(13464003)(199004)(189003)(476003)(186003)(446003)(4326008)(7696005)(76176011)(66476007)(66556008)(66946007)(53936002)(11346002)(5660300002)(66066001)(316002)(26005)(102836004)(52536014)(14454004)(71200400001)(71190400001)(54906003)(25786009)(44832011)(486006)(478600001)(53546011)(6506007)(6246003)(64756008)(66446008)(76116006)(99286004)(2906002)(6436002)(9686003)(55016002)(256004)(6916009)(6116002)(86362001)(3846002)(33656002)(81156014)(8936002)(229853002)(7736002)(305945005)(8676002)(7416002)(74316002)(81166006);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3092;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uSQLY2f8AlPtoHJxV0ZgLmJfUyWm+BoaFCjgqSXTBqDiiPldjRo3XzFINYK7aXfX5Tc7qf6yuqKX2nj+CpUhSIZ8FfLBWjzljtv27rEogGEMQ19FPPq+7hMKxTqARIV0BV5eWD3rNgz8EjxnmclYnc8rdMF6TMvlMxaFMkk8EplDaotYl7r8CrDL3EroQHScf87fT5XfLVJIZ+eTZhpn89/NC2/xJOSLhYrWlNFZaIUl3tmeWzKGagjrPjllMspLX+OCNOwIanXQV7e3dgGqakz6fdVmqdU7oz3QMkLtM0YzR2FpjNLH/cAdB8UVsEtNGqC/h7yzsyEZAtDr3SJO413xE2UKFAFQ0vTW7OnKGUSyRfcZDRH4Hy6Yg7w06jNVQCWTpNWkFXLvTWyLOgimdh5q9walEJ5rMsP2hWscN/Y=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40730546-1684-4332-c193-08d71f0e7d95
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 10:18:59.0955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: glChzz0J0TSatUQgFl4pn/fXHJHQ0bq2ETq/itgOo4BfixTIULQilGsiYtXZol1OWBnE0YhZ6So+HDQQJ4Zdgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3092
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
 "arnd@arndb.de" <arnd@arndb.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kishon@ti.com" <kishon@ti.com>, "M.h. Lian" <minghuan.lian@nxp.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "pombredanne@nexb.com" <pombredanne@nexb.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>, Leo Li <leoyang.li@nxp.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "shawn.lin@rock-chips.com" <shawn.lin@rock-chips.com>,
 Mingkai Hu <mingkai.hu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTG9yZW56byBQaWVyYWxp
c2kgPGxvcmVuem8ucGllcmFsaXNpQGFybS5jb20+DQo+IFNlbnQ6IDIwMTnE6jjUwjEyyNUgMTg6
MDYNCj4gVG86IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiBDYzogYmhlbGdh
YXNAZ29vZ2xlLmNvbTsgcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsN
Cj4gc2hhd25ndW9Aa2VybmVsLm9yZzsgTGVvIExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBraXNo
b25AdGkuY29tOw0KPiBhcm5kQGFybmRiLmRlOyBncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZzsg
TS5oLiBMaWFuDQo+IDxtaW5naHVhbi5saWFuQG54cC5jb20+OyBNaW5na2FpIEh1IDxtaW5na2Fp
Lmh1QG54cC5jb20+OyBSb3kgWmFuZw0KPiA8cm95LnphbmdAbnhwLmNvbT47IGtzdGV3YXJ0QGxp
bnV4Zm91bmRhdGlvbi5vcmc7DQo+IHBvbWJyZWRhbm5lQG5leGIuY29tOyBzaGF3bi5saW5Acm9j
ay1jaGlwcy5jb207DQo+IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdl
ci5rZXJuZWwub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMu
b3JnDQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0h2MyAyLzJdIFBDSTogbGF5ZXJzY2FwZTog
QWRkDQo+IENPTkZJR19QQ0lfTEFZRVJTQ0FQRV9FUCB0byBidWlsZCBFUC9SQyBzZXBhcmF0ZWx5
DQo+IA0KPiBDYXV0aW9uOiBFWFQgRW1haWwNCj4gDQo+IE9uIEZyaSwgSnVuIDI4LCAyMDE5IGF0
IDA5OjM4OjI2QU0gKzA4MDAsIFhpYW93ZWkgQmFvIHdyb3RlOg0KPiA+IEFkZCBDT05GSUdfUENJ
X0xBWUVSU0NBUEVfRVAgdG8gYnVpbGQgRVAvUkMgc2VwYXJhdGVseS4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0BueHAuY29tPg0KPiA+IC0tLQ0KPiA+
IHYyOg0KPiA+ICAtIE5vIGNoYW5nZS4NCj4gPiB2MzoNCj4gPiAgLSBtb2RpZnkgdGhlIGNvbW1p
dCBtZXNzYWdlLg0KPiA+DQo+ID4gIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL0tjb25maWcg
IHwgICAyMCArKysrKysrKysrKysrKysrKystLQ0KPiA+ICBkcml2ZXJzL3BjaS9jb250cm9sbGVy
L2R3Yy9NYWtlZmlsZSB8ICAgIDMgKystDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9LY29uZmlnDQo+ID4gYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3
Yy9LY29uZmlnDQo+ID4gaW5kZXggYTZjZTFlZS4uYTQxY2NmNSAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9LY29uZmlnDQo+ID4gKysrIGIvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvS2NvbmZpZw0KPiA+IEBAIC0xMzEsMTMgKzEzMSwyOSBAQCBjb25maWcg
UENJX0tFWVNUT05FX0VQDQo+ID4gICAgICAgICBEZXNpZ25XYXJlIGNvcmUgZnVuY3Rpb25zIHRv
IGltcGxlbWVudCB0aGUgZHJpdmVyLg0KPiA+DQo+ID4gIGNvbmZpZyBQQ0lfTEFZRVJTQ0FQRQ0K
PiA+IC0gICAgIGJvb2wgIkZyZWVzY2FsZSBMYXllcnNjYXBlIFBDSWUgY29udHJvbGxlciINCj4g
PiArICAgICBib29sICJGcmVlc2NhbGUgTGF5ZXJzY2FwZSBQQ0llIGNvbnRyb2xsZXIgLSBIb3N0
IG1vZGUiDQo+ID4gICAgICAgZGVwZW5kcyBvbiBPRiAmJiAoQVJNIHx8IEFSQ0hfTEFZRVJTQ0FQ
RSB8fCBDT01QSUxFX1RFU1QpDQo+ID4gICAgICAgZGVwZW5kcyBvbiBQQ0lfTVNJX0lSUV9ET01B
SU4NCj4gPiAgICAgICBzZWxlY3QgTUZEX1NZU0NPTg0KPiA+ICAgICAgIHNlbGVjdCBQQ0lFX0RX
X0hPU1QNCj4gPiAgICAgICBoZWxwDQo+ID4gLSAgICAgICBTYXkgWSBoZXJlIGlmIHlvdSB3YW50
IFBDSWUgY29udHJvbGxlciBzdXBwb3J0IG9uIExheWVyc2NhcGUgU29Dcy4NCj4gPiArICAgICAg
IFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdG8gZW5hYmxlIFBDSWUgY29udHJvbGxlciBzdXBwb3J0
IG9uDQo+IExheWVyc2NhcGUNCj4gPiArICAgICAgIFNvQ3MgdG8gd29yayBpbiBIb3N0IG1vZGUu
DQo+ID4gKyAgICAgICBUaGlzIGNvbnRyb2xsZXIgY2FuIHdvcmsgZWl0aGVyIGFzIEVQIG9yIFJD
LiBUaGUNCj4gPiArIFJDV1tIT1NUX0FHVF9QRVhdDQo+IA0KPiBXaGF0J3MgIlRoZSBSQ1ciID8g
VGhpcyBlbnRyeSBzaG91bGQgZXhwbGFpbiB3aHkgYSBrZXJuZWwgY29uZmlndXJhdGlvbg0KPiBz
aG91bGQgZW5hYmxlIGl0Lg0KW1hpYW93ZWkgQmFvXSBIaSBMb3JlbnpvLCB0aGUgUkNXIGZ1bGwg
bmFtZSBpcyAicmVzZXQgY29uZmlndXJhdGlvbiB3b3JkIiwgaXQgY2FuIGJlIGJ1aWx0IHRvIGEg
YmluIGZpbGUgYW5kIHByb2dyYW0gdG8gdGhlIGZsYXNoLCByYXRoZXIgdGhhbiBjb25maWd1cmUg
Ynkga2VybmVsLCBhbG1vc3QgdGhlIE5YUCBMYXllcnNjYXBsZSBwbGF0Zm9ybSB1c2UgdGhpcyB3
YXkuDQo+IA0KPiBMb3JlbnpvDQo+IA0KPiA+ICsgICAgICAgZGV0ZXJtaW5lcyB3aGljaCBQQ0ll
IGNvbnRyb2xsZXIgd29ya3MgaW4gRVAgbW9kZSBhbmQgd2hpY2gNCj4gUENJZQ0KPiA+ICsgICAg
ICAgY29udHJvbGxlciB3b3JrcyBpbiBSQyBtb2RlLg0KPiA+ICsNCj4gPiArY29uZmlnIFBDSV9M
QVlFUlNDQVBFX0VQDQo+ID4gKyAgICAgYm9vbCAiRnJlZXNjYWxlIExheWVyc2NhcGUgUENJZSBj
b250cm9sbGVyIC0gRW5kcG9pbnQgbW9kZSINCj4gPiArICAgICBkZXBlbmRzIG9uIE9GICYmIChB
Uk0gfHwgQVJDSF9MQVlFUlNDQVBFIHx8IENPTVBJTEVfVEVTVCkNCj4gPiArICAgICBkZXBlbmRz
IG9uIFBDSV9FTkRQT0lOVA0KPiA+ICsgICAgIHNlbGVjdCBQQ0lFX0RXX0VQDQo+ID4gKyAgICAg
aGVscA0KPiA+ICsgICAgICAgU2F5IFkgaGVyZSBpZiB5b3Ugd2FudCB0byBlbmFibGUgUENJZSBj
b250cm9sbGVyIHN1cHBvcnQgb24NCj4gTGF5ZXJzY2FwZQ0KPiA+ICsgICAgICAgU29DcyB0byB3
b3JrIGluIEVuZHBvaW50IG1vZGUuDQo+ID4gKyAgICAgICBUaGlzIGNvbnRyb2xsZXIgY2FuIHdv
cmsgZWl0aGVyIGFzIEVQIG9yIFJDLiBUaGUNCj4gUkNXW0hPU1RfQUdUX1BFWF0NCj4gPiArICAg
ICAgIGRldGVybWluZXMgd2hpY2ggUENJZSBjb250cm9sbGVyIHdvcmtzIGluIEVQIG1vZGUgYW5k
IHdoaWNoDQo+IFBDSWUNCj4gPiArICAgICAgIGNvbnRyb2xsZXIgd29ya3MgaW4gUkMgbW9kZS4N
Cj4gPg0KPiA+ICBjb25maWcgUENJX0hJU0kNCj4gPiAgICAgICBkZXBlbmRzIG9uIE9GICYmIChB
Uk02NCB8fCBDT01QSUxFX1RFU1QpIGRpZmYgLS1naXQNCj4gPiBhL2RyaXZlcnMvcGNpL2NvbnRy
b2xsZXIvZHdjL01ha2VmaWxlDQo+ID4gYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9NYWtl
ZmlsZQ0KPiA+IGluZGV4IGIwODVkZmQuLjgyNGZkZTcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVy
cy9wY2kvY29udHJvbGxlci9kd2MvTWFrZWZpbGUNCj4gPiArKysgYi9kcml2ZXJzL3BjaS9jb250
cm9sbGVyL2R3Yy9NYWtlZmlsZQ0KPiA+IEBAIC04LDcgKzgsOCBAQCBvYmotJChDT05GSUdfUENJ
X0VYWU5PUykgKz0gcGNpLWV4eW5vcy5vDQo+ID4gIG9iai0kKENPTkZJR19QQ0lfSU1YNikgKz0g
cGNpLWlteDYubw0KPiA+ICBvYmotJChDT05GSUdfUENJRV9TUEVBUjEzWFgpICs9IHBjaWUtc3Bl
YXIxM3h4Lm8NCj4gPiAgb2JqLSQoQ09ORklHX1BDSV9LRVlTVE9ORSkgKz0gcGNpLWtleXN0b25l
Lm8NCj4gPiAtb2JqLSQoQ09ORklHX1BDSV9MQVlFUlNDQVBFKSArPSBwY2ktbGF5ZXJzY2FwZS5v
IHBjaS1sYXllcnNjYXBlLWVwLm8NCj4gPiArb2JqLSQoQ09ORklHX1BDSV9MQVlFUlNDQVBFKSAr
PSBwY2ktbGF5ZXJzY2FwZS5vDQo+ID4gK29iai0kKENPTkZJR19QQ0lfTEFZRVJTQ0FQRV9FUCkg
Kz0gcGNpLWxheWVyc2NhcGUtZXAubw0KPiA+ICBvYmotJChDT05GSUdfUENJRV9RQ09NKSArPSBw
Y2llLXFjb20ubw0KPiA+ICBvYmotJChDT05GSUdfUENJRV9BUk1BREFfOEspICs9IHBjaWUtYXJt
YWRhOGsubw0KPiA+ICBvYmotJChDT05GSUdfUENJRV9BUlRQRUM2KSArPSBwY2llLWFydHBlYzYu
bw0KPiA+IC0tDQo+ID4gMS43LjENCj4gPg0K
