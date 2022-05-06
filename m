Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4932C51D9C6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 16:03:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kvsjy26g0z3cGZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 00:03:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 4182 seconds by postgrey-1.36 at boromir;
 Sat, 07 May 2022 00:03:24 AEST
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvsjS1bDBz3bqs
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 00:03:22 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-195-nik8eVn6MbSMYKVVi8RBBA-1; Fri, 06 May 2022 15:03:17 +0100
X-MC-Unique: nik8eVn6MbSMYKVVi8RBBA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Fri, 6 May 2022 15:03:15 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Fri, 6 May 2022 15:03:15 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Geert Uytterhoeven' <geert@linux-m68k.org>
Subject: RE: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
Thread-Topic: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select
 it as necessary
Thread-Index: AQHYYUSwX3QwDKjE7kKG/gGNt1cnA60Rx6Pg///55gCAABIk4A==
Date: Fri, 6 May 2022 14:03:15 +0000
Message-ID: <62c1bf6687ac4abc98d4015852930241@AcuMS.aculab.com>
References: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
 <20220505161028.GA492600@bhelgaas>
 <CAK8P3a3fmPExr70+fVb564hZdGAuPtYa-QxgMMe5KLpnY_sTrQ@mail.gmail.com>
 <alpine.DEB.2.21.2205061058540.52331@angie.orcam.me.uk>
 <CAK8P3a0NzG=3tDLCdPj2=A__2r_+xiiUTW=WJCBNp29x_A63Og@mail.gmail.com>
 <alpine.DEB.2.21.2205061314110.52331@angie.orcam.me.uk>
 <5239892986c94239a122ab2f7a18a7a5@AcuMS.aculab.com>
 <CAMuHMdWj5rmrP941DF7bsUXbiiemE-o2=8XqnAS-chgmpFFPQg@mail.gmail.com>
In-Reply-To: <CAMuHMdWj5rmrP941DF7bsUXbiiemE-o2=8XqnAS-chgmpFFPQg@mail.gmail.com>
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
Cc: Rich Felker <dalias@libc.org>,
 "open list:IA64 \(Itanium\) PLATFORM" <linux-ia64@vger.kernel.org>,
 "open list:SUPERH" <linux-sh@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "open
 list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>, "open
 list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci <linux-pci@vger.kernel.org>,
 Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Arnd Bergmann <arnd@kernel.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, "open
 list:ALPHA PORT" <linux-alpha@vger.kernel.org>, Borislav Petkov <bp@alien8.de>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

RnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuDQo+IFNlbnQ6IDA2IE1heSAyMDIyIDE0OjA5DQouLi4N
Cj4gPiBUaGUgc2FtZSBpcyByZWFsbHkgdHJ1ZSBmb3Igb3RoZXIgYnVzIHR5cGUgLSBpbmNsdWRp
bmcgSVNBIGFuZCBFSVNBLg0KPiA+IChJZ25vcmluZyB0aGUgaG9ycmlkIG9mIHByb2JpbmcgSVNJ
IGJ1cyBkZXZpY2VzIC0gaG9wZWZ1bGx5IHRoZXkNCj4gPiBhcmUgaW4gdGhlIEFDUEkgdGFibGVz
Pz9fDQo+ID4gSWYgYSBkcml2ZXIgaXMgcHJvYmVkIG9uIGEgSVNBIGJ1cyB0aGVyZSBvdWdodCB0
byBiZSBmdW5jdGlvbnMNCj4gPiBlcXVpdmFsZW50IHRvIHBjaV9pb3JlbWFwKCkgKGZvciBib3Ro
IG1lbW9yeSBhbmQgSU8gYWRkcmVzc2VzKQ0KPiA+IHRoYXQgcmV0dXJuIHRva2VucyBhcHByb3By
aWF0ZSBmb3IgdGhlIHNwZWNpZmljIGJ1cy4NCj4gPg0KPiA+IFRoYXQgaXMgYWxsIGEgZGlmZmVy
ZW50IGxvYWQgb2YgY2h1cm4uDQo+IA0KPiBBIGxvb29vbmcgdGltZSBhZ28sICBpdCB3YXMgc3Vn
Z2VzdGVkIHRvIGFkZCByZWdpc3RlciBhY2Nlc3Nvcg0KPiBmdW5jdGlvbnMgdG8gc3RydWN0IGRl
dmljZSwgc28gZS5nLiByZWFkbChkZXYsIG9mZnNldCkgd291bGQgY2FsbA0KPiBpbnRvIHRoZXNl
IGFjY2Vzc29ycywgd2hpY2ggd291bGQgaW1wbGVtZW50IHRoZSBidXMtc3BlY2lmaWMgYmVoYXZp
b3IuDQo+IE5vIG1vcmUgd29ycmllcyBhYm91dCByZWFkbCgpLCBfX3Jhd19yZWFkbCgpLCBpb3Jl
YWQzMmIoKSwgb3Igd2hhdGV2ZXINCj4gcXVpcmsgaXMgbmVlZGVkLCBhdCB0aGUgKHNtYWxsIG9u
IG5vd2FkYXlzJyBtYWNoaW5lcykgZXhwZW5zZSBvZg0KPiBzb21lIGluZGlyZWN0aW9uLi4uDQoN
Ckkgd2FzIGp1c3QgdGhpbmtpbmcgdGhhdCB0aGUgYWNjZXNzIGZ1bmN0aW9ucyBtaWdodCBuZWVk
IGEgJ2RldmljZScuDQpBbHRob3VnaCB5b3UgYWxzbyBuZWVkIHRoZSBCQVIgKG9yIGVxdWl2YWxl
bnQpLg0KU28gcmVhZGwoZGV2LCBiYXJfdG9rZW4sIG9mZnNldCkgb3IgcmVhZGwoZGV2LCBiYXJf
dG9rZW4gKyBvZmZzZXQpLg0KQ2xlYXJseSB0aGUgJ2RldicgcGFyYW1ldGVyIGNvdWxkIGJlIGNv
bXBpbGVkIG91dCBmb3Igbm9uLURFQlVHDQpidWlsZCBvbiB4ODYgLSBsZWF2aW5nIHRoZSBjdXJy
ZW50KGlzaCkgb2JqZWN0IGNvZGUuDQoNCllvdSBkb24ndCB3YW50IGFuIGluZGlyZWN0IGNhbGwg
KHRoaXMgeWVhciksIGJ1dCBtYXliZSByZWFsDQpmdW5jdGlvbiBjYWxsIGFuZCBhIGZldyB0ZXN0
cyB3b24ndCBtYWtlIHRoYXQgbXVjaCBkaWZmZXJlbmNlLg0KVGhleSBtaWdodCBhZmZlY3QgUENJ
ZSB3cml0ZXMsIGJ1dCBQQ0llIHJlYWRzIGFyZSBzbyBzbG93IHlvdQ0KbmVlZCB0byBhdm9pZCB0
aGVtIHdoZW5ldmVyIHBvc3NpYmxlLg0KSSd2ZSBub3QgdGltZWQgcmVhZHMgaW50byBzb21ldGhp
bmcgbGlrZSBhbiBldGhlcm5ldCBjaGlwLA0KYnV0IGludG8gb3VyIGZwZ2EgdGhleSBhcmUgcHJv
YmFibHkgMTAwMCBjbG9ja3MrLg0KDQpPVE9IIEkgd291bGRuJ3Qgd2FudCBhbnkgb3ZlcmhlYWQg
b24gdGhlIFBJTyBmaWZvIHJlYWRzDQpvbiBvbmUgb2Ygb3VyIHNtYWxsIHBwYyBkZXZpY2VzLg0K
V2UgcHVzaCBhIGxvdCBvZiBkYXRhIHRob3VnaCB0aGF0IGZpZm8gYW5kIGFueXRoaW5nIGV4dHJh
DQp3b3VsZCBraWxsIHBlcmZvcm1hbmNlLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRy
ZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1L
MSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

