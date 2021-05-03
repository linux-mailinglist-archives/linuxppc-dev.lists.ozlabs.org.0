Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A71837152C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 14:21:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYhsW524zz301s
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 22:21:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.85.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYhs522vsz2yQy
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 22:20:54 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-158-eNDpXcXQN7-pDpflGzOLyg-1; Mon, 03 May 2021 13:20:47 +0100
X-MC-Unique: eNDpXcXQN7-pDpflGzOLyg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Mon, 3 May 2021 13:20:46 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Mon, 3 May 2021 13:20:46 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@arndb.de>, Matthew Wilcox <willy@infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Segher Boessenkool
 <segher@kernel.crashing.org>, Joe Perches <joe@perches.com>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Linux Kbuild mailing list
 <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, "Linux Doc
 Mailing List" <linux-doc@vger.kernel.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Miguel Ojeda <ojeda@kernel.org>, Paul Mackerras
 <paulus@samba.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] Raise the minimum GCC version to 5.2
Thread-Topic: [PATCH] Raise the minimum GCC version to 5.2
Thread-Index: AQHXP/5biZEe8rdCR0StYtnq1hyuzarRqk5g
Date: Mon, 3 May 2021 12:20:45 +0000
Message-ID: <fc0c7c092f274ab8b760b3c897830347@AcuMS.aculab.com>
References: <20210501151538.145449-1-masahiroy@kernel.org>
 <CANiq72k1hB3X6+Nc_iu=f=BoB-F9JW2j_B4ZMcv8_UpW5QQ2Og@mail.gmail.com>
 <3943bc020f6227c8801907317fc113aa13ad4bad.camel@perches.com>
 <20210502183030.GF10366@gate.crashing.org>
 <81a926a3bdb70debe3ae2b13655ea8d249fb9991.camel@perches.com>
 <20210502203253.GH10366@gate.crashing.org>
 <CAHk-=wjGJskk5EwnDCccs6DcLytE2yx76+P_W-n1-B5zq0M3KA@mail.gmail.com>
 <20210502223007.GZ1847222@casper.infradead.org>
 <YI+nhMcPSTs/5Ydp@ada-deb-carambola.ifak-system.com>
 <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
In-Reply-To: <CAK8P3a0kV4ZfMEFh0DcMDjXqxA0yhj8a8CL-YFGV6B4pszHeGg@mail.gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQXJuZCBCZXJnbWFubg0KPiBTZW50OiAwMyBNYXkgMjAyMSAxMDoyNQ0KLi4uDQo+IE9u
ZSBzY2VuYXJpbyB0aGF0IEkndmUgc2VlbiBwcmV2aW91c2x5IGlzIHdoZXJlIHVzZXIgc3BhY2Ug
YW5kDQo+IGtlcm5lbCBhcmUgYnVpbHQgdG9nZXRoZXIgYXMgYSBzb3VyY2UgYmFzZWQgZGlzdHJp
YnV0aW9uIChPRSwgYnVpbGRyb290LA0KPiBvcGVud3J0LCAuLi4pLCBhbmQgdGhlIGNvbXBpbGVy
IGlzIHBpY2tlZCB0byBtYXRjaCB0aGUgb3JpZ2luYWwgc291cmNlcw0KPiBvZiB0aGUgdXNlciBz
cGFjZSBiZWNhdXNlIHRoYXQgaXMgYmVzdCB0ZXN0ZWQsIGJ1dCB0aGUgc2FtZSBjb21waWxlcg0K
PiB0aGVuIGdldHMgdXNlZCB0byBidWlsZCB0aGUga2VybmVsIGFzIHdlbGwgYmVjYXVzZSB0aGF0
IGlzIHRoZSBkZWZhdWx0DQo+IGluIHRoZSBidWlsZCBlbnZpcm9ubWVudC4NCg0KSWYgeW91IGFy
ZSBidWlsZGluZyBwcm9ncmFtcyBmb3IgcmVsZWFzZSB0byBjdXN0b21lcnMgd2hvIG1pZ2h0DQpi
ZSBydW5uaW5nIHRoZW4gb24gb2xkIGRpc3RyaWJ1dGlvbnMgdGhlbiB5b3UgbmVlZCBhIHN5c3Rl
bSB3aXRoDQp0aGUgb3JpZ2luYWwgdXNlcnNwYWNlIGhlYWRlcnMgYW5kIGFsbW9zdCBjZXJ0YWlu
bHkgYSBzaW1pbGFyDQp2aW50YWdlIGNvbXBpbGVyLg0KTmV2ZXIgbWluZCBSSEVMNyB3ZSBoYXZl
IGN1c3RvbWVycyBydW5uaW5nIFJIRUw2Lg0KKFdlJ3ZlIG1hbmFnZWQgdG8gZ2V0IGV2ZXJ5b25l
IG9mZiBSSEVMNS4pDQpTbyB0aGUgYnVpbGQgbWFjaGluZSBpcyBydW5uaW5nIGEgMTArIHllYXIg
b2xkIGRpc3Ryby4NCg0KSSBkaWQgdHJ5IHRvIGJ1aWxkIG9uIGEgbmV3ZXIgc3lzdGVtIChvbmx5
IDUgeWVhcnMgb2xkKQ0KYnV0IHRoZSBjb21wbGV0ZSBmdWJhciBvZiBtZW1jcHkoKSBtYWtlcyBp
dCBpbXBvc3NpYmxlDQp0byBjb21waWxlIEMgcHJvZ3JhbXMgdGhhdCB3aWxsIHJ1biBvbiBhbiBv
bGRlciBsaWJjLg0KQW5kIGRvbid0IGV2ZW4gbWVudGlvbiBDKyssIHRoZSAnY2hhcmFjdGVyIHRy
YWl0cycgaXMganVzdA0KcGxhaW4gaG9ycmlkIC0gZW5vdWdoIHRvIG1ha2UgbWUgd2FudCB0byBy
ZW1vdmUgZXZlcnkNCnJlZmVyZW5jZSB0byBDU3RyaW5nIGZyb20gdGhlIHNtYWxsIGFtb3VudCBv
ZiBDKysgd2UgaGF2ZS4NCg0KVG8gcXVvdGUgb3VyIG1ha2VmaWxlOg0KIyBDKysgaXMgZmlnaHRp
bmcgYmFjay4NCiMgSSdkIGxpa2UgdG8gYmUgYWJsZSB0byBjb21waWxlIG9uIGEgJ25ldycgc3lz
dGVtIGFuZCBzdGlsbCBiZSBhYmxlIHRvIHJ1bg0KIyB0aGUgYmluYXJpZXMgb24gUkhFTCA2ICgy
LjYuMzIga2VybmVsIDIwMTEgZXJhIGxpYnJhcmllcykuDQojIEJ1dCBldmVuIGxpbmtpbmcgbGli
c3RkYysrIHN0YXRpYyBzdGlsbCBsZWF2ZXMNCiMgYW4gdW5kZWZpbmVkIEMrKyBzeW1ib2wgdGhh
dCB0aGUgZHluYW1pYyBsb2FkZXIgYmFyZnMgb24uDQojIFRoZSBzdGF0aWMgbGlic3RkYysrIGFs
c28gcmVmZXJlbmNlcyBtZW1jcHlAR0xJQkNfMi4xNCAtIGJ1dCB0aGF0IGNhbiBiZQ0KIyAnc29s
dmVkJyBieSBhZGRpbmcgYW4gZXh0cmEgLnNvIHRoYXQgZGVmaW5lcyB0aGUgc3ltYm9sIChhbmQg
Y2FsbHMgbWVtbW92ZSgpKS4NCiMgSSd2ZSBhbHNvIHRyaWVkIHB1bGxpbmcgYSBzaW5nbGUgLm8g
b3V0IG9mIGxpYnN0YysrLmEuIFRoaXMgbWlnaHQgd29yayBpZg0KIyB0aGUgLm8gaXMgc21hbGwg
YW5kIHNlbGYgY29udGFpbmVkLg0KIw0KIyBGb3Igbm93IHdlIHN0YXRpY2FsbHkgbGluayBsaWJz
dGMrKyBhbmQgY29udGludWUgdG8gYnVpbGQgb24gYW4gb2xkIHN5c3RlbS4NCkMrK0xETElCUyA6
PSAtV2wsLUJzdGF0aWMgLWxzdGRjKysgLVdsLC1CZHluYW1pYw0KDQpJdCB3b3VsZCBiZSBuaWNl
IHRvIGJlIGFibGUgdG8gYnVpbGQgY3VycmVudCBrZXJuZWxzIChmb3IgbG9jYWwNCnVzZSkgb24g
dGhlICduZXcnIHN5c3RlbSAtIGJ1dCBnY2MgaXMgYWxyZWFkeSB0b28gb2xkLg0KDQoJRGF2aWQN
Cg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZh
cm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYg
KFdhbGVzKQ0K

