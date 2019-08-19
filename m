Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D21B91F04
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 10:35:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BnLV3MpYzDqnT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 18:35:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=40.107.13.52; helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="jXF+83zE"; 
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130052.outbound.protection.outlook.com [40.107.13.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BnJM61J5zDqYt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 18:33:36 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BOqv+eXmRXS4fPzgZkQPPNkn/oWNBke9GZGH7++9utG71SjbFdMpUQ/t7HENdWgEiWbrwfaEXF1V7S/1vJmQBwXgVrSNSKCor/C6NNNDId/0eeEmpphg6r763KHCOYpOwaLatxB3YZOMEo+kJDu6XNudwZfJwtohs5FaBx3Aj4JAnKN7bReoYF1APxgZ+jp0CJBqWyI+WvD/+IV9VOR+tFbXo6buJgmhKBzAu7SJNo3zxEqO41/e//hmRXETqAEHQXJ2rKwT8vuMUbY4h01oCkrfRw2g1c7ioPRij+QoxzsmWGi/MHkEzvhe/xTbugwOog2LyKMLb1AddnFU+12NVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3tHEMk3l3ATRx7p2Q/oXf24GzNcnxlzOs+76gmCR54=;
 b=WyVwztC+ORSaTSCYadpAQy/jWjrdyC8RMd0JsIv196jEnv5d9hLzzOrHjMvc4JTiMr/7aWu/upyE74odf02+RJw/BPmyJGjP7bRElMamFlJIH8oUg6gYe/Ny7diUdmaHbNgpaH19gp1yPnwG5LvSONkKboF9QmdphO4vW6gk5tM17Lcc4rTFKVSDxaFpCb36imXshXQXUnt1DK4w2ldzm1Nc8dSEyxi8FC7+9d+1GgcSwEXInL4npfCKZ7/q7HV+ZchjSJjy1b4IY2/Dl9F+C5SlwdumF6g02HO4+iETcPhtEIW8xXvmHnetNGxJ7Vf3zgAH+rzUPKhtaBfbb3JfeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3tHEMk3l3ATRx7p2Q/oXf24GzNcnxlzOs+76gmCR54=;
 b=jXF+83zEJyDPHpXBcQhLI9tukPVE5RSKw304pfdIwAo07JKc9i15EUOTKZSXFzbzqyu/fl/AEkQqX9+y0G3X9JLVWOGbnAINrMmGN1xfbd+7TCZgtQ89abQVGiwMm068WEyOSapiBOiIFAucOwYHoA8m8Uit3MF6zQWH06jTbh4=
Received: from DB8PR04MB6826.eurprd04.prod.outlook.com (52.133.240.82) by
 DB8PR04MB6425.eurprd04.prod.outlook.com (20.179.248.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Mon, 19 Aug 2019 08:33:25 +0000
Received: from DB8PR04MB6826.eurprd04.prod.outlook.com
 ([fe80::ad63:e8df:f0c2:7246]) by DB8PR04MB6826.eurprd04.prod.outlook.com
 ([fe80::ad63:e8df:f0c2:7246%2]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 08:33:25 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: RE: [PATCH v5 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Thread-Topic: [PATCH v5 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Thread-Index: AQHVQfPC8fuUrwx+d0SKWP625Z9OpabsZPGAgBWwP7CAADS+gIAAAc5g
Date: Mon, 19 Aug 2019 08:33:25 +0000
Message-ID: <DB8PR04MB6826475ACA623AE6D63617D7F1A80@DB8PR04MB6826.eurprd04.prod.outlook.com>
References: <20190724074722.12270-1-ran.wang_1@nxp.com>
 <4158639.B12JYek7R7@kreacher>
 <DB8PR04MB682632A586827032F8D6EA2DF1A80@DB8PR04MB6826.eurprd04.prod.outlook.com>
 <CAJZ5v0i58p-GsswzMGEsgD5OXDqJ_G5zXDYf8jq8JJbWxZv+nQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0i58p-GsswzMGEsgD5OXDqJ_G5zXDYf8jq8JJbWxZv+nQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ran.wang_1@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5774b5e1-734b-4508-1dce-08d7247fe741
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DB8PR04MB6425; 
x-ms-traffictypediagnostic: DB8PR04MB6425:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB6425F482EA6704730BED09A6F1A80@DB8PR04MB6425.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(366004)(136003)(51914003)(189003)(199004)(478600001)(74316002)(7736002)(2906002)(305945005)(71200400001)(71190400001)(76116006)(14454004)(476003)(446003)(66946007)(6436002)(66066001)(66446008)(11346002)(5024004)(256004)(8676002)(6916009)(6506007)(53546011)(8936002)(81166006)(81156014)(66476007)(102836004)(486006)(66556008)(229853002)(186003)(55016002)(9686003)(64756008)(33656002)(14444005)(7696005)(316002)(76176011)(7416002)(4326008)(25786009)(26005)(53936002)(99286004)(6246003)(54906003)(5660300002)(86362001)(6116002)(3846002)(52536014)(473944003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB6425;
 H:DB8PR04MB6826.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6MM4NF1G+zEty+303g/yAxtldCxDxkFvST6C97X+4xQz4g78Eu9n0P76ncxVtvqowYPp5HO6q7IHSPCICt5J9jMzG7NeD8iXHbnyF4KosH+xSWvisws0jlAEvFLQEgb3tb9L87goLYAqFP7YJJ0gA+DgpjLZaFQEjI05M84Up69FUnrYnEcpAxMqINXA/QnRdeD+tQo8dV0RfLKjEocDYUhZvKWtlaQ0GQwzommpS54lVfkB0CP9N7C0wLm/x5P4jswDnaH2ImFcOBkX6x4TEUC9Cr39EU4bytQhde0GRw2qcF8DlkOPegJKJi0Zz003Z/RPOLszn6MpBdGNWyUUe7A3AyBVdlCXPwM1WIH3YdkF88y7vXNG6cxXC1rLeK3vdT++X4y2iwRoPIO+z8TF0UyQJv7M0YFjMTAAjQVi9nY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5774b5e1-734b-4508-1dce-08d7247fe741
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 08:33:25.4484 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cJ32wyiqDoxFbhELwPDtCgBnf6hhV9903WzOj3nQ3nZ/ZEmoI5obzRCKnKvPkYHkpq/R/JOnmW+glRoe1+fzDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6425
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
Cc: Mark Rutland <mark.rutland@arm.com>, Biwen Li <biwen.li@nxp.com>,
 Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgUmFmYWVsLA0KDQpPbiBNb25kYXksIEF1Z3VzdCAxOSwgMjAxOSAxNjoyMCwgUmFmYWVsIEou
IFd5c29ja2kgd3JvdGU6DQo+IA0KPiBPbiBNb24sIEF1ZyAxOSwgMjAxOSBhdCAxMDoxNSBBTSBS
YW4gV2FuZyA8cmFuLndhbmdfMUBueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IEhpIFJhZmFlbCwN
Cj4gPg0KPiA+IE9uIE1vbmRheSwgQXVndXN0IDA1LCAyMDE5IDE3OjU5LCBSYWZhZWwgSi4gV3lz
b2NraSB3cm90ZToNCj4gPiA+DQo+ID4gPiBPbiBXZWRuZXNkYXksIEp1bHkgMjQsIDIwMTkgOTo0
NzoyMCBBTSBDRVNUIFJhbiBXYW5nIHdyb3RlOg0KPiA+ID4gPiBTb21lIHVzZXIgbWlnaHQgd2Fu
dCB0byBnbyB0aHJvdWdoIGFsbCByZWdpc3RlcmVkIHdha2V1cCBzb3VyY2VzDQo+ID4gPiA+IGFu
ZCBkb2luZyB0aGluZ3MgYWNjb3JkaW5nbHkuIEZvciBleGFtcGxlLCBTb0MgUE0gZHJpdmVyIG1p
Z2h0DQo+ID4gPiA+IG5lZWQgdG8gZG8gSFcgcHJvZ3JhbW1pbmcgdG8gcHJldmVudCBwb3dlcmlu
ZyBkb3duIHNwZWNpZmljIElQDQo+ID4gPiA+IHdoaWNoIHdha2V1cCBzb3VyY2UgZGVwZW5kaW5n
IG9uLiBTbyBhZGQgdGhpcyBBUEkgdG8gaGVscCB3YWxrDQo+ID4gPiA+IHRocm91Z2ggYWxsIHJl
Z2lzdGVyZWQgd2FrZXVwIHNvdXJjZSBvYmplY3RzIG9uIHRoYXQgbGlzdCBhbmQgcmV0dXJuIHRo
ZW0NCj4gb25lIGJ5IG9uZS4NCj4gPiA+ID4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUmFuIFdh
bmcgPHJhbi53YW5nXzFAbnhwLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+IENoYW5nZSBpbiB2
NToNCj4gPiA+ID4gICAgIC0gVXBkYXRlIGNvbW1pdCBtZXNzYWdlLCBhZGQgZGVjcmlwdGlvbiBv
ZiB3YWxrIHRocm91Z2ggYWxsIHdha2V1cA0KPiA+ID4gPiAgICAgc291cmNlIG9iamVjdHMuDQo+
ID4gPiA+ICAgICAtIEFkZCBTQ1UgcHJvdGVjdGlvbiBpbiBmdW5jdGlvbiB3YWtldXBfc291cmNl
X2dldF9uZXh0KCkuDQo+ID4gPiA+ICAgICAtIFJlbmFtZSB3YWtldXBfc291cmNlIG1lbWJlciAn
YXR0YWNoZWRfZGV2JyB0byAnZGV2JyBhbmQgbW92ZQ0KPiA+ID4gPiBpdA0KPiA+ID4gdXANCj4g
PiA+ID4gICAgIChiZWZvcmUgd2FrZWlycSkuDQo+ID4gPiA+DQo+ID4gPiA+IENoYW5nZSBpbiB2
NDoNCj4gPiA+ID4gICAgIC0gTm9uZS4NCj4gPiA+ID4NCj4gPiA+ID4gQ2hhbmdlIGluIHYzOg0K
PiA+ID4gPiAgICAgLSBBZGp1c3QgaW5kZW50YXRpb24gb2YgKmF0dGFjaGVkX2RldjsuDQo+ID4g
PiA+DQo+ID4gPiA+IENoYW5nZSBpbiB2MjoNCj4gPiA+ID4gICAgIC0gTm9uZS4NCj4gPiA+ID4N
Cj4gPiA+ID4gIGRyaXZlcnMvYmFzZS9wb3dlci93YWtldXAuYyB8IDI0ICsrKysrKysrKysrKysr
KysrKysrKysrKw0KPiA+ID4gPiAgaW5jbHVkZS9saW51eC9wbV93YWtldXAuaCAgIHwgIDMgKysr
DQo+ID4gPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKykNCj4gPiA+ID4NCj4g
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmFzZS9wb3dlci93YWtldXAuYw0KPiA+ID4gPiBi
L2RyaXZlcnMvYmFzZS9wb3dlci93YWtldXAuYyBpbmRleCBlZTMxZDRmLi4yZmJhODkxIDEwMDY0
NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2Jhc2UvcG93ZXIvd2FrZXVwLmMNCj4gPiA+ID4gKysr
IGIvZHJpdmVycy9iYXNlL3Bvd2VyL3dha2V1cC5jDQo+ID4gPiA+IEBAIC0xNCw2ICsxNCw3IEBA
DQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvc3VzcGVuZC5oPg0KPiA+ID4gPiAgI2luY2x1ZGUg
PGxpbnV4L3NlcV9maWxlLmg+DQo+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvZGVidWdmcy5oPg0K
PiA+ID4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPg0KPiA+ID4gPiAgI2luY2x1ZGUg
PGxpbnV4L3BtX3dha2VpcnEuaD4NCj4gPiA+ID4gICNpbmNsdWRlIDx0cmFjZS9ldmVudHMvcG93
ZXIuaD4NCj4gPiA+ID4NCj4gPiA+ID4gQEAgLTIyNiw2ICsyMjcsMjggQEAgdm9pZCB3YWtldXBf
c291cmNlX3VucmVnaXN0ZXIoc3RydWN0DQo+ID4gPiB3YWtldXBfc291cmNlICp3cykNCj4gPiA+
ID4gICAgIH0NCj4gPiA+ID4gIH0NCj4gPiA+ID4gIEVYUE9SVF9TWU1CT0xfR1BMKHdha2V1cF9z
b3VyY2VfdW5yZWdpc3Rlcik7DQo+ID4gPiA+ICsvKioNCj4gPiA+ID4gKyAqIHdha2V1cF9zb3Vy
Y2VfZ2V0X25leHQgLSBHZXQgbmV4dCB3YWtldXAgc291cmNlIGZyb20gdGhlIGxpc3QNCj4gPiA+
ID4gKyAqIEB3czogUHJldmlvdXMgd2FrZXVwIHNvdXJjZSBvYmplY3QsIG51bGwgbWVhbnMgY2Fs
bGVyIHdhbnQgZmlyc3Qgb25lLg0KPiA+ID4gPiArICovDQo+ID4gPiA+ICtzdHJ1Y3Qgd2FrZXVw
X3NvdXJjZSAqd2FrZXVwX3NvdXJjZV9nZXRfbmV4dChzdHJ1Y3Qgd2FrZXVwX3NvdXJjZQ0KPiA+
ID4gPiArKndzKSB7DQo+ID4gPiA+ICsgICBzdHJ1Y3QgbGlzdF9oZWFkICp3c19oZWFkID0gJndh
a2V1cF9zb3VyY2VzOw0KPiA+ID4gPiArICAgc3RydWN0IHdha2V1cF9zb3VyY2UgKm5leHRfd3Mg
PSBOVUxMOw0KPiA+ID4gPiArICAgaW50IGlkeDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgaWR4
ID0gc3JjdV9yZWFkX2xvY2soJndha2V1cF9zcmN1KTsNCj4gPiA+ID4gKyAgIGlmICh3cykNCj4g
PiA+ID4gKyAgICAgICAgICAgbmV4dF93cyA9IGxpc3RfbmV4dF9vcl9udWxsX3JjdSh3c19oZWFk
LCAmd3MtPmVudHJ5LA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0
IHdha2V1cF9zb3VyY2UsIGVudHJ5KTsNCj4gPiA+ID4gKyAgIGVsc2UNCj4gPiA+ID4gKyAgICAg
ICAgICAgbmV4dF93cyA9IGxpc3RfZW50cnlfcmN1KHdzX2hlYWQtPm5leHQsDQo+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgd2FrZXVwX3NvdXJjZSwgZW50cnkpOw0K
PiA+ID4gPiArICAgc3JjdV9yZWFkX3VubG9jaygmd2FrZXVwX3NyY3UsIGlkeCk7DQo+ID4gPiA+
ICsNCj4gPiA+DQo+ID4gPiBUaGlzIGlzIGluY29ycmVjdC4NCj4gPiA+DQo+ID4gPiBUaGUgU1JD
VSBjYW5ub3QgYmUgdW5sb2NrZWQgdW50aWwgdGhlIGNhbGxlciBvZiB0aGlzIGlzIGRvbmUgd2l0
aA0KPiA+ID4gdGhlIG9iamVjdCByZXR1cm5lZCBieSBpdCwgb3IgdGhhdCBvYmplY3QgY2FuIGJl
IGZyZWVkIHdoaWxlIGl0IGlzIHN0aWxsIGJlaW5nDQo+IGFjY2Vzc2VkLg0KPiA+DQo+ID4gVGhh
bmtzIGZvciB0aGUgY29tbWVudC4gTG9va3MgbGlrZSBJIHdhcyBub3QgZnVsbHkgdW5kZXJzdGFu
ZGluZyB5b3VyDQo+ID4gcG9pbnQgb24NCj4gPiB2NCBkaXNjdXNzaW9uLiBTbyBJIHdpbGwgaW1w
bGVtZW50IDMgQVBJcyBieSByZWZlcnJpbmcNCj4gPiB3YWtldXBfc291cmNlc19zdGF0c19zZXFf
c3RhcnQvbmV4dC9zdG9wKCkNCj4gPg0KPiA+ID4gQmVzaWRlcywgdGhpcyBwYXRjaCBjb25mbGlj
dHMgd2l0aCBzb21lIGdlbmVyYWwgd2FrZXVwIHNvdXJjZXMNCj4gPiA+IGNoYW5nZXMgaW4gdGhl
IHdvcmtzLCBzbyBpdCBuZWVkcyB0byBiZSBkZWZlcnJlZCBhbmQgcmViYXNlZCBvbiB0b3Agb2Yg
dGhvc2UNCj4gY2hhbmdlcy4NCj4gPg0KPiA+IENvdWxkIHlvdSBwbGVhc2UgdGVsbCBtZSB3aGlj
aCBpcyB0aGUgcmlnaHQgY29kZSBiYXNlIEkgc2hvdWxkIGRldmVsb3Bpbmcgb24/DQo+ID4gSSBq
dXN0IHRyaWVkIGFwcGx5aW5nIHY1IHBhdGNoIG9uIGxhdGVzdA0KPiA+IGdpdDovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9ncmVna2gvdXNiLmdpdCBicmFuY2ggbWFz
dGVyDQo+IChkMWFiYWViIExpbnV4IDUuMy1yYzUpIGFuZCBubyBjb25mbGljdCBlbmNvdW50ZXJl
ZC4NCj4gDQo+IEl0IGlzIGJldHRlciB0byB1c2UgdGhlIG1vc3QgcmVjZW50IC1yYyBmcm9tIExp
bnVzICg1LjMtcmM1IGFzIG9mDQo+IHRvZGF5KSBhcyB0aGUgYmFzZSB1bmxlc3MgeW91ciBwYXRj
aGVzIGRlcGVuZCBvbiBzb21lIGNoYW5nZXMgdGhhdCBhcmUgbm90IGluDQo+IHRoZXJlLg0KDQpP
SywgU28gSSBuZWVkIHRvIGltcGxlbWVudCBvbiBsYXRlc3QgZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdCBicmFuY2ggbWFzdGVy
LCBhbSBJIHJpZ2h0Pw0KDQpIb3dldmVyLCBJIGp1c3QgY2hlY2tlZCB2NS4zLXJjNSBjb2RlIGFu
ZCBmb3VuZCBpdCBoYXMgdGhlIHNhbWUgSEVBRCAoZDFhYmFlYiBMaW51eCA1LjMtcmM1DQpvbiB3
aGljaCBJIGRpZCBub3Qgb2JzZXJ2ZSB2NSBwYXRjaCBhcHBseSBjb25mbGljdCwgZGlkIEkgbWlz
cyBzb21ldGhpbmc/IFRoYW5rcy4NCg0KUmVnYXJkcywNClJhbg0K
