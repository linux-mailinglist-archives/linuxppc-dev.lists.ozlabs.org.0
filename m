Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2562F8FC0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 23:41:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DJChs67vLzDsjr
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jan 2021 09:41:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=aculab.com (client-ip=185.58.86.151;
 helo=eu-smtp-delivery-151.mimecast.com; envelope-from=david.laight@aculab.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ACULAB.COM
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHXBP20z3zDvVV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 07:01:32 +1100 (AEDT)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-79-PS3OFpBZPgGXINPuMHjjeQ-1; Fri, 15 Jan 2021 20:01:22 +0000
X-MC-Unique: PS3OFpBZPgGXINPuMHjjeQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Fri, 15 Jan 2021 20:01:15 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Fri, 15 Jan 2021 20:01:15 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'sonicadvance1@gmail.com'" <sonicadvance1@gmail.com>
Subject: RE: [PATCH] Adds a new ioctl32 syscall for backwards compatibility
 layers
Thread-Topic: [PATCH] Adds a new ioctl32 syscall for backwards compatibility
 layers
Thread-Index: AQHW6wzXd1V6Thk8U0iiUgMFo8hTJqopEBwA
Date: Fri, 15 Jan 2021 20:01:15 +0000
Message-ID: <b15672b1caec4cf980f2753d06b03596@AcuMS.aculab.com>
References: <20210106064807.253112-1-Sonicadvance1@gmail.com>
 <20210115070326.294332-1-Sonicadvance1@gmail.com>
In-Reply-To: <20210115070326.294332-1-Sonicadvance1@gmail.com>
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
X-Mailman-Approved-At: Sun, 17 Jan 2021 09:38:28 +1100
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
Cc: "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 Rich Felker <dalias@libc.org>, Jan Kara <jack@suse.cz>,
 Miklos Szeredi <mszeredi@redhat.com>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, Christian
 Brauner <christian.brauner@ubuntu.com>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Fenghua Yu <fenghua.yu@intel.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Brian Gerst <brgerst@gmail.com>, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Willem de Bruijn <willemb@google.com>,
 Nicholas Piggin <npiggin@gmail.com>, Suren
 Baghdasaryan <surenb@google.com>, Aleksa Sarai <cyphar@cyphar.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Xiaoming Ni <nixiaoming@huawei.com>,
 Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>,
 Chris Zankel <chris@zankel.net>, Michal
 Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Minchan Kim <minchan@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, Borislav
 Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S.
 Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: sonicadvance1@gmail.com
> Sent: 15 January 2021 07:03
> Problem presented:
> A backwards compatibility layer that allows running x86-64 and x86
> processes inside of an AArch64 process.
>   - CPU is emulated
>   - Syscall interface is mostly passthrough
>   - Some syscalls require patching or emulation depending on behaviour
>   - Not viable from the emulator design to use an AArch32 host process
>=20

You are going to need to add all the x86 compatibility code into
your arm64 kernel.
This is likely to be different from the 32bit arm compatibility
because 64bit items are only aligned on 32bit boundaries.
The x86 x32 compatibility will be more like the 32bit arm 'compat'
code - I'm pretty sure arm32 64bit aligned 64bit data.

You'll then need to remember how the process entered the kernel
to work out which compatibility code to invoke.
This is what x86 does.
It allows a single process to do all three types of system call.

Trying to 'patch up' structures outside the kernel, or in the
syscall interface code will always cause grief somewhere.
The only sane place is in the code that uses the structures.
Which, for ioctls, means inside the driver that parses them.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

