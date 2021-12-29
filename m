Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80335481A97
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 09:01:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JPgh42yG1z3cSM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Dec 2021 19:01:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gfBUGGZt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gfBUGGZt; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JNxzG5nF5z2yng
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Dec 2021 14:41:46 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 888C1B81806
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Dec 2021 03:41:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA9EC36AF3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Dec 2021 03:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640749300;
 bh=sMe3q8ad98okMs4HLXxIEZG5eWgoWBzrycggRgzNn0g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gfBUGGZtKlSdchISLRCbgoh5ApvOms88vBNDBueg3GSAqIXPSkyv3hT3+JLM3V8rd
 NBXbvcDdAfWC4ZFlxNGOThtvDBg9TpHafmYp6AoKHdo7tXLFlhXn/lylE8k/3yGTpP
 qaq0Iy+2+aSp302rKXO4x7uVkeduQCA9T79BgtkTt8BYVlCGkm7lz25aZ+zHWTEd0S
 9pUWnmx3E/895Wpun2xbxI2jymz5JySeYBwqar7GOpedMrFMwNkqar44IVWO2AO8sP
 JiT1Dd1gOzEi7FZfU/lHPGKEXgT7N7xI/S78pUQVJ5QyKVMrZUQVQPCKosaR34UMGK
 rebkE+b3YsYqw==
Received: by mail-wm1-f50.google.com with SMTP id
 f134-20020a1c1f8c000000b00345c05bc12dso11073235wmf.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Dec 2021 19:41:39 -0800 (PST)
X-Gm-Message-State: AOAM531J9BxLaEH/d/LPLw1j1Qdh5JB2cyU12vNYXcdC/Xy7Mg+h+OnD
 3HEc7oFuyCrAUz9iGmFSJOt+QXJH525esQjnFU0=
X-Google-Smtp-Source: ABdhPJwExVf1S5yWbdFaQXvSS7m+9fv3xxH0eSVAhqrz/dUiLqmyF5p5xrdPthuPvZdKvgQOvhEXVEuNpJp0LGzgDhQ=
X-Received: by 2002:a1c:7418:: with SMTP id p24mr20244545wmc.82.1640749287841; 
 Tue, 28 Dec 2021 19:41:27 -0800 (PST)
MIME-Version: 1.0
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-3-schnelle@linux.ibm.com>
 <CAMuHMdXk6VcDryekkMJ3aGFnw4LLWOWMi8M2PwjT81PsOsOBMQ@mail.gmail.com>
 <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
In-Reply-To: <d406b93a-0f76-d056-3380-65d459d05ea9@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 28 Dec 2021 22:41:18 -0500
X-Gmail-Original-Message-ID: <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
Message-ID: <CAK8P3a2j-OFUUp+haHoV4PyL-On4EASZ9+59SDqNqmL8Gv_k7Q@mail.gmail.com>
Subject: Re: [RFC 02/32] Kconfig: introduce HAS_IOPORT option and select it as
 necessary
To: Michael Schmitz <schmitzmic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 30 Dec 2021 18:58:16 +1100
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-pci@vger.kernel.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 sparclinux@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 linux-ia64@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Karol Gugala <kgugala@antmicro.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-parisc@vger.kernel.org,
 Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>,
 Niklas Schnelle <schnelle@linux.ibm.com>, Jeff Dike <jdike@addtoit.com>,
 John Garry <john.garry@huawei.com>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Greentime Hu <green.hu@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Brian Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>,
 linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 28, 2021 at 8:20 PM Michael Schmitz <schmitzmic@gmail.com> wrote:
> Am 28.12.2021 um 23:08 schrieb Geert Uytterhoeven:
> > On Mon, Dec 27, 2021 at 5:44 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> >> We introduce a new HAS_IOPORT Kconfig option to gate support for
> >> I/O port access. In a future patch HAS_IOPORT=n will disable compilation
> >> of the I/O accessor functions inb()/outb() and friends on architectures
> >> which can not meaningfully support legacy I/O spaces. On these platforms
> >> inb()/outb() etc are currently just stubs in asm-generic/io.h which when
> >> called will cause a NULL pointer access which some compilers actually
> >> detect and warn about.
> >>
> >> The dependencies on HAS_IOPORT in drivers as well as ifdefs for
> >> HAS_IOPORT specific sections will be added in subsequent patches on
> >> a per subsystem basis. Then a final patch will ifdef the I/O access
> >> functions on HAS_IOPORT thus turning any use not gated by HAS_IOPORT
> >> into a compile-time warning.
> >>
> >> Link: https://lore.kernel.org/lkml/CAHk-=wg80je=K7madF4e7WrRNp37e3qh6y10Svhdc7O8SZ_-8g@mail.gmail.com/
> >> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> >> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> >> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> >
> > Thanks for your patch!
> >
> >> --- a/arch/m68k/Kconfig
> >> +++ b/arch/m68k/Kconfig
> >> @@ -16,6 +16,7 @@ config M68K
> >>         select GENERIC_CPU_DEVICES
> >>         select GENERIC_IOMAP
> >>         select GENERIC_IRQ_SHOW
> >> +       select HAS_IOPORT
> >>         select HAVE_AOUT if MMU
> >>         select HAVE_ASM_MODVERSIONS
> >>         select HAVE_DEBUG_BUGVERBOSE
> >
> > This looks way too broad to me: most m68k platform do not have I/O
> > port access support.
> >
> > My gut feeling says:
> >
> >     select HAS_IOPORT if PCI || ISA
> >
> > but that might miss some intricate details...
>
> In particular, this misses the Atari ROM port ISA adapter case -
>
>         select HAS_IOPORT if PCI || ISA || ATARI_ROM_ISA
>
> might do instead.

Right, makes sense. I had suggested to go the easy way and assume that
each architecture would select HAS_IOPORT if any configuration supports
it, but it looks like for m68k there is a clearly defined set of platforms that
do.

Note that for the platforms that don't set any of the three symbols, the
fallback makes inb() an alias for readb() with a different argument type,
so there may be m68k specific drivers that rely on this, but those would
already be broken if ATARI_ROM_ISA is set.

          Arnd
