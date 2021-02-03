Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB4030E2D1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 19:53:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW9mY1t85zF325
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 05:53:01 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW9Yg4XNszDwtn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 05:43:34 +1100 (AEDT)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id B255A60060
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 13:43:32 -0500 (EST)
Received: from oc8246131445.ibm.com (unknown [10.20.151.227])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id 8362160064
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 18:43:32 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 10/10] powerpc/signal64: Use __get_user() to copy sigset_t
Date: Wed,  3 Feb 2021 12:43:23 -0600
Message-Id: <20210203184323.20792-11-cmr@codefail.de>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Usually sigset_t is exactly 8B which is a "trivial" size and does not
warrant using __copy_from_user(). Use __get_user() directly in
anticipation of future work to remove the trivial size optimizations
from __copy_from_user(). Calling __get_user() also results in a small
boost to signal handling throughput here.

Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
---
 arch/powerpc/kernel/signal_64.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 817b64e1e409..42fdc4a7ff72 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -97,6 +97,14 @@ static void prepare_setup_sigcontext(struct task_struct *tsk, int ctx_has_vsx_re
 #endif /* CONFIG_VSX */
 }
 
+static inline int get_user_sigset(sigset_t *dst, const sigset_t *src)
+{
+	if (sizeof(sigset_t) <= 8)
+		return __get_user(dst->sig[0], &src->sig[0]);
+	else
+		return __copy_from_user(dst, src, sizeof(sigset_t));
+}
+
 /*
  * Set up the sigcontext for the signal frame.
  */
@@ -701,8 +709,9 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 	 * We kill the task with a SIGSEGV in this situation.
 	 */
 
-	if (__copy_from_user(&set, &new_ctx->uc_sigmask, sizeof(set)))
+	if (get_user_sigset(&set, &new_ctx->uc_sigmask))
 		do_exit(SIGSEGV);
+
 	set_current_blocked(&set);
 
 	if (!user_read_access_begin(new_ctx, ctx_size))
@@ -740,8 +749,9 @@ SYSCALL_DEFINE0(rt_sigreturn)
 	if (!access_ok(uc, sizeof(*uc)))
 		goto badframe;
 
-	if (__copy_from_user(&set, &uc->uc_sigmask, sizeof(set)))
+	if (get_user_sigset(&set, &uc->uc_sigmask))
 		goto badframe;
+
 	set_current_blocked(&set);
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-- 
2.26.1

