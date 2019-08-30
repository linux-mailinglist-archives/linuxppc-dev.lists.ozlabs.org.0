Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4347EA3E1C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2019 21:04:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Kpn04yqHzDqV9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Aug 2019 05:04:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Kpdt0Xf6zDqsd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2019 04:58:09 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BD936AC35;
 Fri, 30 Aug 2019 18:58:06 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 2/6] powerpc: move common register copy functions from
 signal_32.c to signal.c
Date: Fri, 30 Aug 2019 20:57:53 +0200
Message-Id: <36b04bccb129087a78a068207fc71194a1064667.1567188299.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1567188299.git.msuchanek@suse.de>
References: <cover.1567188299.git.msuchanek@suse.de>
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
Cc: David Hildenbrand <david@redhat.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 David Howells <dhowells@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Breno Leitao <leitao@debian.org>, Michael Neuling <mikey@neuling.org>,
 Nicolai Stange <nstange@suse.de>, Allison Randal <allison@lohutok.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Joel Stanley <joel@jms.id.au>,
 Firoz Khan <firoz.khan@linaro.org>, Michal Suchanek <msuchanek@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Christian Brauner <christian@brauner.io>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>
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

