Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FB39F41B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 22:28:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46J0nl2dD7zDqL7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 06:28:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46J0dJ4vw0zDqjl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 06:21:23 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9BCD0B626;
 Tue, 27 Aug 2019 20:21:20 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc: move common register copy functions from
 signal_32.c to signal.c
Date: Tue, 27 Aug 2019 22:21:07 +0200
Message-Id: <281030dd1e4d5a9650546a4beaf519eef3617de3.1566936688.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1566936688.git.msuchanek@suse.de>
References: <cover.1566936688.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: David Hildenbrand <david@redhat.com>, "Dmitry V. Levin" <ldv@altlinux.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Firoz Khan <firoz.khan@linaro.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>, Joel Stanley <joel@jms.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These functions are required for 64bit as well.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/kernel/signal.c    | 141 ++++++++++++++++++++++++++++++++
 arch/powerpc/kernel/signal_32.c | 140 -------------------------------
 2 files changed, 141 insertions(+), 140 deletions(-)

diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index e6c30cee6abf..60436432399f 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -18,12 +18,153 @@
 #include <linux/syscalls.h>
 #include <asm/hw_breakpoint.h>
 #include <linux/uaccess.h>
+#include <asm/switch_to.h>
 #include <asm/unistd.h>
 #include <asm/debug.h>
 #include <asm/tm.h>
 
 #include "signal.h"
 
+#ifdef CONFIG_VSX
+unsigned long copy_fpr_to_user(void __user *to,
+			       struct task_struct *task)
+{
+	u64 buf[ELF_NFPREG];
+	int i;
+
+	/* save FPR copy to local buffer then write to the thread_struct */
+	for (i = 0; i < (ELF_NFPREG - 1) ; i++)
+		buf[i] = task->thread.TS_FPR(i);
+	buf[i] = task->thread.fp_state.fpscr;
+	return __copy_to_user(to, buf, ELF_NFPREG * sizeof(double));
+}
+
+unsigned long copy_fpr_from_user(struct task_struct *task,
+				 void __user *from)
+{
+	u64 buf[ELF_NFPREG];
+	int i;
+
+	if (__copy_from_user(buf, from, ELF_NFPREG * sizeof(double)))
+		return 1;
+	for (i = 0; i < (ELF_NFPREG - 1) ; i++)
+		task->thread.TS_FPR(i) = buf[i];
+	task->thread.fp_state.fpscr = buf[i];
+
+	return 0;
+}
+
+unsigned long copy_vsx_to_user(void __user *to,
+			       struct task_struct *task)
+{
+	u64 buf[ELF_NVSRHALFREG];
+	int i;
+
+	/* save FPR copy to local buffer then write to the thread_struct */
+	for (i = 0; i < ELF_NVSRHALFREG; i++)
+		buf[i] = task->thread.fp_state.fpr[i][TS_VSRLOWOFFSET];
+	return __copy_to_user(to, buf, ELF_NVSRHALFREG * sizeof(double));
+}
+
+unsigned long copy_vsx_from_user(struct task_struct *task,
+				 void __user *from)
+{
+	u64 buf[ELF_NVSRHALFREG];
+	int i;
+
+	if (__copy_from_user(buf, from, ELF_NVSRHALFREG * sizeof(double)))
+		return 1;
+	for (i = 0; i < ELF_NVSRHALFREG ; i++)
+		task->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] = buf[i];
+	return 0;
+}
+
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+unsigned long copy_ckfpr_to_user(void __user *to,
+				  struct task_struct *task)
+{
+	u64 buf[ELF_NFPREG];
+	int i;
+
+	/* save FPR copy to local buffer then write to the thread_struct */
+	for (i = 0; i < (ELF_NFPREG - 1) ; i++)
+		buf[i] = task->thread.TS_CKFPR(i);
+	buf[i] = task->thread.ckfp_state.fpscr;
+	return __copy_to_user(to, buf, ELF_NFPREG * sizeof(double));
+}
+
+unsigned long copy_ckfpr_from_user(struct task_struct *task,
+					  void __user *from)
+{
+	u64 buf[ELF_NFPREG];
+	int i;
+
+	if (__copy_from_user(buf, from, ELF_NFPREG * sizeof(double)))
+		return 1;
+	for (i = 0; i < (ELF_NFPREG - 1) ; i++)
+		task->thread.TS_CKFPR(i) = buf[i];
+	task->thread.ckfp_state.fpscr = buf[i];
+
+	return 0;
+}
+
+unsigned long copy_ckvsx_to_user(void __user *to,
+				  struct task_struct *task)
+{
+	u64 buf[ELF_NVSRHALFREG];
+	int i;
+
+	/* save FPR copy to local buffer then write to the thread_struct */
+	for (i = 0; i < ELF_NVSRHALFREG; i++)
+		buf[i] = task->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET];
+	return __copy_to_user(to, buf, ELF_NVSRHALFREG * sizeof(double));
+}
+
+unsigned long copy_ckvsx_from_user(struct task_struct *task,
+					  void __user *from)
+{
+	u64 buf[ELF_NVSRHALFREG];
+	int i;
+
+	if (__copy_from_user(buf, from, ELF_NVSRHALFREG * sizeof(double)))
+		return 1;
+	for (i = 0; i < ELF_NVSRHALFREG ; i++)
+		task->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET] = buf[i];
+	return 0;
+}
+#endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
+#else
+inline unsigned long copy_fpr_to_user(void __user *to,
+				      struct task_struct *task)
+{
+	return __copy_to_user(to, task->thread.fp_state.fpr,
+			      ELF_NFPREG * sizeof(double));
+}
+
+inline unsigned long copy_fpr_from_user(struct task_struct *task,
+					void __user *from)
+{
+	return __copy_from_user(task->thread.fp_state.fpr, from,
+			      ELF_NFPREG * sizeof(double));
+}
+
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+inline unsigned long copy_ckfpr_to_user(void __user *to,
+					 struct task_struct *task)
+{
+	return __copy_to_user(to, task->thread.ckfp_state.fpr,
+			      ELF_NFPREG * sizeof(double));
+}
+
+inline unsigned long copy_ckfpr_from_user(struct task_struct *task,
+						 void __user *from)
+{
+	return __copy_from_user(task->thread.ckfp_state.fpr, from,
+				ELF_NFPREG * sizeof(double));
+}
+#endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
+#endif
+
 /* Log an error when sending an unhandled signal to a process. Controlled
  * through debug.exception-trace sysctl.
  */
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 98600b276f76..c93c937ea568 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -235,146 +235,6 @@ struct rt_sigframe {
 	int			abigap[56];
 };
 
-#ifdef CONFIG_VSX
-unsigned long copy_fpr_to_user(void __user *to,
-			       struct task_struct *task)
-{
-	u64 buf[ELF_NFPREG];
-	int i;
-
-	/* save FPR copy to local buffer then write to the thread_struct */
-	for (i = 0; i < (ELF_NFPREG - 1) ; i++)
-		buf[i] = task->thread.TS_FPR(i);
-	buf[i] = task->thread.fp_state.fpscr;
-	return __copy_to_user(to, buf, ELF_NFPREG * sizeof(double));
-}
-
-unsigned long copy_fpr_from_user(struct task_struct *task,
-				 void __user *from)
-{
-	u64 buf[ELF_NFPREG];
-	int i;
-
-	if (__copy_from_user(buf, from, ELF_NFPREG * sizeof(double)))
-		return 1;
-	for (i = 0; i < (ELF_NFPREG - 1) ; i++)
-		task->thread.TS_FPR(i) = buf[i];
-	task->thread.fp_state.fpscr = buf[i];
-
-	return 0;
-}
-
-unsigned long copy_vsx_to_user(void __user *to,
-			       struct task_struct *task)
-{
-	u64 buf[ELF_NVSRHALFREG];
-	int i;
-
-	/* save FPR copy to local buffer then write to the thread_struct */
-	for (i = 0; i < ELF_NVSRHALFREG; i++)
-		buf[i] = task->thread.fp_state.fpr[i][TS_VSRLOWOFFSET];
-	return __copy_to_user(to, buf, ELF_NVSRHALFREG * sizeof(double));
-}
-
-unsigned long copy_vsx_from_user(struct task_struct *task,
-				 void __user *from)
-{
-	u64 buf[ELF_NVSRHALFREG];
-	int i;
-
-	if (__copy_from_user(buf, from, ELF_NVSRHALFREG * sizeof(double)))
-		return 1;
-	for (i = 0; i < ELF_NVSRHALFREG ; i++)
-		task->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] = buf[i];
-	return 0;
-}
-
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-unsigned long copy_ckfpr_to_user(void __user *to,
-				  struct task_struct *task)
-{
-	u64 buf[ELF_NFPREG];
-	int i;
-
-	/* save FPR copy to local buffer then write to the thread_struct */
-	for (i = 0; i < (ELF_NFPREG - 1) ; i++)
-		buf[i] = task->thread.TS_CKFPR(i);
-	buf[i] = task->thread.ckfp_state.fpscr;
-	return __copy_to_user(to, buf, ELF_NFPREG * sizeof(double));
-}
-
-unsigned long copy_ckfpr_from_user(struct task_struct *task,
-					  void __user *from)
-{
-	u64 buf[ELF_NFPREG];
-	int i;
-
-	if (__copy_from_user(buf, from, ELF_NFPREG * sizeof(double)))
-		return 1;
-	for (i = 0; i < (ELF_NFPREG - 1) ; i++)
-		task->thread.TS_CKFPR(i) = buf[i];
-	task->thread.ckfp_state.fpscr = buf[i];
-
-	return 0;
-}
-
-unsigned long copy_ckvsx_to_user(void __user *to,
-				  struct task_struct *task)
-{
-	u64 buf[ELF_NVSRHALFREG];
-	int i;
-
-	/* save FPR copy to local buffer then write to the thread_struct */
-	for (i = 0; i < ELF_NVSRHALFREG; i++)
-		buf[i] = task->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET];
-	return __copy_to_user(to, buf, ELF_NVSRHALFREG * sizeof(double));
-}
-
-unsigned long copy_ckvsx_from_user(struct task_struct *task,
-					  void __user *from)
-{
-	u64 buf[ELF_NVSRHALFREG];
-	int i;
-
-	if (__copy_from_user(buf, from, ELF_NVSRHALFREG * sizeof(double)))
-		return 1;
-	for (i = 0; i < ELF_NVSRHALFREG ; i++)
-		task->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET] = buf[i];
-	return 0;
-}
-#endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
-#else
-inline unsigned long copy_fpr_to_user(void __user *to,
-				      struct task_struct *task)
-{
-	return __copy_to_user(to, task->thread.fp_state.fpr,
-			      ELF_NFPREG * sizeof(double));
-}
-
-inline unsigned long copy_fpr_from_user(struct task_struct *task,
-					void __user *from)
-{
-	return __copy_from_user(task->thread.fp_state.fpr, from,
-			      ELF_NFPREG * sizeof(double));
-}
-
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-inline unsigned long copy_ckfpr_to_user(void __user *to,
-					 struct task_struct *task)
-{
-	return __copy_to_user(to, task->thread.ckfp_state.fpr,
-			      ELF_NFPREG * sizeof(double));
-}
-
-inline unsigned long copy_ckfpr_from_user(struct task_struct *task,
-						 void __user *from)
-{
-	return __copy_from_user(task->thread.ckfp_state.fpr, from,
-				ELF_NFPREG * sizeof(double));
-}
-#endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
-#endif
-
 /*
  * Save the current user registers on the user stack.
  * We only save the altivec/spe registers if the process has used
-- 
2.22.0

