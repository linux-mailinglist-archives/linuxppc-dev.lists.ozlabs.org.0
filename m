Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6322A76D6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 06:16:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRWwN3d21zDqmX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 16:16:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.80;
 helo=se17-1.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se17-1.privateemail.com (se17-1.privateemail.com
 [198.54.127.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRWrZ6RKCzDqhH
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 16:13:34 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se17.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>) id 1kaXaS-00037N-Ec
 for linuxppc-dev@lists.ozlabs.org; Wed, 04 Nov 2020 21:13:31 -0800
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 67384A75
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 05:13:28 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 4A73680046
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 00:13:28 -0500 (EST)
Received: from geist.attlocal.net (unknown [10.20.151.249])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 178DF80041
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 05:13:28 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/8] powerpc/signal64: Move non-inline functions out of
 setup_sigcontext()
Date: Wed,  4 Nov 2020 23:16:56 -0600
Message-Id: <20201105051701.25053-4-cmr@codefail.de>
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
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00175186975161)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0XvADx2zSFwG+3csxFBPBHmpSDasLI4SayDByyq9LIhVccZ81YtPcHdO
 /fQ79K1Jm0TNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGD34MCL/enst4vEtpA4leDRT1y
 xwOMUv2um0QcmoO8mg24Dcwf+CZK8NXgy3In+fX7MoOEEn4Ii5q0cO5ycywWC1O05s+oip5EC/YK
 rMQ9+O92RfE6OSObaNx/GIkER/ho6hfscI36S5ZyZNhIm1qgiwgDRmu5tQENuqerHYiwxW7w5N/o
 jaomCoWWiTtol8oIjMLSPcwmNI0TQjQbbn/msxmYvSRMYhU3cO2EzUHwVXEwQzgH3ZUltkgdVMpa
 zhNDPjwfaB2rE/S2BhQBkwlK0UgKCrov1GasWV1vj2C+0pcXuAT86WptVNwo/cWcelODMVhfRAfm
 ME3CBgei5d0ipUHvm3Pq/TMVhLiLVSlbDnIEsVH1HkXSWW+lJituJnqw31/E3ahF5MMcDI7KdpjQ
 KUg2DwcIutxTdYYuCv7MB8w4iSij0rwbBa82X4V+KdE8ybxQmwA+8NxVIq0MJiSKg9jlDHh8k6TT
 dHl8m1/8O/92QjNLubgZSlcJjVjePeKVE0yhWxRviTEhnM4stux5zs2eyc346LIB3Zm3bJBgM0nW
 nv2O+GUciRvT7igjbfErk96o3St71Wz+O6zpANdYmWZJgVZw2KizLfHKT1Ui9eqnil7sNNnzdI7c
 WFzHzXcM92PNDpgLsd6Ddd/s7VM53ngEDB0hGM25vwdLItd8JHlwRg+9bWPA7CG7LJO22QfGpvIQ
 LT5rkrG+KrR4dVWHxtCTj6f3TiNQbf9L/ZKofeFc9aUV1oY4fX3W5eOCNA39ksRRE30nnfZObe7o
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

There are non-inline functions which get called in setup_sigcontext() to
save register state to the thread struct. Move these functions into a
separate prepare_setup_sigcontext() function so that
setup_sigcontext() can be refactored later into an "unsafe" version
which assumes an open uaccess window. Non-inline functions should be
avoided when uaccess is open.

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal_64.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 7df088b9ad0f..ece1f982dd05 100644
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
2.29.0

