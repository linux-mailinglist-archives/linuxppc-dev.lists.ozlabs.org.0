Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DFF3156C9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 20:33:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZtMv2bs5zDsdK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 06:32:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZtJ10ZKtzDsd5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 06:29:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZtHs2LbZz9v024;
 Tue,  9 Feb 2021 20:29:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4ZJ02CN5yFsV; Tue,  9 Feb 2021 20:29:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZtHs1Q4sz9v021;
 Tue,  9 Feb 2021 20:29:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 19BBC8B7EA;
 Tue,  9 Feb 2021 20:29:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BvQkVmX7CEoF; Tue,  9 Feb 2021 20:29:28 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BCF8E8B764;
 Tue,  9 Feb 2021 20:29:28 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 97FD267382; Tue,  9 Feb 2021 19:29:28 +0000 (UTC)
Message-Id: <1a7515f9258b27a9177de88491a8bb79b255ceb7.1612898425.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1612898425.git.christophe.leroy@csgroup.eu>
References: <cover.1612898425.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v6 2/2] powerpc/32: Handle bookE debugging in C in syscall
 entry/exit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Tue,  9 Feb 2021 19:29:28 +0000 (UTC)
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

The handling of SPRN_DBCR0 and other registers can easily
be done in C instead of ASM.

For that, create booke_load_dbcr0() and booke_restore_dbcr0().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v5: New
v6: Refactor into helpers
---
 arch/powerpc/include/asm/interrupt.h | 12 ++++++++
 arch/powerpc/include/asm/reg_booke.h |  3 ++
 arch/powerpc/kernel/entry_32.S       |  7 -----
 arch/powerpc/kernel/head_32.h        | 15 ----------
 arch/powerpc/kernel/head_booke.h     | 19 -------------
 arch/powerpc/kernel/interrupt.c      | 41 ++++++++++++++++++----------
 6 files changed, 42 insertions(+), 55 deletions(-)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index 4badb3e51c19..e62c37915bbe 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -14,6 +14,18 @@ struct interrupt_state {
 #endif
 };
 
+static inline void booke_restore_dbcr0(void)
+{
+#ifdef CONFIG_PPC_ADV_DEBUG_REGS
+	unsigned long dbcr0 = current->thread.debug.dbcr0;
+
+	if (IS_ENABLED(CONFIG_PPC32) && unlikely(dbcr0 & DBCR0_IDM)) {
+		mtspr(SPRN_DBSR, -1);
+		mtspr(SPRN_DBCR0, global_dbcr0[smp_processor_id()]);
+	}
+#endif
+}
+
 static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
 {
 	/*
diff --git a/arch/powerpc/include/asm/reg_booke.h b/arch/powerpc/include/asm/reg_booke.h
index 262782f08fd4..17b8dcd9a40d 100644
--- a/arch/powerpc/include/asm/reg_booke.h
+++ b/arch/powerpc/include/asm/reg_booke.h
@@ -691,6 +691,9 @@
 #define mttmr(rn, v)	asm volatile(MTTMR(rn, %0) : \
 				     : "r" ((unsigned long)(v)) \
 				     : "memory")
+
+extern unsigned long global_dbcr0[];
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_POWERPC_REG_BOOKE_H__ */
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 9dd90be9f8a5..78c430b7f9d9 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -343,13 +343,6 @@ ret_from_syscall:
 	addi    r4,r1,STACK_FRAME_OVERHEAD
 	li	r5,0
 	bl	syscall_exit_prepare
-#if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
-	/* If the process has its own DBCR0 value, load it up.  The internal
-	   debug mode bit tells us that dbcr0 should be loaded. */
-	lwz	r0,THREAD+THREAD_DBCR0(r2)
-	andis.	r10,r0,DBCR0_IDM@h
-	bnel-	load_dbcr0
-#endif
 #ifdef CONFIG_PPC_47x
 	lis	r4,icache_44x_need_flush@ha
 	lwz	r5,icache_44x_need_flush@l(r4)
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index 1afad7bc3395..5d4706c14572 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -153,21 +153,6 @@
 	SAVE_4GPRS(3, r11)
 	SAVE_2GPRS(7, r11)
 	addi	r2,r12,-THREAD
-#if defined(CONFIG_40x)
-	/* Check to see if the dbcr0 register is set up to debug.  Use the
-	   internal debug mode bit to do this. */
-	lwz	r12,THREAD_DBCR0(r12)
-	andis.	r12,r12,DBCR0_IDM@h
-	beq+	3f
-	/* From user and task is ptraced - load up global dbcr0 */
-	li	r12,-1			/* clear all pending debug events */
-	mtspr	SPRN_DBSR,r12
-	lis	r11,global_dbcr0@ha
-	addi	r11,r11,global_dbcr0@l
-	lwz	r12,0(r11)
-	mtspr	SPRN_DBCR0,r12
-3:
-#endif
 	b	transfer_to_syscall		/* jump to handler */
 .endm
 
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index 5f565232b99d..47857795f50a 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -130,25 +130,6 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	SAVE_2GPRS(7, r11)
 
 	addi	r2,r10,-THREAD
-	/* Check to see if the dbcr0 register is set up to debug.  Use the
-	   internal debug mode bit to do this. */
-	lwz	r12,THREAD_DBCR0(r10)
-	andis.	r12,r12,DBCR0_IDM@h
-	beq+	3f
-	/* From user and task is ptraced - load up global dbcr0 */
-	li	r12,-1			/* clear all pending debug events */
-	mtspr	SPRN_DBSR,r12
-	lis	r11,global_dbcr0@ha
-	addi	r11,r11,global_dbcr0@l
-#ifdef CONFIG_SMP
-	lwz	r10, TASK_CPU(r2)
-	slwi	r10, r10, 2
-	add	r11, r11, r10
-#endif
-	lwz	r12,0(r11)
-	mtspr	SPRN_DBCR0,r12
-
-3:
 	b	transfer_to_syscall	/* jump to handler */
 .endm
 
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 75d657b63332..f93664ad4a5e 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -73,6 +73,8 @@ notrace long system_call_exception(long r3, long r4, long r5,
 		kuap_check_amr();
 #endif
 
+	booke_restore_dbcr0();
+
 	account_cpu_user_entry();
 
 	account_stolen_time();
@@ -204,6 +206,28 @@ static notrace inline bool prep_irq_for_enabled_exit(bool clear_ri, bool irqs_en
 	return false;
 }
 
+static notrace void booke_load_dbcr0(void)
+{
+#ifdef CONFIG_PPC_ADV_DEBUG_REGS
+	unsigned long dbcr0 = current->thread.debug.dbcr0;
+
+	if (likely(!(dbcr0 & DBCR0_IDM)))
+		return;
+
+	/*
+	 * Check to see if the dbcr0 register is set up to debug.
+	 * Use the internal debug mode bit to do this.
+	 */
+	mtmsr(mfmsr() & ~MSR_DE);
+	if (IS_ENABLED(CONFIG_PPC32)) {
+		isync();
+		global_dbcr0[smp_processor_id()] = mfspr(SPRN_DBCR0);
+	}
+	mtspr(SPRN_DBCR0, dbcr0);
+	mtspr(SPRN_DBSR, -1);
+#endif
+}
+
 /*
  * This should be called after a syscall returns, with r3 the return value
  * from the syscall. If this function returns non-zero, the system call
@@ -317,6 +341,8 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	local_paca->tm_scratch = regs->msr;
 #endif
 
+	booke_load_dbcr0();
+
 	account_cpu_user_exit();
 
 #ifdef CONFIG_PPC_BOOK3S_64 /* BOOK3E and ppc32 not using this */
@@ -331,9 +357,6 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 #ifndef CONFIG_PPC_BOOK3E_64 /* BOOK3E not yet using this */
 notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
 {
-#ifdef CONFIG_PPC_BOOK3E
-	struct thread_struct *ts = &current->thread;
-#endif
 	unsigned long *ti_flagsp = &current_thread_info()->flags;
 	unsigned long ti_flags;
 	unsigned long flags;
@@ -398,17 +421,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 		goto again;
 	}
 
-#ifdef CONFIG_PPC_BOOK3E
-	if (unlikely(ts->debug.dbcr0 & DBCR0_IDM)) {
-		/*
-		 * Check to see if the dbcr0 register is set up to debug.
-		 * Use the internal debug mode bit to do this.
-		 */
-		mtmsr(mfmsr() & ~MSR_DE);
-		mtspr(SPRN_DBCR0, ts->debug.dbcr0);
-		mtspr(SPRN_DBSR, -1);
-	}
-#endif
+	booke_load_dbcr0();
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	local_paca->tm_scratch = regs->msr;
-- 
2.25.0

