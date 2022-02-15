Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1554B6D6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 14:29:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyhlK0NQYz3bdG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 00:29:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jyhkr3q2Gz2xBq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 00:29:06 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-182-H3Rwu_w8NV6V0ZRo-LH3cg-1; Tue, 15 Feb 2022 13:29:01 +0000
X-MC-Unique: H3Rwu_w8NV6V0ZRo-LH3cg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Tue, 15 Feb 2022 13:28:59 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Tue, 15 Feb 2022 13:28:59 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>
Subject: RE: [PATCH 09/14] m68k: drop custom __access_ok()
Thread-Topic: [PATCH 09/14] m68k: drop custom __access_ok()
Thread-Index: AQHYIlMtkSdfU5++r0iADsDmNo4Sd6yUlQ9w
Date: Tue, 15 Feb 2022 13:28:59 +0000
Message-ID: <665a8abfa86f4b5f9a66e294a79bb531@AcuMS.aculab.com>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-10-arnd@kernel.org>
 <Ygr11RGjj3C9uAUg@zeniv-ca.linux.org.uk> <20220215062942.GA12551@lst.de>
 <YgtSpk0boDjsyjFK@zeniv-ca.linux.org.uk>
 <CAK8P3a0t-dnJXvXH0Mx5L-AeVQe1mYzRi0sQjYxzMQw-mVPv0Q@mail.gmail.com>
In-Reply-To: <CAK8P3a0t-dnJXvXH0Mx5L-AeVQe1mYzRi0sQjYxzMQw-mVPv0Q@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 Helge Deller <deller@gmx.de>, the arch/x86
 maintainers <x86@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open
 list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>, Arnd
 Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, "Eric W .
 Biederman" <ebiederm@xmission.com>, Richard Weinberger <richard@nod.at>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQXJuZCBCZXJnbWFubg0KPiBTZW50OiAxNSBGZWJydWFyeSAyMDIyIDEwOjAyDQo+IA0K
PiBPbiBUdWUsIEZlYiAxNSwgMjAyMiBhdCA4OjEzIEFNIEFsIFZpcm8gPHZpcm9AemVuaXYubGlu
dXgub3JnLnVrPiB3cm90ZToNCj4gPiBPbiBUdWUsIEZlYiAxNSwgMjAyMiBhdCAwNzoyOTo0MkFN
ICswMTAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToNCj4gPiA+IE9uIFR1ZSwgRmViIDE1LCAy
MDIyIGF0IDEyOjM3OjQxQU0gKzAwMDAsIEFsIFZpcm8gd3JvdGU6DQo+ID4gPiA+IFBlcmhhcHMg
c2ltcGx5IHdyYXAgdGhhdCBzdWNrZXIgaW50byAjaWZkZWYgQ09ORklHX0NQVV9IQVNfQUREUkVT
U19TUEFDRVMNCj4gPiA+ID4gKGFuZCB0cmltIHRoZSBjb21tZW50IGRvd24gdG8gImNvbGRmaXJl
IGFuZCA2ODAwMCB3aWxsIHBpY2sgZ2VuZXJpYw0KPiA+ID4gPiB2YXJpYW50Iik/DQo+ID4gPg0K
PiA+ID4gSSB3b25kZXIgaWYgd2Ugc2hvdWxkIGludmVydCBDT05GSUdfQVJDSF9IQVNfTk9OX09W
RVJMQVBQSU5HX0FERFJFU1NfU1BBQ0UsDQo+ID4gPiBzZWxlY3QgdGhlIHNlcGFyYXRlIGFkZHJl
c3Mgc3BhY2UgY29uZmlnIGZvciBzMzkwLCBzcGFyYzY0LCBub24tY29sZGZpcmUNCj4gPiA+IG02
OGsgYW5kIG1pcHMgd2l0aCBFVkEgYW5kIHRoZW4ganVzdCBoYXZlIG9uZSBzaW5nbGUgYWNjZXNz
X29rIGZvcg0KPiA+ID4gb3ZlcmxhcHBpbmcgYWRkcmVzcyBzcGFjZSAoYXMgYWRkZWQgYnkgQXJu
ZCkgYW5kIG5vbi1vdmVybGFwcGluZyBvbmVzDQo+ID4gPiAoYWx3YXlzIHJldHVybiB0cnVlKS4N
Cj4gPg0KPiA+IHBhcmlzYyBpcyBhbHNvIHN1Y2guLi4gIEhvdyBhYm91dA0KPiA+DQo+ID4gICAg
ICAgICBzZWxlY3QgQUxURVJOQVRFX1NQQUNFX1VTRVJMQU5EDQo+ID4NCj4gPiBmb3IgdGhhdCBi
dW5jaD8NCj4gDQo+IEVpdGhlciBvZiB0aG9zZSB3b3JrcyBmb3IgbWUuIE15IGN1cnJlbnQgdmVy
c2lvbiBoYXMgdGhpcyBrZXllZCBvZmYNCj4gVEFTS19TSVpFX01BWD09VUxPTkdfTUFYLCBidXQg
YSBDT05GSUdfIHN5bWJvbCBkb2VzDQo+IGxvb2sgbW9yZSBkZXNjcmlwdGl2ZS4NCj4gDQo+ID4g
IFdoaWxlIHdlIGFyZSBhdCBpdCwgaG93IG1hbnkgdW51c3VhbCBhY2Nlc3Nfb2soKSBpbnN0YW5j
ZXMgYXJlDQo+ID4gbGVmdCBhZnRlciB0aGlzIHNlcmllcz8gIGFybTY0LCBpdGFuaWMsIHVtLCBh
bnl0aGluZyBlbHNlPw0KPiANCj4geDg2IGFkZHMgYSBXQVJOX09OX0lOX0lSUSgpIGNoZWNrIGlu
IHRoZXJlLg0KDQpJZiBpcyBhIG5vb3AgdW5sZXNzIENPTkZJR19ERUJVR19BVE9NSUNfU0xFRVAg
aXMgc2V0Lg0KSSBkb3VidCB0aGF0IGlzIG9mdGVuIGVuYWJsZWQuDQoNCj4gVGhpcyBjb3VsZCBi
ZQ0KPiBtYWRlIGdlbmVyaWMsIGJ1dCBpdCdzIG5vdCBvYnZpb3VzIHdoYXQgZXhhY3RseSB0aGUg
ZXhjZXB0aW9ucyBhcmUNCj4gdGhhdCBvdGhlciBhcmNoaXRlY3R1cmVzIG5lZWQuIFRoZSBhcm02
NCB0YWdnZWQgcG9pbnRlcnMgY291bGQNCj4gcHJvYmFibHkgYWxzbyBnZXQgaW50ZWdyYXRlZCBp
bnRvIHRoZSBnZW5lcmljIHZlcnNpb24uDQo+IA0KPiA+IEZXSVcsIHNwYXJjMzIgaGFzIGEgc2xp
Z2h0bHkgdW51c3VhbCBpbnN0YW5jZSAoc2VlIHVhY2Nlc3NfMzIuaCB0aGVyZSk7IGl0J3MNCj4g
PiBvYnZpb3VzbHkgY2hlYXBlciB0aGFuIGdlbmVyaWMgYW5kIEkgd29uZGVyIGlmIHRoZSB0cmlj
ayBpcyBsZWdpdGltYXRlIChhbmQNCj4gPiBhcHBsaWNhYmxlIGVsc2V3aGVyZSwgcGVyaGFwcyku
Li4NCj4gDQo+IFJpZ2h0LCBhIGZldyBvdGhlcnMgaGF2ZSB0aGUgc2FtZSwgYnV0IEkgd2Fzbid0
IGNvbnZpbmNlZCB0aGF0IHRoaXMNCj4gaXMgYWN0dWFsbHkgc2FmZSBmb3IgY2FsbCBwb3NzaWJs
ZSBjYXNlczogaXQncyB0cml2aWFsIHRvIGNvbnN0cnVjdCBhIGNhbGxlcg0KPiB0aGF0IHdvcmtz
IG9uIG90aGVyIGFyY2hpdGVjdHVyZXMgYnV0IG5vdCB0aGlzIG9uZSwgaWYgeW91IHBhc3MgYSBs
YXJnZQ0KPiBlbm91Z2ggc2l6ZSB2YWx1ZSBhbmQgZG9uJ3QgYWNjZXNzIHRoZSBjb250ZW50cyBp
biBzZXF1ZW5jZS4NCg0KWW91J2QgbmVlZCBjb2RlIHRoYXQgZGlkIGFuIGFjY2Vzc19vaygpIGNo
ZWNrIGFuZCB0aGVuIHJlYWQgZnJvbQ0KYSBsYXJnZSBvZmZzZXQgZnJvbSB0aGUgYWRkcmVzcyAt
IHVubGlrZWx5Lg0KSXQncyBub3QgbGlrZSB0aGUgYWNjZXNzX29rKCkgY2hlY2sgZm9yIHJlYWQv
d3JpdGUgaXMgZG9uZSBvbiBzeXNjYWxsDQplbnRyeSBhbmQgdGhlbiBldmVyeXRoaW5nIHVuZGVy
bmVhdGggYXNzdW1lcyBpdCBpcyB2YWxpZC4NCg0KSGFzbid0IChhbG1vc3QpIGV2ZXJ5dGhpbmcg
YmVlbiBjaGVja2VkIGZvciBmdW5jdGlvbiBjYWxscyBiZXR3ZWVuDQp1c2VyX2FjY2Vzc19iZWdp
bigpIGFuZCB0aGUgYWN0dWFsIGFjY2Vzc2VzPw0KQW5kIGFjY2Vzc19vaygpIGlzIGRvbmUgYnkv
YXQgdGhlIHNhbWUgdGltZSBhcyB1c2VyX2FjY2Vzc19iZWdpbigpPw0KDQpZb3UgZG8gbmVlZCBh
biB1bm1hcHBlZCBwYWdlIGFib3ZlIHRoZSBhZGRyZXNzIHRoYXQgaXMgdGVzdGVkLg0KDQo+IEFs
c28sIGxpa2UgdGhlICgoYWRkciB8IChhZGRyICsgc2l6ZSkpICYgTUFTSykgY2hlY2sgb24gc29t
ZSBvdGhlcg0KPiBhcmNoaXRlY3R1cmVzLCBpdCBpcyBsZXNzIHBvcnRhYmxlIGJlY2F1c2UgaXQg
bWFrZXMgYXNzdW1wdGlvbnMgYWJvdXQNCj4gdGhlIGFjdHVhbCBsYXlvdXQgYmV5b25kIGEgZml4
ZWQgYWRkcmVzcyBsaW1pdC4NCg0KSXNuJ3QgdGhhdCB0ZXN0IGJyb2tlbiB3aXRob3V0IGEgc2Vw
YXJhdGUgYm91bmQgY2hlY2sgb24gc2l6ZT8NCg0KSSBhbHNvIHNlZW0gdG8gcmVtZW1iZXIgdGhh
dCBhY2Nlc3Nfb2soeHh4LCAwKSBpcyBhbHdheXMgJ29rJw0KYW5kIHNvbWUgb2YgdGhlICdmYXN0
JyB0ZXN0cyBnaXZlIGEgZmFsc2UgbmVnYXRpdmUgaWYgdGhlIHVzZXINCmJ1ZmZlciBlbmRzIHdp
dGggdGhlIGxhc3QgYnl0ZSBvZiB1c2VyIGFkZHJlc3Mgc3BhY2UuDQoNClNvIHlvdSBtYXkgbmVl
ZDoNCglzaXplIDwgVEFTS19TSVpFICYmIChhZGRyIDwgKFRBU0tfU0laRSAtIHNpemUgLSAxKSB8
fCAhc2l6ZSkNCihzcHJpbmtsZWQgd2l0aCBbdW5dbGlrZWx5KCkpDQoNCglEYXZpZA0KDQotDQpS
ZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWls
dG9uIEtleW5lcywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMp
DQo=

