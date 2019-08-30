Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C273DA3F05
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 22:32:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46KrkY2rVtzDr7h
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 06:32:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="C0fJjiiK"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Krf360rNzDr7x
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 06:28:27 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46Krdz5FN5z9v7DV;
 Fri, 30 Aug 2019 22:28:23 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=C0fJjiiK; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id O-pdQSA3Q2ME; Fri, 30 Aug 2019 22:28:23 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46Krdz3nhVz9v7DT;
 Fri, 30 Aug 2019 22:28:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567196903; bh=umJujtKCt9jA9s96NQbYBENAOmS2h+Mpa9zpQeN9sMM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=C0fJjiiKYEDYs/7rTwTHb33X+dunIK9qZAvTqnodUnQqUHfIMjQuGjSShAl84HFaw
 JKQ9vC+W41YCNJYHtUU5dcahPTsCYQb45PvKs6BueOWO2NGz4WQKwaMkDzWgbQB8pi
 JxJy3gf1vg/+2xx05IOjW89LGrAhX4Hx/pMw1ABM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C5F9C8B911;
 Fri, 30 Aug 2019 22:28:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id swGmCwsH9bEQ; Fri, 30 Aug 2019 22:28:23 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2CBF38B90B;
 Fri, 30 Aug 2019 22:28:22 +0200 (CEST)
Subject: Re: [PATCH v6 6/6] powerpc/perf: split callchain.c by bitness
To: Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
References: <cover.1567188299.git.msuchanek@suse.de>
 <567e7e876edf29ae528027d8574038fbc287f25a.1567188299.git.msuchanek@suse.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <10934168-af3d-b804-1d4e-75c4fb186908@c-s.fr>
Date: Fri, 30 Aug 2019 22:28:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <567e7e876edf29ae528027d8574038fbc287f25a.1567188299.git.msuchanek@suse.de>
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
Cc: David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Nicolai Stange <nstange@suse.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Allison Randal <allison@lohutok.net>, Firoz Khan <firoz.khan@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Arnd Bergmann <arnd@arndb.de>,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Christian Brauner <christian@brauner.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/08/2019 à 20:57, Michal Suchanek a écrit :
> Building callchain.c with !COMPAT proved quite ugly with all the
> defines. Splitting out the 32bit and 64bit parts looks better.
> 
> No code change intended.
> 
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
> v6:
>   - move current_is_64bit consolidetaion to earlier patch
>   - move defines to the top of callchain_32.c
>   - Makefile cleanup
> ---
>   arch/powerpc/perf/Makefile       |   5 +-
>   arch/powerpc/perf/callchain.c    | 371 +------------------------------
>   arch/powerpc/perf/callchain.h    |  11 +
>   arch/powerpc/perf/callchain_32.c | 204 +++++++++++++++++
>   arch/powerpc/perf/callchain_64.c | 185 +++++++++++++++
>   5 files changed, 405 insertions(+), 371 deletions(-)
>   create mode 100644 arch/powerpc/perf/callchain.h
>   create mode 100644 arch/powerpc/perf/callchain_32.c
>   create mode 100644 arch/powerpc/perf/callchain_64.c
> 
> diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
> index c155dcbb8691..53d614e98537 100644
> --- a/arch/powerpc/perf/Makefile
> +++ b/arch/powerpc/perf/Makefile
> @@ -1,6 +1,9 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
> -obj-$(CONFIG_PERF_EVENTS)	+= callchain.o perf_regs.o
> +obj-$(CONFIG_PERF_EVENTS)	+= callchain.o callchain_$(BITS).o perf_regs.o
> +ifdef CONFIG_COMPAT
> +obj-$(CONFIG_PERF_EVENTS)	+= callchain_32.o
> +endif
>   
>   obj-$(CONFIG_PPC_PERF_CTRS)	+= core-book3s.o bhrb.o
>   obj64-$(CONFIG_PPC_PERF_CTRS)	+= ppc970-pmu.o power5-pmu.o \
> diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
> index 788ad2c63f18..8f30f1b47c78 100644
> --- a/arch/powerpc/perf/callchain.c
> +++ b/arch/powerpc/perf/callchain.c
> @@ -15,11 +15,9 @@
>   #include <asm/sigcontext.h>
>   #include <asm/ucontext.h>
>   #include <asm/vdso.h>
> -#ifdef CONFIG_COMPAT
> -#include "../kernel/ppc32.h"
> -#endif
>   #include <asm/pte-walk.h>
>   
> +#include "callchain.h"
>   
>   /*
>    * Is sp valid as the address of the next kernel stack frame after prev_sp?
> @@ -102,373 +100,6 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
>   	}
>   }
>   
> -#ifdef CONFIG_PPC64
> -/*
> - * On 64-bit we don't want to invoke hash_page on user addresses from
> - * interrupt context, so if the access faults, we read the page tables
> - * to find which page (if any) is mapped and access it directly.
> - */
> -static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
> -{
> -	int ret = -EFAULT;
> -	pgd_t *pgdir;
> -	pte_t *ptep, pte;
> -	unsigned shift;
> -	unsigned long addr = (unsigned long) ptr;
> -	unsigned long offset;
> -	unsigned long pfn, flags;
> -	void *kaddr;
> -
> -	pgdir = current->mm->pgd;
> -	if (!pgdir)
> -		return -EFAULT;
> -
> -	local_irq_save(flags);
> -	ptep = find_current_mm_pte(pgdir, addr, NULL, &shift);
> -	if (!ptep)
> -		goto err_out;
> -	if (!shift)
> -		shift = PAGE_SHIFT;
> -
> -	/* align address to page boundary */
> -	offset = addr & ((1UL << shift) - 1);
> -
> -	pte = READ_ONCE(*ptep);
> -	if (!pte_present(pte) || !pte_user(pte))
> -		goto err_out;
> -	pfn = pte_pfn(pte);
> -	if (!page_is_ram(pfn))
> -		goto err_out;
> -
> -	/* no highmem to worry about here */
> -	kaddr = pfn_to_kaddr(pfn);
> -	memcpy(buf, kaddr + offset, nb);
> -	ret = 0;
> -err_out:
> -	local_irq_restore(flags);
> -	return ret;
> -}
> -
> -static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
> -{
> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned long) ||
> -	    ((unsigned long)ptr & 7))
> -		return -EFAULT;
> -
> -	pagefault_disable();
> -	if (!__get_user_inatomic(*ret, ptr)) {
> -		pagefault_enable();
> -		return 0;
> -	}
> -	pagefault_enable();
> -
> -	return read_user_stack_slow(ptr, ret, 8);
> -}
> -
> -static inline int valid_user_sp(unsigned long sp, int is_64)
> -{
> -	if (!sp || (sp & 7) || sp > (is_64 ? TASK_SIZE : 0x100000000UL) - 32)
> -		return 0;
> -	return 1;
> -}
> -
> -/*
> - * 64-bit user processes use the same stack frame for RT and non-RT signals.
> - */
> -struct signal_frame_64 {
> -	char		dummy[__SIGNAL_FRAMESIZE];
> -	struct ucontext	uc;
> -	unsigned long	unused[2];
> -	unsigned int	tramp[6];
> -	struct siginfo	*pinfo;
> -	void		*puc;
> -	struct siginfo	info;
> -	char		abigap[288];
> -};
> -
> -static int is_sigreturn_64_address(unsigned long nip, unsigned long fp)
> -{
> -	if (nip == fp + offsetof(struct signal_frame_64, tramp))
> -		return 1;
> -	if (vdso64_rt_sigtramp && current->mm->context.vdso_base &&
> -	    nip == current->mm->context.vdso_base + vdso64_rt_sigtramp)
> -		return 1;
> -	return 0;
> -}
> -
> -/*
> - * Do some sanity checking on the signal frame pointed to by sp.
> - * We check the pinfo and puc pointers in the frame.
> - */
> -static int sane_signal_64_frame(unsigned long sp)
> -{
> -	struct signal_frame_64 __user *sf;
> -	unsigned long pinfo, puc;
> -
> -	sf = (struct signal_frame_64 __user *) sp;
> -	if (read_user_stack_64((unsigned long __user *) &sf->pinfo, &pinfo) ||
> -	    read_user_stack_64((unsigned long __user *) &sf->puc, &puc))
> -		return 0;
> -	return pinfo == (unsigned long) &sf->info &&
> -		puc == (unsigned long) &sf->uc;
> -}
> -
> -static void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
> -				   struct pt_regs *regs)
> -{
> -	unsigned long sp, next_sp;
> -	unsigned long next_ip;
> -	unsigned long lr;
> -	long level = 0;
> -	struct signal_frame_64 __user *sigframe;
> -	unsigned long __user *fp, *uregs;
> -
> -	next_ip = perf_instruction_pointer(regs);
> -	lr = regs->link;
> -	sp = regs->gpr[1];
> -	perf_callchain_store(entry, next_ip);
> -
> -	while (entry->nr < entry->max_stack) {
> -		fp = (unsigned long __user *) sp;
> -		if (!valid_user_sp(sp, 1) || read_user_stack_64(fp, &next_sp))
> -			return;
> -		if (level > 0 && read_user_stack_64(&fp[2], &next_ip))
> -			return;
> -
> -		/*
> -		 * Note: the next_sp - sp >= signal frame size check
> -		 * is true when next_sp < sp, which can happen when
> -		 * transitioning from an alternate signal stack to the
> -		 * normal stack.
> -		 */
> -		if (next_sp - sp >= sizeof(struct signal_frame_64) &&
> -		    (is_sigreturn_64_address(next_ip, sp) ||
> -		     (level <= 1 && is_sigreturn_64_address(lr, sp))) &&
> -		    sane_signal_64_frame(sp)) {
> -			/*
> -			 * This looks like an signal frame
> -			 */
> -			sigframe = (struct signal_frame_64 __user *) sp;
> -			uregs = sigframe->uc.uc_mcontext.gp_regs;
> -			if (read_user_stack_64(&uregs[PT_NIP], &next_ip) ||
> -			    read_user_stack_64(&uregs[PT_LNK], &lr) ||
> -			    read_user_stack_64(&uregs[PT_R1], &sp))
> -				return;
> -			level = 0;
> -			perf_callchain_store_context(entry, PERF_CONTEXT_USER);
> -			perf_callchain_store(entry, next_ip);
> -			continue;
> -		}
> -
> -		if (level == 0)
> -			next_ip = lr;
> -		perf_callchain_store(entry, next_ip);
> -		++level;
> -		sp = next_sp;
> -	}
> -}
> -
> -#else  /* CONFIG_PPC64 */
> -static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
> -{
> -	return 0;
> -}
> -#endif /* CONFIG_PPC64 */
> -
> -/*
> - * On 32-bit we just access the address and let hash_page create a
> - * HPTE if necessary, so there is no need to fall back to reading
> - * the page tables.  Since this is called at interrupt level,
> - * do_page_fault() won't treat a DSI as a page fault.
> - */
> -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
> -{
> -	int rc;
> -
> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> -	    ((unsigned long)ptr & 3))
> -		return -EFAULT;
> -
> -	pagefault_disable();
> -	rc = __get_user_inatomic(*ret, ptr);
> -	pagefault_enable();
> -
> -	if (IS_ENABLED(CONFIG_PPC64) && rc)
> -		return read_user_stack_slow(ptr, ret, 4);
> -	return rc;
> -}
> -
> -#ifndef CONFIG_PPC64
> -static inline void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
> -					  struct pt_regs *regs)
> -{
> -}
> -
> -static inline int valid_user_sp(unsigned long sp, int is_64)
> -{
> -	if (!sp || (sp & 7) || sp > TASK_SIZE - 32)
> -		return 0;
> -	return 1;
> -}
> -
> -#define __SIGNAL_FRAMESIZE32	__SIGNAL_FRAMESIZE
> -#define sigcontext32		sigcontext
> -#define mcontext32		mcontext
> -#define ucontext32		ucontext
> -#define compat_siginfo_t	struct siginfo
> -
> -#endif /* CONFIG_PPC64 */
> -
> -#if defined(CONFIG_PPC32) || defined(CONFIG_COMPAT)
> -/*
> - * Layout for non-RT signal frames
> - */
> -struct signal_frame_32 {
> -	char			dummy[__SIGNAL_FRAMESIZE32];
> -	struct sigcontext32	sctx;
> -	struct mcontext32	mctx;
> -	int			abigap[56];
> -};
> -
> -/*
> - * Layout for RT signal frames
> - */
> -struct rt_signal_frame_32 {
> -	char			dummy[__SIGNAL_FRAMESIZE32 + 16];
> -	compat_siginfo_t	info;
> -	struct ucontext32	uc;
> -	int			abigap[56];
> -};
> -
> -static int is_sigreturn_32_address(unsigned int nip, unsigned int fp)
> -{
> -	if (nip == fp + offsetof(struct signal_frame_32, mctx.mc_pad))
> -		return 1;
> -	if (vdso32_sigtramp && current->mm->context.vdso_base &&
> -	    nip == current->mm->context.vdso_base + vdso32_sigtramp)
> -		return 1;
> -	return 0;
> -}
> -
> -static int is_rt_sigreturn_32_address(unsigned int nip, unsigned int fp)
> -{
> -	if (nip == fp + offsetof(struct rt_signal_frame_32,
> -				 uc.uc_mcontext.mc_pad))
> -		return 1;
> -	if (vdso32_rt_sigtramp && current->mm->context.vdso_base &&
> -	    nip == current->mm->context.vdso_base + vdso32_rt_sigtramp)
> -		return 1;
> -	return 0;
> -}
> -
> -static int sane_signal_32_frame(unsigned int sp)
> -{
> -	struct signal_frame_32 __user *sf;
> -	unsigned int regs;
> -
> -	sf = (struct signal_frame_32 __user *) (unsigned long) sp;
> -	if (read_user_stack_32((unsigned int __user *) &sf->sctx.regs, &regs))
> -		return 0;
> -	return regs == (unsigned long) &sf->mctx;
> -}
> -
> -static int sane_rt_signal_32_frame(unsigned int sp)
> -{
> -	struct rt_signal_frame_32 __user *sf;
> -	unsigned int regs;
> -
> -	sf = (struct rt_signal_frame_32 __user *) (unsigned long) sp;
> -	if (read_user_stack_32((unsigned int __user *) &sf->uc.uc_regs, &regs))
> -		return 0;
> -	return regs == (unsigned long) &sf->uc.uc_mcontext;
> -}
> -
> -static unsigned int __user *signal_frame_32_regs(unsigned int sp,
> -				unsigned int next_sp, unsigned int next_ip)
> -{
> -	struct mcontext32 __user *mctx = NULL;
> -	struct signal_frame_32 __user *sf;
> -	struct rt_signal_frame_32 __user *rt_sf;
> -
> -	/*
> -	 * Note: the next_sp - sp >= signal frame size check
> -	 * is true when next_sp < sp, for example, when
> -	 * transitioning from an alternate signal stack to the
> -	 * normal stack.
> -	 */
> -	if (next_sp - sp >= sizeof(struct signal_frame_32) &&
> -	    is_sigreturn_32_address(next_ip, sp) &&
> -	    sane_signal_32_frame(sp)) {
> -		sf = (struct signal_frame_32 __user *) (unsigned long) sp;
> -		mctx = &sf->mctx;
> -	}
> -
> -	if (!mctx && next_sp - sp >= sizeof(struct rt_signal_frame_32) &&
> -	    is_rt_sigreturn_32_address(next_ip, sp) &&
> -	    sane_rt_signal_32_frame(sp)) {
> -		rt_sf = (struct rt_signal_frame_32 __user *) (unsigned long) sp;
> -		mctx = &rt_sf->uc.uc_mcontext;
> -	}
> -
> -	if (!mctx)
> -		return NULL;
> -	return mctx->mc_gregs;
> -}
> -
> -static void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
> -				   struct pt_regs *regs)
> -{
> -	unsigned int sp, next_sp;
> -	unsigned int next_ip;
> -	unsigned int lr;
> -	long level = 0;
> -	unsigned int __user *fp, *uregs;
> -
> -	next_ip = perf_instruction_pointer(regs);
> -	lr = regs->link;
> -	sp = regs->gpr[1];
> -	perf_callchain_store(entry, next_ip);
> -
> -	while (entry->nr < entry->max_stack) {
> -		fp = (unsigned int __user *) (unsigned long) sp;
> -		if (!valid_user_sp(sp, 0) || read_user_stack_32(fp, &next_sp))
> -			return;
> -		if (level > 0 && read_user_stack_32(&fp[1], &next_ip))
> -			return;
> -
> -		uregs = signal_frame_32_regs(sp, next_sp, next_ip);
> -		if (!uregs && level <= 1)
> -			uregs = signal_frame_32_regs(sp, next_sp, lr);
> -		if (uregs) {
> -			/*
> -			 * This looks like an signal frame, so restart
> -			 * the stack trace with the values in it.
> -			 */
> -			if (read_user_stack_32(&uregs[PT_NIP], &next_ip) ||
> -			    read_user_stack_32(&uregs[PT_LNK], &lr) ||
> -			    read_user_stack_32(&uregs[PT_R1], &sp))
> -				return;
> -			level = 0;
> -			perf_callchain_store_context(entry, PERF_CONTEXT_USER);
> -			perf_callchain_store(entry, next_ip);
> -			continue;
> -		}
> -
> -		if (level == 0)
> -			next_ip = lr;
> -		perf_callchain_store(entry, next_ip);
> -		++level;
> -		sp = next_sp;
> -	}
> -}
> -#else /* 32bit */
> -static void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
> -				   struct pt_regs *regs)
> -{
> -	(void)&read_user_stack_32; /* unused if !COMPAT */
> -}
> -#endif /* 32bit */
> -
>   static inline int current_is_64bit(void)
>   {
>   	if (!IS_ENABLED(CONFIG_COMPAT))
> diff --git a/arch/powerpc/perf/callchain.h b/arch/powerpc/perf/callchain.h
> new file mode 100644
> index 000000000000..63ffb43f3668
> --- /dev/null
> +++ b/arch/powerpc/perf/callchain.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#ifndef _POWERPC_PERF_CALLCHAIN_H
> +#define _POWERPC_PERF_CALLCHAIN_H
> +
> +int read_user_stack_slow(void __user *ptr, void *buf, int nb);
> +void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
> +			    struct pt_regs *regs);
> +void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
> +			    struct pt_regs *regs);
> +
> +#endif /* _POWERPC_PERF_CALLCHAIN_H */
> diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callchain_32.c
> new file mode 100644
> index 000000000000..01a38d929078
> --- /dev/null
> +++ b/arch/powerpc/perf/callchain_32.c
> @@ -0,0 +1,204 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Performance counter callchain support - powerpc architecture code
> + *
> + * Copyright © 2009 Paul Mackerras, IBM Corporation.
> + */
> +#include <linux/kernel.h>
> +#include <linux/sched.h>
> +#include <linux/perf_event.h>
> +#include <linux/percpu.h>
> +#include <linux/uaccess.h>
> +#include <linux/mm.h>
> +#include <asm/ptrace.h>
> +#include <asm/pgtable.h>
> +#include <asm/sigcontext.h>
> +#include <asm/ucontext.h>
> +#include <asm/vdso.h>
> +#include <asm/pte-walk.h>
> +
> +#include "callchain.h"
> +
> +#ifdef CONFIG_PPC64
> +#include "../kernel/ppc32.h"
> +#else  /* CONFIG_PPC64 */
> +
> +#define __SIGNAL_FRAMESIZE32	__SIGNAL_FRAMESIZE
> +#define sigcontext32		sigcontext
> +#define mcontext32		mcontext
> +#define ucontext32		ucontext
> +#define compat_siginfo_t	struct siginfo
> +
> +#endif /* CONFIG_PPC64 */
> +
> +/*
> + * On 32-bit we just access the address and let hash_page create a
> + * HPTE if necessary, so there is no need to fall back to reading
> + * the page tables.  Since this is called at interrupt level,
> + * do_page_fault() won't treat a DSI as a page fault.
> + */
> +static int read_user_stack_32(unsigned int __user *ptr, unsigned int *ret)
> +{
> +	int rc;
> +
> +	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> +	    ((unsigned long)ptr & 3))
> +		return -EFAULT;
> +
> +	pagefault_disable();
> +	rc = __get_user_inatomic(*ret, ptr);
> +	pagefault_enable();
> +
> +	if (IS_ENABLED(CONFIG_PPC64) && rc)
> +		return read_user_stack_slow(ptr, ret, 4);
> +	return rc;
> +}
> +
> +static inline int valid_user_sp(unsigned long sp, int is_64)
> +{
> +	if (!sp || (sp & 7) || sp > TASK_SIZE - 32)
> +		return 0;
> +	return 1;
> +}
> +
> +/*
> + * Layout for non-RT signal frames
> + */
> +struct signal_frame_32 {
> +	char			dummy[__SIGNAL_FRAMESIZE32];
> +	struct sigcontext32	sctx;
> +	struct mcontext32	mctx;
> +	int			abigap[56];
> +};
> +
> +/*
> + * Layout for RT signal frames
> + */
> +struct rt_signal_frame_32 {
> +	char			dummy[__SIGNAL_FRAMESIZE32 + 16];
> +	compat_siginfo_t	info;
> +	struct ucontext32	uc;
> +	int			abigap[56];
> +};
> +
> +static int is_sigreturn_32_address(unsigned int nip, unsigned int fp)
> +{
> +	if (nip == fp + offsetof(struct signal_frame_32, mctx.mc_pad))
> +		return 1;
> +	if (vdso32_sigtramp && current->mm->context.vdso_base &&
> +	    nip == current->mm->context.vdso_base + vdso32_sigtramp)
> +		return 1;
> +	return 0;
> +}
> +
> +static int is_rt_sigreturn_32_address(unsigned int nip, unsigned int fp)
> +{
> +	if (nip == fp + offsetof(struct rt_signal_frame_32,
> +				 uc.uc_mcontext.mc_pad))
> +		return 1;
> +	if (vdso32_rt_sigtramp && current->mm->context.vdso_base &&
> +	    nip == current->mm->context.vdso_base + vdso32_rt_sigtramp)
> +		return 1;
> +	return 0;
> +}
> +
> +static int sane_signal_32_frame(unsigned int sp)
> +{
> +	struct signal_frame_32 __user *sf;
> +	unsigned int regs;
> +
> +	sf = (struct signal_frame_32 __user *) (unsigned long) sp;
> +	if (read_user_stack_32((unsigned int __user *) &sf->sctx.regs, &regs))
> +		return 0;
> +	return regs == (unsigned long) &sf->mctx;
> +}
> +
> +static int sane_rt_signal_32_frame(unsigned int sp)
> +{
> +	struct rt_signal_frame_32 __user *sf;
> +	unsigned int regs;
> +
> +	sf = (struct rt_signal_frame_32 __user *) (unsigned long) sp;
> +	if (read_user_stack_32((unsigned int __user *) &sf->uc.uc_regs, &regs))
> +		return 0;
> +	return regs == (unsigned long) &sf->uc.uc_mcontext;
> +}
> +
> +static unsigned int __user *signal_frame_32_regs(unsigned int sp,
> +				unsigned int next_sp, unsigned int next_ip)
> +{
> +	struct mcontext32 __user *mctx = NULL;
> +	struct signal_frame_32 __user *sf;
> +	struct rt_signal_frame_32 __user *rt_sf;
> +
> +	/*
> +	 * Note: the next_sp - sp >= signal frame size check
> +	 * is true when next_sp < sp, for example, when
> +	 * transitioning from an alternate signal stack to the
> +	 * normal stack.
> +	 */
> +	if (next_sp - sp >= sizeof(struct signal_frame_32) &&
> +	    is_sigreturn_32_address(next_ip, sp) &&
> +	    sane_signal_32_frame(sp)) {
> +		sf = (struct signal_frame_32 __user *) (unsigned long) sp;
> +		mctx = &sf->mctx;
> +	}
> +
> +	if (!mctx && next_sp - sp >= sizeof(struct rt_signal_frame_32) &&
> +	    is_rt_sigreturn_32_address(next_ip, sp) &&
> +	    sane_rt_signal_32_frame(sp)) {
> +		rt_sf = (struct rt_signal_frame_32 __user *) (unsigned long) sp;
> +		mctx = &rt_sf->uc.uc_mcontext;
> +	}
> +
> +	if (!mctx)
> +		return NULL;
> +	return mctx->mc_gregs;
> +}
> +
> +void perf_callchain_user_32(struct perf_callchain_entry_ctx *entry,
> +			    struct pt_regs *regs)
> +{
> +	unsigned int sp, next_sp;
> +	unsigned int next_ip;
> +	unsigned int lr;
> +	long level = 0;
> +	unsigned int __user *fp, *uregs;
> +
> +	next_ip = perf_instruction_pointer(regs);
> +	lr = regs->link;
> +	sp = regs->gpr[1];
> +	perf_callchain_store(entry, next_ip);
> +
> +	while (entry->nr < entry->max_stack) {
> +		fp = (unsigned int __user *) (unsigned long) sp;
> +		if (!valid_user_sp(sp, 0) || read_user_stack_32(fp, &next_sp))
> +			return;
> +		if (level > 0 && read_user_stack_32(&fp[1], &next_ip))
> +			return;
> +
> +		uregs = signal_frame_32_regs(sp, next_sp, next_ip);
> +		if (!uregs && level <= 1)
> +			uregs = signal_frame_32_regs(sp, next_sp, lr);
> +		if (uregs) {
> +			/*
> +			 * This looks like an signal frame, so restart
> +			 * the stack trace with the values in it.
> +			 */
> +			if (read_user_stack_32(&uregs[PT_NIP], &next_ip) ||
> +			    read_user_stack_32(&uregs[PT_LNK], &lr) ||
> +			    read_user_stack_32(&uregs[PT_R1], &sp))
> +				return;
> +			level = 0;
> +			perf_callchain_store_context(entry, PERF_CONTEXT_USER);
> +			perf_callchain_store(entry, next_ip);
> +			continue;
> +		}
> +
> +		if (level == 0)
> +			next_ip = lr;
> +		perf_callchain_store(entry, next_ip);
> +		++level;
> +		sp = next_sp;
> +	}
> +}
> diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callchain_64.c
> new file mode 100644
> index 000000000000..60308c2221a8
> --- /dev/null
> +++ b/arch/powerpc/perf/callchain_64.c
> @@ -0,0 +1,185 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Performance counter callchain support - powerpc architecture code
> + *
> + * Copyright © 2009 Paul Mackerras, IBM Corporation.
> + */
> +#include <linux/kernel.h>
> +#include <linux/sched.h>
> +#include <linux/perf_event.h>
> +#include <linux/percpu.h>
> +#include <linux/uaccess.h>
> +#include <linux/mm.h>
> +#include <asm/ptrace.h>
> +#include <asm/pgtable.h>
> +#include <asm/sigcontext.h>
> +#include <asm/ucontext.h>
> +#include <asm/vdso.h>
> +#include <asm/pte-walk.h>
> +
> +#include "callchain.h"
> +
> +/*
> + * On 64-bit we don't want to invoke hash_page on user addresses from
> + * interrupt context, so if the access faults, we read the page tables
> + * to find which page (if any) is mapped and access it directly.
> + */
> +int read_user_stack_slow(void __user *ptr, void *buf, int nb)
> +{
> +	int ret = -EFAULT;
> +	pgd_t *pgdir;
> +	pte_t *ptep, pte;
> +	unsigned int shift;
> +	unsigned long addr = (unsigned long) ptr;
> +	unsigned long offset;
> +	unsigned long pfn, flags;
> +	void *kaddr;
> +
> +	pgdir = current->mm->pgd;
> +	if (!pgdir)
> +		return -EFAULT;
> +
> +	local_irq_save(flags);
> +	ptep = find_current_mm_pte(pgdir, addr, NULL, &shift);
> +	if (!ptep)
> +		goto err_out;
> +	if (!shift)
> +		shift = PAGE_SHIFT;
> +
> +	/* align address to page boundary */
> +	offset = addr & ((1UL << shift) - 1);
> +
> +	pte = READ_ONCE(*ptep);
> +	if (!pte_present(pte) || !pte_user(pte))
> +		goto err_out;
> +	pfn = pte_pfn(pte);
> +	if (!page_is_ram(pfn))
> +		goto err_out;
> +
> +	/* no highmem to worry about here */
> +	kaddr = pfn_to_kaddr(pfn);
> +	memcpy(buf, kaddr + offset, nb);
> +	ret = 0;
> +err_out:
> +	local_irq_restore(flags);
> +	return ret;
> +}
> +
> +static int read_user_stack_64(unsigned long __user *ptr, unsigned long *ret)
> +{
> +	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned long) ||
> +	    ((unsigned long)ptr & 7))
> +		return -EFAULT;
> +
> +	pagefault_disable();
> +	if (!__get_user_inatomic(*ret, ptr)) {
> +		pagefault_enable();
> +		return 0;
> +	}
> +	pagefault_enable();
> +
> +	return read_user_stack_slow(ptr, ret, 8);
> +}
> +
> +static inline int valid_user_sp(unsigned long sp, int is_64)
> +{
> +	if (!sp || (sp & 7) || sp > (is_64 ? TASK_SIZE : 0x100000000UL) - 32)
> +		return 0;
> +	return 1;
> +}
> +
> +/*
> + * 64-bit user processes use the same stack frame for RT and non-RT signals.
> + */
> +struct signal_frame_64 {
> +	char		dummy[__SIGNAL_FRAMESIZE];
> +	struct ucontext	uc;
> +	unsigned long	unused[2];
> +	unsigned int	tramp[6];
> +	struct siginfo	*pinfo;
> +	void		*puc;
> +	struct siginfo	info;
> +	char		abigap[288];
> +};
> +
> +static int is_sigreturn_64_address(unsigned long nip, unsigned long fp)
> +{
> +	if (nip == fp + offsetof(struct signal_frame_64, tramp))
> +		return 1;
> +	if (vdso64_rt_sigtramp && current->mm->context.vdso_base &&
> +	    nip == current->mm->context.vdso_base + vdso64_rt_sigtramp)
> +		return 1;
> +	return 0;
> +}
> +
> +/*
> + * Do some sanity checking on the signal frame pointed to by sp.
> + * We check the pinfo and puc pointers in the frame.
> + */
> +static int sane_signal_64_frame(unsigned long sp)
> +{
> +	struct signal_frame_64 __user *sf;
> +	unsigned long pinfo, puc;
> +
> +	sf = (struct signal_frame_64 __user *) sp;
> +	if (read_user_stack_64((unsigned long __user *) &sf->pinfo, &pinfo) ||
> +	    read_user_stack_64((unsigned long __user *) &sf->puc, &puc))
> +		return 0;
> +	return pinfo == (unsigned long) &sf->info &&
> +		puc == (unsigned long) &sf->uc;
> +}
> +
> +void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
> +			    struct pt_regs *regs)
> +{
> +	unsigned long sp, next_sp;
> +	unsigned long next_ip;
> +	unsigned long lr;
> +	long level = 0;
> +	struct signal_frame_64 __user *sigframe;
> +	unsigned long __user *fp, *uregs;
> +
> +	next_ip = perf_instruction_pointer(regs);
> +	lr = regs->link;
> +	sp = regs->gpr[1];
> +	perf_callchain_store(entry, next_ip);
> +
> +	while (entry->nr < entry->max_stack) {
> +		fp = (unsigned long __user *) sp;
> +		if (!valid_user_sp(sp, 1) || read_user_stack_64(fp, &next_sp))
> +			return;
> +		if (level > 0 && read_user_stack_64(&fp[2], &next_ip))
> +			return;
> +
> +		/*
> +		 * Note: the next_sp - sp >= signal frame size check
> +		 * is true when next_sp < sp, which can happen when
> +		 * transitioning from an alternate signal stack to the
> +		 * normal stack.
> +		 */
> +		if (next_sp - sp >= sizeof(struct signal_frame_64) &&
> +		    (is_sigreturn_64_address(next_ip, sp) ||
> +		     (level <= 1 && is_sigreturn_64_address(lr, sp))) &&
> +		    sane_signal_64_frame(sp)) {
> +			/*
> +			 * This looks like an signal frame
> +			 */
> +			sigframe = (struct signal_frame_64 __user *) sp;
> +			uregs = sigframe->uc.uc_mcontext.gp_regs;
> +			if (read_user_stack_64(&uregs[PT_NIP], &next_ip) ||
> +			    read_user_stack_64(&uregs[PT_LNK], &lr) ||
> +			    read_user_stack_64(&uregs[PT_R1], &sp))
> +				return;
> +			level = 0;
> +			perf_callchain_store_context(entry, PERF_CONTEXT_USER);
> +			perf_callchain_store(entry, next_ip);
> +			continue;
> +		}
> +
> +		if (level == 0)
> +			next_ip = lr;
> +		perf_callchain_store(entry, next_ip);
> +		++level;
> +		sp = next_sp;
> +	}
> +}
> 
