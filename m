Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3E6326AFA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 02:15:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DnT8g73fyz3dYF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Feb 2021 12:14:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=131.153.2.43;
 helo=h2.fbrelay.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Received: from h2.fbrelay.privateemail.com (h2.fbrelay.privateemail.com
 [131.153.2.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DnT6g4rNfz3cYJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 12:13:15 +1100 (AEDT)
Received: from MTA-14-4.privateemail.com (mta-14.privateemail.com
 [198.54.118.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id D688180C6E
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 20:13:10 -0500 (EST)
Received: from mta-14.privateemail.com (localhost [127.0.0.1])
 by mta-14.privateemail.com (Postfix) with ESMTP id 23DEF8007E
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 20:13:08 -0500 (EST)
Received: from oc8246131445.ibm.com (unknown [10.20.151.203])
 by mta-14.privateemail.com (Postfix) with ESMTPA id E8A0380085
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Feb 2021 01:13:07 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 05/10] powerpc/signal64: Remove TM ifdefery in middle of
 if/else block
Date: Fri, 26 Feb 2021 19:12:54 -0600
Message-Id: <20210227011259.11992-6-cmr@codefail.de>
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

Both rt_sigreturn() and handle_rt_signal_64() contain TM-related ifdefs
which break-up an if/else block. Provide stubs for the ifdef-guarded TM
functions and remove the need for an ifdef in rt_sigreturn().

Rework the remaining TM ifdef in handle_rt_signal64() similar to
commit f1cf4f93de2f ("powerpc/signal32: Remove ifdefery in middle of if/else").

Unlike in the commit for ppc32, the ifdef can't be removed entirely
since uc_transact in sigframe depends on CONFIG_PPC_TRANSACTIONAL_MEM.

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/process.c   |   3 +-
 arch/powerpc/kernel/signal_64.c | 102 ++++++++++++++++----------------
 2 files changed, 54 insertions(+), 51 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 924d023dad0a..08c3fbe45921 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1117,9 +1117,10 @@ void restore_tm_state(struct pt_regs *regs)
 	regs->msr |= msr_diff;
 }
 
-#else
+#else /* !CONFIG_PPC_TRANSACTIONAL_MEM */
 #define tm_recheckpoint_new_task(new)
 #define __switch_to_tm(prev, new)
+void tm_reclaim_current(uint8_t cause) {}
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
 
 static inline void save_sprs(struct thread_struct *t)
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 6ca546192cbf..bd8d210c9115 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -594,6 +594,12 @@ static long restore_tm_sigcontexts(struct task_struct *tsk,
 
 	return err;
 }
+#else /* !CONFIG_PPC_TRANSACTIONAL_MEM */
+static long restore_tm_sigcontexts(struct task_struct *tsk, struct sigcontext __user *sc,
+				   struct sigcontext __user *tm_sc)
+{
+	return -EINVAL;
+}
 #endif
 
 /*
@@ -710,9 +716,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	struct pt_regs *regs = current_pt_regs();
 	struct ucontext __user *uc = (struct ucontext __user *)regs->gpr[1];
 	sigset_t set;
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	unsigned long msr;
-#endif
 
 	/* Always make any pending restarted system calls return -EINTR */
 	current->restart_block.fn = do_no_restart_syscall;
@@ -724,48 +728,50 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		goto badframe;
 	set_current_blocked(&set);
 
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	/*
-	 * If there is a transactional state then throw it away.
-	 * The purpose of a sigreturn is to destroy all traces of the
-	 * signal frame, this includes any transactional state created
-	 * within in. We only check for suspended as we can never be
-	 * active in the kernel, we are active, there is nothing better to
-	 * do than go ahead and Bad Thing later.
-	 * The cause is not important as there will never be a
-	 * recheckpoint so it's not user visible.
-	 */
-	if (MSR_TM_SUSPENDED(mfmsr()))
-		tm_reclaim_current(0);
+	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM)) {
+		/*
+		 * If there is a transactional state then throw it away.
+		 * The purpose of a sigreturn is to destroy all traces of the
+		 * signal frame, this includes any transactional state created
+		 * within in. We only check for suspended as we can never be
+		 * active in the kernel, we are active, there is nothing better to
+		 * do than go ahead and Bad Thing later.
+		 * The cause is not important as there will never be a
+		 * recheckpoint so it's not user visible.
+		 */
+		if (MSR_TM_SUSPENDED(mfmsr()))
+			tm_reclaim_current(0);
 
-	/*
-	 * Disable MSR[TS] bit also, so, if there is an exception in the
-	 * code below (as a page fault in copy_ckvsx_to_user()), it does
-	 * not recheckpoint this task if there was a context switch inside
-	 * the exception.
-	 *
-	 * A major page fault can indirectly call schedule(). A reschedule
-	 * process in the middle of an exception can have a side effect
-	 * (Changing the CPU MSR[TS] state), since schedule() is called
-	 * with the CPU MSR[TS] disable and returns with MSR[TS]=Suspended
-	 * (switch_to() calls tm_recheckpoint() for the 'new' process). In
-	 * this case, the process continues to be the same in the CPU, but
-	 * the CPU state just changed.
-	 *
-	 * This can cause a TM Bad Thing, since the MSR in the stack will
-	 * have the MSR[TS]=0, and this is what will be used to RFID.
-	 *
-	 * Clearing MSR[TS] state here will avoid a recheckpoint if there
-	 * is any process reschedule in kernel space. The MSR[TS] state
-	 * does not need to be saved also, since it will be replaced with
-	 * the MSR[TS] that came from user context later, at
-	 * restore_tm_sigcontexts.
-	 */
-	regs->msr &= ~MSR_TS_MASK;
+		/*
+		 * Disable MSR[TS] bit also, so, if there is an exception in the
+		 * code below (as a page fault in copy_ckvsx_to_user()), it does
+		 * not recheckpoint this task if there was a context switch inside
+		 * the exception.
+		 *
+		 * A major page fault can indirectly call schedule(). A reschedule
+		 * process in the middle of an exception can have a side effect
+		 * (Changing the CPU MSR[TS] state), since schedule() is called
+		 * with the CPU MSR[TS] disable and returns with MSR[TS]=Suspended
+		 * (switch_to() calls tm_recheckpoint() for the 'new' process). In
+		 * this case, the process continues to be the same in the CPU, but
+		 * the CPU state just changed.
+		 *
+		 * This can cause a TM Bad Thing, since the MSR in the stack will
+		 * have the MSR[TS]=0, and this is what will be used to RFID.
+		 *
+		 * Clearing MSR[TS] state here will avoid a recheckpoint if there
+		 * is any process reschedule in kernel space. The MSR[TS] state
+		 * does not need to be saved also, since it will be replaced with
+		 * the MSR[TS] that came from user context later, at
+		 * restore_tm_sigcontexts.
+		 */
+		regs->msr &= ~MSR_TS_MASK;
 
-	if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
-		goto badframe;
-	if (MSR_TM_ACTIVE(msr)) {
+		if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
+			goto badframe;
+	}
+
+	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) && MSR_TM_ACTIVE(msr)) {
 		/* We recheckpoint on return. */
 		struct ucontext __user *uc_transact;
 
@@ -778,9 +784,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		if (restore_tm_sigcontexts(current, &uc->uc_mcontext,
 					   &uc_transact->uc_mcontext))
 			goto badframe;
-	} else
-#endif
-	{
+	} else {
 		/*
 		 * Fall through, for non-TM restore
 		 *
@@ -818,10 +822,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	unsigned long newsp = 0;
 	long err = 0;
 	struct pt_regs *regs = tsk->thread.regs;
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	/* Save the thread's msr before get_tm_stackpointer() changes it */
 	unsigned long msr = regs->msr;
-#endif
 
 	frame = get_sigframe(ksig, tsk, sizeof(*frame), 0);
 	if (!access_ok(frame, sizeof(*frame)))
@@ -836,8 +838,9 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
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
@@ -847,9 +850,8 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 					    tsk, ksig->sig, NULL,
 					    (unsigned long)ksig->ka.sa.sa_handler,
 					    msr);
-	} else
 #endif
-	{
+	} else {
 		err |= __put_user(0, &frame->uc.uc_link);
 		prepare_setup_sigcontext(tsk);
 		err |= setup_sigcontext(&frame->uc.uc_mcontext, tsk, ksig->sig,
-- 
2.26.1

