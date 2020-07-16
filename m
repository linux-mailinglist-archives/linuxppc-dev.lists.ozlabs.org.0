Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4C4222E7A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 00:19:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B77w2659xzDrDQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 08:19:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B70Yl1CfGzDr5g
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 02:48:07 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4B70YT2Bhkz9txr1;
 Thu, 16 Jul 2020 18:47:57 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ypd4tdSEC0X9; Thu, 16 Jul 2020 18:47:57 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4B70YT0hs9z9txqy;
 Thu, 16 Jul 2020 18:47:57 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id E60C2905; Thu, 16 Jul 2020 18:49:09 +0200 (CEST)
Received: from 37-165-58-223.coucou-networks.fr
 (37-165-58-223.coucou-networks.fr [37.165.58.223]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Thu, 16 Jul 2020 18:49:09 +0200
Date: Thu, 16 Jul 2020 18:49:09 +0200
Message-ID: <20200716184909.Horde.JVRLLcKix_jhrJfiQYRbbQ1@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v2 1/3] module: Rename module_alloc() to text_alloc()
 and move to kernel proper
References: <20200714094625.1443261-1-jarkko.sakkinen@linux.intel.com>
 <20200714094625.1443261-2-jarkko.sakkinen@linux.intel.com>
In-Reply-To: <20200714094625.1443261-2-jarkko.sakkinen@linux.intel.com>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 17 Jul 2020 08:17:50 +1000
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Paul Mackerras <paulus@samba.org>,
 Zong Li <zong.li@sifive.com>, Andi Kleen <ak@linux.intel.com>,
 Paul Burton <paulburton@kernel.org>,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Petr Mladek <pmladek@suse.com>, Brian Gerst <brgerst@gmail.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Jiri Kosina <jkosina@suse.cz>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, Philipp Rudo <prudo@linux.ibm.com>,
 Torsten Duwe <duwe@lst.de>, Masami Hiramatsu <mhiramat@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mark Rutland <mark.rutland@arm.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Vincent Chen <deanbo422@gmail.com>, Omar Sandoval <osandov@fb.com>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>,
 John Fastabend <john.fastabend@gmail.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Yonghong Song <yhs@fb.com>, Iurii Zaikin <yzaikin@google.com>,
 Andrii Nakryiko <andriin@fb.com>, Thomas Huth <thuth@redhat.com>,
 Vasily Gorbik <gor@linux.ibm.com>, "moderated list:ARM
 PORT" <linux-arm-kernel@lists.infradead.org>, Daniel Axtens <dja@axtens.net>,
 Damien Le Moal <damien.lemoal@wdc.com>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Will Deacon <will@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Mao Han <han_mao@c-sky.com>,
 Marco Elver <elver@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Babu Moger <Babu.Moger@amd.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Ben Dooks <ben-linux@fluff.org>,
 Guan Xuetao <gxt@pku.edu.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Jessica Yu <jeyu@kernel.org>, "open
 list:BPF JIT for MIPS 32-BIT AND 64-BIT" <bpf@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, David Howells <dhowells@redhat.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>,
 Sandipan Das <sandipan@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 "open list:SPARC + UltraSPARC sparc/sparc64" <sparclinux@vger.kernel.org>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>,
 Sven Schnelle <svens@stackframe.org>, Ard Biesheuvel <ardb@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>, Jiri Olsa <jolsa@redhat.com>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, "Paul E. McKenney" <paulmck@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, KP Singh <kpsingh@chromium.org>,
 Dmitry Vyukov <dvyukov@google.com>, Nick Hu <nickhu@andestech.com>,
 "open list:BPF JIT for MIPS 32-BIT
 AND 64-BIT" <netdev@vger.kernel.org>, "open
 list:MIPS" <linux-mips@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com> a =C3=A9crit=C2=A0:

> Rename module_alloc() to text_alloc() and module_memfree() to
> text_memfree(), and move them to kernel/text.c, which is unconditionally
> compiled to the kernel proper. This allows kprobes, ftrace and bpf to
> allocate space for executable code without requiring to compile the modul=
es
> support (CONFIG_MODULES=3Dy) in.

You are not changing enough in powerpc to have this work.
On powerpc 32 bits (6xx), when STRICT_KERNEL_RWX is selected, the=20=20
vmalloc=20space is set to NX (no exec) at segment level (ie by 256Mbytes=20=
=20
zone)=20unless CONFIG_MODULES is selected.

Christophe


>
> Cc: Andi Kleen <ak@linux.intel.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> ---
>  arch/arm/kernel/Makefile         |  3 +-
>  arch/arm/kernel/module.c         | 21 -----------
>  arch/arm/kernel/text.c           | 33 ++++++++++++++++++
>  arch/arm64/kernel/Makefile       |  2 +-
>  arch/arm64/kernel/module.c       | 42 ----------------------
>  arch/arm64/kernel/text.c         | 54 ++++++++++++++++++++++++++++
>  arch/mips/kernel/Makefile        |  2 +-
>  arch/mips/kernel/module.c        |  9 -----
>  arch/mips/kernel/text.c          | 19 ++++++++++
>  arch/mips/net/bpf_jit.c          |  4 +--
>  arch/nds32/kernel/Makefile       |  2 +-
>  arch/nds32/kernel/module.c       |  7 ----
>  arch/nds32/kernel/text.c         | 12 +++++++
>  arch/nios2/kernel/Makefile       |  1 +
>  arch/nios2/kernel/module.c       | 19 ----------
>  arch/nios2/kernel/text.c         | 34 ++++++++++++++++++
>  arch/parisc/kernel/Makefile      |  2 +-
>  arch/parisc/kernel/module.c      | 11 ------
>  arch/parisc/kernel/text.c        | 22 ++++++++++++
>  arch/powerpc/net/bpf_jit_comp.c  |  4 +--
>  arch/riscv/kernel/Makefile       |  1 +
>  arch/riscv/kernel/module.c       | 12 -------
>  arch/riscv/kernel/text.c         | 20 +++++++++++
>  arch/s390/kernel/Makefile        |  2 +-
>  arch/s390/kernel/ftrace.c        |  2 +-
>  arch/s390/kernel/module.c        | 16 ---------
>  arch/s390/kernel/text.c          | 23 ++++++++++++
>  arch/sparc/kernel/Makefile       |  1 +
>  arch/sparc/kernel/module.c       | 30 ----------------
>  arch/sparc/kernel/text.c         | 39 +++++++++++++++++++++
>  arch/sparc/net/bpf_jit_comp_32.c |  6 ++--
>  arch/unicore32/kernel/Makefile   |  1 +
>  arch/unicore32/kernel/module.c   |  7 ----
>  arch/unicore32/kernel/text.c     | 18 ++++++++++
>  arch/x86/kernel/Makefile         |  1 +
>  arch/x86/kernel/ftrace.c         |  4 +--
>  arch/x86/kernel/kprobes/core.c   |  4 +--
>  arch/x86/kernel/module.c         | 49 --------------------------
>  arch/x86/kernel/text.c           | 60 ++++++++++++++++++++++++++++++++
>  include/linux/moduleloader.h     |  4 +--
>  kernel/Makefile                  |  2 +-
>  kernel/bpf/core.c                |  4 +--
>  kernel/kprobes.c                 |  4 +--
>  kernel/module.c                  | 37 ++++++--------------
>  kernel/text.c                    | 25 +++++++++++++
>  45 files changed, 400 insertions(+), 275 deletions(-)
>  create mode 100644 arch/arm/kernel/text.c
>  create mode 100644 arch/arm64/kernel/text.c
>  create mode 100644 arch/mips/kernel/text.c
>  create mode 100644 arch/nds32/kernel/text.c
>  create mode 100644 arch/nios2/kernel/text.c
>  create mode 100644 arch/parisc/kernel/text.c
>  create mode 100644 arch/riscv/kernel/text.c
>  create mode 100644 arch/s390/kernel/text.c
>  create mode 100644 arch/sparc/kernel/text.c
>  create mode 100644 arch/unicore32/kernel/text.c
>  create mode 100644 arch/x86/kernel/text.c
>  create mode 100644 kernel/text.c
>
> diff --git a/arch/arm/kernel/Makefile b/arch/arm/kernel/Makefile
> index 89e5d864e923..69bfacfd60ef 100644
> --- a/arch/arm/kernel/Makefile
> +++ b/arch/arm/kernel/Makefile
> @@ -19,7 +19,8 @@ CFLAGS_REMOVE_return_address.o =3D -pg
>  obj-y		:=3D elf.o entry-common.o irq.o opcodes.o \
>  		   process.o ptrace.o reboot.o \
>  		   setup.o signal.o sigreturn_codes.o \
> -		   stacktrace.o sys_arm.o time.o traps.o
> +		   stacktrace.o sys_arm.o time.o traps.o \
> +		   text.o
>
>  ifneq ($(CONFIG_ARM_UNWIND),y)
>  obj-$(CONFIG_FRAME_POINTER)	+=3D return_address.o
> diff --git a/arch/arm/kernel/module.c b/arch/arm/kernel/module.c
> index e15444b25ca0..13e3442a6b9f 100644
> --- a/arch/arm/kernel/module.c
> +++ b/arch/arm/kernel/module.c
> @@ -33,27 +33,6 @@
>  #define MODULES_VADDR	(((unsigned long)_exiprom + ~PMD_MASK) & PMD_MASK)
>  #endif
>
> -#ifdef CONFIG_MMU
> -void *module_alloc(unsigned long size)
> -{
> -	gfp_t gfp_mask =3D GFP_KERNEL;
> -	void *p;
> -
> -	/* Silence the initial allocation */
> -	if (IS_ENABLED(CONFIG_ARM_MODULE_PLTS))
> -		gfp_mask |=3D __GFP_NOWARN;
> -
> -	p =3D __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
> -				gfp_mask, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> -				__builtin_return_address(0));
> -	if (!IS_ENABLED(CONFIG_ARM_MODULE_PLTS) || p)
> -		return p;
> -	return __vmalloc_node_range(size, 1,  VMALLOC_START, VMALLOC_END,
> -				GFP_KERNEL, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> -				__builtin_return_address(0));
> -}
> -#endif
> -
>  bool module_init_section(const char *name)
>  {
>  	return strstarts(name, ".init") ||
> diff --git a/arch/arm/kernel/text.c b/arch/arm/kernel/text.c
> new file mode 100644
> index 000000000000..600143fb909d
> --- /dev/null
> +++ b/arch/arm/kernel/text.c
> @@ -0,0 +1,33 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + *  linux/arch/arm/kernel/module.c
> + *
> + *  Copyright (C) 2002 Russell King.
> + *  Modified for nommu by Hyok S. Choi
> + *
> + * Module allocation method suggested by Andi Kleen.
> + */
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +#ifdef CONFIG_MMU
> +void *text_alloc(unsigned long size)
> +{
> +	gfp_t gfp_mask =3D GFP_KERNEL;
> +	void *p;
> +
> +	/* Silence the initial allocation */
> +	if (IS_ENABLED(CONFIG_ARM_MODULE_PLTS))
> +		gfp_mask |=3D __GFP_NOWARN;
> +
> +	p =3D __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
> +				gfp_mask, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> +				__builtin_return_address(0));
> +	if (!IS_ENABLED(CONFIG_ARM_MODULE_PLTS) || p)
> +		return p;
> +	return __vmalloc_node_range(size, 1,  VMALLOC_START, VMALLOC_END,
> +				GFP_KERNEL, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> +				__builtin_return_address(0));
> +}
> +#endif
> diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
> index a561cbb91d4d..7765a45d71b5 100644
> --- a/arch/arm64/kernel/Makefile
> +++ b/arch/arm64/kernel/Makefile
> @@ -19,7 +19,7 @@ obj-y			:=3D debug-monitors.o entry.o irq.o fpsimd.o		\
>  			   return_address.o cpuinfo.o cpu_errata.o		\
>  			   cpufeature.o alternative.o cacheinfo.o		\
>  			   smp.o smp_spin_table.o topology.o smccc-call.o	\
> -			   syscall.o
> +			   syscall.o text.o
>
>  targets			+=3D efi-entry.o
>
> diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> index 1cd1a4d0ed30..adde022f703c 100644
> --- a/arch/arm64/kernel/module.c
> +++ b/arch/arm64/kernel/module.c
> @@ -20,48 +20,6 @@
>  #include <asm/insn.h>
>  #include <asm/sections.h>
>
> -void *module_alloc(unsigned long size)
> -{
> -	u64 module_alloc_end =3D module_alloc_base + MODULES_VSIZE;
> -	gfp_t gfp_mask =3D GFP_KERNEL;
> -	void *p;
> -
> -	/* Silence the initial allocation */
> -	if (IS_ENABLED(CONFIG_ARM64_MODULE_PLTS))
> -		gfp_mask |=3D __GFP_NOWARN;
> -
> -	if (IS_ENABLED(CONFIG_KASAN))
> -		/* don't exceed the static module region - see below */
> -		module_alloc_end =3D MODULES_END;
> -
> -	p =3D __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
> -				module_alloc_end, gfp_mask, PAGE_KERNEL, 0,
> -				NUMA_NO_NODE, __builtin_return_address(0));
> -
> -	if (!p && IS_ENABLED(CONFIG_ARM64_MODULE_PLTS) &&
> -	    !IS_ENABLED(CONFIG_KASAN))
> -		/*
> -		 * KASAN can only deal with module allocations being served
> -		 * from the reserved module region, since the remainder of
> -		 * the vmalloc region is already backed by zero shadow pages,
> -		 * and punching holes into it is non-trivial. Since the module
> -		 * region is not randomized when KASAN is enabled, it is even
> -		 * less likely that the module region gets exhausted, so we
> -		 * can simply omit this fallback in that case.
> -		 */
> -		p =3D __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
> -				module_alloc_base + SZ_2G, GFP_KERNEL,
> -				PAGE_KERNEL, 0, NUMA_NO_NODE,
> -				__builtin_return_address(0));
> -
> -	if (p && (kasan_module_alloc(p, size) < 0)) {
> -		vfree(p);
> -		return NULL;
> -	}
> -
> -	return p;
> -}
> -
>  enum aarch64_reloc_op {
>  	RELOC_OP_NONE,
>  	RELOC_OP_ABS,
> diff --git a/arch/arm64/kernel/text.c b/arch/arm64/kernel/text.c
> new file mode 100644
> index 000000000000..64fc7e2d85df
> --- /dev/null
> +++ b/arch/arm64/kernel/text.c
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * AArch64 loadable module support.
> + *
> + * Copyright (C) 2012 ARM Limited
> + *
> + * Author: Will Deacon <will.deacon@arm.com>
> + */
> +#include <linux/kasan.h>
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +void *text_alloc(unsigned long size)
> +{
> +	u64 module_alloc_end =3D module_alloc_base + MODULES_VSIZE;
> +	gfp_t gfp_mask =3D GFP_KERNEL;
> +	void *p;
> +
> +	/* Silence the initial allocation */
> +	if (IS_ENABLED(CONFIG_ARM64_MODULE_PLTS))
> +		gfp_mask |=3D __GFP_NOWARN;
> +
> +	if (IS_ENABLED(CONFIG_KASAN))
> +		/* don't exceed the static module region - see below */
> +		module_alloc_end =3D MODULES_END;
> +
> +	p =3D __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
> +				module_alloc_end, gfp_mask, PAGE_KERNEL, 0,
> +				NUMA_NO_NODE, __builtin_return_address(0));
> +
> +	if (!p && IS_ENABLED(CONFIG_ARM64_MODULE_PLTS) &&
> +	    !IS_ENABLED(CONFIG_KASAN))
> +		/*
> +		 * KASAN can only deal with module allocations being served
> +		 * from the reserved module region, since the remainder of
> +		 * the vmalloc region is already backed by zero shadow pages,
> +		 * and punching holes into it is non-trivial. Since the module
> +		 * region is not randomized when KASAN is enabled, it is even
> +		 * less likely that the module region gets exhausted, so we
> +		 * can simply omit this fallback in that case.
> +		 */
> +		p =3D __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
> +				module_alloc_base + SZ_2G, GFP_KERNEL,
> +				PAGE_KERNEL, 0, NUMA_NO_NODE,
> +				__builtin_return_address(0));
> +
> +	if (p && (kasan_module_alloc(p, size) < 0)) {
> +		vfree(p);
> +		return NULL;
> +	}
> +
> +	return p;
> +}
> diff --git a/arch/mips/kernel/Makefile b/arch/mips/kernel/Makefile
> index 8c7a043295ed..37ebf9a7f259 100644
> --- a/arch/mips/kernel/Makefile
> +++ b/arch/mips/kernel/Makefile
> @@ -8,7 +8,7 @@ extra-y		:=3D head.o vmlinux.lds
>  obj-y		+=3D cmpxchg.o cpu-probe.o branch.o elf.o entry.o genex.o=20=20
>=20idle.o irq.o \
>  		   process.o prom.o ptrace.o reset.o setup.o signal.o \
>  		   syscall.o time.o topology.o traps.o unaligned.o watch.o \
> -		   vdso.o cacheinfo.o
> +		   vdso.o cacheinfo.o text.o
>
>  ifdef CONFIG_FUNCTION_TRACER
>  CFLAGS_REMOVE_ftrace.o =3D -pg
> diff --git a/arch/mips/kernel/module.c b/arch/mips/kernel/module.c
> index 3c0c3d1260c1..f5ac4ebc4bad 100644
> --- a/arch/mips/kernel/module.c
> +++ b/arch/mips/kernel/module.c
> @@ -31,15 +31,6 @@ struct mips_hi16 {
>  static LIST_HEAD(dbe_list);
>  static DEFINE_SPINLOCK(dbe_lock);
>
> -#ifdef MODULE_START
> -void *module_alloc(unsigned long size)
> -{
> -	return __vmalloc_node_range(size, 1, MODULE_START, MODULE_END,
> -				GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
> -				__builtin_return_address(0));
> -}
> -#endif
> -
>  static int apply_r_mips_none(struct module *me, u32 *location,
>  			     u32 base, Elf_Addr v, bool rela)
>  {
> diff --git a/arch/mips/kernel/text.c b/arch/mips/kernel/text.c
> new file mode 100644
> index 000000000000..55ca87a421c3
> --- /dev/null
> +++ b/arch/mips/kernel/text.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *
> + *  Copyright (C) 2001 Rusty Russell.
> + *  Copyright (C) 2003, 2004 Ralf Baechle (ralf@linux-mips.org)
> + *  Copyright (C) 2005 Thiemo Seufer
> + */
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +#ifdef MODULE_START
> +void *text_alloc(unsigned long size)
> +{
> +	return __vmalloc_node_range(size, 1, MODULE_START, MODULE_END,
> +				GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
> +				__builtin_return_address(0));
> +}
> +#endif
> diff --git a/arch/mips/net/bpf_jit.c b/arch/mips/net/bpf_jit.c
> index 0af88622c619..2b03f7128809 100644
> --- a/arch/mips/net/bpf_jit.c
> +++ b/arch/mips/net/bpf_jit.c
> @@ -1233,7 +1233,7 @@ void bpf_jit_compile(struct bpf_prog *fp)
>  	build_epilogue(&ctx);
>
>  	alloc_size =3D 4 * ctx.idx;
> -	ctx.target =3D module_alloc(alloc_size);
> +	ctx.target =3D text_alloc(alloc_size);
>  	if (ctx.target =3D=3D NULL)
>  		goto out;
>
> @@ -1264,7 +1264,7 @@ void bpf_jit_compile(struct bpf_prog *fp)
>  void bpf_jit_free(struct bpf_prog *fp)
>  {
>  	if (fp->jited)
> -		module_memfree(fp->bpf_func);
> +		text_memfree(fp->bpf_func);
>
>  	bpf_prog_unlock_free(fp);
>  }
> diff --git a/arch/nds32/kernel/Makefile b/arch/nds32/kernel/Makefile
> index 394df3f6442c..fc15778c59d1 100644
> --- a/arch/nds32/kernel/Makefile
> +++ b/arch/nds32/kernel/Makefile
> @@ -10,7 +10,7 @@ AFLAGS_head.o		:=3D -DTEXTADDR=3D$(TEXTADDR)
>  obj-y			:=3D ex-entry.o ex-exit.o ex-scall.o irq.o \
>  			process.o ptrace.o setup.o signal.o \
>  			sys_nds32.o time.o traps.o cacheinfo.o \
> -			dma.o syscall_table.o vdso.o
> +			dma.o syscall_table.o vdso.o text.o
>
>  obj-$(CONFIG_MODULES)		+=3D nds32_ksyms.o module.o
>  obj-$(CONFIG_STACKTRACE)	+=3D stacktrace.o
> diff --git a/arch/nds32/kernel/module.c b/arch/nds32/kernel/module.c
> index 3897fd14a21d..3d23a12ed535 100644
> --- a/arch/nds32/kernel/module.c
> +++ b/arch/nds32/kernel/module.c
> @@ -7,13 +7,6 @@
>  #include <linux/moduleloader.h>
>  #include <linux/pgtable.h>
>
> -void *module_alloc(unsigned long size)
> -{
> -	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
> -				    GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
> -				    __builtin_return_address(0));
> -}
> -
>  void module_free(struct module *module, void *region)
>  {
>  	vfree(region);
> diff --git a/arch/nds32/kernel/text.c b/arch/nds32/kernel/text.c
> new file mode 100644
> index 000000000000..6e86eff9aaf0
> --- /dev/null
> +++ b/arch/nds32/kernel/text.c
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (C) 2005-2017 Andes Technology Corporation
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +void *text_alloc(unsigned long size)
> +{
> +	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
> +				    GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
> +				    __builtin_return_address(0));
> +}
> diff --git a/arch/nios2/kernel/Makefile b/arch/nios2/kernel/Makefile
> index 0b645e1e3158..5476fc749f37 100644
> --- a/arch/nios2/kernel/Makefile
> +++ b/arch/nios2/kernel/Makefile
> @@ -18,6 +18,7 @@ obj-y	+=3D setup.o
>  obj-y	+=3D signal.o
>  obj-y	+=3D sys_nios2.o
>  obj-y	+=3D syscall_table.o
> +obj-y	+=3D text.o
>  obj-y	+=3D time.o
>  obj-y	+=3D traps.o
>
> diff --git a/arch/nios2/kernel/module.c b/arch/nios2/kernel/module.c
> index 76e0a42d6e36..20a0faf64e38 100644
> --- a/arch/nios2/kernel/module.c
> +++ b/arch/nios2/kernel/module.c
> @@ -21,25 +21,6 @@
>
>  #include <asm/cacheflush.h>
>
> -/*
> - * Modules should NOT be allocated with kmalloc for (obvious) reasons.
> - * But we do it for now to avoid relocation issues. CALL26/PCREL26=20=20
>=20cannot reach
> - * from 0x80000000 (vmalloc area) to 0xc00000000 (kernel) (kmalloc retur=
ns
> - * addresses in 0xc0000000)
> - */
> -void *module_alloc(unsigned long size)
> -{
> -	if (size =3D=3D 0)
> -		return NULL;
> -	return kmalloc(size, GFP_KERNEL);
> -}
> -
> -/* Free memory returned from module_alloc */
> -void module_memfree(void *module_region)
> -{
> -	kfree(module_region);
> -}
> -
>  int apply_relocate_add(Elf32_Shdr *sechdrs, const char *strtab,
>  			unsigned int symindex, unsigned int relsec,
>  			struct module *mod)
> diff --git a/arch/nios2/kernel/text.c b/arch/nios2/kernel/text.c
> new file mode 100644
> index 000000000000..af424174442f
> --- /dev/null
> +++ b/arch/nios2/kernel/text.c
> @@ -0,0 +1,34 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Kernel module support for Nios II.
> + *
> + * Copyright (C) 2004 Microtronix Datacom Ltd.
> + *   Written by Wentao Xu <xuwentao@microtronix.com>
> + * Copyright (C) 2001, 2003 Rusty Russell
> + *
> + * This file is subject to the terms and conditions of the GNU General
> + * Public License.  See the file COPYING in the main directory of this
> + * archive for more details.
> + */
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +/*
> + * Modules should NOT be allocated with kmalloc for (obvious) reasons.
> + * But we do it for now to avoid relocation issues. CALL26/PCREL26=20=20
>=20cannot reach
> + * from 0x80000000 (vmalloc area) to 0xc00000000 (kernel) (kmalloc retur=
ns
> + * addresses in 0xc0000000)
> + */
> +void *text_alloc(unsigned long size)
> +{
> +	if (size =3D=3D 0)
> +		return NULL;
> +	return kmalloc(size, GFP_KERNEL);
> +}
> +
> +/* Free memory returned from module_alloc */
> +void text_memfree(void *module_region)
> +{
> +	kfree(module_region);
> +}
> diff --git a/arch/parisc/kernel/Makefile b/arch/parisc/kernel/Makefile
> index 068d90950d93..f71f7ffdae2e 100644
> --- a/arch/parisc/kernel/Makefile
> +++ b/arch/parisc/kernel/Makefile
> @@ -10,7 +10,7 @@ obj-y	     	:=3D cache.o pacache.o setup.o pdt.o=20=20
>=20traps.o time.o irq.o \
>  		   ptrace.o hardware.o inventory.o drivers.o alternative.o \
>  		   signal.o hpmc.o real2.o parisc_ksyms.o unaligned.o \
>  		   process.o processor.o pdc_cons.o pdc_chassis.o unwind.o \
> -		   patch.o
> +		   patch.o text.o
>
>  ifdef CONFIG_FUNCTION_TRACER
>  # Do not profile debug and lowlevel utilities
> diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
> index 7df140545b22..c81e63e2549b 100644
> --- a/arch/parisc/kernel/module.c
> +++ b/arch/parisc/kernel/module.c
> @@ -192,17 +192,6 @@ static inline int reassemble_22(int as22)
>  		((as22 & 0x0003ff) << 3));
>  }
>
> -void *module_alloc(unsigned long size)
> -{
> -	/* using RWX means less protection for modules, but it's
> -	 * easier than trying to map the text, data, init_text and
> -	 * init_data correctly */
> -	return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
> -				    GFP_KERNEL,
> -				    PAGE_KERNEL_RWX, 0, NUMA_NO_NODE,
> -				    __builtin_return_address(0));
> -}
> -
>  #ifndef CONFIG_64BIT
>  static inline unsigned long count_gots(const Elf_Rela *rela,=20=20
>=20unsigned long n)
>  {
> diff --git a/arch/parisc/kernel/text.c b/arch/parisc/kernel/text.c
> new file mode 100644
> index 000000000000..9ff503084191
> --- /dev/null
> +++ b/arch/parisc/kernel/text.c
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *    Linux/PA-RISC Project
> + *    Copyright (C) 2003 Randolph Chung <tausq at debian . org>
> + *    Copyright (C) 2008 Helge Deller <deller@gmx.de>
> + */
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +void *text_alloc(unsigned long size)
> +{
> +	/*
> +	 * Using RWX means less protection for modules, but it's
> +	 * easier than trying to map the text, data, init_text and
> +	 * init_data correctly.
> +	 */
> +	return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
> +				    GFP_KERNEL,
> +				    PAGE_KERNEL_RWX, 0, NUMA_NO_NODE,
> +				    __builtin_return_address(0));
> +}
> diff --git a/arch/powerpc/net/bpf_jit_comp.c=20=20
>=20b/arch/powerpc/net/bpf_jit_comp.c
> index 0acc9d5fb19e..ba1cef7a812d 100644
> --- a/arch/powerpc/net/bpf_jit_comp.c
> +++ b/arch/powerpc/net/bpf_jit_comp.c
> @@ -634,7 +634,7 @@ void bpf_jit_compile(struct bpf_prog *fp)
>
>  	proglen =3D cgctx.idx * 4;
>  	alloclen =3D proglen + FUNCTION_DESCR_SIZE;
> -	image =3D module_alloc(alloclen);
> +	image =3D text_alloc(alloclen);
>  	if (!image)
>  		goto out;
>
> @@ -678,7 +678,7 @@ void bpf_jit_compile(struct bpf_prog *fp)
>  void bpf_jit_free(struct bpf_prog *fp)
>  {
>  	if (fp->jited)
> -		module_memfree(fp->bpf_func);
> +		text_memfree(fp->bpf_func);
>
>  	bpf_prog_unlock_free(fp);
>  }
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index b355cf485671..d0b30f286ce6 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -29,6 +29,7 @@ obj-y	+=3D riscv_ksyms.o
>  obj-y	+=3D stacktrace.o
>  obj-y	+=3D cacheinfo.o
>  obj-y	+=3D patch.o
> +obj-y	+=3D text.o
>  obj-$(CONFIG_MMU) +=3D vdso.o vdso/
>
>  obj-$(CONFIG_RISCV_M_MODE)	+=3D clint.o traps_misaligned.o
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 7191342c54da..f6aa66431c9e 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -390,15 +390,3 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const=20=
=20
>=20char *strtab,
>
>  	return 0;
>  }
> -
> -#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
> -#define VMALLOC_MODULE_START \
> -	 max(PFN_ALIGN((unsigned long)&_end - SZ_2G), VMALLOC_START)
> -void *module_alloc(unsigned long size)
> -{
> -	return __vmalloc_node_range(size, 1, VMALLOC_MODULE_START,
> -				    VMALLOC_END, GFP_KERNEL,
> -				    PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> -				    __builtin_return_address(0));
> -}
> -#endif
> diff --git a/arch/riscv/kernel/text.c b/arch/riscv/kernel/text.c
> new file mode 100644
> index 000000000000..201608a25641
> --- /dev/null
> +++ b/arch/riscv/kernel/text.c
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *
> + *  Copyright (C) 2017 Zihao Yu
> + */
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
> +#define VMALLOC_MODULE_START \
> +	 max(PFN_ALIGN((unsigned long)&_end - SZ_2G), VMALLOC_START)
> +void *text_alloc(unsigned long size)
> +{
> +	return __vmalloc_node_range(size, 1, VMALLOC_MODULE_START,
> +				    VMALLOC_END, GFP_KERNEL,
> +				    PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> +				    __builtin_return_address(0));
> +}
> +#endif
> diff --git a/arch/s390/kernel/Makefile b/arch/s390/kernel/Makefile
> index a8f136943deb..9f00c320b938 100644
> --- a/arch/s390/kernel/Makefile
> +++ b/arch/s390/kernel/Makefile
> @@ -40,7 +40,7 @@ obj-y	+=3D sysinfo.o lgr.o os_info.o machine_kexec.o=20=
=20
>=20pgm_check.o
>  obj-y	+=3D runtime_instr.o cache.o fpu.o dumpstack.o guarded_storage.o s=
thyi.o
>  obj-y	+=3D entry.o reipl.o relocate_kernel.o kdebugfs.o alternative.o
>  obj-y	+=3D nospec-branch.o ipl_vmparm.o machine_kexec_reloc.o unwind_bc.=
o
> -obj-y	+=3D smp.o
> +obj-y	+=3D smp.o text.o
>
>  extra-y				+=3D head64.o vmlinux.lds
>
> diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
> index b388e87a08bf..a752b1442846 100644
> --- a/arch/s390/kernel/ftrace.c
> +++ b/arch/s390/kernel/ftrace.c
> @@ -134,7 +134,7 @@ static int __init ftrace_plt_init(void)
>  {
>  	unsigned int *ip;
>
> -	ftrace_plt =3D (unsigned long) module_alloc(PAGE_SIZE);
> +	ftrace_plt =3D (unsigned long) text_alloc(PAGE_SIZE);
>  	if (!ftrace_plt)
>  		panic("cannot allocate ftrace plt\n");
>  	ip =3D (unsigned int *) ftrace_plt;
> diff --git a/arch/s390/kernel/module.c b/arch/s390/kernel/module.c
> index 4055f1c49814..087cb5951de6 100644
> --- a/arch/s390/kernel/module.c
> +++ b/arch/s390/kernel/module.c
> @@ -32,22 +32,6 @@
>
>  #define PLT_ENTRY_SIZE 20
>
> -void *module_alloc(unsigned long size)
> -{
> -	void *p;
> -
> -	if (PAGE_ALIGN(size) > MODULES_LEN)
> -		return NULL;
> -	p =3D __vmalloc_node_range(size, MODULE_ALIGN, MODULES_VADDR, MODULES_E=
ND,
> -				 GFP_KERNEL, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> -				 __builtin_return_address(0));
> -	if (p && (kasan_module_alloc(p, size) < 0)) {
> -		vfree(p);
> -		return NULL;
> -	}
> -	return p;
> -}
> -
>  void module_arch_freeing_init(struct module *mod)
>  {
>  	if (is_livepatch_module(mod) &&
> diff --git a/arch/s390/kernel/text.c b/arch/s390/kernel/text.c
> new file mode 100644
> index 000000000000..63aaa1ab727b
> --- /dev/null
> +++ b/arch/s390/kernel/text.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + *  Kernel module help for s390.
> + */
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
>=20+
> +void *text_alloc(unsigned long size)
> +{
> +	void *p;
> +
> +	if (PAGE_ALIGN(size) > MODULES_LEN)
> +		return NULL;
> +	p =3D __vmalloc_node_range(size, MODULE_ALIGN, MODULES_VADDR, MODULES_E=
ND,
> +				 GFP_KERNEL, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> +				 __builtin_return_address(0));
> +	if (p && (kasan_module_alloc(p, size) < 0)) {
> +		vfree(p);
> +		return NULL;
> +	}
> +	return p;
> +}
> diff --git a/arch/sparc/kernel/Makefile b/arch/sparc/kernel/Makefile
> index 97c0e19263d1..e025f9e1db4a 100644
> --- a/arch/sparc/kernel/Makefile
> +++ b/arch/sparc/kernel/Makefile
> @@ -52,6 +52,7 @@ obj-y                   +=3D prom_common.o
>  obj-y                   +=3D prom_$(BITS).o
>  obj-y                   +=3D of_device_common.o
>  obj-y                   +=3D of_device_$(BITS).o
> +obj-y			+=3D text.o
>  obj-$(CONFIG_SPARC64)   +=3D prom_irqtrans.o
>
>  obj-$(CONFIG_SPARC32)   +=3D leon_kernel.o
> diff --git a/arch/sparc/kernel/module.c b/arch/sparc/kernel/module.c
> index df39580f398d..f2babc69f189 100644
> --- a/arch/sparc/kernel/module.c
> +++ b/arch/sparc/kernel/module.c
> @@ -21,36 +21,6 @@
>
>  #include "entry.h"
>
> -#ifdef CONFIG_SPARC64
> -
> -#include <linux/jump_label.h>
> -
> -static void *module_map(unsigned long size)
> -{
> -	if (PAGE_ALIGN(size) > MODULES_LEN)
> -		return NULL;
> -	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
> -				GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
> -				__builtin_return_address(0));
> -}
> -#else
> -static void *module_map(unsigned long size)
> -{
> -	return vmalloc(size);
> -}
> -#endif /* CONFIG_SPARC64 */
> -
> -void *module_alloc(unsigned long size)
> -{
> -	void *ret;
> -
> -	ret =3D module_map(size);
> -	if (ret)
> -		memset(ret, 0, size);
> -
> -	return ret;
> -}
> -
>  /* Make generic code ignore STT_REGISTER dummy undefined symbols.  */
>  int module_frob_arch_sections(Elf_Ehdr *hdr,
>  			      Elf_Shdr *sechdrs,
> diff --git a/arch/sparc/kernel/text.c b/arch/sparc/kernel/text.c
> new file mode 100644
> index 000000000000..d16663f2c6ba
> --- /dev/null
> +++ b/arch/sparc/kernel/text.c
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Kernel module help for sparc64.
> + *
> + * Copyright (C) 2001 Rusty Russell.
> + * Copyright (C) 2002 David S. Miller.
> + */
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +#ifdef CONFIG_SPARC64
> +
> +#include <linux/jump_label.h>
> +
> +static void *module_map(unsigned long size)
> +{
> +	if (PAGE_ALIGN(size) > MODULES_LEN)
> +		return NULL;
> +	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
> +				GFP_KERNEL, PAGE_KERNEL, 0, NUMA_NO_NODE,
> +				__builtin_return_address(0));
> +}
> +#else
> +static void *module_map(unsigned long size)
> +{
> +	return vmalloc(size);
> +}
> +#endif /* CONFIG_SPARC64 */
> +
> +void *text_alloc(unsigned long size)
> +{
> +	void *ret;
> +
> +	ret =3D module_map(size);
> +	if (ret)
> +		memset(ret, 0, size);
> +
> +	return ret;
> +}
> diff --git a/arch/sparc/net/bpf_jit_comp_32.c=20=20
>=20b/arch/sparc/net/bpf_jit_comp_32.c
> index c8eabb973b86..d9dd513b27b2 100644
> --- a/arch/sparc/net/bpf_jit_comp_32.c
> +++ b/arch/sparc/net/bpf_jit_comp_32.c
> @@ -713,7 +713,7 @@ cond_branch:			f_offset =3D addrs[i + filter[i].jf];
>  				if (unlikely(proglen + ilen > oldproglen)) {
>  					pr_err("bpb_jit_compile fatal error\n");
>  					kfree(addrs);
> -					module_memfree(image);
> +					text_memfree(image);
>  					return;
>  				}
>  				memcpy(image + proglen, temp, ilen);
> @@ -736,7 +736,7 @@ cond_branch:			f_offset =3D addrs[i + filter[i].jf];
>  			break;
>  		}
>  		if (proglen =3D=3D oldproglen) {
> -			image =3D module_alloc(proglen);
> +			image =3D text_alloc(proglen);
>  			if (!image)
>  				goto out;
>  		}
> @@ -758,7 +758,7 @@ cond_branch:			f_offset =3D addrs[i + filter[i].jf];
>  void bpf_jit_free(struct bpf_prog *fp)
>  {
>  	if (fp->jited)
> -		module_memfree(fp->bpf_func);
> +		text_memfree(fp->bpf_func);
>
>  	bpf_prog_unlock_free(fp);
>  }
> diff --git a/arch/unicore32/kernel/Makefile b/arch/unicore32/kernel/Makef=
ile
> index 2f79aa56735b..96eb8cfc8b1e 100644
> --- a/arch/unicore32/kernel/Makefile
> +++ b/arch/unicore32/kernel/Makefile
> @@ -6,6 +6,7 @@
>  # Object file lists.
>  obj-y				:=3D dma.o elf.o entry.o process.o ptrace.o
>  obj-y				+=3D setup.o signal.o sys.o stacktrace.o traps.o
> +obj-y				+=3D text.o
>
>  obj-$(CONFIG_MODULES)		+=3D ksyms.o module.o
>  obj-$(CONFIG_EARLY_PRINTK)	+=3D early_printk.o
> diff --git a/arch/unicore32/kernel/module.c b/arch/unicore32/kernel/modul=
e.c
> index 67c89ef2d6ee..e1e703c02379 100644
> --- a/arch/unicore32/kernel/module.c
> +++ b/arch/unicore32/kernel/module.c
> @@ -18,13 +18,6 @@
>
>  #include <asm/sections.h>
>
> -void *module_alloc(unsigned long size)
> -{
> -	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
> -				GFP_KERNEL, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> -				__builtin_return_address(0));
> -}
> -
>  int
>  apply_relocate(Elf32_Shdr *sechdrs, const char *strtab, unsigned=20=20
>=20int symindex,
>  	       unsigned int relindex, struct module *module)
> diff --git a/arch/unicore32/kernel/text.c b/arch/unicore32/kernel/text.c
> new file mode 100644
> index 000000000000..b94aac824bb8
> --- /dev/null
> +++ b/arch/unicore32/kernel/text.c
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * linux/arch/unicore32/kernel/module.c
> + *
> + * Code specific to PKUnity SoC and UniCore ISA
> + *
> + * Copyright (C) 2001-2010 GUAN Xue-tao
> + */
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +void *text_alloc(unsigned long size)
> +{
> +	return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END,
> +				GFP_KERNEL, PAGE_KERNEL_EXEC, 0, NUMA_NO_NODE,
> +				__builtin_return_address(0));
> +}
> diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
> index e77261db2391..2878e4b753a0 100644
> --- a/arch/x86/kernel/Makefile
> +++ b/arch/x86/kernel/Makefile
> @@ -68,6 +68,7 @@ obj-y			+=3D tsc.o tsc_msr.o io_delay.o rtc.o
>  obj-y			+=3D pci-iommu_table.o
>  obj-y			+=3D resource.o
>  obj-y			+=3D irqflags.o
> +obj-y			+=3D text.o
>
>  obj-y				+=3D process.o
>  obj-y				+=3D fpu/
> diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> index 51504566b3a6..f76703ee96f2 100644
> --- a/arch/x86/kernel/ftrace.c
> +++ b/arch/x86/kernel/ftrace.c
> @@ -265,11 +265,11 @@ int __init ftrace_dyn_arch_init(void)
>  /* Module allocation simplifies allocating memory for code */
>  static inline void *alloc_tramp(unsigned long size)
>  {
> -	return module_alloc(size);
> +	return text_alloc(size);
>  }
>  static inline void tramp_free(void *tramp)
>  {
> -	module_memfree(tramp);
> +	text_memfree(tramp);
>  }
>  #else
>  /* Trampolines can only be created if modules are supported */
> diff --git a/arch/x86/kernel/kprobes/core.c b/arch/x86/kernel/kprobes/cor=
e.c
> index ada39ddbc922..e9ac7d3c658e 100644
> --- a/arch/x86/kernel/kprobes/core.c
> +++ b/arch/x86/kernel/kprobes/core.c
> @@ -423,7 +423,7 @@ void *alloc_insn_page(void)
>  {
>  	void *page;
>
> -	page =3D module_alloc(PAGE_SIZE);
> +	page =3D text_alloc(PAGE_SIZE);
>  	if (!page)
>  		return NULL;
>
> @@ -446,7 +446,7 @@ void *alloc_insn_page(void)
>  /* Recover page to RW mode before releasing it */
>  void free_insn_page(void *page)
>  {
> -	module_memfree(page);
> +	text_memfree(page);
>  }
>
>  static int arch_copy_kprobe(struct kprobe *p)
> diff --git a/arch/x86/kernel/module.c b/arch/x86/kernel/module.c
> index 34b153cbd4ac..261df078f127 100644
> --- a/arch/x86/kernel/module.c
> +++ b/arch/x86/kernel/module.c
> @@ -36,55 +36,6 @@ do {							\
>  } while (0)
>  #endif
>
> -#ifdef CONFIG_RANDOMIZE_BASE
> -static unsigned long module_load_offset;
> -
> -/* Mutex protects the module_load_offset. */
> -static DEFINE_MUTEX(module_kaslr_mutex);
> -
> -static unsigned long int get_module_load_offset(void)
> -{
> -	if (kaslr_enabled()) {
> -		mutex_lock(&module_kaslr_mutex);
> -		/*
> -		 * Calculate the module_load_offset the first time this
> -		 * code is called. Once calculated it stays the same until
> -		 * reboot.
> -		 */
> -		if (module_load_offset =3D=3D 0)
> -			module_load_offset =3D
> -				(get_random_int() % 1024 + 1) * PAGE_SIZE;
> -		mutex_unlock(&module_kaslr_mutex);
> -	}
> -	return module_load_offset;
> -}
> -#else
> -static unsigned long int get_module_load_offset(void)
> -{
> -	return 0;
> -}
> -#endif
> -
> -void *module_alloc(unsigned long size)
> -{
> -	void *p;
> -
> -	if (PAGE_ALIGN(size) > MODULES_LEN)
> -		return NULL;
> -
> -	p =3D __vmalloc_node_range(size, MODULE_ALIGN,
> -				    MODULES_VADDR + get_module_load_offset(),
> -				    MODULES_END, GFP_KERNEL,
> -				    PAGE_KERNEL, 0, NUMA_NO_NODE,
> -				    __builtin_return_address(0));
> -	if (p && (kasan_module_alloc(p, size) < 0)) {
> -		vfree(p);
> -		return NULL;
> -	}
> -
> -	return p;
> -}
> -
>  #ifdef CONFIG_X86_32
>  int apply_relocate(Elf32_Shdr *sechdrs,
>  		   const char *strtab,
> diff --git a/arch/x86/kernel/text.c b/arch/x86/kernel/text.c
> new file mode 100644
> index 000000000000..724ab2d93ac5
> --- /dev/null
> +++ b/arch/x86/kernel/text.c
> @@ -0,0 +1,60 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Kernel module help for x86.
> + *  Copyright (C) 2001 Rusty Russell.
> + */
> +#include <linux/kasan.h>
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/random.h>
> +#include <linux/vmalloc.h>
> +#include <asm/setup.h>
> +
> +#ifdef CONFIG_RANDOMIZE_BASE
> +static unsigned long module_load_offset;
> +
> +/* Mutex protects the module_load_offset. */
> +static DEFINE_MUTEX(module_kaslr_mutex);
> +
> +static unsigned long get_module_load_offset(void)
> +{
> +	if (kaslr_enabled()) {
> +		mutex_lock(&module_kaslr_mutex);
> +		/*
> +		 * Calculate the module_load_offset the first time this
> +		 * code is called. Once calculated it stays the same until
> +		 * reboot.
> +		 */
> +		if (module_load_offset =3D=3D 0)
> +			module_load_offset =3D
> +				(get_random_int() % 1024 + 1) * PAGE_SIZE;
> +		mutex_unlock(&module_kaslr_mutex);
> +	}
> +	return module_load_offset;
> +}
> +#else
> +static unsigned long get_module_load_offset(void)
> +{
> +	return 0;
> +}
> +#endif
> +
> +void *text_alloc(unsigned long size)
> +{
> +	void *p;
> +
> +	if (PAGE_ALIGN(size) > MODULES_LEN)
> +		return NULL;
> +
> +	p =3D __vmalloc_node_range(size, MODULE_ALIGN,
> +				    MODULES_VADDR + get_module_load_offset(),
> +				    MODULES_END, GFP_KERNEL,
> +				    PAGE_KERNEL, 0, NUMA_NO_NODE,
> +				    __builtin_return_address(0));
> +	if (p && (kasan_module_alloc(p, size) < 0)) {
> +		vfree(p);
> +		return NULL;
> +	}
> +
> +	return p;
> +}
> diff --git a/include/linux/moduleloader.h b/include/linux/moduleloader.h
> index 4fa67a8b2265..4e8b9ba431ee 100644
> --- a/include/linux/moduleloader.h
> +++ b/include/linux/moduleloader.h
> @@ -24,10 +24,10 @@ unsigned int arch_mod_section_prepend(struct=20=20
>=20module *mod, unsigned int section);
>
>  /* Allocator used for allocating struct module, core sections and init
>     sections.  Returns NULL on failure. */
> -void *module_alloc(unsigned long size);
> +void *text_alloc(unsigned long size);
>
>  /* Free memory returned from module_alloc. */
> -void module_memfree(void *module_region);
> +void text_memfree(void *module_region);
>
>  /* Determines if the section name is an init section (that is only=20=20
>=20used during
>   * module loading).
> diff --git a/kernel/Makefile b/kernel/Makefile
> index f3218bc5ec69..9e88e81f68ef 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -10,7 +10,7 @@ obj-y     =3D fork.o exec_domain.o panic.o \
>  	    extable.o params.o \
>  	    kthread.o sys_ni.o nsproxy.o \
>  	    notifier.o ksysfs.o cred.o reboot.o \
> -	    async.o range.o smpboot.o ucount.o
> +	    async.o range.o smpboot.o ucount.o text.o
>
>  obj-$(CONFIG_MODULES) +=3D kmod.o
>  obj-$(CONFIG_MULTIUSER) +=3D groups.o
> diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> index 9df4cc9a2907..febd55019a8a 100644
> --- a/kernel/bpf/core.c
> +++ b/kernel/bpf/core.c
> @@ -840,12 +840,12 @@ static void bpf_jit_uncharge_modmem(u32 pages)
>
>  void *__weak bpf_jit_alloc_exec(unsigned long size)
>  {
> -	return module_alloc(size);
> +	return text_alloc(size);
>  }
>
>  void __weak bpf_jit_free_exec(void *addr)
>  {
> -	module_memfree(addr);
> +	text_memfree(addr);
>  }
>
>  struct bpf_binary_header *
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 4a904cc56d68..d1c354ec89de 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -111,12 +111,12 @@ enum kprobe_slot_state {
>
>  void __weak *alloc_insn_page(void)
>  {
> -	return module_alloc(PAGE_SIZE);
> +	return text_alloc(PAGE_SIZE);
>  }
>
>  void __weak free_insn_page(void *page)
>  {
> -	module_memfree(page);
> +	text_memfree(page);
>  }
>
>  struct kprobe_insn_cache kprobe_insn_slots =3D {
> diff --git a/kernel/module.c b/kernel/module.c
> index bee1c25ca5c5..bdb3773f3668 100644
> --- a/kernel/module.c
> +++ b/kernel/module.c
> @@ -2141,16 +2141,6 @@ static void free_module_elf(struct module *mod)
>  }
>  #endif /* CONFIG_LIVEPATCH */
>
> -void __weak module_memfree(void *module_region)
> -{
> -	/*
> -	 * This memory may be RO, and freeing RO memory in an interrupt is not
> -	 * supported by vmalloc.
> -	 */
> -	WARN_ON(in_interrupt());
> -	vfree(module_region);
> -}
> -
>  void __weak module_arch_cleanup(struct module *mod)
>  {
>  }
> @@ -2200,7 +2190,7 @@ static void free_module(struct module *mod)
>
>  	/* This may be empty, but that's OK */
>  	module_arch_freeing_init(mod);
> -	module_memfree(mod->init_layout.base);
> +	text_memfree(mod->init_layout.base);
>  	kfree(mod->args);
>  	percpu_modfree(mod);
>
> @@ -2208,7 +2198,7 @@ static void free_module(struct module *mod)
>  	lockdep_free_key_range(mod->core_layout.base, mod->core_layout.size);
>
>  	/* Finally, free the core (containing the module structure) */
> -	module_memfree(mod->core_layout.base);
> +	text_memfree(mod->core_layout.base);
>  }
>
>  void *__symbol_get(const char *symbol)
> @@ -2781,13 +2771,6 @@ static void dynamic_debug_remove(struct=20=20
>=20module *mod, struct _ddebug *debug)
>  		ddebug_remove_module(mod->name);
>  }
>
> -void * __weak module_alloc(unsigned long size)
> -{
> -	return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
> -			GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS,
> -			NUMA_NO_NODE, __builtin_return_address(0));
> -}
> -
>  bool __weak module_init_section(const char *name)
>  {
>  	return strstarts(name, ".init");
> @@ -3246,7 +3229,7 @@ static int move_module(struct module *mod,=20=20
>=20struct load_info *info)
>  	void *ptr;
>
>  	/* Do the allocs. */
> -	ptr =3D module_alloc(mod->core_layout.size);
> +	ptr =3D text_alloc(mod->core_layout.size);
>  	/*
>  	 * The pointer to this block is stored in the module structure
>  	 * which is inside the block. Just mark it as not being a
> @@ -3260,7 +3243,7 @@ static int move_module(struct module *mod,=20=20
>=20struct load_info *info)
>  	mod->core_layout.base =3D ptr;
>
>  	if (mod->init_layout.size) {
> -		ptr =3D module_alloc(mod->init_layout.size);
> +		ptr =3D text_alloc(mod->init_layout.size);
>  		/*
>  		 * The pointer to this block is stored in the module structure
>  		 * which is inside the block. This block doesn't need to be
> @@ -3269,7 +3252,7 @@ static int move_module(struct module *mod,=20=20
>=20struct load_info *info)
>  		 */
>  		kmemleak_ignore(ptr);
>  		if (!ptr) {
> -			module_memfree(mod->core_layout.base);
> +			text_memfree(mod->core_layout.base);
>  			return -ENOMEM;
>  		}
>  		memset(ptr, 0, mod->init_layout.size);
> @@ -3452,8 +3435,8 @@ static void module_deallocate(struct module=20=20
>=20*mod, struct load_info *info)
>  {
>  	percpu_modfree(mod);
>  	module_arch_freeing_init(mod);
> -	module_memfree(mod->init_layout.base);
> -	module_memfree(mod->core_layout.base);
> +	text_memfree(mod->init_layout.base);
> +	text_memfree(mod->core_layout.base);
>  }
>
>  int __weak module_finalize(const Elf_Ehdr *hdr,
> @@ -3527,7 +3510,7 @@ static void do_free_init(struct work_struct *w)
>
>  	llist_for_each_safe(pos, n, list) {
>  		initfree =3D container_of(pos, struct mod_initfree, node);
> -		module_memfree(initfree->module_init);
> +		text_memfree(initfree->module_init);
>  		kfree(initfree);
>  	}
>  }
> @@ -3626,10 +3609,10 @@ static noinline int do_init_module(struct=20=20
> module *mod)
>  	 * We want to free module_init, but be aware that kallsyms may be
>  	 * walking this with preempt disabled.  In all the failure paths, we
>  	 * call synchronize_rcu(), but we don't want to slow down the success
> -	 * path. module_memfree() cannot be called in an interrupt, so do the
> +	 * path. text_memfree() cannot be called in an interrupt, so do the
>  	 * work and call synchronize_rcu() in a work queue.
>  	 *
> -	 * Note that module_alloc() on most architectures creates W+X page
> +	 * Note that text_alloc() on most architectures creates W+X page
>  	 * mappings which won't be cleaned up until do_free_init() runs.  Any
>  	 * code such as mark_rodata_ro() which depends on those mappings to
>  	 * be cleaned up needs to sync with the queued work - ie
> diff --git a/kernel/text.c b/kernel/text.c
> new file mode 100644
> index 000000000000..9a12c508ded5
> --- /dev/null
> +++ b/kernel/text.c
> @@ -0,0 +1,25 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Copyright (C) 2002 Richard Henderson
> + *  Copyright (C) 2001 Rusty Russell, 2002, 2010 Rusty Russell IBM.
> + */
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +
> +void __weak text_memfree(void *module_region)
> +{
> +	/*
> +	 * This memory may be RO, and freeing RO memory in an interrupt is not
> +	 * supported by vmalloc.
> +	 */
> +	WARN_ON(in_interrupt());
> +	vfree(module_region);
> +}
> +
> +void * __weak text_alloc(unsigned long size)
> +{
> +	return __vmalloc_node_range(size, 1, VMALLOC_START, VMALLOC_END,
> +			GFP_KERNEL, PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS,
> +			NUMA_NO_NODE, __builtin_return_address(0));
> +}
> --
> 2.25.1



