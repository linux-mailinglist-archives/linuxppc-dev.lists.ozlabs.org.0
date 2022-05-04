Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D2851B0A9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 May 2022 23:32:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ktqmg1fyDz3byb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 07:32:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qix03QWr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qix03QWr; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ktqm02BdSz2yQ9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 07:32:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 31F07619E4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 21:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B84BC385C7
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 May 2022 21:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651699916;
 bh=zFvzT8pCm+1ful8W/hZ4LOb35c/AZPHiTAR5f5uq/tc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qix03QWrW/M9Q01/CbNXabQPqALS0k2BKt6VxlOe1jiP/AezUZVDCvh4yTzGSZ1VX
 f3sd0OANEUGS9y8e49LguWWCyW4IIqICzTbIRENSe7H562JU9DKsizSMJGj0D1qgE0
 e3sbpXCVZ0YHdBu7pjY81yf79hjsGUtLgflShVgutaLE+7z6GG3nTPnUVFOGctNypM
 uPNVpy9CFsHRw2h5q6RwUUMPGQDWh/B3pMSzlWBDN62C8KEDNkvEiyYMjP44xLdr3z
 lxTJ/50ArU+B8Ay1W19vAfqkOvhBHHTgMSpDt0dLDSO9PzH0nQh5Pjqn5G0BCRwXrd
 JEEWLoC1A5IGg==
Received: by mail-lj1-f172.google.com with SMTP id c15so3300974ljr.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 May 2022 14:31:56 -0700 (PDT)
X-Gm-Message-State: AOAM532S7rBCS1H9N6ctxVoBEZoIClo62xatJxXS4X7ZvZ6ZKvL21LDr
 AWPihXcAf5/IkNSNey6u58GL9eNAI+dP4g4UgUw=
X-Google-Smtp-Source: ABdhPJxAVZcK+UbsrIHV3UqhufeJ7C2MWsg9y8caQR3XP4mze6wyb/qHpchpXkh4iCCt0pJlSodAlnXDA871Nj1pC0U=
X-Received: by 2002:adf:e106:0:b0:20a:b31b:213d with SMTP id
 t6-20020adfe106000000b0020ab31b213dmr17558428wrz.219.1651699904306; Wed, 04
 May 2022 14:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220429135108.2781579-2-schnelle@linux.ibm.com>
 <20220504210840.GA469916@bhelgaas>
In-Reply-To: <20220504210840.GA469916@bhelgaas>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 4 May 2022 23:31:28 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
Message-ID: <CAK8P3a0sJgMSpZB_Butx2gO0hapYZy-Dm_QH-hG5rOaq_ZgsXg@mail.gmail.com>
Subject: Re: [RFC v2 01/39] Kconfig: introduce HAS_IOPORT option and select it
 as necessary
To: Bjorn Helgaas <helgaas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Will Deacon <will@kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-pci <linux-pci@vger.kernel.org>, Matt Turner <mattst88@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 "open list:M68K ARCHITECTURE" <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:ALPHA PORT" <linux-alpha@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 4, 2022 at 11:08 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Fri, Apr 29, 2022 at 03:49:59PM +0200, Niklas Schnelle wrote:
> > We introduce a new HAS_IOPORT Kconfig option to indicate support for
> > I/O Port access. In a future patch HAS_IOPORT=n will disable compilation
> > of the I/O accessor functions inb()/outb() and friends on architectures
> > which can not meaningfully support legacy I/O spaces such as s390 or
> > where such support is optional.
>
> So you plan to drop inb()/outb() on architectures where I/O port space
> is optional?  So even platforms that have I/O port space may not be
> able to use it?
>
> This feels like a lot of work where the main benefit is to keep
> Kconfig from offering drivers that aren't of interest on s390.
>
> Granted, there may be issues where inb()/outb() does the wrong thing
> such as dereferencing null pointers when I/O port space isn't
> implemented.  I think that's a defect in inb()/outb() and could be
> fixed there.

The current implementation in asm-generic/io.h implements inb()/outb()
using readb()/writeb() with a fixed architecture specific offset.

There are three possible things that can happen here:

a) there is a host bridge driver that maps its I/O ports to this window,
    and everything works
b) the address range is reserved and accessible but no host bridge
   driver has mapped its registers there, so an access causes a
   page fault
c) the architecture does not define an offset, and accessing low I/O
    ports ends up as a NULL pointer dereference

The main goal is to avoid c), which is what happens on s390, but
can also happen elsewhere. Catching b) would be nice as well,
but is much harder to do from generic code as you'd need an
architecture specific inline asm statement to insert a ex_table
fixup, or a runtime conditional on each access.

         Arnd
