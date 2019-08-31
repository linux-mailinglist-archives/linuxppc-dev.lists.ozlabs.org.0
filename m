Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D2DA45D3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 20:54:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46LQVv6tJMzDqdL
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Sep 2019 04:54:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46LQRm3sfszDqxX
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Sep 2019 04:51:31 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8AEC9B0B6;
 Sat, 31 Aug 2019 18:51:25 +0000 (UTC)
Date: Sat, 31 Aug 2019 20:51:22 +0200
From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 6/6] powerpc/perf: split callchain.c by bitness
Message-ID: <20190831205122.1b6c6bff@naga>
In-Reply-To: <6e90d79f122529751aa9726ba26af603b6bfbfcd.1567198492.git.msuchanek@suse.de>
References: <cover.1567198491.git.msuchanek@suse.de>
 <6e90d79f122529751aa9726ba26af603b6bfbfcd.1567198492.git.msuchanek@suse.de>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Diana Craciun <diana.craciun@nxp.com>, Firoz Khan <firoz.khan@linaro.org>,
 Hari Bathini <hbathini@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 30 Aug 2019 23:03:43 +0200
Michal Suchanek <msuchanek@suse.de> wrote:

> Building callchain.c with !COMPAT proved quite ugly with all the
> defines. Splitting out the 32bit and 64bit parts looks better.
>=20
> No code change intended.

valid_user_sp is broken in compat. It needs to be ifdefed for the 32bit
case.
>=20
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
> v6:
>  - move current_is_64bit consolidetaion to earlier patch
>  - move defines to the top of callchain_32.c
>  - Makefile cleanup
> ---
>  arch/powerpc/perf/Makefile       |   5 +-
>  arch/powerpc/perf/callchain.c    | 365 +------------------------------
>  arch/powerpc/perf/callchain.h    |  11 +
>  arch/powerpc/perf/callchain_32.c | 204 +++++++++++++++++
>  arch/powerpc/perf/callchain_64.c | 185 ++++++++++++++++
>  5 files changed, 405 insertions(+), 365 deletions(-)
>  create mode 100644 arch/powerpc/perf/callchain.h
>  create mode 100644 arch/powerpc/perf/callchain_32.c
>  create mode 100644 arch/powerpc/perf/callchain_64.c
>=20
> diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
> index c155dcbb8691..53d614e98537 100644
> --- a/arch/powerpc/perf/Makefile
> +++ b/arch/powerpc/perf/Makefile
> @@ -1,6 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
> -obj-$(CONFIG_PERF_EVENTS)	+=3D callchain.o perf_regs.o
> +obj-$(CONFIG_PERF_EVENTS)	+=3D callchain.o callchain_$(BITS).o perf_regs=
.o
> +ifdef CONFIG_COMPAT
> +obj-$(CONFIG_PERF_EVENTS)	+=3D callchain_32.o
> +endif
> =20
>  obj-$(CONFIG_PPC_PERF_CTRS)	+=3D core-book3s.o bhrb.o
>  obj64-$(CONFIG_PPC_PERF_CTRS)	+=3D ppc970-pmu.o power5-pmu.o \
> diff --git a/arch/powerpc/perf/callchain.c b/arch/powerpc/perf/callchain.c
> index 9b8dc822f531..8f30f1b47c78 100644
> --- a/arch/powerpc/perf/callchain.c
> +++ b/arch/powerpc/perf/callchain.c
> @@ -15,11 +15,9 @@
>  #include <asm/sigcontext.h>
>  #include <asm/ucontext.h>
>  #include <asm/vdso.h>
> -#ifdef CONFIG_COMPAT
> -#include "../kernel/ppc32.h"
> -#endif
>  #include <asm/pte-walk.h>
> =20
> +#include "callchain.h"
> =20
>  /*
>   * Is sp valid as the address of the next kernel stack frame after prev_=
sp?
> @@ -102,367 +100,6 @@ perf_callchain_kernel(struct perf_callchain_entry_c=
tx *entry, struct pt_regs *re
>  	}
>  }
> =20
> -#ifdef CONFIG_PPC64
> -/*
> - * On 64-bit we don't want to invoke hash_page on user addresses from
> - * interrupt context, so if the access faults, we read the page tables
> - * to find which page (if any) is mapped and access it directly.
> - */
> -static int read_user_stack_slow(void __user *ptr, void *buf, int nb)
> -{
> -	int ret =3D -EFAULT;
> -	pgd_t *pgdir;
> -	pte_t *ptep, pte;
> -	unsigned shift;
> -	unsigned long addr =3D (unsigned long) ptr;
> -	unsigned long offset;
> -	unsigned long pfn, flags;
> -	void *kaddr;
> -
> -	pgdir =3D current->mm->pgd;
> -	if (!pgdir)
> -		return -EFAULT;
> -
> -	local_irq_save(flags);
> -	ptep =3D find_current_mm_pte(pgdir, addr, NULL, &shift);
> -	if (!ptep)
> -		goto err_out;
> -	if (!shift)
> -		shift =3D PAGE_SHIFT;
> -
> -	/* align address to page boundary */
> -	offset =3D addr & ((1UL << shift) - 1);
> -
> -	pte =3D READ_ONCE(*ptep);
> -	if (!pte_present(pte) || !pte_user(pte))
> -		goto err_out;
> -	pfn =3D pte_pfn(pte);
> -	if (!page_is_ram(pfn))
> -		goto err_out;
> -
> -	/* no highmem to worry about here */
> -	kaddr =3D pfn_to_kaddr(pfn);
> -	memcpy(buf, kaddr + offset, nb);
> -	ret =3D 0;
> -err_out:
> -	local_irq_restore(flags);
> -	return ret;
> -}
> -
> -static int read_user_stack_64(unsigned long __user *ptr, unsigned long *=
ret)
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
> - * 64-bit user processes use the same stack frame for RT and non-RT sign=
als.
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
> -	if (nip =3D=3D fp + offsetof(struct signal_frame_64, tramp))
> -		return 1;
> -	if (vdso64_rt_sigtramp && current->mm->context.vdso_base &&
> -	    nip =3D=3D current->mm->context.vdso_base + vdso64_rt_sigtramp)
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
> -	sf =3D (struct signal_frame_64 __user *) sp;
> -	if (read_user_stack_64((unsigned long __user *) &sf->pinfo, &pinfo) ||
> -	    read_user_stack_64((unsigned long __user *) &sf->puc, &puc))
> -		return 0;
> -	return pinfo =3D=3D (unsigned long) &sf->info &&
> -		puc =3D=3D (unsigned long) &sf->uc;
> -}
> -
> -static void perf_callchain_user_64(struct perf_callchain_entry_ctx *entr=
y,
> -				   struct pt_regs *regs)
> -{
> -	unsigned long sp, next_sp;
> -	unsigned long next_ip;
> -	unsigned long lr;
> -	long level =3D 0;
> -	struct signal_frame_64 __user *sigframe;
> -	unsigned long __user *fp, *uregs;
> -
> -	next_ip =3D perf_instruction_pointer(regs);
> -	lr =3D regs->link;
> -	sp =3D regs->gpr[1];
> -	perf_callchain_store(entry, next_ip);
> -
> -	while (entry->nr < entry->max_stack) {
> -		fp =3D (unsigned long __user *) sp;
> -		if (!valid_user_sp(sp, 1) || read_user_stack_64(fp, &next_sp))
> -			return;
> -		if (level > 0 && read_user_stack_64(&fp[2], &next_ip))
> -			return;
> -
> -		/*
> -		 * Note: the next_sp - sp >=3D signal frame size check
> -		 * is true when next_sp < sp, which can happen when
> -		 * transitioning from an alternate signal stack to the
> -		 * normal stack.
> -		 */
> -		if (next_sp - sp >=3D sizeof(struct signal_frame_64) &&
> -		    (is_sigreturn_64_address(next_ip, sp) ||
> -		     (level <=3D 1 && is_sigreturn_64_address(lr, sp))) &&
> -		    sane_signal_64_frame(sp)) {
> -			/*
> -			 * This looks like an signal frame
> -			 */
> -			sigframe =3D (struct signal_frame_64 __user *) sp;
> -			uregs =3D sigframe->uc.uc_mcontext.gp_regs;
> -			if (read_user_stack_64(&uregs[PT_NIP], &next_ip) ||
> -			    read_user_stack_64(&uregs[PT_LNK], &lr) ||
> -			    read_user_stack_64(&uregs[PT_R1], &sp))
> -				return;
> -			level =3D 0;
> -			perf_callchain_store_context(entry, PERF_CONTEXT_USER);
> -			perf_callchain_store(entry, next_ip);
> -			continue;
> -		}
> -
> -		if (level =3D=3D 0)
> -			next_ip =3D lr;
> -		perf_callchain_store(entry, next_ip);
> -		++level;
> -		sp =3D next_sp;
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
> -static int read_user_stack_32(unsigned int __user *ptr, unsigned int *re=
t)
> -{
> -	int rc;
> -
> -	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> -	    ((unsigned long)ptr & 3))
> -		return -EFAULT;
> -
> -	pagefault_disable();
> -	rc =3D __get_user_inatomic(*ret, ptr);
> -	pagefault_enable();
> -
> -	if (IS_ENABLED(CONFIG_PPC64) && rc)
> -		return read_user_stack_slow(ptr, ret, 4);
> -	return rc;
> -}
> -
> -#ifndef CONFIG_PPC64
> -static inline void perf_callchain_user_64(struct perf_callchain_entry_ct=
x *entry,
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
> -	if (nip =3D=3D fp + offsetof(struct signal_frame_32, mctx.mc_pad))
> -		return 1;
> -	if (vdso32_sigtramp && current->mm->context.vdso_base &&
> -	    nip =3D=3D current->mm->context.vdso_base + vdso32_sigtramp)
> -		return 1;
> -	return 0;
> -}
> -
> -static int is_rt_sigreturn_32_address(unsigned int nip, unsigned int fp)
> -{
> -	if (nip =3D=3D fp + offsetof(struct rt_signal_frame_32,
> -				 uc.uc_mcontext.mc_pad))
> -		return 1;
> -	if (vdso32_rt_sigtramp && current->mm->context.vdso_base &&
> -	    nip =3D=3D current->mm->context.vdso_base + vdso32_rt_sigtramp)
> -		return 1;
> -	return 0;
> -}
> -
> -static int sane_signal_32_frame(unsigned int sp)
> -{
> -	struct signal_frame_32 __user *sf;
> -	unsigned int regs;
> -
> -	sf =3D (struct signal_frame_32 __user *) (unsigned long) sp;
> -	if (read_user_stack_32((unsigned int __user *) &sf->sctx.regs, &regs))
> -		return 0;
> -	return regs =3D=3D (unsigned long) &sf->mctx;
> -}
> -
> -static int sane_rt_signal_32_frame(unsigned int sp)
> -{
> -	struct rt_signal_frame_32 __user *sf;
> -	unsigned int regs;
> -
> -	sf =3D (struct rt_signal_frame_32 __user *) (unsigned long) sp;
> -	if (read_user_stack_32((unsigned int __user *) &sf->uc.uc_regs, &regs))
> -		return 0;
> -	return regs =3D=3D (unsigned long) &sf->uc.uc_mcontext;
> -}
> -
> -static unsigned int __user *signal_frame_32_regs(unsigned int sp,
> -				unsigned int next_sp, unsigned int next_ip)
> -{
> -	struct mcontext32 __user *mctx =3D NULL;
> -	struct signal_frame_32 __user *sf;
> -	struct rt_signal_frame_32 __user *rt_sf;
> -
> -	/*
> -	 * Note: the next_sp - sp >=3D signal frame size check
> -	 * is true when next_sp < sp, for example, when
> -	 * transitioning from an alternate signal stack to the
> -	 * normal stack.
> -	 */
> -	if (next_sp - sp >=3D sizeof(struct signal_frame_32) &&
> -	    is_sigreturn_32_address(next_ip, sp) &&
> -	    sane_signal_32_frame(sp)) {
> -		sf =3D (struct signal_frame_32 __user *) (unsigned long) sp;
> -		mctx =3D &sf->mctx;
> -	}
> -
> -	if (!mctx && next_sp - sp >=3D sizeof(struct rt_signal_frame_32) &&
> -	    is_rt_sigreturn_32_address(next_ip, sp) &&
> -	    sane_rt_signal_32_frame(sp)) {
> -		rt_sf =3D (struct rt_signal_frame_32 __user *) (unsigned long) sp;
> -		mctx =3D &rt_sf->uc.uc_mcontext;
> -	}
> -
> -	if (!mctx)
> -		return NULL;
> -	return mctx->mc_gregs;
> -}
> -
> -static void perf_callchain_user_32(struct perf_callchain_entry_ctx *entr=
y,
> -				   struct pt_regs *regs)
> -{
> -	unsigned int sp, next_sp;
> -	unsigned int next_ip;
> -	unsigned int lr;
> -	long level =3D 0;
> -	unsigned int __user *fp, *uregs;
> -
> -	next_ip =3D perf_instruction_pointer(regs);
> -	lr =3D regs->link;
> -	sp =3D regs->gpr[1];
> -	perf_callchain_store(entry, next_ip);
> -
> -	while (entry->nr < entry->max_stack) {
> -		fp =3D (unsigned int __user *) (unsigned long) sp;
> -		if (!valid_user_sp(sp, 0) || read_user_stack_32(fp, &next_sp))
> -			return;
> -		if (level > 0 && read_user_stack_32(&fp[1], &next_ip))
> -			return;
> -
> -		uregs =3D signal_frame_32_regs(sp, next_sp, next_ip);
> -		if (!uregs && level <=3D 1)
> -			uregs =3D signal_frame_32_regs(sp, next_sp, lr);
> -		if (uregs) {
> -			/*
> -			 * This looks like an signal frame, so restart
> -			 * the stack trace with the values in it.
> -			 */
> -			if (read_user_stack_32(&uregs[PT_NIP], &next_ip) ||
> -			    read_user_stack_32(&uregs[PT_LNK], &lr) ||
> -			    read_user_stack_32(&uregs[PT_R1], &sp))
> -				return;
> -			level =3D 0;
> -			perf_callchain_store_context(entry, PERF_CONTEXT_USER);
> -			perf_callchain_store(entry, next_ip);
> -			continue;
> -		}
> -
> -		if (level =3D=3D 0)
> -			next_ip =3D lr;
> -		perf_callchain_store(entry, next_ip);
> -		++level;
> -		sp =3D next_sp;
> -	}
> -}
> -#endif /* 32bit */
> -
>  static inline int current_is_64bit(void)
>  {
>  	if (!IS_ENABLED(CONFIG_COMPAT))
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
> diff --git a/arch/powerpc/perf/callchain_32.c b/arch/powerpc/perf/callcha=
in_32.c
> new file mode 100644
> index 000000000000..01a38d929078
> --- /dev/null
> +++ b/arch/powerpc/perf/callchain_32.c
> @@ -0,0 +1,204 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Performance counter callchain support - powerpc architecture code
> + *
> + * Copyright =C2=A9 2009 Paul Mackerras, IBM Corporation.
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
> +static int read_user_stack_32(unsigned int __user *ptr, unsigned int *re=
t)
> +{
> +	int rc;
> +
> +	if ((unsigned long)ptr > TASK_SIZE - sizeof(unsigned int) ||
> +	    ((unsigned long)ptr & 3))
> +		return -EFAULT;
> +
> +	pagefault_disable();
> +	rc =3D __get_user_inatomic(*ret, ptr);
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
> +	if (nip =3D=3D fp + offsetof(struct signal_frame_32, mctx.mc_pad))
> +		return 1;
> +	if (vdso32_sigtramp && current->mm->context.vdso_base &&
> +	    nip =3D=3D current->mm->context.vdso_base + vdso32_sigtramp)
> +		return 1;
> +	return 0;
> +}
> +
> +static int is_rt_sigreturn_32_address(unsigned int nip, unsigned int fp)
> +{
> +	if (nip =3D=3D fp + offsetof(struct rt_signal_frame_32,
> +				 uc.uc_mcontext.mc_pad))
> +		return 1;
> +	if (vdso32_rt_sigtramp && current->mm->context.vdso_base &&
> +	    nip =3D=3D current->mm->context.vdso_base + vdso32_rt_sigtramp)
> +		return 1;
> +	return 0;
> +}
> +
> +static int sane_signal_32_frame(unsigned int sp)
> +{
> +	struct signal_frame_32 __user *sf;
> +	unsigned int regs;
> +
> +	sf =3D (struct signal_frame_32 __user *) (unsigned long) sp;
> +	if (read_user_stack_32((unsigned int __user *) &sf->sctx.regs, &regs))
> +		return 0;
> +	return regs =3D=3D (unsigned long) &sf->mctx;
> +}
> +
> +static int sane_rt_signal_32_frame(unsigned int sp)
> +{
> +	struct rt_signal_frame_32 __user *sf;
> +	unsigned int regs;
> +
> +	sf =3D (struct rt_signal_frame_32 __user *) (unsigned long) sp;
> +	if (read_user_stack_32((unsigned int __user *) &sf->uc.uc_regs, &regs))
> +		return 0;
> +	return regs =3D=3D (unsigned long) &sf->uc.uc_mcontext;
> +}
> +
> +static unsigned int __user *signal_frame_32_regs(unsigned int sp,
> +				unsigned int next_sp, unsigned int next_ip)
> +{
> +	struct mcontext32 __user *mctx =3D NULL;
> +	struct signal_frame_32 __user *sf;
> +	struct rt_signal_frame_32 __user *rt_sf;
> +
> +	/*
> +	 * Note: the next_sp - sp >=3D signal frame size check
> +	 * is true when next_sp < sp, for example, when
> +	 * transitioning from an alternate signal stack to the
> +	 * normal stack.
> +	 */
> +	if (next_sp - sp >=3D sizeof(struct signal_frame_32) &&
> +	    is_sigreturn_32_address(next_ip, sp) &&
> +	    sane_signal_32_frame(sp)) {
> +		sf =3D (struct signal_frame_32 __user *) (unsigned long) sp;
> +		mctx =3D &sf->mctx;
> +	}
> +
> +	if (!mctx && next_sp - sp >=3D sizeof(struct rt_signal_frame_32) &&
> +	    is_rt_sigreturn_32_address(next_ip, sp) &&
> +	    sane_rt_signal_32_frame(sp)) {
> +		rt_sf =3D (struct rt_signal_frame_32 __user *) (unsigned long) sp;
> +		mctx =3D &rt_sf->uc.uc_mcontext;
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
> +	long level =3D 0;
> +	unsigned int __user *fp, *uregs;
> +
> +	next_ip =3D perf_instruction_pointer(regs);
> +	lr =3D regs->link;
> +	sp =3D regs->gpr[1];
> +	perf_callchain_store(entry, next_ip);
> +
> +	while (entry->nr < entry->max_stack) {
> +		fp =3D (unsigned int __user *) (unsigned long) sp;
> +		if (!valid_user_sp(sp, 0) || read_user_stack_32(fp, &next_sp))
> +			return;
> +		if (level > 0 && read_user_stack_32(&fp[1], &next_ip))
> +			return;
> +
> +		uregs =3D signal_frame_32_regs(sp, next_sp, next_ip);
> +		if (!uregs && level <=3D 1)
> +			uregs =3D signal_frame_32_regs(sp, next_sp, lr);
> +		if (uregs) {
> +			/*
> +			 * This looks like an signal frame, so restart
> +			 * the stack trace with the values in it.
> +			 */
> +			if (read_user_stack_32(&uregs[PT_NIP], &next_ip) ||
> +			    read_user_stack_32(&uregs[PT_LNK], &lr) ||
> +			    read_user_stack_32(&uregs[PT_R1], &sp))
> +				return;
> +			level =3D 0;
> +			perf_callchain_store_context(entry, PERF_CONTEXT_USER);
> +			perf_callchain_store(entry, next_ip);
> +			continue;
> +		}
> +
> +		if (level =3D=3D 0)
> +			next_ip =3D lr;
> +		perf_callchain_store(entry, next_ip);
> +		++level;
> +		sp =3D next_sp;
> +	}
> +}
> diff --git a/arch/powerpc/perf/callchain_64.c b/arch/powerpc/perf/callcha=
in_64.c
> new file mode 100644
> index 000000000000..60308c2221a8
> --- /dev/null
> +++ b/arch/powerpc/perf/callchain_64.c
> @@ -0,0 +1,185 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Performance counter callchain support - powerpc architecture code
> + *
> + * Copyright =C2=A9 2009 Paul Mackerras, IBM Corporation.
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
> +	int ret =3D -EFAULT;
> +	pgd_t *pgdir;
> +	pte_t *ptep, pte;
> +	unsigned int shift;
> +	unsigned long addr =3D (unsigned long) ptr;
> +	unsigned long offset;
> +	unsigned long pfn, flags;
> +	void *kaddr;
> +
> +	pgdir =3D current->mm->pgd;
> +	if (!pgdir)
> +		return -EFAULT;
> +
> +	local_irq_save(flags);
> +	ptep =3D find_current_mm_pte(pgdir, addr, NULL, &shift);
> +	if (!ptep)
> +		goto err_out;
> +	if (!shift)
> +		shift =3D PAGE_SHIFT;
> +
> +	/* align address to page boundary */
> +	offset =3D addr & ((1UL << shift) - 1);
> +
> +	pte =3D READ_ONCE(*ptep);
> +	if (!pte_present(pte) || !pte_user(pte))
> +		goto err_out;
> +	pfn =3D pte_pfn(pte);
> +	if (!page_is_ram(pfn))
> +		goto err_out;
> +
> +	/* no highmem to worry about here */
> +	kaddr =3D pfn_to_kaddr(pfn);
> +	memcpy(buf, kaddr + offset, nb);
> +	ret =3D 0;
> +err_out:
> +	local_irq_restore(flags);
> +	return ret;
> +}
> +
> +static int read_user_stack_64(unsigned long __user *ptr, unsigned long *=
ret)
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
> + * 64-bit user processes use the same stack frame for RT and non-RT sign=
als.
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
> +	if (nip =3D=3D fp + offsetof(struct signal_frame_64, tramp))
> +		return 1;
> +	if (vdso64_rt_sigtramp && current->mm->context.vdso_base &&
> +	    nip =3D=3D current->mm->context.vdso_base + vdso64_rt_sigtramp)
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
> +	sf =3D (struct signal_frame_64 __user *) sp;
> +	if (read_user_stack_64((unsigned long __user *) &sf->pinfo, &pinfo) ||
> +	    read_user_stack_64((unsigned long __user *) &sf->puc, &puc))
> +		return 0;
> +	return pinfo =3D=3D (unsigned long) &sf->info &&
> +		puc =3D=3D (unsigned long) &sf->uc;
> +}
> +
> +void perf_callchain_user_64(struct perf_callchain_entry_ctx *entry,
> +			    struct pt_regs *regs)
> +{
> +	unsigned long sp, next_sp;
> +	unsigned long next_ip;
> +	unsigned long lr;
> +	long level =3D 0;
> +	struct signal_frame_64 __user *sigframe;
> +	unsigned long __user *fp, *uregs;
> +
> +	next_ip =3D perf_instruction_pointer(regs);
> +	lr =3D regs->link;
> +	sp =3D regs->gpr[1];
> +	perf_callchain_store(entry, next_ip);
> +
> +	while (entry->nr < entry->max_stack) {
> +		fp =3D (unsigned long __user *) sp;
> +		if (!valid_user_sp(sp, 1) || read_user_stack_64(fp, &next_sp))
> +			return;
> +		if (level > 0 && read_user_stack_64(&fp[2], &next_ip))
> +			return;
> +
> +		/*
> +		 * Note: the next_sp - sp >=3D signal frame size check
> +		 * is true when next_sp < sp, which can happen when
> +		 * transitioning from an alternate signal stack to the
> +		 * normal stack.
> +		 */
> +		if (next_sp - sp >=3D sizeof(struct signal_frame_64) &&
> +		    (is_sigreturn_64_address(next_ip, sp) ||
> +		     (level <=3D 1 && is_sigreturn_64_address(lr, sp))) &&
> +		    sane_signal_64_frame(sp)) {
> +			/*
> +			 * This looks like an signal frame
> +			 */
> +			sigframe =3D (struct signal_frame_64 __user *) sp;
> +			uregs =3D sigframe->uc.uc_mcontext.gp_regs;
> +			if (read_user_stack_64(&uregs[PT_NIP], &next_ip) ||
> +			    read_user_stack_64(&uregs[PT_LNK], &lr) ||
> +			    read_user_stack_64(&uregs[PT_R1], &sp))
> +				return;
> +			level =3D 0;
> +			perf_callchain_store_context(entry, PERF_CONTEXT_USER);
> +			perf_callchain_store(entry, next_ip);
> +			continue;
> +		}
> +
> +		if (level =3D=3D 0)
> +			next_ip =3D lr;
> +		perf_callchain_store(entry, next_ip);
> +		++level;
> +		sp =3D next_sp;
> +	}
> +}

