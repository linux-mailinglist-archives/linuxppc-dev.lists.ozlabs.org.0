Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F234FE285E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 04:39:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zBKm5TmJzDqT8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 13:39:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.3.56; helo=eur03-am5-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="g3vh8tnN"; 
 dkim-atps=neutral
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr30056.outbound.protection.outlook.com [40.107.3.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zBHt4HVhzDqRM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2019 13:38:14 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mats4tHcEribEfhwa3cejJIE7LnCzNLIJx0Geh9I77c3bF2S7RdsgwydLTBD1qQoUafD/qp1HhTYNYcDlmuW+2fqEphl5xug+9ZStK9w+uVgj8wOTFtusEafHKm463GSPEbQAQzROEgl3UwWOmPBxtF9Vyu88/6oWKyTy6daoqe7/bZHRvlUgieiXLxkIZHjNaDH+2Wj4SflsWOEg4vNw9Yp1KGLsj+99MVMF4fkRLd3TtzLQbRdmivJ70Gz4xpim1a37vO7vcSm8KUfRPHd1LgcgTv1axqA6dzfx0kRF/RYRCcZ1sDoN6g0xdcS8G999D4fWs5ABnDr+TJNiFWohA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJGQLsVW14rviXsg+uMKs1LtLtkXxZwwRQhaSx9OVw4=;
 b=BZCwkTIcRfRg9QARc/h52gPz48e9zTP5BUoHsK2YyXj0YWGpzZHiJPJwTZS1S/eLwjyYNioK4GBzc959vbMjqngnyHX2ZL29/+OY/WzFWs+6qjKyvknoqDI3UtH2b63f1IbKu74J5Uvgy4tFazKqsMkptlYLh2RUEDE6Z9iKerf8ZGo2UtQ0LuauexqBgE/KmcNvFZ3qIa4P86BB/Hng3nXsWAbxPvj/MQlav+yaI2OWyhjyGJzOuxt/013T+tDEJjD+mYT3OZqvOtJbU4EoiOFpXccArtu+K9B5QTh/7GSu8BdNHGun356HR5feRRgko2lBoNHVCmn8XLASJCWRXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJGQLsVW14rviXsg+uMKs1LtLtkXxZwwRQhaSx9OVw4=;
 b=g3vh8tnNSDftoFuNozq9mANgRfx41UTDlyp9yb/i2gFseIXD2mskiJp6yYRExxd3PFDbv0Xymkif6lcxs2l9cl/jHr7jVE39WIZiZbfLzEsiNKYsKGL0l+h5bUVXMHjC26dfiUGydJ1ltJjS1Fi1DewALLKjX8w5cNbzhQ0eJRM=
Received: from DB8PR04MB6826.eurprd04.prod.outlook.com (52.133.243.14) by
 DB8PR04MB6650.eurprd04.prod.outlook.com (20.179.251.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.18; Thu, 24 Oct 2019 02:38:04 +0000
Received: from DB8PR04MB6826.eurprd04.prod.outlook.com
 ([fe80::bcee:92dc:277f:6a78]) by DB8PR04MB6826.eurprd04.prod.outlook.com
 ([fe80::bcee:92dc:277f:6a78%7]) with mapi id 15.20.2387.021; Thu, 24 Oct 2019
 02:38:04 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: Leo Li <leoyang.li@nxp.com>
Subject: RE: [PATCH v9 3/3] soc: fsl: add RCPM driver
Thread-Topic: [PATCH v9 3/3] soc: fsl: add RCPM driver
Thread-Index: AQHViXs93WsdxAf3IEa22DXFaDvA7Kdo1N4AgAA8rOA=
Date: Thu, 24 Oct 2019 02:38:03 +0000
Message-ID: <DB8PR04MB6826B681CB2CC116D4ECA6D1F16A0@DB8PR04MB6826.eurprd04.prod.outlook.com>
References: <20191023082423.12569-1-ran.wang_1@nxp.com>
 <20191023082423.12569-3-ran.wang_1@nxp.com>
 <CADRPPNTwzz8M-Gi-371ROmYLrzXUAyxc+2_u6uUp0Fwd1dggLA@mail.gmail.com>
In-Reply-To: <CADRPPNTwzz8M-Gi-371ROmYLrzXUAyxc+2_u6uUp0Fwd1dggLA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ran.wang_1@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d724f0c2-989b-4262-9780-08d7582b31ed
x-ms-traffictypediagnostic: DB8PR04MB6650:|DB8PR04MB6650:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB665013824DE0D0CF4F54BC36F16A0@DB8PR04MB6650.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 0200DDA8BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(39860400002)(136003)(346002)(366004)(396003)(199004)(189003)(66556008)(14454004)(4326008)(64756008)(476003)(71200400001)(66946007)(81166006)(74316002)(66066001)(478600001)(6636002)(8676002)(6862004)(76116006)(66446008)(7416002)(81156014)(5660300002)(71190400001)(66476007)(486006)(3846002)(86362001)(11346002)(6116002)(446003)(229853002)(305945005)(6436002)(8936002)(25786009)(53546011)(54906003)(52536014)(7696005)(5024004)(14444005)(2906002)(102836004)(76176011)(55016002)(33656002)(99286004)(9686003)(256004)(186003)(26005)(7736002)(6246003)(316002)(6506007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB6650;
 H:DB8PR04MB6826.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BJyf/fbqtELDtoZRQCdCbuFiNLEuAxxynkZsnAsN2rc3JgTxdLO8pWgS9TkuyAgpbkKJViYEDzTJSKm5KQ+AoRm7esk5jclxIAWOg8XGxoAs6rPXK8jLojEh/98dfxQSGssi/c88A7kE8g/Ef9hj0+aBgLogTFoBtzBlrHXn5srDB1lfSNdzijuAWNShYgpcy0myloBWvx1OGgf/k22iVruKlbmTEIt2hIM2xpSJz6Pa64BGjPM1GA8HCKJrZO6zjf5wkWq1NYhvZ2CNggh1aEmaswv17tSGwDZGOH6WPJlJggR+urVEZTiS5LQU1YAA8vumhn9qYziUfUpZ45W6rv8mD7+ycOeCkxVTySbjXAXaCOgCiNiFmkS25dtQZHE3Maa+QvFTiulVXu4t3gdmaqyMt/zcKGg/q2+EBxc9ElI=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d724f0c2-989b-4262-9780-08d7582b31ed
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2019 02:38:03.9771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CBFm3rubJMpM3mYuMAPYFUHupIMjqJT0rN4SNYDez4Auh5gCq9jdMYj0iLLi/NwFVe74xMP4U8adO8y+LijDaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6650
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
 Anson Huang <anson.huang@nxp.com>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, lkml <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgTGVvLA0KDQoNCk9uIFRodXJzZGF5LCBPY3RvYmVyIDI0LCAyMDE5IDA2OjQ4LCBMaSBZYW5n
IHdyb3RlOg0KPiANCj4gT24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMzoyNCBBTSBSYW4gV2FuZyA8
cmFuLndhbmdfMUBueHAuY29tPiB3cm90ZToNCj4gPg0KPiA+IFRoZSBOWFAncyBRb3JJUSBQcm9j
ZXNzb3JzIGJhc2VkIG9uIEFSTSBDb3JlIGhhdmUgUkNQTSBtb2R1bGUNCj4gDQo+IEFjdHVhbGx5
IG5vdCBqdXN0IEFSTSBiYXNlZCBRb3JJUSBwcm9jZXNzb3JzIGFyZSBoYXZpbmcgUkNQTSwgUG93
ZXJQQyBiYXNlZA0KPiBRb3JJUSBTb0NzIGFsc28gaGF2ZSBSQ1BNLiAgRG9lcyB0aGlzIGRyaXZl
ciBhbHNvIHdvcmsgd2l0aCB0aGUgUG93ZXJQQyBTb0NzPw0KPiBQbGVhc2UgY2xhcmlmeSBpbiB0
aGUgY29tbWl0IG1lc3NhZ2UgYW5kIEtjb25maWcgZGVzY3JpcHRpb24uDQo+IA0KPiA+IChSdW4g
Q29udHJvbCBhbmQgUG93ZXIgTWFuYWdlbWVudCksIHdoaWNoIHBlcmZvcm1zIHN5c3RlbSBsZXZl
bCB0YXNrcw0KPiA+IGFzc29jaWF0ZWQgd2l0aCBwb3dlciBtYW5hZ2VtZW50IHN1Y2ggYXMgd2Fr
ZXVwIHNvdXJjZSBjb250cm9sLg0KPiA+DQo+ID4gVGhpcyBkcml2ZXIgZGVwZW5kcyBvbiBQTSB3
YWtldXAgc291cmNlIGZyYW1ld29yayB3aGljaCBoZWxwIHRvDQo+ID4gY29sbGVjdCB3YWtlIGlu
Zm9ybWF0aW9uLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUmFuIFdhbmcgPHJhbi53YW5nXzFA
bnhwLmNvbT4NCg0KPHNuaXA+DQoNCg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NvYy9mc2wv
S2NvbmZpZyBiL2RyaXZlcnMvc29jL2ZzbC9LY29uZmlnIGluZGV4DQo+ID4gZjlhZDhhZC4uNDkx
ODg1NiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL3NvYy9mc2wvS2NvbmZpZw0KPiA+ICsrKyBi
L2RyaXZlcnMvc29jL2ZzbC9LY29uZmlnDQo+ID4gQEAgLTQwLDQgKzQwLDEyIEBAIGNvbmZpZyBE
UEFBMl9DT05TT0xFDQo+ID4gICAgICAgICAgIC9kZXYvZHBhYTJfbWNfY29uc29sZSBhbmQgL2Rl
di9kcGFhMl9haW9wX2NvbnNvbGUsDQo+ID4gICAgICAgICAgIHdoaWNoIGNhbiBiZSB1c2VkIHRv
IGR1bXAgdGhlIE1hbmFnZW1lbnQgQ29tcGxleCBhbmQgQUlPUA0KPiA+ICAgICAgICAgICBmaXJt
d2FyZSBsb2dzLg0KPiA+ICsNCj4gPiArY29uZmlnIEZTTF9SQ1BNDQo+ID4gKyAgICAgICBib29s
ICJGcmVlc2NhbGUgUkNQTSBzdXBwb3J0Ig0KPiA+ICsgICAgICAgZGVwZW5kcyBvbiBQTV9TTEVF
UA0KPiANCj4gSWYgdGhpcyBpcyBvbmx5IGZvciBBUk0sIHByb2JhYmx5IGFkZCBtb3JlIGRlcGVu
ZGVuY3kgaGVyZT8NCg0KT0suDQogDQo+ID4gKyAgICAgICBoZWxwDQo+ID4gKyAgICAgICAgIFRo
ZSBOWFAgUW9ySVEgUHJvY2Vzc29ycyBiYXNlZCBvbiBBUk0gQ29yZSBoYXZlIFJDUE0gbW9kdWxl
DQo+ID4gKyAgICAgICAgIChSdW4gQ29udHJvbCBhbmQgUG93ZXIgTWFuYWdlbWVudCksIHdoaWNo
IHBlcmZvcm1zIGFsbCBkZXZpY2UtbGV2ZWwNCj4gPiArICAgICAgICAgdGFza3MgYXNzb2NpYXRl
ZCB3aXRoIHBvd2VyIG1hbmFnZW1lbnQsIHN1Y2ggYXMgd2FrZXVwIHNvdXJjZQ0KPiBjb250cm9s
Lg0KPiA+ICBlbmRtZW51DQoNCjxzbmlwPg0KDQo+ID4gKw0KPiA+ICsvKioNCj4gPiArICogcmNw
bV9wbV9wcmVwYXJlIC0gcGVyZm9ybXMgZGV2aWNlLWxldmVsIHRhc2tzIGFzc29jaWF0ZWQgd2l0
aA0KPiA+ICtwb3dlcg0KPiA+ICsgKiBtYW5hZ2VtZW50LCBzdWNoIGFzIHByb2dyYW1taW5nIHJl
bGF0ZWQgdG8gdGhlIHdha2V1cCBzb3VyY2UgY29udHJvbC4NCj4gPiArICogQGRldjogRGV2aWNl
IHRvIGhhbmRsZS4NCj4gPiArICoNCj4gPiArICovDQo+ID4gK3N0YXRpYyBpbnQgcmNwbV9wbV9w
cmVwYXJlKHN0cnVjdCBkZXZpY2UgKmRldikgew0KPiA+ICsgICAgICAgaW50IGksIHJldCwgaWR4
Ow0KPiA+ICsgICAgICAgdm9pZCBfX2lvbWVtICpiYXNlOw0KPiA+ICsgICAgICAgc3RydWN0IHdh
a2V1cF9zb3VyY2UgICAgKndzOw0KPiA+ICsgICAgICAgc3RydWN0IHJjcG0gICAgICAgICAgICAg
KnJjcG07DQo+ID4gKyAgICAgICBzdHJ1Y3QgZGV2aWNlX25vZGUgICAgICAqbnAgPSBkZXYtPm9m
X25vZGU7DQo+ID4gKyAgICAgICB1MzIgdmFsdWVbUkNQTV9XQUtFVVBfQ0VMTF9NQVhfU0laRSAr
IDFdOw0KPiA+ICsNCj4gPiArICAgICAgIHJjcG0gPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4g
PiArICAgICAgIGlmICghcmNwbSkNCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7
DQo+ID4gKw0KPiA+ICsgICAgICAgYmFzZSA9IHJjcG0tPmlwcGRleHBjcl9iYXNlOw0KPiA+ICsg
ICAgICAgaWR4ID0gd2FrZXVwX3NvdXJjZXNfcmVhZF9sb2NrKCk7DQo+ID4gKw0KPiA+ICsgICAg
ICAgLyogQmVnaW4gd2l0aCBmaXJzdCByZWdpc3RlcmVkIHdha2V1cCBzb3VyY2UgKi8NCj4gPiAr
ICAgICAgIGZvcl9lYWNoX3dha2V1cF9zb3VyY2Uod3MpIHsNCj4gPiArDQo+ID4gKyAgICAgICAg
ICAgICAgIC8qIHNraXAgb2JqZWN0IHdoaWNoIGlzIG5vdCBhdHRhY2hlZCB0byBkZXZpY2UgKi8N
Cj4gPiArICAgICAgICAgICAgICAgaWYgKCF3cy0+ZGV2IHx8ICF3cy0+ZGV2LT5wYXJlbnQpDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+ID4gKw0KPiA+ICsgICAgICAg
ICAgICAgICByZXQgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkod3MtPmRldi0+cGFy
ZW50LA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImZzbCxyY3BtLXdha2V1
cCIsIHZhbHVlLA0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmNwbS0+d2Fr
ZXVwX2NlbGxzICsgMSk7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICAvKiAgV2FrZXVwIHNv
dXJjZSBzaG91bGQgcmVmZXIgdG8gY3VycmVudCByY3BtIGRldmljZSAqLw0KPiA+ICsgICAgICAg
ICAgICAgICBpZiAocmV0IHx8IChucC0+cGhhbmRsZSAhPSB2YWx1ZVswXSkpIHsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBwcl9kZWJ1ZygiJXMgZG9lc24ndCByZWZlciB0byB0aGlzIHJj
cG1cbiIsDQo+ID4gKyB3cy0+bmFtZSk7DQo+IA0KPiBJIGFncmVlIHdpdGggUmFmYWVsIHRoYXQg
dGhpcyBsb29rcyBhIGxpdHRsZSBiaXQgd2VpcmQuDQoNCk9LLCBsZXQgbWUgcmVtb3ZlIHRoaXMg
cHJpbnQgaW4gbmV4dCB2ZXJzaW9uLg0KDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29u
dGludWU7DQo+ID4gKyAgICAgICAgICAgICAgIH0NCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAg
IC8qIFByb3BlcnR5ICIjZnNsLHJjcG0td2FrZXVwLWNlbGxzIiBvZiByY3BtIG5vZGUgZGVmaW5l
cyB0aGUNCj4gPiArICAgICAgICAgICAgICAgICogbnVtYmVyIG9mIElQUERFWFBDUiByZWdpc3Rl
ciBjZWxscywgYW5kICJmc2wscmNwbS13YWtldXAiDQo+ID4gKyAgICAgICAgICAgICAgICAqIG9m
IHdha2V1cCBzb3VyY2UgSVAgY29udGFpbnMgYW4gaW50ZWdlciBhcnJheTogPHBoYW5kbGUgdG8N
Cj4gPiArICAgICAgICAgICAgICAgICogUkNQTSBub2RlLCBJUFBERVhQQ1IwIHNldHRpbmcsIElQ
UERFWFBDUjEgc2V0dGluZywNCj4gPiArICAgICAgICAgICAgICAgICogSVBQREVYUENSMiBzZXR0
aW5nLCBldGM+Lg0KPiA+ICsgICAgICAgICAgICAgICAgKg0KPiA+ICsgICAgICAgICAgICAgICAg
KiBTbyB3ZSB3aWxsIGdvIHRob3VnaHQgdGhlbSBhbmQgZG8gcHJvZ3JhbW1pbmcgYWNjb3Jkbmds
eS4NCj4gPiArICAgICAgICAgICAgICAgICovDQo+ID4gKyAgICAgICAgICAgICAgIGZvciAoaSA9
IDA7IGkgPCByY3BtLT53YWtldXBfY2VsbHM7IGkrKykgew0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHUzMiB0bXAgPSB2YWx1ZVtpICsgMV07DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgdm9pZCBfX2lvbWVtICphZGRyZXNzID0gYmFzZSArIGkgKiA0Ow0KPiA+ICsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoIXRtcCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnRpbnVlOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAv
KiBXZSBjYW4gb25seSBPUiByZWxhdGVkIGJpdHMgKi8NCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBpZiAocmNwbS0+bGl0dGxlX2VuZGlhbikgew0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdG1wIHw9IGlvcmVhZDMyKGFkZHJlc3MpOw0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgaW93cml0ZTMyKHRtcCwgYWRkcmVzcyk7DQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHRtcCB8PSBpb3JlYWQzMmJlKGFkZHJlc3MpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW93cml0ZTMyYmUodG1wLCBhZGRyZXNzKTsNCj4gPiArICAgICAgICAgICAg
ICAgICAgICAgICB9DQo+IA0KPiBDYW4gd2UgZG8gcmVhZCBvbmNlIGF0IHRoZSBiZWdpbm5pbmcg
YW5kIHdyaXRlIG9uY2UgYXQgdGhlIGVuZCwgaW5zdGVhZCBvZg0KPiBkb2luZyBJTyByZWFkL3dy
aXRlIGZvciBldmVyeSB3YWtldXAgc291cmNlPw0KDQpTdXJlLCBidXQgYW5vdGhlciBsb29wIG1p
Z2h0IG5lZWQgdG8gYmUgYWRkZWQgYWZ0ZXIgdGhlIG9uZSBvZiB3YWtldXAgc291cmNlIHdhbGsN
CnRocm91Z2gsIHRvIHByb2dyYW0gYWxsIElQUERFWFBDUiByZWdpc3RlcnMuIElzIHRoYXQgT0s/
DQoNClJlZ2FyZHMsDQpSYW4NCg0KIA0KPiA+ICsgICAgICAgICAgICAgICB9DQo+ID4gKyAgICAg
ICB9DQo+ID4gKw0KPiA+ICsgICAgICAgd2FrZXVwX3NvdXJjZXNfcmVhZF91bmxvY2soaWR4KTsN
Cj4gPiArDQo+ID4gKyAgICAgICByZXR1cm4gMDsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGlj
IGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIHJjcG1fcG1fb3BzID0gew0KPiA+ICsgICAgICAgLnBy
ZXBhcmUgPSAgcmNwbV9wbV9wcmVwYXJlLA0KPiA+ICt9Ow0KPiA+ICsNCg==
