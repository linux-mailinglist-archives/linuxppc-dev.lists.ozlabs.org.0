Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 231E3529AD5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 09:32:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2SWZ0LHxz3bqR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 17:32:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=vPm88cAY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2SVs3fffz2yph
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 17:32:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=vPm88cAY; dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
 id 4L2SVp6K6Jz4xY4; Tue, 17 May 2022 17:32:02 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
 id 4L2SVp6CBgz4xZ2; Tue, 17 May 2022 17:32:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1652772722;
 bh=x1ufa4zfJTrgdbMuEGqr/iMcV6dY7bFomdOCmOx+a/k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vPm88cAYpERh5OG5L6sUStojX/DxBbFHU4BB6FS+xpeMPuBAnRLArDl4ZJh+n0bcx
 +81+2Fq1FQ2y0P7FapTe8mzMbmZnz9SjI3Dc95kDejT1WQYKFeRleBPT509Bedbby6
 wKKxKUDaUq7wjJ3msUcXJHlOlNpWPbmV9g7GHNYJrGOlbN7kb4MaMpwyoIzBINwo1D
 w9Cz5/6qxqGUZwmRnksmYko2nm7mbXi60jnAFimXKZguGhNLazuOrlNVnDBcEShMrI
 XemKxqKotqERzu0OfkurNLzXe0bLyRHR4HGpJDON5yTib2p85eTbSCzUJeVmFL0A+K
 Iep/3udZC6vuQ==
Date: Tue, 17 May 2022 17:31:56 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 3/3] [RFC] powerpc: Book3S 64-bit outline-only KASAN
 support
Message-ID: <YoNPbBwhemr0DS7h@cleo>
References: <Yntk7oERGce44+Sd@cleo> <YntlprNj9jNOsi/I@cleo>
 <3e076468-b5c1-4f23-1911-4d86b02ba1e9@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3e076468-b5c1-4f23-1911-4d86b02ba1e9@csgroup.eu>
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
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, May 15, 2022 at 07:33:52AM +0000, Christophe Leroy wrote:
> 
> 
> Le 11/05/2022 à 09:28, Paul Mackerras a écrit :
> > From: Daniel Axtens <dja@axtens.net>
> > 
> > Implement a limited form of KASAN for Book3S 64-bit machines running under
> > the Radix MMU, supporting only outline mode.

[snip]

> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index b779603978e1..0bf76e40c9c2 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -105,6 +105,7 @@ config PPC
> >   	# Please keep this list sorted alphabetically.
> >   	#
> >   	select ARCH_32BIT_OFF_T if PPC32
> > +	select ARCH_DISABLE_KASAN_INLINE	if PPC_RADIX_MMU
> >   	select ARCH_ENABLE_MEMORY_HOTPLUG
> >   	select ARCH_ENABLE_MEMORY_HOTREMOVE
> >   	select ARCH_HAS_COPY_MC			if PPC64
> > @@ -152,6 +153,7 @@ config PPC
> >   	select ARCH_WANT_IPC_PARSE_VERSION
> >   	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
> >   	select ARCH_WANT_LD_ORPHAN_WARN
> > +	select ARCH_WANTS_NO_INSTR
> 
> Can you explain why we need that ?

The help text for the option says:

     An architecture should select this if the noinstr macro is being used on
     functions to denote that the toolchain should avoid instrumenting such
     functions and is required for correctness.

All it really seems to do is restrict the conditions under which the
GCOV and KCOV options can be enabled.

> Is it tied to KASAN ? Is yes, why didn't we have it for PPC32 until now ?

Since we really do need to avoid instrumenting certain functions on
ppc64 (as in things will break if we do instrument them), I think we
need to select ARCH_WANTS_NO_INSTR.

For ppc32, as far as I recall there is much less code that runs in
real mode and it is mostly assembler (except for some boot code),
mostly because all addresses have to be explicitly translated to
physical addresses for 32-bit real-mode code, unlike ppc64 where we
can use access memory in the linear mapping using virtual addresses
because of the fact that the CPU ignores the top 4 bits of the
effective address in real mode.  That said, there is a lot less code
that runs in real mode on ppc64 than there used to be.

> Maybe that's independant of KASAN and would be worth a separate patch ?

Yes, possibly, though KASAN does appear to be the only user of noinstr
in arch/powerpc.

[snip]

> > diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
> > index d090d9612348..bafc9869afcd 100644
> > --- a/arch/powerpc/include/asm/book3s/64/radix.h
> > +++ b/arch/powerpc/include/asm/book3s/64/radix.h
> > @@ -35,6 +35,11 @@
> >   #define RADIX_PMD_SHIFT		(PAGE_SHIFT + RADIX_PTE_INDEX_SIZE)
> >   #define RADIX_PUD_SHIFT		(RADIX_PMD_SHIFT + RADIX_PMD_INDEX_SIZE)
> >   #define RADIX_PGD_SHIFT		(RADIX_PUD_SHIFT + RADIX_PUD_INDEX_SIZE)
> > +
> > +#define R_PTRS_PER_PTE		(1 << RADIX_PTE_INDEX_SIZE)
> > +#define R_PTRS_PER_PMD		(1 << RADIX_PMD_INDEX_SIZE)
> > +#define R_PTRS_PER_PUD		(1 << RADIX_PUD_INDEX_SIZE)
> > +
> >   /*
> >    * Size of EA range mapped by our pagetables.
> >    */
> > @@ -68,11 +73,11 @@
> >    *
> >    *
> >    * 3rd quadrant expanded:
> > - * +------------------------------+
> > + * +------------------------------+  Highest address (0xc010000000000000)
> > + * +------------------------------+  KASAN shadow end (0xc00fc00000000000)
> >    * |                              |
> >    * |                              |
> > - * |                              |
> > - * +------------------------------+  Kernel vmemmap end (0xc010000000000000)
> > + * +------------------------------+  Kernel vmemmap end/shadow start (0xc00e000000000000)
> >    * |                              |
> >    * |           512TB		  |
> >    * |                              |
> > @@ -126,6 +131,8 @@
> >   #define RADIX_VMEMMAP_SIZE	RADIX_KERN_MAP_SIZE
> >   #define RADIX_VMEMMAP_END	(RADIX_VMEMMAP_START + RADIX_VMEMMAP_SIZE)
> >   
> > +/* For the sizes of the shadow area, see kasan.h */
> > +
> 
> Why does this comment pops up here ?

Do you mean, why is it there at all, or do you mean why is it in that
particular place rather than closer to the "3rd quadrant expanded"
diagram or something?

> >   #ifndef __ASSEMBLY__
> >   #define RADIX_PTE_TABLE_SIZE	(sizeof(pte_t) << RADIX_PTE_INDEX_SIZE)
> >   #define RADIX_PMD_TABLE_SIZE	(sizeof(pmd_t) << RADIX_PMD_INDEX_SIZE)
> > diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> > index fc28f46d2f9d..fb244b6ca7f0 100644
> > --- a/arch/powerpc/include/asm/interrupt.h
> > +++ b/arch/powerpc/include/asm/interrupt.h
> > @@ -327,22 +327,46 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
> >   	}
> >   #endif
> >   
> > +	/* If data relocations are enabled, it's safe to use nmi_enter() */
> > +	if (mfmsr() & MSR_DR) {
> > +		nmi_enter();
> > +		return;
> > +	}
> > +
> >   	/*
> > -	 * Do not use nmi_enter() for pseries hash guest taking a real-mode
> > +	 * But do not use nmi_enter() for pseries hash guest taking a real-mode
> >   	 * NMI because not everything it touches is within the RMA limit.
> >   	 */
> > +	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
> > +	    firmware_has_feature(FW_FEATURE_LPAR) &&
> > +	    !radix_enabled())
> > +		return;
> > +
> > +	/*
> > +	 * Likewise, don't use it if we have some form of instrumentation (like
> > +	 * KASAN shadow) that is not safe to access in real mode (even on radix)
> > +	 */
> > +	if (IS_ENABLED(CONFIG_KASAN))
> > +		return;
> > +
> > +	/* Otherwise, it should be safe to call it */
> > +	nmi_enter();
> >   }
> >   
> >   static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
> >   {
> > -	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
> > -			!firmware_has_feature(FW_FEATURE_LPAR) ||
> > -			radix_enabled() || (mfmsr() & MSR_DR))
> > +	if (mfmsr() & MSR_DR) {
> > +		// nmi_exit if relocations are on
> >   		nmi_exit();
> > +	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
> > +		   firmware_has_feature(FW_FEATURE_LPAR) &&
> > +		   !radix_enabled()) {
> > +		// no nmi_exit for a pseries hash guest taking a real mode exception
> > +	} else if (IS_ENABLED(CONFIG_KASAN)) {
> > +		// no nmi_exit for KASAN in real mode
> > +	} else {
> > +		nmi_exit();
> > +	}
> >   
> 
> I think all this changeset around MSR_DR versus NMI would be worth a 
> separate patch with a dedicated explanation.

It's actually not as much of a change as it might appear.  All that is
really being done is to add !IS_ENABLED(CONFIG_KASAN) to the
conditions for calling nmi_enter() and nmi_exit() when the CPU is in
real mode.  In other words, the condition is equivalent to:

	if (((!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
			!firmware_has_feature(FW_FEATURE_LPAR) ||
			radix_enabled()) && !IS_ENABLED(CONFIG_KASAN)) ||
			(mfmsr() & MSR_DR))
		nmi_enter();

I think the version as Daniel has transformed it is more readable
though.  It could be a separate patch, sure.

> >   	/*
> >   	 * nmi does not call nap_adjust_return because nmi should not create
> > @@ -410,7 +434,8 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
> >    * Specific handlers may have additional restrictions.
> >    */
> >   #define DEFINE_INTERRUPT_HANDLER_RAW(func)				\
> > -static __always_inline long ____##func(struct pt_regs *regs);		\
> > +static __always_inline __no_sanitize_address __no_kcsan long		\
> 
> Why is this required for PPC64 while it wasn't for PPC32 ?

I assume because we switch into virtual mode sooner on ppc32, because
of the need to transform addresses explicitly in real mode.  I haven't
looked at the ppc32 interrupt code for a long time (and even the ppc64
interrupt code is now quite different from what I recall).

> Any side effect on PPC32 ?

I suppose you won't get KASAN coverage of those interrupt handling
functions, where you did previously.  Do you want me to make the
"__no_sanitize_address __no_kcsan" apply only on ppc64?

[snip]

> > diff --git a/arch/powerpc/include/asm/kasan.h b/arch/powerpc/include/asm/kasan.h
> > index 3c478e5ef24c..6efc822e70fd 100644
> > --- a/arch/powerpc/include/asm/kasan.h
> > +++ b/arch/powerpc/include/asm/kasan.h
> > @@ -30,9 +30,31 @@
> >   
> >   #define KASAN_SHADOW_OFFSET	ASM_CONST(CONFIG_KASAN_SHADOW_OFFSET)
> >   
> > +#ifdef CONFIG_PPC32
> >   #define KASAN_SHADOW_END	(-(-KASAN_SHADOW_START >> KASAN_SHADOW_SCALE_SHIFT))
> > +#endif
> >   
> >   #ifdef CONFIG_KASAN
> > +#ifdef CONFIG_PPC_BOOK3S_64
> > +/*
> > + * The shadow ends before the highest accessible address
> > + * because we don't need a shadow for the shadow. Instead:
> > + * c00e000000000000 << 3 + a80e000000000000 = c00fc00000000000
> > + */
> > +#define KASAN_SHADOW_END 0xc00fc00000000000UL
> 
> Would be easer to read if we could group that with PPC32 in a 
> #ifdef/#else/#endif

Sure.  It's a bit weird that KASAN_SHADOW_END is always defined for
ppc32, but only if CONFIG_KASAN=y for ppc64.  I'll fix it.

[snip]

> > diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> > index 4d7829399570..e46335da7f72 100644
> > --- a/arch/powerpc/kernel/Makefile
> > +++ b/arch/powerpc/kernel/Makefile
> > @@ -33,6 +33,17 @@ KASAN_SANITIZE_early_32.o := n
> >   KASAN_SANITIZE_cputable.o := n
> >   KASAN_SANITIZE_prom_init.o := n
> >   KASAN_SANITIZE_btext.o := n
> > +KASAN_SANITIZE_paca.o := n
> > +KASAN_SANITIZE_setup_64.o := n
> > +KASAN_SANITIZE_mce.o := n
> > +KASAN_SANITIZE_mce_power.o := n
> > +
> > +# we have to be particularly careful in ppc64 to exclude code that
> > +# runs with translations off, as we cannot access the shadow with
> > +# translations off. However, ppc32 can sanitize this.
> > +ifdef CONFIG_PPC64
> > +KASAN_SANITIZE_traps.o := n
> > +endif
> >   
> >   ifdef CONFIG_KASAN
> >   CFLAGS_early_32.o += -DDISABLE_BRANCH_PROFILING
> > diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> > index 984813a4d5dc..c962f9bfc7d4 100644
> > --- a/arch/powerpc/kernel/process.c
> > +++ b/arch/powerpc/kernel/process.c
> > @@ -2220,8 +2220,8 @@ void __no_sanitize_address show_stack(struct task_struct *tsk,
> >   			break;
> >   
> >   		stack = (unsigned long *) sp;
> > -		newsp = stack[0];
> > -		ip = stack[STACK_FRAME_LR_SAVE];
> > +		newsp = READ_ONCE_NOCHECK(stack[0]);
> > +		ip = READ_ONCE_NOCHECK(stack[STACK_FRAME_LR_SAVE]);
> >   		if (!firstframe || ip != lr) {
> >   			printk("%s["REG"] ["REG"] %pS",
> >   				loglvl, sp, ip, (void *)ip);
> > @@ -2239,17 +2239,19 @@ void __no_sanitize_address show_stack(struct task_struct *tsk,
> >   		 * See if this is an exception frame.
> >   		 * We look for the "regshere" marker in the current frame.
> >   		 */
> > -		if (validate_sp(sp, tsk, STACK_FRAME_WITH_PT_REGS)
> > -		    && stack[STACK_FRAME_MARKER] == STACK_FRAME_REGS_MARKER) {
> > +		if (validate_sp(sp, tsk, STACK_FRAME_WITH_PT_REGS) &&
> > +		    (READ_ONCE_NOCHECK(stack[STACK_FRAME_MARKER]) ==
> > +		     STACK_FRAME_REGS_MARKER)) {
> >   			struct pt_regs *regs = (struct pt_regs *)
> >   				(sp + STACK_FRAME_OVERHEAD);
> >   
> > -			lr = regs->link;
> > +			lr = READ_ONCE_NOCHECK(regs->link);
> >   			printk("%s--- interrupt: %lx at %pS\n",
> > -			       loglvl, regs->trap, (void *)regs->nip);
> > +			       loglvl, READ_ONCE_NOCHECK(regs->trap),
> > +			       (void *)READ_ONCE_NOCHECK(regs->nip));
> >   			__show_regs(regs);
> >   			printk("%s--- interrupt: %lx\n",
> > -			       loglvl, regs->trap);
> > +			       loglvl, READ_ONCE_NOCHECK(regs->trap));
> >   
> >   			firstframe = 1;
> >   		}
> 
> This change we submitted as a standalone patch and was rejected as is, 
> see 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210528074806.1311297-1-dja@axtens.net/
> 
> v2 was accepted, see 
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210614120907.1952321-1-dja@axtens.net/
> 
> Therefore AFAIU this change is redundant with the accepted v2 and should 
> be dropped.

OK, thanks for the history.  I'll drop this change.

> > diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> > index b7fd6a72aa76..5fedadc27952 100644
> > --- a/arch/powerpc/kernel/smp.c
> > +++ b/arch/powerpc/kernel/smp.c
> > @@ -413,32 +413,32 @@ static struct cpumask nmi_ipi_pending_mask;
> >   static bool nmi_ipi_busy = false;
> >   static void (*nmi_ipi_function)(struct pt_regs *) = NULL;
> >   
> > -static void nmi_ipi_lock_start(unsigned long *flags)
> > +noinstr static void nmi_ipi_lock_start(unsigned long *flags)
> >   {
> >   	raw_local_irq_save(*flags);
> >   	hard_irq_disable();
> > -	while (atomic_cmpxchg(&__nmi_ipi_lock, 0, 1) == 1) {
> > +	while (arch_atomic_cmpxchg(&__nmi_ipi_lock, 0, 1) == 1) {
> >   		raw_local_irq_restore(*flags);
> > -		spin_until_cond(atomic_read(&__nmi_ipi_lock) == 0);
> > +		spin_until_cond(arch_atomic_read(&__nmi_ipi_lock) == 0);
> >   		raw_local_irq_save(*flags);
> >   		hard_irq_disable();
> >   	}
> >   }
> >   
> > -static void nmi_ipi_lock(void)
> > +noinstr static void nmi_ipi_lock(void)
> >   {
> > -	while (atomic_cmpxchg(&__nmi_ipi_lock, 0, 1) == 1)
> > -		spin_until_cond(atomic_read(&__nmi_ipi_lock) == 0);
> > +	while (arch_atomic_cmpxchg(&__nmi_ipi_lock, 0, 1) == 1)
> > +		spin_until_cond(arch_atomic_read(&__nmi_ipi_lock) == 0);
> >   }
> >   
> > -static void nmi_ipi_unlock(void)
> > +noinstr static void nmi_ipi_unlock(void)
> >   {
> >   	smp_mb();
> > -	WARN_ON(atomic_read(&__nmi_ipi_lock) != 1);
> > -	atomic_set(&__nmi_ipi_lock, 0);
> > +	WARN_ON(arch_atomic_read(&__nmi_ipi_lock) != 1);
> > +	arch_atomic_set(&__nmi_ipi_lock, 0);
> >   }
> >   
> > -static void nmi_ipi_unlock_end(unsigned long *flags)
> > +noinstr static void nmi_ipi_unlock_end(unsigned long *flags)
> >   {
> >   	nmi_ipi_unlock();
> >   	raw_local_irq_restore(*flags);
> > @@ -447,7 +447,7 @@ static void nmi_ipi_unlock_end(unsigned long *flags)
> >   /*
> >    * Platform NMI handler calls this to ack
> >    */
> > -int smp_handle_nmi_ipi(struct pt_regs *regs)
> > +noinstr int smp_handle_nmi_ipi(struct pt_regs *regs)
> >   {
> >   	void (*fn)(struct pt_regs *) = NULL;
> >   	unsigned long flags;
> 
> Can you explain those changes from atomic_xxx to arch_atomic_xxx ?

With KASAN enabled, atomic_read() and similar functions become
wrappers which explicitly call KASAN checking functions.  See
include/linux/atomic/atomic-instrumented.h and
include/linux/instrumented.h.  Since we don't want those NMI functions
instrumented, we have to use the arch_atomic_* functions so as to
avoid getting the explicit instrumentation calls.  As to why we don't
want instrumentation here, it's because we want to avoid crashing when
doing kexec or more particularly kdump, I believe.

> Should it be a separate patch ?

Could be - matter of taste I guess.

[snip]

> > diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
> > index 2d50cac499c5..3150159e5121 100644
> > --- a/arch/powerpc/mm/book3s64/Makefile
> > +++ b/arch/powerpc/mm/book3s64/Makefile
> > @@ -24,3 +24,12 @@ obj-$(CONFIG_PPC_PKEY)	+= pkeys.o
> >   
> >   # Instrumenting the SLB fault path can lead to duplicate SLB entries
> >   KCOV_INSTRUMENT_slb.o := n
> > +
> > +# Parts of these can run in real mode and therefore are
> > +# not safe with the current outline KASAN implementation
> 
> But are we not safe about KASAN being disabled when in real mode ? Isn't 
> it the purpose of kasan_arch_is_ready ?

We have not added kasan_arch_is_ready() checks to all of the KASAN
entry points, only those that are called early in boot before KASAN
has been initialized, as I found out when I changed kasan_init() to
just return without doing anything if radix is not enabled.  On
POWER8, the kernel crashed shortly afterwards in generic KASAN code
that didn't have a kasan_arch_is_ready() call in it.

As to whether we should add such calls to every entry point in the
generic KASAN code -- it would probably be a good idea to do that,
though a bit fragile in the long term because people will add stuff to
the generic KASAN code without realizing there needs to be the guard,
since their architecture won't need it.

In the really long term, hopefully we can eventually drop HPT and get
to the point where practically nothing runs in real mode.  That's a
fair way off though.

> > +KASAN_SANITIZE_mmu_context.o := n
> > +KASAN_SANITIZE_pgtable.o := n
> > +KASAN_SANITIZE_radix_pgtable.o := n
> > +KASAN_SANITIZE_radix_tlb.o := n
> > +KASAN_SANITIZE_slb.o := n
> > +KASAN_SANITIZE_pkeys.o := n
> > diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
> > index bcbfd6f2eca3..4999aadb1867 100644
> > --- a/arch/powerpc/mm/kasan/Makefile
> > +++ b/arch/powerpc/mm/kasan/Makefile
> > @@ -5,3 +5,4 @@ KASAN_SANITIZE := n
> >   obj-$(CONFIG_PPC32)		+= init_32.o
> >   obj-$(CONFIG_PPC_8xx)		+= 8xx.o
> >   obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s_32.o
> > +obj-$(CONFIG_PPC_BOOK3S_64)	+= init_book3s_64.o
> > diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
> > new file mode 100644
> > index 000000000000..cb96e16e57a1
> > --- /dev/null
> > +++ b/arch/powerpc/mm/kasan/init_book3s_64.c
> > @@ -0,0 +1,103 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * KASAN for 64-bit Book3S powerpc
> > + *
> > + * Copyright (C) 2019-2020 IBM Corporation
> > + * Author: Daniel Axtens <dja@axtens.net>
> > + */
> > +
> > +/*
> > +# ppc64 turns on virtual memory late in boot, after calling into generic code
> > +# like the device-tree parser, so it uses this in conjunction with a hook in
> > +# outline mode to avoid invalid access early in boot.
> > +*/
> > +
> > +#define DISABLE_BRANCH_PROFILING
> > +
> > +#include <linux/kasan.h>
> > +#include <linux/printk.h>
> > +#include <linux/sched/task.h>
> > +#include <linux/memblock.h>
> > +#include <asm/pgalloc.h>
> > +
> > +DEFINE_STATIC_KEY_FALSE(powerpc_kasan_enabled_key);
> > +
> > +static void __init kasan_init_phys_region(void *start, void *end)
> > +{
> > +	unsigned long k_start, k_end, k_cur;
> > +	void *va;
> > +
> > +	if (start >= end)
> > +		return;
> > +
> > +	k_start = ALIGN_DOWN((unsigned long)kasan_mem_to_shadow(start), PAGE_SIZE);
> > +	k_end = ALIGN((unsigned long)kasan_mem_to_shadow(end), PAGE_SIZE);
> > +
> > +	va = memblock_alloc(k_end - k_start, PAGE_SIZE);
> > +	for (k_cur = k_start; k_cur < k_end; k_cur += PAGE_SIZE, va += PAGE_SIZE)
> > +		map_kernel_page(k_cur, __pa(va), PAGE_KERNEL);
> > +}
> > +
> > +void __init kasan_init(void)
> > +{
> > +	/*
> > +	 * We want to do the following things:
> > +	 *  1) Map real memory into the shadow for all physical memblocks
> > +	 *     This takes us from c000... to c008...
> > +	 *  2) Leave a hole over the shadow of vmalloc space. KASAN_VMALLOC
> > +	 *     will manage this for us.
> > +	 *     This takes us from c008... to c00a...
> > +	 *  3) Map the 'early shadow'/zero page over iomap and vmemmap space.
> > +	 *     This takes us up to where we start at c00e...
> > +	 */
> > +
> > +	void *k_start = kasan_mem_to_shadow((void *)RADIX_VMALLOC_END);
> > +	void *k_end = kasan_mem_to_shadow((void *)RADIX_VMEMMAP_END);
> > +	phys_addr_t start, end;
> > +	u64 i;
> > +	pte_t zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL);
> > +
> > +	if (!early_radix_enabled()) {
> > +		pr_warn("KASAN not enabled as it requires radix!");
> > +		return;
> > +	}
> > +
> > +	for_each_mem_range(i, &start, &end)
> > +		kasan_init_phys_region((void *)start, (void *)end);
> > +
> > +	for (i = 0; i < PTRS_PER_PTE; i++)
> > +		__set_pte_at(&init_mm, (unsigned long)kasan_early_shadow_page,
> > +			     &kasan_early_shadow_pte[i], zero_pte, 0);
> > +
> > +	for (i = 0; i < PTRS_PER_PMD; i++)
> > +		pmd_populate_kernel(&init_mm, &kasan_early_shadow_pmd[i],
> > +				    kasan_early_shadow_pte);
> > +
> > +	for (i = 0; i < PTRS_PER_PUD; i++)
> > +		pud_populate(&init_mm, &kasan_early_shadow_pud[i],
> > +			     kasan_early_shadow_pmd);
> > +
> > +	/* map the early shadow over the iomap and vmemmap space */
> > +	kasan_populate_early_shadow(k_start, k_end);
> > +
> > +	/* mark early shadow region as RO and wipe it */
> > +	zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL_RO);
> > +	for (i = 0; i < PTRS_PER_PTE; i++)
> > +		__set_pte_at(&init_mm, (unsigned long)kasan_early_shadow_page,
> > +			     &kasan_early_shadow_pte[i], zero_pte, 0);
> > +
> > +	/*
> > +	 * clear_page relies on some cache info that hasn't been set up yet.
> > +	 * It ends up looping ~forever and blows up other data.
> > +	 * Use memset instead.
> > +	 */
> > +	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
> > +
> > +	static_branch_inc(&powerpc_kasan_enabled_key);
> > +
> > +	/* Enable error messages */
> > +	init_task.kasan_depth = 0;
> > +	pr_info("KASAN init done (64-bit Book3S)\n");
> 
> Maybe mention RADIX in the printed message ?

Why?  As in, who would find it useful?

Paul.
