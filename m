Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E48E2326AFD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 02:15:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnT9n6fQ6z3dp3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 12:15:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=131.153.2.45;
 helo=h4.fbrelay.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from h4.fbrelay.privateemail.com (h4.fbrelay.privateemail.com
 [131.153.2.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnT6g6DDFz3cYt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 12:13:15 +1100 (AEDT)
Received: from MTA-14-4.privateemail.com (mta-14.privateemail.com
 [198.54.118.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 39BBB80D08
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 20:13:11 -0500 (EST)
Received: from mta-14.privateemail.com (localhost [127.0.0.1])
 by mta-14.privateemail.com (Postfix) with ESMTP id A8C8480088
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 20:13:08 -0500 (EST)
Received: from oc8246131445.ibm.com (unknown [10.20.151.203])
 by mta-14.privateemail.com (Postfix) with ESMTPA id 7AB9B80087
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 01:13:08 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 07/10] powerpc/signal64: Replace restore_sigcontext() w/
 unsafe_restore_sigcontext()
Date: Fri, 26 Feb 2021 19:12:56 -0600
Message-Id: <20210227011259.11992-8-cmr@codefail.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210227011259.11992-1-cmr@codefail.de>
References: <20210227011259.11992-1-cmr@codefail.de>
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

Previously restore_sigcontext() performed a costly KUAP switch on every
uaccess operation. These repeated uaccess switches cause a significant
drop in signal handling performance.

Rewrite restore_sigcontext() to assume that a userspace read access
window is open by replacing all uaccess functions with their 'unsafe'
versions. Modify the callers to first open, call
unsafe_restore_sigcontext(), and then close the uaccess window.

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
v7:	* Don't use unsafe_op_wrap() since Christophe indicates this
	  macro may go away in the future.
---
 arch/powerpc/kernel/signal_64.c | 68 ++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 78ae4bb4e590..23a44ec3ac01 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -327,14 +327,16 @@ static long setup_tm_sigcontexts(struct sigcontext __user *sc,
 /*
  * Restore the sigcontext from the signal frame.
  */
-
-static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
-			      struct sigcontext __user *sc)
+#define unsafe_restore_sigcontext(tsk, set, sig, sc, label) do {	\
+	if (__unsafe_restore_sigcontext(tsk, set, sig, sc))		\
+		goto label;						\
+} while (0)
+static long notrace __unsafe_restore_sigcontext(struct task_struct *tsk, sigset_t *set,
+						int sig, struct sigcontext __user *sc)
 {
 #ifdef CONFIG_ALTIVEC
 	elf_vrreg_t __user *v_regs;
 #endif
-	unsigned long err = 0;
 	unsigned long save_r13 = 0;
 	unsigned long msr;
 	struct pt_regs *regs = tsk->thread.regs;
@@ -349,27 +351,27 @@ static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
 		save_r13 = regs->gpr[13];
 
 	/* copy the GPRs */
-	err |= __copy_from_user(regs->gpr, sc->gp_regs, sizeof(regs->gpr));
-	err |= __get_user(regs->nip, &sc->gp_regs[PT_NIP]);
+	unsafe_copy_from_user(regs->gpr, sc->gp_regs, sizeof(regs->gpr), efault_out);
+	unsafe_get_user(regs->nip, &sc->gp_regs[PT_NIP], efault_out);
 	/* get MSR separately, transfer the LE bit if doing signal return */
-	err |= __get_user(msr, &sc->gp_regs[PT_MSR]);
+	unsafe_get_user(msr, &sc->gp_regs[PT_MSR], efault_out);
 	if (sig)
 		regs->msr = (regs->msr & ~MSR_LE) | (msr & MSR_LE);
-	err |= __get_user(regs->orig_gpr3, &sc->gp_regs[PT_ORIG_R3]);
-	err |= __get_user(regs->ctr, &sc->gp_regs[PT_CTR]);
-	err |= __get_user(regs->link, &sc->gp_regs[PT_LNK]);
-	err |= __get_user(regs->xer, &sc->gp_regs[PT_XER]);
-	err |= __get_user(regs->ccr, &sc->gp_regs[PT_CCR]);
+	unsafe_get_user(regs->orig_gpr3, &sc->gp_regs[PT_ORIG_R3], efault_out);
+	unsafe_get_user(regs->ctr, &sc->gp_regs[PT_CTR], efault_out);
+	unsafe_get_user(regs->link, &sc->gp_regs[PT_LNK], efault_out);
+	unsafe_get_user(regs->xer, &sc->gp_regs[PT_XER], efault_out);
+	unsafe_get_user(regs->ccr, &sc->gp_regs[PT_CCR], efault_out);
 	/* Don't allow userspace to set SOFTE */
 	set_trap_norestart(regs);
-	err |= __get_user(regs->dar, &sc->gp_regs[PT_DAR]);
-	err |= __get_user(regs->dsisr, &sc->gp_regs[PT_DSISR]);
-	err |= __get_user(regs->result, &sc->gp_regs[PT_RESULT]);
+	unsafe_get_user(regs->dar, &sc->gp_regs[PT_DAR], efault_out);
+	unsafe_get_user(regs->dsisr, &sc->gp_regs[PT_DSISR], efault_out);
+	unsafe_get_user(regs->result, &sc->gp_regs[PT_RESULT], efault_out);
 
 	if (!sig)
 		regs->gpr[13] = save_r13;
 	if (set != NULL)
-		err |=  __get_user(set->sig[0], &sc->oldmask);
+		unsafe_get_user(set->sig[0], &sc->oldmask, efault_out);
 
 	/*
 	 * Force reload of FP/VEC.
@@ -379,29 +381,27 @@ static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
 	regs->msr &= ~(MSR_FP | MSR_FE0 | MSR_FE1 | MSR_VEC | MSR_VSX);
 
 #ifdef CONFIG_ALTIVEC
-	err |= __get_user(v_regs, &sc->v_regs);
-	if (err)
-		return err;
+	unsafe_get_user(v_regs, &sc->v_regs, efault_out);
 	if (v_regs && !access_ok(v_regs, 34 * sizeof(vector128)))
 		return -EFAULT;
 	/* Copy 33 vec registers (vr0..31 and vscr) from the stack */
 	if (v_regs != NULL && (msr & MSR_VEC) != 0) {
-		err |= __copy_from_user(&tsk->thread.vr_state, v_regs,
-					33 * sizeof(vector128));
+		unsafe_copy_from_user(&tsk->thread.vr_state, v_regs,
+				      33 * sizeof(vector128), efault_out);
 		tsk->thread.used_vr = true;
 	} else if (tsk->thread.used_vr) {
 		memset(&tsk->thread.vr_state, 0, 33 * sizeof(vector128));
 	}
 	/* Always get VRSAVE back */
 	if (v_regs != NULL)
-		err |= __get_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33]);
+		unsafe_get_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33], efault_out);
 	else
 		tsk->thread.vrsave = 0;
 	if (cpu_has_feature(CPU_FTR_ALTIVEC))
 		mtspr(SPRN_VRSAVE, tsk->thread.vrsave);
 #endif /* CONFIG_ALTIVEC */
 	/* restore floating point */
-	err |= copy_fpr_from_user(tsk, &sc->fp_regs);
+	unsafe_copy_fpr_from_user(tsk, &sc->fp_regs, efault_out);
 #ifdef CONFIG_VSX
 	/*
 	 * Get additional VSX data. Update v_regs to point after the
@@ -410,14 +410,17 @@ static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
 	 */
 	v_regs += ELF_NVRREG;
 	if ((msr & MSR_VSX) != 0) {
-		err |= copy_vsx_from_user(tsk, v_regs);
+		unsafe_copy_vsx_from_user(tsk, v_regs, efault_out);
 		tsk->thread.used_vsr = true;
 	} else {
 		for (i = 0; i < 32 ; i++)
 			tsk->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] = 0;
 	}
 #endif
-	return err;
+	return 0;
+
+efault_out:
+	return -EFAULT;
 }
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
@@ -708,8 +711,14 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 	if (__copy_from_user(&set, &new_ctx->uc_sigmask, sizeof(set)))
 		do_exit(SIGSEGV);
 	set_current_blocked(&set);
-	if (restore_sigcontext(current, NULL, 0, &new_ctx->uc_mcontext))
+
+	if (!user_read_access_begin(new_ctx, ctx_size))
+		return -EFAULT;
+	if (__unsafe_restore_sigcontext(current, NULL, 0, &new_ctx->uc_mcontext)) {
+		user_read_access_end();
 		do_exit(SIGSEGV);
+	}
+	user_read_access_end();
 
 	/* This returns like rt_sigreturn */
 	set_thread_flag(TIF_RESTOREALL);
@@ -812,8 +821,13 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		 * causing a TM bad thing.
 		 */
 		current->thread.regs->msr &= ~MSR_TS_MASK;
-		if (restore_sigcontext(current, NULL, 1, &uc->uc_mcontext))
+		if (!user_read_access_begin(&uc->uc_mcontext, sizeof(uc->uc_mcontext)))
+			return -EFAULT;
+		if (__unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext)) {
+			user_read_access_end();
 			goto badframe;
+		}
+		user_read_access_end();
 	}
 
 	if (restore_altstack(&uc->uc_stack))
-- 
2.26.1

