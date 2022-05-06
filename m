Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC22251D5DC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 12:41:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvnDg4Ttgz3cCP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 20:41:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KvnDB6PSTz3bxR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 20:41:12 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 909E3152B;
 Fri,  6 May 2022 03:40:39 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.65.197])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C05713FA31;
 Fri,  6 May 2022 03:40:35 -0700 (PDT)
Date: Fri, 6 May 2022 11:40:31 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Subject: Re: [PATCH] bug: Use normal relative pointers in 'struct bug_entry'
Message-ID: <YnT7H1wsviLlBmEG@FVFF77S0Q05N>
References: <afddb4548e93f6458ec1d9ec185a834c348eda33.1651798983.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afddb4548e93f6458ec1d9ec185a834c348eda33.1651798983.git.jpoimboe@kernel.org>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 05, 2022 at 06:09:45PM -0700, Josh Poimboeuf wrote:
> With CONFIG_GENERIC_BUG_RELATIVE_POINTERS, the addr/file relative
> pointers are calculated weirdly: based on the beginning of the bug_entry
> struct address, rather than their respective pointer addresses.
> 
> Make the relative pointers less surprising to both humans and tools by
> calculating them the normal way.
> 
> Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>

This looks good to me.

Just in case, I gave this a spin on arm64 defconfig atop v5.18-rc4. This builds
cleanly with both GCC 11.1.0 and LLVM 14.0.0, and works correctly in testing
on both with the LKDTM BUG/WARNING/WARNING_MESSAGE tests, i.e.

  echo WARNING > /sys/kernel/debug/provoke-crash/DIRECT
  echo WARNING_MESSAGE > /sys/kernel/debug/provoke-crash/DIRECT
  echo BUG > /sys/kernel/debug/provoke-crash/DIRECT

FWIW:

Reviewed-by: Mark Rutland <mark.rutland@arm.com>
Tested-by: Mark Rutland <mark.rutland@arm.com> [arm64]

As an aside (and for anyone else trying to duplicate my results), on arm64
there's a latent issue (prior to this patch) where BUG() will always result in
a WARN_ON_ONCE() in rcu_eqs_enter(). Since BUG() uses a BRK, and we treat the
BRK exception as an NMI, when we kill the task we do that in NMI context, but
schedule another task in regular task context, and RCU doesn't like that:

# echo BUG > /sys/kernel/debug/provoke-crash/DIRECT
[   28.284180] lkdtm: Performing direct entry BUG
[   28.285052] ------------[ cut here ]------------
[   28.285940] kernel BUG at drivers/misc/lkdtm/bugs.c:78!
[   28.287008] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
[   28.288143] Modules linked in:
[   28.288798] CPU: 0 PID: 151 Comm: bash Not tainted 5.18.0-rc4 #1
[   28.290040] Hardware name: linux,dummy-virt (DT)
[   28.290979] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   28.292380] pc : lkdtm_BUG+0x4/0xc
[   28.293084] lr : lkdtm_do_action+0x24/0x30
[   28.293923] sp : ffff8000083bbce0
[   28.294624] x29: ffff8000083bbce0 x28: ffff3c5743440000 x27: 0000000000000000
[   28.296057] x26: 0000000000000000 x25: ffffa4bc19c480b0 x24: ffff8000083bbdf0
[   28.297493] x23: 0000000000000004 x22: ffff3c57440f3000 x21: ffffa4bc1a0bfba0
[   28.298933] x20: ffffa4bc19c480c0 x19: 0000000000000001 x18: ffffffffffffffff
[   28.300369] x17: 0000000000000000 x16: 0000000000000000 x15: 0720072007200720
[   28.301823] x14: 0720072007200747 x13: ffffa4bc1a8d2520 x12: 00000000000003b1
[   28.303257] x11: 000000000000013b x10: ffffa4bc1a92a520 x9 : ffffa4bc1a8d2520
[   28.304689] x8 : 00000000ffffefff x7 : ffffa4bc1a92a520 x6 : 0000000000000000
[   28.306120] x5 : 0000000000000000 x4 : ffff3c57bfbcc9e8 x3 : 0000000000000000
[   28.307550] x2 : 0000000000000000 x1 : ffff3c5743440000 x0 : ffffa4bc19279284
[   28.308981] Call trace:
[   28.309496]  lkdtm_BUG+0x4/0xc
[   28.310134]  direct_entry+0x11c/0x1cc
[   28.310888]  full_proxy_write+0x60/0xbc
[   28.311690]  vfs_write+0xc4/0x2a4
[   28.312383]  ksys_write+0x68/0xf4
[   28.313056]  __arm64_sys_write+0x20/0x2c
[   28.313851]  invoke_syscall+0x48/0x114
[   28.314623]  el0_svc_common.constprop.0+0xd4/0xfc
[   28.315584]  do_el0_svc+0x28/0x90
[   28.316276]  el0_svc+0x34/0xb0
[   28.316917]  el0t_64_sync_handler+0xa4/0x130
[   28.317786]  el0t_64_sync+0x18c/0x190
[   28.318560] Code: b90027e0 17ffffea 941b4d4c d503245f (d4210000) 
[   28.319796] ---[ end trace 0000000000000000 ]---
[   28.320736] note: bash[151] exited with preempt_count 1
[   28.329377] ------------[ cut here ]------------
[   28.330327] WARNING: CPU: 0 PID: 0 at kernel/rcu/tree.c:624 rcu_eqs_enter.constprop.0+0x7c/0x84
[   28.332103] Modules linked in:
[   28.332757] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G      D           5.18.0-rc4 #1
[   28.334355] Hardware name: linux,dummy-virt (DT)
[   28.335318] pstate: 204000c5 (nzCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   28.336745] pc : rcu_eqs_enter.constprop.0+0x7c/0x84
[   28.337766] lr : rcu_idle_enter+0x10/0x1c
[   28.338609] sp : ffffa4bc1a8b3d40
[   28.339309] x29: ffffa4bc1a8b3d40 x28: 0000000041168458 x27: 0000000000000000
[   28.340788] x26: ffffa4bc1a8c3340 x25: 0000000000000000 x24: 0000000000000000
[   28.342255] x23: ffffa4bc1a8b9b4c x22: ffffa4bc1a37a6f8 x21: ffffa4bc1a8b9a38
[   28.343705] x20: ffffa4bc1a8b9b40 x19: ffff3c57bfbd4800 x18: 0000000000000000
[   28.345159] x17: 0000000000000000 x16: 0000000000000000 x15: 000006a1d2912376
[   28.346632] x14: 000000000000018a x13: 000000000000018a x12: 0000000000000000
[   28.348089] x11: 0000000000000001 x10: 0000000000000a50 x9 : ffffa4bc1a8b3ce0
[   28.349551] x8 : ffffa4bc1a8c3df0 x7 : ffff3c57bfbd3b80 x6 : 0000000154de2486
[   28.351040] x5 : 03ffffffffffffff x4 : 0000000000000a5c x3 : ffffa4bc1a8b79c0
[   28.352505] x2 : 0000000000000a5c x1 : 4000000000000002 x0 : 4000000000000000
[   28.353966] Call trace:
[   28.354496]  rcu_eqs_enter.constprop.0+0x7c/0x84
[   28.355467]  rcu_idle_enter+0x10/0x1c
[   28.356230]  default_idle_call+0x20/0x6c
[   28.357061]  do_idle+0x22c/0x29c
[   28.357743]  cpu_startup_entry+0x24/0x30
[   28.358579]  rest_init+0xe4/0xf4
[   28.359265]  arch_call_rest_init+0x10/0x1c
[   28.360123]  start_kernel+0x628/0x668
[   28.360890]  __primary_switched+0xc0/0xc8
[   28.361742] ---[ end trace 0000000000000000 ]---

... ideally we'd rework the way we handle BRK such that we can treat BUG() as a
regular synchronous exception that inherits the original context (as if it were
a special function call within that context).

Thanks,
Mark.

> ---
>  arch/arm64/include/asm/asm-bug.h |  4 ++--
>  arch/powerpc/include/asm/bug.h   |  5 +++--
>  arch/riscv/include/asm/bug.h     |  4 ++--
>  arch/s390/include/asm/bug.h      |  5 +++--
>  arch/x86/include/asm/bug.h       |  2 +-
>  lib/bug.c                        | 15 +++++++--------
>  6 files changed, 18 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
> index 03f52f84a4f3..c762038ba400 100644
> --- a/arch/arm64/include/asm/asm-bug.h
> +++ b/arch/arm64/include/asm/asm-bug.h
> @@ -14,7 +14,7 @@
>  	14472:	.string file;					\
>  		.popsection;					\
>  								\
> -		.long 14472b - 14470b;				\
> +		.long 14472b - .;				\
>  		.short line;
>  #else
>  #define _BUGVERBOSE_LOCATION(file, line)
> @@ -25,7 +25,7 @@
>  #define __BUG_ENTRY(flags) 				\
>  		.pushsection __bug_table,"aw";		\
>  		.align 2;				\
> -	14470:	.long 14471f - 14470b;			\
> +	14470:	.long 14471f - .;			\
>  _BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
>  		.short flags; 				\
>  		.popsection;				\
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index ecbae1832de3..76252576d889 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -13,7 +13,8 @@
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
>  .macro __EMIT_BUG_ENTRY addr,file,line,flags
>  	 .section __bug_table,"aw"
> -5001:	 .4byte \addr - 5001b, 5002f - 5001b
> +5001:	 .4byte \addr - .
> +	 .4byte 5002f - .
>  	 .short \line, \flags
>  	 .org 5001b+BUG_ENTRY_SIZE
>  	 .previous
> @@ -24,7 +25,7 @@
>  #else
>  .macro __EMIT_BUG_ENTRY addr,file,line,flags
>  	 .section __bug_table,"aw"
> -5001:	 .4byte \addr - 5001b
> +5001:	 .4byte \addr - .
>  	 .short \flags
>  	 .org 5001b+BUG_ENTRY_SIZE
>  	 .previous
> diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
> index d3804a2f9aad..1aaea81fb141 100644
> --- a/arch/riscv/include/asm/bug.h
> +++ b/arch/riscv/include/asm/bug.h
> @@ -30,8 +30,8 @@
>  typedef u32 bug_insn_t;
>  
>  #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
> -#define __BUG_ENTRY_ADDR	RISCV_INT " 1b - 2b"
> -#define __BUG_ENTRY_FILE	RISCV_INT " %0 - 2b"
> +#define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
> +#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
>  #else
>  #define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
>  #define __BUG_ENTRY_FILE	RISCV_PTR " %0"
> diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
> index 0b25f28351ed..aebe1e22c7be 100644
> --- a/arch/s390/include/asm/bug.h
> +++ b/arch/s390/include/asm/bug.h
> @@ -15,7 +15,8 @@
>  		"1:	.asciz	\""__FILE__"\"\n"		\
>  		".previous\n"					\
>  		".section __bug_table,\"awM\",@progbits,%2\n"	\
> -		"2:	.long	0b-2b,1b-2b\n"			\
> +		"2:	.long	0b-.\n"				\
> +		"	.long	1b-.\n"				\
>  		"	.short	%0,%1\n"			\
>  		"	.org	2b+%2\n"			\
>  		".previous\n"					\
> @@ -30,7 +31,7 @@
>  	asm_inline volatile(					\
>  		"0:	mc	0,0\n"				\
>  		".section __bug_table,\"awM\",@progbits,%1\n"	\
> -		"1:	.long	0b-1b\n"			\
> +		"1:	.long	0b-.\n"				\
>  		"	.short	%0\n"				\
>  		"	.org	1b+%1\n"			\
>  		".previous\n"					\
> diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
> index aaf0cb0db4ae..a3ec87d198ac 100644
> --- a/arch/x86/include/asm/bug.h
> +++ b/arch/x86/include/asm/bug.h
> @@ -18,7 +18,7 @@
>  #ifdef CONFIG_X86_32
>  # define __BUG_REL(val)	".long " __stringify(val)
>  #else
> -# define __BUG_REL(val)	".long " __stringify(val) " - 2b"
> +# define __BUG_REL(val)	".long " __stringify(val) " - ."
>  #endif
>  
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
> diff --git a/lib/bug.c b/lib/bug.c
> index 45a0584f6541..c223a2575b72 100644
> --- a/lib/bug.c
> +++ b/lib/bug.c
> @@ -6,8 +6,7 @@
>  
>    CONFIG_BUG - emit BUG traps.  Nothing happens without this.
>    CONFIG_GENERIC_BUG - enable this code.
> -  CONFIG_GENERIC_BUG_RELATIVE_POINTERS - use 32-bit pointers relative to
> -	the containing struct bug_entry for bug_addr and file.
> +  CONFIG_GENERIC_BUG_RELATIVE_POINTERS - use 32-bit relative pointers for bug_addr and file
>    CONFIG_DEBUG_BUGVERBOSE - emit full file+line information for each BUG
>  
>    CONFIG_BUG and CONFIG_DEBUG_BUGVERBOSE are potentially user-settable
> @@ -53,10 +52,10 @@ extern struct bug_entry __start___bug_table[], __stop___bug_table[];
>  
>  static inline unsigned long bug_addr(const struct bug_entry *bug)
>  {
> -#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
> -	return bug->bug_addr;
> +#ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
> +	return (unsigned long)&bug->bug_addr_disp + bug->bug_addr_disp;
>  #else
> -	return (unsigned long)bug + bug->bug_addr_disp;
> +	return bug->bug_addr;
>  #endif
>  }
>  
> @@ -131,10 +130,10 @@ void bug_get_file_line(struct bug_entry *bug, const char **file,
>  		       unsigned int *line)
>  {
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
> -#ifndef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
> -	*file = bug->file;
> +#ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
> +	*file = (const char *)&bug->file_disp + bug->file_disp;
>  #else
> -	*file = (const char *)bug + bug->file_disp;
> +	*file = bug->file;
>  #endif
>  	*line = bug->line;
>  #else
> -- 
> 2.34.1
> 
