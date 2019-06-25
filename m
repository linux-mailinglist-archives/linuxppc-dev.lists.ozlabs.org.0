Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF6254D4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 13:11:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y3Q66Pq1zDqGc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 21:11:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="tFr+qtr8"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y36g4zjzzDq8B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 20:58:19 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Y36W2zz7z9v18K;
 Tue, 25 Jun 2019 12:58:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tFr+qtr8; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id mq6_nl8umIWQ; Tue, 25 Jun 2019 12:58:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Y36W1t0Mz9v17d;
 Tue, 25 Jun 2019 12:58:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561460291; bh=csiZqVJDn92IUZZXTRpVfexz6vaKIKmywZLb+SaCYIg=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=tFr+qtr8/nUs0ws+ZudqxTAEAqEPMx9cO3nuMn4rgTvgWawPzNeBQliJfGfgVi98u
 JkDA/0nmZBlHG1dOyjw7uNHyIQMnqXSuxhHLvJcqoOVtsc+ax+vq3QosHO1BY64ncc
 zrm+0APblaCMzMiaoxNUkkO74M2IiuUh6LXXzY0Q=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 759CF8B879;
 Tue, 25 Jun 2019 12:58:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4Q5AAgbNGces; Tue, 25 Jun 2019 12:58:12 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 26AF78B874;
 Tue, 25 Jun 2019 12:58:12 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 08D7C68E1B; Tue, 25 Jun 2019 10:58:12 +0000 (UTC)
Message-Id: <3ddc07c7ba6f095ff74b1712874a574aa257510c.1561459984.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1561459983.git.christophe.leroy@c-s.fr>
References: <cover.1561459983.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v1 06/13] powerpc/ptrace: split out SPE related functions.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Tue, 25 Jun 2019 10:58:12 +0000 (UTC)
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

Move CONFIG_SPE functions out of ptrace.c, into
ptrace-spe.c

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/ptrace/Makefile      |  1 +
 arch/powerpc/kernel/ptrace/ptrace-decl.h |  9 +++
 arch/powerpc/kernel/ptrace/ptrace-spe.c  | 94 ++++++++++++++++++++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace.c      | 66 ----------------------
 4 files changed, 104 insertions(+), 66 deletions(-)
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-spe.c

diff --git a/arch/powerpc/kernel/ptrace/Makefile b/arch/powerpc/kernel/ptrace/Makefile
index 522e6fd0b5b8..f87eadf6e072 100644
--- a/arch/powerpc/kernel/ptrace/Makefile
+++ b/arch/powerpc/kernel/ptrace/Makefile
@@ -12,3 +12,4 @@ ifneq ($(CONFIG_VSX),y)
 obj-y				+= ptrace-novsx.o
 endif
 obj-$(CONFIG_ALTIVEC)		+= ptrace-altivec.o
+obj-$(CONFIG_SPE)		+= ptrace-spe.o
diff --git a/arch/powerpc/kernel/ptrace/ptrace-decl.h b/arch/powerpc/kernel/ptrace/ptrace-decl.h
index 35c1d127fc64..8aee353a1208 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -25,3 +25,12 @@ int vr_get(struct task_struct *target, const struct user_regset *regset,
 int vr_set(struct task_struct *target, const struct user_regset *regset,
 	   unsigned int pos, unsigned int count,
 	   const void *kbuf, const void __user *ubuf);
+
+/* ptrace-spe */
+
+int evr_active(struct task_struct *target, const struct user_regset *regset);
+int evr_get(struct task_struct *target, const struct user_regset *regset,
+	    unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf);
+int evr_set(struct task_struct *target, const struct user_regset *regset,
+	    unsigned int pos, unsigned int count,
+	    const void *kbuf, const void __user *ubuf);
diff --git a/arch/powerpc/kernel/ptrace/ptrace-spe.c b/arch/powerpc/kernel/ptrace/ptrace-spe.c
new file mode 100644
index 000000000000..de190ae73d99
--- /dev/null
+++ b/arch/powerpc/kernel/ptrace/ptrace-spe.c
@@ -0,0 +1,94 @@
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
+#ifdef CONFIG_SPE
+
+/*
+ * For get_evrregs/set_evrregs functions 'data' has the following layout:
+ *
+ * struct {
+ *   u32 evr[32];
+ *   u64 acc;
+ *   u32 spefscr;
+ * }
+ */
+
+int evr_active(struct task_struct *target, const struct user_regset *regset)
+{
+	flush_spe_to_thread(target);
+	return target->thread.used_spe ? regset->n : 0;
+}
+
+int evr_get(struct task_struct *target, const struct user_regset *regset,
+	    unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
+{
+	int ret;
+
+	flush_spe_to_thread(target);
+
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				  &target->thread.evr,
+				  0, sizeof(target->thread.evr));
+
+	BUILD_BUG_ON(offsetof(struct thread_struct, acc) + sizeof(u64) !=
+		     offsetof(struct thread_struct, spefscr));
+
+	if (!ret)
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+					  &target->thread.acc,
+					  sizeof(target->thread.evr), -1);
+
+	return ret;
+}
+
+int evr_set(struct task_struct *target, const struct user_regset *regset,
+	    unsigned int pos, unsigned int count,
+	    const void *kbuf, const void __user *ubuf)
+{
+	int ret;
+
+	flush_spe_to_thread(target);
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				 &target->thread.evr,
+				 0, sizeof(target->thread.evr));
+
+	BUILD_BUG_ON(offsetof(struct thread_struct, acc) + sizeof(u64) !=
+		     offsetof(struct thread_struct, spefscr));
+
+	if (!ret)
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+					 &target->thread.acc,
+					 sizeof(target->thread.evr), -1);
+
+	return ret;
+}
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 141dc0b8f502..8bea896c841d 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -417,72 +417,6 @@ static int gpr_set(struct task_struct *target, const struct user_regset *regset,
 	return ret;
 }
 
-#ifdef CONFIG_SPE
-
-/*
- * For get_evrregs/set_evrregs functions 'data' has the following layout:
- *
- * struct {
- *   u32 evr[32];
- *   u64 acc;
- *   u32 spefscr;
- * }
- */
-
-static int evr_active(struct task_struct *target,
-		      const struct user_regset *regset)
-{
-	flush_spe_to_thread(target);
-	return target->thread.used_spe ? regset->n : 0;
-}
-
-static int evr_get(struct task_struct *target, const struct user_regset *regset,
-		   unsigned int pos, unsigned int count,
-		   void *kbuf, void __user *ubuf)
-{
-	int ret;
-
-	flush_spe_to_thread(target);
-
-	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				  &target->thread.evr,
-				  0, sizeof(target->thread.evr));
-
-	BUILD_BUG_ON(offsetof(struct thread_struct, acc) + sizeof(u64) !=
-		     offsetof(struct thread_struct, spefscr));
-
-	if (!ret)
-		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-					  &target->thread.acc,
-					  sizeof(target->thread.evr), -1);
-
-	return ret;
-}
-
-static int evr_set(struct task_struct *target, const struct user_regset *regset,
-		   unsigned int pos, unsigned int count,
-		   const void *kbuf, const void __user *ubuf)
-{
-	int ret;
-
-	flush_spe_to_thread(target);
-
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				 &target->thread.evr,
-				 0, sizeof(target->thread.evr));
-
-	BUILD_BUG_ON(offsetof(struct thread_struct, acc) + sizeof(u64) !=
-		     offsetof(struct thread_struct, spefscr));
-
-	if (!ret)
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-					 &target->thread.acc,
-					 sizeof(target->thread.evr), -1);
-
-	return ret;
-}
-#endif /* CONFIG_SPE */
-
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 /**
  * tm_cgpr_active - get active number of registers in CGPR
-- 
2.13.3

