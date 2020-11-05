Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BB52A76D8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 06:18:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRWxy4dm1zDqnn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 16:18:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.72;
 helo=se15-1.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se15-1.privateemail.com (se15-1.privateemail.com
 [198.54.127.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRWrb0vcfzDqhT
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 16:13:34 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se15.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>) id 1kaXaT-0002jr-Cn
 for linuxppc-dev@lists.ozlabs.org; Wed, 04 Nov 2020 21:13:31 -0800
Received: from MTA-11.privateemail.com (unknown [10.20.147.23])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id A60A5A76
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 05:13:28 +0000 (UTC)
Received: from mta-11.privateemail.com (localhost [127.0.0.1])
 by mta-11.privateemail.com (Postfix) with ESMTP id 9432780046
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 00:13:28 -0500 (EST)
Received: from geist.attlocal.net (unknown [10.20.151.249])
 by mta-11.privateemail.com (Postfix) with ESMTPA id 6052F80041
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 05:13:28 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/8] powerpc/signal64: Remove TM ifdefery in middle of
 if/else block
Date: Wed,  4 Nov 2020 23:16:57 -0600
Message-Id: <20201105051701.25053-5-cmr@codefail.de>
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
X-SpamExperts-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0XvADx2zSFwG+3csxFBPBHmpSDasLI4SayDByyq9LIhVFHbVCUzxpRV5
 bX0P9rnzN0TNWdUk1Ol2OGx3IfrIJKywOmJyM1qr8uRnWBrbSAGD34MCL/enst4vEtpA4leDRT1y
 xwOMUv2um0QcmoO8mg24Dcwf+CZK8NXgy3In+fX74TQPFONeGKL3AGdrhYhUqlO05s+oip5EC/YK
 rMQ9+O92RfE6OSObaNx/GIkER/ho6hfscI36S5ZyZNhIm1qgi83+PBTijYijPG8NZSI4ZQ7w5N/o
 jaomCoWWiTtol8oIjMLSPcwmNI0TQjQbbn/msxmYvSRMYhU3cO2EzUHwVXEwQzgH3ZUltkgdVMpa
 zhNDPjwfaB2rE/S2BhQBkwlK0UgKCrov1GasWV1vj2C+0pcXuAT86WptVNwo/cWcelODMVhfRAfm
 ME3CBgei5d0ipWZHuZ2luxkemtGoNxZUQqTo/wKPvFA5qTwvBasVtSz0gfFrL3927nPLXidUYhzT
 L3iFCDAL0QosIifn4ScHG4ifU642KNtk4n/u8nyV2xsjehIqUczFWeS6sE8e1b5/Uj/i4hYVfUxI
 FxiN15g3w5xXw7ICF89SRx911u2+L1VDWTXxQxalx1UzmAX+Mm3XrG7FkyAl4ZQlzu9GPuOs5D19
 /g2jc+cmcR6COdjBd+CE1m+Kp1KCPGoyG38yARaHof3QzxUBjDlIxq/CY6GWA8+LBDMrD7q/cJog
 wbqzsuoky0Qu9o0UsJYe8KzUZOzYBJq7nLN6wi0+LTtGPl8kCiqvQ3dW14fcwg6tXLnl97peaxRr
 Zz2P8ZZYmW8oaAt4NHLYM3A6BXfvel8OEFDbU52Uoxy7ZVs22aLE5aXKh2Z2/SyswYYxeanpYW+O
 DenQmhIuIkxkuoNHoZV8ALzej/7m/TG6mPfH0STtFp8lq4mlVm2lHuINJIGiJ73RKeuKpUVINNG3
 OVUHjoaAVY6FvR05Ix7/C9VwqPH/5QpQnZ0BJh1tDfjT4hz4J/ncsYb09chmWIDGRew9XvW9QFDz
 YgSG3lyuFjEDwoOBw76gv6dU
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

Similar to commit 1c32940f5220 ("powerpc/signal32: Remove ifdefery in
middle of if/else") for PPC32, remove the messy ifdef. Unlike PPC32, the
ifdef cannot be removed entirely since the uc_transact member of the
sigframe depends on CONFIG_PPC_TRANSACTIONAL_MEM=y.

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal_64.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index ece1f982dd05..d3e9519b2e62 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -710,9 +710,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	struct pt_regs *regs = current_pt_regs();
 	struct ucontext __user *uc = (struct ucontext __user *)regs->gpr[1];
 	sigset_t set;
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	unsigned long msr;
-#endif
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
@@ -762,10 +760,12 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	 * restore_tm_sigcontexts.
 	 */
 	regs->msr &= ~MSR_TS_MASK;
+#endif
 
 	if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
 		goto badframe;
 	if (MSR_TM_ACTIVE(msr)) {
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 		/* We recheckpoint on return. */
 		struct ucontext __user *uc_transact;
 
@@ -778,9 +778,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		if (restore_tm_sigcontexts(current, &uc->uc_mcontext,
 					   &uc_transact->uc_mcontext))
 			goto badframe;
-	} else
 #endif
-	{
+	} else {
 		/*
 		 * Fall through, for non-TM restore
 		 *
@@ -818,10 +817,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	unsigned long newsp = 0;
 	long err = 0;
 	struct pt_regs *regs = tsk->thread.regs;
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	/* Save the thread's msr before get_tm_stackpointer() changes it */
-	unsigned long msr = regs->msr;
-#endif
+	unsigned long msr __maybe_unused = regs->msr;
 
 	frame = get_sigframe(ksig, tsk, sizeof(*frame), 0);
 	if (!access_ok(frame, sizeof(*frame)))
@@ -836,8 +833,9 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	/* Create the ucontext.  */
 	err |= __put_user(0, &frame->uc.uc_flags);
 	err |= __save_altstack(&frame->uc.uc_stack, regs->gpr[1]);
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+
 	if (MSR_TM_ACTIVE(msr)) {
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 		/* The ucontext_t passed to userland points to the second
 		 * ucontext_t (for transactional state) with its uc_link ptr.
 		 */
@@ -847,9 +845,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 					    tsk, ksig->sig, NULL,
 					    (unsigned long)ksig->ka.sa.sa_handler,
 					    msr);
-	} else
 #endif
-	{
+	} else {
 		err |= __put_user(0, &frame->uc.uc_link);
 		prepare_setup_sigcontext(tsk, 1);
 		err |= setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
-- 
2.29.0

