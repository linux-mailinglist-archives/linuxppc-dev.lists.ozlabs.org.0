Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B2A35A2C9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 18:15:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FH3BQ67D7z3c1m
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 02:15:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FH3B00G2Pz3bTy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 Apr 2021 02:14:43 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FH39q43xvz9vBnD;
 Fri,  9 Apr 2021 18:14:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6ewgkzpIywvU; Fri,  9 Apr 2021 18:14:39 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FH39q35z5z9vBnC;
 Fri,  9 Apr 2021 18:14:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8A8D28B7F9;
 Fri,  9 Apr 2021 18:14:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id csvG6TdzIE5i; Fri,  9 Apr 2021 18:14:39 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A9238B7E4;
 Fri,  9 Apr 2021 18:14:19 +0200 (CEST)
Subject: Re: [PATCH v3] powerpc/traps: Enhance readability for trap types
To: Xiongwei Song <sxwjean@me.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, oleg@redhat.com,
 npiggin@gmail.com, aneesh.kumar@linux.ibm.com, ravi.bangoria@linux.ibm.com,
 mikey@neuling.org, haren@linux.ibm.com, akpm@linux-foundation.org,
 rppt@kernel.org, jniethe5@gmail.com, atrajeev@linux.vnet.ibm.com,
 maddy@linux.ibm.com, peterz@infradead.org, kjain@linux.ibm.com,
 kan.liang@linux.intel.com, aik@ozlabs.ru, alistair@popple.id.au,
 pmladek@suse.com, john.ogness@linutronix.de
References: <20210408140750.26832-1-sxwjean@me.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <70ece993-12bd-335c-d246-914564eb51dd@csgroup.eu>
Date: Fri, 9 Apr 2021 18:14:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408140750.26832-1-sxwjean@me.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: Xiongwei Song <sxwjean@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 08/04/2021 à 16:07, Xiongwei Song a écrit :
> From: Xiongwei Song <sxwjean@gmail.com>
> 
> Create a new header named traps.h, define macros to list ppc interrupt
> types in traps.h, replace the reference of the trap hex values with these
> macros.
> 
> Referred the hex number in arch/powerpc/kernel/exceptions-64e.S,
> arch/powerpc/kernel/exceptions-64s.S and
> arch/powerpc/include/asm/kvm_asm.h.
> 
> v2-v3:
> Correct the prefix of trap macros with INTERRUPT_, the previous prefix
> is TRAP_, which is not precise. This is suggested by Segher Boessenkool
> and Nicholas Piggin.
> 
> v1-v2:
> Define more trap macros to replace more trap hexs in code, not just for
> the __show_regs function. This is suggested by Christophe Leroy.
> 
> Signed-off-by: Xiongwei Song <sxwjean@gmail.com>
> ---
>   arch/powerpc/include/asm/interrupt.h  |  9 +++++---
>   arch/powerpc/include/asm/ptrace.h     |  3 ++-
>   arch/powerpc/include/asm/traps.h      | 32 +++++++++++++++++++++++++++
>   arch/powerpc/kernel/interrupt.c       |  3 ++-
>   arch/powerpc/kernel/process.c         |  5 ++++-
>   arch/powerpc/mm/book3s64/hash_utils.c |  5 +++--
>   arch/powerpc/mm/fault.c               | 21 +++++++++++-------
>   arch/powerpc/perf/core-book3s.c       |  5 +++--
>   arch/powerpc/xmon/xmon.c              | 16 +++++++++++---
>   9 files changed, 78 insertions(+), 21 deletions(-)
>   create mode 100644 arch/powerpc/include/asm/traps.h
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index 7c633896d758..5ce9898bc9a6 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -8,6 +8,7 @@
>   #include <asm/ftrace.h>
>   #include <asm/kprobes.h>
>   #include <asm/runlatch.h>
> +#include <asm/traps.h>
>   
>   struct interrupt_state {
>   #ifdef CONFIG_PPC_BOOK3E_64
> @@ -59,7 +60,7 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
>   		 * CT_WARN_ON comes here via program_check_exception,
>   		 * so avoid recursion.
>   		 */
> -		if (TRAP(regs) != 0x700)
> +		if (TRAP(regs) != INTERRUPT_PROGRAM)
>   			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
>   	}
>   #endif
> @@ -156,7 +157,8 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
>   	/* Don't do any per-CPU operations until interrupt state is fixed */
>   #endif
>   	/* Allow DEC and PMI to be traced when they are soft-NMI */
> -	if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260) {
> +	if (TRAP(regs) != INTERRUPT_DECREMENTER &&
> +	    TRAP(regs) != INTERRUPT_PERFMON) {

I think too long names hinder readability, see later for suggestions.

>   		state->ftrace_enabled = this_cpu_get_ftrace_enabled();
>   		this_cpu_set_ftrace_enabled(0);
>   	}
> @@ -180,7 +182,8 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
>   		nmi_exit();
>   
>   #ifdef CONFIG_PPC64
> -	if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260)
> +	if (TRAP(regs) != INTERRUPT_DECREMENTER &&
> +	    TRAP(regs) != INTERRUPT_PERFMON)
>   		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
>   
>   #ifdef CONFIG_PPC_BOOK3S_64
> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
> index f10498e1b3f6..7a17e0365d43 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -21,6 +21,7 @@
>   
>   #include <uapi/asm/ptrace.h>
>   #include <asm/asm-const.h>
> +#include <asm/traps.h>
>   
>   #ifndef __ASSEMBLY__
>   struct pt_regs
> @@ -237,7 +238,7 @@ static inline bool trap_is_unsupported_scv(struct pt_regs *regs)
>   
>   static inline bool trap_is_syscall(struct pt_regs *regs)
>   {
> -	return (trap_is_scv(regs) || TRAP(regs) == 0xc00);
> +	return (trap_is_scv(regs) || TRAP(regs) == INTERRUPT_SYSCALL);
>   }
>   
>   static inline bool trap_norestart(struct pt_regs *regs)
> diff --git a/arch/powerpc/include/asm/traps.h b/arch/powerpc/include/asm/traps.h
> new file mode 100644
> index 000000000000..cb416a17097c
> --- /dev/null
> +++ b/arch/powerpc/include/asm/traps.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_PPC_TRAPS_H
> +#define _ASM_PPC_TRAPS_H
> +
> +#if defined(CONFIG_BOOKE) || defined(CONFIG_4xx)
> +#define INTERRUPT_MACHINE_CHECK   0x000

I'd prefer shorted names in order to not be obliged to split lines.
Here are some suggestions:

INT_MCE

> +#define INTERRUPT_CRITICAL_INPUT  0x100

INT_CRIT

> +#define INTERRUPT_ALTIVEC_UNAVAIL 0x200
> +#define INTERRUPT_PERFMON         0x260

INT_PERF

> +#define INTERRUPT_DOORBELL        0x280
> +#define INTERRUPT_DEBUG           0xd00
> +#elif defined(CONFIG_PPC_BOOK3S)
> +#define INTERRUPT_SYSTEM_RESET    0x100

INT_SRESET

> +#define INTERRUPT_MACHINE_CHECK   0x200

INT_MCE

> +#define INTERRUPT_DATA_SEGMENT    0x380

INT_DSEG

> +#define INTERRUPT_INST_SEGMENT    0x480

INT_ISEG

> +#define INTERRUPT_DOORBELL        0xa00

INT_DBELL

> +#define INTERRUPT_TRACE           0xd00

INT_TRACE

> +#define INTERRUPT_H_DATA_STORAGE  0xe00
> +#define INTERRUPT_PERFMON         0xf00

INT_PERF

> +#define INTERRUPT_H_FAC_UNAVAIL   0xf80
> +#endif
> +
> +#define INTERRUPT_DATA_STORAGE    0x300

INT_DSI

> +#define INTERRUPT_INST_STORAGE    0x400

INT_ISI

> +#define INTERRUPT_ALIGNMENT       0x600

INT_ALIGN

> +#define INTERRUPT_PROGRAM         0x700

INT_PROG

> +#define INTERRUPT_FP_UNAVAIL      0x800

INT_FP_UNAVAIL

> +#define INTERRUPT_DECREMENTER     0x900

INT_DEC

> +#define INTERRUPT_SYSCALL         0xc00

INT_SYSCALL


> +
> +#endif /* _ASM_PPC_TRAPS_H */

...

> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 0c0b1c2cfb49..641b3feef7ee 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -44,6 +44,7 @@
>   #include <asm/debug.h>
>   #include <asm/kup.h>
>   #include <asm/inst.h>
> +#include <asm/traps.h>
>   
>   
>   /*
> @@ -197,7 +198,7 @@ static int mm_fault_error(struct pt_regs *regs, unsigned long addr,
>   static bool bad_kernel_fault(struct pt_regs *regs, unsigned long error_code,
>   			     unsigned long address, bool is_write)
>   {
> -	int is_exec = TRAP(regs) == 0x400;
> +	int is_exec = TRAP(regs) == INTERRUPT_INST_STORAGE;
>   
>   	/* NX faults set DSISR_PROTFAULT on the 8xx, DSISR_NOEXEC_OR_G on others */
>   	if (is_exec && (error_code & (DSISR_NOEXEC_OR_G | DSISR_KEYFAULT |
> @@ -391,7 +392,7 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
>   	struct vm_area_struct * vma;
>   	struct mm_struct *mm = current->mm;
>   	unsigned int flags = FAULT_FLAG_DEFAULT;
> - 	int is_exec = TRAP(regs) == 0x400;
> +	int is_exec = TRAP(regs) == INTERRUPT_INST_STORAGE;
>   	int is_user = user_mode(regs);
>   	int is_write = page_fault_is_write(error_code);
>   	vm_fault_t fault, major = 0;
> @@ -588,20 +589,24 @@ void __bad_page_fault(struct pt_regs *regs, int sig)
>   	/* kernel has accessed a bad area */
>   
>   	switch (TRAP(regs)) {
> -	case 0x300:
> -	case 0x380:
> -	case 0xe00:
> +	case INTERRUPT_DATA_STORAGE:
> +#ifdef CONFIG_PPC_BOOK3S
> +	case INTERRUPT_DATA_SEGMENT:
> +	case INTERRUPT_H_DATA_STORAGE:
> +#endif

It would be better to avoid #ifdefs when none where necessary before.


>   		pr_alert("BUG: %s on %s at 0x%08lx\n",
>   			 regs->dar < PAGE_SIZE ? "Kernel NULL pointer dereference" :
>   			 "Unable to handle kernel data access",
>   			 is_write ? "write" : "read", regs->dar);
>   		break;
> -	case 0x400:
> -	case 0x480:
> +	case INTERRUPT_INST_STORAGE:
> +#ifdef CONFIG_PPC_BOOK3S
> +	case INTERRUPT_INST_SEGMENT:
> +#endif

It would be better to avoid #ifdefs when none where necessary before.



>   		pr_alert("BUG: Unable to handle kernel instruction fetch%s",
>   			 regs->nip < PAGE_SIZE ? " (NULL pointer?)\n" : "\n");
>   		break;
> -	case 0x600:
> +	case INTERRUPT_ALIGNMENT:
>   		pr_alert("BUG: Unable to handle kernel unaligned access at 0x%08lx\n",
>   			 regs->dar);
>   		break;
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 766f064f00fb..6e34f5bba232 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -17,6 +17,7 @@
>   #include <asm/firmware.h>
>   #include <asm/ptrace.h>
>   #include <asm/code-patching.h>
> +#include <asm/traps.h>
>   
>   #ifdef CONFIG_PPC64
>   #include "internal.h"
> @@ -168,7 +169,7 @@ static bool regs_use_siar(struct pt_regs *regs)
>   	 * they have not been setup using perf_read_regs() and so regs->result
>   	 * is something random.
>   	 */
> -	return ((TRAP(regs) == 0xf00) && regs->result);
> +	return ((TRAP(regs) == INTERRUPT_PERFMON) && regs->result);
>   }
>   
>   /*
> @@ -347,7 +348,7 @@ static inline void perf_read_regs(struct pt_regs *regs)
>   	 * hypervisor samples as well as samples in the kernel with
>   	 * interrupts off hence the userspace check.
>   	 */
> -	if (TRAP(regs) != 0xf00)
> +	if (TRAP(regs) != INTERRUPT_PERFMON)
>   		use_siar = 0;
>   	else if ((ppmu->flags & PPMU_NO_SIAR))
>   		use_siar = 0;
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index bf7d69625a2e..2a4f99e64bf3 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -54,6 +54,7 @@
>   #include <asm/code-patching.h>
>   #include <asm/sections.h>
>   #include <asm/inst.h>
> +#include <asm/traps.h>
>   
>   #ifdef CONFIG_PPC64
>   #include <asm/hvcall.h>
> @@ -1769,7 +1770,12 @@ static void excprint(struct pt_regs *fp)
>   	printf("    sp: %lx\n", fp->gpr[1]);
>   	printf("   msr: %lx\n", fp->msr);
>   
> -	if (trap == 0x300 || trap == 0x380 || trap == 0x600 || trap == 0x200) {
> +	if (trap == INTERRUPT_DATA_STORAGE ||
> +#ifdef CONFIG_PPC_BOOK3S
> +	    trap == INTERRUPT_DATA_SEGMENT ||
> +#endif
It would be better to avoid #ifdefs when none where necessary before.

And an #ifdef in the middle of a code line is awful for readability and maintainability.

> +	    trap == INTERRUPT_ALIGNMENT ||
> +	    trap == INTERRUPT_MACHINE_CHECK) {
>   		printf("   dar: %lx\n", fp->dar);
>   		if (trap != 0x380)
>   			printf(" dsisr: %lx\n", fp->dsisr);
> @@ -1785,7 +1791,7 @@ static void excprint(struct pt_regs *fp)
>   		       current->pid, current->comm);
>   	}
>   
> -	if (trap == 0x700)
> +	if (trap == INTERRUPT_PROGRAM)
>   		print_bug_trap(fp);
>   
>   	printf(linux_banner);
> @@ -1846,7 +1852,11 @@ static void prregs(struct pt_regs *fp)
>   	printf("ctr = "REG"   xer = "REG"   trap = %4lx\n",
>   	       fp->ctr, fp->xer, fp->trap);
>   	trap = TRAP(fp);
> -	if (trap == 0x300 || trap == 0x380 || trap == 0x600)
> +	if (trap == INTERRUPT_DATA_STORAGE ||
> +#ifdef CONFIG_PPC_BOOK3S
> +	    trap == INTERRUPT_DATA_SEGMENT ||
> +#endif
> +	    trap == INTERRUPT_ALIGNMENT)

It would be better to avoid #ifdefs when none where necessary before.

And an #ifdef in the middle of a code line is awful for readability and maintainability.


>   		printf("dar = "REG"   dsisr = %.8lx\n", fp->dar, fp->dsisr);
>   }
>   
> 
