Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 365384B6ABA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 12:25:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jydzf5nvcz3cYY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 22:25:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JydzC5jn4z30jV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 22:24:38 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF7F21476;
 Tue, 15 Feb 2022 03:24:36 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.89.144])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 160403F718;
 Tue, 15 Feb 2022 03:24:29 -0800 (PST)
Date: Tue, 15 Feb 2022 11:24:26 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: David Laight <David.Laight@ACULAB.COM>
Subject: Re: [PATCH 08/14] arm64: simplify access_ok()
Message-ID: <YguNamXeOtGVPyJf@FVFF77S0Q05N>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
 <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
 <153bb1887f484ed79ce8224845a4b2ea@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <153bb1887f484ed79ce8224845a4b2ea@AcuMS.aculab.com>
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
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Brian Cain <bcain@codeaurora.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, X86 ML <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 'Ard Biesheuvel' <ardb@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 linux-um <linux-um@lists.infradead.org>, Richard Weinberger <richard@nod.at>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 Greentime Hu <green.hu@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, "open list:MIPS" <linux-mips@vger.kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 15, 2022 at 09:30:41AM +0000, David Laight wrote:
> From: Ard Biesheuvel
> > Sent: 15 February 2022 08:18
> > 
> > On Mon, 14 Feb 2022 at 17:37, Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > arm64 has an inline asm implementation of access_ok() that is derived from
> > > the 32-bit arm version and optimized for the case that both the limit and
> > > the size are variable. With set_fs() gone, the limit is always constant,
> > > and the size usually is as well, so just using the default implementation
> > > reduces the check into a comparison against a constant that can be
> > > scheduled by the compiler.
> > >
> > > On a defconfig build, this saves over 28KB of .text.
> > >
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > ---
> > >  arch/arm64/include/asm/uaccess.h | 28 +++++-----------------------
> > >  1 file changed, 5 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> > > index 357f7bd9c981..e8dce0cc5eaa 100644
> > > --- a/arch/arm64/include/asm/uaccess.h
> > > +++ b/arch/arm64/include/asm/uaccess.h
> > > @@ -26,6 +26,8 @@
> > >  #include <asm/memory.h>
> > >  #include <asm/extable.h>
> > >
> > > +static inline int __access_ok(const void __user *ptr, unsigned long size);
> > > +
> > >  /*
> > >   * Test whether a block of memory is a valid user space address.
> > >   * Returns 1 if the range is valid, 0 otherwise.
> > > @@ -33,10 +35,8 @@
> > >   * This is equivalent to the following test:
> > >   * (u65)addr + (u65)size <= (u65)TASK_SIZE_MAX
> > >   */
> > > -static inline unsigned long __access_ok(const void __user *addr, unsigned long size)
> > > +static inline int access_ok(const void __user *addr, unsigned long size)
> > >  {
> > > -       unsigned long ret, limit = TASK_SIZE_MAX - 1;
> > > -
> > >         /*
> > >          * Asynchronous I/O running in a kernel thread does not have the
> > >          * TIF_TAGGED_ADDR flag of the process owning the mm, so always untag
> > > @@ -46,27 +46,9 @@ static inline unsigned long __access_ok(const void __user *addr, unsigned long s
> > >             (current->flags & PF_KTHREAD || test_thread_flag(TIF_TAGGED_ADDR)))
> > >                 addr = untagged_addr(addr);
> > >
> > > -       __chk_user_ptr(addr);
> > > -       asm volatile(
> > > -       // A + B <= C + 1 for all A,B,C, in four easy steps:
> > > -       // 1: X = A + B; X' = X % 2^64
> > > -       "       adds    %0, %3, %2\n"
> > > -       // 2: Set C = 0 if X > 2^64, to guarantee X' > C in step 4
> > > -       "       csel    %1, xzr, %1, hi\n"
> > > -       // 3: Set X' = ~0 if X >= 2^64. For X == 2^64, this decrements X'
> > > -       //    to compensate for the carry flag being set in step 4. For
> > > -       //    X > 2^64, X' merely has to remain nonzero, which it does.
> > > -       "       csinv   %0, %0, xzr, cc\n"
> > > -       // 4: For X < 2^64, this gives us X' - C - 1 <= 0, where the -1
> > > -       //    comes from the carry in being clear. Otherwise, we are
> > > -       //    testing X' - C == 0, subject to the previous adjustments.
> > > -       "       sbcs    xzr, %0, %1\n"
> > > -       "       cset    %0, ls\n"
> > > -       : "=&r" (ret), "+r" (limit) : "Ir" (size), "0" (addr) : "cc");
> > > -
> > > -       return ret;
> > > +       return likely(__access_ok(addr, size));
> > >  }
> > > -#define __access_ok __access_ok
> > > +#define access_ok access_ok
> > >
> > >  #include <asm-generic/access_ok.h>
> > >
> > > --
> > > 2.29.2
> > >
> > 
> > With set_fs() out of the picture, wouldn't it be sufficient to check
> > that bit #55 is clear? (the bit that selects between TTBR0 and TTBR1)
> > That would also remove the need to strip the tag from the address.
> > 
> > Something like
> > 
> >     asm goto("tbnz  %0, #55, %2     \n"
> >              "tbnz  %1, #55, %2     \n"
> >              :: "r"(addr), "r"(addr + size - 1) :: notok);
> >     return 1;
> > notok:
> >     return 0;
> > 
> > with an additional sanity check on the size which the compiler could
> > eliminate for compile-time constant values.
> 
> Is there are reason not to just use:
> 	size < 1u << 48 && !((addr | (addr + size - 1)) & 1u << 55)

That has a few problems, including being an ABI change for tasks not using the
relaxed tag ABI and not working for 52-bit VAs.

If we really want to relax the tag checking aspect, there are simpler options,
including variations on Ard's approach above.

> Ugg, is arm64 addressing as horrid as it looks - with the 'kernel'
> bit in the middle of the virtual address space?

It's just sign-extension/canonical addressing, except bits [63:56] are
configurable between a few uses, so the achitecture says bit 55 is the one to
look at in all configurations to figure out if an address is high/low (in
addition to checking the remaining bits are canonical).

Thanks,
Mark.
