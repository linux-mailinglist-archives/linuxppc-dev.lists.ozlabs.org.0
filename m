Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA9A28F5CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 17:26:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBtRd6NmgzDqYS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 02:26:37 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBtPV2w9PzDqY5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 02:24:46 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se17.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>) id 1kT4iV-0007rU-DV
 for linuxppc-dev@lists.ozlabs.org; Thu, 15 Oct 2020 07:59:01 -0700
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id F3F02A77
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 14:58:53 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id D920A80050
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 10:58:53 -0400 (EDT)
Received: from geist.attlocal.net (unknown [10.20.151.235])
 by mta-11.privateemail.com (Postfix) with ESMTPA id A9C0380041
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 14:58:53 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/8] powerpc/signal64: Replace restore_sigcontext() w/
 unsafe_restore_sigcontext()
Date: Thu, 15 Oct 2020 10:01:56 -0500
Message-Id: <20201015150159.28933-6-cmr@codefail.de>
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
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00493789491363)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0ZXzIHSbE2lF8iY6Od2jmSypSDasLI4SayDByyq9LIhVz8nZkrpP6ZTK
 IcelfhtaHkTNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGD34MCL/enst4vEtpA4leDRT1y
 xwOMUv2um0QcmoO8mg24Dcwf+CZK8NXgy3In+fX7hf7Gu3tmSu11tWFZquw8HFO05s+oip5EC/YK
 rMQ9+O92RfE6OSObaNx/GIkER/ho6hfscI36S5ZyZNhIm1qgiwgDRmu5tQENuqerHYiwxW7w5N/o
 jaomCoWWiTtol8oIjMLSPcwmNI0TQjQbbn/msxmYvSRMYhU3cO2EzUHwVXEwQzgH3ZUltkgdVMpa
 zhNDPjwfaB2rE/S2BhQBkwlK0UgKCrov1GasWV1vj2C+0pcXuAT86WptVNwo/cWcelODMVhfRAfm
 ME3CBgei5d0ipUHvm3Pq/TMVhLiLVSlbDnIEsVH1HkXSWW+lJituJnqw31/E3ahF5MMcDI7KdpjQ
 KUg2DwcIutxTdYYuCv7MB8w4iSij0rwbBa82X4V+KdE8ybxQmwA+8NxVIq0MJiSKg9jlDHh8k6TT
 dHl8m1/8O/92QjNLubgZSlcJjVjePeKVE0yhWxRviTEhnM4stux5zhImD2XryHHXvPaqNrPREOWT
 G1bmlWkaJteaOAtonp0aKrdh4Zr0iIVPBtQm6Hxv0WZJgVZw2KizLfHKT1Ui9eqnil7sNNnzdI7c
 WFzHzXcM92PNDpgLsd6Ddd/s7VM53ngEDB0hGM25vwdLItd8JHlwRg+9bWPA7CG7LJO22QfG5uwj
 3VKIhMn3+9f/r55/JY4Qcb7FsEPquBVQuuCzb71c9aUV1oY4fX3W5eOCNA39ksRRE30nnfZObe7o
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

Previously restore_sigcontext() performed a costly KUAP switch on every
uaccess operation. These repeated uaccess switches cause a significant
drop in signal handling performance.

Rewrite restore_sigcontext() to assume that a userspace read access
window is open. Replace all uaccess functions with their 'unsafe'
versions which avoid the repeated uaccess switches.

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal_64.c | 68 ++++++++++++++++++++-------------
 1 file changed, 41 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 26934ceeb925..bd92064e5576 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -318,14 +318,14 @@ static long setup_tm_sigcontexts(struct sigcontext __user *sc,
 /*
  * Restore the sigcontext from the signal frame.
  */
-
-static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
-			      struct sigcontext __user *sc)
+#define unsafe_restore_sigcontext(tsk, set, sig, sc, e) \
+	unsafe_op_wrap(__unsafe_restore_sigcontext(tsk, set, sig, sc), e)
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
@@ -340,27 +340,28 @@ static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
 		save_r13 = regs->gpr[13];
 
 	/* copy the GPRs */
-	err |= __copy_from_user(regs->gpr, sc->gp_regs, sizeof(regs->gpr));
-	err |= __get_user(regs->nip, &sc->gp_regs[PT_NIP]);
+	unsafe_copy_from_user(regs->gpr, sc->gp_regs, sizeof(regs->gpr),
+			      efault_out);
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
@@ -370,29 +371,28 @@ static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
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
+		unsafe_get_user(tsk->thread.vrsave, (u32 __user *)&v_regs[33],
+				efault_out);
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
@@ -401,14 +401,17 @@ static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
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
@@ -692,8 +695,14 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
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
@@ -798,8 +807,13 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		 * causing a TM bad thing.
 		 */
 		current->thread.regs->msr &= ~MSR_TS_MASK;
-		if (restore_sigcontext(current, NULL, 1, &uc->uc_mcontext))
+		if (!user_read_access_begin(uc, sizeof(*uc)))
+			return -EFAULT;
+		if (__unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext)) {
+			user_read_access_end();
 			goto badframe;
+		}
+		user_read_access_end();
 	}
 
 	if (restore_altstack(&uc->uc_stack))
-- 
2.28.0

