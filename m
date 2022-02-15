Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1764B679C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 10:31:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JybSY4DgHz3cYh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 20:31:25 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JybS030dsz2xKK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 20:30:54 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-156-02Gu5ovtPiqtLOI9bz8ReQ-1; Tue, 15 Feb 2022 09:30:48 +0000
X-MC-Unique: 02Gu5ovtPiqtLOI9bz8ReQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Tue, 15 Feb 2022 09:30:41 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Tue, 15 Feb 2022 09:30:41 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Ard Biesheuvel' <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Subject: RE: [PATCH 08/14] arm64: simplify access_ok()
Thread-Topic: [PATCH 08/14] arm64: simplify access_ok()
Thread-Index: AQHYIkSmToLbzZrgTk+lOdewxMJ8XqyUT0bw
Date: Tue, 15 Feb 2022 09:30:41 +0000
Message-ID: <153bb1887f484ed79ce8224845a4b2ea@AcuMS.aculab.com>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
 <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
In-Reply-To: <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
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
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux
 Memory Management List <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Christoph
 Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>, "open
 list:S390" <linux-s390@vger.kernel.org>, Brian Cain <bcain@codeaurora.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, X86 ML <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um <linux-um@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 Greentime Hu <green.hu@gmail.com>, Stafford
 Horne <shorne@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "monstr@monstr.eu" <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>, "open
 list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogQXJkIEJpZXNoZXV2ZWwNCj4gU2VudDogMTUgRmVicnVhcnkgMjAyMiAwODoxOA0KPiAN
Cj4gT24gTW9uLCAxNCBGZWIgMjAyMiBhdCAxNzozNywgQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJu
ZWwub3JnPiB3cm90ZToNCj4gPg0KPiA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+DQo+ID4NCj4gPiBhcm02NCBoYXMgYW4gaW5saW5lIGFzbSBpbXBsZW1lbnRhdGlvbiBvZiBh
Y2Nlc3Nfb2soKSB0aGF0IGlzIGRlcml2ZWQgZnJvbQ0KPiA+IHRoZSAzMi1iaXQgYXJtIHZlcnNp
b24gYW5kIG9wdGltaXplZCBmb3IgdGhlIGNhc2UgdGhhdCBib3RoIHRoZSBsaW1pdCBhbmQNCj4g
PiB0aGUgc2l6ZSBhcmUgdmFyaWFibGUuIFdpdGggc2V0X2ZzKCkgZ29uZSwgdGhlIGxpbWl0IGlz
IGFsd2F5cyBjb25zdGFudCwNCj4gPiBhbmQgdGhlIHNpemUgdXN1YWxseSBpcyBhcyB3ZWxsLCBz
byBqdXN0IHVzaW5nIHRoZSBkZWZhdWx0IGltcGxlbWVudGF0aW9uDQo+ID4gcmVkdWNlcyB0aGUg
Y2hlY2sgaW50byBhIGNvbXBhcmlzb24gYWdhaW5zdCBhIGNvbnN0YW50IHRoYXQgY2FuIGJlDQo+
ID4gc2NoZWR1bGVkIGJ5IHRoZSBjb21waWxlci4NCj4gPg0KPiA+IE9uIGEgZGVmY29uZmlnIGJ1
aWxkLCB0aGlzIHNhdmVzIG92ZXIgMjhLQiBvZiAudGV4dC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+DQo+ID4gLS0tDQo+ID4gIGFyY2gvYXJt
NjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oIHwgMjggKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCBi
L2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vdWFjY2Vzcy5oDQo+ID4gaW5kZXggMzU3ZjdiZDljOTgx
Li5lOGRjZTBjYzVlYWEgMTAwNjQ0DQo+ID4gLS0tIGEvYXJjaC9hcm02NC9pbmNsdWRlL2FzbS91
YWNjZXNzLmgNCj4gPiArKysgYi9hcmNoL2FybTY0L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaA0KPiA+
IEBAIC0yNiw2ICsyNiw4IEBADQo+ID4gICNpbmNsdWRlIDxhc20vbWVtb3J5Lmg+DQo+ID4gICNp
bmNsdWRlIDxhc20vZXh0YWJsZS5oPg0KPiA+DQo+ID4gK3N0YXRpYyBpbmxpbmUgaW50IF9fYWNj
ZXNzX29rKGNvbnN0IHZvaWQgX191c2VyICpwdHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSk7DQo+ID4g
Kw0KPiA+ICAvKg0KPiA+ICAgKiBUZXN0IHdoZXRoZXIgYSBibG9jayBvZiBtZW1vcnkgaXMgYSB2
YWxpZCB1c2VyIHNwYWNlIGFkZHJlc3MuDQo+ID4gICAqIFJldHVybnMgMSBpZiB0aGUgcmFuZ2Ug
aXMgdmFsaWQsIDAgb3RoZXJ3aXNlLg0KPiA+IEBAIC0zMywxMCArMzUsOCBAQA0KPiA+ICAgKiBU
aGlzIGlzIGVxdWl2YWxlbnQgdG8gdGhlIGZvbGxvd2luZyB0ZXN0Og0KPiA+ICAgKiAodTY1KWFk
ZHIgKyAodTY1KXNpemUgPD0gKHU2NSlUQVNLX1NJWkVfTUFYDQo+ID4gICAqLw0KPiA+IC1zdGF0
aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgX19hY2Nlc3Nfb2soY29uc3Qgdm9pZCBfX3VzZXIgKmFk
ZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSkNCj4gPiArc3RhdGljIGlubGluZSBpbnQgYWNjZXNzX29r
KGNvbnN0IHZvaWQgX191c2VyICphZGRyLCB1bnNpZ25lZCBsb25nIHNpemUpDQo+ID4gIHsNCj4g
PiAtICAgICAgIHVuc2lnbmVkIGxvbmcgcmV0LCBsaW1pdCA9IFRBU0tfU0laRV9NQVggLSAxOw0K
PiA+IC0NCj4gPiAgICAgICAgIC8qDQo+ID4gICAgICAgICAgKiBBc3luY2hyb25vdXMgSS9PIHJ1
bm5pbmcgaW4gYSBrZXJuZWwgdGhyZWFkIGRvZXMgbm90IGhhdmUgdGhlDQo+ID4gICAgICAgICAg
KiBUSUZfVEFHR0VEX0FERFIgZmxhZyBvZiB0aGUgcHJvY2VzcyBvd25pbmcgdGhlIG1tLCBzbyBh
bHdheXMgdW50YWcNCj4gPiBAQCAtNDYsMjcgKzQ2LDkgQEAgc3RhdGljIGlubGluZSB1bnNpZ25l
ZCBsb25nIF9fYWNjZXNzX29rKGNvbnN0IHZvaWQgX191c2VyICphZGRyLCB1bnNpZ25lZCBsb25n
IHMNCj4gPiAgICAgICAgICAgICAoY3VycmVudC0+ZmxhZ3MgJiBQRl9LVEhSRUFEIHx8IHRlc3Rf
dGhyZWFkX2ZsYWcoVElGX1RBR0dFRF9BRERSKSkpDQo+ID4gICAgICAgICAgICAgICAgIGFkZHIg
PSB1bnRhZ2dlZF9hZGRyKGFkZHIpOw0KPiA+DQo+ID4gLSAgICAgICBfX2Noa191c2VyX3B0cihh
ZGRyKTsNCj4gPiAtICAgICAgIGFzbSB2b2xhdGlsZSgNCj4gPiAtICAgICAgIC8vIEEgKyBCIDw9
IEMgKyAxIGZvciBhbGwgQSxCLEMsIGluIGZvdXIgZWFzeSBzdGVwczoNCj4gPiAtICAgICAgIC8v
IDE6IFggPSBBICsgQjsgWCcgPSBYICUgMl42NA0KPiA+IC0gICAgICAgIiAgICAgICBhZGRzICAg
ICUwLCAlMywgJTJcbiINCj4gPiAtICAgICAgIC8vIDI6IFNldCBDID0gMCBpZiBYID4gMl42NCwg
dG8gZ3VhcmFudGVlIFgnID4gQyBpbiBzdGVwIDQNCj4gPiAtICAgICAgICIgICAgICAgY3NlbCAg
ICAlMSwgeHpyLCAlMSwgaGlcbiINCj4gPiAtICAgICAgIC8vIDM6IFNldCBYJyA9IH4wIGlmIFgg
Pj0gMl42NC4gRm9yIFggPT0gMl42NCwgdGhpcyBkZWNyZW1lbnRzIFgnDQo+ID4gLSAgICAgICAv
LyAgICB0byBjb21wZW5zYXRlIGZvciB0aGUgY2FycnkgZmxhZyBiZWluZyBzZXQgaW4gc3RlcCA0
LiBGb3INCj4gPiAtICAgICAgIC8vICAgIFggPiAyXjY0LCBYJyBtZXJlbHkgaGFzIHRvIHJlbWFp
biBub256ZXJvLCB3aGljaCBpdCBkb2VzLg0KPiA+IC0gICAgICAgIiAgICAgICBjc2ludiAgICUw
LCAlMCwgeHpyLCBjY1xuIg0KPiA+IC0gICAgICAgLy8gNDogRm9yIFggPCAyXjY0LCB0aGlzIGdp
dmVzIHVzIFgnIC0gQyAtIDEgPD0gMCwgd2hlcmUgdGhlIC0xDQo+ID4gLSAgICAgICAvLyAgICBj
b21lcyBmcm9tIHRoZSBjYXJyeSBpbiBiZWluZyBjbGVhci4gT3RoZXJ3aXNlLCB3ZSBhcmUNCj4g
PiAtICAgICAgIC8vICAgIHRlc3RpbmcgWCcgLSBDID09IDAsIHN1YmplY3QgdG8gdGhlIHByZXZp
b3VzIGFkanVzdG1lbnRzLg0KPiA+IC0gICAgICAgIiAgICAgICBzYmNzICAgIHh6ciwgJTAsICUx
XG4iDQo+ID4gLSAgICAgICAiICAgICAgIGNzZXQgICAgJTAsIGxzXG4iDQo+ID4gLSAgICAgICA6
ICI9JnIiIChyZXQpLCAiK3IiIChsaW1pdCkgOiAiSXIiIChzaXplKSwgIjAiIChhZGRyKSA6ICJj
YyIpOw0KPiA+IC0NCj4gPiAtICAgICAgIHJldHVybiByZXQ7DQo+ID4gKyAgICAgICByZXR1cm4g
bGlrZWx5KF9fYWNjZXNzX29rKGFkZHIsIHNpemUpKTsNCj4gPiAgfQ0KPiA+IC0jZGVmaW5lIF9f
YWNjZXNzX29rIF9fYWNjZXNzX29rDQo+ID4gKyNkZWZpbmUgYWNjZXNzX29rIGFjY2Vzc19vaw0K
PiA+DQo+ID4gICNpbmNsdWRlIDxhc20tZ2VuZXJpYy9hY2Nlc3Nfb2suaD4NCj4gPg0KPiA+IC0t
DQo+ID4gMi4yOS4yDQo+ID4NCj4gDQo+IFdpdGggc2V0X2ZzKCkgb3V0IG9mIHRoZSBwaWN0dXJl
LCB3b3VsZG4ndCBpdCBiZSBzdWZmaWNpZW50IHRvIGNoZWNrDQo+IHRoYXQgYml0ICM1NSBpcyBj
bGVhcj8gKHRoZSBiaXQgdGhhdCBzZWxlY3RzIGJldHdlZW4gVFRCUjAgYW5kIFRUQlIxKQ0KPiBU
aGF0IHdvdWxkIGFsc28gcmVtb3ZlIHRoZSBuZWVkIHRvIHN0cmlwIHRoZSB0YWcgZnJvbSB0aGUg
YWRkcmVzcy4NCj4gDQo+IFNvbWV0aGluZyBsaWtlDQo+IA0KPiAgICAgYXNtIGdvdG8oInRibnog
ICUwLCAjNTUsICUyICAgICBcbiINCj4gICAgICAgICAgICAgICJ0Ym56ICAlMSwgIzU1LCAlMiAg
ICAgXG4iDQo+ICAgICAgICAgICAgICA6OiAiciIoYWRkciksICJyIihhZGRyICsgc2l6ZSAtIDEp
IDo6IG5vdG9rKTsNCj4gICAgIHJldHVybiAxOw0KPiBub3RvazoNCj4gICAgIHJldHVybiAwOw0K
PiANCj4gd2l0aCBhbiBhZGRpdGlvbmFsIHNhbml0eSBjaGVjayBvbiB0aGUgc2l6ZSB3aGljaCB0
aGUgY29tcGlsZXIgY291bGQNCj4gZWxpbWluYXRlIGZvciBjb21waWxlLXRpbWUgY29uc3RhbnQg
dmFsdWVzLg0KDQpJcyB0aGVyZSBhcmUgcmVhc29uIG5vdCB0byBqdXN0IHVzZToNCglzaXplIDwg
MXUgPDwgNDggJiYgISgoYWRkciB8IChhZGRyICsgc2l6ZSAtIDEpKSAmIDF1IDw8IDU1KQ0KDQoo
VGhlIC0xIGNhbiBiZSByZW1vdmVkIGlmIHRoZSBsYXN0IHVzZXIgcGFnZSBpcyBuZXZlciBtYXBw
ZWQpDQoNClVnZywgaXMgYXJtNjQgYWRkcmVzc2luZyBhcyBob3JyaWQgYXMgaXQgbG9va3MgLSB3
aXRoIHRoZSAna2VybmVsJw0KYml0IGluIHRoZSBtaWRkbGUgb2YgdGhlIHZpcnR1YWwgYWRkcmVz
cyBzcGFjZT8NCkl0IHNlZW1zIHRvIGJlOg0KCTx6ZXJvOjQ+PHRhZzo0PjxrZXJuZWw6MT48aWdu
b3JlZDo3PjxhZGRyZXNzOjQ4Pg0KQWx0aG91Z2ggSSBmb3VuZCBzb21lIHJlZmVyZW5jZXMgdG8g
NDQgYml0IFZBIGFuZCB0byBjb2RlIHVzaW5nIHRoZQ0KJ2lnbm9yZWQnIGJpdHMgYXMgdGFncyAt
IHJlbHlpbmcgb24gdGhlIGhhcmR3YXJlIGlnbm9yaW5nIHRoZW0uDQpUaGVyZSBtaWdodCBiZSBz
b21lIGZlYXR1cmUgdGhhdCB1c2VzIHRoZSB0b3AgNCBiaXRzIGFzIHdlbGwuDQoNCkFub3RoZXIg
b3B0aW9uIGlzIGFzc3VtaW5nIHRoYXQgYWNjZXNzZXMgYXJlICdyZWFzb25hYmx5IHNlcXVlbnRp
YWwnLA0KcmVtb3ZpbmcgdGhlIGxlbmd0aCBjaGVjayBhbmQgZW5zdXJpbmcgdGhlcmUgaXMgYW4g
dW5tYXBwZWQgcGFnZQ0KYmV0d2VlbiB2YWxpZCB1c2VyIGFuZCBrZXJuZWwgYWRkcmVzc2VzLg0K
VGhhdCBwcm9iYWJseSByZXF1aXJlcyBhbmQgdW5tYXBwZWQgcGFnZSBhdCB0aGUgYm90dG9tIG9m
IGtlcm5lbCBzcGFjZQ0Kd2hpY2ggbWF5IG5vdCBiZSBhY2hpZXZhYmxlLg0KDQoJRGF2aWQNCg0K
LQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0s
IE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdh
bGVzKQ0K

