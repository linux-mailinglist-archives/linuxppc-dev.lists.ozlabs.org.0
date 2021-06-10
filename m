Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DACC3A2FF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 17:59:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G17vC0JPJz3bth
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 01:59:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G17tp6xdGz307l
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 01:58:39 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G17tg617CzBCQr;
 Thu, 10 Jun 2021 17:58:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rrp_wFE1o9kL; Thu, 10 Jun 2021 17:58:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G17tg579XzBCB8;
 Thu, 10 Jun 2021 17:58:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F1C38B81E;
 Thu, 10 Jun 2021 17:58:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 30l8isz-zIYT; Thu, 10 Jun 2021 17:58:35 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E5DD48B81C;
 Thu, 10 Jun 2021 17:58:34 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B7ED264C8C; Thu, 10 Jun 2021 15:58:34 +0000 (UTC)
Message-Id: <a069a348ee3c2fe3123a5a93695c2b35dc42cb40.1623340691.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/signal32: Remove impossible #ifdef combinations
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 10 Jun 2021 15:58:34 +0000 (UTC)
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

PPC_TRANSACTIONAL_MEM is only on book3s/64
SPE is only on booke

PPC_TRANSACTIONAL_MEM selects ALTIVEC and VSX

Therefore, within PPC_TRANSACTIONAL_MEM sections,
ALTIVEC and VSX are always defined while SPE never is.

Remove all SPE code and all #ifdef ALTIVEC and VSX in tm
functions.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 55 ---------------------------------
 1 file changed, 55 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 8f05ed0da292..c3f14d0f31f5 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -354,14 +354,8 @@ static void prepare_save_tm_user_regs(void)
 {
 	WARN_ON(tm_suspend_disabled);
 
-#ifdef CONFIG_ALTIVEC
 	if (cpu_has_feature(CPU_FTR_ALTIVEC))
 		current->thread.ckvrsave = mfspr(SPRN_VRSAVE);
-#endif
-#ifdef CONFIG_SPE
-	if (current->thread.used_spe)
-		flush_spe_to_thread(current);
-#endif
 }
 
 static int save_tm_user_regs_unsafe(struct pt_regs *regs, struct mcontext __user *frame,
@@ -379,7 +373,6 @@ static int save_tm_user_regs_unsafe(struct pt_regs *regs, struct mcontext __user
 	 */
 	unsafe_put_user((msr >> 32), &tm_frame->mc_gregs[PT_MSR], failed);
 
-#ifdef CONFIG_ALTIVEC
 	/* save altivec registers */
 	if (current->thread.used_vr) {
 		unsafe_copy_to_user(&frame->mc_vregs, &current->thread.ckvr_state,
@@ -412,7 +405,6 @@ static int save_tm_user_regs_unsafe(struct pt_regs *regs, struct mcontext __user
 	else
 		unsafe_put_user(current->thread.ckvrsave,
 				(u32 __user *)&tm_frame->mc_vregs[32], failed);
-#endif /* CONFIG_ALTIVEC */
 
 	unsafe_copy_ckfpr_to_user(&frame->mc_fregs, current, failed);
 	if (msr & MSR_FP)
@@ -420,7 +412,6 @@ static int save_tm_user_regs_unsafe(struct pt_regs *regs, struct mcontext __user
 	else
 		unsafe_copy_ckfpr_to_user(&tm_frame->mc_fregs, current, failed);
 
-#ifdef CONFIG_VSX
 	/*
 	 * Copy VSR 0-31 upper half from thread_struct to local
 	 * buffer, then write that to userspace.  Also set MSR_VSX in
@@ -436,23 +427,6 @@ static int save_tm_user_regs_unsafe(struct pt_regs *regs, struct mcontext __user
 
 		msr |= MSR_VSX;
 	}
-#endif /* CONFIG_VSX */
-#ifdef CONFIG_SPE
-	/* SPE regs are not checkpointed with TM, so this section is
-	 * simply the same as in __unsafe_save_user_regs().
-	 */
-	if (current->thread.used_spe) {
-		unsafe_copy_to_user(&frame->mc_vregs, current->thread.evr,
-				    ELF_NEVRREG * sizeof(u32), failed);
-		/* set MSR_SPE in the saved MSR value to indicate that
-		 * frame->mc_vregs contains valid data */
-		msr |= MSR_SPE;
-	}
-
-	/* We always copy to/from spefscr */
-	unsafe_put_user(current->thread.spefscr,
-			(u32 __user *)&frame->mc_vregs + ELF_NEVRREG, failed);
-#endif /* CONFIG_SPE */
 
 	unsafe_put_user(msr, &frame->mc_gregs[PT_MSR], failed);
 
@@ -587,9 +561,7 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 				 struct mcontext __user *tm_sr)
 {
 	unsigned long msr, msr_hi;
-#ifdef CONFIG_VSX
 	int i;
-#endif
 
 	if (tm_suspend_disabled)
 		return 1;
@@ -610,7 +582,6 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 	/* Restore the previous little-endian mode */
 	regs->msr = (regs->msr & ~MSR_LE) | (msr & MSR_LE);
 
-#ifdef CONFIG_ALTIVEC
 	regs->msr &= ~MSR_VEC;
 	if (msr & MSR_VEC) {
 		/* restore altivec registers from the stack */
@@ -629,13 +600,11 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 			(u32 __user *)&sr->mc_vregs[32], failed);
 	if (cpu_has_feature(CPU_FTR_ALTIVEC))
 		mtspr(SPRN_VRSAVE, current->thread.ckvrsave);
-#endif /* CONFIG_ALTIVEC */
 
 	regs->msr &= ~(MSR_FP | MSR_FE0 | MSR_FE1);
 
 	unsafe_copy_fpr_from_user(current, &sr->mc_fregs, failed);
 
-#ifdef CONFIG_VSX
 	regs->msr &= ~MSR_VSX;
 	if (msr & MSR_VSX) {
 		/*
@@ -649,24 +618,6 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 			current->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] = 0;
 			current->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET] = 0;
 		}
-#endif /* CONFIG_VSX */
-
-#ifdef CONFIG_SPE
-	/* SPE regs are not checkpointed with TM, so this section is
-	 * simply the same as in restore_user_regs().
-	 */
-	regs->msr &= ~MSR_SPE;
-	if (msr & MSR_SPE) {
-		unsafe_copy_from_user(current->thread.evr, &sr->mc_vregs,
-				      ELF_NEVRREG * sizeof(u32), failed);
-		current->thread.used_spe = true;
-	} else if (current->thread.used_spe)
-		memset(current->thread.evr, 0, ELF_NEVRREG * sizeof(u32));
-
-	/* Always get SPEFSCR back */
-	unsafe_get_user(current->thread.spefscr,
-			(u32 __user *)&sr->mc_vregs + ELF_NEVRREG, failed);
-#endif /* CONFIG_SPE */
 
 	user_read_access_end();
 
@@ -675,7 +626,6 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 
 	unsafe_restore_general_regs(regs, tm_sr, failed);
 
-#ifdef CONFIG_ALTIVEC
 	/* restore altivec registers from the stack */
 	if (msr & MSR_VEC)
 		unsafe_copy_from_user(&current->thread.vr_state, &tm_sr->mc_vregs,
@@ -684,11 +634,9 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 	/* Always get VRSAVE back */
 	unsafe_get_user(current->thread.vrsave,
 			(u32 __user *)&tm_sr->mc_vregs[32], failed);
-#endif /* CONFIG_ALTIVEC */
 
 	unsafe_copy_ckfpr_from_user(current, &tm_sr->mc_fregs, failed);
 
-#ifdef CONFIG_VSX
 	if (msr & MSR_VSX) {
 		/*
 		 * Restore altivec registers from the stack to a local
@@ -697,7 +645,6 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 		unsafe_copy_vsx_from_user(current, &tm_sr->mc_vsregs, failed);
 		current->thread.used_vsr = true;
 	}
-#endif /* CONFIG_VSX */
 
 	/* Get the top half of the MSR from the user context */
 	unsafe_get_user(msr_hi, &tm_sr->mc_gregs[PT_MSR], failed);
@@ -742,12 +689,10 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 		load_fp_state(&current->thread.fp_state);
 		regs->msr |= (MSR_FP | current->thread.fpexc_mode);
 	}
-#ifdef CONFIG_ALTIVEC
 	if (msr & MSR_VEC) {
 		load_vr_state(&current->thread.vr_state);
 		regs->msr |= MSR_VEC;
 	}
-#endif
 
 	preempt_enable();
 
-- 
2.25.0

