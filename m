Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DEF338E26
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 14:03:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxmG24c4Dz3jCq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Mar 2021 00:03:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DxlzZ68m6z3dSP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 23:50:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DxlzW3kgWz9ttBY;
 Fri, 12 Mar 2021 13:50:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RipOKhsnmeBu; Fri, 12 Mar 2021 13:50:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DxlzW2Typz9ttBW;
 Fri, 12 Mar 2021 13:50:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4FC458B764;
 Fri, 12 Mar 2021 13:50:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id V4QRpsnD5N-h; Fri, 12 Mar 2021 13:50:48 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E742C8B812;
 Fri, 12 Mar 2021 13:50:47 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BD065675C9; Fri, 12 Mar 2021 12:50:47 +0000 (UTC)
Message-Id: <4eadd873927e9a73c3d1dfe2f9497353465514cf.1615552867.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615552866.git.christophe.leroy@csgroup.eu>
References: <cover.1615552866.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 37/41] powerpc/32s: Move KUEP locking/unlocking in C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri, 12 Mar 2021 12:50:47 +0000 (UTC)
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

This can be done in C, do it.

Unrolling the loop gains approx. 15% performance.

From now on, prepare_transfer_to_handler() is only for
interrupts from kernel.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h | 31 -------------------
 arch/powerpc/include/asm/interrupt.h     |  6 +++-
 arch/powerpc/include/asm/kup.h           |  8 +++++
 arch/powerpc/kernel/entry_32.S           | 16 ----------
 arch/powerpc/kernel/head_32.h            |  3 ++
 arch/powerpc/kernel/head_booke.h         |  3 ++
 arch/powerpc/kernel/interrupt.c          |  4 +++
 arch/powerpc/mm/book3s32/Makefile        |  1 +
 arch/powerpc/mm/book3s32/kuep.c          | 38 ++++++++++++++++++++++++
 9 files changed, 62 insertions(+), 48 deletions(-)
 create mode 100644 arch/powerpc/mm/book3s32/kuep.c

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 73bc5d2c431d..b97ea60f6fa3 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -7,37 +7,6 @@
 
 #ifdef __ASSEMBLY__
 
-.macro kuep_update_sr	gpr1, gpr2		/* NEVER use r0 as gpr2 due to addis */
-101:	mtsrin	\gpr1, \gpr2
-	addi	\gpr1, \gpr1, 0x111		/* next VSID */
-	rlwinm	\gpr1, \gpr1, 0, 0xf0ffffff	/* clear VSID overflow */
-	addis	\gpr2, \gpr2, 0x1000		/* address of next segment */
-	bdnz	101b
-	isync
-.endm
-
-.macro kuep_lock	gpr1, gpr2
-#ifdef CONFIG_PPC_KUEP
-	li	\gpr1, NUM_USER_SEGMENTS
-	li	\gpr2, 0
-	mtctr	\gpr1
-	mfsrin	\gpr1, \gpr2
-	oris	\gpr1, \gpr1, SR_NX@h		/* set Nx */
-	kuep_update_sr \gpr1, \gpr2
-#endif
-.endm
-
-.macro kuep_unlock	gpr1, gpr2
-#ifdef CONFIG_PPC_KUEP
-	li	\gpr1, NUM_USER_SEGMENTS
-	li	\gpr2, 0
-	mtctr	\gpr1
-	mfsrin	\gpr1, \gpr2
-	rlwinm	\gpr1, \gpr1, 0, ~SR_NX		/* Clear Nx */
-	kuep_update_sr \gpr1, \gpr2
-#endif
-.endm
-
 #ifdef CONFIG_PPC_KUAP
 
 .macro kuap_update_sr	gpr1, gpr2, gpr3	/* NEVER use r0 as gpr2 due to addis */
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 861e6eadc98c..857375309255 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -33,8 +33,10 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 	if (!arch_irq_disabled_regs(regs))
 		trace_hardirqs_off();
 
-	if (user_mode(regs))
+	if (user_mode(regs)) {
+		kuep_lock();
 		account_cpu_user_entry();
+	}
 #endif
 	/*
 	 * Book3E reconciles irq soft mask in asm
@@ -89,6 +91,8 @@ static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt
 	exception_exit(state->ctx_state);
 #endif
 
+	if (user_mode(regs))
+		kuep_unlock();
 	/*
 	 * Book3S exits to user via interrupt_exit_user_prepare(), which does
 	 * context tracking, which is a cleaner way to handle PREEMPT=y
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 7ec21af49a45..25671f711ec2 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -55,6 +55,14 @@ void setup_kuep(bool disabled);
 static inline void setup_kuep(bool disabled) { }
 #endif /* CONFIG_PPC_KUEP */
 
+#if defined(CONFIG_PPC_KUEP) && defined(CONFIG_PPC_BOOK3S_32)
+void kuep_lock(void);
+void kuep_unlock(void);
+#else
+static inline void kuep_lock(void) { }
+static inline void kuep_unlock(void) { }
+#endif
+
 #ifdef CONFIG_PPC_KUAP
 void setup_kuap(bool disabled);
 #else
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 44d0eddf8738..112d6247c391 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -51,16 +51,9 @@
 #if defined(CONFIG_PPC_BOOK3S_32) || defined(CONFIG_E500)
 	.globl	prepare_transfer_to_handler
 prepare_transfer_to_handler:
-	andi.	r12,r9,MSR_PR
 	addi	r12,r2,THREAD
-	beq	2f
-#ifdef CONFIG_PPC_BOOK3S_32
-	kuep_lock r11, r12
-#endif
-	blr
 
 	/* if from kernel, check interrupted DOZE/NAP mode */
-2:
 	kuap_save_and_lock r11, r12, r9, r5, r6
 	lwz	r12,TI_LOCAL_FLAGS(r2)
 	mtcrf	0x01,r12
@@ -86,9 +79,6 @@ _ASM_NOKPROBE_SYMBOL(prepare_transfer_to_handler)
 	.globl	transfer_to_syscall
 transfer_to_syscall:
 	SAVE_NVGPRS(r1)
-#ifdef CONFIG_PPC_BOOK3S_32
-	kuep_lock r11, r12
-#endif
 
 	/* Calling convention has r9 = orig r0, r10 = regs */
 	addi	r10,r1,STACK_FRAME_OVERHEAD
@@ -105,9 +95,6 @@ ret_from_syscall:
 	cmplwi	cr0,r5,0
 	bne-	2f
 #endif /* CONFIG_PPC_47x */
-#ifdef CONFIG_PPC_BOOK3S_32
-	kuep_unlock r5, r7
-#endif
 	kuap_check r2, r4
 	lwz	r4,_LINK(r1)
 	lwz	r5,_CCR(r1)
@@ -311,9 +298,6 @@ interrupt_return:
 	bne-	.Lrestore_nvgprs
 
 .Lfast_user_interrupt_return:
-#ifdef CONFIG_PPC_BOOK3S_32
-	kuep_unlock	r10, r11
-#endif
 	kuap_check r2, r4
 	lwz	r11,_NIP(r1)
 	lwz	r12,_MSR(r1)
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index c018fcdf9157..a8221ddcbd66 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -133,7 +133,10 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 
 .macro prepare_transfer_to_handler
 #ifdef CONFIG_PPC_BOOK3S_32
+	andi.	r12,r9,MSR_PR
+	bne	777f
 	bl	prepare_transfer_to_handler
+777:
 #endif
 .endm
 
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index cb96ae002af6..f82470091697 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -105,7 +105,10 @@ END_BTB_FLUSH_SECTION
 
 .macro prepare_transfer_to_handler
 #ifdef CONFIG_E500
+	andi.	r12,r9,MSR_PR
+	bne	777f
 	bl	prepare_transfer_to_handler
+777:
 #endif
 .endm
 
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 6875b82f613a..20ace874cd98 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -33,6 +33,8 @@ notrace long system_call_exception(long r3, long r4, long r5,
 {
 	syscall_fn f;
 
+	kuep_lock();
+
 	regs->orig_gpr3 = r3;
 
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
@@ -354,6 +356,8 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	 */
 	kuap_user_restore(regs);
 #endif
+	kuep_unlock();
+
 	return ret;
 }
 
diff --git a/arch/powerpc/mm/book3s32/Makefile b/arch/powerpc/mm/book3s32/Makefile
index 446d9de88ce4..7f0c8a78ba0c 100644
--- a/arch/powerpc/mm/book3s32/Makefile
+++ b/arch/powerpc/mm/book3s32/Makefile
@@ -9,3 +9,4 @@ endif
 obj-y += mmu.o mmu_context.o
 obj-$(CONFIG_PPC_BOOK3S_603) += nohash_low.o
 obj-$(CONFIG_PPC_BOOK3S_604) += hash_low.o tlb.o
+obj-$(CONFIG_PPC_KUEP) += kuep.o
diff --git a/arch/powerpc/mm/book3s32/kuep.c b/arch/powerpc/mm/book3s32/kuep.c
new file mode 100644
index 000000000000..c70532568a28
--- /dev/null
+++ b/arch/powerpc/mm/book3s32/kuep.c
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+#include <asm/reg.h>
+#include <asm/task_size_32.h>
+#include <asm/mmu.h>
+
+#define KUEP_UPDATE_TWO_USER_SEGMENTS(n) do {		\
+	if (TASK_SIZE > ((n) << 28))			\
+		mtsr(val1, (n) << 28);			\
+	if (TASK_SIZE > (((n) + 1) << 28))		\
+		mtsr(val2, ((n) + 1) << 28);		\
+	val1 = (val1 + 0x222) & 0xf0ffffff;		\
+	val2 = (val2 + 0x222) & 0xf0ffffff;		\
+} while (0)
+
+static __always_inline void kuep_update(u32 val)
+{
+	int val1 = val;
+	int val2 = (val + 0x111) & 0xf0ffffff;
+
+	KUEP_UPDATE_TWO_USER_SEGMENTS(0);
+	KUEP_UPDATE_TWO_USER_SEGMENTS(2);
+	KUEP_UPDATE_TWO_USER_SEGMENTS(4);
+	KUEP_UPDATE_TWO_USER_SEGMENTS(6);
+	KUEP_UPDATE_TWO_USER_SEGMENTS(8);
+	KUEP_UPDATE_TWO_USER_SEGMENTS(10);
+	KUEP_UPDATE_TWO_USER_SEGMENTS(12);
+	KUEP_UPDATE_TWO_USER_SEGMENTS(14);
+}
+
+void kuep_lock(void)
+{
+	kuep_update(mfsr(0) | SR_NX);
+}
+
+void kuep_unlock(void)
+{
+	kuep_update(mfsr(0) & ~SR_NX);
+}
-- 
2.25.0

