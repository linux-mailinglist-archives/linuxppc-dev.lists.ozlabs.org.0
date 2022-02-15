Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 501714B6979
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 11:37:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JycxH6MzMz3cYN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 21:37:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Jycws0Wr8z3bT5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 21:37:31 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 31BC21063;
 Tue, 15 Feb 2022 02:37:29 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.89.144])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CBA53F66F;
 Tue, 15 Feb 2022 02:37:22 -0800 (PST)
Date: Tue, 15 Feb 2022 10:37:15 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH 08/14] arm64: simplify access_ok()
Message-ID: <YguB5BeLoRc4dL7P@FVFF77S0Q05N>
References: <20220214163452.1568807-1-arnd@kernel.org>
 <20220214163452.1568807-9-arnd@kernel.org>
 <CAMj1kXHixUFjV=4m3tzfGz7AiRWc-VczymbKuZq7dyZZNuLKxQ@mail.gmail.com>
 <CAK8P3a2VfvDkueaJNTA9SiB+PFsi_Q17AX+aL46ueooW2ahmQw@mail.gmail.com>
 <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGkG0KMD2rnKAJc3V7X9LP1grbcHTNYMnj_q4GiYfG2pQ@mail.gmail.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>, Guo Ren <guoren@kernel.org>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Brian Cain <bcain@codeaurora.org>, Helge Deller <deller@gmx.de>,
 X86 ML <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Robin Murphy <robin.murphy@arm.com>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>,
 alpha <linux-alpha@vger.kernel.org>, linux-um <linux-um@lists.infradead.org>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Greentime Hu <green.hu@gmail.com>,
 Stafford Horne <shorne@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Nick Hu <nickhu@andestech.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Linux API <linux-api@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 15, 2022 at 10:21:16AM +0100, Ard Biesheuvel wrote:
> On Tue, 15 Feb 2022 at 10:13, Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Tue, Feb 15, 2022 at 9:17 AM Ard Biesheuvel <ardb@kernel.org> wrote:
> > > On Mon, 14 Feb 2022 at 17:37, Arnd Bergmann <arnd@kernel.org> wrote:
> > > > From: Arnd Bergmann <arnd@arndb.de>
> > > >
> > >
> > > With set_fs() out of the picture, wouldn't it be sufficient to check
> > > that bit #55 is clear? (the bit that selects between TTBR0 and TTBR1)
> > > That would also remove the need to strip the tag from the address.
> > >
> > > Something like
> > >
> > >     asm goto("tbnz  %0, #55, %2     \n"
> > >              "tbnz  %1, #55, %2     \n"
> > >              :: "r"(addr), "r"(addr + size - 1) :: notok);
> > >     return 1;
> > > notok:
> > >     return 0;
> > >
> > > with an additional sanity check on the size which the compiler could
> > > eliminate for compile-time constant values.
> >
> > That should work, but I don't see it as a clear enough advantage to
> > have a custom implementation. For the constant-size case, it probably
> > isn't better than a compiler-scheduled comparison against a
> > constant limit, but it does hurt maintainability when the next person
> > wants to change the behavior of access_ok() globally.
> >
> 
> arm64 also has this leading up to the range check, and I think we'd no
> longer need it:
> 
>     if (IS_ENABLED(CONFIG_ARM64_TAGGED_ADDR_ABI) &&
>         (current->flags & PF_KTHREAD || test_thread_flag(TIF_TAGGED_ADDR)))
>             addr = untagged_addr(addr);
> 

ABI-wise, we aim to *reject* tagged pointers unless the task is using the
tagged addr ABI, so we need to retain both the untagging logic and the full
pointer check (to actually check the tag bits) unless we relax that ABI
decision generally (or go context-switch the TCR_EL1.TBI* bits).

Since that has subtle ABI implications, I don't think we should change that
within this series.

If we *did* relax things, we could just check bit 55 here, and unconditionally
clear that in uaccess_mask_ptr(), since LDTR/STTR should fault on kernel memory.
On parts with meltdown those might not fault until committed, and so we need
masking to avoid speculative access to a kernel pointer, and that requires the
prior explciit check.

Thanks,
Mark.
