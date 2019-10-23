Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D98CE16B6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 11:54:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ym1Z3mP6zDqPF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 20:54:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe0d::62c;
 helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.b="FX+z9mTu"; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ylzh4qJqzDqDF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 20:52:45 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVCz2GQOSskeQvdbXQMwhwuJb0Hu7C4GvkT9Y7GIZut6ADMH8f6YG9bxxPrg7vixTOBke/aMRUlL1L/k6n4teEbSpIckHkuNXsTGoQQUaYCnAYzU/t8/Wi0TpCGKykfAk8MBx3Fi81Gj4YgpIqZm8zOlPOty1TuZv6bbkFVkkZ9GjIBM8xHfXiTp96Hzm7nC81A/3KzhT0vLUIgJOqLgia4JS3jscg9GD4g42LnrdQCFn1bSu/dHdxH7h4kLh/2OrxajuPng8rGoHSNFAp6Xk/lfSnEteGZxojLd587CkifopDmfDj0Hg+lR1rUNPk0Pgb6CymXXTTO31L+nR7S3Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+zkCo3fe9gLsE7BLQxy++PAwztFcHXKQ66Z2Q/zYIA=;
 b=ULpLFdS+PITwuoJXijhiNcgY7maV78LiEouU1wPluPytDutNlcHpNrPEOoexwGz3P6kLkVEDAoBizoiIHy+oLbFwYdFN/zP9OFvD4ESvam/g3sY53CNFXCFdMw2i+YqXFDNwS+vgw+S+tmr3XzuK7YYVRZvbX7GSh1NaxFhZDQ3Dkb4LAQ9adUVmrSgLPnrrp9hvaQ1O1sWLAv+DTOb9N9hSKAzU2UwwX0bsj9XsbJyqiQK0+Lm0Mwa7jg2ZXK1W3ZKpLkNGEhZzZ/NO6U63tb3il8OUCFOJt43YGtpze76DWbTeSBDHJlR4+bWR/6k4bACeUJMUq3wPPeuTedy+yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+zkCo3fe9gLsE7BLQxy++PAwztFcHXKQ66Z2Q/zYIA=;
 b=FX+z9mTuCoh/q1jVtTsODks52xjJr/tSewFQCae4Ou10WjQU5026oD5/ToaZd8cs0JSENnf9i0KDvmkCcNT44ORFPpd8wt01cJtyJNvf86vA99HGpEjWWI47CkkktnDxBXc+dQ1QQ+O0+XsFvzWUv1kw3yY1hILu9FivZ0THQHc=
Received: from DB8PR04MB6826.eurprd04.prod.outlook.com (52.133.243.14) by
 DB8PR04MB7002.eurprd04.prod.outlook.com (52.133.242.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Wed, 23 Oct 2019 09:52:36 +0000
Received: from DB8PR04MB6826.eurprd04.prod.outlook.com
 ([fe80::bcee:92dc:277f:6a78]) by DB8PR04MB6826.eurprd04.prod.outlook.com
 ([fe80::bcee:92dc:277f:6a78%7]) with mapi id 15.20.2387.021; Wed, 23 Oct 2019
 09:52:36 +0000
From: Ran Wang <ran.wang_1@nxp.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: RE: [PATCH v9 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Thread-Topic: [PATCH v9 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
Thread-Index: AQHViXs7UdarjtV7pUSRto5BtluIHadn72mAgAAD6VA=
Date: Wed, 23 Oct 2019 09:52:35 +0000
Message-ID: <DB8PR04MB68261D8B18D39DF170ECC7C8F16B0@DB8PR04MB6826.eurprd04.prod.outlook.com>
References: <20191023082423.12569-1-ran.wang_1@nxp.com>
 <CAJZ5v0jvQaREhg94f-COdYTt58gMP7YvqdEH0oYiS9Z56tg-XQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jvQaREhg94f-COdYTt58gMP7YvqdEH0oYiS9Z56tg-XQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ran.wang_1@nxp.com; 
x-originating-ip: [92.121.36.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f046a4d1-3e53-4029-56e8-08d7579ebb9b
x-ms-traffictypediagnostic: DB8PR04MB7002:|DB8PR04MB7002:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB7002FE0A224980C1063BE2CFF16B0@DB8PR04MB7002.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 019919A9E4
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(396003)(346002)(39860400002)(366004)(199004)(189003)(14454004)(486006)(4326008)(476003)(54906003)(66446008)(66066001)(11346002)(446003)(7696005)(8676002)(2906002)(76176011)(7416002)(81156014)(81166006)(5660300002)(6916009)(6116002)(52536014)(8936002)(3846002)(74316002)(99286004)(64756008)(66476007)(71190400001)(71200400001)(102836004)(26005)(6506007)(53546011)(33656002)(7736002)(186003)(66556008)(305945005)(25786009)(316002)(76116006)(66946007)(229853002)(86362001)(6436002)(14444005)(478600001)(9686003)(55016002)(6246003)(256004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB8PR04MB7002;
 H:DB8PR04MB6826.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4dqyDE5/H37BxgjQxq2YG1+8REOLL3UDHOz3MCLBEWBSwZCqa9rgl/tNzajgG/kXeupZzSgTa2itTQ7No4IIzbSq8tEfd9ezaP9GpIlB0+O7H5fbyBnEcrBG567V2M4zTVpKixkDxT1fGxjqPiRpBqjgkUB5nAbWub2bs4Q9mS7jG03El2O1e/1GzUj26I4bsCwUfMvvWNGTKmh1CkHwuYaN+MizPqu8mwOx/+dryUMIkCs6PHBFH15Sz5ZcFDthRBWAfKggZ54F+6hOC4ps2GzYNFSvC8tw5vd5mjxcoC+KWG07RQdgMmLYTjoph94Re40CA9jyjAKrx+WQ3VWQbZPAbHlDoear6gQLXGi23AiKztImjEdAxXIwlrRsrYPZX+jOkMRG7I6gLe5W3xVkVaumaDgozlNq+81RFQu6La6hnmhPU5RvufgPK/aVb+zf
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f046a4d1-3e53-4029-56e8-08d7579ebb9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2019 09:52:35.8948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uQplgfQzr0ExExL1A8eUXQMtCPSfucu1oImQZ2W6myyJmd/j8aBHcG+quo3eL08r296lVA4EdBIYSbmk2ZTMCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7002
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
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

SGkgUmFmYWVsLA0KDQpPbiBXZWRuZXNkYXksIE9jdG9iZXIgMjMsIDIwMTkgMTc6MDcsIFJhZmFl
bCBKLiBXeXNvY2tpIHdyb3RlOg0KPiANCj4gT24gV2VkLCBPY3QgMjMsIDIwMTkgYXQgMTA6MjQg
QU0gUmFuIFdhbmcgPHJhbi53YW5nXzFAbnhwLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBTb21lIHVz
ZXIgbWlnaHQgd2FudCB0byBnbyB0aHJvdWdoIGFsbCByZWdpc3RlcmVkIHdha2V1cCBzb3VyY2Vz
IGFuZA0KPiA+IGRvaW5nIHRoaW5ncyBhY2NvcmRpbmdseS4gRm9yIGV4YW1wbGUsIFNvQyBQTSBk
cml2ZXIgbWlnaHQgbmVlZCB0byBkbw0KPiA+IEhXIHByb2dyYW1taW5nIHRvIHByZXZlbnQgcG93
ZXJpbmcgZG93biBzcGVjaWZpYyBJUCB3aGljaCB3YWtldXANCj4gPiBzb3VyY2UgZGVwZW5kaW5n
IG9uLiBTbyBhZGQgdGhpcyBBUEkgdG8gaGVscCB3YWxrIHRocm91Z2ggYWxsDQo+ID4gcmVnaXN0
ZXJlZCB3YWtldXAgc291cmNlIG9iamVjdHMgb24gdGhhdCBsaXN0IGFuZCByZXR1cm4gdGhlbSBv
bmUgYnkgb25lLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUmFuIFdhbmcgPHJhbi53YW5nXzFA
bnhwLmNvbT4NCj4gPiBUZXN0ZWQtYnk6IExlb25hcmQgQ3Jlc3RleiA8bGVvbmFyZC5jcmVzdGV6
QG54cC5jb20+DQo+IA0KPiBPSywgdGhhbmtzIGZvciBtYWtpbmcgYWxsIG9mIHRoZSByZXF1ZXN0
ZWQgY2hhbmdlczoNCg0KVGhhbmtzIGZvciB5b3VyIHBhdGllbnQgZGlyZWN0aW9uIDopDQpBY3R1
YWxseSBMZW8gYW5kIG1lIHBsYW5lZCB0byBoYXZlIGEgZjJmIGRpc2N1c3Npb24gd2l0aCB5b3Ug
YWJvdXQgdGhpcyBwYXRjaCBvbg0KTFBDIDIwMTkgYnV0IHVuZm9ydHVuYXRlbHkgbWlzc2VkIHRo
ZSBvcHBvcnR1bml0eSBmaW5hbGx5ICh2NiByZXZpZXcgd2FzDQpwZW5kaW5nIGF0IHRpbWUpLg0K
IA0KPiBSZXZpZXdlZC1ieTogUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbC5qLnd5c29ja2lAaW50
ZWwuY29tPg0KPiANCj4gYW5kIHBsZWFzZSBmZWVsIGZyZWUgdG8gcHVzaCB0aGlzIHRocm91Z2gg
dGhlIGFwcHJvcHJpYXRlIGFyY2gvcGxhdGZvcm0gdHJlZS4NCg0KWWVzLCB3ZSB3aWxsIGRvIHRo
aXMgbGF0ZXIuDQoNCj4gQWx0ZXJuYXRpdmVseSwgcGxlYXNlIGxldCBtZSBrbm93IGlmIHlvdSB3
YW50IG1lIHRvIHRha2UgdGhpcyBzZXJpZXMsIGJ1dCB0aGVuIEkNCj4gbmVlZCBhbiBBQ0sgZnJv
bSB0aGUgYXBwcm9wcmlhdGUNCj4gbWFpbnRhaW5lcihzKSBvbiBwYXRjaCAzLg0KDQpUaGFua3Mg
YWdhaW4sIEkgd2lsbCB3YWl0IExlbydzIGNvbW1lbnQgb24gcGF0Y2ggMy4NCg0KUmVnYXJkcywN
ClJhbg0KDQo=
