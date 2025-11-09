Return-Path: <linuxppc-dev+bounces-13974-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E33C43817
	for <lists+linuxppc-dev@lfdr.de>; Sun, 09 Nov 2025 04:23:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3ynD6QKTz303y;
	Sun,  9 Nov 2025 14:23:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762658624;
	cv=none; b=FR2VEs8RGug+2s9pazE2a33JsBZXff57X0GC583mbsVu6k+itJs/aH88nEZAu+ueHCtZdYCjItWgoa2A04lGC2L2z+FmNVF4IQgyNoH3N7zjdxAoPVlwzXzfftoimxssyqFJ4ipLvlmgXCDkOBs2Nw4PXu/OuypB33Xsj/EWSRq9CawFTatxBO52GQe6Fe8b1qPrOd1Ma8woqrB31h/J4WQKVSxWJsmvL2nb3pfHnRlxzTljh0+Wl9T2RWR+EmwlUxkBm859qJsuKoQqluGIU+i5VPZbLjLvwsV/mRNZgjU9kAqVilVj47nwuDXNR6zG18U0L8PkNVNvpmrN8DiBfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762658624; c=relaxed/relaxed;
	bh=vP2lHqq1yss88mLftJL/V+DTQZsv/bcvlPmP+YM7xoI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=olOMqvoCTBK2fuRBQkg+ht6fSt3HxElsqWx5AMEcIFONf0X0506FgG0oRzn7H6ygsBV/r06QlOXZ4+N8zAY1IClPJS3NRW56xLHQ4V/JQMIz3lxCdLcaNxdv7YuTfcSNSGGZtidPKKZq+uRsY4YlfxK0tBdG5mj+PJM4d4W0F3o9fncmh6pTvLy15woaH3ro24/7ldQGuhcfIcNKVcbO9XjvdfGu6/8iKwswEIouI2SwOL5b6WvqbnXNprqWI+2GC3Fkq++Z4RE85AK8Hd2UdKi/ztEWodwvv8oB4KRWDwLQhJn62EvxJefGyku7IqKjoaoNj5bAg4v5vsH3FBRbUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org) smtp.mailfrom=orcam.me.uk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3ynC5jRcz2yjr
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Nov 2025 14:23:43 +1100 (AEDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 5947792009C; Sun,  9 Nov 2025 04:23:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 57A8792009B;
	Sun,  9 Nov 2025 03:23:31 +0000 (GMT)
Date: Sun, 9 Nov 2025 03:23:31 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Arnd Bergmann <arnd@arndb.de>
cc: Andy Lutomirski <luto@kernel.org>, 
    =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Vincenzo Frascino <vincenzo.frascino@arm.com>, 
    "David S . Miller" <davem@davemloft.net>, 
    Andreas Larsson <andreas@gaisler.com>, 
    Nick Alcock <nick.alcock@oracle.com>, John Stultz <jstultz@google.com>, 
    Stephen Boyd <sboyd@kernel.org>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    shuah <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
    Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
    "Jason A . Donenfeld" <Jason@zx2c4.com>, 
    Russell King <linux@armlinux.org.uk>, 
    Madhavan Srinivasan <maddy@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
    Christophe Leroy <christophe.leroy@csgroup.eu>, 
    Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
    loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
    linux-s390@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH v5 00/34] sparc64: vdso: Switch to the generic vDSO
 library
In-Reply-To: <6452c785-872a-4fe7-90e1-8138d73c6218@app.fastmail.com>
Message-ID: <alpine.DEB.2.21.2511090221080.25436@angie.orcam.me.uk>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de> <b870aa47-5ed4-4dcf-a407-eca83d1733d8@app.fastmail.com> <6452c785-872a-4fe7-90e1-8138d73c6218@app.fastmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, 8 Nov 2025, Arnd Bergmann wrote:

> On other architectures, I see that parisc (always aliasing) has stubbed
> out the vdso functions, while mips/loongson has limited the page size
> selection to never alias. A few other mips platforms can theoretically
> enable both small pages and vdso, but my guess is that in practice
> they don't use the vdso (mips32/ath79) or they use 16KB pages
> (rm, dec, ip22) based on the defconfig settings.

 Umm, I'd have to dive into the details (and I hardly have the resources 
at hand), but quite a bunch of MIPS microarchitectures suffer from cache 
aliases; some even have VIVT caches.  A quick check with a system I have 
running at my lab:

$ ldd /bin/true
        linux-vdso.so.1 =>  (0x77ff4000)
        libc.so.6 => /lib/libc.so.6 (0x77e50000)
        /lib/ld.so.1 (0x77fcc000)
$ getconf PAGESIZE
4096
$ dmesg | grep linesize
Primary instruction cache 32kB, VIPT, 4-way, linesize 32 bytes.
Primary data cache 32kB, 4-way, VIPT, cache aliases, linesize 32 bytes
MIPS secondary cache 512kB, 8-way, linesize 32 bytes.
$ 

Some microarchitectures have aliasing prevention implemented in hardware, 
e.g. with the MTI 24K core:

                 Table 6-31 Config7 Register Field Descriptions
-------------+---------------------------------------------+-------+---------
   Fields    |                                             |       |
------+------+                                             | Read/ |  Reset 
 Name | Bits |                Description                  | Write |  State
======+======+=============================================+=======+=========
      |      | Alias removed: This bit indicates that the  |       |
      |      | data cache is organized to avoid virtual    |       |
  AR  |  16  | aliasing problems.  This bit is only set if |   R   |  Based
      |      | the data cache config and MMU type would    |       |  on HW
      |      | normally cause aliasing - i.e., only for    |       | present
      |      | the 32KB data cache and TLB-based MMU.      |       |
------+------+---------------------------------------------+-------+---------

But this is entirely optional and not architecturally guaranteed; Config7 
is a vendor space register.

 DEC platforms have a selectable page size (for R4k CPUs; R3k CPUs have a 
PIPT write-through cache, so no issue with aliasing ever) and 4KiB is the 
common choice, but they never suffer from aliases as the hardware resolves 
them.  It's not completely transparent as with the 24K option shown above, 
as a virtual coherency exception is triggered instead, at separate levels 
for the I$ and D$ each, and we handle it in software:

$ getconf PAGESIZE
4096
$ dmesg | grep linesize
Primary instruction cache 16kB, VIPT, direct mapped, linesize 16 bytes.
Primary data cache 16kB, direct mapped, VIPT, cache aliases, linesize 16 bytes
Unified secondary cache 1024kB direct mapped, linesize 32 bytes.
$ uptime
 02:46:16  up 250 days,  4:03,  2 users,  load average: 0.01, 0.01, 0.00
$ cat /proc/cpuinfo
system type		: Digital DECstation 5000/2x0
machine			: Unknown
processor		: 0
cpu model		: R4400SC V4.0  FPU V0.0
BogoMIPS		: 59.60
wait instruction	: no
microsecond timers	: yes
tlb_entries		: 48
extra interrupt vector	: no
hardware watchpoint	: yes, count: 0, address/irw mask: []
isa			: mips1 mips2 mips3
ASEs implemented	:
Options implemented	: tlb 4kex 4k_cache fpu 32fpr cache_cdex_p cache_cdex_s llsc dc_aliases inclusive_pcaches nan_legacy
shadow register sets	: 1
kscratch registers	: 0
package			: 0
core			: 0
VCED exceptions		: 372522
VCEI exceptions		: 16922804

$ 

(see the figures at the bottom; uptime quoted for an idea of the rate, 
though the system hasn't been heavily loaded).  It is possible with the 
aid of S$, which is inclusive and PIPT.

 FWIW,

  Maciej

