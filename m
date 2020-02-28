Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A4C172D6B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 01:33:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T9Wd6bzBzDrL9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 11:33:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=HN/1cGqM; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T98W4h1jzDr4D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 11:17:15 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48T98Q4q4Yz9tyJf;
 Fri, 28 Feb 2020 01:17:10 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=HN/1cGqM; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xgeRmOnufYJ7; Fri, 28 Feb 2020 01:17:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48T98Q3T7rz9tyJd;
 Fri, 28 Feb 2020 01:17:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582849030; bh=ZvdfJLOGPFPeo/0KI2MkdeMmLY1bb2gvR9L0u5UQsgo=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=HN/1cGqMlTzdB5rcGN5YRtpL1QjGWgjO7Fk2dVp+9WEHvmfdUPVFQDOWu8nnxmidL
 l1zXnNcGQjgtCMc+98AisODjIO+RL7PNLAmeYa2XLsHHF5oT6btUDFQEDOrdzP7f+1
 rF2Dy0tHj0+hrO/GJlyLsv/NBDfnAUrhX+8ogqmg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C26D08B883;
 Fri, 28 Feb 2020 01:17:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NJw99dTAJhPJ; Fri, 28 Feb 2020 01:17:10 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9DD178B882;
 Fri, 28 Feb 2020 01:17:04 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BB98F65414; Fri, 28 Feb 2020 00:14:43 +0000 (UTC)
Message-Id: <0f17a331760310b5562fae3791cdd3cf9c64237b.1582848567.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1582848567.git.christophe.leroy@c-s.fr>
References: <cover.1582848567.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 07/13] powerpc/ptrace: split out SPE related functions.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Fri, 28 Feb 2020 00:14:43 +0000 (UTC)
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
v5: Added ptrace-decl.h
---
 arch/powerpc/kernel/ptrace/Makefile      |  1 +
 arch/powerpc/kernel/ptrace/ptrace-decl.h |  9 ++++
 arch/powerpc/kernel/ptrace/ptrace-spe.c  | 68 ++++++++++++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace.c      | 66 -----------------------
 4 files changed, 78 insertions(+), 66 deletions(-)
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
index 0f9282cb52fc..8a362f97f1d6 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -26,6 +26,15 @@ int vr_set(struct task_struct *target, const struct user_regset *regset,
 	   unsigned int pos, unsigned int count,
 	   const void *kbuf, const void __user *ubuf);
 
+/* ptrace-spe */
+
+int evr_active(struct task_struct *target, const struct user_regset *regset);
+int evr_get(struct task_struct *target, const struct user_regset *regset,
+	    unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf);
+int evr_set(struct task_struct *target, const struct user_regset *regset,
+	    unsigned int pos, unsigned int count,
+	    const void *kbuf, const void __user *ubuf);
+
 /* ptrace */
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
diff --git a/arch/powerpc/kernel/ptrace/ptrace-spe.c b/arch/powerpc/kernel/ptrace/ptrace-spe.c
new file mode 100644
index 000000000000..68b86b4a4be4
--- /dev/null
+++ b/arch/powerpc/kernel/ptrace/ptrace-spe.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/regset.h>
+
+#include <asm/switch_to.h>
+
+#include "ptrace-decl.h"
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
index c383325db4a6..ca2b4d804992 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -403,72 +403,6 @@ static int gpr_set(struct task_struct *target, const struct user_regset *regset,
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
2.25.0

