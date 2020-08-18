Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FD8248DB9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 20:11:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWJrm2pmvzDqF1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 04:11:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHhr2dZMzDqcQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:19:40 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWHhl4m1Jz9vCxl;
 Tue, 18 Aug 2020 19:19:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id B7KVi2z0IOah; Tue, 18 Aug 2020 19:19:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWHhl3sJ5z9vCxg;
 Tue, 18 Aug 2020 19:19:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 670DE8B7EC;
 Tue, 18 Aug 2020 19:19:37 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ssRtOrtcwVS9; Tue, 18 Aug 2020 19:19:37 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 21F198B7D7;
 Tue, 18 Aug 2020 19:19:37 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id F363D65CF4; Tue, 18 Aug 2020 17:19:36 +0000 (UTC)
Message-Id: <f6eac65781b4a57220477c8864bca2b57f29a5d5.1597770847.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597770847.git.christophe.leroy@csgroup.eu>
References: <cover.1597770847.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 24/25] powerpc/signal32: Isolate non-copy actions in
 save_user_regs() and save_tm_user_regs()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 17:19:36 +0000 (UTC)
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

Reorder actions in save_user_regs() and save_tm_user_regs() to
regroup copies together in order to switch to user_access_begin()
logic in a later patch.

Move non-copy actions into new functions called
prepare_save_user_regs() and prepare_save_tm_user_regs().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 54 +++++++++++++++++++++++++--------
 1 file changed, 41 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 5b8a4ede142c..86539a4e0514 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -229,14 +229,31 @@ struct rt_sigframe {
  * We only save the altivec/spe registers if the process has used
  * altivec/spe instructions at some point.
  */
+static void prepare_save_user_regs(int ctx_has_vsx_region)
+{
+	/* Make sure floating point registers are stored in regs */
+	flush_fp_to_thread(current);
+#ifdef CONFIG_ALTIVEC
+	if (current->thread.used_vr)
+		flush_altivec_to_thread(current);
+	if (cpu_has_feature(CPU_FTR_ALTIVEC))
+		current->thread.vrsave = mfspr(SPRN_VRSAVE);
+#endif
+#ifdef CONFIG_VSX
+	if (current->thread.used_vsr && ctx_has_vsx_region)
+		flush_vsx_to_thread(current);
+#endif
+#ifdef CONFIG_SPE
+	if (current->thread.used_spe)
+		flush_spe_to_thread(current);
+#endif
+}
+
 static int save_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
 			  struct mcontext __user *tm_frame, int ctx_has_vsx_region)
 {
 	unsigned long msr = regs->msr;
 
-	/* Make sure floating point registers are stored in regs */
-	flush_fp_to_thread(current);
-
 	/* save general registers */
 	if (save_general_regs(regs, frame))
 		return 1;
@@ -244,7 +261,6 @@ static int save_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
 #ifdef CONFIG_ALTIVEC
 	/* save altivec registers */
 	if (current->thread.used_vr) {
-		flush_altivec_to_thread(current);
 		if (__copy_to_user(&frame->mc_vregs, &current->thread.vr_state,
 				   ELF_NVRREG * sizeof(vector128)))
 			return 1;
@@ -260,8 +276,6 @@ static int save_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
 	 * most significant bits of that same vector. --BenH
 	 * Note that the current VRSAVE value is in the SPR at this point.
 	 */
-	if (cpu_has_feature(CPU_FTR_ALTIVEC))
-		current->thread.vrsave = mfspr(SPRN_VRSAVE);
 	if (__put_user(current->thread.vrsave, (u32 __user *)&frame->mc_vregs[32]))
 		return 1;
 #endif /* CONFIG_ALTIVEC */
@@ -281,7 +295,6 @@ static int save_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
 	 * contains valid data
 	 */
 	if (current->thread.used_vsr && ctx_has_vsx_region) {
-		flush_vsx_to_thread(current);
 		if (copy_vsx_to_user(&frame->mc_vsregs, current))
 			return 1;
 		msr |= MSR_VSX;
@@ -290,7 +303,6 @@ static int save_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
 #ifdef CONFIG_SPE
 	/* save spe registers */
 	if (current->thread.used_spe) {
-		flush_spe_to_thread(current);
 		if (__copy_to_user(&frame->mc_vregs, current->thread.evr,
 				   ELF_NEVRREG * sizeof(u32)))
 			return 1;
@@ -326,11 +338,23 @@ static int save_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
  *
  * See save_user_regs() and signal_64.c:setup_tm_sigcontexts().
  */
-static int save_tm_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
-			     struct mcontext __user *tm_frame, unsigned long msr)
+static void prepare_save_tm_user_regs(void)
 {
 	WARN_ON(tm_suspend_disabled);
 
+#ifdef CONFIG_ALTIVEC
+	if (cpu_has_feature(CPU_FTR_ALTIVEC))
+		current->thread.ckvrsave = mfspr(SPRN_VRSAVE);
+#endif
+#ifdef CONFIG_SPE
+	if (current->thread.used_spe)
+		flush_spe_to_thread(current);
+#endif
+}
+
+static int save_tm_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
+			     struct mcontext __user *tm_frame, unsigned long msr)
+{
 	/* Save both sets of general registers */
 	if (save_general_regs(&current->thread.ckpt_regs, frame)
 	    || save_general_regs(regs, tm_frame))
@@ -374,8 +398,6 @@ static int save_tm_user_regs(struct pt_regs *regs, struct mcontext __user *frame
 	 * significant bits of a vector, we "cheat" and stuff VRSAVE in the
 	 * most significant bits of that same vector. --BenH
 	 */
-	if (cpu_has_feature(CPU_FTR_ALTIVEC))
-		current->thread.ckvrsave = mfspr(SPRN_VRSAVE);
 	if (__put_user(current->thread.ckvrsave,
 		       (u32 __user *)&frame->mc_vregs[32]))
 		return 1;
@@ -427,7 +449,6 @@ static int save_tm_user_regs(struct pt_regs *regs, struct mcontext __user *frame
 	 * simply the same as in save_user_regs().
 	 */
 	if (current->thread.used_spe) {
-		flush_spe_to_thread(current);
 		if (__copy_to_user(&frame->mc_vregs, current->thread.evr,
 				   ELF_NEVRREG * sizeof(u32)))
 			return 1;
@@ -447,6 +468,8 @@ static int save_tm_user_regs(struct pt_regs *regs, struct mcontext __user *frame
 	return 0;
 }
 #else
+static void prepare_save_tm_user_regs(void) { }
+
 static int save_tm_user_regs(struct pt_regs *regs, struct mcontext __user *frame,
 			     struct mcontext __user *tm_frame, unsigned long msr)
 {
@@ -790,9 +813,11 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 		flush_icache_range(tramp, tramp + 2 * sizeof(unsigned long));
 
 	if (MSR_TM_ACTIVE(msr)) {
+		prepare_save_tm_user_regs();
 		if (save_tm_user_regs(regs, mctx, tm_mctx, msr))
 			goto badframe;
 	} else {
+		prepare_save_user_regs(1);
 		if (save_user_regs(regs, mctx, tm_mctx, 1))
 			goto badframe;
 	}
@@ -881,9 +906,11 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 		flush_icache_range(tramp, tramp + 2 * sizeof(unsigned long));
 
 	if (MSR_TM_ACTIVE(msr)) {
+		prepare_save_tm_user_regs();
 		if (save_tm_user_regs(regs, mctx, tm_mctx, msr))
 			goto badframe;
 	} else {
+		prepare_save_user_regs(1);
 		if (save_user_regs(regs, mctx, tm_mctx, 1))
 			goto badframe;
 	}
@@ -1038,6 +1065,7 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 		 */
 		mctx = (struct mcontext __user *)
 			((unsigned long) &old_ctx->uc_mcontext & ~0xfUL);
+		prepare_save_user_regs(ctx_has_vsx_region);
 		if (save_user_regs(regs, mctx, NULL, ctx_has_vsx_region))
 			return -EFAULT;
 		if (!user_write_access_begin(old_ctx, ctx_size))
-- 
2.25.0

