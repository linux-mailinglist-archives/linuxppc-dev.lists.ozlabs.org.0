Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E13F27B8EF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 02:36:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0gS16JSczDqLg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 10:36:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.14.77; helo=eur01-ve1-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=L07kyEvJ; 
 dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140077.outbound.protection.outlook.com [40.107.14.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0gPt6WVDzDqBm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 10:34:40 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FUNsIAhyrh+++xScjkxSjR3AOu79VNRo0fUMEFxNFhI/8Jrq6fIg2IR+wP/eWm50vsKDTV00VAvtQtwVsrSaaRL1jiZOjrRzlCQkYe/sxAmj8+jRpWi25YrEOYSCKRsAIbP6J6qbWTeIxGiaEk1eVxyqw03OQ/N4f0eantRwj+KDyFx4JO36uT+QoH/osD36eHRlJNICODco92vK5gAaPh3nwJvsWGYUKUEwHSjYQlt9kuek2fyI6jDf2PZXnSXihOfcG5Ma8NU3uNddaGcCI2aoSQ5o1QeWr7q0h7+pbkS+FagKk0v2Y4rznOWengkvcck6wRH+XTSnA7C1WIM7RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoNrg5319WqQ0zzlWjDD68rp354PUahorhMYHNhnbBw=;
 b=LVNaVbJR5n+mbwerI4iS6MxPcHx9kdbymVtGxTK74g1A7+Y28uLZjIhCpgxEyy/niwzxAJBrc7LY9olGEqpEF3e80BkymD1Uw0OE6YdslJcUvYmoRCmDJIJmh+NMhdhuXEnuW4eTd6HEkGCSebvRezKbdGeXEah0QRLpn6AhmPIPNrJ5FdvO2/BER6PA3SdFN7iP1GFSW5VNaw81YC16Ayl+kqQyltH50+oEUUBfgevWIwjtVk9XL8Ps1Tx/1fMM5E2sgir8ZxGGubFVJlX7n9uErM6oWVHDWkKpnJTFIJh12VC0uwZItl9fkdWrXu/yR4oSjwurmOwWeZt+WvApPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FoNrg5319WqQ0zzlWjDD68rp354PUahorhMYHNhnbBw=;
 b=L07kyEvJwizLsRM5zo+Uuh+4ZFkYZ1mhJmxWfojY1HXgb1hjxQBYnv7xOz+Ao+TNHrU0YCmvMMKK1L82Snd8f30Rm+hDRSHvZ6/gav0KvvyBeCMwlU9CeC9xC3PGWrVg53s9CS3usSjgpdNvCP3OFEvyKZoP2Tsttr/iBlLNhAg=
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com (2603:10a6:20b:96::28)
 by AM6PR04MB4038.eurprd04.prod.outlook.com (2603:10a6:209:44::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3412.25; Tue, 29 Sep
 2020 00:34:34 +0000
Received: from AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec]) by AM6PR04MB5413.eurprd04.prod.outlook.com
 ([fe80::1953:c81a:cca2:60ec%7]) with mapi id 15.20.3412.029; Tue, 29 Sep 2020
 00:34:34 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: Rob Herring <robh@kernel.org>
Subject: RE: [PATCH 1/5] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr1-alt-addr' property
Thread-Topic: [PATCH 1/5] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr1-alt-addr' property
Thread-Index: AQHWjAMgWpwpgcZEfEity8vaUHwtLKl1i48AgABEr6CACFYpgIAAsbmQ
Date: Tue, 29 Sep 2020 00:34:34 +0000
Message-ID: <AM6PR04MB5413F165301E03A8C1FC1D8FF1320@AM6PR04MB5413.eurprd04.prod.outlook.com>
References: <20200916081831.24747-1-ran.wang_1@nxp.com>
 <20200923023234.GA3751572@bogus>
 <AM6PR04MB5413BB2F8D044B2312DAEC4FF1380@AM6PR04MB5413.eurprd04.prod.outlook.com>
 <CAL_Jsq+uzkr7CcvwQTe5vhpMPtdqL9v4EeqH5yZjMoT=JrDtDQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+uzkr7CcvwQTe5vhpMPtdqL9v4EeqH5yZjMoT=JrDtDQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.73]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e74f2d12-6373-41d7-3565-08d8640f7073
x-ms-traffictypediagnostic: AM6PR04MB4038:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB4038E71E8B227B1EA6A4BBF4F1320@AM6PR04MB4038.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zBXRUOYbpwpgAu1fYDrixfVD7Rw6BweL2BTvHzQQFvBLKRv+UoI7Pq3eDdpTd4go6/02CWN4qzGgGz77HHCjLzKjyYRToMFdO5bnpA4V1R9N7+MjWMUgevXfxtTZDh8LJmLHh0C9SrARC+NJMCaKGzMJaWdqT95coWKUpTwAMtw0VacEAqIFKPlVZKoitRgSu24zPbTKPHTx7mfjos22KCl0Gb08jLVxVmWBWKB2M4uWkIhy7lL5IcYvI0bTBdIYlkaz+j3x0lqLNqt5gpGfKD/GmUQnPMSKjb2/N1BZ4Heq0Qy66Ehl7yyQ3/u14827WnTk9yqKNoBENnPpCYaDNiY5LTVUo3Z/kW30YsWVoL7NOYHKNIs45M58NaUeJrsi
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5413.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(8936002)(4326008)(83380400001)(8676002)(6916009)(55016002)(9686003)(53546011)(6506007)(26005)(7696005)(186003)(316002)(54906003)(478600001)(33656002)(52536014)(71200400001)(64756008)(66446008)(66476007)(86362001)(5660300002)(66556008)(76116006)(66946007)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: ZPRTO+cQeJPWIAAdf50sdvAJYupTcAFc7bBphmitqPxM8E4drK4jtC4UYD4Te7cTt8R2Rb775kgKfu483cjK1walqXedNTtrBejhUkpT0n5X1b2BQ/GW2+Jl4JvDDqeFNXQU3piP7BFRioaTPR1sWS1LIoBh5Lms8bb1NSQ5TFbOLUyp0fJITyBiDhyq/KoEE0DDha6NhmMrRbyIGKA2bvWMqBkM9qqJqE24TQ6tiEsyz1Esl17FAunSaSPi9llYkuY4s77sQpPLIS37LXIc4H+ftbsMdwuh0yjfVYk9gWM8lCU2BF9Wu1/ELevzKf1Q3hes27GfGGHIecMEa0VIHnUhWIacggJUnHVbhH7f3SQxvwXTJn+0synBeNQVtE1eOPekqfAD4RAn8iYbwulEjL0ACn2H7UdTzN/IYjkrAA/g1ZBDO/lOMoPQ1FCRUDs4lkSnp+xKAdMmElvZqx6IJjDJC+/hXdgYuexYJm1tOLlbPmJPZpYIcBIesBHfQ0+8LCWpNxH+27n5YYFp3vH266RMWAvCdtSWMWbsF54RNtsCYHmYghKqyk3rXnML7pO7WoW7QmfaE5TE5MGGbess4YPTbB7y9UD/0J28kFovyP3zhHySspjsTeZ9kmwdBGtyIMbsZWbl2T/N3TnrPMAouQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5413.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e74f2d12-6373-41d7-3565-08d8640f7073
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2020 00:34:34.6261 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GHZVOk0CrcQElpiUde73gMQMYbxcQsjJyHC4IbJMKLYI1GuobA5Xe7SA0pqecbXeXXjMWET30wIL2YHNUvhyFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4038
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Biwen Li <biwen.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgUm9iLA0KDQpPbiBNb25kYXksIFNlcHRlbWJlciAyOCwgMjAyMCA5OjU3IFBNLCBSb2IgSGVy
cmluZyB3cm90ZToNCj4gDQo+IE9uIFdlZCwgU2VwIDIzLCAyMDIwIGF0IDE6NDQgQU0gUmFuIFdh
bmcgPHJhbi53YW5nXzFAbnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIaSBSb2IsDQo+ID4NCj4g
PiBPbiBXZWRuZXNkYXksIFNlcHRlbWJlciAyMywgMjAyMCAxMDozMyBBTSwgUm9iIEhlcnJpbmcg
d3JvdGU6DQo+ID4gPg0KPiA+ID4gT24gV2VkLCBTZXAgMTYsIDIwMjAgYXQgMDQ6MTg6MjdQTSAr
MDgwMCwgUmFuIFdhbmcgd3JvdGU6DQo+ID4gPiA+IEZyb206IEJpd2VuIExpIDxiaXdlbi5saUBu
eHAuY29tPg0KPiA+ID4gPg0KPiA+ID4gPiBUaGUgJ2ZzbCxpcHBkZXhwY3IxLWFsdC1hZGRyJyBw
cm9wZXJ0eSBpcyB1c2VkIHRvIGhhbmRsZSBhbiBlcnJhdGENCj4gPiA+ID4gQS0wMDg2NDYgb24g
TFMxMDIxQQ0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaXdlbiBMaSA8Yml3ZW4u
bGlAbnhwLmNvbT4NCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogUmFuIFdhbmcgPHJhbi53YW5nXzFA
bnhwLmNvbT4NCj4gPiA+ID4gLS0tDQo+ID4gPiA+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3Mvc29jL2ZzbC9yY3BtLnR4dCB8IDE5DQo+ID4gPiA+ICsrKysrKysrKysrKysrKysr
KysNCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspDQo+ID4gPiA+DQo+
ID4gPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc29j
L2ZzbC9yY3BtLnR4dA0KPiA+ID4gPiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb2MvZnNsL3JjcG0udHh0DQo+ID4gPiA+IGluZGV4IDVhMzM2MTkuLjFiZTU4YTMgMTAwNjQ0
DQo+ID4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb2MvZnNs
L3JjcG0udHh0DQo+ID4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9zb2MvZnNsL3JjcG0udHh0DQo+ID4gPiA+IEBAIC0zNCw2ICszNCwxMSBAQCBDaGFzc2lzIFZl
cnNpb24gICAgICAgICAgRXhhbXBsZSBDaGlwcw0KPiA+ID4gPiAgT3B0aW9uYWwgcHJvcGVydGll
czoNCj4gPiA+ID4gICAtIGxpdHRsZS1lbmRpYW4gOiBSQ1BNIHJlZ2lzdGVyIGJsb2NrIGlzIExp
dHRsZSBFbmRpYW4uIFdpdGhvdXQgaXQgUkNQTQ0KPiA+ID4gPiAgICAgd2lsbCBiZSBCaWcgRW5k
aWFuIChkZWZhdWx0IGNhc2UpLg0KPiA+ID4gPiArIC0gZnNsLGlwcGRleHBjcjEtYWx0LWFkZHIg
OiBUaGUgcHJvcGVydHkgaXMgcmVsYXRlZCB0byBhIGhhcmR3YXJlIGlzc3VlDQo+ID4gPiA+ICsg
ICBvbiBTb0MgTFMxMDIxQSBhbmQgb25seSBuZWVkZWQgb24gU29DIExTMTAyMUEuDQo+ID4gPiA+
ICsgICBNdXN0IGluY2x1ZGUgMiBlbnRyaWVzOg0KPiA+ID4gPiArICAgVGhlIGZpcnN0IGVudHJ5
IG11c3QgYmUgYSBsaW5rIHRvIHRoZSBTQ0ZHIGRldmljZSBub2RlLg0KPiA+ID4gPiArICAgVGhl
IDJuZCBlbnRyeSBtdXN0IGJlIG9mZnNldCBvZiByZWdpc3RlciBJUFBERVhQQ1IxIGluIFNDRkcu
DQo+ID4gPg0KPiA+ID4gWW91IGRvbid0IG5lZWQgYSBEVCBjaGFuZ2UgZm9yIHRoaXMuIFlvdSBj
YW4gZmluZCBTQ0ZHIG5vZGUgYnkgaXRzDQo+ID4gPiBjb21wYXRpYmxlIHN0cmluZyBhbmQgdGhl
biB0aGUgb2Zmc2V0IHNob3VsZCBiZSBrbm93biBnaXZlbiB0aGlzIGlzc3VlIGlzDQo+IG9ubHkg
b24gMSBTb0MuDQo+ID4NCj4gPiBEaWQgeW91IG1lYW4gdGhhdCBSQ1BNIGRyaXZlciBqdXN0IHRv
IGFjY2VzcyBJUFBERVhQQ1IxIHNoYWRvd2VkDQo+ID4gcmVnaXN0ZXIgaW4gU0NGRyBkaXJlY3Rs
eSB3aXRob3V0IGZldGNoaW5nIGl0J3Mgb2Zmc2V0IGluZm8uIGZyb20gRFQ/DQo+IA0KPiBZZXMu
IFRoZXJlJ3Mgb25seSAxIHBvc3NpYmxlIHZhbHVlIG9mIHRoZSBvZmZzZXQgYmVjYXVzZSB0aGVy
ZSdzIG9ubHkgb25lIFNvQywgc28NCj4gdGhlIGRyaXZlciBjYW4gaGFyZGNvZGUgdGhlIG9mZnNl
dC4gQW5kIEkgYXNzdW1lIHRoZXJlJ3Mgb25seSBvbmUgU0NGRyBub2RlLA0KPiBzbyB5b3UgY2Fu
IGZpbmQgaXQgYnkgaXRzIGNvbXBhdGlibGUgc3RyaW5nIChvZl9maW5kX2NvbXBhdGlibGVfbm9k
ZSkuDQoNCkdvdCBpdCwgbGV0IG1lIHVwZGF0ZSB0aGlzIGluIG5leHQgdmVyc2lvbiwgdGhhbmsg
eW91Lg0KDQpSZWdhcmRzLA0KUmFuDQoNCj4gUm9iDQo=
