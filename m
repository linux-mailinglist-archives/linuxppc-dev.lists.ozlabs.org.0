Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 685666D89B6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 23:38:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsJ0T2nNKz3fFD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 07:38:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=aculab.com (client-ip=185.58.85.151; helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com; receiver=<UNKNOWN>)
X-Greylist: delayed 68 seconds by postgrey-1.36 at boromir; Thu, 06 Apr 2023 07:38:04 AEST
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsHzw5d4Pz3f4N
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 07:38:04 +1000 (AEST)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-68-pbqxvDXyOE-yB95Y9KmqPw-1; Wed, 05 Apr 2023 22:36:46 +0100
X-MC-Unique: pbqxvDXyOE-yB95Y9KmqPw-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 5 Apr
 2023 22:36:44 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 5 Apr 2023 22:36:44 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@arndb.de>, "H. Peter Anvin" <hpa@zytor.com>, "Niklas
 Schnelle" <schnelle@linux.ibm.com>, Richard Henderson
	<richard.henderson@linaro.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>, Michal Simek <monstr@monstr.eu>,
	"Thomas Bogendoerfer" <tsbogend@alpha.franken.de>, "James E . J . Bottomley"
	<James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Yoshinori Sato <ysato@users.osdn.me>, Rich Felker
	<dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S . Miller" <davem@davemloft.net>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org"
	<x86@kernel.org>
Subject: RE: [PATCH v4] Kconfig: introduce HAS_IOPORT option and select it as
 necessary
Thread-Topic: [PATCH v4] Kconfig: introduce HAS_IOPORT option and select it as
 necessary
Thread-Index: AQHZZ/3AaiQodugroEmdF5H6jyGRq68dOQLw
Date: Wed, 5 Apr 2023 21:36:44 +0000
Message-ID: <ccff565cde1440b8bff92d96f94a32b5@AcuMS.aculab.com>
References: <20230323163354.1454196-1-schnelle@linux.ibm.com>
 <248a41a536d5a3c9e81e8e865b34c5bf74cd36d4.camel@linux.ibm.com>
 <B1EC1AC7-6BB5-4B66-B171-24687C3CBFB3@zytor.com>
 <d8686aaf-f12e-446b-9a80-335bb4266a4d@app.fastmail.com>
In-Reply-To: <d8686aaf-f12e-446b-9a80-335bb4266a4d@app.fastmail.com>
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
Content-Transfer-Encoding: quoted-printable
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
Cc: "linux-m68k@vger.kernel.org" <linux-m68k@vger.kernel.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "Rafael J .
 Wysocki" <rafael@kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Linux-Arch <linux-arch@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>, =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Bjorn Helgaas <bhelgaas@google.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@kernel.org>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, Johannes Berg <johannes@sipsolutions.net>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Linuxppc-dev Arnd Bergmann
> Sent: 05 April 2023 21:32
>=20
> On Wed, Apr 5, 2023, at 22:00, H. Peter Anvin wrote:
> > On April 5, 2023 8:12:38 AM PDT, Niklas Schnelle <schnelle@linux.ibm.co=
m> wrote:
> >>On Thu, 2023-03-23 at 17:33 +0100, Niklas Schnelle wrote:
> >>> We introduce a new HAS_IOPORT Kconfig option to indicate support for =
I/O
> >>> Port access. In a future patch HAS_IOPORT=3Dn will disable compilatio=
n of
> >>> the I/O accessor functions inb()/outb() and friends on architectures
> >>> which can not meaningfully support legacy I/O spaces such as s390.
> >>> >>
> >>Gentle ping. As far as I can tell this hasn't been picked to any tree
> >>sp far but also hasn't seen complains so I'm wondering if I should send
> >>a new version of the combined series of this patch plus the added
> >>HAS_IOPORT dependencies per subsystem or wait until this is picked up.
> >
> > You need this on a system supporting not just ISA but also PCI.
> >
> > Typically on non-x86 architectures this is simply mapped into a memory =
window.
>=20
> I'm pretty confident that the list is correct here, as the HAS_IOPORT
> symbol is enabled exactly for the architectures that have a way to
> map the I/O space. PCIe generally works fine without I/O space, the
> only exception are drivers for devices that were around as early PCI.

Isn't there a difference between cpu that have inb()/outb() (probably
only x86?) and architectures (well computer designs) that can generate
PCI 'I/O' cycles by some means.
It isn't even just PCI I/O cycles, I've used an ARM cpu (SA1100)
that mapped a chuck of physical address space onto PCMCIA I/O cycles.

If the hardware can map a PCI 'IO' bar into normal kernel address
space then the bar and accesses can be treated exactly like a memory bar.
This probably leaves x86 as the outlier where you need (IIRC) io_readl()
and friends that can generate in/out instructions for those accesses.

There are also all the x86 ISA devices which need in/out instructions.
But (with the likely exception of the UART) they are pretty much
platform specific.

So, to my mind at least, HAS_IOPORT is just the wrong question.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

