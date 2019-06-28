Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7762D5A049
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 18:06:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45b1pH3pflzDqMG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 02:05:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="IkZG5v+B"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45b1Pc15lHzDqtv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 01:48:04 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45b1PP6sYczB09ZT;
 Fri, 28 Jun 2019 17:47:53 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=IkZG5v+B; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id j-PJ37f1gGQX; Fri, 28 Jun 2019 17:47:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45b1PP5YxhzB09ZV;
 Fri, 28 Jun 2019 17:47:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561736873; bh=6DBZJOw/wqgcZZKxKbFpXQbI+N4GhhhUSOrUEb0Yq3U=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=IkZG5v+BtdAqHfq0iT479fSy9I7QnoNFtD3tPGKH5+EkAAYd60TQS1vDrEEC8cu+E
 TK5vCw9fxr/SqWblAV/N34KQnDWHeiY4dFSD/qz2nVZ66tx98ksVRwg78jRCJa3mAc
 8Ic/o/3pjBu8tMa8bZGzjdb231pDTnBdcLhTM+nY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 36C558B976;
 Fri, 28 Jun 2019 17:47:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yGzJq_gxm88a; Fri, 28 Jun 2019 17:47:55 +0200 (CEST)
Received: from localhost.localdomain (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D31098B975;
 Fri, 28 Jun 2019 17:47:54 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id BBFFB68DBC; Fri, 28 Jun 2019 15:47:54 +0000 (UTC)
Message-Id: <3543ccd8b2f8cb13012d5883f062d0a7fca4695d.1561735588.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1561735587.git.christophe.leroy@c-s.fr>
References: <cover.1561735587.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 05/12] powerpc/ptrace: split out ALTIVEC related
 functions.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Fri, 28 Jun 2019 15:47:54 +0000 (UTC)
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

Move CONFIG_ALTIVEC functions out of ptrace.c, into
ptrace-altivec.c

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/ptrace/Makefile         |   1 +
 arch/powerpc/kernel/ptrace/ptrace-altivec.c | 151 ++++++++++++++++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace-decl.h    |   9 ++
 arch/powerpc/kernel/ptrace/ptrace.c         | 124 -----------------------
 4 files changed, 161 insertions(+), 124 deletions(-)
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-altivec.c

diff --git a/arch/powerpc/kernel/ptrace/Makefile b/arch/powerpc/kernel/ptrace/Makefile
index 238c27189078..522e6fd0b5b8 100644
--- a/arch/powerpc/kernel/ptrace/Makefile
+++ b/arch/powerpc/kernel/ptrace/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_VSX)		+= ptrace-vsx.o
 ifneq ($(CONFIG_VSX),y)
 obj-y				+= ptrace-novsx.o
 endif
+obj-$(CONFIG_ALTIVEC)		+= ptrace-altivec.o
diff --git a/arch/powerpc/kernel/ptrace/ptrace-altivec.c b/arch/powerpc/kernel/ptrace/ptrace-altivec.c
new file mode 100644
index 000000000000..0cb749164269
--- /dev/null
+++ b/arch/powerpc/kernel/ptrace/ptrace-altivec.c
@@ -0,0 +1,151 @@
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
+/*
+ * Get/set all the altivec registers vr0..vr31, vscr, vrsave, in one go.
+ * The transfer totals 34 quadword.  Quadwords 0-31 contain the
+ * corresponding vector registers.  Quadword 32 contains the vscr as the
+ * last word (offset 12) within that quadword.  Quadword 33 contains the
+ * vrsave as the first word (offset 0) within the quadword.
+ *
+ * This definition of the VMX state is compatible with the current PPC32
+ * ptrace interface.  This allows signal handling and ptrace to use the
+ * same structures.  This also simplifies the implementation of a bi-arch
+ * (combined (32- and 64-bit) gdb.
+ */
+
+int vr_active(struct task_struct *target, const struct user_regset *regset)
+{
+	flush_altivec_to_thread(target);
+	return target->thread.used_vr ? regset->n : 0;
+}
+
+/*
+ * Regardless of transactions, 'vr_state' holds the current running
+ * value of all the VMX registers and 'ckvr_state' holds the last
+ * checkpointed value of all the VMX registers for the current
+ * transaction to fall back on in case it aborts.
+ *
+ * Userspace interface buffer layout:
+ *
+ * struct data {
+ *	vector128	vr[32];
+ *	vector128	vscr;
+ *	vector128	vrsave;
+ * };
+ */
+int vr_get(struct task_struct *target, const struct user_regset *regset,
+	   unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
+{
+	int ret;
+
+	flush_altivec_to_thread(target);
+
+	BUILD_BUG_ON(offsetof(struct thread_vr_state, vscr) !=
+		     offsetof(struct thread_vr_state, vr[32]));
+
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				  &target->thread.vr_state, 0,
+				  33 * sizeof(vector128));
+	if (!ret) {
+		/*
+		 * Copy out only the low-order word of vrsave.
+		 */
+		int start, end;
+		union {
+			elf_vrreg_t reg;
+			u32 word;
+		} vrsave;
+		memset(&vrsave, 0, sizeof(vrsave));
+
+		vrsave.word = target->thread.vrsave;
+
+		start = 33 * sizeof(vector128);
+		end = start + sizeof(vrsave);
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &vrsave,
+					  start, end);
+	}
+
+	return ret;
+}
+
+/*
+ * Regardless of transactions, 'vr_state' holds the current running
+ * value of all the VMX registers and 'ckvr_state' holds the last
+ * checkpointed value of all the VMX registers for the current
+ * transaction to fall back on in case it aborts.
+ *
+ * Userspace interface buffer layout:
+ *
+ * struct data {
+ *	vector128	vr[32];
+ *	vector128	vscr;
+ *	vector128	vrsave;
+ * };
+ */
+int vr_set(struct task_struct *target, const struct user_regset *regset,
+	   unsigned int pos, unsigned int count,
+	   const void *kbuf, const void __user *ubuf)
+{
+	int ret;
+
+	flush_altivec_to_thread(target);
+
+	BUILD_BUG_ON(offsetof(struct thread_vr_state, vscr) !=
+		     offsetof(struct thread_vr_state, vr[32]));
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				 &target->thread.vr_state, 0,
+				 33 * sizeof(vector128));
+	if (!ret && count > 0) {
+		/*
+		 * We use only the first word of vrsave.
+		 */
+		int start, end;
+		union {
+			elf_vrreg_t reg;
+			u32 word;
+		} vrsave;
+		memset(&vrsave, 0, sizeof(vrsave));
+
+		vrsave.word = target->thread.vrsave;
+
+		start = 33 * sizeof(vector128);
+		end = start + sizeof(vrsave);
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &vrsave,
+					 start, end);
+		if (!ret)
+			target->thread.vrsave = vrsave.word;
+	}
+
+	return ret;
+}
diff --git a/arch/powerpc/kernel/ptrace/ptrace-decl.h b/arch/powerpc/kernel/ptrace/ptrace-decl.h
index 764df4ee9362..0f9282cb52fc 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -17,6 +17,15 @@ int vsr_set(struct task_struct *target, const struct user_regset *regset,
 	    unsigned int pos, unsigned int count,
 	    const void *kbuf, const void __user *ubuf);
 
+/* ptrace-altivec */
+
+int vr_active(struct task_struct *target, const struct user_regset *regset);
+int vr_get(struct task_struct *target, const struct user_regset *regset,
+	   unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf);
+int vr_set(struct task_struct *target, const struct user_regset *regset,
+	   unsigned int pos, unsigned int count,
+	   const void *kbuf, const void __user *ubuf);
+
 /* ptrace */
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 3d0a0b8f8c07..198ccbfce544 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -415,130 +415,6 @@ static int gpr_set(struct task_struct *target, const struct user_regset *regset,
 	return ret;
 }
 
-#ifdef CONFIG_ALTIVEC
-/*
- * Get/set all the altivec registers vr0..vr31, vscr, vrsave, in one go.
- * The transfer totals 34 quadword.  Quadwords 0-31 contain the
- * corresponding vector registers.  Quadword 32 contains the vscr as the
- * last word (offset 12) within that quadword.  Quadword 33 contains the
- * vrsave as the first word (offset 0) within the quadword.
- *
- * This definition of the VMX state is compatible with the current PPC32
- * ptrace interface.  This allows signal handling and ptrace to use the
- * same structures.  This also simplifies the implementation of a bi-arch
- * (combined (32- and 64-bit) gdb.
- */
-
-static int vr_active(struct task_struct *target,
-		     const struct user_regset *regset)
-{
-	flush_altivec_to_thread(target);
-	return target->thread.used_vr ? regset->n : 0;
-}
-
-/*
- * Regardless of transactions, 'vr_state' holds the current running
- * value of all the VMX registers and 'ckvr_state' holds the last
- * checkpointed value of all the VMX registers for the current
- * transaction to fall back on in case it aborts.
- *
- * Userspace interface buffer layout:
- *
- * struct data {
- *	vector128	vr[32];
- *	vector128	vscr;
- *	vector128	vrsave;
- * };
- */
-static int vr_get(struct task_struct *target, const struct user_regset *regset,
-		  unsigned int pos, unsigned int count,
-		  void *kbuf, void __user *ubuf)
-{
-	int ret;
-
-	flush_altivec_to_thread(target);
-
-	BUILD_BUG_ON(offsetof(struct thread_vr_state, vscr) !=
-		     offsetof(struct thread_vr_state, vr[32]));
-
-	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				  &target->thread.vr_state, 0,
-				  33 * sizeof(vector128));
-	if (!ret) {
-		/*
-		 * Copy out only the low-order word of vrsave.
-		 */
-		int start, end;
-		union {
-			elf_vrreg_t reg;
-			u32 word;
-		} vrsave;
-		memset(&vrsave, 0, sizeof(vrsave));
-
-		vrsave.word = target->thread.vrsave;
-
-		start = 33 * sizeof(vector128);
-		end = start + sizeof(vrsave);
-		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &vrsave,
-					  start, end);
-	}
-
-	return ret;
-}
-
-/*
- * Regardless of transactions, 'vr_state' holds the current running
- * value of all the VMX registers and 'ckvr_state' holds the last
- * checkpointed value of all the VMX registers for the current
- * transaction to fall back on in case it aborts.
- *
- * Userspace interface buffer layout:
- *
- * struct data {
- *	vector128	vr[32];
- *	vector128	vscr;
- *	vector128	vrsave;
- * };
- */
-static int vr_set(struct task_struct *target, const struct user_regset *regset,
-		  unsigned int pos, unsigned int count,
-		  const void *kbuf, const void __user *ubuf)
-{
-	int ret;
-
-	flush_altivec_to_thread(target);
-
-	BUILD_BUG_ON(offsetof(struct thread_vr_state, vscr) !=
-		     offsetof(struct thread_vr_state, vr[32]));
-
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				 &target->thread.vr_state, 0,
-				 33 * sizeof(vector128));
-	if (!ret && count > 0) {
-		/*
-		 * We use only the first word of vrsave.
-		 */
-		int start, end;
-		union {
-			elf_vrreg_t reg;
-			u32 word;
-		} vrsave;
-		memset(&vrsave, 0, sizeof(vrsave));
-
-		vrsave.word = target->thread.vrsave;
-
-		start = 33 * sizeof(vector128);
-		end = start + sizeof(vrsave);
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &vrsave,
-					 start, end);
-		if (!ret)
-			target->thread.vrsave = vrsave.word;
-	}
-
-	return ret;
-}
-#endif /* CONFIG_ALTIVEC */
-
 #ifdef CONFIG_SPE
 
 /*
-- 
2.13.3

