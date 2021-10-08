Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C96426E07
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 17:47:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQsxz1rNKz3fBG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 02:47:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQsr160M6z3c5Q
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 02:41:53 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HQsqB15sbz9sSs;
 Fri,  8 Oct 2021 17:41:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vYln2UgY0vyZ; Fri,  8 Oct 2021 17:41:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HQspy0TN7z9sSt;
 Fri,  8 Oct 2021 17:40:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id ED1DE8B786;
 Fri,  8 Oct 2021 17:40:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wUKC2Cyx2kUQ; Fri,  8 Oct 2021 17:40:57 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.75])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF4138B796;
 Fri,  8 Oct 2021 17:40:56 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 198FemVA1129643
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 8 Oct 2021 17:40:48 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 198FemnF1129642;
 Fri, 8 Oct 2021 17:40:48 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 01/16] powerpc/32s: Do kuep_lock() and kuep_unlock() in
 assembly
Date: Fri,  8 Oct 2021 17:40:29 +0200
Message-Id: <61213a3f0bb490f5988afe25de333c4edf55f5be.1633707305.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1633707305.git.christophe.leroy@csgroup.eu>
References: <cover.1633707305.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When interrupt and syscall entries where converted to C, KUEP locking
and unlocking was also converted. It improved performance by unrolling
the loop, and allowed easily implementing boot time deactivation of
KUEP.

However, null_syscall selftest shows that KUEP is still heavy
(361 cycles with KUEP, 212 cycles without).

A way to improve more is to group 'mtsr's together, instead of
repeating 'addi' + 'mtsr' several times.

In order to do that, more registers need to be available. In C, GCC
will always be able to provide the requested number of registers, but
at the cost of saving some data on the stack, which is counter
performant here.

So let's do it in assembly, when we have full control of which
register can be used. It also has the advantage of locking earlier
and unlocking later and it helps GCC generating less tricky code.
The only drawback is to make boot time deactivation less straight
forward and require 'hand' instruction patching.

Group 'mtsr's by 4.

With this change, null_syscall selftest reports 336 cycles. Without
the change it was 361 cycles, that's a 7% reduction.

For the time being, capability to deactivate at boot time is disabled.
It will be re-enabled in following patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/32/kup.h      | 34 --------
 arch/powerpc/include/asm/book3s/32/mmu-hash.h | 77 ++++++++++++++++++-
 arch/powerpc/include/asm/interrupt.h          |  6 +-
 arch/powerpc/include/asm/kup.h                |  5 --
 arch/powerpc/kernel/entry_32.S                | 31 ++++++++
 arch/powerpc/kernel/head_32.h                 |  6 ++
 arch/powerpc/kernel/interrupt.c               |  3 -
 arch/powerpc/mm/book3s32/kuep.c               |  7 +-
 8 files changed, 121 insertions(+), 48 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 9f38040f0641..ff3d0bd39a06 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -24,40 +24,6 @@ static __always_inline bool kuep_is_disabled(void)
 	return !IS_ENABLED(CONFIG_PPC_KUEP) || static_branch_unlikely(&disable_kuep_key);
 }
 
-static inline void kuep_lock(void)
-{
-	if (kuep_is_disabled())
-		return;
-
-	update_user_segments(mfsr(0) | SR_NX);
-	/*
-	 * This isync() shouldn't be necessary as the kernel is not excepted to
-	 * run any instruction in userspace soon after the update of segments,
-	 * but hash based cores (at least G3) seem to exhibit a random
-	 * behaviour when the 'isync' is not there. 603 cores don't have this
-	 * behaviour so don't do the 'isync' as it saves several CPU cycles.
-	 */
-	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
-		isync();	/* Context sync required after mtsr() */
-}
-
-static inline void kuep_unlock(void)
-{
-	if (kuep_is_disabled())
-		return;
-
-	update_user_segments(mfsr(0) & ~SR_NX);
-	/*
-	 * This isync() shouldn't be necessary as a 'rfi' will soon be executed
-	 * to return to userspace, but hash based cores (at least G3) seem to
-	 * exhibit a random behaviour when the 'isync' is not there. 603 cores
-	 * don't have this behaviour so don't do the 'isync' as it saves several
-	 * CPU cycles.
-	 */
-	if (mmu_has_feature(MMU_FTR_HPTE_TABLE))
-		isync();	/* Context sync required after mtsr() */
-}
-
 #ifdef CONFIG_PPC_KUAP
 
 #include <linux/sched.h>
diff --git a/arch/powerpc/include/asm/book3s/32/mmu-hash.h b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
index f5be185cbdf8..e2f7ccc13edb 100644
--- a/arch/powerpc/include/asm/book3s/32/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/32/mmu-hash.h
@@ -64,7 +64,82 @@ struct ppc_bat {
 #define SR_KP	0x20000000	/* User key */
 #define SR_KS	0x40000000	/* Supervisor key */
 
-#ifndef __ASSEMBLY__
+#ifdef __ASSEMBLY__
+
+#include <asm/asm-offsets.h>
+
+.macro uus_addi sr reg1 reg2 imm
+	.if NUM_USER_SEGMENTS > \sr
+	addi	\reg1,\reg2,\imm
+	.endif
+.endm
+
+.macro uus_mtsr sr reg1
+	.if NUM_USER_SEGMENTS > \sr
+	mtsr	\sr, \reg1
+	.endif
+.endm
+
+/*
+ * This isync() shouldn't be necessary as the kernel is not excepted to run
+ * any instruction in userspace soon after the update of segments and 'rfi'
+ * instruction is used to return to userspace, but hash based cores
+ * (at least G3) seem to exhibit a random behaviour when the 'isync' is not
+ * there. 603 cores don't have this behaviour so don't do the 'isync' as it
+ * saves several CPU cycles.
+ */
+.macro uus_isync
+#ifdef CONFIG_PPC_BOOK3S_604
+BEGIN_MMU_FTR_SECTION
+	isync
+END_MMU_FTR_SECTION_IFSET(MMU_FTR_HPTE_TABLE)
+#endif
+.endm
+
+.macro update_user_segments_by_4 tmp1 tmp2 tmp3 tmp4
+	uus_addi	1, \tmp2, \tmp1, 0x111
+	uus_addi	2, \tmp3, \tmp1, 0x222
+	uus_addi	3, \tmp4, \tmp1, 0x333
+
+	uus_mtsr	0, \tmp1
+	uus_mtsr	1, \tmp2
+	uus_mtsr	2, \tmp3
+	uus_mtsr	3, \tmp4
+
+	uus_addi	4, \tmp1, \tmp1, 0x444
+	uus_addi	5, \tmp2, \tmp2, 0x444
+	uus_addi	6, \tmp3, \tmp3, 0x444
+	uus_addi	7, \tmp4, \tmp4, 0x444
+
+	uus_mtsr	4, \tmp1
+	uus_mtsr	5, \tmp2
+	uus_mtsr	6, \tmp3
+	uus_mtsr	7, \tmp4
+
+	uus_addi	8, \tmp1, \tmp1, 0x444
+	uus_addi	9, \tmp2, \tmp2, 0x444
+	uus_addi	10, \tmp3, \tmp3, 0x444
+	uus_addi	11, \tmp4, \tmp4, 0x444
+
+	uus_mtsr	8, \tmp1
+	uus_mtsr	9, \tmp2
+	uus_mtsr	10, \tmp3
+	uus_mtsr	11, \tmp4
+
+	uus_addi	12, \tmp1, \tmp1, 0x444
+	uus_addi	13, \tmp2, \tmp2, 0x444
+	uus_addi	14, \tmp3, \tmp3, 0x444
+	uus_addi	15, \tmp4, \tmp4, 0x444
+
+	uus_mtsr	12, \tmp1
+	uus_mtsr	13, \tmp2
+	uus_mtsr	14, \tmp3
+	uus_mtsr	15, \tmp4
+
+	uus_isync
+.endm
+
+#else
 
 /*
  * This macro defines the mapping from contexts to VSIDs (virtual
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index a1d238255f07..3bbca1fbbe1e 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -139,12 +139,10 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
 	if (!arch_irq_disabled_regs(regs))
 		trace_hardirqs_off();
 
-	if (user_mode(regs)) {
-		kuep_lock();
+	if (user_mode(regs))
 		account_cpu_user_entry();
-	} else {
+	else
 		kuap_save_and_lock(regs);
-	}
 #endif
 
 #ifdef CONFIG_PPC64
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 1df763002726..34ff86e3686e 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -38,11 +38,6 @@ void setup_kuep(bool disabled);
 static inline void setup_kuep(bool disabled) { }
 #endif /* CONFIG_PPC_KUEP */
 
-#ifndef CONFIG_PPC_BOOK3S_32
-static inline void kuep_lock(void) { }
-static inline void kuep_unlock(void) { }
-#endif
-
 #ifdef CONFIG_PPC_KUAP
 void setup_kuap(bool disabled);
 #else
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 61fdd53cdd9a..4ba6a8c43475 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -73,6 +73,34 @@ prepare_transfer_to_handler:
 _ASM_NOKPROBE_SYMBOL(prepare_transfer_to_handler)
 #endif /* CONFIG_PPC_BOOK3S_32 || CONFIG_E500 */
 
+#if defined(CONFIG_PPC_KUEP) && defined(CONFIG_PPC_BOOK3S_32)
+	.globl	__kuep_lock
+__kuep_lock:
+	mfsr    r9,0
+	rlwinm  r9,r9,0,8,3
+	oris    r9,r9,SR_NX@h
+	update_user_segments_by_4 r9, r10, r11, r12
+	blr
+
+__kuep_unlock:
+	mfsr    r9,0
+	rlwinm  r9,r9,0,8,2
+	update_user_segments_by_4 r9, r10, r11, r12
+	blr
+
+.macro	kuep_lock
+	bl	__kuep_lock
+.endm
+.macro	kuep_unlock
+	bl	__kuep_unlock
+.endm
+#else
+.macro	kuep_lock
+.endm
+.macro	kuep_unlock
+.endm
+#endif
+
 	.globl	transfer_to_syscall
 transfer_to_syscall:
 	stw	r11, GPR1(r1)
@@ -94,6 +122,7 @@ transfer_to_syscall:
 	SAVE_2GPRS(7, r1)
 	addi	r2,r10,-THREAD
 	SAVE_NVGPRS(r1)
+	kuep_lock
 
 	/* Calling convention has r9 = orig r0, r10 = regs */
 	addi	r10,r1,STACK_FRAME_OVERHEAD
@@ -110,6 +139,7 @@ ret_from_syscall:
 	cmplwi	cr0,r5,0
 	bne-	2f
 #endif /* CONFIG_PPC_47x */
+	kuep_unlock
 	lwz	r4,_LINK(r1)
 	lwz	r5,_CCR(r1)
 	mtlr	r4
@@ -273,6 +303,7 @@ interrupt_return:
 	beq	.Lkernel_interrupt_return
 	bl	interrupt_exit_user_prepare
 	cmpwi	r3,0
+	kuep_unlock
 	bne-	.Lrestore_nvgprs
 
 .Lfast_user_interrupt_return:
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 6b1ec9e3541b..133197039775 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -136,6 +136,12 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
 	andi.	r12,r9,MSR_PR
 	bne	777f
 	bl	prepare_transfer_to_handler
+#ifdef CONFIG_PPC_KUEP
+	b	778f
+777:
+	bl	__kuep_lock
+778:
+#endif
 777:
 #endif
 .endm
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index de10a2697258..0d12aa66e1f9 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -81,8 +81,6 @@ notrace long system_call_exception(long r3, long r4, long r5,
 {
 	syscall_fn f;
 
-	kuep_lock();
-
 	regs->orig_gpr3 = r3;
 
 	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
@@ -406,7 +404,6 @@ interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
 
 	/* Restore user access locks last */
 	kuap_user_restore(regs);
-	kuep_unlock();
 
 	return ret;
 }
diff --git a/arch/powerpc/mm/book3s32/kuep.c b/arch/powerpc/mm/book3s32/kuep.c
index c20733d6e02c..45c9967f9aef 100644
--- a/arch/powerpc/mm/book3s32/kuep.c
+++ b/arch/powerpc/mm/book3s32/kuep.c
@@ -7,8 +7,13 @@ struct static_key_false disable_kuep_key;
 
 void setup_kuep(bool disabled)
 {
+	if (disabled) {
+		pr_info("KUEP cannot be disabled for the time being\n");
+		disabled = false;
+	}
+
 	if (!disabled)
-		kuep_lock();
+		update_user_segments(mfsr(0) | SR_NX);
 
 	if (smp_processor_id() != boot_cpuid)
 		return;
-- 
2.31.1

