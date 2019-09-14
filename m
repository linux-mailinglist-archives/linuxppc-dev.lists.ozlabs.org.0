Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DADD4B29A6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2019 06:15:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46VfLp2FdXzF4hr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Sep 2019 14:15:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=2a01:111:f400:fe0c::614;
 helo=eur04-db3-obe.outbound.protection.outlook.com;
 envelope-from=xiaowei.bao@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="GG+uTfTH"; 
 dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0614.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::614])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46VfJj3nh9zF5SY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 14:13:55 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TvKTOvTrRg+ZyFErhJC4h4lhpgh4KSLeHimVqY+JB4Zubpa5H5ESLKS00g+79VHtoK7kNewOq/3icJZqf4zUsG7wOpIyRRlNYysFqjxy61T3TquHLaEGIGHbXLy0cgO+Jan9skGCSNW1t0RqR4fJX0w1bBKVkCsAdTX8VFKZdlu1C05/aHflsK3irC0UeHANpdnQRx+OVJO67wVM+J64aqYuzdL6C1421pjPKc7xZIBmoG+TrecL8cSIHpAMKL8xj66JjEF2w3XJeThNQf288RMM+pMcINOonj53Oh0PrD1PpDMfzbKk5SK/MGD1zKduDQgkcKhz76L4bG8NbC06cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OBiwU8PS8s135+ruICUBxIq3HOqv3QTrhMoJzW5EnQ=;
 b=Al3zuNxWjO2q4cB4R4QpLGDl1rgKZlydotygRePmXtFf2a16xlR3acba7YadGz3T/MMstUlJ69YJGqUrUBAlIetN2czKdI43yzIjLSeSQ9wqN/R+rMHPr5wdQxJUpRTUQaggnLl0kuHGjaEawWDBIZhCk7n2NiDmJ8d7nu6JT/dnLIw5WJYFCOE9v3xtmviSxTeVX+4NeNA4bc3cHR/+OSfucMRMvvhWJE12+dLdcVi5hzMfY0ioeyahtSy9k7lml/TipqnnE0fdYahwiElncFDHD2dFzDR5KiMvFLb2moCzTLK9+Tu5HOnQ+nWA224kLALGDA72PW5UnOaDBRf+6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OBiwU8PS8s135+ruICUBxIq3HOqv3QTrhMoJzW5EnQ=;
 b=GG+uTfTHzok0YQnf3/9DckOFZuQo2qJWNXQa4EtWqIe42hYQKqrTq2Y3UdEyesAUpN0/cMFUyYhU0MXqYcKohv5RqUTJNQca0tibhI/6ji+O69zprf8QIPmkcVkl/230KOZeoTYdI67igqqV63jdODp3kB6mTTZbXoytkyvRHlA=
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com (10.173.255.158) by
 AM5PR04MB3057.eurprd04.prod.outlook.com (10.175.229.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.17; Sat, 14 Sep 2019 04:13:45 +0000
Received: from AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41]) by AM5PR04MB3299.eurprd04.prod.outlook.com
 ([fe80::5dd3:ddc9:411a:db41%3]) with mapi id 15.20.2241.022; Sat, 14 Sep 2019
 04:13:45 +0000
From: Xiaowei Bao <xiaowei.bao@nxp.com>
To: Andrew Murray <andrew.murray@arm.com>, "helgaas@kernel.org"
 <helgaas@kernel.org>
Subject: RE: [PATCH v3 11/11] misc: pci_endpoint_test: Add LS1088a in
 pci_device_id table
Thread-Topic: [PATCH v3 11/11] misc: pci_endpoint_test: Add LS1088a in
 pci_device_id table
Thread-Index: AQHVYT5qk2ZfW7svpUGDLJ0EtdcJHacYWL4AgADX6sCADuC7AIACkZHA
Date: Sat, 14 Sep 2019 04:13:45 +0000
Message-ID: <AM5PR04MB32993DF2383D23C19B451FE6F5B20@AM5PR04MB3299.eurprd04.prod.outlook.com>
References: <20190902031716.43195-1-xiaowei.bao@nxp.com>
 <20190902031716.43195-12-xiaowei.bao@nxp.com>
 <20190902125454.GK9720@e119886-lin.cambridge.arm.com>
 <AM5PR04MB3299D598229952C13C492B48F5B90@AM5PR04MB3299.eurprd04.prod.outlook.com>
 <20190912125939.GE9720@e119886-lin.cambridge.arm.com>
In-Reply-To: <20190912125939.GE9720@e119886-lin.cambridge.arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=xiaowei.bao@nxp.com; 
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5254a2e2-0adb-4c77-ffca-08d738c9ef92
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:AM5PR04MB3057; 
x-ms-traffictypediagnostic: AM5PR04MB3057:|AM5PR04MB3057:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR04MB305719874312536E26486FAAF5B20@AM5PR04MB3057.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 01604FB62B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(39840400004)(136003)(376002)(199004)(189003)(13464003)(81156014)(99286004)(229853002)(54906003)(9686003)(33656002)(6116002)(3846002)(53936002)(110136005)(55016002)(316002)(6246003)(6436002)(478600001)(2501003)(486006)(446003)(5660300002)(7416002)(11346002)(14454004)(2906002)(86362001)(76176011)(6506007)(53546011)(8936002)(66066001)(7736002)(476003)(66946007)(7696005)(66476007)(66556008)(64756008)(66446008)(25786009)(76116006)(26005)(305945005)(74316002)(186003)(52536014)(71200400001)(71190400001)(44832011)(102836004)(4326008)(81166006)(8676002)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR04MB3057;
 H:AM5PR04MB3299.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 99zAZguBc9L2aw3iJhEwUVmNAVm/yF2GKPOOIUxQ9AMOnDqLdqjVoSeZEp0gopqSUAzfjek0FDL7Oh6U2xBDQ8kT6wIb44mZnDDRZPEuKFrHkCabKXR4lAW4p58Y7hkfc3oLqO19WRhTZXxoxMYz1AqtJwRPDSG4goIeo40k7f7cTugAWLJqAKQSpSANeFt0/a1nURPCcTTRE3ePrdRgeGgDWuTjs9KpP6ZSvTrqUmG9NvPwlpKEUzL4Q2eJvN+eg228KIZdkiyKOBMcs+6ndgfeyde1Nk4pn5UrGaMbvazsMCYn48/sA0JmcutDNRgYqkmzj7l1oQ/wJ3ebDQ5OoL/tLSIrenOacTP7o0+oUo4T5dStLum7XYtcupqX1p+F+XGurffMiK0xtZBXzhlUgB9vNy2k9Op5U3uAGc+ur0E=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5254a2e2-0adb-4c77-ffca-08d738c9ef92
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2019 04:13:45.3955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MOq+OF02LroiK9jXKP/ekJEv3DXLqFzJtn9uq8MlTlKACC/8uDjoewAS4kdibteoWaKfx+QkZEdvEZCzZrY09A==
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
YW5kcmV3Lm11cnJheUBhcm0uY29tPg0KPiBTZW50OiAyMDE55bm0OeaciDEy5pelIDIxOjAwDQo+
IFRvOiBYaWFvd2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT47IGhlbGdhYXNAa2VybmVsLm9y
Zw0KPiBDYzogcm9iaCtkdEBrZXJuZWwub3JnOyBtYXJrLnJ1dGxhbmRAYXJtLmNvbTsgc2hhd25n
dW9Aa2VybmVsLm9yZzsgTGVvDQo+IExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBraXNob25AdGku
Y29tOyBsb3JlbnpvLnBpZXJhbGlzaUBhcm0uY29tOyBNLmguDQo+IExpYW4gPG1pbmdodWFuLmxp
YW5AbnhwLmNvbT47IE1pbmdrYWkgSHUgPG1pbmdrYWkuaHVAbnhwLmNvbT47IFJveQ0KPiBaYW5n
IDxyb3kuemFuZ0BueHAuY29tPjsgamluZ29vaGFuMUBnbWFpbC5jb207DQo+IGd1c3Rhdm8ucGlt
ZW50ZWxAc3lub3BzeXMuY29tOyBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnOw0KPiBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsNCj4gbGlu
dXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eHBwYy1kZXZAbGlzdHMub3ps
YWJzLm9yZzsNCj4gYXJuZEBhcm5kYi5kZTsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc7IFou
cS4gSG91DQo+IDx6aGlxaWFuZy5ob3VAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2
MyAxMS8xMV0gbWlzYzogcGNpX2VuZHBvaW50X3Rlc3Q6IEFkZCBMUzEwODhhIGluDQo+IHBjaV9k
ZXZpY2VfaWQgdGFibGUNCj4gDQo+IE9uIFR1ZSwgU2VwIDAzLCAyMDE5IGF0IDAxOjUyOjMwQU0g
KzAwMDAsIFhpYW93ZWkgQmFvIHdyb3RlOg0KPiA+DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBBbmRyZXcgTXVycmF5IDxhbmRyZXcubXVycmF5QGFy
bS5jb20+DQo+ID4gPiBTZW50OiAyMDE55bm0OeaciDLml6UgMjA6NTUNCj4gPiA+IFRvOiBYaWFv
d2VpIEJhbyA8eGlhb3dlaS5iYW9AbnhwLmNvbT4NCj4gPiA+IENjOiByb2JoK2R0QGtlcm5lbC5v
cmc7IG1hcmsucnV0bGFuZEBhcm0uY29tOyBzaGF3bmd1b0BrZXJuZWwub3JnOw0KPiA+ID4gTGVv
IExpIDxsZW95YW5nLmxpQG54cC5jb20+OyBraXNob25AdGkuY29tOyBsb3JlbnpvLnBpZXJhbGlz
aUBhcm0uY29tOw0KPiBNLmguDQo+ID4gPiBMaWFuIDxtaW5naHVhbi5saWFuQG54cC5jb20+OyBN
aW5na2FpIEh1IDxtaW5na2FpLmh1QG54cC5jb20+OyBSb3kNCj4gPiA+IFphbmcgPHJveS56YW5n
QG54cC5jb20+OyBqaW5nb29oYW4xQGdtYWlsLmNvbTsNCj4gPiA+IGd1c3Rhdm8ucGltZW50ZWxA
c3lub3BzeXMuY29tOyBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnOw0KPiA+ID4gZGV2aWNldHJl
ZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+ID4gPiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4cHBjLWRldkBsaXN0cy5v
emxhYnMub3JnOw0KPiA+ID4gYXJuZEBhcm5kYi5kZTsgZ3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5v
cmc7IFoucS4gSG91DQo+ID4gPiA8emhpcWlhbmcuaG91QG54cC5jb20+DQo+ID4gPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYzIDExLzExXSBtaXNjOiBwY2lfZW5kcG9pbnRfdGVzdDogQWRkIExTMTA4
OGENCj4gPiA+IGluIHBjaV9kZXZpY2VfaWQgdGFibGUNCj4gPiA+DQo+ID4gPiBPbiBNb24sIFNl
cCAwMiwgMjAxOSBhdCAxMToxNzoxNkFNICswODAwLCBYaWFvd2VpIEJhbyB3cm90ZToNCj4gPiA+
ID4gQWRkIExTMTA4OGEgaW4gcGNpX2RldmljZV9pZCB0YWJsZSBzbyB0aGF0IHBjaS1lcGYtdGVz
dCBjYW4gYmUNCj4gPiA+ID4gdXNlZCBmb3IgdGVzdGluZyBQQ0llIEVQIGluIExTMTA4OGEuDQo+
ID4gPiA+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFhpYW93ZWkgQmFvIDx4aWFvd2VpLmJhb0Bu
eHAuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gdjI6DQo+ID4gPiA+ICAtIE5vIGNoYW5nZS4N
Cj4gPiA+ID4gdjM6DQo+ID4gPiA+ICAtIE5vIGNoYW5nZS4NCj4gPiA+ID4NCj4gPiA+ID4gIGRy
aXZlcnMvbWlzYy9wY2lfZW5kcG9pbnRfdGVzdC5jIHwgMSArDQo+ID4gPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKykNCj4gPiA+ID4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWlzYy9wY2lfZW5kcG9pbnRfdGVzdC5jDQo+ID4gPiA+IGIvZHJpdmVycy9taXNjL3BjaV9l
bmRwb2ludF90ZXN0LmMNCj4gPiA+ID4gaW5kZXggNmUyMDhhMC4uZDUzMTk1MSAxMDA2NDQNCj4g
PiA+ID4gLS0tIGEvZHJpdmVycy9taXNjL3BjaV9lbmRwb2ludF90ZXN0LmMNCj4gPiA+ID4gKysr
IGIvZHJpdmVycy9taXNjL3BjaV9lbmRwb2ludF90ZXN0LmMNCj4gPiA+ID4gQEAgLTc5Myw2ICs3
OTMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQNCj4gPiA+IHBjaV9lbmRw
b2ludF90ZXN0X3RibFtdID0gew0KPiA+ID4gPiAgCXsgUENJX0RFVklDRShQQ0lfVkVORE9SX0lE
X1RJLCBQQ0lfREVWSUNFX0lEX1RJX0RSQTc0eCkgfSwNCj4gPiA+ID4gIAl7IFBDSV9ERVZJQ0Uo
UENJX1ZFTkRPUl9JRF9USSwgUENJX0RFVklDRV9JRF9USV9EUkE3MngpIH0sDQo+ID4gPiA+ICAJ
eyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfRlJFRVNDQUxFLCAweDgxYzApIH0sDQo+ID4gPiA+
ICsJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfRlJFRVNDQUxFLCAweDgwYzApIH0sDQo+ID4g
Pg0KPiA+ID4gVGhlIEZyZWVzY2FsZSBQQ0kgZGV2aWNlcyBhcmUgdGhlIG9ubHkgZGV2aWNlcyBp
biB0aGlzIHRhYmxlIHRoYXQNCj4gPiA+IGRvbid0IGhhdmUgYSBkZWZpbmUgZm9yIHRoZWlyIGRl
dmljZSBJRC4gSSB0aGluayBhIGRlZmluZSBzaG91bGQgYmUNCj4gPiA+IGNyZWF0ZWQgZm9yIGJv
dGggb2YgdGhlIGRldmljZSBJRHMgYWJvdmUuDQo+ID4NCj4gPiBPSywgYnV0IEkgb25seSBkZWZp
bmUgaW4gdGhpcyBmaWxlLCBJIGFtIG5vdCBzdXJlIHRoaXMgY2FuIGRlZmluZSBpbg0KPiA+IGlu
Y2x1ZGUvbGludXgvcGNpX2lkcy5oIGZpbGUNCj4gDQo+IFRoaXMgZmlsZSBzZWVtcyBhIGxpdHRs
ZSBpbmNvbnNpc3RlbnQuLi4NCj4gDQo+ICAtIFR3byBvZiB0aGUgVEkgZGV2aWNlIElEcyBhcmUg
ZGVmaW5lZCBpbiBwY2lfaWRzLmggYW5kIG9ubHkgdXNlZCBpbg0KPiBwY2lfZW5kcG9pbnRfdGVz
dC5jDQo+ICAtIE9uZSBvZiB0aGUgVEkgZGV2aWNlIElEcyBhcmUgZGVmaW5lZCBpbiBwY2lfZW5k
cG9pbnRfdGVzdC5jIGFuZCBvbmx5IHVzZWQNCj4gdGhlcmUNCj4gIC0gVGhlIEZyZWVzY2FsZSBk
ZXZpY2UgSUQgaXMgaGFyZGNvZGVkIGFuZCBvbmx5IHVzZWQgaW4gcGNpX2VuZHBvaW50X3Rlc3Qu
Yw0KPiANCj4gVGhlIGhlYWRlciBpbiBwY2lfaWRzLmggaGFzIGEgY29tbWVudCBzdWdnZXN0aW9u
IGRlZmluaXRpb25zIGFyZSBvbmx5IGFkZGVkDQo+IHdoZXJlIHVzZWQgaW4gbXVsdGlwbGUgZmls
ZXMgLSB5ZXQgSSBkb24ndCB0aGluayB0aGlzIGhvbGRzIHRydWUuDQoNClRoYW5rcyBBbmRyZXcu
DQoNCg0KPiANCj4gQmpvcm4gLSBkbyB5b3UgaGF2ZSBhIHN1Z2dlc3Rpb24/DQo+IA0KPiBUaGFu
a3MsDQo+IA0KPiBBbmRyZXcgTXVycmF5DQo+IA0KPiA+DQo+ID4gVGhhbmtzDQo+ID4gWGlhb3dl
aQ0KPiA+DQo+ID4gPg0KPiA+ID4gVGhhbmtzLA0KPiA+ID4NCj4gPiA+IEFuZHJldyBNdXJyYXkN
Cj4gPiA+DQo+ID4gPiA+ICAJeyBQQ0lfREVWSUNFX0RBVEEoU1lOT1BTWVMsIEVEREEsIE5VTEwp
IH0sDQo+ID4gPiA+ICAJeyBQQ0lfREVWSUNFKFBDSV9WRU5ET1JfSURfVEksIFBDSV9ERVZJQ0Vf
SURfVElfQU02NTQpLA0KPiA+ID4gPiAgCSAgLmRyaXZlcl9kYXRhID0gKGtlcm5lbF91bG9uZ190
KSZhbTY1NF9kYXRhDQo+ID4gPiA+IC0tDQo+ID4gPiA+IDIuOS41DQo+ID4gPiA+DQo=
