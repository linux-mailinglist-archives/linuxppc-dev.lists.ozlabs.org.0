Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D716854D18
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 13:02:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y3Cd08xCzDqPC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 21:02:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="KcVq464O"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y36Z3JpTzDqB9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 20:58:13 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Y36T2HTdz9v17r;
 Tue, 25 Jun 2019 12:58:09 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=KcVq464O; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0-LaWMKaFWz3; Tue, 25 Jun 2019 12:58:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Y36T1D8Hz9v17d;
 Tue, 25 Jun 2019 12:58:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561460289; bh=SydetvpPCfMSXdVGH0QYK0XPNANuOuYHy+FU+eGD4vs=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=KcVq464OBL6x85ZTKyzQ9XH4DaURVS5vAGvaIkxtt41pjtozgCCESShwE9kHMU5eY
 sPs+CbgfYncGv7JwaqmkTOtfefkt0wfX3w+E41+J+2BkI+jxYujBv8FN9kUUngFgKy
 SeT0Wu+RJNNYT1RLNp7OXTRPgsUQJAJaZFUpuWu8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 585D28B879;
 Tue, 25 Jun 2019 12:58:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pHHb_IJct9XM; Tue, 25 Jun 2019 12:58:10 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F1E5E8B874;
 Tue, 25 Jun 2019 12:58:09 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E715368E1B; Tue, 25 Jun 2019 10:58:09 +0000 (UTC)
Message-Id: <3dcf96f0422d463de274a57b63805b76faf67fcc.1561459984.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1561459983.git.christophe.leroy@c-s.fr>
References: <cover.1561459983.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v1 04/13] powerpc/ptrace: split out VSX related functions.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Tue, 25 Jun 2019 10:58:09 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move CONFIG_VSX functions out of ptrace.c, into
ptrace-vsx.c and ptrace-novsx.c

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/ptrace/Makefile       |   4 +
 arch/powerpc/kernel/ptrace/ptrace-decl.h  |  18 +++
 arch/powerpc/kernel/ptrace/ptrace-novsx.c |  83 ++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace-vsx.c   | 177 ++++++++++++++++++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace.c       | 171 +----------------------------
 5 files changed, 284 insertions(+), 169 deletions(-)
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-decl.h
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-novsx.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-vsx.c

diff --git a/arch/powerpc/kernel/ptrace/Makefile b/arch/powerpc/kernel/ptrace/Makefile
index 02fb28eb3b55..238c27189078 100644
--- a/arch/powerpc/kernel/ptrace/Makefile
+++ b/arch/powerpc/kernel/ptrace/Makefile
@@ -7,3 +7,7 @@ CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
 
 obj-y				+= ptrace.o
 obj-$(CONFIG_PPC64)		+= ptrace32.o
+obj-$(CONFIG_VSX)		+= ptrace-vsx.o
+ifneq ($(CONFIG_VSX),y)
+obj-y				+= ptrace-novsx.o
+endif
diff --git a/arch/powerpc/kernel/ptrace/ptrace-decl.h b/arch/powerpc/kernel/ptrace/ptrace-decl.h
new file mode 100644
index 000000000000..fc4dc598bc1d
--- /dev/null
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+/* ptrace-(no)vsx */
+
+int fpr_get(struct task_struct *target, const struct user_regset *regset,
+	    unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf);
+int fpr_set(struct task_struct *target, const struct user_regset *regset,
+	    unsigned int pos, unsigned int count,
+	    const void *kbuf, const void __user *ubuf);
+
+/* ptrace-vsx */
+
+int vsr_active(struct task_struct *target, const struct user_regset *regset);
+int vsr_get(struct task_struct *target, const struct user_regset *regset,
+	    unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf);
+int vsr_set(struct task_struct *target, const struct user_regset *regset,
+	    unsigned int pos, unsigned int count,
+	    const void *kbuf, const void __user *ubuf);
diff --git a/arch/powerpc/kernel/ptrace/ptrace-novsx.c b/arch/powerpc/kernel/ptrace/ptrace-novsx.c
new file mode 100644
index 000000000000..55fbbb4aa9d7
--- /dev/null
+++ b/arch/powerpc/kernel/ptrace/ptrace-novsx.c
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <linux/kernel.h>
+#include <linux/sched.h>
+#include <linux/mm.h>
+#include <linux/smp.h>
+#include <linux/errno.h>
+#include <linux/ptrace.h>
+#include <linux/regset.h>
+#include <linux/tracehook.h>
+#include <linux/elf.h>
+#include <linux/user.h>
+#include <linux/security.h>
+#include <linux/signal.h>
+#include <linux/seccomp.h>
+#include <linux/audit.h>
+#include <trace/syscall.h>
+#include <linux/hw_breakpoint.h>
+#include <linux/perf_event.h>
+#include <linux/context_tracking.h>
+#include <linux/nospec.h>
+
+#include <linux/uaccess.h>
+#include <linux/pkeys.h>
+#include <asm/page.h>
+#include <asm/pgtable.h>
+#include <asm/switch_to.h>
+#include <asm/tm.h>
+#include <asm/asm-prototypes.h>
+#include <asm/debug.h>
+#include <asm/hw_breakpoint.h>
+
+#include <kernel/ptrace/ptrace-decl.h>
+
+/*
+ * Regardless of transactions, 'fp_state' holds the current running
+ * value of all FPR registers and 'ckfp_state' holds the last checkpointed
+ * value of all FPR registers for the current transaction.
+ *
+ * Userspace interface buffer layout:
+ *
+ * struct data {
+ *	u64	fpr[32];
+ *	u64	fpscr;
+ * };
+ */
+int fpr_get(struct task_struct *target, const struct user_regset *regset,
+	    unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
+{
+	BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
+		     offsetof(struct thread_fp_state, fpr[32]));
+
+	flush_fp_to_thread(target);
+
+	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				   &target->thread.fp_state, 0, -1);
+}
+
+/*
+ * Regardless of transactions, 'fp_state' holds the current running
+ * value of all FPR registers and 'ckfp_state' holds the last checkpointed
+ * value of all FPR registers for the current transaction.
+ *
+ * Userspace interface buffer layout:
+ *
+ * struct data {
+ *	u64	fpr[32];
+ *	u64	fpscr;
+ * };
+ *
+ */
+int fpr_set(struct task_struct *target, const struct user_regset *regset,
+	    unsigned int pos, unsigned int count,
+	    const void *kbuf, const void __user *ubuf)
+{
+	BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
+		     offsetof(struct thread_fp_state, fpr[32]));
+
+	flush_fp_to_thread(target);
+
+	return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				  &target->thread.fp_state, 0, -1);
+}
diff --git a/arch/powerpc/kernel/ptrace/ptrace-vsx.c b/arch/powerpc/kernel/ptrace/ptrace-vsx.c
new file mode 100644
index 000000000000..1d94210cdf63
--- /dev/null
+++ b/arch/powerpc/kernel/ptrace/ptrace-vsx.c
@@ -0,0 +1,177 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <linux/kernel.h>
+#include <linux/sched.h>
+#include <linux/mm.h>
+#include <linux/smp.h>
+#include <linux/errno.h>
+#include <linux/ptrace.h>
+#include <linux/regset.h>
+#include <linux/tracehook.h>
+#include <linux/elf.h>
+#include <linux/user.h>
+#include <linux/security.h>
+#include <linux/signal.h>
+#include <linux/seccomp.h>
+#include <linux/audit.h>
+#include <trace/syscall.h>
+#include <linux/hw_breakpoint.h>
+#include <linux/perf_event.h>
+#include <linux/context_tracking.h>
+#include <linux/nospec.h>
+
+#include <linux/uaccess.h>
+#include <linux/pkeys.h>
+#include <asm/page.h>
+#include <asm/pgtable.h>
+#include <asm/switch_to.h>
+#include <asm/tm.h>
+#include <asm/asm-prototypes.h>
+#include <asm/debug.h>
+#include <asm/hw_breakpoint.h>
+
+#include <kernel/ptrace/ptrace-decl.h>
+
+/*
+ * Regardless of transactions, 'fp_state' holds the current running
+ * value of all FPR registers and 'ckfp_state' holds the last checkpointed
+ * value of all FPR registers for the current transaction.
+ *
+ * Userspace interface buffer layout:
+ *
+ * struct data {
+ *	u64	fpr[32];
+ *	u64	fpscr;
+ * };
+ */
+int fpr_get(struct task_struct *target, const struct user_regset *regset,
+	    unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
+{
+	u64 buf[33];
+	int i;
+
+	flush_fp_to_thread(target);
+
+	/* copy to local buffer then write that out */
+	for (i = 0; i < 32 ; i++)
+		buf[i] = target->thread.TS_FPR(i);
+	buf[32] = target->thread.fp_state.fpscr;
+	return user_regset_copyout(&pos, &count, &kbuf, &ubuf, buf, 0, -1);
+}
+
+/*
+ * Regardless of transactions, 'fp_state' holds the current running
+ * value of all FPR registers and 'ckfp_state' holds the last checkpointed
+ * value of all FPR registers for the current transaction.
+ *
+ * Userspace interface buffer layout:
+ *
+ * struct data {
+ *	u64	fpr[32];
+ *	u64	fpscr;
+ * };
+ *
+ */
+int fpr_set(struct task_struct *target, const struct user_regset *regset,
+	    unsigned int pos, unsigned int count,
+	    const void *kbuf, const void __user *ubuf)
+{
+	u64 buf[33];
+	int i;
+
+	flush_fp_to_thread(target);
+
+	for (i = 0; i < 32 ; i++)
+		buf[i] = target->thread.TS_FPR(i);
+	buf[32] = target->thread.fp_state.fpscr;
+
+	/* copy to local buffer then write that out */
+	i = user_regset_copyin(&pos, &count, &kbuf, &ubuf, buf, 0, -1);
+	if (i)
+		return i;
+
+	for (i = 0; i < 32 ; i++)
+		target->thread.TS_FPR(i) = buf[i];
+	target->thread.fp_state.fpscr = buf[32];
+	return 0;
+}
+
+/*
+ * Currently to set and and get all the vsx state, you need to call
+ * the fp and VMX calls as well.  This only get/sets the lower 32
+ * 128bit VSX registers.
+ */
+
+int vsr_active(struct task_struct *target, const struct user_regset *regset)
+{
+	flush_vsx_to_thread(target);
+	return target->thread.used_vsr ? regset->n : 0;
+}
+
+/*
+ * Regardless of transactions, 'fp_state' holds the current running
+ * value of all FPR registers and 'ckfp_state' holds the last
+ * checkpointed value of all FPR registers for the current
+ * transaction.
+ *
+ * Userspace interface buffer layout:
+ *
+ * struct data {
+ *	u64	vsx[32];
+ * };
+ */
+int vsr_get(struct task_struct *target, const struct user_regset *regset,
+	    unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
+{
+	u64 buf[32];
+	int ret, i;
+
+	flush_tmregs_to_thread(target);
+	flush_fp_to_thread(target);
+	flush_altivec_to_thread(target);
+	flush_vsx_to_thread(target);
+
+	for (i = 0; i < 32 ; i++)
+		buf[i] = target->thread.fp_state.fpr[i][TS_VSRLOWOFFSET];
+
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				  buf, 0, 32 * sizeof(double));
+
+	return ret;
+}
+
+/*
+ * Regardless of transactions, 'fp_state' holds the current running
+ * value of all FPR registers and 'ckfp_state' holds the last
+ * checkpointed value of all FPR registers for the current
+ * transaction.
+ *
+ * Userspace interface buffer layout:
+ *
+ * struct data {
+ *	u64	vsx[32];
+ * };
+ */
+int vsr_set(struct task_struct *target, const struct user_regset *regset,
+	    unsigned int pos, unsigned int count,
+	    const void *kbuf, const void __user *ubuf)
+{
+	u64 buf[32];
+	int ret,i;
+
+	flush_tmregs_to_thread(target);
+	flush_fp_to_thread(target);
+	flush_altivec_to_thread(target);
+	flush_vsx_to_thread(target);
+
+	for (i = 0; i < 32 ; i++)
+		buf[i] = target->thread.fp_state.fpr[i][TS_VSRLOWOFFSET];
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				 buf, 0, 32 * sizeof(double));
+	if (!ret)
+		for (i = 0; i < 32 ; i++)
+			target->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] = buf[i];
+
+	return ret;
+}
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index cc8efcb404d6..621a0181f6f7 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -48,6 +48,8 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/syscalls.h>
 
+#include <kernel/ptrace/ptrace-decl.h>
+
 struct pt_regs_offset {
 	const char *name;
 	int offset;
@@ -415,91 +417,6 @@ static int gpr_set(struct task_struct *target, const struct user_regset *regset,
 	return ret;
 }
 
-/*
- * Regardless of transactions, 'fp_state' holds the current running
- * value of all FPR registers and 'ckfp_state' holds the last checkpointed
- * value of all FPR registers for the current transaction.
- *
- * Userspace interface buffer layout:
- *
- * struct data {
- *	u64	fpr[32];
- *	u64	fpscr;
- * };
- */
-static int fpr_get(struct task_struct *target, const struct user_regset *regset,
-		   unsigned int pos, unsigned int count,
-		   void *kbuf, void __user *ubuf)
-{
-#ifdef CONFIG_VSX
-	u64 buf[33];
-	int i;
-
-	flush_fp_to_thread(target);
-
-	/* copy to local buffer then write that out */
-	for (i = 0; i < 32 ; i++)
-		buf[i] = target->thread.TS_FPR(i);
-	buf[32] = target->thread.fp_state.fpscr;
-	return user_regset_copyout(&pos, &count, &kbuf, &ubuf, buf, 0, -1);
-#else
-	BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
-		     offsetof(struct thread_fp_state, fpr[32]));
-
-	flush_fp_to_thread(target);
-
-	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				   &target->thread.fp_state, 0, -1);
-#endif
-}
-
-/*
- * Regardless of transactions, 'fp_state' holds the current running
- * value of all FPR registers and 'ckfp_state' holds the last checkpointed
- * value of all FPR registers for the current transaction.
- *
- * Userspace interface buffer layout:
- *
- * struct data {
- *	u64	fpr[32];
- *	u64	fpscr;
- * };
- *
- */
-static int fpr_set(struct task_struct *target, const struct user_regset *regset,
-		   unsigned int pos, unsigned int count,
-		   const void *kbuf, const void __user *ubuf)
-{
-#ifdef CONFIG_VSX
-	u64 buf[33];
-	int i;
-
-	flush_fp_to_thread(target);
-
-	for (i = 0; i < 32 ; i++)
-		buf[i] = target->thread.TS_FPR(i);
-	buf[32] = target->thread.fp_state.fpscr;
-
-	/* copy to local buffer then write that out */
-	i = user_regset_copyin(&pos, &count, &kbuf, &ubuf, buf, 0, -1);
-	if (i)
-		return i;
-
-	for (i = 0; i < 32 ; i++)
-		target->thread.TS_FPR(i) = buf[i];
-	target->thread.fp_state.fpscr = buf[32];
-	return 0;
-#else
-	BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
-		     offsetof(struct thread_fp_state, fpr[32]));
-
-	flush_fp_to_thread(target);
-
-	return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				  &target->thread.fp_state, 0, -1);
-#endif
-}
-
 #ifdef CONFIG_ALTIVEC
 /*
  * Get/set all the altivec registers vr0..vr31, vscr, vrsave, in one go.
@@ -624,90 +541,6 @@ static int vr_set(struct task_struct *target, const struct user_regset *regset,
 }
 #endif /* CONFIG_ALTIVEC */
 
-#ifdef CONFIG_VSX
-/*
- * Currently to set and and get all the vsx state, you need to call
- * the fp and VMX calls as well.  This only get/sets the lower 32
- * 128bit VSX registers.
- */
-
-static int vsr_active(struct task_struct *target,
-		      const struct user_regset *regset)
-{
-	flush_vsx_to_thread(target);
-	return target->thread.used_vsr ? regset->n : 0;
-}
-
-/*
- * Regardless of transactions, 'fp_state' holds the current running
- * value of all FPR registers and 'ckfp_state' holds the last
- * checkpointed value of all FPR registers for the current
- * transaction.
- *
- * Userspace interface buffer layout:
- *
- * struct data {
- *	u64	vsx[32];
- * };
- */
-static int vsr_get(struct task_struct *target, const struct user_regset *regset,
-		   unsigned int pos, unsigned int count,
-		   void *kbuf, void __user *ubuf)
-{
-	u64 buf[32];
-	int ret, i;
-
-	flush_tmregs_to_thread(target);
-	flush_fp_to_thread(target);
-	flush_altivec_to_thread(target);
-	flush_vsx_to_thread(target);
-
-	for (i = 0; i < 32 ; i++)
-		buf[i] = target->thread.fp_state.fpr[i][TS_VSRLOWOFFSET];
-
-	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				  buf, 0, 32 * sizeof(double));
-
-	return ret;
-}
-
-/*
- * Regardless of transactions, 'fp_state' holds the current running
- * value of all FPR registers and 'ckfp_state' holds the last
- * checkpointed value of all FPR registers for the current
- * transaction.
- *
- * Userspace interface buffer layout:
- *
- * struct data {
- *	u64	vsx[32];
- * };
- */
-static int vsr_set(struct task_struct *target, const struct user_regset *regset,
-		   unsigned int pos, unsigned int count,
-		   const void *kbuf, const void __user *ubuf)
-{
-	u64 buf[32];
-	int ret,i;
-
-	flush_tmregs_to_thread(target);
-	flush_fp_to_thread(target);
-	flush_altivec_to_thread(target);
-	flush_vsx_to_thread(target);
-
-	for (i = 0; i < 32 ; i++)
-		buf[i] = target->thread.fp_state.fpr[i][TS_VSRLOWOFFSET];
-
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				 buf, 0, 32 * sizeof(double));
-	if (!ret)
-		for (i = 0; i < 32 ; i++)
-			target->thread.fp_state.fpr[i][TS_VSRLOWOFFSET] = buf[i];
-
-	return ret;
-}
-#endif /* CONFIG_VSX */
-
 #ifdef CONFIG_SPE
 
 /*
-- 
2.13.3

