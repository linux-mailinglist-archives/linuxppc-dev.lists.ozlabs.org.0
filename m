Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5297F33256D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 13:24:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvvXG2lwhz3gg6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 23:24:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvvD55wjhz3cJv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 23:10:13 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DvvD20pyHz9tyjM;
 Tue,  9 Mar 2021 13:10:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nbXdCMHcxz8M; Tue,  9 Mar 2021 13:10:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DvvD16nf1z9tyjG;
 Tue,  9 Mar 2021 13:10:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 05B748B800;
 Tue,  9 Mar 2021 13:10:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nTx8Z1HFu-7i; Tue,  9 Mar 2021 13:10:10 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5DBED8B803;
 Tue,  9 Mar 2021 13:10:10 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3D6A767555; Tue,  9 Mar 2021 12:10:10 +0000 (UTC)
Message-Id: <509011e8e3ad4399aa39a548d2f30d9056aafa6f.1615291474.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615291471.git.christophe.leroy@csgroup.eu>
References: <cover.1615291471.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 43/43] powerpc/32: Manage KUAP in C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue,  9 Mar 2021 12:10:10 +0000 (UTC)
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

Move all KUAP management in C.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h     | 50 +-------------------
 arch/powerpc/include/asm/interrupt.h         |  2 +
 arch/powerpc/include/asm/kup.h               |  9 ----
 arch/powerpc/include/asm/nohash/32/kup-8xx.h | 25 +---------
 arch/powerpc/kernel/entry_32.S               |  6 ---
 arch/powerpc/kernel/interrupt.c              | 19 ++------
 arch/powerpc/kernel/process.c                |  3 ++
 7 files changed, 11 insertions(+), 103 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index c9d6c28bcd10..27991e0d2cf9 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -5,55 +5,7 @@
 #include <asm/bug.h>
 #include <asm/book3s/32/mmu-hash.h>
 
-#ifdef __ASSEMBLY__
-
-#ifdef CONFIG_PPC_KUAP
-
-.macro kuap_update_sr	gpr1, gpr2, gpr3	/* NEVER use r0 as gpr2 due to addis */
-101:	mtsrin	\gpr1, \gpr2
-	addi	\gpr1, \gpr1, 0x111		/* next VSID */
-	rlwinm	\gpr1, \gpr1, 0, 0xf0ffffff	/* clear VSID overflow */
-	addis	\gpr2, \gpr2, 0x1000		/* address of next segment */
-	cmplw	\gpr2, \gpr3
-	blt-	101b
-	isync
-.endm
-
-.macro kuap_save_and_lock	sp, thread, gpr1, gpr2, gpr3
-	lwz	\gpr2, KUAP(\thread)
-	rlwinm.	\gpr3, \gpr2, 28, 0xf0000000
-	stw	\gpr2, STACK_REGS_KUAP(\sp)
-	beq+	102f
-	li	\gpr1, 0
-	stw	\gpr1, KUAP(\thread)
-	mfsrin	\gpr1, \gpr2
-	oris	\gpr1, \gpr1, SR_KS@h	/* set Ks */
-	kuap_update_sr	\gpr1, \gpr2, \gpr3
-102:
-.endm
-
-.macro kuap_restore	sp, current, gpr1, gpr2, gpr3
-	lwz	\gpr2, STACK_REGS_KUAP(\sp)
-	rlwinm.	\gpr3, \gpr2, 28, 0xf0000000
-	stw	\gpr2, THREAD + KUAP(\current)
-	beq+	102f
-	mfsrin	\gpr1, \gpr2
-	rlwinm	\gpr1, \gpr1, 0, ~SR_KS	/* Clear Ks */
-	kuap_update_sr	\gpr1, \gpr2, \gpr3
-102:
-.endm
-
-.macro kuap_check	current, gpr
-#ifdef CONFIG_PPC_KUAP_DEBUG
-	lwz	\gpr, THREAD + KUAP(\current)
-999:	twnei	\gpr, 0
-	EMIT_BUG_ENTRY 999b, __FILE__, __LINE__, (BUGFLAG_WARNING | BUGFLAG_ONCE)
-#endif
-.endm
-
-#endif /* CONFIG_PPC_KUAP */
-
-#else /* !__ASSEMBLY__ */
+#ifndef __ASSEMBLY__
 
 #ifdef CONFIG_PPC_KUAP
 
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index d4bfe94b4a68..b41cb4e014b2 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -37,6 +37,8 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 		kuep_lock();
 		current->thread.regs = regs;
 		account_cpu_user_entry();
+	} else {
+		kuap_save_and_lock(regs);
 	}
 #endif
 	/*
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index b7efa46b3109..5bbe8f28d26b 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -28,15 +28,6 @@
 
 #ifdef __ASSEMBLY__
 #ifndef CONFIG_PPC_KUAP
-.macro kuap_save_and_lock	sp, thread, gpr1, gpr2, gpr3
-.endm
-
-.macro kuap_restore	sp, current, gpr1, gpr2, gpr3
-.endm
-
-.macro kuap_check	current, gpr
-.endm
-
 .macro kuap_check_amr	gpr1, gpr2
 .endm
 
diff --git a/arch/powerpc/include/asm/nohash/32/kup-8xx.h b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
index c74f5704bc47..fb294dbca102 100644
--- a/arch/powerpc/include/asm/nohash/32/kup-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/kup-8xx.h
@@ -7,30 +7,7 @@
 
 #ifdef CONFIG_PPC_KUAP
 
-#ifdef __ASSEMBLY__
-
-.macro kuap_save_and_lock	sp, thread, gpr1, gpr2, gpr3
-	lis	\gpr2, MD_APG_KUAP@h	/* only APG0 and APG1 are used */
-	mfspr	\gpr1, SPRN_MD_AP
-	mtspr	SPRN_MD_AP, \gpr2
-	stw	\gpr1, STACK_REGS_KUAP(\sp)
-.endm
-
-.macro kuap_restore	sp, current, gpr1, gpr2, gpr3
-	lwz	\gpr1, STACK_REGS_KUAP(\sp)
-	mtspr	SPRN_MD_AP, \gpr1
-.endm
-
-.macro kuap_check	current, gpr
-#ifdef CONFIG_PPC_KUAP_DEBUG
-	mfspr	\gpr, SPRN_MD_AP
-	rlwinm	\gpr, \gpr, 16, 0xffff
-999:	twnei	\gpr, MD_APG_KUAP@h
-	EMIT_BUG_ENTRY 999b, __FILE__, __LINE__, (BUGFLAG_WARNING | BUGFLAG_ONCE)
-#endif
-.endm
-
-#else /* !__ASSEMBLY__ */
+#ifndef __ASSEMBLY__
 
 #include <asm/reg.h>
 
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 850cb17a937f..f5ac021ff9ed 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -52,11 +52,9 @@
 	.globl	prepare_transfer_to_handler
 prepare_transfer_to_handler:
 	andi.	r0,r9,MSR_PR
-	addi	r12, r2, THREAD
 	bnelr
 
 	/* if from kernel, check interrupted DOZE/NAP mode */
-	kuap_save_and_lock r11, r12, r9, r5, r6
 	lwz	r12,TI_LOCAL_FLAGS(r2)
 	mtcrf	0x01,r12
 	bt-	31-TLF_NAPPING,4f
@@ -96,7 +94,6 @@ ret_from_syscall:
 	cmplwi	cr0,r5,0
 	bne-	2f
 #endif /* CONFIG_PPC_47x */
-	kuap_check r2, r4
 	lwz	r4,_LINK(r1)
 	lwz	r5,_CCR(r1)
 	mtlr	r4
@@ -208,7 +205,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_SPE)
 	stw	r10,_CCR(r1)
 	stw	r1,KSP(r3)	/* Set old stack pointer */
 
-	kuap_check r2, r0
 #ifdef CONFIG_SMP
 	/* We need a sync somewhere here to make sure that if the
 	 * previous task gets rescheduled on another CPU, it sees all
@@ -276,7 +272,6 @@ interrupt_return:
 	bne-	.Lrestore_nvgprs
 
 .Lfast_user_interrupt_return:
-	kuap_check r2, r4
 	lwz	r11,_NIP(r1)
 	lwz	r12,_MSR(r1)
 	mtspr	SPRN_SRR0,r11
@@ -326,7 +321,6 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
 .Lfast_kernel_interrupt_return:
 	cmpwi	cr1,r3,0
-	kuap_restore r1, r2, r3, r4, r5
 	lwz	r11,_NIP(r1)
 	lwz	r12,_MSR(r1)
 	mtspr	SPRN_SRR0,r11
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 40ed55064e54..864cf47b629a 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -34,6 +34,9 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	syscall_fn f;
 
 	kuep_lock();
+#ifdef CONFIG_PPC32
+	kuap_save_and_lock(regs);
+#endif
 
 	regs->orig_gpr3 = r3;
 
@@ -75,9 +78,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 			isync();
 	} else
 #endif
-#ifdef CONFIG_PPC64
 		kuap_check();
-#endif
 
 	booke_restore_dbcr0();
 
@@ -253,9 +254,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	CT_WARN_ON(ct_state() == CONTEXT_USER);
 
-#ifdef CONFIG_PPC64
 	kuap_check();
-#endif
 
 	regs->result = r3;
 
@@ -350,7 +349,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	account_cpu_user_exit();
 
-#ifdef CONFIG_PPC_BOOK3S_64 /* BOOK3E and ppc32 not using this */
+#ifndef CONFIG_PPC_BOOK3E_64 /* BOOK3E not using this */
 	/*
 	 * We do this at the end so that we do context switch with KERNEL AMR
 	 */
@@ -379,9 +378,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
 	 * AMR can only have been unlocked if we interrupted the kernel.
 	 */
-#ifdef CONFIG_PPC64
 	kuap_check();
-#endif
 
 	local_irq_save(flags);
 
@@ -438,9 +435,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	/*
 	 * We do this at the end so that we do context switch with KERNEL AMR
 	 */
-#ifdef CONFIG_PPC64
 	kuap_user_restore(regs);
-#endif
 	return ret;
 }
 
@@ -450,9 +445,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 {
 	unsigned long flags;
 	unsigned long ret = 0;
-#ifdef CONFIG_PPC64
 	unsigned long kuap;
-#endif
 
 	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x) &&
 	    unlikely(!(regs->msr & MSR_RI)))
@@ -466,9 +459,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	if (TRAP(regs) != 0x700)
 		CT_WARN_ON(ct_state() == CONTEXT_USER);
 
-#ifdef CONFIG_PPC64
 	kuap = kuap_get_and_check();
-#endif
 
 	if (unlikely(current_thread_info()->flags & _TIF_EMULATE_STACK_STORE)) {
 		clear_bits(_TIF_EMULATE_STACK_STORE, &current_thread_info()->flags);
@@ -510,9 +501,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	 * which would cause Read-After-Write stalls. Hence, we take the AMR
 	 * value from the check above.
 	 */
-#ifdef CONFIG_PPC64
 	kuap_kernel_restore(regs, kuap);
-#endif
 
 	return ret;
 }
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 5d5d64be2679..fd4da71d92d1 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1255,6 +1255,9 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	 */
 	restore_sprs(old_thread, new_thread);
 
+#ifdef CONFIG_PPC32
+	kuap_check();
+#endif
 	last = _switch(old_thread, new_thread);
 
 #ifdef CONFIG_PPC_BOOK3S_64
-- 
2.25.0

