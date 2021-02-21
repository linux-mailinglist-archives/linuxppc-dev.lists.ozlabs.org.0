Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF543207E8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Feb 2021 02:25:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Djng629nMz3ckq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Feb 2021 12:25:06 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Djnf36WQ2z30LR
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Feb 2021 12:24:09 +1100 (AEDT)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 047866004B
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 20:24:07 -0500 (EST)
Received: from oc8246131445.ibm.com (unknown [10.20.151.213])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id D30A760049
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Feb 2021 01:24:06 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 03/10] powerpc/signal64: Remove non-inline calls from
 setup_sigcontext()
Date: Sat, 20 Feb 2021 19:23:54 -0600
Message-Id: <20210221012401.22328-4-cmr@codefail.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210221012401.22328-1-cmr@codefail.de>
References: <20210221012401.22328-1-cmr@codefail.de>
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

The majority of setup_sigcontext() can be refactored to execute in an
"unsafe" context assuming an open uaccess window except for some
non-inline function calls. Move these out into a separate
prepare_setup_sigcontext() function which must be called first and
before opening up a uaccess window. Non-inline function calls should be
avoided during a uaccess window for a few reasons:

	- KUAP should be enabled for as much kernel code as possible.
	  Opening a uaccess window disables KUAP which means any code
	  executed during this time contributes to a potential attack
	  surface.

	- Non-inline functions default to traceable which means they are
	  instrumented for ftrace. This adds more code which could run
	  with KUAP disabled.

	- Powerpc does not currently support the objtool UACCESS checks.
	  All code running with uaccess must be audited manually which
	  means: less code -> less work -> fewer problems (in theory).

A follow-up commit converts setup_sigcontext() to be "unsafe".

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal_64.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index f9e4a1ac440f..6ca546192cbf 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -79,6 +79,24 @@ static elf_vrreg_t __user *sigcontext_vmx_regs(struct sigcontext __user *sc)
 }
 #endif
 
+static void prepare_setup_sigcontext(struct task_struct *tsk)
+{
+#ifdef CONFIG_ALTIVEC
+	/* save altivec registers */
+	if (tsk->thread.used_vr)
+		flush_altivec_to_thread(tsk);
+	if (cpu_has_feature(CPU_FTR_ALTIVEC))
+		tsk->thread.vrsave = mfspr(SPRN_VRSAVE);
+#endif /* CONFIG_ALTIVEC */
+
+	flush_fp_to_thread(tsk);
+
+#ifdef CONFIG_VSX
+	if (tsk->thread.used_vsr)
+		flush_vsx_to_thread(tsk);
+#endif /* CONFIG_VSX */
+}
+
 /*
  * Set up the sigcontext for the signal frame.
  */
@@ -97,7 +115,6 @@ static long setup_sigcontext(struct sigcontext __user *sc,
 	 */
 #ifdef CONFIG_ALTIVEC
 	elf_vrreg_t __user *v_regs = sigcontext_vmx_regs(sc);
-	unsigned long vrsave;
 #endif
 	struct pt_regs *regs = tsk->thread.regs;
 	unsigned long msr = regs->msr;
@@ -112,7 +129,6 @@ static long setup_sigcontext(struct sigcontext __user *sc,
 
 	/* save altivec registers */
 	if (tsk->thread.used_vr) {
-		flush_altivec_to_thread(tsk);
 		/* Copy 33 vec registers (vr0..31 and vscr) to the stack */
 		err |= __copy_to_user(v_regs, &tsk->thread.vr_state,
 				      33 * sizeof(vector128));
@@ -124,17 +140,10 @@ static long setup_sigcontext(struct sigcontext __user *sc,
 	/* We always copy to/from vrsave, it's 0 if we don't have or don't
 	 * use altivec.
 	 */
-	vrsave = 0;
-	if (cpu_has_feature(CPU_FTR_ALTIVEC)) {
-		vrsave = mfspr(SPRN_VRSAVE);
-		tsk->thread.vrsave = vrsave;
-	}
-
-	err |= __put_user(vrsave, (u32 __user *)&v_regs[33]);
+	err |= __put_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33]);
 #else /* CONFIG_ALTIVEC */
 	err |= __put_user(0, &sc->v_regs);
 #endif /* CONFIG_ALTIVEC */
-	flush_fp_to_thread(tsk);
 	/* copy fpr regs and fpscr */
 	err |= copy_fpr_to_user(&sc->fp_regs, tsk);
 
@@ -150,7 +159,6 @@ static long setup_sigcontext(struct sigcontext __user *sc,
 	 * VMX data.
 	 */
 	if (tsk->thread.used_vsr && ctx_has_vsx_region) {
-		flush_vsx_to_thread(tsk);
 		v_regs += ELF_NVRREG;
 		err |= copy_vsx_to_user(v_regs, tsk);
 		/* set MSR_VSX in the MSR value in the frame to
@@ -655,6 +663,7 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 		ctx_has_vsx_region = 1;
 
 	if (old_ctx != NULL) {
+		prepare_setup_sigcontext(current);
 		if (!access_ok(old_ctx, ctx_size)
 		    || setup_sigcontext(&old_ctx->uc_mcontext, current, 0, NULL, 0,
 					ctx_has_vsx_region)
@@ -842,6 +851,7 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 #endif
 	{
 		err |= __put_user(0, &frame->uc.uc_link);
+		prepare_setup_sigcontext(tsk);
 		err |= setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
 					NULL, (unsigned long)ksig->ka.sa.sa_handler,
 					1);
-- 
2.26.1

