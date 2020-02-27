Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5801716DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 13:12:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Ss3x0nQ2zDqKD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 23:12:13 +1100 (AEDT)
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
 header.s=mail header.b=OTqkUrMk; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SrYG4dxRzDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 22:49:06 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48SrYB48dQz9tyhn;
 Thu, 27 Feb 2020 12:49:02 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=OTqkUrMk; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id V97EAzKJW0Dq; Thu, 27 Feb 2020 12:49:02 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48SrYB2XPhz9tyhM;
 Thu, 27 Feb 2020 12:49:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582804142; bh=Hsr4caioqMBx/5xWdUBlkmF0WK4LyopCvg/yuV/ZX/8=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=OTqkUrMkBjOl8q/Q8LZOz8tf54wPZnZ8IGQ6ndeQWFkQXe8VStukKeLVIPEWmnCjC
 CytFloIEukBssZBxB2SEa27t2Jw8gxMogmOYC7RguFdR5usHiM7d8Ef2C23zA4TqDd
 nqaiL9q+5ClEiXmXaAPK/gwsCOVvWnO4gRjuSnFE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8886A8B872;
 Thu, 27 Feb 2020 12:49:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id l7hWCGzS7nD0; Thu, 27 Feb 2020 12:49:03 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 035338B799;
 Thu, 27 Feb 2020 12:49:03 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A286B65402; Thu, 27 Feb 2020 11:49:02 +0000 (UTC)
Message-Id: <80bba4b3f280b0f10c7ccbfae3edb7fdc9b9c4e1.1582803998.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1582803998.git.christophe.leroy@c-s.fr>
References: <cover.1582803998.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 06/13] powerpc/ptrace: split out ALTIVEC related functions.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Thu, 27 Feb 2020 11:49:02 +0000 (UTC)
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
v4: add missing ptrace_decl.h
---
 arch/powerpc/kernel/ptrace/Makefile         |   1 +
 arch/powerpc/kernel/ptrace/ptrace-altivec.c | 128 ++++++++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace-decl.h    |   9 ++
 arch/powerpc/kernel/ptrace/ptrace.c         | 124 -------------------
 4 files changed, 138 insertions(+), 124 deletions(-)
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
index 000000000000..910d1d7389a6
--- /dev/null
+++ b/arch/powerpc/kernel/ptrace/ptrace-altivec.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/regset.h>
+#include <linux/elf.h>
+
+#include <asm/switch_to.h>
+
+#include "ptrace_decl.h"
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
index ead33b74e1f3..c383325db4a6 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -403,130 +403,6 @@ static int gpr_set(struct task_struct *target, const struct user_regset *regset,
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
2.25.0

