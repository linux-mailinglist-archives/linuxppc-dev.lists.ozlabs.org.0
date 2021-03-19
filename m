Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9F1341B29
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 12:09:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F21Pl3cgkz3dmd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 22:09:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F21Lb5HcCz3by4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 22:07:03 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F21LW75kTz9tx95;
 Fri, 19 Mar 2021 12:06:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id STiJXg5-ERCo; Fri, 19 Mar 2021 12:06:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F21LW6CF3z9tx91;
 Fri, 19 Mar 2021 12:06:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5EDB18B977;
 Fri, 19 Mar 2021 12:07:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Wyk6dwpQ0YiL; Fri, 19 Mar 2021 12:07:00 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F329E8B978;
 Fri, 19 Mar 2021 12:06:58 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id EC00367600; Fri, 19 Mar 2021 11:06:57 +0000 (UTC)
Message-Id: <181adf15a6f644efcd1aeafb355f3578ff1b6bc5.1616151715.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616151715.git.christophe.leroy@csgroup.eu>
References: <cover.1616151715.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 08/10] powerpc/signal32: Convert restore_[tm]_user_regs() to
 user access block
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 cmr@codefail.de
Date: Fri, 19 Mar 2021 11:06:57 +0000 (UTC)
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

Convert restore_user_regs() and restore_tm_user_regs()
to use user_access_read_begin/end blocks.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ptrace.h |   2 +-
 arch/powerpc/kernel/signal_32.c   | 141 +++++++++++++++---------------
 2 files changed, 72 insertions(+), 71 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index f10498e1b3f6..95600f3a6523 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -245,7 +245,7 @@ static inline bool trap_norestart(struct pt_regs *regs)
 	return regs->trap & 0x10;
 }
 
-static inline void set_trap_norestart(struct pt_regs *regs)
+static __always_inline void set_trap_norestart(struct pt_regs *regs)
 {
 	regs->trap |= 0x10;
 }
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 088c83853026..0b1a6f53e553 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -116,8 +116,8 @@ __unsafe_save_general_regs(struct pt_regs *regs, struct mcontext __user *frame)
 	return 1;
 }
 
-static inline int restore_general_regs(struct pt_regs *regs,
-		struct mcontext __user *sr)
+static __always_inline int
+__unsafe_restore_general_regs(struct pt_regs *regs, struct mcontext __user *sr)
 {
 	elf_greg_t64 *gregs = (elf_greg_t64 *)regs;
 	int i;
@@ -125,10 +125,12 @@ static inline int restore_general_regs(struct pt_regs *regs,
 	for (i = 0; i <= PT_RESULT; i++) {
 		if ((i == PT_MSR) || (i == PT_SOFTE))
 			continue;
-		if (__get_user(gregs[i], &sr->mc_gregs[i]))
-			return -EFAULT;
+		unsafe_get_user(gregs[i], &sr->mc_gregs[i], failed);
 	}
 	return 0;
+
+failed:
+	return 1;
 }
 
 #else /* CONFIG_PPC64 */
@@ -161,18 +163,20 @@ __unsafe_save_general_regs(struct pt_regs *regs, struct mcontext __user *frame)
 	return 1;
 }
 
-static inline int restore_general_regs(struct pt_regs *regs,
-		struct mcontext __user *sr)
+static __always_inline
+int __unsafe_restore_general_regs(struct pt_regs *regs, struct mcontext __user *sr)
 {
 	/* copy up to but not including MSR */
-	if (__copy_from_user(regs, &sr->mc_gregs,
-				PT_MSR * sizeof(elf_greg_t)))
-		return -EFAULT;
+	unsafe_copy_from_user(regs, &sr->mc_gregs, PT_MSR * sizeof(elf_greg_t), failed);
+
 	/* copy from orig_r3 (the word after the MSR) up to the end */
-	if (__copy_from_user(&regs->orig_gpr3, &sr->mc_gregs[PT_ORIG_R3],
-				GP_REGS_SIZE - PT_ORIG_R3 * sizeof(elf_greg_t)))
-		return -EFAULT;
+	unsafe_copy_from_user(&regs->orig_gpr3, &sr->mc_gregs[PT_ORIG_R3],
+			      GP_REGS_SIZE - PT_ORIG_R3 * sizeof(elf_greg_t), failed);
+
 	return 0;
+
+failed:
+	return 1;
 }
 #endif
 
@@ -181,6 +185,11 @@ static inline int restore_general_regs(struct pt_regs *regs,
 		goto label;					\
 } while (0)
 
+#define unsafe_restore_general_regs(regs, frame, label) do {	\
+	if (__unsafe_restore_general_regs(regs, frame))		\
+		goto label;					\
+} while (0)
+
 /*
  * When we have signals to deliver, we set up on the
  * user stack, going down from the original stack pointer:
@@ -485,14 +494,13 @@ static int save_tm_user_regs_unsafe(struct pt_regs *regs, struct mcontext __user
 static long restore_user_regs(struct pt_regs *regs,
 			      struct mcontext __user *sr, int sig)
 {
-	long err;
 	unsigned int save_r2 = 0;
 	unsigned long msr;
 #ifdef CONFIG_VSX
 	int i;
 #endif
 
-	if (!access_ok(sr, sizeof(*sr)))
+	if (!user_read_access_begin(sr, sizeof(*sr)))
 		return 1;
 	/*
 	 * restore general registers but not including MSR or SOFTE. Also
@@ -500,13 +508,11 @@ static long restore_user_regs(struct pt_regs *regs,
 	 */
 	if (!sig)
 		save_r2 = (unsigned int)regs->gpr[2];
-	err = restore_general_regs(regs, sr);
+	unsafe_restore_general_regs(regs, sr, failed);
 	set_trap_norestart(regs);
-	err |= __get_user(msr, &sr->mc_gregs[PT_MSR]);
+	unsafe_get_user(msr, &sr->mc_gregs[PT_MSR], failed);
 	if (!sig)
 		regs->gpr[2] = (unsigned long) save_r2;
-	if (err)
-		return 1;
 
 	/* if doing signal return, restore the previous little-endian mode */
 	if (sig)
@@ -520,22 +526,19 @@ static long restore_user_regs(struct pt_regs *regs,
 	regs->msr &= ~MSR_VEC;
 	if (msr & MSR_VEC) {
 		/* restore altivec registers from the stack */
-		if (__copy_from_user(&current->thread.vr_state, &sr->mc_vregs,
-				     sizeof(sr->mc_vregs)))
-			return 1;
+		unsafe_copy_from_user(&current->thread.vr_state, &sr->mc_vregs,
+				      sizeof(sr->mc_vregs), failed);
 		current->thread.used_vr = true;
 	} else if (current->thread.used_vr)
 		memset(&current->thread.vr_state, 0,
 		       ELF_NVRREG * sizeof(vector128));
 
 	/* Always get VRSAVE back */
-	if (__get_user(current->thread.vrsave, (u32 __user *)&sr->mc_vregs[32]))
-		return 1;
+	unsafe_get_user(current->thread.vrsave, (u32 __user *)&sr->mc_vregs[32], failed);
 	if (cpu_has_feature(CPU_FTR_ALTIVEC))
 		mtspr(SPRN_VRSAVE, current->thread.vrsave);
 #endif /* CONFIG_ALTIVEC */
-	if (copy_fpr_from_user(current, &sr->mc_fregs))
-		return 1;
+	unsafe_copy_fpr_from_user(current, &sr->mc_fregs, failed);
 
 #ifdef CONFIG_VSX
 	/*
@@ -548,8 +551,7 @@ static long restore_user_regs(struct pt_regs *regs,
 		 * Restore altivec registers from the stack to a local
 		 * buffer, then write this out to the thread_struct
 		 */
-		if (copy_vsx_from_user(current, &sr->mc_vsregs))
-			return 1;
+		unsafe_copy_vsx_from_user(current, &sr->mc_vsregs, failed);
 		current->thread.used_vsr = true;
 	} else if (current->thread.used_vsr)
 		for (i = 0; i < 32 ; i++)
@@ -567,19 +569,22 @@ static long restore_user_regs(struct pt_regs *regs,
 	regs->msr &= ~MSR_SPE;
 	if (msr & MSR_SPE) {
 		/* restore spe registers from the stack */
-		if (__copy_from_user(current->thread.evr, &sr->mc_vregs,
-				     ELF_NEVRREG * sizeof(u32)))
-			return 1;
+		unsafe_copy_from_user(current->thread.evr, &sr->mc_vregs,
+				      ELF_NEVRREG * sizeof(u32));
 		current->thread.used_spe = true;
 	} else if (current->thread.used_spe)
 		memset(current->thread.evr, 0, ELF_NEVRREG * sizeof(u32));
 
 	/* Always get SPEFSCR back */
-	if (__get_user(current->thread.spefscr, (u32 __user *)&sr->mc_vregs + ELF_NEVRREG))
-		return 1;
+	unsafe_get_user(current->thread.spefscr, (u32 __user *)&sr->mc_vregs + ELF_NEVRREG, failed);
 #endif /* CONFIG_SPE */
 
+	user_read_access_end();
 	return 0;
+
+failed:
+	user_read_access_end();
+	return 1;
 }
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
@@ -592,7 +597,6 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 				 struct mcontext __user *sr,
 				 struct mcontext __user *tm_sr)
 {
-	long err;
 	unsigned long msr, msr_hi;
 #ifdef CONFIG_VSX
 	int i;
@@ -607,14 +611,13 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 	 * TFHAR is restored from the checkpointed NIP; TEXASR and TFIAR
 	 * were set by the signal delivery.
 	 */
-	err = restore_general_regs(&current->thread.ckpt_regs, sr);
-
-	err |= __get_user(current->thread.tm_tfhar, &sr->mc_gregs[PT_NIP]);
-
-	err |= __get_user(msr, &sr->mc_gregs[PT_MSR]);
-	if (err)
+	if (!user_read_access_begin(sr, sizeof(*sr)))
 		return 1;
 
+	unsafe_restore_general_regs(&current->thread.ckpt_regs, sr, failed);
+	unsafe_get_user(current->thread.tm_tfhar, &sr->mc_gregs[PT_NIP], failed);
+	unsafe_get_user(msr, &sr->mc_gregs[PT_MSR], failed);
+
 	/* Restore the previous little-endian mode */
 	regs->msr = (regs->msr & ~MSR_LE) | (msr & MSR_LE);
 
@@ -622,9 +625,8 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 	regs->msr &= ~MSR_VEC;
 	if (msr & MSR_VEC) {
 		/* restore altivec registers from the stack */
-		if (__copy_from_user(&current->thread.ckvr_state, &sr->mc_vregs,
-				     sizeof(sr->mc_vregs)))
-			return 1;
+		unsafe_copy_from_user(&current->thread.ckvr_state, &sr->mc_vregs,
+				      sizeof(sr->mc_vregs), failed);
 		current->thread.used_vr = true;
 	} else if (current->thread.used_vr) {
 		memset(&current->thread.vr_state, 0,
@@ -634,17 +636,15 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 	}
 
 	/* Always get VRSAVE back */
-	if (__get_user(current->thread.ckvrsave,
-		       (u32 __user *)&sr->mc_vregs[32]))
-		return 1;
+	unsafe_get_user(current->thread.ckvrsave,
+			(u32 __user *)&sr->mc_vregs[32], failed);
 	if (cpu_has_feature(CPU_FTR_ALTIVEC))
 		mtspr(SPRN_VRSAVE, current->thread.ckvrsave);
 #endif /* CONFIG_ALTIVEC */
 
 	regs->msr &= ~(MSR_FP | MSR_FE0 | MSR_FE1);
 
-	if (copy_fpr_from_user(current, &sr->mc_fregs))
-		return 1;
+	unsafe_copy_fpr_from_user(current, &sr->mc_fregs, failed);
 
 #ifdef CONFIG_VSX
 	regs->msr &= ~MSR_VSX;
@@ -653,8 +653,7 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 		 * Restore altivec registers from the stack to a local
 		 * buffer, then write this out to the thread_struct
 		 */
-		if (copy_ckvsx_from_user(current, &sr->mc_vsregs))
-			return 1;
+		unsafe_copy_ckvsx_from_user(current, &sr->mc_vsregs, failed);
 		current->thread.used_vsr = true;
 	} else if (current->thread.used_vsr)
 		for (i = 0; i < 32 ; i++) {
@@ -669,39 +668,36 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 	 */
 	regs->msr &= ~MSR_SPE;
 	if (msr & MSR_SPE) {
-		if (__copy_from_user(current->thread.evr, &sr->mc_vregs,
-				     ELF_NEVRREG * sizeof(u32)))
-			return 1;
+		unsafe_copy_from_user(current->thread.evr, &sr->mc_vregs,
+				      ELF_NEVRREG * sizeof(u32), failed);
 		current->thread.used_spe = true;
 	} else if (current->thread.used_spe)
 		memset(current->thread.evr, 0, ELF_NEVRREG * sizeof(u32));
 
 	/* Always get SPEFSCR back */
-	if (__get_user(current->thread.spefscr, (u32 __user *)&sr->mc_vregs
-		       + ELF_NEVRREG))
-		return 1;
+	unsafe_get_user(current->thread.spefscr,
+			(u32 __user *)&sr->mc_vregs + ELF_NEVRREG, failed);
 #endif /* CONFIG_SPE */
 
-	err = restore_general_regs(regs, tm_sr);
-	if (err)
+	user_read_access_end();
+
+	if (!user_read_access_begin(tm_sr, sizeof(*tm_sr)))
 		return 1;
 
+	unsafe_restore_general_regs(regs, tm_sr, failed);
+
 #ifdef CONFIG_ALTIVEC
 	/* restore altivec registers from the stack */
 	if (msr & MSR_VEC)
-		if (__copy_from_user(&current->thread.vr_state,
-				     &tm_sr->mc_vregs,
-				     sizeof(sr->mc_vregs)))
-			return 1;
+		unsafe_copy_from_user(&current->thread.vr_state, &tm_sr->mc_vregs,
+				      sizeof(sr->mc_vregs), failed);
 
 	/* Always get VRSAVE back */
-	if (__get_user(current->thread.vrsave,
-		       (u32 __user *)&tm_sr->mc_vregs[32]))
-		return 1;
+	unsafe_get_user(current->thread.vrsave,
+			(u32 __user *)&tm_sr->mc_vregs[32], failed);
 #endif /* CONFIG_ALTIVEC */
 
-	if (copy_ckfpr_from_user(current, &tm_sr->mc_fregs))
-		return 1;
+	unsafe_copy_ckfpr_from_user(current, &tm_sr->mc_fregs, failed);
 
 #ifdef CONFIG_VSX
 	if (msr & MSR_VSX) {
@@ -709,16 +705,17 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 		 * Restore altivec registers from the stack to a local
 		 * buffer, then write this out to the thread_struct
 		 */
-		if (copy_vsx_from_user(current, &tm_sr->mc_vsregs))
-			return 1;
+		unsafe_copy_vsx_from_user(current, &tm_sr->mc_vsregs, failed);
 		current->thread.used_vsr = true;
 	}
 #endif /* CONFIG_VSX */
 
 	/* Get the top half of the MSR from the user context */
-	if (__get_user(msr_hi, &tm_sr->mc_gregs[PT_MSR]))
-		return 1;
+	unsafe_get_user(msr_hi, &tm_sr->mc_gregs[PT_MSR], failed);
 	msr_hi <<= 32;
+
+	user_read_access_end();
+
 	/* If TM bits are set to the reserved value, it's an invalid context */
 	if (MSR_TM_RESV(msr_hi))
 		return 1;
@@ -766,6 +763,10 @@ static long restore_tm_user_regs(struct pt_regs *regs,
 	preempt_enable();
 
 	return 0;
+
+failed:
+	user_read_access_end();
+	return 1;
 }
 #else
 static long restore_tm_user_regs(struct pt_regs *regs, struct mcontext __user *sr,
-- 
2.25.0

