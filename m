Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9F26DD728
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 11:50:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pwh0m74f5z3chd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 19:50:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwh0F1HS9z3bfk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 19:50:03 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-54-HOE0CR_YMQaLj66tD2S2Sw-1; Tue, 11 Apr 2023 10:49:56 +0100
X-MC-Unique: HOE0CR_YMQaLj66tD2S2Sw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 11 Apr
 2023 10:49:53 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 11 Apr 2023 10:49:53 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Geert Uytterhoeven' <geert@linux-m68k.org>
Subject: RE: [PATCH v4] Kconfig: introduce HAS_IOPORT option and select it as
 necessary
Thread-Topic: [PATCH v4] Kconfig: introduce HAS_IOPORT option and select it as
 necessary
Thread-Index: AQHZZ/3AaiQodugroEmdF5H6jyGRq68dOQLwgAiLaACAACAuAA==
Date: Tue, 11 Apr 2023 09:49:53 +0000
Message-ID: <49ccbda9fc44496ba5688616d25ce901@AcuMS.aculab.com>
References: <20230323163354.1454196-1-schnelle@linux.ibm.com>
 <248a41a536d5a3c9e81e8e865b34c5bf74cd36d4.camel@linux.ibm.com>
 <B1EC1AC7-6BB5-4B66-B171-24687C3CBFB3@zytor.com>
 <d8686aaf-f12e-446b-9a80-335bb4266a4d@app.fastmail.com>
 <ccff565cde1440b8bff92d96f94a32b5@AcuMS.aculab.com>
 <CAMuHMdWe+U3yOOfy+z19apZaT0q7WhrR2beR=t0Jkbd3ODYbyw@mail.gmail.com>
In-Reply-To: <CAMuHMdWe+U3yOOfy+z19apZaT0q7WhrR2beR=t0Jkbd3ODYbyw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
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
Cc: "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>, Huacai Chen <chenhuacai@kernel.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, John Paul Adrian
 Glaubitz <glaubitz@physik.fu-berlin.de>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Rich Felker <dalias@libc.org>, "H. Peter Anvin" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Linux-Arch <linux-arch@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Helge
 Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.osdn.me>, Russell King <linux@armlinux.org.uk>, Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Alan Stern <stern@rowland.harvard.edu>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Niklas
 Schnelle <schnelle@linux.ibm.com>, =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>, Richard Henderson <richard.henderson@linaro.org>, Nicholas
 Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@kernel.org>, Michal
 Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, Johannes Berg <johannes@sipsolutions.net>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuDQo+IFNlbnQ6IDExIEFwcmlsIDIwMjMgMDk6NTANCj4g
DQo+IEhpIERhdmlkLA0KPiANCj4gT24gV2VkLCBBcHIgNSwgMjAyMyBhdCAxMTozN+KAr1BNIERh
dmlkIExhaWdodCA8RGF2aWQuTGFpZ2h0QGFjdWxhYi5jb20+IHdyb3RlOg0KPiA+IEZyb206IExp
bnV4cHBjLWRldiBBcm5kIEJlcmdtYW5uDQo+ID4gPiBTZW50OiAwNSBBcHJpbCAyMDIzIDIxOjMy
DQo+ID4gPg0KPiA+ID4gT24gV2VkLCBBcHIgNSwgMjAyMywgYXQgMjI6MDAsIEguIFBldGVyIEFu
dmluIHdyb3RlOg0KPiA+ID4gPiBPbiBBcHJpbCA1LCAyMDIzIDg6MTI6MzggQU0gUERULCBOaWts
YXMgU2NobmVsbGUgPHNjaG5lbGxlQGxpbnV4LmlibS5jb20+IHdyb3RlOg0KPiA+ID4gPj5PbiBU
aHUsIDIwMjMtMDMtMjMgYXQgMTc6MzMgKzAxMDAsIE5pa2xhcyBTY2huZWxsZSB3cm90ZToNCj4g
PiA+ID4+PiBXZSBpbnRyb2R1Y2UgYSBuZXcgSEFTX0lPUE9SVCBLY29uZmlnIG9wdGlvbiB0byBp
bmRpY2F0ZSBzdXBwb3J0IGZvciBJL08NCj4gPiA+ID4+PiBQb3J0IGFjY2Vzcy4gSW4gYSBmdXR1
cmUgcGF0Y2ggSEFTX0lPUE9SVD1uIHdpbGwgZGlzYWJsZSBjb21waWxhdGlvbiBvZg0KPiA+ID4g
Pj4+IHRoZSBJL08gYWNjZXNzb3IgZnVuY3Rpb25zIGluYigpL291dGIoKSBhbmQgZnJpZW5kcyBv
biBhcmNoaXRlY3R1cmVzDQo+ID4gPiA+Pj4gd2hpY2ggY2FuIG5vdCBtZWFuaW5nZnVsbHkgc3Vw
cG9ydCBsZWdhY3kgSS9PIHNwYWNlcyBzdWNoIGFzIHMzOTAuDQo+ID4gPiA+Pj4gPj4NCj4gPiA+
ID4+R2VudGxlIHBpbmcuIEFzIGZhciBhcyBJIGNhbiB0ZWxsIHRoaXMgaGFzbid0IGJlZW4gcGlj
a2VkIHRvIGFueSB0cmVlDQo+ID4gPiA+PnNwIGZhciBidXQgYWxzbyBoYXNuJ3Qgc2VlbiBjb21w
bGFpbnMgc28gSSdtIHdvbmRlcmluZyBpZiBJIHNob3VsZCBzZW5kDQo+ID4gPiA+PmEgbmV3IHZl
cnNpb24gb2YgdGhlIGNvbWJpbmVkIHNlcmllcyBvZiB0aGlzIHBhdGNoIHBsdXMgdGhlIGFkZGVk
DQo+ID4gPiA+PkhBU19JT1BPUlQgZGVwZW5kZW5jaWVzIHBlciBzdWJzeXN0ZW0gb3Igd2FpdCB1
bnRpbCB0aGlzIGlzIHBpY2tlZCB1cC4NCj4gPiA+ID4NCj4gPiA+ID4gWW91IG5lZWQgdGhpcyBv
biBhIHN5c3RlbSBzdXBwb3J0aW5nIG5vdCBqdXN0IElTQSBidXQgYWxzbyBQQ0kuDQo+ID4gPiA+
DQo+ID4gPiA+IFR5cGljYWxseSBvbiBub24teDg2IGFyY2hpdGVjdHVyZXMgdGhpcyBpcyBzaW1w
bHkgbWFwcGVkIGludG8gYSBtZW1vcnkgd2luZG93Lg0KPiA+ID4NCj4gPiA+IEknbSBwcmV0dHkg
Y29uZmlkZW50IHRoYXQgdGhlIGxpc3QgaXMgY29ycmVjdCBoZXJlLCBhcyB0aGUgSEFTX0lPUE9S
VA0KPiA+ID4gc3ltYm9sIGlzIGVuYWJsZWQgZXhhY3RseSBmb3IgdGhlIGFyY2hpdGVjdHVyZXMg
dGhhdCBoYXZlIGEgd2F5IHRvDQo+ID4gPiBtYXAgdGhlIEkvTyBzcGFjZS4gUENJZSBnZW5lcmFs
bHkgd29ya3MgZmluZSB3aXRob3V0IEkvTyBzcGFjZSwgdGhlDQo+ID4gPiBvbmx5IGV4Y2VwdGlv
biBhcmUgZHJpdmVycyBmb3IgZGV2aWNlcyB0aGF0IHdlcmUgYXJvdW5kIGFzIGVhcmx5IFBDSS4N
Cj4gPg0KPiA+IElzbid0IHRoZXJlIGEgZGlmZmVyZW5jZSBiZXR3ZWVuIGNwdSB0aGF0IGhhdmUg
aW5iKCkvb3V0YigpIChwcm9iYWJseQ0KPiA+IG9ubHkgeDg2PykgYW5kIGFyY2hpdGVjdHVyZXMg
KHdlbGwgY29tcHV0ZXIgZGVzaWducykgdGhhdCBjYW4gZ2VuZXJhdGUNCj4gPiBQQ0kgJ0kvTycg
Y3ljbGVzIGJ5IHNvbWUgbWVhbnMuDQo+ID4gSXQgaXNuJ3QgZXZlbiBqdXN0IFBDSSBJL08gY3lj
bGVzLCBJJ3ZlIHVzZWQgYW4gQVJNIGNwdSAoU0ExMTAwKQ0KPiA+IHRoYXQgbWFwcGVkIGEgY2h1
Y2sgb2YgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSBvbnRvIFBDTUNJQSBJL08gY3ljbGVzLg0KPiA+
DQo+ID4gSWYgdGhlIGhhcmR3YXJlIGNhbiBtYXAgYSBQQ0kgJ0lPJyBiYXIgaW50byBub3JtYWwg
a2VybmVsIGFkZHJlc3MNCj4gPiBzcGFjZSB0aGVuIHRoZSBiYXIgYW5kIGFjY2Vzc2VzIGNhbiBi
ZSB0cmVhdGVkIGV4YWN0bHkgbGlrZSBhIG1lbW9yeSBiYXIuDQo+ID4gVGhpcyBwcm9iYWJseSBs
ZWF2ZXMgeDg2IGFzIHRoZSBvdXRsaWVyIHdoZXJlIHlvdSBuZWVkIChJSVJDKSBpb19yZWFkbCgp
DQo+ID4gYW5kIGZyaWVuZHMgdGhhdCBjYW4gZ2VuZXJhdGUgaW4vb3V0IGluc3RydWN0aW9ucyBm
b3IgdGhvc2UgYWNjZXNzZXMuDQo+ID4NCj4gPiBUaGVyZSBhcmUgYWxzbyBhbGwgdGhlIHg4NiBJ
U0EgZGV2aWNlcyB3aGljaCBuZWVkIGluL291dCBpbnN0cnVjdGlvbnMuDQo+ID4gQnV0ICh3aXRo
IHRoZSBsaWtlbHkgZXhjZXB0aW9uIG9mIHRoZSBVQVJUKSB0aGV5IGFyZSBwcmV0dHkgbXVjaA0K
PiA+IHBsYXRmb3JtIHNwZWNpZmljLg0KPiA+DQo+ID4gU28sIHRvIG15IG1pbmQgYXQgbGVhc3Qs
IEhBU19JT1BPUlQgaXMganVzdCB0aGUgd3JvbmcgcXVlc3Rpb24uDQo+IA0KPiBOb3QgYWxsIFBD
SSBjb250cm9sbGVycyBzdXBwb3J0IG1hcHBpbmcgdGhlIEkvTyBiYXIgaW4gTU1JTyBzcGFjZSwg
c28NCj4gaW4gZ2VuZXJhbCB5b3UgY2Fubm90IHNheSB0aGF0IENPTkZJR19QQ0k9eSBtZWFucyBD
T05GSUdfSEFTX0lPUE9SVD15Lg0KDQpCdXQgYSBDT05GSUdfSEFTX1BDSV9JTz15IHdvdWxkIGlt
cGx5IENPTkZJR19IQVNfSU9QT1JUPXkuDQpJdCBpcyB0aGUgZm9ybWVyIHRoYXQgaXMgbW9yZSBp
bnRlcmVzdGluZyBmb3IgZHJpdmVyIHN1cHBvcnQuDQoNCglEYXZpZA0KDQotDQpSZWdpc3RlcmVk
IEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5l
cywgTUsxIDFQVCwgVUsNClJlZ2lzdHJhdGlvbiBObzogMTM5NzM4NiAoV2FsZXMpDQo=

