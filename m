Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B355130E2CA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 19:50:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW9k50qQjzF1fj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 05:50:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW9Yg270bzDww9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 05:43:34 +1100 (AEDT)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id 7316360062;
 Wed,  3 Feb 2021 13:43:32 -0500 (EST)
Received: from oc8246131445.ibm.com (unknown [10.20.151.227])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id 3204160060;
 Wed,  3 Feb 2021 18:43:32 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 09/10] powerpc/signal64: Rewrite rt_sigreturn() to minimise
 uaccess switches
Date: Wed,  3 Feb 2021 12:43:22 -0600
Message-Id: <20210203184323.20792-10-cmr@codefail.de>
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

Signed-off-by: Daniel Axtens <dja@axtens.net>
Co-developed-by: Christopher M. Riedl <cmr@codefail.de>
Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal_64.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index a471e97589a8..817b64e1e409 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -782,9 +782,13 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	 * restore_tm_sigcontexts.
 	 */
 	regs->msr &= ~MSR_TS_MASK;
+#endif
 
-	if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
+	if (!user_read_access_begin(uc, sizeof(*uc)))
 		goto badframe;
+
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	unsafe_get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR], badframe_block);
 #endif
 
 	if (MSR_TM_ACTIVE(msr)) {
@@ -794,10 +798,12 @@ SYSCALL_DEFINE0(rt_sigreturn)
 
 		/* Trying to start TM on non TM system */
 		if (!cpu_has_feature(CPU_FTR_TM))
-			goto badframe;
+			goto badframe_block;
+
+		unsafe_get_user(uc_transact, &uc->uc_link, badframe_block);
+
+		user_read_access_end();
 
-		if (__get_user(uc_transact, &uc->uc_link))
-			goto badframe;
 		if (restore_tm_sigcontexts(current, &uc->uc_mcontext,
 					   &uc_transact->uc_mcontext))
 			goto badframe;
@@ -816,12 +822,9 @@ SYSCALL_DEFINE0(rt_sigreturn)
 		 * causing a TM bad thing.
 		 */
 		current->thread.regs->msr &= ~MSR_TS_MASK;
-		if (!user_read_access_begin(uc, sizeof(*uc)))
-			return -EFAULT;
-		if (__unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext)) {
-			user_read_access_end();
-			goto badframe;
-		}
+		unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext,
+					  badframe_block);
+
 		user_read_access_end();
 	}
 
@@ -831,6 +834,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	set_thread_flag(TIF_RESTOREALL);
 	return 0;
 
+badframe_block:
+	user_read_access_end();
 badframe:
 	signal_fault(current, regs, "rt_sigreturn", uc);
 
-- 
2.26.1

