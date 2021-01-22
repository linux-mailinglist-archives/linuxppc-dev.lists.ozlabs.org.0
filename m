Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F56300057
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 11:33:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMbF738XxzDrQX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 21:32:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMZdf0JLFzDrdd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 21:05:41 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DMZdY3rBkz9vBnS;
 Fri, 22 Jan 2021 11:05:37 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sZ2PAgaNq3IA; Fri, 22 Jan 2021 11:05:37 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DMZdY2lprz9vBml;
 Fri, 22 Jan 2021 11:05:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 96B888B818;
 Fri, 22 Jan 2021 11:05:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TKUXSiuhpCba; Fri, 22 Jan 2021 11:05:38 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E3268B817;
 Fri, 22 Jan 2021 11:05:38 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 251AD66AAE; Fri, 22 Jan 2021 10:05:38 +0000 (UTC)
Message-Id: <663a615fc7e962ca8740898112512806ae0eeb73.1611309841.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1611309841.git.christophe.leroy@csgroup.eu>
References: <cover.1611309841.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 14/14] powerpc/32: Use fast instructions to change MSR
 EE/RI when available
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri, 22 Jan 2021 10:05:38 +0000 (UTC)
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

Booke and 40x have wrtee and wrteei to quickly change MSR EE.

8xx has registers SPRN_NRI, SPRN_EID and SPRN_EIE for changing
MSR EE and RI.

Use them in syscall and exception handler when possible.

On an 8xx, it reduces the null_syscall test by 6 cycles (Two
instances are changed in this patch, meaning we win 3 cycles
per place).

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/hw_irq.h | 46 +++++++++++++++++++++++++++++++
 arch/powerpc/kernel/entry_32.S    | 26 ++++++-----------
 arch/powerpc/kernel/head_32.h     | 13 +++++----
 arch/powerpc/kernel/head_booke.h  |  9 ++----
 4 files changed, 66 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
index 0363734ff56e..899aa457e143 100644
--- a/arch/powerpc/include/asm/hw_irq.h
+++ b/arch/powerpc/include/asm/hw_irq.h
@@ -368,6 +368,52 @@ static inline void may_hard_irq_enable(void) { }
 
 #define ARCH_IRQ_INIT_FLAGS	IRQ_NOREQUEST
 
+#else	/* __ASSEMBLY__ */
+
+.macro __hard_irq_enable tmp
+#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+	wrteei	1
+#elif defined(CONFIG_PPC_8xx)
+	mtspr	SPRN_EIE, r2	/* RI=1, EE=1 */
+#else
+	LOAD_REG_IMMEDIATE(\tmp, MSR_KERNEL | MSR_EE)
+	mtmsr   \tmp
+#endif
+.endm
+
+.macro __hard_irq_disable tmp
+#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+	wrteei	0
+#elif defined(CONFIG_PPC_8xx)
+	mtspr	SPRN_EID, r2	/* RI=1, EE=0 */
+#else
+	LOAD_REG_IMMEDIATE(\tmp, MSR_KERNEL)
+	mtmsr   \tmp
+#endif
+.endm
+
+.macro __hard_EE_RI_disable tmp
+#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+	wrteei	0
+#elif defined(CONFIG_PPC_8xx)
+	mtspr	SPRN_NRI, r2	/* RI=0, EE=0 */
+#else
+	LOAD_REG_IMMEDIATE(\tmp, MSR_KERNEL & ~MSR_RI)
+	mtmsr   \tmp
+#endif
+.endm
+
+.macro __hard_RI_enable tmp
+#if defined(CONFIG_BOOKE) || defined(CONFIG_40x)
+	/* nop */
+#elif defined(CONFIG_PPC_8xx)
+	mtspr	SPRN_EID, r2	/* RI=1, EE=0 */
+#else
+	LOAD_REG_IMMEDIATE(\tmp, MSR_KERNEL)
+	mtmsr   \tmp
+#endif
+.endm
+
 #endif  /* __ASSEMBLY__ */
 #endif	/* __KERNEL__ */
 #endif	/* _ASM_POWERPC_HW_IRQ_H */
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 6e70c6fdfe8a..a9c3974cb95d 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -303,8 +303,7 @@ trace_syscall_entry_irq_off:
 	bl	trace_hardirqs_on
 
 	/* Now enable for real */
-	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL | MSR_EE)
-	mtmsr	r10
+	__hard_irq_enable r10
 
 	REST_GPR(0, r1)
 	REST_4GPRS(3, r1)
@@ -373,9 +372,8 @@ ret_from_syscall:
 #endif
 	mr	r6,r3
 	/* disable interrupts so current_thread_info()->flags can't change */
-	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL)	/* doesn't include MSR_EE */
+	__hard_irq_disable r10
 	/* Note: We don't bother telling lockdep about it */
-	mtmsr	r10
 	lwz	r9,TI_FLAGS(r2)
 	li	r8,-MAX_ERRNO
 	andi.	r0,r9,(_TIF_SYSCALL_DOTRACE|_TIF_SINGLESTEP|_TIF_USER_WORK_MASK|_TIF_PERSYSCALL_MASK)
@@ -529,8 +527,7 @@ syscall_exit_work:
 	/* Re-enable interrupts. There is no need to trace that with
 	 * lockdep as we are supposed to have IRQs on at this point
 	 */
-	ori	r10,r10,MSR_EE
-	mtmsr	r10
+	__hard_irq_enable r10
 
 	/* Save NVGPRS if they're not saved already */
 	lwz	r4,_TRAP(r1)
@@ -812,8 +809,7 @@ ret_from_except:
 	 * can't change between when we test it and when we return
 	 * from the interrupt. */
 	/* Note: We don't bother telling lockdep about it */
-	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL)
-	mtmsr	r10		/* disable interrupts */
+	__hard_irq_disable r10
 
 	lwz	r3,_MSR(r1)	/* Returning to user mode? */
 	andi.	r0,r3,MSR_PR
@@ -971,8 +967,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
 	 * can restart the exception exit path at the label
 	 * exc_exit_restart below.  -- paulus
 	 */
-	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL & ~MSR_RI)
-	mtmsr	r10		/* clear the RI bit */
+	__hard_EE_RI_disable r10
+
 	.globl exc_exit_restart
 exc_exit_restart:
 	lwz	r12,_NIP(r1)
@@ -1206,26 +1202,22 @@ do_work:			/* r10 contains MSR_KERNEL here */
 do_resched:			/* r10 contains MSR_KERNEL here */
 #ifdef CONFIG_TRACE_IRQFLAGS
 	bl	trace_hardirqs_on
-	mfmsr	r10
 #endif
-	ori	r10,r10,MSR_EE
-	mtmsr	r10		/* hard-enable interrupts */
+	__hard_irq_enable r10
 	bl	schedule
 recheck:
 	/* Note: And we don't tell it we are disabling them again
 	 * neither. Those disable/enable cycles used to peek at
 	 * TI_FLAGS aren't advertised.
 	 */
-	LOAD_REG_IMMEDIATE(r10,MSR_KERNEL)
-	mtmsr	r10		/* disable interrupts */
+	__hard_irq_disable r10
 	lwz	r9,TI_FLAGS(r2)
 	andi.	r0,r9,_TIF_NEED_RESCHED
 	bne-	do_resched
 	andi.	r0,r9,_TIF_USER_WORK_MASK
 	beq	restore_user
 do_user_signal:			/* r10 contains MSR_KERNEL here */
-	ori	r10,r10,MSR_EE
-	mtmsr	r10		/* hard-enable interrupts */
+	__hard_irq_enable r10
 	/* save r13-r31 in the exception frame, if not already done */
 	lwz	r3,_TRAP(r1)
 	andi.	r0,r3,1
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 98ed5b928642..69fded26c024 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -3,6 +3,7 @@
 #define __HEAD_32_H__
 
 #include <asm/ptrace.h>	/* for STACK_FRAME_REGS_MARKER */
+#include <asm/hw_irq.h>
 
 /*
  * Exception entry code.  This code runs with address translation
@@ -89,10 +90,8 @@
 	lwz	r12, SRR0(r12)
 #ifdef CONFIG_40x
 	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
-#else
-	li	r10, MSR_KERNEL		/* can take exceptions */
-	mtmsr	r10			/* (except for mach check in rtas) */
 #endif
+	__hard_RI_enable r10
 	stw	r0,GPR0(r11)
 	lis	r10,STACK_FRAME_REGS_MARKER@ha /* exception frame marker */
 	addi	r10,r10,STACK_FRAME_REGS_MARKER@l
@@ -173,12 +172,16 @@
 	 * otherwise we might risk taking an interrupt before we tell lockdep
 	 * they are enabled.
 	 */
+#ifdef CONFIG_40x
+	wrtee	r9
+#else
 	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL)
 	rlwimi	r10, r9, 0, MSR_EE
+	mtmsr	r10
+#endif
 #else
-	LOAD_REG_IMMEDIATE(r10, MSR_KERNEL | MSR_EE)
+	__hard_irq_enable r10
 #endif
-	mtmsr	r10
 	b	transfer_to_syscall		/* jump to handler */
 99:	b	ret_from_kernel_syscall
 .endm
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 2e3cb1cc42fb..f9da3ea9e7aa 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -5,6 +5,7 @@
 #include <asm/ptrace.h>	/* for STACK_FRAME_REGS_MARKER */
 #include <asm/kvm_asm.h>
 #include <asm/kvm_booke_hv_asm.h>
+#include <asm/hw_irq.h>
 
 #ifdef __ASSEMBLY__
 
@@ -163,14 +164,10 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	 * otherwise we might risk taking an interrupt before we tell lockdep
 	 * they are enabled.
 	 */
-	lis	r10, MSR_KERNEL@h
-	ori	r10, r10, MSR_KERNEL@l
-	rlwimi	r10, r9, 0, MSR_EE
+	wrtee	r9
 #else
-	lis	r10, (MSR_KERNEL | MSR_EE)@h
-	ori	r10, r10, (MSR_KERNEL | MSR_EE)@l
+	__hard_irq_enable r10
 #endif
-	mtmsr	r10
 	b	transfer_to_syscall	/* jump to handler */
 99:	b	ret_from_kernel_syscall
 .endm
-- 
2.25.0

