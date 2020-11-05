Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 477682A76ED
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 06:25:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRX5w1fBNzDqpg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 16:25:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.69;
 helo=se14-2.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se14-2.privateemail.com (se14-2.privateemail.com
 [198.54.127.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRWrb65DgzDqhm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 16:13:35 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se14.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>) id 1kaXaT-0008wa-1Y
 for linuxppc-dev@lists.ozlabs.org; Wed, 04 Nov 2020 21:13:32 -0800
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id EF2B0A77
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 05:13:28 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id DB13580046
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 00:13:28 -0500 (EST)
Received: from geist.attlocal.net (unknown [10.20.151.249])
 by mta-11.privateemail.com (Postfix) with ESMTPA id A92D180041
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 05:13:28 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/8] powerpc/signal64: Replace setup_sigcontext() w/
 unsafe_setup_sigcontext()
Date: Wed,  4 Nov 2020 23:16:58 -0600
Message-Id: <20201105051701.25053-6-cmr@codefail.de>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201105051701.25053-1-cmr@codefail.de>
References: <20201105051701.25053-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00185925233071)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0XvADx2zSFwG+3csxFBPBHmpSDasLI4SayDByyq9LIhV8m8dNaIjtcIj
 Q4Blq8Zfe0TNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGD34MCL/enst4vEtpA4leDRT1y
 xwOMUv2um0QcmoO8mg24Dcwf+CZK8NXgy3In+fX78ogAwlCpwyDx15kaaHSH71O05s+oip5EC/YK
 rMQ9+O92RfE6OSObaNx/GIkER/ho6hfscI36S5ZyZNhIm1qgix6Fhd62KY0TvtygpLSFJ3Lw5N/o
 jaomCoWWiTtol8oIjMLSPcwmNI0TQjQbbn/msxmYvSRMYhU3cO2EzUHwVXEwQzgH3ZUltkgdVMpa
 zhNDPjwfaB2rE/S2BhQBkwlK0UgKCrov1GasWV1vj2C+0pcXuAT86WptVNwo/cWcelODMVhfRAfm
 ME3CBgei5d0ipUHvm3Pq/TMVhLiLVSlbDnIEsVH1HkXSWW+lJituJnqw31/E3ahF5MMcDI7KdpjQ
 KUg2DwcIutxTdYYuCv7MB8w4iSij0rwbBa82X4V+KdE8ybxQmwA+8NxVIq0MJiSKg9jlDHh8k6TT
 dHl8m1/8O/92QjNLubgZSlcJjVjePeKVE0yhWxRviTEhnM4stux5zs2eyc346LIB3Zm3bJBgM0nW
 nv2O+GUciRvT7igjbfErYKokR7Oy7is2MWnnoOnCE2ZJgVZw2KizLfHKT1Ui9eqnil7sNNnzdI7c
 WFzHzXcM92PNDpgLsd6Ddd/s7VM53ngEDB0hGM25vwdLItd8JHlwRg+9bWPA7CG7LJO22QfGpvIQ
 LT5rkrG+KrR4dVWHxhIJwvlL/7nKi1H/aRg6rmZc9aUV1oY4fX3W5eOCNA39ksRRE30nnfZObe7o
 1mbr5b4m4O41f3i6XB3J2CA/ZpSpytsBXZZv0niRRFlqwL4JNTd9Km+1fuQNFP4CpCvZPbNBqyph
 zXy+6cTE/AxalG8BEiCj5vZGv9mneHqn4w6ZRYMJqVDlz3D3q3rGz4wpqbrr3vieQzASqOF9IoeU
 DZANWzkl2RGDx1/F1uE2HybNOt0p+xrrv5paups8mshKvA==
X-Report-Abuse-To: spam@se5.registrar-servers.com
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
index d3e9519b2e62..3f25309826b6 100644
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
 
 
@@ -849,9 +862,12 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
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
2.29.0

