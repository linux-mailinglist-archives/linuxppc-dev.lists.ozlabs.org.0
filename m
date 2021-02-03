Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 307AE30E2C5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 19:49:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW9hg1hR8zF1PM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 05:49:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=68.65.122.27;
 helo=mta-07-4.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from MTA-07-4.privateemail.com (mta-07-4.privateemail.com
 [68.65.122.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW9Yg0kQlzDwtt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 05:43:34 +1100 (AEDT)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 8128760059
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 13:43:31 -0500 (EST)
Received: from oc8246131445.ibm.com (unknown [10.20.151.227])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id 52D2B6005E
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 18:43:31 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 06/10] powerpc/signal64: Replace setup_sigcontext() w/
 unsafe_setup_sigcontext()
Date: Wed,  3 Feb 2021 12:43:19 -0600
Message-Id: <20210203184323.20792-7-cmr@codefail.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210203184323.20792-1-cmr@codefail.de>
References: <20210203184323.20792-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Previously setup_sigcontext() performed a costly KUAP switch on every
uaccess operation. These repeated uaccess switches cause a significant
drop in signal handling performance.

Rewrite setup_sigcontext() to assume that a userspace write access window
is open. Replace all uaccess functions with their 'unsafe' versions
which avoid the repeated uaccess switches.

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal_64.c | 70 ++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 8e1d804ce552..4248e4489ff1 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -101,9 +101,13 @@ static void prepare_setup_sigcontext(struct task_struct *tsk, int ctx_has_vsx_re
  * Set up the sigcontext for the signal frame.
  */
 
-static long setup_sigcontext(struct sigcontext __user *sc,
-		struct task_struct *tsk, int signr, sigset_t *set,
-		unsigned long handler, int ctx_has_vsx_region)
+#define unsafe_setup_sigcontext(sc, tsk, signr, set, handler,		\
+				ctx_has_vsx_region, e)			\
+	unsafe_op_wrap(__unsafe_setup_sigcontext(sc, tsk, signr, set,	\
+			handler, ctx_has_vsx_region), e)
+static long notrace __unsafe_setup_sigcontext(struct sigcontext __user *sc,
+					struct task_struct *tsk, int signr, sigset_t *set,
+					unsigned long handler, int ctx_has_vsx_region)
 {
 	/* When CONFIG_ALTIVEC is set, we _always_ setup v_regs even if the
 	 * process never used altivec yet (MSR_VEC is zero in pt_regs of
@@ -118,20 +122,19 @@ static long setup_sigcontext(struct sigcontext __user *sc,
 #endif
 	struct pt_regs *regs = tsk->thread.regs;
 	unsigned long msr = regs->msr;
-	long err = 0;
 	/* Force usr to alway see softe as 1 (interrupts enabled) */
 	unsigned long softe = 0x1;
 
 	BUG_ON(tsk != current);
 
 #ifdef CONFIG_ALTIVEC
-	err |= __put_user(v_regs, &sc->v_regs);
+	unsafe_put_user(v_regs, &sc->v_regs, efault_out);
 
 	/* save altivec registers */
 	if (tsk->thread.used_vr) {
 		/* Copy 33 vec registers (vr0..31 and vscr) to the stack */
-		err |= __copy_to_user(v_regs, &tsk->thread.vr_state,
-				      33 * sizeof(vector128));
+		unsafe_copy_to_user(v_regs, &tsk->thread.vr_state,
+				    33 * sizeof(vector128), efault_out);
 		/* set MSR_VEC in the MSR value in the frame to indicate that sc->v_reg)
 		 * contains valid data.
 		 */
@@ -140,12 +143,12 @@ static long setup_sigcontext(struct sigcontext __user *sc,
 	/* We always copy to/from vrsave, it's 0 if we don't have or don't
 	 * use altivec.
 	 */
-	err |= __put_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33]);
+	unsafe_put_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33], efault_out);
 #else /* CONFIG_ALTIVEC */
-	err |= __put_user(0, &sc->v_regs);
+	unsafe_put_user(0, &sc->v_regs, efault_out);
 #endif /* CONFIG_ALTIVEC */
 	/* copy fpr regs and fpscr */
-	err |= copy_fpr_to_user(&sc->fp_regs, tsk);
+	unsafe_copy_fpr_to_user(&sc->fp_regs, tsk, efault_out);
 
 	/*
 	 * Clear the MSR VSX bit to indicate there is no valid state attached
@@ -160,24 +163,27 @@ static long setup_sigcontext(struct sigcontext __user *sc,
 	 */
 	if (tsk->thread.used_vsr && ctx_has_vsx_region) {
 		v_regs += ELF_NVRREG;
-		err |= copy_vsx_to_user(v_regs, tsk);
+		unsafe_copy_vsx_to_user(v_regs, tsk, efault_out);
 		/* set MSR_VSX in the MSR value in the frame to
 		 * indicate that sc->vs_reg) contains valid data.
 		 */
 		msr |= MSR_VSX;
 	}
 #endif /* CONFIG_VSX */
-	err |= __put_user(&sc->gp_regs, &sc->regs);
+	unsafe_put_user(&sc->gp_regs, &sc->regs, efault_out);
 	WARN_ON(!FULL_REGS(regs));
-	err |= __copy_to_user(&sc->gp_regs, regs, GP_REGS_SIZE);
-	err |= __put_user(msr, &sc->gp_regs[PT_MSR]);
-	err |= __put_user(softe, &sc->gp_regs[PT_SOFTE]);
-	err |= __put_user(signr, &sc->signal);
-	err |= __put_user(handler, &sc->handler);
+	unsafe_copy_to_user(&sc->gp_regs, regs, GP_REGS_SIZE, efault_out);
+	unsafe_put_user(msr, &sc->gp_regs[PT_MSR], efault_out);
+	unsafe_put_user(softe, &sc->gp_regs[PT_SOFTE], efault_out);
+	unsafe_put_user(signr, &sc->signal, efault_out);
+	unsafe_put_user(handler, &sc->handler, efault_out);
 	if (set != NULL)
-		err |=  __put_user(set->sig[0], &sc->oldmask);
+		unsafe_put_user(set->sig[0], &sc->oldmask, efault_out);
 
-	return err;
+	return 0;
+
+efault_out:
+	return -EFAULT;
 }
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
@@ -664,12 +670,15 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 
 	if (old_ctx != NULL) {
 		prepare_setup_sigcontext(current, ctx_has_vsx_region);
-		if (!access_ok(old_ctx, ctx_size)
-		    || setup_sigcontext(&old_ctx->uc_mcontext, current, 0, NULL, 0,
-					ctx_has_vsx_region)
-		    || __copy_to_user(&old_ctx->uc_sigmask,
-				      &current->blocked, sizeof(sigset_t)))
+		if (!user_write_access_begin(old_ctx, ctx_size))
 			return -EFAULT;
+
+		unsafe_setup_sigcontext(&old_ctx->uc_mcontext, current, 0, NULL,
+					0, ctx_has_vsx_region, efault_out);
+		unsafe_copy_to_user(&old_ctx->uc_sigmask, &current->blocked,
+				    sizeof(sigset_t), efault_out);
+
+		user_write_access_end();
 	}
 	if (new_ctx == NULL)
 		return 0;
@@ -698,6 +707,10 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 	/* This returns like rt_sigreturn */
 	set_thread_flag(TIF_RESTOREALL);
 	return 0;
+
+efault_out:
+	user_write_access_end();
+	return -EFAULT;
 }
 
 
@@ -850,9 +863,12 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	} else {
 		err |= __put_user(0, &frame->uc.uc_link);
 		prepare_setup_sigcontext(tsk, 1);
-		err |= setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
-					NULL, (unsigned long)ksig->ka.sa.sa_handler,
-					1);
+		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
+			return -EFAULT;
+		err |= __unsafe_setup_sigcontext(&frame->uc.uc_mcontext, tsk,
+						ksig->sig, NULL,
+						(unsigned long)ksig->ka.sa.sa_handler, 1);
+		user_write_access_end();
 	}
 	err |= __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
 	if (err)
-- 
2.26.1

