Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F66A6058
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 06:53:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MvjQ2fmbzDqjH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 14:53:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Mvb80nVnzDqdd
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 14:48:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="pCEuEO3p"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 46Mvb74Bxyz9sNk;
 Tue,  3 Sep 2019 14:48:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1567486083;
 bh=b/ZyXjomRhANhQj4NFKFvhnldObaDi5E+xx6u8K89RY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pCEuEO3pF0R2oG6tno9ny9Rwv6IRxGBuVW50AeHoA9MnVAoyTBidw5lSki2Dos+Pn
 5WFsoZzrcxY4OjF0YrKT4y8ORJ5WtUMK1DuEvG6erdbGcgBGhQ6PSnZL7YPuqrYnoB
 XEUZ5e0m+/GcUy76ldrEn0y4w17zrp+eGBF9Ud3meg2AmTsplwz/x4VggG5C0zkYyE
 fTuO1lJN4b0t73DBViH7woISvtdSmUXFvHmqRt+Hq7IuVPZemWSwmVdzBCueHd5/oi
 Vjq17Mm6L1ZUcmWEk31YUYJxYwBDZALjV6+ZNrUNk8rAOj7Lh2fhLm4jaC3+XauoOC
 ll4LsV8eR0YbQ==
Received: by neuling.org (Postfix, from userid 1000)
 id 858DC2A581F; Tue,  3 Sep 2019 14:48:03 +1000 (AEST)
From: Michael Neuling <mikey@neuling.org>
To: mpe@ellerman.id.au
Subject: [PATCH 2/3] powerpc/tm: Fix restoring FP/VMX facility incorrectly on
 interrupts
Date: Tue,  3 Sep 2019 14:47:17 +1000
Message-Id: <20190903044718.13773-2-mikey@neuling.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903044718.13773-1-mikey@neuling.org>
References: <20190903044718.13773-1-mikey@neuling.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, cyrilbur@gmail.com,
 Gustavo Romero <gromero@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Gustavo Romero <gromero@linux.ibm.com>

When in userspace and MSR FP=0 the hardware FP state is unrelated to
the current process. This is extended for transactions where if tbegin
is run with FP=0, the hardware checkpoint FP state will also be
unrelated to the current process. Due to this, we need to ensure this
hardware checkpoint is updated with the correct state before we enable
FP for this process.

Unfortunately we get this wrong when returning to a process from a
hardware interrupt. A process that starts a transaction with FP=0 can
take an interrupt. When the kernel returns back to that process, we
change to FP=1 but with hardware checkpoint FP state not updated. If
this transaction is then rolled back, the FP registers now contain the
wrong state.

The process looks like this:
   Userspace:                      Kernel

               Start userspace
                with MSR FP=0 TM=1
                  < -----
   ...
   tbegin
   bne
               Hardware interrupt
                   ---- >
                                    <do_IRQ...>
                                    ....
                                    ret_from_except
                                      restore_math()
				        /* sees FP=0 */
                                        restore_fp()
                                          tm_active_with_fp()
					    /* sees FP=1 (Incorrect) */
                                          load_fp_state()
                                        FP = 0 -> 1
                  < -----
               Return to userspace
                 with MSR TM=1 FP=1
                 with junk in the FP TM checkpoint
   TM rollback
   reads FP junk

When returning from the hardware exception, tm_active_with_fp() is
incorrectly making restore_fp() call load_fp_state() which is setting
FP=1.

The fix is to remove tm_active_with_fp().

tm_active_with_fp() is attempting to handle the case where FP state
has been changed inside a transaction. In this case the checkpointed
and transactional FP state is different and hence we must restore the
FP state (ie. we can't do lazy FP restore inside a transaction that's
used FP). It's safe to remove tm_active_with_fp() as this case is
handled by restore_tm_state(). restore_tm_state() detects if FP has
been using inside a transaction and will set load_fp and call
restore_math() to ensure the FP state (checkpoint and transaction) is
restored.

This is a data integrity problem for the current process as the FP
registers are corrupted. It's also a security problem as the FP
registers from one process may be leaked to another.

Similarly for VMX.

A simple testcase to replicate this will be posted to
tools/testing/selftests/powerpc/tm/tm-poison.c

This fixes CVE-2019-15031.

Fixes: a7771176b439 ("powerpc: Don't enable FP/Altivec if not checkpointed")
Cc: stable@vger.kernel.org # 4.15+
Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
Signed-off-by: Michael Neuling <mikey@neuling.org>
---
 arch/powerpc/kernel/process.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 437b57068c..7a84c9f177 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -101,21 +101,8 @@ static void check_if_tm_restore_required(struct task_struct *tsk)
 	}
 }
 
-static bool tm_active_with_fp(struct task_struct *tsk)
-{
-	return MSR_TM_ACTIVE(tsk->thread.regs->msr) &&
-		(tsk->thread.ckpt_regs.msr & MSR_FP);
-}
-
-static bool tm_active_with_altivec(struct task_struct *tsk)
-{
-	return MSR_TM_ACTIVE(tsk->thread.regs->msr) &&
-		(tsk->thread.ckpt_regs.msr & MSR_VEC);
-}
 #else
 static inline void check_if_tm_restore_required(struct task_struct *tsk) { }
-static inline bool tm_active_with_fp(struct task_struct *tsk) { return false; }
-static inline bool tm_active_with_altivec(struct task_struct *tsk) { return false; }
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
 bool strict_msr_control;
@@ -252,7 +239,7 @@ EXPORT_SYMBOL(enable_kernel_fp);
 
 static int restore_fp(struct task_struct *tsk)
 {
-	if (tsk->thread.load_fp || tm_active_with_fp(tsk)) {
+	if (tsk->thread.load_fp) {
 		load_fp_state(&current->thread.fp_state);
 		current->thread.load_fp++;
 		return 1;
@@ -334,8 +321,7 @@ EXPORT_SYMBOL_GPL(flush_altivec_to_thread);
 
 static int restore_altivec(struct task_struct *tsk)
 {
-	if (cpu_has_feature(CPU_FTR_ALTIVEC) &&
-		(tsk->thread.load_vec || tm_active_with_altivec(tsk))) {
+	if (cpu_has_feature(CPU_FTR_ALTIVEC) && (tsk->thread.load_vec)) {
 		load_vr_state(&tsk->thread.vr_state);
 		tsk->thread.used_vr = 1;
 		tsk->thread.load_vec++;
-- 
2.21.0

