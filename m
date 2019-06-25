Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB78E54D6C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 13:20:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y3cB2kTbzDqPC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 21:20:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="AO18Vnzs"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y36h1SlvzDqGn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 20:58:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Y36Z2nzwz9v18S;
 Tue, 25 Jun 2019 12:58:14 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=AO18Vnzs; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lK8fB_Ifpgpe; Tue, 25 Jun 2019 12:58:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Y36Z1ZHNz9v17d;
 Tue, 25 Jun 2019 12:58:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561460294; bh=d5BQcZV6pvvIlcozLhGEcc0b1lVGAE5o/1wl038Stjs=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=AO18VnzsljDanusH9Ml8GNhN1/codQHJZJUFPSUy5ExzCroO1GjzL3ONqP5AU06kR
 rgM33+vMyrT1HazFhwW7h24Wr2Fiu8kGotkDyX7Np9qL8WScVW071gsAHjfYC/eIbg
 98g1HBxcfVwhkuo4xfH+UlmDyZ6+8+q3h51S+bEs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5FF428B87C;
 Tue, 25 Jun 2019 12:58:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id M1kPD8WMhfiQ; Tue, 25 Jun 2019 12:58:15 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D9678B874;
 Tue, 25 Jun 2019 12:58:13 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0FBB068E1B; Tue, 25 Jun 2019 10:58:13 +0000 (UTC)
Message-Id: <54491aab8c2c99efd9fc38de39d17e396ef0ce90.1561459984.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1561459983.git.christophe.leroy@c-s.fr>
References: <cover.1561459983.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v1 07/13] powerpc/ptrace: split out TRANSACTIONAL_MEM
 related functions.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Tue, 25 Jun 2019 10:58:13 +0000 (UTC)
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
 arch/powerpc/kernel/ptrace/Makefile      |   1 +
 arch/powerpc/kernel/ptrace/ptrace-decl.h |  63 +++
 arch/powerpc/kernel/ptrace/ptrace-tm.c   | 877 ++++++++++++++++++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace.c      | 900 -------------------------------
 4 files changed, 941 insertions(+), 900 deletions(-)
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
index 8aee353a1208..7cde082f1e60 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -1,5 +1,14 @@
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
 /* ptrace-(no)vsx */
 
 int fpr_get(struct task_struct *target, const struct user_regset *regset,
@@ -34,3 +43,57 @@ int evr_get(struct task_struct *target, const struct user_regset *regset,
 int evr_set(struct task_struct *target, const struct user_regset *regset,
 	    unsigned int pos, unsigned int count,
 	    const void *kbuf, const void __user *ubuf);
+
+/* ptrace-tm */
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
index 000000000000..a018dd569e54
--- /dev/null
+++ b/arch/powerpc/kernel/ptrace/ptrace-tm.c
@@ -0,0 +1,877 @@
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
+static void flush_tmregs_to_thread(struct task_struct *tsk)
+{
+	/*
+	 * If task is not current, it will have been flushed already to
+	 * it's thread_struct during __switch_to().
+	 *
+	 * A reclaim flushes ALL the state or if not in TM save TM SPRs
+	 * in the appropriate thread structures from live.
+	 */
+
+	if ((!cpu_has_feature(CPU_FTR_TM)) || (tsk != current))
+		return;
+
+	if (MSR_TM_SUSPENDED(mfmsr())) {
+		tm_reclaim_current(TM_CAUSE_SIGNAL);
+	} else {
+		tm_enable();
+		tm_save_sprs(&(tsk->thread));
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
+		ret = user_regset_copyin_ignore(
+			&pos, &count, &kbuf, &ubuf,
+			(PT_MAX_PUT_REG + 1) * sizeof(reg),
+			PT_TRAP * sizeof(reg));
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
+		ret = user_regset_copyin_ignore(
+			&pos, &count, &kbuf, &ubuf,
+			(PT_TRAP + 1) * sizeof(reg), -1);
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
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+					&target->thread.ckvr_state, 0,
+					33 * sizeof(vector128));
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
+						33 * sizeof(vector128), -1);
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
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+					&target->thread.ckvr_state, 0,
+					33 * sizeof(vector128));
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
+						33 * sizeof(vector128), -1);
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
+				&target->thread.tm_tfhar, 0, sizeof(u64));
+
+	/* TEXASR register */
+	if (!ret)
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				&target->thread.tm_texasr, sizeof(u64),
+				2 * sizeof(u64));
+
+	/* TFIAR register */
+	if (!ret)
+		ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				&target->thread.tm_tfiar,
+				2 * sizeof(u64), 3 * sizeof(u64));
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
+				&target->thread.tm_tfhar, 0, sizeof(u64));
+
+	/* TEXASR register */
+	if (!ret)
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				&target->thread.tm_texasr, sizeof(u64),
+				2 * sizeof(u64));
+
+	/* TFIAR register */
+	if (!ret)
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				&target->thread.tm_tfiar,
+				 2 * sizeof(u64), 3 * sizeof(u64));
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
+				&target->thread.tm_tar, 0, sizeof(u64));
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
+				&target->thread.tm_tar, 0, sizeof(u64));
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
+				&target->thread.tm_ppr, 0, sizeof(u64));
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
+				&target->thread.tm_ppr, 0, sizeof(u64));
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
+				&target->thread.tm_dscr, 0, sizeof(u64));
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
+				&target->thread.tm_dscr, 0, sizeof(u64));
+	return ret;
+}
+
+int tm_cgpr32_get(struct task_struct *target, const struct user_regset *regset,
+		  unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
+{
+	return gpr32_get_common(target, regset, pos, count, kbuf, ubuf,
+			&target->thread.ckpt_regs.gpr[0]);
+}
+
+int tm_cgpr32_set(struct task_struct *target, const struct user_regset *regset,
+		  unsigned int pos, unsigned int count,
+		  const void *kbuf, const void __user *ubuf)
+{
+	return gpr32_set_common(target, regset, pos, count, kbuf, ubuf,
+			&target->thread.ckpt_regs.gpr[0]);
+}
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 8bea896c841d..994b642556a6 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -113,31 +113,6 @@ static const struct pt_regs_offset regoffset_table[] = {
 	REG_OFFSET_END,
 };
 
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-static void flush_tmregs_to_thread(struct task_struct *tsk)
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
-#else
-static inline void flush_tmregs_to_thread(struct task_struct *tsk) { }
-#endif
-
 /**
  * regs_query_register_offset() - query register offset from its name
  * @name:	the name of a register
@@ -176,15 +151,6 @@ const char *regs_query_register_name(unsigned int offset)
  */
 
 /*
- * Set of msr bits that gdb can change on behalf of a process.
- */
-#ifdef CONFIG_PPC_ADV_DEBUG_REGS
-#define MSR_DEBUGCHANGE	0
-#else
-#define MSR_DEBUGCHANGE	(MSR_SE | MSR_BE)
-#endif
-
-/*
  * Max register writeable via put_reg
  */
 #ifdef CONFIG_PPC32
@@ -205,26 +171,6 @@ static int set_user_msr(struct task_struct *task, unsigned long msr)
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
@@ -417,832 +363,6 @@ static int gpr_set(struct task_struct *target, const struct user_regset *regset,
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
@@ -1758,26 +878,6 @@ static int gpr32_set_common(struct task_struct *target,
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
2.13.3

