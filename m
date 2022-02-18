Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C57A4BB474
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 09:42:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0QDF6bvDz3cXV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 19:42:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0QCj3FBCz3cBq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 19:41:34 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-315-zKRYnzO6OK2WH4oQHyHOLw-1; Fri, 18 Feb 2022 08:41:30 +0000
X-MC-Unique: zKRYnzO6OK2WH4oQHyHOLw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Fri, 18 Feb 2022 08:41:28 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Fri, 18 Feb 2022 08:41:28 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Masahiro Yamada' <masahiroy@kernel.org>
Subject: RE: [PATCH net v3] net: Force inlining of checksum functions in
 net/checksum.h
Thread-Topic: [PATCH net v3] net: Force inlining of checksum functions in
 net/checksum.h
Thread-Index: AQHYI/ioJk+yETn/QkyN152xjKaZ96yXvR4wgAAXuo+AAALtMIAAE/+AgAAGkICAAAzxAIAA/QGA
Date: Fri, 18 Feb 2022 08:41:28 +0000
Message-ID: <d5ea3d1cb4284c02b8ecdb0f7b737f7f@AcuMS.aculab.com>
References: <978951d76d8cb84bab347c7623bc163e9a038452.1645100305.git.christophe.leroy@csgroup.eu>
 <35bcd5df0fb546008ff4043dbea68836@AcuMS.aculab.com>
 <d38e5e1c-29b6-8cc6-7409-d0bdd5772f23@csgroup.eu>
 <9b8ef186-c7fe-822c-35df-342c9e86cc88@csgroup.eu>
 <3c2b682a7d804b5e8749428b50342c82@AcuMS.aculab.com>
 <CAK7LNASWTJ-ax9u5yOwHV9vHCBAcQTazV-oXtqVFVFedOA0Eqw@mail.gmail.com>
 <2e38265880db45afa96cfb51223f7418@AcuMS.aculab.com>
 <CAK7LNASvBLLWMa+kb5eGJ6vpSqob_dBUxwCnpHZfL-spzRG7qA@mail.gmail.com>
In-Reply-To: <CAK7LNASvBLLWMa+kb5eGJ6vpSqob_dBUxwCnpHZfL-spzRG7qA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogTWFzYWhpcm8gWWFtYWRhDQo+IFNlbnQ6IDE3IEZlYnJ1YXJ5IDIwMjIgMTc6MjcNCj4g
DQo+IE9uIEZyaSwgRmViIDE4LCAyMDIyIGF0IDE6NDkgQU0gRGF2aWQgTGFpZ2h0IDxEYXZpZC5M
YWlnaHRAYWN1bGFiLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBGcm9tOiBNYXNhaGlybyBZYW1hZGEN
Cj4gPiA+IFNlbnQ6IDE3IEZlYnJ1YXJ5IDIwMjIgMTY6MTcNCj4gPiAuLi4NCj4gPiA+IE5vLiAg
Tm90IHRoYXQgb25lLg0KPiA+ID4NCj4gPiA+IFRoZSBjb21taXQgeW91IHByZXN1bWFibHkgd2Fu
dCB0byByZXZlcnQgaXM6DQo+ID4gPg0KPiA+ID4gYTc3MWYyYjgyYWEyICgiW1BBVENIXSBBZGQg
YSBzZWN0aW9uIGFib3V0IGlubGluaW5nIHRvDQo+ID4gPiBEb2N1bWVudGF0aW9uL0NvZGluZ1N0
eWxlIikNCj4gPiA+DQo+ID4gPiBUaGlzIGlzIG5vdyByZWZlcnJlZCB0byBhcyAiX19hbHdheXNf
aW5saW5lIGRpc2Vhc2UiLCB0aG91Z2guDQo+ID4NCj4gPiBUaGF0IGRlc2NyaXB0aW9uIGlzIGxh
cmdlbHkgZmluZS4NCj4gPg0KPiA+IEluYXBwcm9wcmlhdGUgJ2lubGluZScgb3VnaHQgdG8gYmUg
cmVtb3ZlZC4NCj4gPiBUaGVuICdpbmxpbmUnIG1lYW5zIC0gJ3JlYWxseSBkbyBpbmxpbmUgdGhp
cycuDQo+IA0KPiANCj4gWW91IGNhbm5vdCBjaGFuZ2UgInN0YXRpYyBpbmxpbmUiIHRvICJzdGF0
aWMiDQo+IGluIGhlYWRlciBmaWxlcy4NCg0KWW91J2QgbmVlZCBzb21lICdtYWdpY2FyeScgdG8g
Z2V0IGFuIGV4dGVybiBleGNlcHQgZm9yIGEgc3BlY2lhbA0KaW5jbHVkZSB0aGF0IGdlbmVyYXRl
ZCB0aGUgdmlzaWJsZSBmdW5jdGlvbi4NCkl0IGhhcyBiZWVuIGRvbmUuDQoNCj4gSWYgICJzdGF0
aWMgaW5saW5lIiBtZWFudCBfX2Fsd2F5c19pbmxpbmUsDQo+IHRoZXJlIHdvdWxkIGJlIG5vIHdh
eSB0byBuZWdhdGUgaXQuDQo+IFRoYXQncyB3aHkgd2UgbmVlZCBib3RoIGlubGluZSBhbmQgX19h
bHdheXNfaW5saW5lLg0KDQpJJ2QgZ28gdGhlIG90aGVyIHdheSwgJ2lubGluZScgYW5kICdpbmxp
bmVfZm9yX2NvZGVfYmxvYXQnDQoob3IgbWF5YmUgaW5saW5lX2Zvcl9zcGVlZCkuDQpNdWNoIHRo
ZSBzYW1lIGFzIHRoZSBub2lubGluZSdzIHRvIHN0b3Agc3RhY2sgYmxvYXQuDQoNCglEYXZpZA0K
DQotDQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFy
bSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAo
V2FsZXMpDQo=

