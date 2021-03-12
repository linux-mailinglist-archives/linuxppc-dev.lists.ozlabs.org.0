Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CC8338E32
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Mar 2021 14:03:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DxmGP4Kbvz3jKF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Mar 2021 00:03:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dxlzb5k9sz3dDy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Mar 2021 23:50:51 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DxlzX3ShPz9ttBW;
 Fri, 12 Mar 2021 13:50:48 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4s_OwRj3g-BO; Fri, 12 Mar 2021 13:50:48 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DxlzX2Vy6z9ttBV;
 Fri, 12 Mar 2021 13:50:48 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 58E1A8B812;
 Fri, 12 Mar 2021 13:50:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OWb5sQ33KRHi; Fri, 12 Mar 2021 13:50:49 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 00CA28B764;
 Fri, 12 Mar 2021 13:50:48 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C62C2675C9; Fri, 12 Mar 2021 12:50:48 +0000 (UTC)
Message-Id: <f82614d9b17b83abd739aa18fc08811815d0c2e3.1615552867.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1615552866.git.christophe.leroy@csgroup.eu>
References: <cover.1615552866.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 38/41] powerpc/64s: Make kuap_check_amr() and
 kuap_get_and_check_amr() generic
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Fri, 12 Mar 2021 12:50:48 +0000 (UTC)
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

In preparation of porting powerpc32 to C syscall entry/exit,
rename kuap_check_amr() and kuap_get_and_check_amr() as
kuap_assert_locked() and kuap_get_and_assert_locked(), and move in the
generic asm/kup.h the stub for when CONFIG_PPC_KUAP is not selected.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 24 ++----------------------
 arch/powerpc/include/asm/kup.h           | 10 +++++++++-
 arch/powerpc/kernel/interrupt.c          | 12 ++++++------
 arch/powerpc/kernel/irq.c                |  2 +-
 4 files changed, 18 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index 8bd905050896..9700da3a4093 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -287,7 +287,7 @@ static inline void kuap_kernel_restore(struct pt_regs *regs,
 	 */
 }
 
-static inline unsigned long kuap_get_and_check_amr(void)
+static inline unsigned long kuap_get_and_assert_locked(void)
 {
 	if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP)) {
 		unsigned long amr = mfspr(SPRN_AMR);
@@ -298,27 +298,7 @@ static inline unsigned long kuap_get_and_check_amr(void)
 	return 0;
 }
 
-#else /* CONFIG_PPC_PKEY */
-
-static inline void kuap_user_restore(struct pt_regs *regs)
-{
-}
-
-static inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long amr)
-{
-}
-
-static inline unsigned long kuap_get_and_check_amr(void)
-{
-	return 0;
-}
-
-#endif /* CONFIG_PPC_PKEY */
-
-
-#ifdef CONFIG_PPC_KUAP
-
-static inline void kuap_check_amr(void)
+static inline void kuap_assert_locked(void)
 {
 	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
 		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index 25671f711ec2..aa5f77459311 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -74,7 +74,15 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 	return false;
 }
 
-static inline void kuap_check_amr(void) { }
+static inline void kuap_assert_locked(void) { }
+static inline void kuap_save_and_lock(struct pt_regs *regs) { }
+static inline void kuap_user_restore(struct pt_regs *regs) { }
+static inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long amr) { }
+
+static inline unsigned long kuap_get_and_assert_locked(void)
+{
+	return 0;
+}
 
 /*
  * book3s/64/kup-radix.h defines these functions for the !KUAP case to flush
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 20ace874cd98..a7cb511bf945 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -76,7 +76,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	} else
 #endif
 #ifdef CONFIG_PPC64
-		kuap_check_amr();
+		kuap_assert_locked();
 #endif
 
 	booke_restore_dbcr0();
@@ -254,7 +254,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 	CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 #ifdef CONFIG_PPC64
-	kuap_check_amr();
+	kuap_assert_locked();
 #endif
 
 	regs->result = r3;
@@ -380,7 +380,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	 * AMR can only have been unlocked if we interrupted the kernel.
 	 */
 #ifdef CONFIG_PPC64
-	kuap_check_amr();
+	kuap_assert_locked();
 #endif
 
 	local_irq_save(flags);
@@ -451,7 +451,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	unsigned long flags;
 	unsigned long ret = 0;
 #ifdef CONFIG_PPC64
-	unsigned long amr;
+	unsigned long kuap;
 #endif
 
 	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x) &&
@@ -467,7 +467,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 		CT_WARN_ON(ct_state() == CONTEXT_USER);
 
 #ifdef CONFIG_PPC64
-	amr = kuap_get_and_check_amr();
+	kuap = kuap_get_and_assert_locked();
 #endif
 
 	if (unlikely(current_thread_info()->flags & _TIF_EMULATE_STACK_STORE)) {
@@ -511,7 +511,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	 * value from the check above.
 	 */
 #ifdef CONFIG_PPC64
-	kuap_kernel_restore(regs, amr);
+	kuap_kernel_restore(regs, kuap);
 #endif
 
 	return ret;
diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
index d71fd10a1dd4..5b72abbff96c 100644
--- a/arch/powerpc/kernel/irq.c
+++ b/arch/powerpc/kernel/irq.c
@@ -282,7 +282,7 @@ static inline void replay_soft_interrupts_irqrestore(void)
 	 * and re-locking AMR but we shouldn't get here in the first place,
 	 * hence the warning.
 	 */
-	kuap_check_amr();
+	kuap_assert_locked();
 
 	if (kuap_state != AMR_KUAP_BLOCKED)
 		set_kuap(AMR_KUAP_BLOCKED);
-- 
2.25.0

