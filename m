Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E06191999C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 17:33:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sCyq566pzDqmj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 02:33:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=inmZbz6I; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sCmC4W8kzDqyv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 02:22:57 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48sCkg28Y0z9v1m0;
 Tue, 31 Mar 2020 17:22:51 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=inmZbz6I; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id c9VHlQdefLVE; Tue, 31 Mar 2020 17:22:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48sCkg0rp4z9v1lt;
 Tue, 31 Mar 2020 17:22:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585668171; bh=F9Wh5xKVVuJlZmQyKjCC5oQ4M4rJ4Mj5FmgN1lFn2rk=;
 h=From:Subject:To:Cc:Date:From;
 b=inmZbz6IOoaOb3T3SxTi0bNgwYM+EV8blD8+TeLGtU7K+YAnnGTGwCtzRiHVVE6Jy
 FdT4Jc/JkxJqZkdnRUc0gjE9nnwqikaGDlJTxRbxPYUjlJghWxv3sKgcvqimnaJB8h
 +uAgFGo1FDJmYzAa9jQheYTpizUaYTklzoE8qxt8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C3A38B86A;
 Tue, 31 Mar 2020 17:22:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id a-agvd4JYytu; Tue, 31 Mar 2020 17:22:52 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 24E148B752;
 Tue, 31 Mar 2020 17:22:52 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BAFF3656A9; Tue, 31 Mar 2020 15:22:51 +0000 (UTC)
Message-Id: <bbc0a09cfaf523bc00893253a7101362c98b31eb.1585667934.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC WIP PATCH] powerpc/32: system call implement entry/exit logic in
 C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Tue, 31 Mar 2020 15:22:51 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

That's first try to port PPC64 syscall entry/exit logic in C to PPC32.
I've do the minimum to get it work. I have not reworked calls
to sys_fork() and friends for instance.

For the time being, it seems to work more or less but:
- ping reports EINVAL on recvfrom
- strace shows NULL instead of strings in call like open() for instance.
- the performance is definitively bad

On an 8xx, null_syscall test is about 30% slower after this patch:
- Without the patch: 284 cycles
- With the patch: 371 cycles

@nick and others, any suggestion to fix and improve ?

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/book3s/32/kup.h      |  21 ++
 .../powerpc/include/asm/book3s/64/kup-radix.h |  12 +-
 arch/powerpc/include/asm/hw_irq.h             |  15 +
 arch/powerpc/include/asm/kup.h                |   2 +
 arch/powerpc/include/asm/nohash/32/kup-8xx.h  |  13 +
 arch/powerpc/kernel/Makefile                  |   5 +-
 arch/powerpc/kernel/entry_32.S                | 259 ++----------------
 arch/powerpc/kernel/head_32.h                 |   3 +-
 .../kernel/{syscall_64.c => syscall.c}        |  25 +-
 9 files changed, 102 insertions(+), 253 deletions(-)
 rename arch/powerpc/kernel/{syscall_64.c => syscall.c} (97%)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 3c0ba22dc360..c85bc5b56366 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -102,6 +102,27 @@ static inline void kuap_update_sr(u32 sr, u32 addr, u32 end)
 	isync();	/* Context sync required after mtsrin() */
 }
 
+static inline void kuap_restore(struct pt_regs *regs)
+{
+	u32 kuap = current->thread.kuap;
+	u32 addr = kuap & 0xf0000000;
+	u32 end = kuap << 28;
+
+	if (unlikely(!kuap))
+		return;
+
+	current->thread.kuap = 0;
+	kuap_update_sr(mfsrin(addr) & ~SR_KS, addr, end);	/* Clear Ks */
+}
+
+static inline void kuap_check(void)
+{
+	if (!IS_ENABLED(CONFIG_PPC_KUAP_DEBUG))
+		return;
+
+	WARN_ON_ONCE(current->thread.kuap != 0);
+}
+
 static __always_inline void allow_user_access(void __user *to, const void __user *from,
 					      u32 size, unsigned long dir)
 {
diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
index 3bcef989a35d..1f2716a0dcd8 100644
--- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
@@ -60,13 +60,13 @@
 #include <asm/mmu.h>
 #include <asm/ptrace.h>
 
-static inline void kuap_restore_amr(struct pt_regs *regs)
+static inline void kuap_restore(struct pt_regs *regs)
 {
 	if (mmu_has_feature(MMU_FTR_RADIX_KUAP))
 		mtspr(SPRN_AMR, regs->kuap);
 }
 
-static inline void kuap_check_amr(void)
+static inline void kuap_check(void)
 {
 	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_RADIX_KUAP))
 		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
@@ -141,14 +141,6 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
 		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
 }
-#else /* CONFIG_PPC_KUAP */
-static inline void kuap_restore_amr(struct pt_regs *regs)
-{
-}
-
-static inline void kuap_check_amr(void)
-{
-}
 #endif /* CONFIG_PPC_KUAP */
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index e0e71777961f..6ccf07de6665 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -321,6 +321,16 @@ static inline void arch_local_irq_disable(void)
 		mtmsr(mfmsr() & ~MSR_EE);
 }
 
+static inline void arch_local_recovery_disable(void)
+{
+	if (IS_ENABLED(CONFIG_BOOKE))
+		wrtee(0);
+	else if (IS_ENABLED(CONFIG_PPC_8xx))
+		wrtspr(SPRN_NRI);
+	else
+		mtmsr(mfmsr() & ~(MSR_EE | MSR_RI));
+}
+
 static inline void arch_local_irq_enable(void)
 {
 	if (IS_ENABLED(CONFIG_BOOKE))
@@ -343,6 +353,11 @@ static inline bool arch_irqs_disabled(void)
 
 #define hard_irq_disable()		arch_local_irq_disable()
 
+#define __hard_irq_enable()		arch_local_irq_enable()
+#define __hard_irq_disable()		arch_local_irq_disable()
+#define __hard_EE_RI_disable()		arch_local_recovery_disable()
+#define __hard_RI_enable()		arch_local_irq_disable()
+
 static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
 {
 	return !(regs->msr & MSR_EE);
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 92bcd1a26d73..1100c13b6d9e 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -62,6 +62,8 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 {
 	return false;
 }
+static inline void kuap_restore(struct pt_regs *regs) { }
+static inline void kuap_check(void) { }
 #endif /* CONFIG_PPC_KUAP */
 
 static inline void allow_read_from_user(const void __user *from, unsigned long size)
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index 85ed2390fb99..1918d2e55da3 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -34,6 +34,19 @@
 
 #include <asm/reg.h>
 
+static inline void kuap_restore(struct pt_regs *regs)
+{
+	mtspr(SPRN_MD_AP, regs->kuap);
+}
+
+static inline void kuap_check(void)
+{
+	if (!IS_ENABLED(CONFIG_PPC_KUAP_DEBUG))
+		return;
+
+	WARN_ON_ONCE((mfspr(SPRN_MD_AP) & 0xffff0000) != (MD_APG_KUAP & 0xffff0000));
+}
+
 static inline void allow_user_access(void __user *to, const void __user *from,
 				     unsigned long size, unsigned long dir)
 {
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 570660efbb3d..e4be425b7718 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -45,11 +45,10 @@ obj-y				:= cputable.o syscalls.o \
 				   signal.o sysfs.o cacheinfo.o time.o \
 				   prom.o traps.o setup-common.o \
 				   udbg.o misc.o io.o misc_$(BITS).o \
-				   of_platform.o prom_parse.o
+				   of_platform.o prom_parse.o syscall.o
 obj-y				+= ptrace/
 obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o signal_64.o \
-				   paca.o nvram_64.o firmware.o note.o \
-				   syscall_64.o
+				   paca.o nvram_64.o firmware.o note.o
 obj-$(CONFIG_VDSO32)		+= vdso32/
 obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
 obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index a6371fb8f761..103f5158bc44 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -315,162 +315,37 @@ stack_ovf:
 	RFI
 #endif
 
-#ifdef CONFIG_TRACE_IRQFLAGS
-trace_syscall_entry_irq_off:
-	/*
-	 * Syscall shouldn't happen while interrupts are disabled,
-	 * so let's do a warning here.
-	 */
-0:	trap
-	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__, BUGFLAG_WARNING
-	bl	trace_hardirqs_on
-
-	/* Now enable for real */
-	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL | MSR_EE)
-	mtmsr	r10
-
-	REST_GPR(0, r1)
-	REST_4GPRS(3, r1)
-	REST_2GPRS(7, r1)
-	b	DoSyscall
-#endif /* CONFIG_TRACE_IRQFLAGS */
-
 	.globl	transfer_to_syscall
 transfer_to_syscall:
-#ifdef CONFIG_TRACE_IRQFLAGS
-	andi.	r12,r9,MSR_EE
-	beq-	trace_syscall_entry_irq_off
-#endif /* CONFIG_TRACE_IRQFLAGS */
-
-/*
- * Handle a system call.
- */
-	.stabs	"arch/powerpc/kernel/",N_SO,0,0,0f
-	.stabs	"entry_32.S",N_SO,0,0,0f
-0:
-
-_GLOBAL(DoSyscall)
-	stw	r3,ORIG_GPR3(r1)
-	li	r12,0
-	stw	r12,RESULT(r1)
-#ifdef CONFIG_TRACE_IRQFLAGS
-	/* Make sure interrupts are enabled */
-	mfmsr	r11
-	andi.	r12,r11,MSR_EE
-	/* We came in with interrupts disabled, we WARN and mark them enabled
-	 * for lockdep now */
-0:	tweqi	r12, 0
-	EMIT_BUG_ENTRY 0b,__FILE__,__LINE__, BUGFLAG_WARNING
-#endif /* CONFIG_TRACE_IRQFLAGS */
-	lwz	r11,TI_FLAGS(r2)
-	andi.	r11,r11,_TIF_SYSCALL_DOTRACE
-	bne-	syscall_dotrace
-syscall_dotrace_cont:
-	cmplwi	0,r0,NR_syscalls
-	lis	r10,sys_call_table@h
-	ori	r10,r10,sys_call_table@l
-	slwi	r0,r0,2
-	bge-	66f
-
-	barrier_nospec_asm
-	/*
-	 * Prevent the load of the handler below (based on the user-passed
-	 * system call number) being speculatively executed until the test
-	 * against NR_syscalls and branch to .66f above has
-	 * committed.
-	 */
-
-	lwzx	r10,r10,r0	/* Fetch system call handler [ptr] */
-	mtlr	r10
-	addi	r9,r1,STACK_FRAME_OVERHEAD
-	PPC440EP_ERR42
-	blrl			/* Call handler */
-	.globl	ret_from_syscall
+	mr	r9, r0
+	addi	r10, r1, STACK_FRAME_OVERHEAD
+	bl	system_call_exception
 ret_from_syscall:
-#ifdef CONFIG_DEBUG_RSEQ
-	/* Check whether the syscall is issued inside a restartable sequence */
-	stw	r3,GPR3(r1)
-	addi    r3,r1,STACK_FRAME_OVERHEAD
-	bl      rseq_syscall
-	lwz	r3,GPR3(r1)
-#endif
-	mr	r6,r3
-	/* disable interrupts so current_thread_info()->flags can't change */
-	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL)	/* doesn't include MSR_EE */
-	/* Note: We don't bother telling lockdep about it */
-	SYNC
-	mtmsr	r10
-	lwz	r9,TI_FLAGS(r2)
-	li	r8,-MAX_ERRNO
-	andi.	r0,r9,(_TIF_SYSCALL_DOTRACE|_TIF_SINGLESTEP|_TIF_USER_WORK_MASK|_TIF_PERSYSCALL_MASK)
-	bne-	syscall_exit_work
-	cmplw	0,r3,r8
-	blt+	syscall_exit_cont
-	lwz	r11,_CCR(r1)			/* Load CR */
-	neg	r3,r3
-	oris	r11,r11,0x1000	/* Set SO bit in CR */
-	stw	r11,_CCR(r1)
-syscall_exit_cont:
-	lwz	r8,_MSR(r1)
-#ifdef CONFIG_TRACE_IRQFLAGS
-	/* If we are going to return from the syscall with interrupts
-	 * off, we trace that here. It shouldn't normally happen.
-	 */
-	andi.	r10,r8,MSR_EE
-	bne+	1f
-	stw	r3,GPR3(r1)
-	bl      trace_hardirqs_off
-	lwz	r3,GPR3(r1)
-1:
-#endif /* CONFIG_TRACE_IRQFLAGS */
-#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
-	/* If the process has its own DBCR0 value, load it up.  The internal
-	   debug mode bit tells us that dbcr0 should be loaded. */
-	lwz	r0,THREAD+THREAD_DBCR0(r2)
-	andis.	r10,r0,DBCR0_IDM@h
-	bnel-	load_dbcr0
-#endif
-#ifdef CONFIG_44x
-BEGIN_MMU_FTR_SECTION
-	lis	r4,icache_44x_need_flush@ha
-	lwz	r5,icache_44x_need_flush@l(r4)
-	cmplwi	cr0,r5,0
-	bne-	2f
-1:
-END_MMU_FTR_SECTION_IFCLR(MMU_FTR_TYPE_47x)
-#endif /* CONFIG_44x */
-BEGIN_FTR_SECTION
-	lwarx	r7,0,r1
-END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
-	stwcx.	r0,0,r1			/* to clear the reservation */
-	ACCOUNT_CPU_USER_EXIT(r2, r5, r7)
-#ifdef CONFIG_PPC_BOOK3S_32
-	kuep_unlock r5, r7
-#endif
-	kuap_check r2, r4
-	lwz	r4,_LINK(r1)
-	lwz	r5,_CCR(r1)
-	mtlr	r4
-	mtcr	r5
-	lwz	r7,_NIP(r1)
-	lwz	r2,GPR2(r1)
-	lwz	r1,GPR1(r1)
-#if defined(CONFIG_PPC_8xx) && defined(CONFIG_PERF_EVENTS)
-	mtspr	SPRN_NRI, r0
-#endif
-	mtspr	SPRN_SRR0,r7
-	mtspr	SPRN_SRR1,r8
-	SYNC
-	RFI
-#ifdef CONFIG_44x
-2:	li	r7,0
-	iccci	r0,r0
-	stw	r7,icache_44x_need_flush@l(r4)
+	addi    r4, r1, STACK_FRAME_OVERHEAD
+	bl	syscall_exit_prepare
+	lwz	r2, _CCR(r1)
+	lwz	r4, _NIP(r1)
+	lwz	r5, _MSR(r1)
+	lwz	r6, _LINK(r1)
+	mtspr	SPRN_SRR0, r4
+	mtspr	SPRN_SRR1, r5
+	mtlr	r6
+	cmpwi	r3, 0
+	bne	2f
+1:	mtcr	r2
+	REST_GPR(2, r1)
+	REST_GPR(3, r1)
+	REST_GPR(1, r1)
+	rfi
+2:	lwz	r3, _CTR(r1)
+	lwz	r4, _XER(r1)
+	REST_NVGPRS(r1)
+	mtctr	r3
+	mtspr	SPRN_XER, r4
+	REST_GPR(0, r1)
+	REST_8GPRS(4, r1)
+	REST_GPR(12, r1)
 	b	1b
-#endif  /* CONFIG_44x */
-
-66:	li	r3,-ENOSYS
-	b	ret_from_syscall
 
 	.globl	ret_from_fork
 ret_from_fork:
@@ -490,86 +365,6 @@ ret_from_kernel_thread:
 	li	r3,0
 	b	ret_from_syscall
 
-/* Traced system call support */
-syscall_dotrace:
-	SAVE_NVGPRS(r1)
-	li	r0,0xc00
-	stw	r0,_TRAP(r1)
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_syscall_trace_enter
-	/*
-	 * Restore argument registers possibly just changed.
-	 * We use the return value of do_syscall_trace_enter
-	 * for call number to look up in the table (r0).
-	 */
-	mr	r0,r3
-	lwz	r3,GPR3(r1)
-	lwz	r4,GPR4(r1)
-	lwz	r5,GPR5(r1)
-	lwz	r6,GPR6(r1)
-	lwz	r7,GPR7(r1)
-	lwz	r8,GPR8(r1)
-	REST_NVGPRS(r1)
-
-	cmplwi	r0,NR_syscalls
-	/* Return code is already in r3 thanks to do_syscall_trace_enter() */
-	bge-	ret_from_syscall
-	b	syscall_dotrace_cont
-
-syscall_exit_work:
-	andi.	r0,r9,_TIF_RESTOREALL
-	beq+	0f
-	REST_NVGPRS(r1)
-	b	2f
-0:	cmplw	0,r3,r8
-	blt+	1f
-	andi.	r0,r9,_TIF_NOERROR
-	bne-	1f
-	lwz	r11,_CCR(r1)			/* Load CR */
-	neg	r3,r3
-	oris	r11,r11,0x1000	/* Set SO bit in CR */
-	stw	r11,_CCR(r1)
-
-1:	stw	r6,RESULT(r1)	/* Save result */
-	stw	r3,GPR3(r1)	/* Update return value */
-2:	andi.	r0,r9,(_TIF_PERSYSCALL_MASK)
-	beq	4f
-
-	/* Clear per-syscall TIF flags if any are set.  */
-
-	li	r11,_TIF_PERSYSCALL_MASK
-	addi	r12,r2,TI_FLAGS
-3:	lwarx	r8,0,r12
-	andc	r8,r8,r11
-#ifdef CONFIG_IBM405_ERR77
-	dcbt	0,r12
-#endif
-	stwcx.	r8,0,r12
-	bne-	3b
-	
-4:	/* Anything which requires enabling interrupts? */
-	andi.	r0,r9,(_TIF_SYSCALL_DOTRACE|_TIF_SINGLESTEP)
-	beq	ret_from_except
-
-	/* Re-enable interrupts. There is no need to trace that with
-	 * lockdep as we are supposed to have IRQs on at this point
-	 */
-	ori	r10,r10,MSR_EE
-	SYNC
-	mtmsr	r10
-
-	/* Save NVGPRS if they're not saved already */
-	lwz	r4,_TRAP(r1)
-	andi.	r4,r4,1
-	beq	5f
-	SAVE_NVGPRS(r1)
-	li	r4,0xc00
-	stw	r4,_TRAP(r1)
-5:
-	addi	r3,r1,STACK_FRAME_OVERHEAD
-	bl	do_syscall_trace_leave
-	b	ret_from_except_full
-
 	/*
 	 * System call was called from kernel. We get here with SRR1 in r9.
 	 * Mark the exception as recoverable once we have retrieved SRR0,
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 9abec6cd099c..97691931a306 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -174,12 +174,13 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
 	stw	r2,GPR2(r11)
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
 	stw	r9,_MSR(r11)
-	li	r2, \trapno + 1
+	li	r2, \trapno
 	stw	r10,8(r11)
 	stw	r2,_TRAP(r11)
 	SAVE_GPR(0, r11)
 	SAVE_4GPRS(3, r11)
 	SAVE_2GPRS(7, r11)
+	SAVE_NVGPRS(r11)
 	addi	r11,r1,STACK_FRAME_OVERHEAD
 	addi	r2,r12,-THREAD
 	stw	r11,PT_REGS(r12)
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall.c
similarity index 97%
rename from arch/powerpc/kernel/syscall_64.c
rename to arch/powerpc/kernel/syscall.c
index cf06eb443a80..a07702a85f81 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall.c
@@ -1,8 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
 #include <linux/err.h>
+#include <linux/compat.h>
+
 #include <asm/asm-prototypes.h>
-#include <asm/book3s/64/kup-radix.h>
 #include <asm/cputime.h>
 #include <asm/hw_irq.h>
 #include <asm/kprobes.h>
@@ -25,16 +26,20 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	unsigned long ti_flags;
 	syscall_fn f;
 
+#ifdef CONFIG_PPC64
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
 		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
+#endif
 
 	trace_hardirqs_off(); /* finish reconciling */
 
-	if (IS_ENABLED(CONFIG_PPC_BOOK3S))
+	if (!IS_ENABLED(CONFIG_PPC_BOOK3E))
 		BUG_ON(!(regs->msr & MSR_RI));
 	BUG_ON(!(regs->msr & MSR_PR));
 	BUG_ON(!FULL_REGS(regs));
+#ifdef CONFIG_PPC64
 	BUG_ON(regs->softe != IRQS_ENABLED);
+#endif
 
 	account_cpu_user_entry();
 
@@ -48,7 +53,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	}
 #endif
 
-	kuap_check_amr();
+	kuap_check();
 
 	/*
 	 * This is not required for the syscall exit path, but makes the
@@ -56,7 +61,9 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	 * frame, or if the unwinder was taught the first stack frame always
 	 * returns to user with IRQS_ENABLED, this store could be avoided!
 	 */
+#ifdef CONFIG_PPC64
 	regs->softe = IRQS_ENABLED;
+#endif
 
 	local_irq_enable();
 
@@ -86,7 +93,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	/* May be faster to do array_index_nospec? */
 	barrier_nospec();
 
-	if (unlikely(ti_flags & _TIF_32BIT)) {
+	if (is_compat_task()) {
 		f = (void *)compat_sys_call_table[r0];
 
 		r3 &= 0x00000000ffffffffULL;
@@ -148,7 +155,9 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 		ret |= _TIF_RESTOREALL;
 	}
 
+#ifdef CONFIG_PPC64
 again:
+#endif
 	local_irq_disable();
 	ti_flags = READ_ONCE(*ti_flagsp);
 	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
@@ -191,6 +200,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	/* This pattern matches prep_irq_for_idle */
 	__hard_EE_RI_disable();
+#ifdef CONFIG_PPC64
 	if (unlikely(lazy_irq_pending())) {
 		__hard_RI_enable();
 		trace_hardirqs_off();
@@ -201,12 +211,13 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	}
 	local_paca->irq_happened = 0;
 	irq_soft_mask_set(IRQS_ENABLED);
+#endif
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	local_paca->tm_scratch = regs->msr;
 #endif
 
-	kuap_check_amr();
+	kuap_check();
 
 	account_cpu_user_exit();
 
@@ -294,7 +305,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	local_paca->tm_scratch = regs->msr;
 #endif
 
-	kuap_check_amr();
+	kuap_check();
 
 	account_cpu_user_exit();
 
@@ -372,7 +383,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
 	 * The value of AMR only matters while we're in the kernel.
 	 */
-	kuap_restore_amr(regs);
+	kuap_restore(regs);
 
 	return ret;
 }
-- 
2.25.0

