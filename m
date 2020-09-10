Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6502641C5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 11:28:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnD8m1Y2VzDqdf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 19:28:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=207.82.80.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BnD6P5pWFzDqSg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Sep 2020 19:26:36 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-88-Vv-OybvCMQSx-L2wyG8B1A-1; Thu, 10 Sep 2020 10:26:29 +0100
X-MC-Unique: Vv-OybvCMQSx-L2wyG8B1A-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 10 Sep 2020 10:26:28 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 10 Sep 2020 10:26:28 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Christophe Leroy' <christophe.leroy@csgroup.eu>, 'Linus Torvalds'
 <torvalds@linux-foundation.org>, Segher Boessenkool
 <segher@kernel.crashing.org>
Subject: RE: remove the last set_fs() in common code, and remove it for x86
 and powerpc v3
Thread-Topic: remove the last set_fs() in common code, and remove it for x86
 and powerpc v3
Thread-Index: AQHWhvDyD2c/lZfV3kC0Ftay5UVebqlhgjnw///zuACAABnIEA==
Date: Thu, 10 Sep 2020 09:26:28 +0000
Message-ID: <59a64e9a210847b59f70f9bd2d02b5c3@AcuMS.aculab.com>
References: <20200903142242.925828-1-hch@lst.de>
 <20200903142803.GM1236603@ZenIV.linux.org.uk>
 <CAHk-=wgQNyeHxXfckd1WtiYnoDZP1Y_kD-tJKqWSksRoDZT=Aw@mail.gmail.com>
 <20200909184001.GB28786@gate.crashing.org>
 <CAHk-=whu19Du_rZ-zBtGsXAB-Qo7NtoJjQjd-Sa9OB5u1Cq_Zw@mail.gmail.com>
 <3beb8b019e4a4f7b81fdb1bc68bd1e2d@AcuMS.aculab.com>
 <186a62fc-042c-d6ab-e7dc-e61b18945498@csgroup.eu>
In-Reply-To: <186a62fc-042c-d6ab-e7dc-e61b18945498@csgroup.eu>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: aculab.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
Content-Language: en-US
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 the arch/x86 maintainers <x86@kernel.org>, Nick
 Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, Luis
 Chamberlain <mcgrof@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQ2hyaXN0b3BoZSBMZXJveQ0KPiBTZW50OiAxMCBTZXB0ZW1iZXIgMjAyMCAwOToxNA0K
PiANCj4gTGUgMTAvMDkvMjAyMCDDoCAxMDowNCwgRGF2aWQgTGFpZ2h0IGEgw6ljcml0wqA6DQo+
ID4gRnJvbTogTGludXMgVG9ydmFsZHMNCj4gPj4gU2VudDogMDkgU2VwdGVtYmVyIDIwMjAgMjI6
MzQNCj4gPj4gT24gV2VkLCBTZXAgOSwgMjAyMCBhdCAxMTo0MiBBTSBTZWdoZXIgQm9lc3Nlbmtv
b2wNCj4gPj4gPHNlZ2hlckBrZXJuZWwuY3Jhc2hpbmcub3JnPiB3cm90ZToNCj4gPj4+DQo+ID4+
PiBJdCB3aWxsIG5vdCB3b3JrIGxpa2UgdGhpcyBpbiBHQ0MsIG5vLiAgVGhlIExMVk0gcGVvcGxl
IGtub3cgYWJvdXQgdGhhdC4NCj4gPj4+IEkgZG8gbm90IGtub3cgd2h5IHRoZXkgaW5zaXN0IG9u
IHB1c2hpbmcgdGhpcywgYmVpbmcgaW5jb21wYXRpYmxlIGFuZA0KPiA+Pj4gZXZlcnl0aGluZy4N
Cj4gPj4NCj4gPj4gVW1tLiBTaW5jZSB0aGV5J2QgYmUgdGhlIG9uZXMgc3VwcG9ydGluZyB0aGlz
LCAqZ2NjKiB3b3VsZCBiZSB0aGUNCj4gPj4gaW5jb21wYXRpYmxlIG9uZSwgbm90IGNsYW5nLg0K
PiA+DQo+ID4gSSBoYWQgYW4gJ2ludGVyZXN0aW5nJyBpZGVhLg0KPiA+DQo+ID4gQ2FuIHlvdSB1
c2UgYSBsb2NhbCBhc20gcmVnaXN0ZXIgdmFyaWFibGUgYXMgYW4gaW5wdXQgYW5kIG91dHB1dCB0
bw0KPiA+IGFuICdhc20gdm9sYXRpbGUgZ290bycgc3RhdGVtZW50Pw0KPiA+DQo+ID4gV2VsbCB5
b3UgY2FuIC0gYnV0IGlzIGl0IGd1YXJhbnRlZWQgdG8gd29yayA6LSkNCj4gPg0KPiANCj4gV2l0
aCBnY2MgYXQgbGVhc3QgaXQgc2hvdWxkIHdvcmsgYWNjb3JkaW5nIHRvDQo+IGh0dHBzOi8vZ2Nj
LmdudS5vcmcvb25saW5lZG9jcy9nY2MvTG9jYWwtUmVnaXN0ZXItVmFyaWFibGVzLmh0bWwNCj4g
DQo+IFRoZXkgZXZlbiBleHBsaWNpdGVseSB0ZWxsOiAiVGhlIG9ubHkgc3VwcG9ydGVkIHVzZSBm
b3IgdGhpcyBmZWF0dXJlIGlzDQo+IHRvIHNwZWNpZnkgcmVnaXN0ZXJzIGZvciBpbnB1dCBhbmQg
b3V0cHV0IG9wZXJhbmRzIHdoZW4gY2FsbGluZyBFeHRlbmRlZA0KPiBhc20gIg0KDQpBIHF1aWNr
IHRlc3QgaXNuJ3QgZ29vZC4uLi4NCg0KaW50IGJhcihjaGFyICp6KQ0Kew0KICAgICAgICBfX2xh
YmVsX18gbGFiZWw7DQogICAgICAgIHJlZ2lzdGVyIGludCBlYXggYXNtICgiZWF4IikgPSA2Ow0K
ICAgICAgICBhc20gdm9sYXRpbGUgZ290byAoIiBtb3YgJDEsICUlZWF4IiA6OjogImVheCIgOiBs
YWJlbCk7DQoNCmxhYmVsOg0KICAgICAgICByZXR1cm4gZWF4Ow0KfQ0KDQowMDAwMDAwMDAwMDAw
MDQwIDxiYXI+Og0KICA0MDogICBiOCAwMSAwMCAwMCAwMCAgICAgICAgICBtb3YgICAgJDB4MSwl
ZWF4DQogIDQ1OiAgIGI4IDA2IDAwIDAwIDAwICAgICAgICAgIG1vdiAgICAkMHg2LCVlYXgNCiAg
NGE6ICAgYzMgICAgICAgICAgICAgICAgICAgICAgcmV0cQ0KDQphbHRob3VnaCBhZGRpbmc6DQog
ICAgICAgIGFzbSB2b2xhdGlsZSAoIiIgOiAiK3IiIChlYXgpKTsNCmVpdGhlciBzaWRlIG9mIHRo
ZSAnYXNtIHZvbGF0aWxlIGdvdG8nIGRvZXMgZml4IGl0Lg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0
ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBL
ZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

