Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0E254655E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 13:19:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKJPj3R9Sz3fWd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 21:19:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KzJVoheO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KzJVoheO;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJkhb3LtYz3bmK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 22:59:59 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A0C4EB82DD0;
	Thu,  9 Jun 2022 12:59:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C621CC34114;
	Thu,  9 Jun 2022 12:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654779593;
	bh=nzEK1QIv+0tFYoCD6R99p0Aqj3afNfZxkCG+vFs8wK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KzJVoheObhl6qshf52rKP9EHpn2Xt7sVGKj5ICkgKtc2fWpcVodL9tDErwEZayDAF
	 AHBQMsEYGtNiPxJCVwfJsPUjn+IL9pv+m+aCwWG/rP+idyO9NrFNW8L4dMgdrn8FnF
	 FTF7O1RFgjYrub3HRargNLGDTrOctdXZ7ewu7xfNOKfXfTOFB1VIUC3gKQpoH76efW
	 459YKdsw+5yFEBmz/09TgWBTfrvNOhhpDdS4Wz3eKHCGRZY8mHVcGzY1CzABjbEZ0w
	 IH2Xs75xUZGg4nSQVa5DyvR9sYYD0h66HRwBGLEgqAFR5DtrIXi0u2k74u1lU0v7JO
	 bZAL+nK5nrfhw==
Date: Thu, 9 Jun 2022 15:57:54 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] kprobes: Enable tracing for mololithic kernel images
Message-ID: <YqHuUsevcvaaunVq@iki.fi>
References: <20220608000014.3054333-1-jarkko@profian.com>
 <f2030fb4-4978-068b-6250-5bd5b2746675@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2030fb4-4978-068b-6250-5bd5b2746675@csgroup.eu>
X-Mailman-Approved-At: Fri, 10 Jun 2022 21:09:20 +1000
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
Cc: Dan Li <ashimida@linux.alibaba.com>, Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Javier Martinez Canillas <javierm@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Guenter Roeck <linux@roeck-us.net>, =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>, Michael Roth <michael.roth@amd.com>, Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Andrey Konovalov <andreyknvl@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Wu Caize <zepan@sipeed.com>, Guo Ren <guoren@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>, Luis Machado <luis.machado@linaro.org>, Atsushi
  Nemoto <anemo@mba.ocn.ne.jp>, Dave Hansen <dave.hansen@linux.intel.com>, Joey Gouly <joey.gouly@arm.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Song Liu <song@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Ilya Leoshkevich <iii@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Helge Deller <deller@gmx.de>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, Sven Schnelle <svens@linux.ibm.com>, Tom Lendacky <thomas.lendacky@amd.com>, Vasily Gorbik <gor@linux.ibm.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Dave Anglin <dave.anglin@bell.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Daniel Axtens <dja@axtens.net>, Nicolas Pitre <nico@fluxnic.net>, "Eric W. Biederman" <ebiederm@xmission.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>, Emil Renner Berthing <kernel@esmil.dk>, Jordan Niethe <jniet
 he5@gmail.com>, Atish Patra <atishp@atishpatra.org>, 

Alexei Starovoitov <ast@kernel.org>, Will Deacon <will@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Jarkko Sakkinen <jarkko@profian.com>, Sami Tolvanen <samitolvanen@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, Nathan Chancellor <nathan@kernel.org>, "Russell King \(Oracle\)" <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Alexander Egorenkov <egorenar@linux.ibm.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, Nathaniel McCallum <nathaniel@profian.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Tobias Huschle <huschle@linux.ibm.com>, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <s
 parclinux@vger.kernel.org>, Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>, Chen Zhongjin <chenzhongjin@huawei.com>, Ard Biesheuvel <ardb@kernel.org>, "x86@kernel.org" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Ingo Molnar <mingo@redhat.com>, Aaron Tomlin <atomlin@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Liao Chang <liaochang1@huawei.com>, Paul Walmsley <paul.walmsley@sifive.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Thomas Richter <tmricht@linux.ibm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Changbin Du <changbin.du@intel.com>, Palmer Dabbelt <palmer@dabbelt.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 09, 2022 at 08:30:12AM +0000, Christophe Leroy wrote:
> 
> 
> Le 08/06/2022 à 01:59, Jarkko Sakkinen a écrit :
> > [You don't often get email from jarkko@profian.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > Tracing with kprobes while running a monolithic kernel is currently
> > impossible because CONFIG_KPROBES is dependent of CONFIG_MODULES.  This
> > dependency is a result of kprobes code using the module allocator for the
> > trampoline code.
> > 
> > Detaching kprobes from modules helps to squeeze down the user space,
> > e.g. when developing new core kernel features, while still having all
> > the nice tracing capabilities.
> 
> Nice idea, could also be nice to have BPF without MODULES.

Yeah, for sure. You have to start from somewhere :-) I'd guess this
a step forward also for BPF.

> > 
> > For kernel/ and arch/*, move module_alloc() and module_memfree() to
> > module_alloc.c, and compile as part of vmlinux when either CONFIG_MODULES
> > or CONFIG_KPROBES is enabled.  In addition, flag kernel module specific
> > code with CONFIG_MODULES.
> 
> Nice, but that's not enough. You have to audit every peace of code that 
> depends on CONFIG_MODULES and see if it needs to be activated for your 
> case as well. For instance some powerpc configurations don't honor exec 
> page faults on kernel pages when CONFIG_MODULES is not selected.

Thanks for pointing this out. With "every peace of code" you probably
are referring to the 13 arch-folders, which support kprobes in the first
place (just checking)?

> > As the result, kprobes can be used with a monolithic kernel.
> > 
> > Signed-off-by: Jarkko Sakkinen <jarkko@profian.com>
> 
> I think this patch should be split in a several patches, one (or even 
> one per architectures ?) to make modules_alloc() independant of 
> CONFIG_MODULES, then a patch to make CONFIG_KPROBES independant on 
> CONFIG_MOUDLES.

Agreed. And also because of your previous remark, i.e. each arch needs
it own conclusions of the changes. I purposely did this first as a one
patch in order to get a better picture of the situation.

> > ---
> > Tested with the help of BuildRoot and QEMU:
> > - arm (function tracer)
> > - arm64 (function tracer)
> > - mips (function tracer)
> > - powerpc (function tracer)
> > - riscv (function tracer)
> > - s390 (function tracer)
> > - sparc (function tracer)
> > - x86 (function tracer)
> > - sh (function tracer, for the "pure" kernel/modules_alloc.c path)
> > ---
> >   arch/Kconfig                       |  1 -
> >   arch/arm/kernel/Makefile           |  5 +++
> >   arch/arm/kernel/module.c           | 32 ----------------
> >   arch/arm/kernel/module_alloc.c     | 42 ++++++++++++++++++++
> >   arch/arm64/kernel/Makefile         |  5 +++
> >   arch/arm64/kernel/module.c         | 47 -----------------------
> >   arch/arm64/kernel/module_alloc.c   | 57 ++++++++++++++++++++++++++++
> >   arch/mips/kernel/Makefile          |  5 +++
> >   arch/mips/kernel/module.c          |  9 -----
> >   arch/mips/kernel/module_alloc.c    | 18 +++++++++
> >   arch/parisc/kernel/Makefile        |  5 +++
> >   arch/parisc/kernel/module.c        | 11 ------
> >   arch/parisc/kernel/module_alloc.c  | 23 +++++++++++
> >   arch/powerpc/kernel/Makefile       |  5 +++
> >   arch/powerpc/kernel/module.c       | 37 ------------------
> >   arch/powerpc/kernel/module_alloc.c | 47 +++++++++++++++++++++++
> 
> You are missing necessary changes for powerpc.
> 
> On powerpc 8xx or powerpc 603, software TLB handlers don't honor 
> instruction TLB miss when CONFIG_MODULES are not set, look into 
> head_8xx.S and head_book3s_32.S
> 
> On powerpc book3s/32, all kernel space is set to NX except the module 
> segment. When CONFIG_MODULES is all space is set NX. See 
> mmu_mark_initmem_nx() and is_module_segment().

Thank you! I'll go this through and also try to build an environment
with BuildRoot where I can test-run this configuration.

> >   arch/riscv/kernel/Makefile         |  5 +++
> >   arch/riscv/kernel/module.c         | 10 -----
> >   arch/riscv/kernel/module_alloc.c   | 19 ++++++++++
> >   arch/s390/kernel/Makefile          |  5 +++
> >   arch/s390/kernel/module.c          | 17 ---------
> >   arch/s390/kernel/module_alloc.c    | 33 ++++++++++++++++
> >   arch/sparc/kernel/Makefile         |  5 +++
> >   arch/sparc/kernel/module.c         | 30 ---------------
> >   arch/sparc/kernel/module_alloc.c   | 39 +++++++++++++++++++
> >   arch/x86/kernel/Makefile           |  5 +++
> >   arch/x86/kernel/module.c           | 50 ------------------------
> >   arch/x86/kernel/module_alloc.c     | 61 ++++++++++++++++++++++++++++++
> >   kernel/Makefile                    |  5 +++
> >   kernel/kprobes.c                   | 10 +++++
> >   kernel/module/main.c               | 17 ---------
> >   kernel/module_alloc.c              | 26 +++++++++++++
> >   kernel/trace/trace_kprobe.c        | 10 ++++-
> >   33 files changed, 434 insertions(+), 262 deletions(-)
> >   create mode 100644 arch/arm/kernel/module_alloc.c
> >   create mode 100644 arch/arm64/kernel/module_alloc.c
> >   create mode 100644 arch/mips/kernel/module_alloc.c
> >   create mode 100644 arch/parisc/kernel/module_alloc.c
> >   create mode 100644 arch/powerpc/kernel/module_alloc.c
> >   create mode 100644 arch/riscv/kernel/module_alloc.c
> >   create mode 100644 arch/s390/kernel/module_alloc.c
> >   create mode 100644 arch/sparc/kernel/module_alloc.c
> >   create mode 100644 arch/x86/kernel/module_alloc.c
> >   create mode 100644 kernel/module_alloc.c
> > 
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index fcf9a41a4ef5..e8e3e7998a2e 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -39,7 +39,6 @@ config GENERIC_ENTRY
> > 
> >   config KPROBES
> >          bool "Kprobes"
> > -       depends on MODULES
> >          depends on HAVE_KPROBES
> >          select KALLSYMS
> >          select TASKS_RCU if PREEMPTION
> 
> > diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> > index 2e2a2a9bcf43..5a811cdf230b 100644
> > --- a/arch/powerpc/kernel/Makefile
> > +++ b/arch/powerpc/kernel/Makefile
> > @@ -103,6 +103,11 @@ obj-$(CONFIG_HIBERNATION)  += swsusp_$(BITS).o
> >   endif
> >   obj64-$(CONFIG_HIBERNATION)    += swsusp_asm64.o
> >   obj-$(CONFIG_MODULES)          += module.o module_$(BITS).o
> > +ifeq ($(CONFIG_MODULES),y)
> > +obj-y                          += module_alloc.o
> > +else
> > +obj-$(CONFIG_KPROBES)          += module_alloc.o
> > +endif
> 
> Why not just do:
> 
> obj-$(CONFIG_MODULES)          += module_alloc.o
> obj-$(CONFIG_KPROBES)          += module_alloc.o
> 
> However, a new hidden config item (eg: CONFIG_DYNAMIC_TEXT) selected by 
> both CONFIG_MODULES and CONFIG_KPROBES would make like easier when 
> you'll come to do the changes required.

I'll do this. Russell King also pointed out the same thing.

> >   obj-$(CONFIG_44x)              += cpu_setup_44x.o
> >   obj-$(CONFIG_PPC_FSL_BOOK3E)   += cpu_setup_fsl_booke.o
> >   obj-$(CONFIG_PPC_DOORBELL)     += dbell.o
> > diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
> > index f6d6ae0a1692..b30e00964a60 100644
> > --- a/arch/powerpc/kernel/module.c
> > +++ b/arch/powerpc/kernel/module.c
> > @@ -88,40 +88,3 @@ int module_finalize(const Elf_Ehdr *hdr,
> > 
> >          return 0;
> >   }
> > -
> > -static __always_inline void *
> > -__module_alloc(unsigned long size, unsigned long start, unsigned long end, bool nowarn)
> > -{
> > -       pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
> > -       gfp_t gfp = GFP_KERNEL | (nowarn ? __GFP_NOWARN : 0);
> > -
> > -       /*
> > -        * Don't do huge page allocations for modules yet until more testing
> > -        * is done. STRICT_MODULE_RWX may require extra work to support this
> > -        * too.
> > -        */
> > -       return __vmalloc_node_range(size, 1, start, end, gfp, prot,
> > -                                   VM_FLUSH_RESET_PERMS,
> > -                                   NUMA_NO_NODE, __builtin_return_address(0));
> > -}
> > -
> > -void *module_alloc(unsigned long size)
> > -{
> > -#ifdef MODULES_VADDR
> > -       unsigned long limit = (unsigned long)_etext - SZ_32M;
> > -       void *ptr = NULL;
> > -
> > -       BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
> > -
> > -       /* First try within 32M limit from _etext to avoid branch trampolines */
> > -       if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
> > -               ptr = __module_alloc(size, limit, MODULES_END, true);
> > -
> > -       if (!ptr)
> > -               ptr = __module_alloc(size, MODULES_VADDR, MODULES_END, false);
> > -
> > -       return ptr;
> > -#else
> > -       return __module_alloc(size, VMALLOC_START, VMALLOC_END, false);
> > -#endif
> > -}
> > diff --git a/arch/powerpc/kernel/module_alloc.c b/arch/powerpc/kernel/module_alloc.c
> > new file mode 100644
> > index 000000000000..48541c27ce46
> > --- /dev/null
> > +++ b/arch/powerpc/kernel/module_alloc.c
> > @@ -0,0 +1,47 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + *  Kernel module help for powerpc.
> > + *  Copyright (C) 2001, 2003 Rusty Russell IBM Corporation.
> > + *  Copyright (C) 2008 Freescale Semiconductor, Inc.
> > + */
> > +
> > +#include <linux/mm.h>
> > +#include <linux/moduleloader.h>
> > +#include <linux/vmalloc.h>
> > +
> > +static __always_inline void *
> > +__module_alloc(unsigned long size, unsigned long start, unsigned long end, bool nowarn)
> > +{
> > +       pgprot_t prot = strict_module_rwx_enabled() ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
> > +       gfp_t gfp = GFP_KERNEL | (nowarn ? __GFP_NOWARN : 0);
> > +
> > +       /*
> > +        * Don't do huge page allocations for modules yet until more testing
> > +        * is done. STRICT_MODULE_RWX may require extra work to support this
> > +        * too.
> > +        */
> > +       return __vmalloc_node_range(size, 1, start, end, gfp, prot,
> > +                                   VM_FLUSH_RESET_PERMS,
> > +                                   NUMA_NO_NODE, __builtin_return_address(0));
> > +}
> > +
> > +void *module_alloc(unsigned long size)
> > +{
> > +#ifdef MODULES_VADDR
> 
> Is MODULES_VADDR defined even when CONFIG_MODULES is not ?

Yes, by this in ppc's asm/pgtable.h:

#ifdef CONFIG_PPC_BOOK3S
#include <asm/book3s/pgtable.h>
#else
#include <asm/nohash/pgtable.h>
#endif /* !CONFIG_PPC_BOOK3S */

> > +       unsigned long limit = (unsigned long)_etext - SZ_32M;
> > +       void *ptr = NULL;
> > +
> > +       BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
> > +
> > +       /* First try within 32M limit from _etext to avoid branch trampolines */
> > +       if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
> > +               ptr = __module_alloc(size, limit, MODULES_END, true);
> > +
> > +       if (!ptr)
> > +               ptr = __module_alloc(size, MODULES_VADDR, MODULES_END, false);
> > +
> > +       return ptr;
> > +#else
> > +       return __module_alloc(size, VMALLOC_START, VMALLOC_END, false);
> > +#endif
> > +}
> 
> > diff --git a/kernel/Makefile b/kernel/Makefile
> > index 318789c728d3..2981fe42060d 100644
> > --- a/kernel/Makefile
> > +++ b/kernel/Makefile
> > @@ -53,6 +53,11 @@ obj-y += livepatch/
> >   obj-y += dma/
> >   obj-y += entry/
> >   obj-$(CONFIG_MODULES) += module/
> > +ifeq ($(CONFIG_MODULES),y)
> > +obj-y += module_alloc.o
> > +else
> > +obj-$(CONFIG_KPROBES) += module_alloc.o
> > +endif
> 
> Same comment, could be:
> 
> obj-$(CONFIG_MODULES)          += module_alloc.o
> obj-$(CONFIG_KPROBES)          += module_alloc.o

Ditto.

> 
> > 
> >   obj-$(CONFIG_KCMP) += kcmp.o
> >   obj-$(CONFIG_FREEZER) += freezer.o
> > diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> > index f214f8c088ed..3f9876374cd3 100644
> > --- a/kernel/kprobes.c
> > +++ b/kernel/kprobes.c
> > @@ -1569,6 +1569,7 @@ static int check_kprobe_address_safe(struct kprobe *p,
> >                  goto out;
> >          }
> > 
> > +#ifdef CONFIG_MODULES
> >          /* Check if 'p' is probing a module. */
> >          *probed_mod = __module_text_address((unsigned long) p->addr);
> >          if (*probed_mod) {
> > @@ -1592,6 +1593,8 @@ static int check_kprobe_address_safe(struct kprobe *p,
> >                          ret = -ENOENT;
> >                  }
> >          }
> > +#endif
> > +
> >   out:
> >          preempt_enable();
> >          jump_label_unlock();
> > @@ -2475,6 +2478,7 @@ int kprobe_add_area_blacklist(unsigned long start, unsigned long end)
> >          return 0;
> >   }
> > 
> > +#ifdef CONFIG_MODULES
> >   /* Remove all symbols in given area from kprobe blacklist */
> >   static void kprobe_remove_area_blacklist(unsigned long start, unsigned long end)
> >   {
> > @@ -2492,6 +2496,7 @@ static void kprobe_remove_ksym_blacklist(unsigned long entry)
> >   {
> >          kprobe_remove_area_blacklist(entry, entry + 1);
> >   }
> > +#endif /* CONFIG_MODULES */
> > 
> >   int __weak arch_kprobe_get_kallsym(unsigned int *symnum, unsigned long *value,
> >                                     char *type, char *sym)
> > @@ -2557,6 +2562,7 @@ static int __init populate_kprobe_blacklist(unsigned long *start,
> >          return ret ? : arch_populate_kprobe_blacklist();
> >   }
> > 
> > +#ifdef CONFIG_MODULES
> >   static void add_module_kprobe_blacklist(struct module *mod)
> >   {
> >          unsigned long start, end;
> > @@ -2658,6 +2664,7 @@ static struct notifier_block kprobe_module_nb = {
> >          .notifier_call = kprobes_module_callback,
> >          .priority = 0
> >   };
> > +#endif /* CONFIG_MODULES */
> > 
> >   void kprobe_free_init_mem(void)
> >   {
> > @@ -2717,8 +2724,11 @@ static int __init init_kprobes(void)
> >          err = arch_init_kprobes();
> >          if (!err)
> >                  err = register_die_notifier(&kprobe_exceptions_nb);
> > +
> > +#ifdef CONFIG_MODULES
> >          if (!err)
> >                  err = register_module_notifier(&kprobe_module_nb);
> > +#endif
> > 
> >          kprobes_initialized = (err == 0);
> >          kprobe_sysctls_init();
> > diff --git a/kernel/module/main.c b/kernel/module/main.c
> > index fed58d30725d..7fa182b78550 100644
> > --- a/kernel/module/main.c
> > +++ b/kernel/module/main.c
> > @@ -1121,16 +1121,6 @@ resolve_symbol_wait(struct module *mod,
> >          return ksym;
> >   }
> > 
> > -void __weak module_memfree(void *module_region)
> > -{
> > -       /*
> > -        * This memory may be RO, and freeing RO memory in an interrupt is not
> > -        * supported by vmalloc.
> > -        */
> > -       WARN_ON(in_interrupt());
> > -       vfree(module_region);
> > -}
> > -
> >   void __weak module_arch_cleanup(struct module *mod)
> >   {
> >   }
> > @@ -1606,13 +1596,6 @@ static void dynamic_debug_remove(struct module *mod, struct _ddebug *debug)
> >                  ddebug_remove_module(mod->name);
> >   }
> > 
> > -void * __weak module_alloc(unsigned long size)
> > -{
> > -       return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
> > -                       GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS,
> > -                       NUMA_NO_NODE, __builtin_return_address(0));
> > -}
> > -
> >   bool __weak module_init_section(const char *name)
> >   {
> >          return strstarts(name, ".init");
> > diff --git a/kernel/module_alloc.c b/kernel/module_alloc.c
> > new file mode 100644
> > index 000000000000..26a4c60998ad
> > --- /dev/null
> > +++ b/kernel/module_alloc.c
> > @@ -0,0 +1,26 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * Copyright (C) 2002 Richard Henderson
> > + * Copyright (C) 2001 Rusty Russell, 2002, 2010 Rusty Russell IBM.
> > + */
> > +
> > +#include <linux/mm.h>
> > +#include <linux/moduleloader.h>
> > +#include <linux/vmalloc.h>
> > +
> > +void * __weak module_alloc(unsigned long size)
> > +{
> > +       return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
> > +                       GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS,
> > +                       NUMA_NO_NODE, __builtin_return_address(0));
> > +}
> > +
> > +void __weak module_memfree(void *module_region)
> > +{
> > +       /*
> > +        * This memory may be RO, and freeing RO memory in an interrupt is not
> > +        * supported by vmalloc.
> > +        */
> > +       WARN_ON(in_interrupt());
> > +       vfree(module_region);
> > +}
> > diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
> > index 93507330462c..050b2975332e 100644
> > --- a/kernel/trace/trace_kprobe.c
> > +++ b/kernel/trace/trace_kprobe.c
> > @@ -101,6 +101,7 @@ static nokprobe_inline bool trace_kprobe_has_gone(struct trace_kprobe *tk)
> >          return kprobe_gone(&tk->rp.kp);
> >   }
> > 
> > +#ifdef CONFIG_MODULES
> >   static nokprobe_inline bool trace_kprobe_within_module(struct trace_kprobe *tk,
> >                                                   struct module *mod)
> >   {
> > @@ -109,11 +110,13 @@ static nokprobe_inline bool trace_kprobe_within_module(struct trace_kprobe *tk,
> > 
> >          return strncmp(module_name(mod), name, len) == 0 && name[len] == ':';
> >   }
> > +#endif /* CONFIG_MODULES */
> > 
> >   static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
> >   {
> > +       bool ret = false;
> > +#ifdef CONFIG_MODULES
> >          char *p;
> > -       bool ret;
> > 
> >          if (!tk->symbol)
> >                  return false;
> > @@ -125,6 +128,7 @@ static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
> >          ret = !!find_module(tk->symbol);
> >          rcu_read_unlock_sched();
> >          *p = ':';
> > +#endif /* CONFIG_MODULES */
> > 
> >          return ret;
> >   }
> > @@ -668,6 +672,7 @@ static int register_trace_kprobe(struct trace_kprobe *tk)
> >          return ret;
> >   }
> > 
> > +#ifdef CONFIG_MODULES
> >   /* Module notifier call back, checking event on the module */
> >   static int trace_kprobe_module_callback(struct notifier_block *nb,
> >                                         unsigned long val, void *data)
> > @@ -702,6 +707,7 @@ static struct notifier_block trace_kprobe_module_nb = {
> >          .notifier_call = trace_kprobe_module_callback,
> >          .priority = 1   /* Invoked after kprobe module callback */
> >   };
> > +#endif /* CONFIG_MODULES */
> > 
> >   static int __trace_kprobe_create(int argc, const char *argv[])
> >   {
> > @@ -1896,8 +1902,10 @@ static __init int init_kprobe_trace_early(void)
> >          if (ret)
> >                  return ret;
> > 
> > +#ifdef CONFIG_MODULES
> >          if (register_module_notifier(&trace_kprobe_module_nb))
> >                  return -EINVAL;
> > +#endif /* CONFIG_MODULES */
> > 
> >          return 0;
> >   }
> > --
> > 2.36.1
> > 

Thanks for the well-considered remarks!

BR, Jarkko
