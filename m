Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3019B306C29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 05:22:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR6km35PBzDrYZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 15:22:24 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR6LG6yPczDrg7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 15:04:38 +1100 (AEDT)
Received: from MTA-09-3.privateemail.com (mta-09.privateemail.com
 [198.54.127.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h3.fbrelay.privateemail.com (Postfix) with ESMTPS id 474E480210
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 23:04:35 -0500 (EST)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id 7985E600FE;
 Wed, 27 Jan 2021 23:04:32 -0500 (EST)
Received: from oc8246131445.ibm.com (unknown [10.20.151.215])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id 3B741600FF;
 Thu, 28 Jan 2021 04:04:32 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 08/10] powerpc/signal64: Rewrite handle_rt_signal64() to
 minimise uaccess switches
Date: Wed, 27 Jan 2021 22:04:22 -0600
Message-Id: <20210128040424.12720-9-cmr@codefail.de>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210128040424.12720-1-cmr@codefail.de>
References: <20210128040424.12720-1-cmr@codefail.de>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Daniel Axtens <dja@axtens.net>

Add uaccess blocks and use the 'unsafe' versions of functions doing user
access where possible to reduce the number of times uaccess has to be
opened/closed.

There is no 'unsafe' version of copy_siginfo_to_user, so move it
slightly to allow for a "longer" uaccess block.

Signed-off-by: Daniel Axtens <dja@axtens.net>
Co-developed-by: Christopher M. Riedl <cmr@codefail.de>
Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal_64.c | 54 +++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index d668f8af18fe..a471e97589a8 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -849,44 +849,51 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	unsigned long msr = regs->msr;
 
 	frame = get_sigframe(ksig, tsk, sizeof(*frame), 0);
-	if (!access_ok(frame, sizeof(*frame)))
-		goto badframe;
 
-	err |= __put_user(&frame->info, &frame->pinfo);
-	err |= __put_user(&frame->uc, &frame->puc);
-	err |= copy_siginfo_to_user(&frame->info, &ksig->info);
-	if (err)
+	/* This only applies when calling unsafe_setup_sigcontext() and must be
+	 * called before opening the uaccess window.
+	 */
+	if (!MSR_TM_ACTIVE(msr))
+		prepare_setup_sigcontext(tsk, 1);
+
+	if (!user_write_access_begin(frame, sizeof(*frame)))
 		goto badframe;
 
+	unsafe_put_user(&frame->info, &frame->pinfo, badframe_block);
+	unsafe_put_user(&frame->uc, &frame->puc, badframe_block);
+
 	/* Create the ucontext.  */
-	err |= __put_user(0, &frame->uc.uc_flags);
-	err |= __save_altstack(&frame->uc.uc_stack, regs->gpr[1]);
+	unsafe_put_user(0, &frame->uc.uc_flags, badframe_block);
+	unsafe_save_altstack(&frame->uc.uc_stack, regs->gpr[1], badframe_block);
 
 	if (MSR_TM_ACTIVE(msr)) {
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 		/* The ucontext_t passed to userland points to the second
 		 * ucontext_t (for transactional state) with its uc_link ptr.
 		 */
-		err |= __put_user(&frame->uc_transact, &frame->uc.uc_link);
+		unsafe_put_user(&frame->uc_transact, &frame->uc.uc_link, badframe_block);
+
+		user_write_access_end();
+
 		err |= setup_tm_sigcontexts(&frame->uc.uc_mcontext,
 					    &frame->uc_transact.uc_mcontext,
 					    tsk, ksig->sig, NULL,
 					    (unsigned long)ksig->ka.sa.sa_handler,
 					    msr);
+
+		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
+			goto badframe;
+
 #endif
 	} else {
-		err |= __put_user(0, &frame->uc.uc_link);
-		prepare_setup_sigcontext(tsk, 1);
-		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
-			return -EFAULT;
-		err |= __unsafe_setup_sigcontext(&frame->uc.uc_mcontext, tsk,
-						ksig->sig, NULL,
-						(unsigned long)ksig->ka.sa.sa_handler, 1);
-		user_write_access_end();
+		unsafe_put_user(0, &frame->uc.uc_link, badframe_block);
+		unsafe_setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
+					NULL, (unsigned long)ksig->ka.sa.sa_handler,
+					1, badframe_block);
 	}
-	err |= __copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set));
-	if (err)
-		goto badframe;
+
+	unsafe_copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set), badframe_block);
+	user_write_access_end();
 
 	/* Make sure signal handler doesn't get spurious FP exceptions */
 	tsk->thread.fp_state.fpscr = 0;
@@ -901,6 +908,11 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 		regs->nip = (unsigned long) &frame->tramp[0];
 	}
 
+
+	/* Save the siginfo outside of the unsafe block. */
+	if (copy_siginfo_to_user(&frame->info, &ksig->info))
+		goto badframe;
+
 	/* Allocate a dummy caller frame for the signal handler. */
 	newsp = ((unsigned long)frame) - __SIGNAL_FRAMESIZE;
 	err |= put_user(regs->gpr[1], (unsigned long __user *)newsp);
@@ -940,6 +952,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 
 	return 0;
 
+badframe_block:
+	user_write_access_end();
 badframe:
 	signal_fault(current, regs, "handle_rt_signal64", frame);
 
-- 
2.26.1

