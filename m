Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BFB478B7D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 13:36:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFpPw1WxRz3cWq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 23:36:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir;
 Fri, 17 Dec 2021 23:36:09 AEDT
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFpPP4ms1z2yNw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 23:36:09 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-157-DNhCqrEmMiq0pBhWJMMNWw-1; Fri, 17 Dec 2021 12:34:55 +0000
X-MC-Unique: DNhCqrEmMiq0pBhWJMMNWw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.26; Fri, 17 Dec 2021 12:34:53 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.026; Fri, 17 Dec 2021 12:34:53 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Segher Boessenkool' <segher@kernel.crashing.org>, Ard Biesheuvel
 <ardb@kernel.org>
Subject: RE: [PATCH v2 00/13] Unify asm/unaligned.h around struct helper
Thread-Topic: [PATCH v2 00/13] Unify asm/unaligned.h around struct helper
Thread-Index: AQHX8q6cJnIWdY3H8E+V3sMdrqJgg6w2m38Q
Date: Fri, 17 Dec 2021 12:34:53 +0000
Message-ID: <698cfc52a0d441f7b9f29424be82b2e8@AcuMS.aculab.com>
References: <20210514100106.3404011-1-arnd@kernel.org>
 <CAMj1kXG0CNomZ0aXxh_4094fT+g4bVWFCkrd7QwgTQgiqoxMWA@mail.gmail.com>
 <20211216185620.GP614@gate.crashing.org>
In-Reply-To: <20211216185620.GP614@gate.crashing.org>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Rich Felker <dalias@libc.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "Richard Russon
 \(FlatCap\)" <ldm@flatcap.org>, linux-m68k <linux-m68k@vger.kernel.org>,
 Amitkumar Karwar <amitkarwar@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Eric Dumazet <edumazet@google.com>, "open list:BPF JIT for MIPS \(32-BIT AND
 64-BIT\)" <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, "open
 list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, linux-arch <linux-arch@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Florian Fainelli <f.fainelli@gmail.com>, X86 ML <x86@kernel.org>,
 James Morris <jmorris@namei.org>, Ingo Molnar <mingo@redhat.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Jakub Kicinski <kuba@kernel.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, Jonas Bonn <jonas@southpole.se>, Kees
 Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Ganapathi Bhat <ganapathi017@gmail.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND
 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 Borislav Petkov <bp@alien8.de>, Stafford Horne <shorne@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, Jens Axboe <axboe@kernel.dk>, Arnd
 Bergmann <arnd@kernel.org>, John Johansen <john.johansen@canonical.com>,
 Xinming Hu <huxinming820@gmail.com>, Yoshinori Sato <ysato@users.osdn.me>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-ntfs-dev@lists.sourceforge.net" <linux-ntfs-dev@lists.sourceforge.net>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Vineet Gupta <vgupta@synopsys.com>,
 "johannes@sipsolutions.net" <johannes@sipsolutions.net>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sharvari Harisangam <sharvari.harisangam@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Segher Boessenkool
> Sent: 16 December 2021 18:56
...
> > The only remaining problem here is reinterpreting a char* pointer to a
> > u32*, e.g., for accessing the IP address in an Ethernet frame when
> > NET_IP_ALIGN =3D=3D 2, which could suffer from the same UB problem agai=
n,
> > as I understand it.
>=20
> The problem is never casting a pointer to pointer to character type, and
> then later back to an appriopriate pointer type.
> These things are both required to work.

I think that is true of 'void *', not 'char *'.
'char' is special in that 'strict aliasing' doesn't apply to it.
(Which is actually a pain sometimes.)

> The problem always is accessing something as if it
> was something of another type, which is not valid C.  This however is
> exactly what -fno-strict-aliasing allows, so that works as well.

IIRC the C language only allows you to have pointers to valid data items.
(Since they can only be generated by the & operator on a valid item.)
Indirecting any other pointer is probably UB!

This (sort of) allows the compiler to 'look through' casts to find
what the actual type is (or might be).
It can then use that information to make optimisation choices.
This has caused grief with memcpy() calls that are trying to copy
a structure that the coder knows is misaligned to an aligned buffer.

So while *(unaligned_ptr *)char_ptr probably has to work.
If the compiler can see *(unaligned_ptr *)(char *)int_ptr it can
assume the alignment of the 'int_ptr' and do a single aligned access.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

