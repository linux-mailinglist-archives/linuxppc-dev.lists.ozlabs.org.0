Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C9C3026A8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 16:05:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPY7v4TgvzDqwT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 02:05:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPXmR5v8DzDqfY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 01:48:23 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DPXmD6kwDz9v0Gt;
 Mon, 25 Jan 2021 15:48:12 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id BIT-ayrxheUd; Mon, 25 Jan 2021 15:48:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DPXmD5tfnz9v0Gh;
 Mon, 25 Jan 2021 15:48:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4EF3D8B79E;
 Mon, 25 Jan 2021 15:48:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZzVE4RS9--hq; Mon, 25 Jan 2021 15:48:18 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0FFC98B79B;
 Mon, 25 Jan 2021 15:48:18 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0566766AD8; Mon, 25 Jan 2021 14:48:17 +0000 (UTC)
Message-Id: <0f0efde4b821684f848a644c9b8eb3cf39852382.1611585031.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1611585031.git.christophe.leroy@csgroup.eu>
References: <cover.1611585031.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 05/23] powerpc/64s: Make kuap_check_amr() and
 kuap_get_and_check_amr() generic
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Mon, 25 Jan 2021 14:48:17 +0000 (UTC)
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
rename kuap_check_amr() and kuap_get_and_check_amr() as kuap_check()
and kuap_get_and_check(), and move in the generic asm/kup.h the stub
for when CONFIG_PPC_KUAP is not selected.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/kup.h | 24 ++----------------------
 arch/powerpc/include/asm/kup.h           |  9 ++++++++-
 arch/powerpc/kernel/syscall_64.c         | 12 ++++++------
 3 files changed, 16 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
index f50f72e535aa..1507681ad4ef 100644
--- a/arch/powerpc/include/asm/book3s/64/kup.h
+++ b/arch/powerpc/include/asm/book3s/64/kup.h
@@ -281,7 +281,7 @@ static inline void kuap_kernel_restore(struct pt_regs *regs,
 	 */
 }
 
-static inline unsigned long kuap_get_and_check_amr(void)
+static inline unsigned long kuap_get_and_check(void)
 {
 	if (mmu_has_feature(MMU_FTR_BOOK3S_KUAP)) {
 		unsigned long amr = mfspr(SPRN_AMR);
@@ -292,27 +292,7 @@ static inline unsigned long kuap_get_and_check_amr(void)
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
+static inline void kuap_check(void)
 {
 	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_BOOK3S_KUAP))
 		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index bf221a2a523e..6ef9f9cfbed0 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -66,7 +66,14 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
 	return false;
 }
 
-static inline void kuap_check_amr(void) { }
+static inline void kuap_check(void) { }
+static inline void kuap_user_restore(struct pt_regs *regs) { }
+static inline void kuap_kernel_restore(struct pt_regs *regs, unsigned long amr) { }
+
+static inline unsigned long kuap_get_and_check(void)
+{
+	return 0;
+}
 
 /*
  * book3s/64/kup-radix.h defines these functions for the !KUAP case to flush
diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
index 32f72965da26..b627a6384029 100644
--- a/arch/powerpc/kernel/syscall_64.c
+++ b/arch/powerpc/kernel/syscall_64.c
@@ -65,7 +65,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 			isync();
 	} else
 #endif
-		kuap_check_amr();
+		kuap_check();
 
 	account_cpu_user_entry();
 
@@ -181,7 +181,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
 
 	CT_WARN_ON(ct_state() == CONTEXT_USER);
 
-	kuap_check_amr();
+	kuap_check();
 
 	regs->result = r3;
 
@@ -303,7 +303,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	 * We don't need to restore AMR on the way back to userspace for KUAP.
 	 * AMR can only have been unlocked if we interrupted the kernel.
 	 */
-	kuap_check_amr();
+	kuap_check();
 
 	local_irq_save(flags);
 
@@ -381,7 +381,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	unsigned long *ti_flagsp = &current_thread_info()->flags;
 	unsigned long flags;
 	unsigned long ret = 0;
-	unsigned long amr;
+	unsigned long kuap;
 
 	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && unlikely(!(regs->msr & MSR_RI)))
 		unrecoverable_exception(regs);
@@ -394,7 +394,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	if (TRAP(regs) != 0x700)
 		CT_WARN_ON(ct_state() == CONTEXT_USER);
 
-	amr = kuap_get_and_check_amr();
+	kuap = kuap_get_and_check();
 
 	if (unlikely(*ti_flagsp & _TIF_EMULATE_STACK_STORE)) {
 		clear_bits(_TIF_EMULATE_STACK_STORE, ti_flagsp);
@@ -446,7 +446,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	 * which would cause Read-After-Write stalls. Hence, we take the AMR
 	 * value from the check above.
 	 */
-	kuap_kernel_restore(regs, amr);
+	kuap_kernel_restore(regs, kuap);
 
 	return ret;
 }
-- 
2.25.0

