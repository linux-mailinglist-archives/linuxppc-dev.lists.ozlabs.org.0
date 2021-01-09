Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AD62EFD9A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jan 2021 04:47:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DCQrz1qjpzDq9Z
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jan 2021 14:47:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=131.153.2.42;
 helo=h1.fbrelay.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from h1.fbrelay.privateemail.com (h1.fbrelay.privateemail.com
 [131.153.2.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DCQbm65DRzDqwg
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jan 2021 14:35:47 +1100 (AEDT)
Received: from MTA-07-4.privateemail.com (mta-07.privateemail.com
 [198.54.127.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 5CEC380349
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jan 2021 22:26:16 -0500 (EST)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id A6432600CD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jan 2021 22:26:05 -0500 (EST)
Received: from oc8246131445.ibm.com (unknown [10.20.151.217])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id 77EE1600CE
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jan 2021 03:26:05 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/8] powerpc/signal64: Move non-inline functions out of
 setup_sigcontext()
Date: Fri,  8 Jan 2021 21:25:52 -0600
Message-Id: <20210109032557.13831-4-cmr@codefail.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210109032557.13831-1-cmr@codefail.de>
References: <20210109032557.13831-1-cmr@codefail.de>
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

There are non-inline functions which get called in setup_sigcontext() to
save register state to the thread struct. Move these functions into a
separate prepare_setup_sigcontext() function so that
setup_sigcontext() can be refactored later into an "unsafe" version
which assumes an open uaccess window. Non-inline functions should be
avoided when uaccess is open.

The majority of setup_sigcontext() can be refactored to execute in an
"unsafe" context (uaccess window is opened) except for some non-inline
functions. Move these out into a separate prepare_setup_sigcontext()
function which must be called first and before opening up a uaccess
window. A follow-up commit converts setup_sigcontext() to be "unsafe".

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal_64.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index f9e4a1ac440f..b211a8ea4f6e 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -79,6 +79,24 @@ static elf_vrreg_t __user *sigcontext_vmx_regs(struct sigcontext __user *sc)
 }
 #endif
 
+static void prepare_setup_sigcontext(struct task_struct *tsk, int ctx_has_vsx_region)
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
+	if (tsk->thread.used_vsr && ctx_has_vsx_region)
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
+		prepare_setup_sigcontext(current, ctx_has_vsx_region);
 		if (!access_ok(old_ctx, ctx_size)
 		    || setup_sigcontext(&old_ctx->uc_mcontext, current, 0, NULL, 0,
 					ctx_has_vsx_region)
@@ -842,6 +851,7 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 #endif
 	{
 		err |= __put_user(0, &frame->uc.uc_link);
+		prepare_setup_sigcontext(tsk, 1);
 		err |= setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
 					NULL, (unsigned long)ksig->ka.sa.sa_handler,
 					1);
-- 
2.26.1

