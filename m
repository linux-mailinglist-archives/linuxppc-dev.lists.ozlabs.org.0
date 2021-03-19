Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 408DD341B27
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 12:09:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F21PP29qlz304X
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 22:09:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F21LZ3wW9z3bwh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 22:07:02 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F21LV1R7Mz9tx93;
 Fri, 19 Mar 2021 12:06:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xgCZn_Gk_RmZ; Fri, 19 Mar 2021 12:06:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F21LV0gkNz9tx8s;
 Fri, 19 Mar 2021 12:06:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 490E48B976;
 Fri, 19 Mar 2021 12:06:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6HdoHjNpKFG3; Fri, 19 Mar 2021 12:06:58 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 665AE8B977;
 Fri, 19 Mar 2021 12:06:57 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E3D84675FF; Fri, 19 Mar 2021 11:06:56 +0000 (UTC)
Message-Id: <7c518b9a4c8e5ae9a3bfb647bc8b20bf820233af.1616151715.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616151715.git.christophe.leroy@csgroup.eu>
References: <cover.1616151715.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 07/10] powerpc/signal32: Reorder user reads in
 restore_tm_user_regs()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 cmr@codefail.de
Date: Fri, 19 Mar 2021 11:06:56 +0000 (UTC)
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

In restore_tm_user_regs(), regroup the reads from 'sr' and the ones
from 'tm_sr' together in order to allow two block user accesses
in following patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 49 +++++++++++++++++++++++++--------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index e2b1d2a0abad..088c83853026 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -607,8 +607,7 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 	 * TFHAR is restored from the checkpointed NIP; TEXASR and TFIAR
 	 * were set by the signal delivery.
 	 */
-	err = restore_general_regs(regs, tm_sr);
-	err |= restore_general_regs(&current->thread.ckpt_regs, sr);
+	err = restore_general_regs(&current->thread.ckpt_regs, sr);
 
 	err |= __get_user(current->thread.tm_tfhar, &sr->mc_gregs[PT_NIP]);
 
@@ -624,9 +623,6 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 	if (msr & MSR_VEC) {
 		/* restore altivec registers from the stack */
 		if (__copy_from_user(&current->thread.ckvr_state, &sr->mc_vregs,
-				     sizeof(sr->mc_vregs)) ||
-		    __copy_from_user(&current->thread.vr_state,
-				     &tm_sr->mc_vregs,
 				     sizeof(sr->mc_vregs)))
 			return 1;
 		current->thread.used_vr = true;
@@ -639,9 +635,7 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 
 	/* Always get VRSAVE back */
 	if (__get_user(current->thread.ckvrsave,
-		       (u32 __user *)&sr->mc_vregs[32]) ||
-	    __get_user(current->thread.vrsave,
-		       (u32 __user *)&tm_sr->mc_vregs[32]))
+		       (u32 __user *)&sr->mc_vregs[32]))
 		return 1;
 	if (cpu_has_feature(CPU_FTR_ALTIVEC))
 		mtspr(SPRN_VRSAVE, current->thread.ckvrsave);
@@ -649,8 +643,7 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 
 	regs->msr &= ~(MSR_FP | MSR_FE0 | MSR_FE1);
 
-	if (copy_fpr_from_user(current, &sr->mc_fregs) ||
-	    copy_ckfpr_from_user(current, &tm_sr->mc_fregs))
+	if (copy_fpr_from_user(current, &sr->mc_fregs))
 		return 1;
 
 #ifdef CONFIG_VSX
@@ -660,8 +653,7 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 		 * Restore altivec registers from the stack to a local
 		 * buffer, then write this out to the thread_struct
 		 */
-		if (copy_vsx_from_user(current, &tm_sr->mc_vsregs) ||
-		    copy_ckvsx_from_user(current, &sr->mc_vsregs))
+		if (copy_ckvsx_from_user(current, &sr->mc_vsregs))
 			return 1;
 		current->thread.used_vsr = true;
 	} else if (current->thread.used_vsr)
@@ -690,6 +682,39 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 		return 1;
 #endif /* CONFIG_SPE */
 
+	err = restore_general_regs(regs, tm_sr);
+	if (err)
+		return 1;
+
+#ifdef CONFIG_ALTIVEC
+	/* restore altivec registers from the stack */
+	if (msr & MSR_VEC)
+		if (__copy_from_user(&current->thread.vr_state,
+				     &tm_sr->mc_vregs,
+				     sizeof(sr->mc_vregs)))
+			return 1;
+
+	/* Always get VRSAVE back */
+	if (__get_user(current->thread.vrsave,
+		       (u32 __user *)&tm_sr->mc_vregs[32]))
+		return 1;
+#endif /* CONFIG_ALTIVEC */
+
+	if (copy_ckfpr_from_user(current, &tm_sr->mc_fregs))
+		return 1;
+
+#ifdef CONFIG_VSX
+	if (msr & MSR_VSX) {
+		/*
+		 * Restore altivec registers from the stack to a local
+		 * buffer, then write this out to the thread_struct
+		 */
+		if (copy_vsx_from_user(current, &tm_sr->mc_vsregs))
+			return 1;
+		current->thread.used_vsr = true;
+	}
+#endif /* CONFIG_VSX */
+
 	/* Get the top half of the MSR from the user context */
 	if (__get_user(msr_hi, &tm_sr->mc_gregs[PT_MSR]))
 		return 1;
-- 
2.25.0

