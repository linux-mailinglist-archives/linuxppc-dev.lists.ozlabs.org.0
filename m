Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1F321EE57
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 12:52:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5clm08GTzDqLp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 20:52:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=QlVqa27f; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5cDt1yTWzDqQj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 20:28:46 +1000 (AEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97C4621D7D;
 Tue, 14 Jul 2020 10:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594722524;
 bh=mPVDK+qqH1tm3N93m2yLoFOn1KwcBbsmaZp8CSAbvt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QlVqa27f64ZyOpN17giIVIcdHXfBXxkKLs/DEyTrdikrv9OrVpmokkY3cInzl9WLL
 6fYOUia8bpoQPhnLuw932q4ELdtJbimgWTEXvXrdrtWg3SmzG6137eYwe9LG/DY93n
 ykErTEx0kh6ObREVI3LGK7h0SuVz8U9mJEHLV7Kw=
Date: Tue, 14 Jul 2020 11:28:27 +0100
From: Will Deacon <will@kernel.org>
To: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: [PATCH v2 1/3] module: Rename module_alloc() to text_alloc() and
 move to kernel proper
Message-ID: <20200714102826.GB4756@willie-the-truck>
References: <20200714094625.1443261-1-jarkko.sakkinen@linux.intel.com>
 <20200714094625.1443261-2-jarkko.sakkinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200714094625.1443261-2-jarkko.sakkinen@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 14 Jul 2020 20:36:21 +1000
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
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Vincent Chen <deanbo422@gmail.com>, Omar Sandoval <osandov@fb.com>,
 "open list:S390" <linux-s390@vger.kernel.org>,
 Joe Lawrence <joe.lawrence@redhat.com>, Helge Deller <deller@gmx.de>,
 John Fastabend <john.fastabend@gmail.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Yonghong Song <yhs@fb.com>, Iurii Zaikin <yzaikin@google.com>,
 Andrii Nakryiko <andriin@fb.com>, Thomas Huth <thuth@redhat.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Daniel Axtens <dja@axtens.net>, Damien Le Moal <damien.lemoal@wdc.com>,
 Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Alexei Starovoitov <ast@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Nayna Jain <nayna@linux.ibm.com>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Sami Tolvanen <samitolvanen@google.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Mao Han <han_mao@c-sky.com>,
 Marco Elver <elver@google.com>, Steven Rostedt <rostedt@goodmis.org>,
 Babu Moger <Babu.Moger@amd.com>, Borislav Petkov <bp@alien8.de>,
 Greentime Hu <green.hu@gmail.com>, Ben Dooks <ben-linux@fluff.org>,
 Guan Xuetao <gxt@pku.edu.cn>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "open list:PARISC ARCHITECTURE" <linux-parisc@vger.kernel.org>,
 Jessica Yu <jeyu@kernel.org>,
 "open list:BPF JIT for MIPS \(32-BIT AND 64-BIT\)" <bpf@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, David Howells <dhowells@redhat.com>,
 "open list:SPARC + UltraSPARC \(sparc/sparc64\)" <sparclinux@vger.kernel.org>,
 Sandipan Das <sandipan@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Amit Daniel Kachhap <amit.kachhap@arm.com>,
 Tiezhu Yang <yangtiezhu@loongson.cn>, Miroslav Benes <mbenes@suse.cz>,
 Sven Schnelle <svens@stackframe.org>, Ard Biesheuvel <ardb@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Anders Roxell <anders.roxell@linaro.org>, Jiri Olsa <jolsa@redhat.com>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Albert Ou <aou@eecs.berkeley.edu>, "Paul E. McKenney" <paulmck@kernel.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, KP Singh <kpsingh@chromium.org>,
 Dmitry Vyukov <dvyukov@google.com>, Nick Hu <nickhu@andestech.com>,
 "open list:BPF JIT for MIPS \(32-BIT AND 64-BIT\)" <netdev@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 14, 2020 at 12:45:36PM +0300, Jarkko Sakkinen wrote:
> Rename module_alloc() to text_alloc() and module_memfree() to
> text_memfree(), and move them to kernel/text.c, which is unconditionally
> compiled to the kernel proper. This allows kprobes, ftrace and bpf to
> allocate space for executable code without requiring to compile the modules
> support (CONFIG_MODULES=y) in.
> 
> Cc: Andi Kleen <ak@linux.intel.com>
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

[...]

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
> -	u64 module_alloc_end = module_alloc_base + MODULES_VSIZE;
> -	gfp_t gfp_mask = GFP_KERNEL;
> -	void *p;
> -
> -	/* Silence the initial allocation */
> -	if (IS_ENABLED(CONFIG_ARM64_MODULE_PLTS))
> -		gfp_mask |= __GFP_NOWARN;
> -
> -	if (IS_ENABLED(CONFIG_KASAN))
> -		/* don't exceed the static module region - see below */
> -		module_alloc_end = MODULES_END;
> -
> -	p = __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
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
> -		p = __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
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
> +	u64 module_alloc_end = module_alloc_base + MODULES_VSIZE;
> +	gfp_t gfp_mask = GFP_KERNEL;
> +	void *p;
> +
> +	/* Silence the initial allocation */
> +	if (IS_ENABLED(CONFIG_ARM64_MODULE_PLTS))
> +		gfp_mask |= __GFP_NOWARN;
> +
> +	if (IS_ENABLED(CONFIG_KASAN))
> +		/* don't exceed the static module region - see below */
> +		module_alloc_end = MODULES_END;
> +
> +	p = __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
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
> +		p = __vmalloc_node_range(size, MODULE_ALIGN, module_alloc_base,
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

I'm not especially keen on this approach.

As Ard says, module_alloc() _is_ special, in the sense that the virtual
memory it allocates wants to be close to the kernel text, whereas the
concept of allocating executable memory is broader and doesn't have these
restrictions. So, while I'm in favour of having a text_alloc() interface
that can be used by callers which only require an executable mapping, I'd
much prefer for the module_alloc() code to remain for, err, modules.

Thanks,

Will
