Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0521716FA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 13:20:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SsFM2719zDqjX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 23:20:23 +1100 (AEDT)
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
 header.s=mail header.b=GpVgwULL; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SrYJ5Q61zDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 22:49:08 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48SrYD4vBYz9tyj2;
 Thu, 27 Feb 2020 12:49:04 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=GpVgwULL; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6a1QKmnTj4ah; Thu, 27 Feb 2020 12:49:04 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48SrYD3kmKz9tyhM;
 Thu, 27 Feb 2020 12:49:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582804144; bh=v++nFf1YDMpI1RjND0bjql9hn7vMKsQ4QFrWgUju3uY=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=GpVgwULL8lCvExL14Rv7a/1ULUf1Y6BRm4hFosl5vkLyayjV78ta2aWmodkWZ93FS
 9c5BwyPIrwRdzmMa3ir/TpQw+aWqa2/VdKAmEmNMOGkphb1mBQFjFmSl96MdLezVLX
 spPjrqVKwNKB+oYG6gcFpsI60m7bbm6MfRS1qsMc=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B86008B872;
 Thu, 27 Feb 2020 12:49:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fNasdHHX9dTg; Thu, 27 Feb 2020 12:49:05 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 01D4A8B799;
 Thu, 27 Feb 2020 12:49:04 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C6F6465402; Thu, 27 Feb 2020 11:49:04 +0000 (UTC)
Message-Id: <c8339ef2b8da8a7ab65d76da5d29eacdb0a8c6ea.1582803998.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1582803998.git.christophe.leroy@c-s.fr>
References: <cover.1582803998.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 08/13] powerpc/ptrace: split out TRANSACTIONAL_MEM related
 functions.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Thu, 27 Feb 2020 11:49:04 +0000 (UTC)
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

Move TRANSACTIONAL_MEM functions out of ptrace.c, into
ptrace-tm.c

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
v4: leave asm-prototypes.h
---
 arch/powerpc/kernel/ptrace/Makefile      |   1 +
 arch/powerpc/kernel/ptrace/ptrace-decl.h |  89 +++
 arch/powerpc/kernel/ptrace/ptrace-tm.c   | 851 +++++++++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace.c      | 916 +----------------------
 4 files changed, 943 insertions(+), 914 deletions(-)
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-tm.c

diff --git a/arch/powerpc/kernel/ptrace/Makefile b/arch/powerpc/kernel/ptrace/Makefile
index f87eadf6e072..2d7f5f301536 100644
--- a/arch/powerpc/kernel/ptrace/Makefile
+++ b/arch/powerpc/kernel/ptrace/Makefile
@@ -13,3 +13,4 @@ obj-y				+= ptrace-novsx.o
 endif
 obj-$(CONFIG_ALTIVEC)		+= ptrace-altivec.o
 obj-$(CONFIG_SPE)		+= ptrace-spe.o
+obj-$(CONFIG_PPC_TRANSACTIONAL_MEM)	+= ptrace-tm.o
diff --git a/arch/powerpc/kernel/ptrace/ptrace-decl.h b/arch/powerpc/kernel/ptrace/ptrace-decl.h
index 8a362f97f1d6..8d076818f1de 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -1,5 +1,27 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 
+/*
+ * Set of msr bits that gdb can change on behalf of a process.
+ */
+#ifdef CONFIG_PPC_ADV_DEBUG_REGS
+#define MSR_DEBUGCHANGE	0
+#else
+#define MSR_DEBUGCHANGE	(MSR_SE | MSR_BE)
+#endif
+
+/*
+ * Max register writeable via put_reg
+ */
+#ifdef CONFIG_PPC32
+#define PT_MAX_PUT_REG	PT_MQ
+#else
+#define PT_MAX_PUT_REG	PT_CCR
+#endif
+
+#define TVSO(f)	(offsetof(struct thread_vr_state, f))
+#define TFSO(f)	(offsetof(struct thread_fp_state, f))
+#define TSO(f)	(offsetof(struct thread_struct, f))
+
 /* ptrace-(no)vsx */
 
 int fpr_get(struct task_struct *target, const struct user_regset *regset,
@@ -37,8 +59,75 @@ int evr_set(struct task_struct *target, const struct user_regset *regset,
 
 /* ptrace */
 
+int gpr32_get_common(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+			    void *kbuf, void __user *ubuf,
+			    unsigned long *regs);
+int gpr32_set_common(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+		     const void *kbuf, const void __user *ubuf,
+		     unsigned long *regs);
+
+/* ptrace-tm */
+
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 void flush_tmregs_to_thread(struct task_struct *tsk);
 #else
 static inline void flush_tmregs_to_thread(struct task_struct *tsk) { }
 #endif
+
+int tm_cgpr_active(struct task_struct *target, const struct user_regset *regset);
+int tm_cgpr_get(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf);
+int tm_cgpr_set(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count,
+		const void *kbuf, const void __user *ubuf);
+int tm_cfpr_active(struct task_struct *target, const struct user_regset *regset);
+int tm_cfpr_get(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf);
+int tm_cfpr_set(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count,
+		const void *kbuf, const void __user *ubuf);
+int tm_cvmx_active(struct task_struct *target, const struct user_regset *regset);
+int tm_cvmx_get(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf);
+int tm_cvmx_set(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count,
+		const void *kbuf, const void __user *ubuf);
+int tm_cvsx_active(struct task_struct *target, const struct user_regset *regset);
+int tm_cvsx_get(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf);
+int tm_cvsx_set(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count,
+		const void *kbuf, const void __user *ubuf);
+int tm_spr_active(struct task_struct *target, const struct user_regset *regset);
+int tm_spr_get(struct task_struct *target, const struct user_regset *regset,
+	       unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf);
+int tm_spr_set(struct task_struct *target, const struct user_regset *regset,
+	       unsigned int pos, unsigned int count,
+	       const void *kbuf, const void __user *ubuf);
+int tm_tar_active(struct task_struct *target, const struct user_regset *regset);
+int tm_tar_get(struct task_struct *target, const struct user_regset *regset,
+	       unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf);
+int tm_tar_set(struct task_struct *target, const struct user_regset *regset,
+	       unsigned int pos, unsigned int count,
+	       const void *kbuf, const void __user *ubuf);
+int tm_ppr_active(struct task_struct *target, const struct user_regset *regset);
+int tm_ppr_get(struct task_struct *target, const struct user_regset *regset,
+	       unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf);
+int tm_ppr_set(struct task_struct *target, const struct user_regset *regset,
+	       unsigned int pos, unsigned int count,
+	       const void *kbuf, const void __user *ubuf);
+int tm_dscr_active(struct task_struct *target, const struct user_regset *regset);
+int tm_dscr_get(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf);
+int tm_dscr_set(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count,
+		const void *kbuf, const void __user *ubuf);
+int tm_cgpr32_get(struct task_struct *target, const struct user_regset *regset,
+		  unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf);
+int tm_cgpr32_set(struct task_struct *target, const struct user_regset *regset,
+		  unsigned int pos, unsigned int count,
+		  const void *kbuf, const void __user *ubuf);
diff --git a/arch/powerpc/kernel/ptrace/ptrace-tm.c b/arch/powerpc/kernel/ptrace/ptrace-tm.c
new file mode 100644
index 000000000000..d75aff31f637
--- /dev/null
+++ b/arch/powerpc/kernel/ptrace/ptrace-tm.c
@@ -0,0 +1,851 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/regset.h>
+
+#include <asm/switch_to.h>
+#include <asm/tm.h>
+#include <asm/asm-prototypes.h>
+
+#include "ptrace-decl.h"
+
+void flush_tmregs_to_thread(struct task_struct *tsk)
+{
+	/*
+	 * If task is not current, it will have been flushed already to
+	 * it's thread_struct during __switch_to().
+	 *
+	 * A reclaim flushes ALL the state or if not in TM save TM SPRs
+	 * in the appropriate thread structures from live.
+	 */
+
+	if (!cpu_has_feature(CPU_FTR_TM) || tsk != current)
+		return;
+
+	if (MSR_TM_SUSPENDED(mfmsr())) {
+		tm_reclaim_current(TM_CAUSE_SIGNAL);
+	} else {
+		tm_enable();
+		tm_save_sprs(&tsk->thread);
+	}
+}
+
+static unsigned long get_user_ckpt_msr(struct task_struct *task)
+{
+	return task->thread.ckpt_regs.msr | task->thread.fpexc_mode;
+}
+
+static int set_user_ckpt_msr(struct task_struct *task, unsigned long msr)
+{
+	task->thread.ckpt_regs.msr &= ~MSR_DEBUGCHANGE;
+	task->thread.ckpt_regs.msr |= msr & MSR_DEBUGCHANGE;
+	return 0;
+}
+
+static int set_user_ckpt_trap(struct task_struct *task, unsigned long trap)
+{
+	task->thread.ckpt_regs.trap = trap & 0xfff0;
+	return 0;
+}
+
+/**
+ * tm_cgpr_active - get active number of registers in CGPR
+ * @target:	The target task.
+ * @regset:	The user regset structure.
+ *
+ * This function checks for the active number of available
+ * regisers in transaction checkpointed GPR category.
+ */
+int tm_cgpr_active(struct task_struct *target, const struct user_regset *regset)
+{
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return 0;
+
+	return regset->n;
+}
+
+/**
+ * tm_cgpr_get - get CGPR registers
+ * @target:	The target task.
+ * @regset:	The user regset structure.
+ * @pos:	The buffer position.
+ * @count:	Number of bytes to copy.
+ * @kbuf:	Kernel buffer to copy from.
+ * @ubuf:	User buffer to copy into.
+ *
+ * This function gets transaction checkpointed GPR registers.
+ *
+ * When the transaction is active, 'ckpt_regs' holds all the checkpointed
+ * GPR register values for the current transaction to fall back on if it
+ * aborts in between. This function gets those checkpointed GPR registers.
+ * The userspace interface buffer layout is as follows.
+ *
+ * struct data {
+ *	struct pt_regs ckpt_regs;
+ * };
+ */
+int tm_cgpr_get(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
+{
+	int ret;
+
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return -ENODATA;
+
+	flush_tmregs_to_thread(target);
+	flush_fp_to_thread(target);
+	flush_altivec_to_thread(target);
+
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				  &target->thread.ckpt_regs,
+				  0, offsetof(struct pt_regs, msr));
+	if (!ret) {
+		unsigned long msr = get_user_ckpt_msr(target);
+
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &msr,
+					  offsetof(struct pt_regs, msr),
+					  offsetof(struct pt_regs, msr) +
+					  sizeof(msr));
+	}
+
+	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
+		     offsetof(struct pt_regs, msr) + sizeof(long));
+
+	if (!ret)
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+					  &target->thread.ckpt_regs.orig_gpr3,
+					  offsetof(struct pt_regs, orig_gpr3),
+					  sizeof(struct user_pt_regs));
+	if (!ret)
+		ret = user_regset_copyout_zero(&pos, &count, &kbuf, &ubuf,
+					       sizeof(struct user_pt_regs), -1);
+
+	return ret;
+}
+
+/*
+ * tm_cgpr_set - set the CGPR registers
+ * @target:	The target task.
+ * @regset:	The user regset structure.
+ * @pos:	The buffer position.
+ * @count:	Number of bytes to copy.
+ * @kbuf:	Kernel buffer to copy into.
+ * @ubuf:	User buffer to copy from.
+ *
+ * This function sets in transaction checkpointed GPR registers.
+ *
+ * When the transaction is active, 'ckpt_regs' holds the checkpointed
+ * GPR register values for the current transaction to fall back on if it
+ * aborts in between. This function sets those checkpointed GPR registers.
+ * The userspace interface buffer layout is as follows.
+ *
+ * struct data {
+ *	struct pt_regs ckpt_regs;
+ * };
+ */
+int tm_cgpr_set(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count,
+		const void *kbuf, const void __user *ubuf)
+{
+	unsigned long reg;
+	int ret;
+
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return -ENODATA;
+
+	flush_tmregs_to_thread(target);
+	flush_fp_to_thread(target);
+	flush_altivec_to_thread(target);
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				 &target->thread.ckpt_regs,
+				 0, PT_MSR * sizeof(reg));
+
+	if (!ret && count > 0) {
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &reg,
+					 PT_MSR * sizeof(reg),
+					 (PT_MSR + 1) * sizeof(reg));
+		if (!ret)
+			ret = set_user_ckpt_msr(target, reg);
+	}
+
+	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
+		     offsetof(struct pt_regs, msr) + sizeof(long));
+
+	if (!ret)
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+					 &target->thread.ckpt_regs.orig_gpr3,
+					 PT_ORIG_R3 * sizeof(reg),
+					 (PT_MAX_PUT_REG + 1) * sizeof(reg));
+
+	if (PT_MAX_PUT_REG + 1 < PT_TRAP && !ret)
+		ret = user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
+						(PT_MAX_PUT_REG + 1) * sizeof(reg),
+						PT_TRAP * sizeof(reg));
+
+	if (!ret && count > 0) {
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &reg,
+					 PT_TRAP * sizeof(reg),
+					 (PT_TRAP + 1) * sizeof(reg));
+		if (!ret)
+			ret = set_user_ckpt_trap(target, reg);
+	}
+
+	if (!ret)
+		ret = user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
+						(PT_TRAP + 1) * sizeof(reg), -1);
+
+	return ret;
+}
+
+/**
+ * tm_cfpr_active - get active number of registers in CFPR
+ * @target:	The target task.
+ * @regset:	The user regset structure.
+ *
+ * This function checks for the active number of available
+ * regisers in transaction checkpointed FPR category.
+ */
+int tm_cfpr_active(struct task_struct *target, const struct user_regset *regset)
+{
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return 0;
+
+	return regset->n;
+}
+
+/**
+ * tm_cfpr_get - get CFPR registers
+ * @target:	The target task.
+ * @regset:	The user regset structure.
+ * @pos:	The buffer position.
+ * @count:	Number of bytes to copy.
+ * @kbuf:	Kernel buffer to copy from.
+ * @ubuf:	User buffer to copy into.
+ *
+ * This function gets in transaction checkpointed FPR registers.
+ *
+ * When the transaction is active 'ckfp_state' holds the checkpointed
+ * values for the current transaction to fall back on if it aborts
+ * in between. This function gets those checkpointed FPR registers.
+ * The userspace interface buffer layout is as follows.
+ *
+ * struct data {
+ *	u64	fpr[32];
+ *	u64	fpscr;
+ *};
+ */
+int tm_cfpr_get(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
+{
+	u64 buf[33];
+	int i;
+
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return -ENODATA;
+
+	flush_tmregs_to_thread(target);
+	flush_fp_to_thread(target);
+	flush_altivec_to_thread(target);
+
+	/* copy to local buffer then write that out */
+	for (i = 0; i < 32 ; i++)
+		buf[i] = target->thread.TS_CKFPR(i);
+	buf[32] = target->thread.ckfp_state.fpscr;
+	return user_regset_copyout(&pos, &count, &kbuf, &ubuf, buf, 0, -1);
+}
+
+/**
+ * tm_cfpr_set - set CFPR registers
+ * @target:	The target task.
+ * @regset:	The user regset structure.
+ * @pos:	The buffer position.
+ * @count:	Number of bytes to copy.
+ * @kbuf:	Kernel buffer to copy into.
+ * @ubuf:	User buffer to copy from.
+ *
+ * This function sets in transaction checkpointed FPR registers.
+ *
+ * When the transaction is active 'ckfp_state' holds the checkpointed
+ * FPR register values for the current transaction to fall back on
+ * if it aborts in between. This function sets these checkpointed
+ * FPR registers. The userspace interface buffer layout is as follows.
+ *
+ * struct data {
+ *	u64	fpr[32];
+ *	u64	fpscr;
+ *};
+ */
+int tm_cfpr_set(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count,
+		const void *kbuf, const void __user *ubuf)
+{
+	u64 buf[33];
+	int i;
+
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return -ENODATA;
+
+	flush_tmregs_to_thread(target);
+	flush_fp_to_thread(target);
+	flush_altivec_to_thread(target);
+
+	for (i = 0; i < 32; i++)
+		buf[i] = target->thread.TS_CKFPR(i);
+	buf[32] = target->thread.ckfp_state.fpscr;
+
+	/* copy to local buffer then write that out */
+	i = user_regset_copyin(&pos, &count, &kbuf, &ubuf, buf, 0, -1);
+	if (i)
+		return i;
+	for (i = 0; i < 32 ; i++)
+		target->thread.TS_CKFPR(i) = buf[i];
+	target->thread.ckfp_state.fpscr = buf[32];
+	return 0;
+}
+
+/**
+ * tm_cvmx_active - get active number of registers in CVMX
+ * @target:	The target task.
+ * @regset:	The user regset structure.
+ *
+ * This function checks for the active number of available
+ * regisers in checkpointed VMX category.
+ */
+int tm_cvmx_active(struct task_struct *target, const struct user_regset *regset)
+{
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return 0;
+
+	return regset->n;
+}
+
+/**
+ * tm_cvmx_get - get CMVX registers
+ * @target:	The target task.
+ * @regset:	The user regset structure.
+ * @pos:	The buffer position.
+ * @count:	Number of bytes to copy.
+ * @kbuf:	Kernel buffer to copy from.
+ * @ubuf:	User buffer to copy into.
+ *
+ * This function gets in transaction checkpointed VMX registers.
+ *
+ * When the transaction is active 'ckvr_state' and 'ckvrsave' hold
+ * the checkpointed values for the current transaction to fall
+ * back on if it aborts in between. The userspace interface buffer
+ * layout is as follows.
+ *
+ * struct data {
+ *	vector128	vr[32];
+ *	vector128	vscr;
+ *	vector128	vrsave;
+ *};
+ */
+int tm_cvmx_get(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
+{
+	int ret;
+
+	BUILD_BUG_ON(TVSO(vscr) != TVSO(vr[32]));
+
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return -ENODATA;
+
+	/* Flush the state */
+	flush_tmregs_to_thread(target);
+	flush_fp_to_thread(target);
+	flush_altivec_to_thread(target);
+
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &target->thread.ckvr_state,
+				  0, 33 * sizeof(vector128));
+	if (!ret) {
+		/*
+		 * Copy out only the low-order word of vrsave.
+		 */
+		union {
+			elf_vrreg_t reg;
+			u32 word;
+		} vrsave;
+		memset(&vrsave, 0, sizeof(vrsave));
+		vrsave.word = target->thread.ckvrsave;
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &vrsave,
+					  33 * sizeof(vector128), -1);
+	}
+
+	return ret;
+}
+
+/**
+ * tm_cvmx_set - set CMVX registers
+ * @target:	The target task.
+ * @regset:	The user regset structure.
+ * @pos:	The buffer position.
+ * @count:	Number of bytes to copy.
+ * @kbuf:	Kernel buffer to copy into.
+ * @ubuf:	User buffer to copy from.
+ *
+ * This function sets in transaction checkpointed VMX registers.
+ *
+ * When the transaction is active 'ckvr_state' and 'ckvrsave' hold
+ * the checkpointed values for the current transaction to fall
+ * back on if it aborts in between. The userspace interface buffer
+ * layout is as follows.
+ *
+ * struct data {
+ *	vector128	vr[32];
+ *	vector128	vscr;
+ *	vector128	vrsave;
+ *};
+ */
+int tm_cvmx_set(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count,
+		const void *kbuf, const void __user *ubuf)
+{
+	int ret;
+
+	BUILD_BUG_ON(TVSO(vscr) != TVSO(vr[32]));
+
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return -ENODATA;
+
+	flush_tmregs_to_thread(target);
+	flush_fp_to_thread(target);
+	flush_altivec_to_thread(target);
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &target->thread.ckvr_state,
+				 0, 33 * sizeof(vector128));
+	if (!ret && count > 0) {
+		/*
+		 * We use only the low-order word of vrsave.
+		 */
+		union {
+			elf_vrreg_t reg;
+			u32 word;
+		} vrsave;
+		memset(&vrsave, 0, sizeof(vrsave));
+		vrsave.word = target->thread.ckvrsave;
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &vrsave,
+					 33 * sizeof(vector128), -1);
+		if (!ret)
+			target->thread.ckvrsave = vrsave.word;
+	}
+
+	return ret;
+}
+
+/**
+ * tm_cvsx_active - get active number of registers in CVSX
+ * @target:	The target task.
+ * @regset:	The user regset structure.
+ *
+ * This function checks for the active number of available
+ * regisers in transaction checkpointed VSX category.
+ */
+int tm_cvsx_active(struct task_struct *target, const struct user_regset *regset)
+{
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return 0;
+
+	flush_vsx_to_thread(target);
+	return target->thread.used_vsr ? regset->n : 0;
+}
+
+/**
+ * tm_cvsx_get - get CVSX registers
+ * @target:	The target task.
+ * @regset:	The user regset structure.
+ * @pos:	The buffer position.
+ * @count:	Number of bytes to copy.
+ * @kbuf:	Kernel buffer to copy from.
+ * @ubuf:	User buffer to copy into.
+ *
+ * This function gets in transaction checkpointed VSX registers.
+ *
+ * When the transaction is active 'ckfp_state' holds the checkpointed
+ * values for the current transaction to fall back on if it aborts
+ * in between. This function gets those checkpointed VSX registers.
+ * The userspace interface buffer layout is as follows.
+ *
+ * struct data {
+ *	u64	vsx[32];
+ *};
+ */
+int tm_cvsx_get(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
+{
+	u64 buf[32];
+	int ret, i;
+
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return -ENODATA;
+
+	/* Flush the state */
+	flush_tmregs_to_thread(target);
+	flush_fp_to_thread(target);
+	flush_altivec_to_thread(target);
+	flush_vsx_to_thread(target);
+
+	for (i = 0; i < 32 ; i++)
+		buf[i] = target->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET];
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				  buf, 0, 32 * sizeof(double));
+
+	return ret;
+}
+
+/**
+ * tm_cvsx_set - set CFPR registers
+ * @target:	The target task.
+ * @regset:	The user regset structure.
+ * @pos:	The buffer position.
+ * @count:	Number of bytes to copy.
+ * @kbuf:	Kernel buffer to copy into.
+ * @ubuf:	User buffer to copy from.
+ *
+ * This function sets in transaction checkpointed VSX registers.
+ *
+ * When the transaction is active 'ckfp_state' holds the checkpointed
+ * VSX register values for the current transaction to fall back on
+ * if it aborts in between. This function sets these checkpointed
+ * FPR registers. The userspace interface buffer layout is as follows.
+ *
+ * struct data {
+ *	u64	vsx[32];
+ *};
+ */
+int tm_cvsx_set(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count,
+		const void *kbuf, const void __user *ubuf)
+{
+	u64 buf[32];
+	int ret, i;
+
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return -ENODATA;
+
+	/* Flush the state */
+	flush_tmregs_to_thread(target);
+	flush_fp_to_thread(target);
+	flush_altivec_to_thread(target);
+	flush_vsx_to_thread(target);
+
+	for (i = 0; i < 32 ; i++)
+		buf[i] = target->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET];
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				 buf, 0, 32 * sizeof(double));
+	if (!ret)
+		for (i = 0; i < 32 ; i++)
+			target->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET] = buf[i];
+
+	return ret;
+}
+
+/**
+ * tm_spr_active - get active number of registers in TM SPR
+ * @target:	The target task.
+ * @regset:	The user regset structure.
+ *
+ * This function checks the active number of available
+ * regisers in the transactional memory SPR category.
+ */
+int tm_spr_active(struct task_struct *target, const struct user_regset *regset)
+{
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	return regset->n;
+}
+
+/**
+ * tm_spr_get - get the TM related SPR registers
+ * @target:	The target task.
+ * @regset:	The user regset structure.
+ * @pos:	The buffer position.
+ * @count:	Number of bytes to copy.
+ * @kbuf:	Kernel buffer to copy from.
+ * @ubuf:	User buffer to copy into.
+ *
+ * This function gets transactional memory related SPR registers.
+ * The userspace interface buffer layout is as follows.
+ *
+ * struct {
+ *	u64		tm_tfhar;
+ *	u64		tm_texasr;
+ *	u64		tm_tfiar;
+ * };
+ */
+int tm_spr_get(struct task_struct *target, const struct user_regset *regset,
+	       unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
+{
+	int ret;
+
+	/* Build tests */
+	BUILD_BUG_ON(TSO(tm_tfhar) + sizeof(u64) != TSO(tm_texasr));
+	BUILD_BUG_ON(TSO(tm_texasr) + sizeof(u64) != TSO(tm_tfiar));
+	BUILD_BUG_ON(TSO(tm_tfiar) + sizeof(u64) != TSO(ckpt_regs));
+
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	/* Flush the states */
+	flush_tmregs_to_thread(target);
+	flush_fp_to_thread(target);
+	flush_altivec_to_thread(target);
+
+	/* TFHAR register */
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				  &target->thread.tm_tfhar, 0, sizeof(u64));
+
+	/* TEXASR register */
+	if (!ret)
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+					  &target->thread.tm_texasr, sizeof(u64),
+					  2 * sizeof(u64));
+
+	/* TFIAR register */
+	if (!ret)
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+					  &target->thread.tm_tfiar,
+					  2 * sizeof(u64), 3 * sizeof(u64));
+	return ret;
+}
+
+/**
+ * tm_spr_set - set the TM related SPR registers
+ * @target:	The target task.
+ * @regset:	The user regset structure.
+ * @pos:	The buffer position.
+ * @count:	Number of bytes to copy.
+ * @kbuf:	Kernel buffer to copy into.
+ * @ubuf:	User buffer to copy from.
+ *
+ * This function sets transactional memory related SPR registers.
+ * The userspace interface buffer layout is as follows.
+ *
+ * struct {
+ *	u64		tm_tfhar;
+ *	u64		tm_texasr;
+ *	u64		tm_tfiar;
+ * };
+ */
+int tm_spr_set(struct task_struct *target, const struct user_regset *regset,
+	       unsigned int pos, unsigned int count,
+	       const void *kbuf, const void __user *ubuf)
+{
+	int ret;
+
+	/* Build tests */
+	BUILD_BUG_ON(TSO(tm_tfhar) + sizeof(u64) != TSO(tm_texasr));
+	BUILD_BUG_ON(TSO(tm_texasr) + sizeof(u64) != TSO(tm_tfiar));
+	BUILD_BUG_ON(TSO(tm_tfiar) + sizeof(u64) != TSO(ckpt_regs));
+
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	/* Flush the states */
+	flush_tmregs_to_thread(target);
+	flush_fp_to_thread(target);
+	flush_altivec_to_thread(target);
+
+	/* TFHAR register */
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				 &target->thread.tm_tfhar, 0, sizeof(u64));
+
+	/* TEXASR register */
+	if (!ret)
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+					 &target->thread.tm_texasr, sizeof(u64),
+					 2 * sizeof(u64));
+
+	/* TFIAR register */
+	if (!ret)
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+					 &target->thread.tm_tfiar,
+					 2 * sizeof(u64), 3 * sizeof(u64));
+	return ret;
+}
+
+int tm_tar_active(struct task_struct *target, const struct user_regset *regset)
+{
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (MSR_TM_ACTIVE(target->thread.regs->msr))
+		return regset->n;
+
+	return 0;
+}
+
+int tm_tar_get(struct task_struct *target, const struct user_regset *regset,
+	       unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
+{
+	int ret;
+
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return -ENODATA;
+
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				  &target->thread.tm_tar, 0, sizeof(u64));
+	return ret;
+}
+
+int tm_tar_set(struct task_struct *target, const struct user_regset *regset,
+	       unsigned int pos, unsigned int count,
+	       const void *kbuf, const void __user *ubuf)
+{
+	int ret;
+
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return -ENODATA;
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				 &target->thread.tm_tar, 0, sizeof(u64));
+	return ret;
+}
+
+int tm_ppr_active(struct task_struct *target, const struct user_regset *regset)
+{
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (MSR_TM_ACTIVE(target->thread.regs->msr))
+		return regset->n;
+
+	return 0;
+}
+
+
+int tm_ppr_get(struct task_struct *target, const struct user_regset *regset,
+	       unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
+{
+	int ret;
+
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return -ENODATA;
+
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				  &target->thread.tm_ppr, 0, sizeof(u64));
+	return ret;
+}
+
+int tm_ppr_set(struct task_struct *target, const struct user_regset *regset,
+	       unsigned int pos, unsigned int count,
+	       const void *kbuf, const void __user *ubuf)
+{
+	int ret;
+
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return -ENODATA;
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				 &target->thread.tm_ppr, 0, sizeof(u64));
+	return ret;
+}
+
+int tm_dscr_active(struct task_struct *target, const struct user_regset *regset)
+{
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (MSR_TM_ACTIVE(target->thread.regs->msr))
+		return regset->n;
+
+	return 0;
+}
+
+int tm_dscr_get(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
+{
+	int ret;
+
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return -ENODATA;
+
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				  &target->thread.tm_dscr, 0, sizeof(u64));
+	return ret;
+}
+
+int tm_dscr_set(struct task_struct *target, const struct user_regset *regset,
+		unsigned int pos, unsigned int count,
+		const void *kbuf, const void __user *ubuf)
+{
+	int ret;
+
+	if (!cpu_has_feature(CPU_FTR_TM))
+		return -ENODEV;
+
+	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
+		return -ENODATA;
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				 &target->thread.tm_dscr, 0, sizeof(u64));
+	return ret;
+}
+
+int tm_cgpr32_get(struct task_struct *target, const struct user_regset *regset,
+		  unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
+{
+	return gpr32_get_common(target, regset, pos, count, kbuf, ubuf,
+				&target->thread.ckpt_regs.gpr[0]);
+}
+
+int tm_cgpr32_set(struct task_struct *target, const struct user_regset *regset,
+		  unsigned int pos, unsigned int count,
+		  const void *kbuf, const void __user *ubuf)
+{
+	return gpr32_set_common(target, regset, pos, count, kbuf, ubuf,
+				&target->thread.ckpt_regs.gpr[0]);
+}
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index ca2b4d804992..2ed032f00a19 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -26,7 +26,6 @@
 #include <linux/pkeys.h>
 
 #include <asm/switch_to.h>
-#include <asm/tm.h>
 #include <asm/asm-prototypes.h>
 #include <asm/debug.h>
 
@@ -47,10 +46,6 @@ struct pt_regs_offset {
 	{.name = STR(gpr##num), .offset = offsetof(struct pt_regs, gpr[num])}
 #define REG_OFFSET_END {.name = NULL, .offset = 0}
 
-#define TVSO(f)	(offsetof(struct thread_vr_state, f))
-#define TFSO(f)	(offsetof(struct thread_fp_state, f))
-#define TSO(f)	(offsetof(struct thread_struct, f))
-
 static const struct pt_regs_offset regoffset_table[] = {
 	GPR_OFFSET_NAME(0),
 	GPR_OFFSET_NAME(1),
@@ -101,29 +96,6 @@ static const struct pt_regs_offset regoffset_table[] = {
 	REG_OFFSET_END,
 };
 
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-void flush_tmregs_to_thread(struct task_struct *tsk)
-{
-	/*
-	 * If task is not current, it will have been flushed already to
-	 * it's thread_struct during __switch_to().
-	 *
-	 * A reclaim flushes ALL the state or if not in TM save TM SPRs
-	 * in the appropriate thread structures from live.
-	 */
-
-	if ((!cpu_has_feature(CPU_FTR_TM)) || (tsk != current))
-		return;
-
-	if (MSR_TM_SUSPENDED(mfmsr())) {
-		tm_reclaim_current(TM_CAUSE_SIGNAL);
-	} else {
-		tm_enable();
-		tm_save_sprs(&(tsk->thread));
-	}
-}
-#endif
-
 /**
  * regs_query_register_offset() - query register offset from its name
  * @name:	the name of a register
@@ -161,24 +133,6 @@ const char *regs_query_register_name(unsigned int offset)
  * in exit.c or in signal.c.
  */
 
-/*
- * Set of msr bits that gdb can change on behalf of a process.
- */
-#ifdef CONFIG_PPC_ADV_DEBUG_REGS
-#define MSR_DEBUGCHANGE	0
-#else
-#define MSR_DEBUGCHANGE	(MSR_SE | MSR_BE)
-#endif
-
-/*
- * Max register writeable via put_reg
- */
-#ifdef CONFIG_PPC32
-#define PT_MAX_PUT_REG	PT_MQ
-#else
-#define PT_MAX_PUT_REG	PT_CCR
-#endif
-
 static unsigned long get_user_msr(struct task_struct *task)
 {
 	return task->thread.regs->msr | task->thread.fpexc_mode;
@@ -191,26 +145,6 @@ static int set_user_msr(struct task_struct *task, unsigned long msr)
 	return 0;
 }
 
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-static unsigned long get_user_ckpt_msr(struct task_struct *task)
-{
-	return task->thread.ckpt_regs.msr | task->thread.fpexc_mode;
-}
-
-static int set_user_ckpt_msr(struct task_struct *task, unsigned long msr)
-{
-	task->thread.ckpt_regs.msr &= ~MSR_DEBUGCHANGE;
-	task->thread.ckpt_regs.msr |= msr & MSR_DEBUGCHANGE;
-	return 0;
-}
-
-static int set_user_ckpt_trap(struct task_struct *task, unsigned long trap)
-{
-	task->thread.ckpt_regs.trap = trap & 0xfff0;
-	return 0;
-}
-#endif
-
 #ifdef CONFIG_PPC64
 static int get_user_dscr(struct task_struct *task, unsigned long *data)
 {
@@ -403,832 +337,6 @@ static int gpr_set(struct task_struct *target, const struct user_regset *regset,
 	return ret;
 }
 
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-/**
- * tm_cgpr_active - get active number of registers in CGPR
- * @target:	The target task.
- * @regset:	The user regset structure.
- *
- * This function checks for the active number of available
- * regisers in transaction checkpointed GPR category.
- */
-static int tm_cgpr_active(struct task_struct *target,
-			  const struct user_regset *regset)
-{
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return 0;
-
-	return regset->n;
-}
-
-/**
- * tm_cgpr_get - get CGPR registers
- * @target:	The target task.
- * @regset:	The user regset structure.
- * @pos:	The buffer position.
- * @count:	Number of bytes to copy.
- * @kbuf:	Kernel buffer to copy from.
- * @ubuf:	User buffer to copy into.
- *
- * This function gets transaction checkpointed GPR registers.
- *
- * When the transaction is active, 'ckpt_regs' holds all the checkpointed
- * GPR register values for the current transaction to fall back on if it
- * aborts in between. This function gets those checkpointed GPR registers.
- * The userspace interface buffer layout is as follows.
- *
- * struct data {
- *	struct pt_regs ckpt_regs;
- * };
- */
-static int tm_cgpr_get(struct task_struct *target,
-			const struct user_regset *regset,
-			unsigned int pos, unsigned int count,
-			void *kbuf, void __user *ubuf)
-{
-	int ret;
-
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return -ENODATA;
-
-	flush_tmregs_to_thread(target);
-	flush_fp_to_thread(target);
-	flush_altivec_to_thread(target);
-
-	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				  &target->thread.ckpt_regs,
-				  0, offsetof(struct pt_regs, msr));
-	if (!ret) {
-		unsigned long msr = get_user_ckpt_msr(target);
-
-		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &msr,
-					  offsetof(struct pt_regs, msr),
-					  offsetof(struct pt_regs, msr) +
-					  sizeof(msr));
-	}
-
-	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
-		     offsetof(struct pt_regs, msr) + sizeof(long));
-
-	if (!ret)
-		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-					  &target->thread.ckpt_regs.orig_gpr3,
-					  offsetof(struct pt_regs, orig_gpr3),
-					  sizeof(struct user_pt_regs));
-	if (!ret)
-		ret = user_regset_copyout_zero(&pos, &count, &kbuf, &ubuf,
-					       sizeof(struct user_pt_regs), -1);
-
-	return ret;
-}
-
-/*
- * tm_cgpr_set - set the CGPR registers
- * @target:	The target task.
- * @regset:	The user regset structure.
- * @pos:	The buffer position.
- * @count:	Number of bytes to copy.
- * @kbuf:	Kernel buffer to copy into.
- * @ubuf:	User buffer to copy from.
- *
- * This function sets in transaction checkpointed GPR registers.
- *
- * When the transaction is active, 'ckpt_regs' holds the checkpointed
- * GPR register values for the current transaction to fall back on if it
- * aborts in between. This function sets those checkpointed GPR registers.
- * The userspace interface buffer layout is as follows.
- *
- * struct data {
- *	struct pt_regs ckpt_regs;
- * };
- */
-static int tm_cgpr_set(struct task_struct *target,
-			const struct user_regset *regset,
-			unsigned int pos, unsigned int count,
-			const void *kbuf, const void __user *ubuf)
-{
-	unsigned long reg;
-	int ret;
-
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return -ENODATA;
-
-	flush_tmregs_to_thread(target);
-	flush_fp_to_thread(target);
-	flush_altivec_to_thread(target);
-
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				 &target->thread.ckpt_regs,
-				 0, PT_MSR * sizeof(reg));
-
-	if (!ret && count > 0) {
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &reg,
-					 PT_MSR * sizeof(reg),
-					 (PT_MSR + 1) * sizeof(reg));
-		if (!ret)
-			ret = set_user_ckpt_msr(target, reg);
-	}
-
-	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
-		     offsetof(struct pt_regs, msr) + sizeof(long));
-
-	if (!ret)
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-					 &target->thread.ckpt_regs.orig_gpr3,
-					 PT_ORIG_R3 * sizeof(reg),
-					 (PT_MAX_PUT_REG + 1) * sizeof(reg));
-
-	if (PT_MAX_PUT_REG + 1 < PT_TRAP && !ret)
-		ret = user_regset_copyin_ignore(
-			&pos, &count, &kbuf, &ubuf,
-			(PT_MAX_PUT_REG + 1) * sizeof(reg),
-			PT_TRAP * sizeof(reg));
-
-	if (!ret && count > 0) {
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &reg,
-					 PT_TRAP * sizeof(reg),
-					 (PT_TRAP + 1) * sizeof(reg));
-		if (!ret)
-			ret = set_user_ckpt_trap(target, reg);
-	}
-
-	if (!ret)
-		ret = user_regset_copyin_ignore(
-			&pos, &count, &kbuf, &ubuf,
-			(PT_TRAP + 1) * sizeof(reg), -1);
-
-	return ret;
-}
-
-/**
- * tm_cfpr_active - get active number of registers in CFPR
- * @target:	The target task.
- * @regset:	The user regset structure.
- *
- * This function checks for the active number of available
- * regisers in transaction checkpointed FPR category.
- */
-static int tm_cfpr_active(struct task_struct *target,
-				const struct user_regset *regset)
-{
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return 0;
-
-	return regset->n;
-}
-
-/**
- * tm_cfpr_get - get CFPR registers
- * @target:	The target task.
- * @regset:	The user regset structure.
- * @pos:	The buffer position.
- * @count:	Number of bytes to copy.
- * @kbuf:	Kernel buffer to copy from.
- * @ubuf:	User buffer to copy into.
- *
- * This function gets in transaction checkpointed FPR registers.
- *
- * When the transaction is active 'ckfp_state' holds the checkpointed
- * values for the current transaction to fall back on if it aborts
- * in between. This function gets those checkpointed FPR registers.
- * The userspace interface buffer layout is as follows.
- *
- * struct data {
- *	u64	fpr[32];
- *	u64	fpscr;
- *};
- */
-static int tm_cfpr_get(struct task_struct *target,
-			const struct user_regset *regset,
-			unsigned int pos, unsigned int count,
-			void *kbuf, void __user *ubuf)
-{
-	u64 buf[33];
-	int i;
-
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return -ENODATA;
-
-	flush_tmregs_to_thread(target);
-	flush_fp_to_thread(target);
-	flush_altivec_to_thread(target);
-
-	/* copy to local buffer then write that out */
-	for (i = 0; i < 32 ; i++)
-		buf[i] = target->thread.TS_CKFPR(i);
-	buf[32] = target->thread.ckfp_state.fpscr;
-	return user_regset_copyout(&pos, &count, &kbuf, &ubuf, buf, 0, -1);
-}
-
-/**
- * tm_cfpr_set - set CFPR registers
- * @target:	The target task.
- * @regset:	The user regset structure.
- * @pos:	The buffer position.
- * @count:	Number of bytes to copy.
- * @kbuf:	Kernel buffer to copy into.
- * @ubuf:	User buffer to copy from.
- *
- * This function sets in transaction checkpointed FPR registers.
- *
- * When the transaction is active 'ckfp_state' holds the checkpointed
- * FPR register values for the current transaction to fall back on
- * if it aborts in between. This function sets these checkpointed
- * FPR registers. The userspace interface buffer layout is as follows.
- *
- * struct data {
- *	u64	fpr[32];
- *	u64	fpscr;
- *};
- */
-static int tm_cfpr_set(struct task_struct *target,
-			const struct user_regset *regset,
-			unsigned int pos, unsigned int count,
-			const void *kbuf, const void __user *ubuf)
-{
-	u64 buf[33];
-	int i;
-
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return -ENODATA;
-
-	flush_tmregs_to_thread(target);
-	flush_fp_to_thread(target);
-	flush_altivec_to_thread(target);
-
-	for (i = 0; i < 32; i++)
-		buf[i] = target->thread.TS_CKFPR(i);
-	buf[32] = target->thread.ckfp_state.fpscr;
-
-	/* copy to local buffer then write that out */
-	i = user_regset_copyin(&pos, &count, &kbuf, &ubuf, buf, 0, -1);
-	if (i)
-		return i;
-	for (i = 0; i < 32 ; i++)
-		target->thread.TS_CKFPR(i) = buf[i];
-	target->thread.ckfp_state.fpscr = buf[32];
-	return 0;
-}
-
-/**
- * tm_cvmx_active - get active number of registers in CVMX
- * @target:	The target task.
- * @regset:	The user regset structure.
- *
- * This function checks for the active number of available
- * regisers in checkpointed VMX category.
- */
-static int tm_cvmx_active(struct task_struct *target,
-				const struct user_regset *regset)
-{
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return 0;
-
-	return regset->n;
-}
-
-/**
- * tm_cvmx_get - get CMVX registers
- * @target:	The target task.
- * @regset:	The user regset structure.
- * @pos:	The buffer position.
- * @count:	Number of bytes to copy.
- * @kbuf:	Kernel buffer to copy from.
- * @ubuf:	User buffer to copy into.
- *
- * This function gets in transaction checkpointed VMX registers.
- *
- * When the transaction is active 'ckvr_state' and 'ckvrsave' hold
- * the checkpointed values for the current transaction to fall
- * back on if it aborts in between. The userspace interface buffer
- * layout is as follows.
- *
- * struct data {
- *	vector128	vr[32];
- *	vector128	vscr;
- *	vector128	vrsave;
- *};
- */
-static int tm_cvmx_get(struct task_struct *target,
-			const struct user_regset *regset,
-			unsigned int pos, unsigned int count,
-			void *kbuf, void __user *ubuf)
-{
-	int ret;
-
-	BUILD_BUG_ON(TVSO(vscr) != TVSO(vr[32]));
-
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return -ENODATA;
-
-	/* Flush the state */
-	flush_tmregs_to_thread(target);
-	flush_fp_to_thread(target);
-	flush_altivec_to_thread(target);
-
-	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-					&target->thread.ckvr_state, 0,
-					33 * sizeof(vector128));
-	if (!ret) {
-		/*
-		 * Copy out only the low-order word of vrsave.
-		 */
-		union {
-			elf_vrreg_t reg;
-			u32 word;
-		} vrsave;
-		memset(&vrsave, 0, sizeof(vrsave));
-		vrsave.word = target->thread.ckvrsave;
-		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &vrsave,
-						33 * sizeof(vector128), -1);
-	}
-
-	return ret;
-}
-
-/**
- * tm_cvmx_set - set CMVX registers
- * @target:	The target task.
- * @regset:	The user regset structure.
- * @pos:	The buffer position.
- * @count:	Number of bytes to copy.
- * @kbuf:	Kernel buffer to copy into.
- * @ubuf:	User buffer to copy from.
- *
- * This function sets in transaction checkpointed VMX registers.
- *
- * When the transaction is active 'ckvr_state' and 'ckvrsave' hold
- * the checkpointed values for the current transaction to fall
- * back on if it aborts in between. The userspace interface buffer
- * layout is as follows.
- *
- * struct data {
- *	vector128	vr[32];
- *	vector128	vscr;
- *	vector128	vrsave;
- *};
- */
-static int tm_cvmx_set(struct task_struct *target,
-			const struct user_regset *regset,
-			unsigned int pos, unsigned int count,
-			const void *kbuf, const void __user *ubuf)
-{
-	int ret;
-
-	BUILD_BUG_ON(TVSO(vscr) != TVSO(vr[32]));
-
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return -ENODATA;
-
-	flush_tmregs_to_thread(target);
-	flush_fp_to_thread(target);
-	flush_altivec_to_thread(target);
-
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-					&target->thread.ckvr_state, 0,
-					33 * sizeof(vector128));
-	if (!ret && count > 0) {
-		/*
-		 * We use only the low-order word of vrsave.
-		 */
-		union {
-			elf_vrreg_t reg;
-			u32 word;
-		} vrsave;
-		memset(&vrsave, 0, sizeof(vrsave));
-		vrsave.word = target->thread.ckvrsave;
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &vrsave,
-						33 * sizeof(vector128), -1);
-		if (!ret)
-			target->thread.ckvrsave = vrsave.word;
-	}
-
-	return ret;
-}
-
-/**
- * tm_cvsx_active - get active number of registers in CVSX
- * @target:	The target task.
- * @regset:	The user regset structure.
- *
- * This function checks for the active number of available
- * regisers in transaction checkpointed VSX category.
- */
-static int tm_cvsx_active(struct task_struct *target,
-				const struct user_regset *regset)
-{
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return 0;
-
-	flush_vsx_to_thread(target);
-	return target->thread.used_vsr ? regset->n : 0;
-}
-
-/**
- * tm_cvsx_get - get CVSX registers
- * @target:	The target task.
- * @regset:	The user regset structure.
- * @pos:	The buffer position.
- * @count:	Number of bytes to copy.
- * @kbuf:	Kernel buffer to copy from.
- * @ubuf:	User buffer to copy into.
- *
- * This function gets in transaction checkpointed VSX registers.
- *
- * When the transaction is active 'ckfp_state' holds the checkpointed
- * values for the current transaction to fall back on if it aborts
- * in between. This function gets those checkpointed VSX registers.
- * The userspace interface buffer layout is as follows.
- *
- * struct data {
- *	u64	vsx[32];
- *};
- */
-static int tm_cvsx_get(struct task_struct *target,
-			const struct user_regset *regset,
-			unsigned int pos, unsigned int count,
-			void *kbuf, void __user *ubuf)
-{
-	u64 buf[32];
-	int ret, i;
-
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return -ENODATA;
-
-	/* Flush the state */
-	flush_tmregs_to_thread(target);
-	flush_fp_to_thread(target);
-	flush_altivec_to_thread(target);
-	flush_vsx_to_thread(target);
-
-	for (i = 0; i < 32 ; i++)
-		buf[i] = target->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET];
-	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				  buf, 0, 32 * sizeof(double));
-
-	return ret;
-}
-
-/**
- * tm_cvsx_set - set CFPR registers
- * @target:	The target task.
- * @regset:	The user regset structure.
- * @pos:	The buffer position.
- * @count:	Number of bytes to copy.
- * @kbuf:	Kernel buffer to copy into.
- * @ubuf:	User buffer to copy from.
- *
- * This function sets in transaction checkpointed VSX registers.
- *
- * When the transaction is active 'ckfp_state' holds the checkpointed
- * VSX register values for the current transaction to fall back on
- * if it aborts in between. This function sets these checkpointed
- * FPR registers. The userspace interface buffer layout is as follows.
- *
- * struct data {
- *	u64	vsx[32];
- *};
- */
-static int tm_cvsx_set(struct task_struct *target,
-			const struct user_regset *regset,
-			unsigned int pos, unsigned int count,
-			const void *kbuf, const void __user *ubuf)
-{
-	u64 buf[32];
-	int ret, i;
-
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return -ENODATA;
-
-	/* Flush the state */
-	flush_tmregs_to_thread(target);
-	flush_fp_to_thread(target);
-	flush_altivec_to_thread(target);
-	flush_vsx_to_thread(target);
-
-	for (i = 0; i < 32 ; i++)
-		buf[i] = target->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET];
-
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				 buf, 0, 32 * sizeof(double));
-	if (!ret)
-		for (i = 0; i < 32 ; i++)
-			target->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET] = buf[i];
-
-	return ret;
-}
-
-/**
- * tm_spr_active - get active number of registers in TM SPR
- * @target:	The target task.
- * @regset:	The user regset structure.
- *
- * This function checks the active number of available
- * regisers in the transactional memory SPR category.
- */
-static int tm_spr_active(struct task_struct *target,
-			 const struct user_regset *regset)
-{
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	return regset->n;
-}
-
-/**
- * tm_spr_get - get the TM related SPR registers
- * @target:	The target task.
- * @regset:	The user regset structure.
- * @pos:	The buffer position.
- * @count:	Number of bytes to copy.
- * @kbuf:	Kernel buffer to copy from.
- * @ubuf:	User buffer to copy into.
- *
- * This function gets transactional memory related SPR registers.
- * The userspace interface buffer layout is as follows.
- *
- * struct {
- *	u64		tm_tfhar;
- *	u64		tm_texasr;
- *	u64		tm_tfiar;
- * };
- */
-static int tm_spr_get(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      void *kbuf, void __user *ubuf)
-{
-	int ret;
-
-	/* Build tests */
-	BUILD_BUG_ON(TSO(tm_tfhar) + sizeof(u64) != TSO(tm_texasr));
-	BUILD_BUG_ON(TSO(tm_texasr) + sizeof(u64) != TSO(tm_tfiar));
-	BUILD_BUG_ON(TSO(tm_tfiar) + sizeof(u64) != TSO(ckpt_regs));
-
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	/* Flush the states */
-	flush_tmregs_to_thread(target);
-	flush_fp_to_thread(target);
-	flush_altivec_to_thread(target);
-
-	/* TFHAR register */
-	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				&target->thread.tm_tfhar, 0, sizeof(u64));
-
-	/* TEXASR register */
-	if (!ret)
-		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				&target->thread.tm_texasr, sizeof(u64),
-				2 * sizeof(u64));
-
-	/* TFIAR register */
-	if (!ret)
-		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				&target->thread.tm_tfiar,
-				2 * sizeof(u64), 3 * sizeof(u64));
-	return ret;
-}
-
-/**
- * tm_spr_set - set the TM related SPR registers
- * @target:	The target task.
- * @regset:	The user regset structure.
- * @pos:	The buffer position.
- * @count:	Number of bytes to copy.
- * @kbuf:	Kernel buffer to copy into.
- * @ubuf:	User buffer to copy from.
- *
- * This function sets transactional memory related SPR registers.
- * The userspace interface buffer layout is as follows.
- *
- * struct {
- *	u64		tm_tfhar;
- *	u64		tm_texasr;
- *	u64		tm_tfiar;
- * };
- */
-static int tm_spr_set(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      const void *kbuf, const void __user *ubuf)
-{
-	int ret;
-
-	/* Build tests */
-	BUILD_BUG_ON(TSO(tm_tfhar) + sizeof(u64) != TSO(tm_texasr));
-	BUILD_BUG_ON(TSO(tm_texasr) + sizeof(u64) != TSO(tm_tfiar));
-	BUILD_BUG_ON(TSO(tm_tfiar) + sizeof(u64) != TSO(ckpt_regs));
-
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	/* Flush the states */
-	flush_tmregs_to_thread(target);
-	flush_fp_to_thread(target);
-	flush_altivec_to_thread(target);
-
-	/* TFHAR register */
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				&target->thread.tm_tfhar, 0, sizeof(u64));
-
-	/* TEXASR register */
-	if (!ret)
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				&target->thread.tm_texasr, sizeof(u64),
-				2 * sizeof(u64));
-
-	/* TFIAR register */
-	if (!ret)
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				&target->thread.tm_tfiar,
-				 2 * sizeof(u64), 3 * sizeof(u64));
-	return ret;
-}
-
-static int tm_tar_active(struct task_struct *target,
-			 const struct user_regset *regset)
-{
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (MSR_TM_ACTIVE(target->thread.regs->msr))
-		return regset->n;
-
-	return 0;
-}
-
-static int tm_tar_get(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      void *kbuf, void __user *ubuf)
-{
-	int ret;
-
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return -ENODATA;
-
-	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				&target->thread.tm_tar, 0, sizeof(u64));
-	return ret;
-}
-
-static int tm_tar_set(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      const void *kbuf, const void __user *ubuf)
-{
-	int ret;
-
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return -ENODATA;
-
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				&target->thread.tm_tar, 0, sizeof(u64));
-	return ret;
-}
-
-static int tm_ppr_active(struct task_struct *target,
-			 const struct user_regset *regset)
-{
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (MSR_TM_ACTIVE(target->thread.regs->msr))
-		return regset->n;
-
-	return 0;
-}
-
-
-static int tm_ppr_get(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      void *kbuf, void __user *ubuf)
-{
-	int ret;
-
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return -ENODATA;
-
-	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				&target->thread.tm_ppr, 0, sizeof(u64));
-	return ret;
-}
-
-static int tm_ppr_set(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      const void *kbuf, const void __user *ubuf)
-{
-	int ret;
-
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return -ENODATA;
-
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				&target->thread.tm_ppr, 0, sizeof(u64));
-	return ret;
-}
-
-static int tm_dscr_active(struct task_struct *target,
-			 const struct user_regset *regset)
-{
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (MSR_TM_ACTIVE(target->thread.regs->msr))
-		return regset->n;
-
-	return 0;
-}
-
-static int tm_dscr_get(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      void *kbuf, void __user *ubuf)
-{
-	int ret;
-
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return -ENODATA;
-
-	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				&target->thread.tm_dscr, 0, sizeof(u64));
-	return ret;
-}
-
-static int tm_dscr_set(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      const void *kbuf, const void __user *ubuf)
-{
-	int ret;
-
-	if (!cpu_has_feature(CPU_FTR_TM))
-		return -ENODEV;
-
-	if (!MSR_TM_ACTIVE(target->thread.regs->msr))
-		return -ENODATA;
-
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				&target->thread.tm_dscr, 0, sizeof(u64));
-	return ret;
-}
-#endif	/* CONFIG_PPC_TRANSACTIONAL_MEM */
-
 #ifdef CONFIG_PPC64
 static int ppr_get(struct task_struct *target,
 		      const struct user_regset *regset,
@@ -1629,7 +737,7 @@ static const struct user_regset_view user_ppc_native_view = {
 
 #include <linux/compat.h>
 
-static int gpr32_get_common(struct task_struct *target,
+int gpr32_get_common(struct task_struct *target,
 		     const struct user_regset *regset,
 		     unsigned int pos, unsigned int count,
 			    void *kbuf, void __user *ubuf,
@@ -1676,7 +784,7 @@ static int gpr32_get_common(struct task_struct *target,
 					PT_REGS_COUNT * sizeof(reg), -1);
 }
 
-static int gpr32_set_common(struct task_struct *target,
+int gpr32_set_common(struct task_struct *target,
 		     const struct user_regset *regset,
 		     unsigned int pos, unsigned int count,
 		     const void *kbuf, const void __user *ubuf,
@@ -1744,26 +852,6 @@ static int gpr32_set_common(struct task_struct *target,
 					 (PT_TRAP + 1) * sizeof(reg), -1);
 }
 
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-static int tm_cgpr32_get(struct task_struct *target,
-		     const struct user_regset *regset,
-		     unsigned int pos, unsigned int count,
-		     void *kbuf, void __user *ubuf)
-{
-	return gpr32_get_common(target, regset, pos, count, kbuf, ubuf,
-			&target->thread.ckpt_regs.gpr[0]);
-}
-
-static int tm_cgpr32_set(struct task_struct *target,
-		     const struct user_regset *regset,
-		     unsigned int pos, unsigned int count,
-		     const void *kbuf, const void __user *ubuf)
-{
-	return gpr32_set_common(target, regset, pos, count, kbuf, ubuf,
-			&target->thread.ckpt_regs.gpr[0]);
-}
-#endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
-
 static int gpr32_get(struct task_struct *target,
 		     const struct user_regset *regset,
 		     unsigned int pos, unsigned int count,
-- 
2.25.0

