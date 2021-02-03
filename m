Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC7230E2C3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 19:48:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW9gN6ySPzF0ld
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 05:48:32 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW9Yf37FBzDwrc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 05:43:33 +1100 (AEDT)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 1F63560050;
 Wed,  3 Feb 2021 13:43:32 -0500 (EST)
Received: from oc8246131445.ibm.com (unknown [10.20.151.227])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id D2C1760062;
 Wed,  3 Feb 2021 18:43:31 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 08/10] powerpc/signal64: Rewrite handle_rt_signal64() to
 minimise uaccess switches
Date: Wed,  3 Feb 2021 12:43:21 -0600
Message-Id: <20210203184323.20792-9-cmr@codefail.de>
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

