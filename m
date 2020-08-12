Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2890D242985
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 14:42:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRTqD29DQzDqfj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 22:42:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRT1s5nsDzDqZb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 22:06:09 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BRT1n2lDTzB09Zj;
 Wed, 12 Aug 2020 14:06:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ci0e97ISQBUD; Wed, 12 Aug 2020 14:06:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BRT1n1vxSzB09Zf;
 Wed, 12 Aug 2020 14:06:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 84E8D8B828;
 Wed, 12 Aug 2020 14:06:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id a0sbNNuZ183H; Wed, 12 Aug 2020 14:06:06 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 001548B7FC;
 Wed, 12 Aug 2020 14:06:05 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id D6A8C65C34; Wed, 12 Aug 2020 12:06:05 +0000 (UTC)
Message-Id: <79113c39409e0bfa2def8ae5f43001abfaa8a6a8.1597233555.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597233555.git.christophe.leroy@csgroup.eu>
References: <cover.1597233555.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 14/19] powerpc/signal32: Switch save_user_regs() and
 save_tm_user_regs() to user_access_begin() logic
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ldv@altlinux.org, viro@zeniv.linux.org.uk
Date: Wed, 12 Aug 2020 12:06:05 +0000 (UTC)
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

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 168 ++++++++++++++++----------------
 1 file changed, 84 insertions(+), 84 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 2c3d5d4400ec..0d076c2a9f6c 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -98,7 +98,7 @@ static inline int get_sigset_t(sigset_t *set,
 #define to_user_ptr(p)		ptr_to_compat(p)
 #define from_user_ptr(p)	compat_ptr(p)
 
-static inline int save_general_regs(struct pt_regs *regs,
+static __always_inline int save_general_regs(struct pt_regs *regs,
 		struct mcontext __user *frame)
 {
 	elf_greg_t64 *gregs = (elf_greg_t64 *)regs;
@@ -113,10 +113,12 @@ static inline int save_general_regs(struct pt_regs *regs,
 		else
 			val = gregs[i];
 
-		if (__put_user(val, &frame->mc_gregs[i]))
-			return -EFAULT;
+		unsafe_put_user(val, &frame->mc_gregs[i], failed);
 	}
 	return 0;
+
+failed:
+	return 1;
 }
 
 static inline int restore_general_regs(struct pt_regs *regs,
@@ -151,11 +153,15 @@ static inline int get_sigset_t(sigset_t *set, const sigset_t __user *uset)
 #define to_user_ptr(p)		((unsigned long)(p))
 #define from_user_ptr(p)	((void __user *)(p))
 
-static inline int save_general_regs(struct pt_regs *regs,
+static __always_inline int save_general_regs(struct pt_regs *regs,
 		struct mcontext __user *frame)
 {
 	WARN_ON(!FULL_REGS(regs));
-	return __copy_to_user(&frame->mc_gregs, regs, GP_REGS_SIZE);
+	unsafe_copy_to_user(&frame->mc_gregs, regs, GP_REGS_SIZE, failed);
+	return 0;
+
+failed:
+	return 1;
 }
 
 static inline int restore_general_regs(struct pt_regs *regs,
@@ -258,16 +264,18 @@ static int save_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
 		flush_spe_to_thread(current);
 #endif
 
+	if (!user_write_access_begin(frame, sizeof(*frame)))
+		return 1;
+
 	/* save general registers */
 	if (save_general_regs(regs, frame))
-		return 1;
+		goto failed;
 
 #ifdef CONFIG_ALTIVEC
 	/* save altivec registers */
 	if (current->thread.used_vr) {
-		if (__copy_to_user(&frame->mc_vregs, &current->thread.vr_state,
-				   ELF_NVRREG * sizeof(vector128)))
-			return 1;
+		unsafe_copy_to_user(&frame->mc_vregs, &current->thread.vr_state,
+				    ELF_NVRREG * sizeof(vector128), failed);
 		/* set MSR_VEC in the saved MSR value to indicate that
 		   frame->mc_vregs contains valid data */
 		msr |= MSR_VEC;
@@ -280,11 +288,9 @@ static int save_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
 	 * most significant bits of that same vector. --BenH
 	 * Note that the current VRSAVE value is in the SPR at this point.
 	 */
-	if (__put_user(current->thread.vrsave, (u32 __user *)&frame->mc_vregs[32]))
-		return 1;
+	unsafe_put_user(current->thread.vrsave, (u32 __user *)&frame->mc_vregs[32], failed);
 #endif /* CONFIG_ALTIVEC */
-	if (copy_fpr_to_user(&frame->mc_fregs, current))
-		return 1;
+	unsafe_copy_fpr_to_user(&frame->mc_fregs, current, failed);
 
 	/*
 	 * Clear the MSR VSX bit to indicate there is no valid state attached
@@ -299,17 +305,15 @@ static int save_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
 	 * contains valid data
 	 */
 	if (current->thread.used_vsr && ctx_has_vsx_region) {
-		if (copy_vsx_to_user(&frame->mc_vsregs, current))
-			return 1;
+		unsafe_copy_vsx_to_user(&frame->mc_vsregs, current, failed);
 		msr |= MSR_VSX;
 	}
 #endif /* CONFIG_VSX */
 #ifdef CONFIG_SPE
 	/* save spe registers */
 	if (current->thread.used_spe) {
-		if (__copy_to_user(&frame->mc_vregs, current->thread.evr,
-				   ELF_NEVRREG * sizeof(u32)))
-			return 1;
+		unsafe_copy_to_user(&frame->mc_vregs, current->thread.evr,
+				    ELF_NEVRREG * sizeof(u32)), failed);
 		/* set MSR_SPE in the saved MSR value to indicate that
 		   frame->mc_vregs contains valid data */
 		msr |= MSR_SPE;
@@ -317,19 +321,18 @@ static int save_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
 	/* else assert((regs->msr & MSR_SPE) == 0) */
 
 	/* We always copy to/from spefscr */
-	if (__put_user(current->thread.spefscr, (u32 __user *)&frame->mc_vregs + ELF_NEVRREG))
-		return 1;
+	unsafe_put_user(current->thread.spefscr, (u32 __user *)&frame->mc_vregs + ELF_NEVRREG, failed);
 #endif /* CONFIG_SPE */
 
-	if (__put_user(msr, &frame->mc_gregs[PT_MSR]))
-		return 1;
+	unsafe_put_user(msr, &frame->mc_gregs[PT_MSR], failed);
 
 	if (sigret) {
 		/* Set up the sigreturn trampoline: li 0,sigret; sc */
-		if (__put_user(PPC_INST_ADDI + sigret, &frame->tramp[0])
-		    || __put_user(PPC_INST_SC, &frame->tramp[1]))
-			return 1;
+		unsafe_put_user(PPC_INST_ADDI + sigret, &frame->tramp[0], failed);
+		unsafe_put_user(PPC_INST_SC, &frame->tramp[1], failed);
 	}
+	user_write_access_end();
+
 	if (sigret)
 		flush_icache_range((unsigned long) &frame->tramp[0],
 				   (unsigned long) &frame->tramp[2]);
@@ -341,6 +344,10 @@ static int save_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
 		return 1;
 
 	return 0;
+
+failed:
+	user_write_access_end();
+	return 1;
 }
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
@@ -369,15 +376,17 @@ static int save_tm_user_regs(struct pt_regs *regs,
 		flush_spe_to_thread(current);
 #endif
 
-	if (save_general_regs(&current->thread.ckpt_regs, frame))
+	if (!user_write_access_begin(frame, sizeof(*frame)))
 		return 1;
 
+	if (save_general_regs(&current->thread.ckpt_regs, frame))
+		goto failed;
+
 #ifdef CONFIG_ALTIVEC
 	/* save altivec registers */
 	if (current->thread.used_vr) {
-		if (__copy_to_user(&frame->mc_vregs, &current->thread.ckvr_state,
-				   ELF_NVRREG * sizeof(vector128)))
-			return 1;
+		unsafe_copy_to_user(&frame->mc_vregs, &current->thread.ckvr_state,
+				    ELF_NVRREG * sizeof(vector128), failed);
 
 		/* set MSR_VEC in the saved MSR value to indicate that
 		 * frame->mc_vregs contains valid data
@@ -390,13 +399,11 @@ static int save_tm_user_regs(struct pt_regs *regs,
 	 * significant bits of a vector, we "cheat" and stuff VRSAVE in the
 	 * most significant bits of that same vector. --BenH
 	 */
-	if (__put_user(current->thread.ckvrsave,
-		       (u32 __user *)&frame->mc_vregs[32]))
-		return 1;
+	unsafe_put_user(current->thread.ckvrsave,
+		        (u32 __user *)&frame->mc_vregs[32], failed);
 #endif /* CONFIG_ALTIVEC */
 
-	if (copy_ckfpr_to_user(&frame->mc_fregs, current))
-		return 1;
+	unsafe_copy_ckfpr_to_user(&frame->mc_fregs, current, failed);
 #ifdef CONFIG_VSX
 	/*
 	 * Copy VSR 0-31 upper half from thread_struct to local
@@ -405,8 +412,7 @@ static int save_tm_user_regs(struct pt_regs *regs,
 	 * contains valid data
 	 */
 	if (current->thread.used_vsr) {
-		if (copy_ckvsx_to_user(&frame->mc_vsregs, current))
-			return 1;
+		unsafe_copy_ckvsx_to_user(&frame->mc_vsregs, current, failed);
 		msr |= MSR_VSX;
 	}
 #endif /* CONFIG_VSX */
@@ -415,91 +421,85 @@ static int save_tm_user_regs(struct pt_regs *regs,
 	 * simply the same as in save_user_regs().
 	 */
 	if (current->thread.used_spe) {
-		if (__copy_to_user(&frame->mc_vregs, current->thread.evr,
-				   ELF_NEVRREG * sizeof(u32)))
-			return 1;
+		unsafe_copy_to_user(&frame->mc_vregs, current->thread.evr,
+				    ELF_NEVRREG * sizeof(u32), failed);
 		/* set MSR_SPE in the saved MSR value to indicate that
 		 * frame->mc_vregs contains valid data */
 		msr |= MSR_SPE;
 	}
 
 	/* We always copy to/from spefscr */
-	if (__put_user(current->thread.spefscr, (u32 __user *)&frame->mc_vregs + ELF_NEVRREG))
-		return 1;
+	unsafe_put_user(current->thread.spefscr,
+			(u32 __user *)&frame->mc_vregs + ELF_NEVRREG, failed);
 #endif /* CONFIG_SPE */
 
-	if (__put_user(msr, &frame->mc_gregs[PT_MSR]))
-		return 1;
+	unsafe_put_user(msr, &frame->mc_gregs[PT_MSR], failed);
+
 	if (sigret) {
 		/* Set up the sigreturn trampoline: li 0,sigret; sc */
-		if (__put_user(PPC_INST_ADDI + sigret, &frame->tramp[0])
-		    || __put_user(PPC_INST_SC, &frame->tramp[1]))
-			return 1;
+		unsafe_put_user(PPC_INST_ADDI + sigret, &frame->tramp[0], failed);
+		unsafe_put_user(PPC_INST_SC, &frame->tramp[1], failed);
 	}
+	user_write_access_end();
+
 	if (sigret)
 		flush_icache_range((unsigned long) &frame->tramp[0],
 				   (unsigned long) &frame->tramp[2]);
 
-	if (save_general_regs(regs, tm_frame))
+	if (!user_write_access_begin(tm_frame, sizeof(*tm_frame)))
 		return 1;
 
+	if (save_general_regs(regs, tm_frame))
+		goto failed;
+
 	/* Stash the top half of the 64bit MSR into the 32bit MSR word
 	 * of the transactional mcontext.  This way we have a backward-compatible
 	 * MSR in the 'normal' (checkpointed) mcontext and additionally one can
 	 * also look at what type of transaction (T or S) was active at the
 	 * time of the signal.
 	 */
-	if (__put_user((msr >> 32), &tm_frame->mc_gregs[PT_MSR]))
-		return 1;
+	unsafe_put_user((msr >> 32), &tm_frame->mc_gregs[PT_MSR], failed);
 
 #ifdef CONFIG_ALTIVEC
 	if (current->thread.used_vr) {
-		if (msr & MSR_VEC) {
-			if (__copy_to_user(&tm_frame->mc_vregs,
-					   &current->thread.vr_state,
-					   ELF_NVRREG * sizeof(vector128)))
-				return 1;
-		} else {
-			if (__copy_to_user(&tm_frame->mc_vregs,
-					   &current->thread.ckvr_state,
-					   ELF_NVRREG * sizeof(vector128)))
-				return 1;
-		}
+		if (msr & MSR_VEC)
+			unsafe_copy_to_user(&tm_frame->mc_vregs,
+					    &current->thread.vr_state,
+					    ELF_NVRREG * sizeof(vector128), failed);
+		else
+			unsafe_copy_to_user(&tm_frame->mc_vregs,
+					    &current->thread.ckvr_state,
+					    ELF_NVRREG * sizeof(vector128), failed);
 	}
 
-	if (msr & MSR_VEC) {
-		if (__put_user(current->thread.vrsave,
-			       (u32 __user *)&tm_frame->mc_vregs[32]))
-			return 1;
-	} else {
-		if (__put_user(current->thread.ckvrsave,
-			       (u32 __user *)&tm_frame->mc_vregs[32]))
-			return 1;
-	}
+	if (msr & MSR_VEC)
+		unsafe_put_user(current->thread.vrsave,
+			        (u32 __user *)&tm_frame->mc_vregs[32], failed);
+	else
+		unsafe_put_user(current->thread.ckvrsave,
+			        (u32 __user *)&tm_frame->mc_vregs[32], failed);
 #endif /* CONFIG_ALTIVEC */
 
-	if (msr & MSR_FP) {
-		if (copy_fpr_to_user(&tm_frame->mc_fregs, current))
-			return 1;
-	} else {
-		if (copy_ckfpr_to_user(&tm_frame->mc_fregs, current))
-			return 1;
-	}
+	if (msr & MSR_FP)
+		unsafe_copy_fpr_to_user(&tm_frame->mc_fregs, current, failed);
+	else
+		unsafe_copy_ckfpr_to_user(&tm_frame->mc_fregs, current, failed);
 
 #ifdef CONFIG_VSX
 	if (current->thread.used_vsr) {
-		if (msr & MSR_VSX) {
-			if (copy_vsx_to_user(&tm_frame->mc_vsregs,
-						      current))
-				return 1;
-		} else {
-			if (copy_ckvsx_to_user(&tm_frame->mc_vsregs, current))
-				return 1;
-		}
+		if (msr & MSR_VSX)
+			unsafe_copy_vsx_to_user(&tm_frame->mc_vsregs, current, failed);
+		else
+			unsafe_copy_ckvsx_to_user(&tm_frame->mc_vsregs, current, failed);
 	}
 #endif /* CONFIG_VSX */
 
+	user_write_access_end();
 	return 0;
+
+failed:
+	user_write_access_end();
+	return 1;
 }
 #endif
 
-- 
2.25.0

