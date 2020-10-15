Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1EE28F5D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 17:28:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBtVF47BVzDqKq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 02:28:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.82;
 helo=se17-3.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se17-3.privateemail.com (se17-3.privateemail.com
 [198.54.127.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBtSg1YSSzDq7k
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 02:27:30 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se17.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>) id 1kT4iT-0007oL-PN
 for linuxppc-dev@lists.ozlabs.org; Thu, 15 Oct 2020 07:58:56 -0700
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id AF422A75
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 14:58:53 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 97C238004A
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 10:58:53 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.235])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 6B69C80041
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 14:58:53 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/8] powerpc/signal64: Replace setup_sigcontext() w/
 unsafe_setup_sigcontext()
Date: Thu, 15 Oct 2020 10:01:55 -0500
Message-Id: <20201015150159.28933-5-cmr@codefail.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201015150159.28933-1-cmr@codefail.de>
References: <20201015150159.28933-1-cmr@codefail.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00200134702358)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0ZXzIHSbE2lF8iY6Od2jmSypSDasLI4SayDByyq9LIhVJuLABkYbmpTn
 dwnEShQS3kTNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGD34MCL/enst4vEtpA4leDRT1y
 xwOMUv2um0QcmoO8mg24Dcwf+CZK8NXgy3In+fX7oN7OW/ejVR166W5x14x/yVO05s+oip5EC/YK
 rMQ9+O92RfE6OSObaNx/GIkER/ho6hfscI36S5ZyZNhIm1qgiwgDRmu5tQENuqerHYiwxW7w5N/o
 jaomCoWWiTtol8oIjMLSPcwmNI0TQjQbbn/msxmYvSRMYhU3cO2EzUHwVXEwQzgH3ZUltkgdVMpa
 zhNDPjwfaB2rE/S2BhQBkwlK0UgKCrov1GasWV1vj2C+0pcXuAT86WptVNwo/cWcelODMVhfRAfm
 ME3CBgei5d0ipUHvm3Pq/TMVhLiLVSlbDnIEsVH1HkXSWW+lJituJnqw31/E3ahF5MMcDI7KdpjQ
 KUg2DwcIutxTdYYuCv7MB8w4iSij0rwbBa82X4V+KdE8ybxQmwA+8NxVIq0MJiSKg9jlDHh8k6TT
 dHl8m1/8O/92QjNLubgZSlcJjVjePeKVE0yhWxRviTEhnM4stux5zs2eyc346LIB3Zm3bJBgM0mT
 G1bmlWkaJteaOAtonp0alQfoiURjh6BRAclh7WGQiWZJgVZw2KizLfHKT1Ui9eqnil7sNNnzdI7c
 WFzHzXcM92PNDpgLsd6Ddd/s7VM53ngEDB0hGM25vwdLItd8JHlwRg+9bWPA7CG7LJO22QfG5uwj
 3VKIhMn3+9f/r55/JcDDScHW42eCBk5kQu4jWldc9aUV1oY4fX3W5eOCNA39ksRRE30nnfZObe7o
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
 arch/powerpc/kernel/signal_64.c | 71 ++++++++++++++++++++-------------
 1 file changed, 44 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 7df088b9ad0f..26934ceeb925 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -83,9 +83,13 @@ static elf_vrreg_t __user *sigcontext_vmx_regs(struct sigcontext __user *sc)
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
@@ -101,21 +105,20 @@ static long setup_sigcontext(struct sigcontext __user *sc,
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
 		flush_altivec_to_thread(tsk);
 		/* Copy 33 vec registers (vr0..31 and vscr) to the stack */
-		err |= __copy_to_user(v_regs, &tsk->thread.vr_state,
-				      33 * sizeof(vector128));
+		unsafe_copy_to_user(v_regs, &tsk->thread.vr_state,
+				    33 * sizeof(vector128), efault_out);
 		/* set MSR_VEC in the MSR value in the frame to indicate that sc->v_reg)
 		 * contains valid data.
 		 */
@@ -130,13 +133,13 @@ static long setup_sigcontext(struct sigcontext __user *sc,
 		tsk->thread.vrsave = vrsave;
 	}
 
-	err |= __put_user(vrsave, (u32 __user *)&v_regs[33]);
+	unsafe_put_user(vrsave, (u32 __user *)&v_regs[33], efault_out);
 #else /* CONFIG_ALTIVEC */
-	err |= __put_user(0, &sc->v_regs);
+	unsafe_put_user(0, &sc->v_regs, efault_out);
 #endif /* CONFIG_ALTIVEC */
 	flush_fp_to_thread(tsk);
 	/* copy fpr regs and fpscr */
-	err |= copy_fpr_to_user(&sc->fp_regs, tsk);
+	unsafe_copy_fpr_to_user(&sc->fp_regs, tsk, efault_out);
 
 	/*
 	 * Clear the MSR VSX bit to indicate there is no valid state attached
@@ -152,24 +155,27 @@ static long setup_sigcontext(struct sigcontext __user *sc,
 	if (tsk->thread.used_vsr && ctx_has_vsx_region) {
 		flush_vsx_to_thread(tsk);
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
@@ -655,12 +661,15 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 		ctx_has_vsx_region = 1;
 
 	if (old_ctx != NULL) {
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
@@ -689,6 +698,10 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 	/* This returns like rt_sigreturn */
 	set_thread_flag(TIF_RESTOREALL);
 	return 0;
+
+efault_out:
+	user_write_access_end();
+	return -EFAULT;
 }
 
 
@@ -842,9 +855,13 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 #endif
 	{
 		err |= __put_user(0, &frame->uc.uc_link);
-		err |= setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
-					NULL, (unsigned long)ksig->ka.sa.sa_handler,
-					1);
+
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
2.28.0

