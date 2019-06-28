Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 183295A01F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 18:00:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45b1hD42sSzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 02:00:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="BKH1A595"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45b1Pb3wWzzDqsy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 01:48:03 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45b1PT4Zz6zB09ZY;
 Fri, 28 Jun 2019 17:47:57 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=BKH1A595; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id JHtY6REnaY0G; Fri, 28 Jun 2019 17:47:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45b1PT3PYxzB09ZV;
 Fri, 28 Jun 2019 17:47:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561736877; bh=vhcfeQ2TRp+kb0aaGLxM2jViwb6HbTmwEXA8IXn2Jec=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=BKH1A595y0LSqFrh5/x+BALQwqIx4QtgQmx4JY7O/nrG6Qby1ADAHA5JVaXH/KHaw
 pQQM+7jOUVaFCtduH48uvsei8CEh9JsUyxa9Dk5B+qxVoSY4UCvCHi7J36VWQYGV9N
 tnlwH5hvUXLOx5YlJcnHKaEa12lEUXCyGwBQTssM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D4F38B975;
 Fri, 28 Jun 2019 17:47:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sNbtiX-lbgld; Fri, 28 Jun 2019 17:47:58 +0200 (CEST)
Received: from localhost.localdomain (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2C00B8B955;
 Fri, 28 Jun 2019 17:47:57 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id DBDBB68DBC; Fri, 28 Jun 2019 15:47:57 +0000 (UTC)
Message-Id: <4bf656bd714da656fe2c6d0a5fb99388998464a4.1561735588.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1561735587.git.christophe.leroy@c-s.fr>
References: <cover.1561735587.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 08/12] powerpc/ptrace: move register viewing functions
 out of ptrace.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Fri, 28 Jun 2019 15:47:57 +0000 (UTC)
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

Create a dedicated ptrace-view.c file.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/ptrace/Makefile      |   4 +-
 arch/powerpc/kernel/ptrace/ptrace-decl.h |  43 ++
 arch/powerpc/kernel/ptrace/ptrace-view.c | 953 ++++++++++++++++++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace.c      | 960 -------------------------------
 4 files changed, 998 insertions(+), 962 deletions(-)
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-view.c

diff --git a/arch/powerpc/kernel/ptrace/Makefile b/arch/powerpc/kernel/ptrace/Makefile
index 2d7f5f301536..7addc5994bb9 100644
--- a/arch/powerpc/kernel/ptrace/Makefile
+++ b/arch/powerpc/kernel/ptrace/Makefile
@@ -3,9 +3,9 @@
 # Makefile for the linux kernel.
 #
 
-CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
+CFLAGS_ptrace-view.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
 
-obj-y				+= ptrace.o
+obj-y				+= ptrace.o ptrace-view.o
 obj-$(CONFIG_PPC64)		+= ptrace32.o
 obj-$(CONFIG_VSX)		+= ptrace-vsx.o
 ifneq ($(CONFIG_VSX),y)
diff --git a/arch/powerpc/kernel/ptrace/ptrace-decl.h b/arch/powerpc/kernel/ptrace/ptrace-decl.h
index 8d076818f1de..e12f6615fc1d 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -22,6 +22,45 @@
 #define TFSO(f)	(offsetof(struct thread_fp_state, f))
 #define TSO(f)	(offsetof(struct thread_struct, f))
 
+/*
+ * These are our native regset flavors.
+ */
+enum powerpc_regset {
+	REGSET_GPR,
+	REGSET_FPR,
+#ifdef CONFIG_ALTIVEC
+	REGSET_VMX,
+#endif
+#ifdef CONFIG_VSX
+	REGSET_VSX,
+#endif
+#ifdef CONFIG_SPE
+	REGSET_SPE,
+#endif
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	REGSET_TM_CGPR,		/* TM checkpointed GPR registers */
+	REGSET_TM_CFPR,		/* TM checkpointed FPR registers */
+	REGSET_TM_CVMX,		/* TM checkpointed VMX registers */
+	REGSET_TM_CVSX,		/* TM checkpointed VSX registers */
+	REGSET_TM_SPR,		/* TM specific SPR registers */
+	REGSET_TM_CTAR,		/* TM checkpointed TAR register */
+	REGSET_TM_CPPR,		/* TM checkpointed PPR register */
+	REGSET_TM_CDSCR,	/* TM checkpointed DSCR register */
+#endif
+#ifdef CONFIG_PPC64
+	REGSET_PPR,		/* PPR register */
+	REGSET_DSCR,		/* DSCR register */
+#endif
+#ifdef CONFIG_PPC_BOOK3S_64
+	REGSET_TAR,		/* TAR register */
+	REGSET_EBB,		/* EBB registers */
+	REGSET_PMR,		/* Performance Monitor Registers */
+#endif
+#ifdef CONFIG_PPC_MEM_KEYS
+	REGSET_PKEY,		/* AMR register */
+#endif
+};
+
 /* ptrace-(no)vsx */
 
 int fpr_get(struct task_struct *target, const struct user_regset *regset,
@@ -131,3 +170,7 @@ int tm_cgpr32_get(struct task_struct *target, const struct user_regset *regset,
 int tm_cgpr32_set(struct task_struct *target, const struct user_regset *regset,
 		  unsigned int pos, unsigned int count,
 		  const void *kbuf, const void __user *ubuf);
+
+/* ptrace-view */
+
+extern const struct user_regset_view user_ppc_native_view;
diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
new file mode 100644
index 000000000000..d24050e503da
--- /dev/null
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -0,0 +1,953 @@
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
+struct pt_regs_offset {
+	const char *name;
+	int offset;
+};
+
+#define STR(s)	#s			/* convert to string */
+#define REG_OFFSET_NAME(r) {.name = #r, .offset = offsetof(struct pt_regs, r)}
+#define GPR_OFFSET_NAME(num)	\
+	{.name = STR(r##num), .offset = offsetof(struct pt_regs, gpr[num])}, \
+	{.name = STR(gpr##num), .offset = offsetof(struct pt_regs, gpr[num])}
+#define REG_OFFSET_END {.name = NULL, .offset = 0}
+
+static const struct pt_regs_offset regoffset_table[] = {
+	GPR_OFFSET_NAME(0),
+	GPR_OFFSET_NAME(1),
+	GPR_OFFSET_NAME(2),
+	GPR_OFFSET_NAME(3),
+	GPR_OFFSET_NAME(4),
+	GPR_OFFSET_NAME(5),
+	GPR_OFFSET_NAME(6),
+	GPR_OFFSET_NAME(7),
+	GPR_OFFSET_NAME(8),
+	GPR_OFFSET_NAME(9),
+	GPR_OFFSET_NAME(10),
+	GPR_OFFSET_NAME(11),
+	GPR_OFFSET_NAME(12),
+	GPR_OFFSET_NAME(13),
+	GPR_OFFSET_NAME(14),
+	GPR_OFFSET_NAME(15),
+	GPR_OFFSET_NAME(16),
+	GPR_OFFSET_NAME(17),
+	GPR_OFFSET_NAME(18),
+	GPR_OFFSET_NAME(19),
+	GPR_OFFSET_NAME(20),
+	GPR_OFFSET_NAME(21),
+	GPR_OFFSET_NAME(22),
+	GPR_OFFSET_NAME(23),
+	GPR_OFFSET_NAME(24),
+	GPR_OFFSET_NAME(25),
+	GPR_OFFSET_NAME(26),
+	GPR_OFFSET_NAME(27),
+	GPR_OFFSET_NAME(28),
+	GPR_OFFSET_NAME(29),
+	GPR_OFFSET_NAME(30),
+	GPR_OFFSET_NAME(31),
+	REG_OFFSET_NAME(nip),
+	REG_OFFSET_NAME(msr),
+	REG_OFFSET_NAME(ctr),
+	REG_OFFSET_NAME(link),
+	REG_OFFSET_NAME(xer),
+	REG_OFFSET_NAME(ccr),
+	REG_OFFSET_NAME(softe),
+	REG_OFFSET_NAME(mq),
+	REG_OFFSET_NAME(trap),
+	REG_OFFSET_NAME(dar),
+	REG_OFFSET_NAME(dsisr),
+	REG_OFFSET_END,
+};
+
+/**
+ * regs_query_register_offset() - query register offset from its name
+ * @name:	the name of a register
+ *
+ * regs_query_register_offset() returns the offset of a register in struct
+ * pt_regs from its name. If the name is invalid, this returns -EINVAL;
+ */
+int regs_query_register_offset(const char *name)
+{
+	const struct pt_regs_offset *roff;
+	for (roff = regoffset_table; roff->name != NULL; roff++)
+		if (!strcmp(roff->name, name))
+			return roff->offset;
+	return -EINVAL;
+}
+
+/**
+ * regs_query_register_name() - query register name from its offset
+ * @offset:	the offset of a register in struct pt_regs.
+ *
+ * regs_query_register_name() returns the name of a register from its
+ * offset in struct pt_regs. If the @offset is invalid, this returns NULL;
+ */
+const char *regs_query_register_name(unsigned int offset)
+{
+	const struct pt_regs_offset *roff;
+	for (roff = regoffset_table; roff->name != NULL; roff++)
+		if (roff->offset == offset)
+			return roff->name;
+	return NULL;
+}
+
+/*
+ * does not yet catch signals sent when the child dies.
+ * in exit.c or in signal.c.
+ */
+
+static unsigned long get_user_msr(struct task_struct *task)
+{
+	return task->thread.regs->msr | task->thread.fpexc_mode;
+}
+
+static int set_user_msr(struct task_struct *task, unsigned long msr)
+{
+	task->thread.regs->msr &= ~MSR_DEBUGCHANGE;
+	task->thread.regs->msr |= msr & MSR_DEBUGCHANGE;
+	return 0;
+}
+
+#ifdef CONFIG_PPC64
+static int get_user_dscr(struct task_struct *task, unsigned long *data)
+{
+	*data = task->thread.dscr;
+	return 0;
+}
+
+static int set_user_dscr(struct task_struct *task, unsigned long dscr)
+{
+	task->thread.dscr = dscr;
+	task->thread.dscr_inherit = 1;
+	return 0;
+}
+#else
+static int get_user_dscr(struct task_struct *task, unsigned long *data)
+{
+	return -EIO;
+}
+
+static int set_user_dscr(struct task_struct *task, unsigned long dscr)
+{
+	return -EIO;
+}
+#endif
+
+/*
+ * We prevent mucking around with the reserved area of trap
+ * which are used internally by the kernel.
+ */
+static int set_user_trap(struct task_struct *task, unsigned long trap)
+{
+	task->thread.regs->trap = trap & 0xfff0;
+	return 0;
+}
+
+/*
+ * Get contents of register REGNO in task TASK.
+ */
+int ptrace_get_reg(struct task_struct *task, int regno, unsigned long *data)
+{
+	unsigned int regs_max;
+
+	if ((task->thread.regs == NULL) || !data)
+		return -EIO;
+
+	if (regno == PT_MSR) {
+		*data = get_user_msr(task);
+		return 0;
+	}
+
+	if (regno == PT_DSCR)
+		return get_user_dscr(task, data);
+
+	/*
+	 * softe copies paca->irq_soft_mask variable state. Since irq_soft_mask is
+	 * no more used as a flag, lets force usr to alway see the softe value as 1
+	 * which means interrupts are not soft disabled.
+	 */
+	if (IS_ENABLED(CONFIG_PPC64) && regno == PT_SOFTE) {
+		*data = 1;
+		return  0;
+	}
+
+	regs_max = sizeof(struct user_pt_regs) / sizeof(unsigned long);
+	if (regno < regs_max) {
+		regno = array_index_nospec(regno, regs_max);
+		*data = ((unsigned long *)task->thread.regs)[regno];
+		return 0;
+	}
+
+	return -EIO;
+}
+
+/*
+ * Write contents of register REGNO in task TASK.
+ */
+int ptrace_put_reg(struct task_struct *task, int regno, unsigned long data)
+{
+	if (task->thread.regs == NULL)
+		return -EIO;
+
+	if (regno == PT_MSR)
+		return set_user_msr(task, data);
+	if (regno == PT_TRAP)
+		return set_user_trap(task, data);
+	if (regno == PT_DSCR)
+		return set_user_dscr(task, data);
+
+	if (regno <= PT_MAX_PUT_REG) {
+		regno = array_index_nospec(regno, PT_MAX_PUT_REG + 1);
+		((unsigned long *)task->thread.regs)[regno] = data;
+		return 0;
+	}
+	return -EIO;
+}
+
+static int gpr_get(struct task_struct *target, const struct user_regset *regset,
+		   unsigned int pos, unsigned int count,
+		   void *kbuf, void __user *ubuf)
+{
+	int i, ret;
+
+	if (target->thread.regs == NULL)
+		return -EIO;
+
+	if (!FULL_REGS(target->thread.regs)) {
+		/* We have a partial register set.  Fill 14-31 with bogus values */
+		for (i = 14; i < 32; i++)
+			target->thread.regs->gpr[i] = NV_REG_POISON;
+	}
+
+	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				  target->thread.regs,
+				  0, offsetof(struct pt_regs, msr));
+	if (!ret) {
+		unsigned long msr = get_user_msr(target);
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
+					  &target->thread.regs->orig_gpr3,
+					  offsetof(struct pt_regs, orig_gpr3),
+					  sizeof(struct user_pt_regs));
+	if (!ret)
+		ret = user_regset_copyout_zero(&pos, &count, &kbuf, &ubuf,
+					       sizeof(struct user_pt_regs), -1);
+
+	return ret;
+}
+
+static int gpr_set(struct task_struct *target, const struct user_regset *regset,
+		   unsigned int pos, unsigned int count,
+		   const void *kbuf, const void __user *ubuf)
+{
+	unsigned long reg;
+	int ret;
+
+	if (target->thread.regs == NULL)
+		return -EIO;
+
+	CHECK_FULL_REGS(target->thread.regs);
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				 target->thread.regs,
+				 0, PT_MSR * sizeof(reg));
+
+	if (!ret && count > 0) {
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &reg,
+					 PT_MSR * sizeof(reg),
+					 (PT_MSR + 1) * sizeof(reg));
+		if (!ret)
+			ret = set_user_msr(target, reg);
+	}
+
+	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
+		     offsetof(struct pt_regs, msr) + sizeof(long));
+
+	if (!ret)
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+					 &target->thread.regs->orig_gpr3,
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
+			ret = set_user_trap(target, reg);
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
+#ifdef CONFIG_PPC64
+static int ppr_get(struct task_struct *target,
+		      const struct user_regset *regset,
+		      unsigned int pos, unsigned int count,
+		      void *kbuf, void __user *ubuf)
+{
+	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				   &target->thread.regs->ppr, 0, sizeof(u64));
+}
+
+static int ppr_set(struct task_struct *target,
+		      const struct user_regset *regset,
+		      unsigned int pos, unsigned int count,
+		      const void *kbuf, const void __user *ubuf)
+{
+	return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				  &target->thread.regs->ppr, 0, sizeof(u64));
+}
+
+static int dscr_get(struct task_struct *target,
+		      const struct user_regset *regset,
+		      unsigned int pos, unsigned int count,
+		      void *kbuf, void __user *ubuf)
+{
+	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				   &target->thread.dscr, 0, sizeof(u64));
+}
+static int dscr_set(struct task_struct *target,
+		      const struct user_regset *regset,
+		      unsigned int pos, unsigned int count,
+		      const void *kbuf, const void __user *ubuf)
+{
+	return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				  &target->thread.dscr, 0, sizeof(u64));
+}
+#endif
+#ifdef CONFIG_PPC_BOOK3S_64
+static int tar_get(struct task_struct *target,
+		      const struct user_regset *regset,
+		      unsigned int pos, unsigned int count,
+		      void *kbuf, void __user *ubuf)
+{
+	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				   &target->thread.tar, 0, sizeof(u64));
+}
+static int tar_set(struct task_struct *target,
+		      const struct user_regset *regset,
+		      unsigned int pos, unsigned int count,
+		      const void *kbuf, const void __user *ubuf)
+{
+	return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				  &target->thread.tar, 0, sizeof(u64));
+}
+
+static int ebb_active(struct task_struct *target,
+			 const struct user_regset *regset)
+{
+	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
+		return -ENODEV;
+
+	if (target->thread.used_ebb)
+		return regset->n;
+
+	return 0;
+}
+
+static int ebb_get(struct task_struct *target,
+		      const struct user_regset *regset,
+		      unsigned int pos, unsigned int count,
+		      void *kbuf, void __user *ubuf)
+{
+	/* Build tests */
+	BUILD_BUG_ON(TSO(ebbrr) + sizeof(unsigned long) != TSO(ebbhr));
+	BUILD_BUG_ON(TSO(ebbhr) + sizeof(unsigned long) != TSO(bescr));
+
+	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
+		return -ENODEV;
+
+	if (!target->thread.used_ebb)
+		return -ENODATA;
+
+	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+			&target->thread.ebbrr, 0, 3 * sizeof(unsigned long));
+}
+
+static int ebb_set(struct task_struct *target,
+		      const struct user_regset *regset,
+		      unsigned int pos, unsigned int count,
+		      const void *kbuf, const void __user *ubuf)
+{
+	int ret = 0;
+
+	/* Build tests */
+	BUILD_BUG_ON(TSO(ebbrr) + sizeof(unsigned long) != TSO(ebbhr));
+	BUILD_BUG_ON(TSO(ebbhr) + sizeof(unsigned long) != TSO(bescr));
+
+	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
+		return -ENODEV;
+
+	if (target->thread.used_ebb)
+		return -ENODATA;
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+			&target->thread.ebbrr, 0, sizeof(unsigned long));
+
+	if (!ret)
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+			&target->thread.ebbhr, sizeof(unsigned long),
+			2 * sizeof(unsigned long));
+
+	if (!ret)
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+			&target->thread.bescr,
+			2 * sizeof(unsigned long), 3 * sizeof(unsigned long));
+
+	return ret;
+}
+static int pmu_active(struct task_struct *target,
+			 const struct user_regset *regset)
+{
+	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
+		return -ENODEV;
+
+	return regset->n;
+}
+
+static int pmu_get(struct task_struct *target,
+		      const struct user_regset *regset,
+		      unsigned int pos, unsigned int count,
+		      void *kbuf, void __user *ubuf)
+{
+	/* Build tests */
+	BUILD_BUG_ON(TSO(siar) + sizeof(unsigned long) != TSO(sdar));
+	BUILD_BUG_ON(TSO(sdar) + sizeof(unsigned long) != TSO(sier));
+	BUILD_BUG_ON(TSO(sier) + sizeof(unsigned long) != TSO(mmcr2));
+	BUILD_BUG_ON(TSO(mmcr2) + sizeof(unsigned long) != TSO(mmcr0));
+
+	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
+		return -ENODEV;
+
+	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+			&target->thread.siar, 0,
+			5 * sizeof(unsigned long));
+}
+
+static int pmu_set(struct task_struct *target,
+		      const struct user_regset *regset,
+		      unsigned int pos, unsigned int count,
+		      const void *kbuf, const void __user *ubuf)
+{
+	int ret = 0;
+
+	/* Build tests */
+	BUILD_BUG_ON(TSO(siar) + sizeof(unsigned long) != TSO(sdar));
+	BUILD_BUG_ON(TSO(sdar) + sizeof(unsigned long) != TSO(sier));
+	BUILD_BUG_ON(TSO(sier) + sizeof(unsigned long) != TSO(mmcr2));
+	BUILD_BUG_ON(TSO(mmcr2) + sizeof(unsigned long) != TSO(mmcr0));
+
+	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
+		return -ENODEV;
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+			&target->thread.siar, 0,
+			sizeof(unsigned long));
+
+	if (!ret)
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+			&target->thread.sdar, sizeof(unsigned long),
+			2 * sizeof(unsigned long));
+
+	if (!ret)
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+			&target->thread.sier, 2 * sizeof(unsigned long),
+			3 * sizeof(unsigned long));
+
+	if (!ret)
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+			&target->thread.mmcr2, 3 * sizeof(unsigned long),
+			4 * sizeof(unsigned long));
+
+	if (!ret)
+		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+			&target->thread.mmcr0, 4 * sizeof(unsigned long),
+			5 * sizeof(unsigned long));
+	return ret;
+}
+#endif
+
+#ifdef CONFIG_PPC_MEM_KEYS
+static int pkey_active(struct task_struct *target,
+		       const struct user_regset *regset)
+{
+	if (!arch_pkeys_enabled())
+		return -ENODEV;
+
+	return regset->n;
+}
+
+static int pkey_get(struct task_struct *target,
+		    const struct user_regset *regset,
+		    unsigned int pos, unsigned int count,
+		    void *kbuf, void __user *ubuf)
+{
+	BUILD_BUG_ON(TSO(amr) + sizeof(unsigned long) != TSO(iamr));
+	BUILD_BUG_ON(TSO(iamr) + sizeof(unsigned long) != TSO(uamor));
+
+	if (!arch_pkeys_enabled())
+		return -ENODEV;
+
+	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
+				   &target->thread.amr, 0,
+				   ELF_NPKEY * sizeof(unsigned long));
+}
+
+static int pkey_set(struct task_struct *target,
+		      const struct user_regset *regset,
+		      unsigned int pos, unsigned int count,
+		      const void *kbuf, const void __user *ubuf)
+{
+	u64 new_amr;
+	int ret;
+
+	if (!arch_pkeys_enabled())
+		return -ENODEV;
+
+	/* Only the AMR can be set from userspace */
+	if (pos != 0 || count != sizeof(new_amr))
+		return -EINVAL;
+
+	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+				 &new_amr, 0, sizeof(new_amr));
+	if (ret)
+		return ret;
+
+	/* UAMOR determines which bits of the AMR can be set from userspace. */
+	target->thread.amr = (new_amr & target->thread.uamor) |
+		(target->thread.amr & ~target->thread.uamor);
+
+	return 0;
+}
+#endif /* CONFIG_PPC_MEM_KEYS */
+
+static const struct user_regset native_regsets[] = {
+	[REGSET_GPR] = {
+		.core_note_type = NT_PRSTATUS, .n = ELF_NGREG,
+		.size = sizeof(long), .align = sizeof(long),
+		.get = gpr_get, .set = gpr_set
+	},
+	[REGSET_FPR] = {
+		.core_note_type = NT_PRFPREG, .n = ELF_NFPREG,
+		.size = sizeof(double), .align = sizeof(double),
+		.get = fpr_get, .set = fpr_set
+	},
+#ifdef CONFIG_ALTIVEC
+	[REGSET_VMX] = {
+		.core_note_type = NT_PPC_VMX, .n = 34,
+		.size = sizeof(vector128), .align = sizeof(vector128),
+		.active = vr_active, .get = vr_get, .set = vr_set
+	},
+#endif
+#ifdef CONFIG_VSX
+	[REGSET_VSX] = {
+		.core_note_type = NT_PPC_VSX, .n = 32,
+		.size = sizeof(double), .align = sizeof(double),
+		.active = vsr_active, .get = vsr_get, .set = vsr_set
+	},
+#endif
+#ifdef CONFIG_SPE
+	[REGSET_SPE] = {
+		.core_note_type = NT_PPC_SPE, .n = 35,
+		.size = sizeof(u32), .align = sizeof(u32),
+		.active = evr_active, .get = evr_get, .set = evr_set
+	},
+#endif
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	[REGSET_TM_CGPR] = {
+		.core_note_type = NT_PPC_TM_CGPR, .n = ELF_NGREG,
+		.size = sizeof(long), .align = sizeof(long),
+		.active = tm_cgpr_active, .get = tm_cgpr_get, .set = tm_cgpr_set
+	},
+	[REGSET_TM_CFPR] = {
+		.core_note_type = NT_PPC_TM_CFPR, .n = ELF_NFPREG,
+		.size = sizeof(double), .align = sizeof(double),
+		.active = tm_cfpr_active, .get = tm_cfpr_get, .set = tm_cfpr_set
+	},
+	[REGSET_TM_CVMX] = {
+		.core_note_type = NT_PPC_TM_CVMX, .n = ELF_NVMX,
+		.size = sizeof(vector128), .align = sizeof(vector128),
+		.active = tm_cvmx_active, .get = tm_cvmx_get, .set = tm_cvmx_set
+	},
+	[REGSET_TM_CVSX] = {
+		.core_note_type = NT_PPC_TM_CVSX, .n = ELF_NVSX,
+		.size = sizeof(double), .align = sizeof(double),
+		.active = tm_cvsx_active, .get = tm_cvsx_get, .set = tm_cvsx_set
+	},
+	[REGSET_TM_SPR] = {
+		.core_note_type = NT_PPC_TM_SPR, .n = ELF_NTMSPRREG,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.active = tm_spr_active, .get = tm_spr_get, .set = tm_spr_set
+	},
+	[REGSET_TM_CTAR] = {
+		.core_note_type = NT_PPC_TM_CTAR, .n = 1,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.active = tm_tar_active, .get = tm_tar_get, .set = tm_tar_set
+	},
+	[REGSET_TM_CPPR] = {
+		.core_note_type = NT_PPC_TM_CPPR, .n = 1,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.active = tm_ppr_active, .get = tm_ppr_get, .set = tm_ppr_set
+	},
+	[REGSET_TM_CDSCR] = {
+		.core_note_type = NT_PPC_TM_CDSCR, .n = 1,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.active = tm_dscr_active, .get = tm_dscr_get, .set = tm_dscr_set
+	},
+#endif
+#ifdef CONFIG_PPC64
+	[REGSET_PPR] = {
+		.core_note_type = NT_PPC_PPR, .n = 1,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.get = ppr_get, .set = ppr_set
+	},
+	[REGSET_DSCR] = {
+		.core_note_type = NT_PPC_DSCR, .n = 1,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.get = dscr_get, .set = dscr_set
+	},
+#endif
+#ifdef CONFIG_PPC_BOOK3S_64
+	[REGSET_TAR] = {
+		.core_note_type = NT_PPC_TAR, .n = 1,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.get = tar_get, .set = tar_set
+	},
+	[REGSET_EBB] = {
+		.core_note_type = NT_PPC_EBB, .n = ELF_NEBB,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.active = ebb_active, .get = ebb_get, .set = ebb_set
+	},
+	[REGSET_PMR] = {
+		.core_note_type = NT_PPC_PMU, .n = ELF_NPMU,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.active = pmu_active, .get = pmu_get, .set = pmu_set
+	},
+#endif
+#ifdef CONFIG_PPC_MEM_KEYS
+	[REGSET_PKEY] = {
+		.core_note_type = NT_PPC_PKEY, .n = ELF_NPKEY,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.active = pkey_active, .get = pkey_get, .set = pkey_set
+	},
+#endif
+};
+
+const struct user_regset_view user_ppc_native_view = {
+	.name = UTS_MACHINE, .e_machine = ELF_ARCH, .ei_osabi = ELF_OSABI,
+	.regsets = native_regsets, .n = ARRAY_SIZE(native_regsets)
+};
+
+#include <linux/compat.h>
+
+int gpr32_get_common(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+			    void *kbuf, void __user *ubuf,
+			    unsigned long *regs)
+{
+	compat_ulong_t *k = kbuf;
+	compat_ulong_t __user *u = ubuf;
+	compat_ulong_t reg;
+
+	pos /= sizeof(reg);
+	count /= sizeof(reg);
+
+	if (kbuf)
+		for (; count > 0 && pos < PT_MSR; --count)
+			*k++ = regs[pos++];
+	else
+		for (; count > 0 && pos < PT_MSR; --count)
+			if (__put_user((compat_ulong_t) regs[pos++], u++))
+				return -EFAULT;
+
+	if (count > 0 && pos == PT_MSR) {
+		reg = get_user_msr(target);
+		if (kbuf)
+			*k++ = reg;
+		else if (__put_user(reg, u++))
+			return -EFAULT;
+		++pos;
+		--count;
+	}
+
+	if (kbuf)
+		for (; count > 0 && pos < PT_REGS_COUNT; --count)
+			*k++ = regs[pos++];
+	else
+		for (; count > 0 && pos < PT_REGS_COUNT; --count)
+			if (__put_user((compat_ulong_t) regs[pos++], u++))
+				return -EFAULT;
+
+	kbuf = k;
+	ubuf = u;
+	pos *= sizeof(reg);
+	count *= sizeof(reg);
+	return user_regset_copyout_zero(&pos, &count, &kbuf, &ubuf,
+					PT_REGS_COUNT * sizeof(reg), -1);
+}
+
+int gpr32_set_common(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+		     const void *kbuf, const void __user *ubuf,
+		     unsigned long *regs)
+{
+	const compat_ulong_t *k = kbuf;
+	const compat_ulong_t __user *u = ubuf;
+	compat_ulong_t reg;
+
+	pos /= sizeof(reg);
+	count /= sizeof(reg);
+
+	if (kbuf)
+		for (; count > 0 && pos < PT_MSR; --count)
+			regs[pos++] = *k++;
+	else
+		for (; count > 0 && pos < PT_MSR; --count) {
+			if (__get_user(reg, u++))
+				return -EFAULT;
+			regs[pos++] = reg;
+		}
+
+
+	if (count > 0 && pos == PT_MSR) {
+		if (kbuf)
+			reg = *k++;
+		else if (__get_user(reg, u++))
+			return -EFAULT;
+		set_user_msr(target, reg);
+		++pos;
+		--count;
+	}
+
+	if (kbuf) {
+		for (; count > 0 && pos <= PT_MAX_PUT_REG; --count)
+			regs[pos++] = *k++;
+		for (; count > 0 && pos < PT_TRAP; --count, ++pos)
+			++k;
+	} else {
+		for (; count > 0 && pos <= PT_MAX_PUT_REG; --count) {
+			if (__get_user(reg, u++))
+				return -EFAULT;
+			regs[pos++] = reg;
+		}
+		for (; count > 0 && pos < PT_TRAP; --count, ++pos)
+			if (__get_user(reg, u++))
+				return -EFAULT;
+	}
+
+	if (count > 0 && pos == PT_TRAP) {
+		if (kbuf)
+			reg = *k++;
+		else if (__get_user(reg, u++))
+			return -EFAULT;
+		set_user_trap(target, reg);
+		++pos;
+		--count;
+	}
+
+	kbuf = k;
+	ubuf = u;
+	pos *= sizeof(reg);
+	count *= sizeof(reg);
+	return user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
+					 (PT_TRAP + 1) * sizeof(reg), -1);
+}
+
+static int gpr32_get(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+		     void *kbuf, void __user *ubuf)
+{
+	int i;
+
+	if (target->thread.regs == NULL)
+		return -EIO;
+
+	if (!FULL_REGS(target->thread.regs)) {
+		/*
+		 * We have a partial register set.
+		 * Fill 14-31 with bogus values.
+		 */
+		for (i = 14; i < 32; i++)
+			target->thread.regs->gpr[i] = NV_REG_POISON;
+	}
+	return gpr32_get_common(target, regset, pos, count, kbuf, ubuf,
+			&target->thread.regs->gpr[0]);
+}
+
+static int gpr32_set(struct task_struct *target,
+		     const struct user_regset *regset,
+		     unsigned int pos, unsigned int count,
+		     const void *kbuf, const void __user *ubuf)
+{
+	if (target->thread.regs == NULL)
+		return -EIO;
+
+	CHECK_FULL_REGS(target->thread.regs);
+	return gpr32_set_common(target, regset, pos, count, kbuf, ubuf,
+			&target->thread.regs->gpr[0]);
+}
+
+/*
+ * These are the regset flavors matching the CONFIG_PPC32 native set.
+ */
+static const struct user_regset compat_regsets[] = {
+	[REGSET_GPR] = {
+		.core_note_type = NT_PRSTATUS, .n = ELF_NGREG,
+		.size = sizeof(compat_long_t), .align = sizeof(compat_long_t),
+		.get = gpr32_get, .set = gpr32_set
+	},
+	[REGSET_FPR] = {
+		.core_note_type = NT_PRFPREG, .n = ELF_NFPREG,
+		.size = sizeof(double), .align = sizeof(double),
+		.get = fpr_get, .set = fpr_set
+	},
+#ifdef CONFIG_ALTIVEC
+	[REGSET_VMX] = {
+		.core_note_type = NT_PPC_VMX, .n = 34,
+		.size = sizeof(vector128), .align = sizeof(vector128),
+		.active = vr_active, .get = vr_get, .set = vr_set
+	},
+#endif
+#ifdef CONFIG_SPE
+	[REGSET_SPE] = {
+		.core_note_type = NT_PPC_SPE, .n = 35,
+		.size = sizeof(u32), .align = sizeof(u32),
+		.active = evr_active, .get = evr_get, .set = evr_set
+	},
+#endif
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	[REGSET_TM_CGPR] = {
+		.core_note_type = NT_PPC_TM_CGPR, .n = ELF_NGREG,
+		.size = sizeof(long), .align = sizeof(long),
+		.active = tm_cgpr_active,
+		.get = tm_cgpr32_get, .set = tm_cgpr32_set
+	},
+	[REGSET_TM_CFPR] = {
+		.core_note_type = NT_PPC_TM_CFPR, .n = ELF_NFPREG,
+		.size = sizeof(double), .align = sizeof(double),
+		.active = tm_cfpr_active, .get = tm_cfpr_get, .set = tm_cfpr_set
+	},
+	[REGSET_TM_CVMX] = {
+		.core_note_type = NT_PPC_TM_CVMX, .n = ELF_NVMX,
+		.size = sizeof(vector128), .align = sizeof(vector128),
+		.active = tm_cvmx_active, .get = tm_cvmx_get, .set = tm_cvmx_set
+	},
+	[REGSET_TM_CVSX] = {
+		.core_note_type = NT_PPC_TM_CVSX, .n = ELF_NVSX,
+		.size = sizeof(double), .align = sizeof(double),
+		.active = tm_cvsx_active, .get = tm_cvsx_get, .set = tm_cvsx_set
+	},
+	[REGSET_TM_SPR] = {
+		.core_note_type = NT_PPC_TM_SPR, .n = ELF_NTMSPRREG,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.active = tm_spr_active, .get = tm_spr_get, .set = tm_spr_set
+	},
+	[REGSET_TM_CTAR] = {
+		.core_note_type = NT_PPC_TM_CTAR, .n = 1,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.active = tm_tar_active, .get = tm_tar_get, .set = tm_tar_set
+	},
+	[REGSET_TM_CPPR] = {
+		.core_note_type = NT_PPC_TM_CPPR, .n = 1,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.active = tm_ppr_active, .get = tm_ppr_get, .set = tm_ppr_set
+	},
+	[REGSET_TM_CDSCR] = {
+		.core_note_type = NT_PPC_TM_CDSCR, .n = 1,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.active = tm_dscr_active, .get = tm_dscr_get, .set = tm_dscr_set
+	},
+#endif
+#ifdef CONFIG_PPC64
+	[REGSET_PPR] = {
+		.core_note_type = NT_PPC_PPR, .n = 1,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.get = ppr_get, .set = ppr_set
+	},
+	[REGSET_DSCR] = {
+		.core_note_type = NT_PPC_DSCR, .n = 1,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.get = dscr_get, .set = dscr_set
+	},
+#endif
+#ifdef CONFIG_PPC_BOOK3S_64
+	[REGSET_TAR] = {
+		.core_note_type = NT_PPC_TAR, .n = 1,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.get = tar_get, .set = tar_set
+	},
+	[REGSET_EBB] = {
+		.core_note_type = NT_PPC_EBB, .n = ELF_NEBB,
+		.size = sizeof(u64), .align = sizeof(u64),
+		.active = ebb_active, .get = ebb_get, .set = ebb_set
+	},
+#endif
+};
+
+static const struct user_regset_view user_ppc_compat_view = {
+	.name = "ppc", .e_machine = EM_PPC, .ei_osabi = ELF_OSABI,
+	.regsets = compat_regsets, .n = ARRAY_SIZE(compat_regsets)
+};
+
+const struct user_regset_view *task_user_regset_view(struct task_struct *task)
+{
+	if (IS_ENABLED(CONFIG_PPC64) && test_tsk_thread_flag(task, TIF_32BIT))
+		return &user_ppc_compat_view;
+	return &user_ppc_native_view;
+}
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 9e06e8dc4297..78068f513353 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -50,966 +50,6 @@
 
 #include <kernel/ptrace/ptrace-decl.h>
 
-struct pt_regs_offset {
-	const char *name;
-	int offset;
-};
-
-#define STR(s)	#s			/* convert to string */
-#define REG_OFFSET_NAME(r) {.name = #r, .offset = offsetof(struct pt_regs, r)}
-#define GPR_OFFSET_NAME(num)	\
-	{.name = STR(r##num), .offset = offsetof(struct pt_regs, gpr[num])}, \
-	{.name = STR(gpr##num), .offset = offsetof(struct pt_regs, gpr[num])}
-#define REG_OFFSET_END {.name = NULL, .offset = 0}
-
-static const struct pt_regs_offset regoffset_table[] = {
-	GPR_OFFSET_NAME(0),
-	GPR_OFFSET_NAME(1),
-	GPR_OFFSET_NAME(2),
-	GPR_OFFSET_NAME(3),
-	GPR_OFFSET_NAME(4),
-	GPR_OFFSET_NAME(5),
-	GPR_OFFSET_NAME(6),
-	GPR_OFFSET_NAME(7),
-	GPR_OFFSET_NAME(8),
-	GPR_OFFSET_NAME(9),
-	GPR_OFFSET_NAME(10),
-	GPR_OFFSET_NAME(11),
-	GPR_OFFSET_NAME(12),
-	GPR_OFFSET_NAME(13),
-	GPR_OFFSET_NAME(14),
-	GPR_OFFSET_NAME(15),
-	GPR_OFFSET_NAME(16),
-	GPR_OFFSET_NAME(17),
-	GPR_OFFSET_NAME(18),
-	GPR_OFFSET_NAME(19),
-	GPR_OFFSET_NAME(20),
-	GPR_OFFSET_NAME(21),
-	GPR_OFFSET_NAME(22),
-	GPR_OFFSET_NAME(23),
-	GPR_OFFSET_NAME(24),
-	GPR_OFFSET_NAME(25),
-	GPR_OFFSET_NAME(26),
-	GPR_OFFSET_NAME(27),
-	GPR_OFFSET_NAME(28),
-	GPR_OFFSET_NAME(29),
-	GPR_OFFSET_NAME(30),
-	GPR_OFFSET_NAME(31),
-	REG_OFFSET_NAME(nip),
-	REG_OFFSET_NAME(msr),
-	REG_OFFSET_NAME(ctr),
-	REG_OFFSET_NAME(link),
-	REG_OFFSET_NAME(xer),
-	REG_OFFSET_NAME(ccr),
-	REG_OFFSET_NAME(softe),
-	REG_OFFSET_NAME(mq),
-	REG_OFFSET_NAME(trap),
-	REG_OFFSET_NAME(dar),
-	REG_OFFSET_NAME(dsisr),
-	REG_OFFSET_END,
-};
-
-/**
- * regs_query_register_offset() - query register offset from its name
- * @name:	the name of a register
- *
- * regs_query_register_offset() returns the offset of a register in struct
- * pt_regs from its name. If the name is invalid, this returns -EINVAL;
- */
-int regs_query_register_offset(const char *name)
-{
-	const struct pt_regs_offset *roff;
-	for (roff = regoffset_table; roff->name != NULL; roff++)
-		if (!strcmp(roff->name, name))
-			return roff->offset;
-	return -EINVAL;
-}
-
-/**
- * regs_query_register_name() - query register name from its offset
- * @offset:	the offset of a register in struct pt_regs.
- *
- * regs_query_register_name() returns the name of a register from its
- * offset in struct pt_regs. If the @offset is invalid, this returns NULL;
- */
-const char *regs_query_register_name(unsigned int offset)
-{
-	const struct pt_regs_offset *roff;
-	for (roff = regoffset_table; roff->name != NULL; roff++)
-		if (roff->offset == offset)
-			return roff->name;
-	return NULL;
-}
-
-/*
- * does not yet catch signals sent when the child dies.
- * in exit.c or in signal.c.
- */
-
-static unsigned long get_user_msr(struct task_struct *task)
-{
-	return task->thread.regs->msr | task->thread.fpexc_mode;
-}
-
-static int set_user_msr(struct task_struct *task, unsigned long msr)
-{
-	task->thread.regs->msr &= ~MSR_DEBUGCHANGE;
-	task->thread.regs->msr |= msr & MSR_DEBUGCHANGE;
-	return 0;
-}
-
-#ifdef CONFIG_PPC64
-static int get_user_dscr(struct task_struct *task, unsigned long *data)
-{
-	*data = task->thread.dscr;
-	return 0;
-}
-
-static int set_user_dscr(struct task_struct *task, unsigned long dscr)
-{
-	task->thread.dscr = dscr;
-	task->thread.dscr_inherit = 1;
-	return 0;
-}
-#else
-static int get_user_dscr(struct task_struct *task, unsigned long *data)
-{
-	return -EIO;
-}
-
-static int set_user_dscr(struct task_struct *task, unsigned long dscr)
-{
-	return -EIO;
-}
-#endif
-
-/*
- * We prevent mucking around with the reserved area of trap
- * which are used internally by the kernel.
- */
-static int set_user_trap(struct task_struct *task, unsigned long trap)
-{
-	task->thread.regs->trap = trap & 0xfff0;
-	return 0;
-}
-
-/*
- * Get contents of register REGNO in task TASK.
- */
-int ptrace_get_reg(struct task_struct *task, int regno, unsigned long *data)
-{
-	unsigned int regs_max;
-
-	if ((task->thread.regs == NULL) || !data)
-		return -EIO;
-
-	if (regno == PT_MSR) {
-		*data = get_user_msr(task);
-		return 0;
-	}
-
-	if (regno == PT_DSCR)
-		return get_user_dscr(task, data);
-
-	/*
-	 * softe copies paca->irq_soft_mask variable state. Since irq_soft_mask is
-	 * no more used as a flag, lets force usr to alway see the softe value as 1
-	 * which means interrupts are not soft disabled.
-	 */
-	if (IS_ENABLED(CONFIG_PPC64) && regno == PT_SOFTE) {
-		*data = 1;
-		return  0;
-	}
-
-	regs_max = sizeof(struct user_pt_regs) / sizeof(unsigned long);
-	if (regno < regs_max) {
-		regno = array_index_nospec(regno, regs_max);
-		*data = ((unsigned long *)task->thread.regs)[regno];
-		return 0;
-	}
-
-	return -EIO;
-}
-
-/*
- * Write contents of register REGNO in task TASK.
- */
-int ptrace_put_reg(struct task_struct *task, int regno, unsigned long data)
-{
-	if (task->thread.regs == NULL)
-		return -EIO;
-
-	if (regno == PT_MSR)
-		return set_user_msr(task, data);
-	if (regno == PT_TRAP)
-		return set_user_trap(task, data);
-	if (regno == PT_DSCR)
-		return set_user_dscr(task, data);
-
-	if (regno <= PT_MAX_PUT_REG) {
-		regno = array_index_nospec(regno, PT_MAX_PUT_REG + 1);
-		((unsigned long *)task->thread.regs)[regno] = data;
-		return 0;
-	}
-	return -EIO;
-}
-
-static int gpr_get(struct task_struct *target, const struct user_regset *regset,
-		   unsigned int pos, unsigned int count,
-		   void *kbuf, void __user *ubuf)
-{
-	int i, ret;
-
-	if (target->thread.regs == NULL)
-		return -EIO;
-
-	if (!FULL_REGS(target->thread.regs)) {
-		/* We have a partial register set.  Fill 14-31 with bogus values */
-		for (i = 14; i < 32; i++)
-			target->thread.regs->gpr[i] = NV_REG_POISON;
-	}
-
-	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				  target->thread.regs,
-				  0, offsetof(struct pt_regs, msr));
-	if (!ret) {
-		unsigned long msr = get_user_msr(target);
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
-					  &target->thread.regs->orig_gpr3,
-					  offsetof(struct pt_regs, orig_gpr3),
-					  sizeof(struct user_pt_regs));
-	if (!ret)
-		ret = user_regset_copyout_zero(&pos, &count, &kbuf, &ubuf,
-					       sizeof(struct user_pt_regs), -1);
-
-	return ret;
-}
-
-static int gpr_set(struct task_struct *target, const struct user_regset *regset,
-		   unsigned int pos, unsigned int count,
-		   const void *kbuf, const void __user *ubuf)
-{
-	unsigned long reg;
-	int ret;
-
-	if (target->thread.regs == NULL)
-		return -EIO;
-
-	CHECK_FULL_REGS(target->thread.regs);
-
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				 target->thread.regs,
-				 0, PT_MSR * sizeof(reg));
-
-	if (!ret && count > 0) {
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &reg,
-					 PT_MSR * sizeof(reg),
-					 (PT_MSR + 1) * sizeof(reg));
-		if (!ret)
-			ret = set_user_msr(target, reg);
-	}
-
-	BUILD_BUG_ON(offsetof(struct pt_regs, orig_gpr3) !=
-		     offsetof(struct pt_regs, msr) + sizeof(long));
-
-	if (!ret)
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-					 &target->thread.regs->orig_gpr3,
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
-			ret = set_user_trap(target, reg);
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
-#ifdef CONFIG_PPC64
-static int ppr_get(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      void *kbuf, void __user *ubuf)
-{
-	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				   &target->thread.regs->ppr, 0, sizeof(u64));
-}
-
-static int ppr_set(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      const void *kbuf, const void __user *ubuf)
-{
-	return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				  &target->thread.regs->ppr, 0, sizeof(u64));
-}
-
-static int dscr_get(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      void *kbuf, void __user *ubuf)
-{
-	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				   &target->thread.dscr, 0, sizeof(u64));
-}
-static int dscr_set(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      const void *kbuf, const void __user *ubuf)
-{
-	return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				  &target->thread.dscr, 0, sizeof(u64));
-}
-#endif
-#ifdef CONFIG_PPC_BOOK3S_64
-static int tar_get(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      void *kbuf, void __user *ubuf)
-{
-	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				   &target->thread.tar, 0, sizeof(u64));
-}
-static int tar_set(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      const void *kbuf, const void __user *ubuf)
-{
-	return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				  &target->thread.tar, 0, sizeof(u64));
-}
-
-static int ebb_active(struct task_struct *target,
-			 const struct user_regset *regset)
-{
-	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
-		return -ENODEV;
-
-	if (target->thread.used_ebb)
-		return regset->n;
-
-	return 0;
-}
-
-static int ebb_get(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      void *kbuf, void __user *ubuf)
-{
-	/* Build tests */
-	BUILD_BUG_ON(TSO(ebbrr) + sizeof(unsigned long) != TSO(ebbhr));
-	BUILD_BUG_ON(TSO(ebbhr) + sizeof(unsigned long) != TSO(bescr));
-
-	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
-		return -ENODEV;
-
-	if (!target->thread.used_ebb)
-		return -ENODATA;
-
-	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-			&target->thread.ebbrr, 0, 3 * sizeof(unsigned long));
-}
-
-static int ebb_set(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      const void *kbuf, const void __user *ubuf)
-{
-	int ret = 0;
-
-	/* Build tests */
-	BUILD_BUG_ON(TSO(ebbrr) + sizeof(unsigned long) != TSO(ebbhr));
-	BUILD_BUG_ON(TSO(ebbhr) + sizeof(unsigned long) != TSO(bescr));
-
-	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
-		return -ENODEV;
-
-	if (target->thread.used_ebb)
-		return -ENODATA;
-
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-			&target->thread.ebbrr, 0, sizeof(unsigned long));
-
-	if (!ret)
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-			&target->thread.ebbhr, sizeof(unsigned long),
-			2 * sizeof(unsigned long));
-
-	if (!ret)
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-			&target->thread.bescr,
-			2 * sizeof(unsigned long), 3 * sizeof(unsigned long));
-
-	return ret;
-}
-static int pmu_active(struct task_struct *target,
-			 const struct user_regset *regset)
-{
-	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
-		return -ENODEV;
-
-	return regset->n;
-}
-
-static int pmu_get(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      void *kbuf, void __user *ubuf)
-{
-	/* Build tests */
-	BUILD_BUG_ON(TSO(siar) + sizeof(unsigned long) != TSO(sdar));
-	BUILD_BUG_ON(TSO(sdar) + sizeof(unsigned long) != TSO(sier));
-	BUILD_BUG_ON(TSO(sier) + sizeof(unsigned long) != TSO(mmcr2));
-	BUILD_BUG_ON(TSO(mmcr2) + sizeof(unsigned long) != TSO(mmcr0));
-
-	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
-		return -ENODEV;
-
-	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-			&target->thread.siar, 0,
-			5 * sizeof(unsigned long));
-}
-
-static int pmu_set(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      const void *kbuf, const void __user *ubuf)
-{
-	int ret = 0;
-
-	/* Build tests */
-	BUILD_BUG_ON(TSO(siar) + sizeof(unsigned long) != TSO(sdar));
-	BUILD_BUG_ON(TSO(sdar) + sizeof(unsigned long) != TSO(sier));
-	BUILD_BUG_ON(TSO(sier) + sizeof(unsigned long) != TSO(mmcr2));
-	BUILD_BUG_ON(TSO(mmcr2) + sizeof(unsigned long) != TSO(mmcr0));
-
-	if (!cpu_has_feature(CPU_FTR_ARCH_207S))
-		return -ENODEV;
-
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-			&target->thread.siar, 0,
-			sizeof(unsigned long));
-
-	if (!ret)
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-			&target->thread.sdar, sizeof(unsigned long),
-			2 * sizeof(unsigned long));
-
-	if (!ret)
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-			&target->thread.sier, 2 * sizeof(unsigned long),
-			3 * sizeof(unsigned long));
-
-	if (!ret)
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-			&target->thread.mmcr2, 3 * sizeof(unsigned long),
-			4 * sizeof(unsigned long));
-
-	if (!ret)
-		ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-			&target->thread.mmcr0, 4 * sizeof(unsigned long),
-			5 * sizeof(unsigned long));
-	return ret;
-}
-#endif
-
-#ifdef CONFIG_PPC_MEM_KEYS
-static int pkey_active(struct task_struct *target,
-		       const struct user_regset *regset)
-{
-	if (!arch_pkeys_enabled())
-		return -ENODEV;
-
-	return regset->n;
-}
-
-static int pkey_get(struct task_struct *target,
-		    const struct user_regset *regset,
-		    unsigned int pos, unsigned int count,
-		    void *kbuf, void __user *ubuf)
-{
-	BUILD_BUG_ON(TSO(amr) + sizeof(unsigned long) != TSO(iamr));
-	BUILD_BUG_ON(TSO(iamr) + sizeof(unsigned long) != TSO(uamor));
-
-	if (!arch_pkeys_enabled())
-		return -ENODEV;
-
-	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
-				   &target->thread.amr, 0,
-				   ELF_NPKEY * sizeof(unsigned long));
-}
-
-static int pkey_set(struct task_struct *target,
-		      const struct user_regset *regset,
-		      unsigned int pos, unsigned int count,
-		      const void *kbuf, const void __user *ubuf)
-{
-	u64 new_amr;
-	int ret;
-
-	if (!arch_pkeys_enabled())
-		return -ENODEV;
-
-	/* Only the AMR can be set from userspace */
-	if (pos != 0 || count != sizeof(new_amr))
-		return -EINVAL;
-
-	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
-				 &new_amr, 0, sizeof(new_amr));
-	if (ret)
-		return ret;
-
-	/* UAMOR determines which bits of the AMR can be set from userspace. */
-	target->thread.amr = (new_amr & target->thread.uamor) |
-		(target->thread.amr & ~target->thread.uamor);
-
-	return 0;
-}
-#endif /* CONFIG_PPC_MEM_KEYS */
-
-/*
- * These are our native regset flavors.
- */
-enum powerpc_regset {
-	REGSET_GPR,
-	REGSET_FPR,
-#ifdef CONFIG_ALTIVEC
-	REGSET_VMX,
-#endif
-#ifdef CONFIG_VSX
-	REGSET_VSX,
-#endif
-#ifdef CONFIG_SPE
-	REGSET_SPE,
-#endif
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	REGSET_TM_CGPR,		/* TM checkpointed GPR registers */
-	REGSET_TM_CFPR,		/* TM checkpointed FPR registers */
-	REGSET_TM_CVMX,		/* TM checkpointed VMX registers */
-	REGSET_TM_CVSX,		/* TM checkpointed VSX registers */
-	REGSET_TM_SPR,		/* TM specific SPR registers */
-	REGSET_TM_CTAR,		/* TM checkpointed TAR register */
-	REGSET_TM_CPPR,		/* TM checkpointed PPR register */
-	REGSET_TM_CDSCR,	/* TM checkpointed DSCR register */
-#endif
-#ifdef CONFIG_PPC64
-	REGSET_PPR,		/* PPR register */
-	REGSET_DSCR,		/* DSCR register */
-#endif
-#ifdef CONFIG_PPC_BOOK3S_64
-	REGSET_TAR,		/* TAR register */
-	REGSET_EBB,		/* EBB registers */
-	REGSET_PMR,		/* Performance Monitor Registers */
-#endif
-#ifdef CONFIG_PPC_MEM_KEYS
-	REGSET_PKEY,		/* AMR register */
-#endif
-};
-
-static const struct user_regset native_regsets[] = {
-	[REGSET_GPR] = {
-		.core_note_type = NT_PRSTATUS, .n = ELF_NGREG,
-		.size = sizeof(long), .align = sizeof(long),
-		.get = gpr_get, .set = gpr_set
-	},
-	[REGSET_FPR] = {
-		.core_note_type = NT_PRFPREG, .n = ELF_NFPREG,
-		.size = sizeof(double), .align = sizeof(double),
-		.get = fpr_get, .set = fpr_set
-	},
-#ifdef CONFIG_ALTIVEC
-	[REGSET_VMX] = {
-		.core_note_type = NT_PPC_VMX, .n = 34,
-		.size = sizeof(vector128), .align = sizeof(vector128),
-		.active = vr_active, .get = vr_get, .set = vr_set
-	},
-#endif
-#ifdef CONFIG_VSX
-	[REGSET_VSX] = {
-		.core_note_type = NT_PPC_VSX, .n = 32,
-		.size = sizeof(double), .align = sizeof(double),
-		.active = vsr_active, .get = vsr_get, .set = vsr_set
-	},
-#endif
-#ifdef CONFIG_SPE
-	[REGSET_SPE] = {
-		.core_note_type = NT_PPC_SPE, .n = 35,
-		.size = sizeof(u32), .align = sizeof(u32),
-		.active = evr_active, .get = evr_get, .set = evr_set
-	},
-#endif
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	[REGSET_TM_CGPR] = {
-		.core_note_type = NT_PPC_TM_CGPR, .n = ELF_NGREG,
-		.size = sizeof(long), .align = sizeof(long),
-		.active = tm_cgpr_active, .get = tm_cgpr_get, .set = tm_cgpr_set
-	},
-	[REGSET_TM_CFPR] = {
-		.core_note_type = NT_PPC_TM_CFPR, .n = ELF_NFPREG,
-		.size = sizeof(double), .align = sizeof(double),
-		.active = tm_cfpr_active, .get = tm_cfpr_get, .set = tm_cfpr_set
-	},
-	[REGSET_TM_CVMX] = {
-		.core_note_type = NT_PPC_TM_CVMX, .n = ELF_NVMX,
-		.size = sizeof(vector128), .align = sizeof(vector128),
-		.active = tm_cvmx_active, .get = tm_cvmx_get, .set = tm_cvmx_set
-	},
-	[REGSET_TM_CVSX] = {
-		.core_note_type = NT_PPC_TM_CVSX, .n = ELF_NVSX,
-		.size = sizeof(double), .align = sizeof(double),
-		.active = tm_cvsx_active, .get = tm_cvsx_get, .set = tm_cvsx_set
-	},
-	[REGSET_TM_SPR] = {
-		.core_note_type = NT_PPC_TM_SPR, .n = ELF_NTMSPRREG,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.active = tm_spr_active, .get = tm_spr_get, .set = tm_spr_set
-	},
-	[REGSET_TM_CTAR] = {
-		.core_note_type = NT_PPC_TM_CTAR, .n = 1,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.active = tm_tar_active, .get = tm_tar_get, .set = tm_tar_set
-	},
-	[REGSET_TM_CPPR] = {
-		.core_note_type = NT_PPC_TM_CPPR, .n = 1,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.active = tm_ppr_active, .get = tm_ppr_get, .set = tm_ppr_set
-	},
-	[REGSET_TM_CDSCR] = {
-		.core_note_type = NT_PPC_TM_CDSCR, .n = 1,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.active = tm_dscr_active, .get = tm_dscr_get, .set = tm_dscr_set
-	},
-#endif
-#ifdef CONFIG_PPC64
-	[REGSET_PPR] = {
-		.core_note_type = NT_PPC_PPR, .n = 1,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.get = ppr_get, .set = ppr_set
-	},
-	[REGSET_DSCR] = {
-		.core_note_type = NT_PPC_DSCR, .n = 1,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.get = dscr_get, .set = dscr_set
-	},
-#endif
-#ifdef CONFIG_PPC_BOOK3S_64
-	[REGSET_TAR] = {
-		.core_note_type = NT_PPC_TAR, .n = 1,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.get = tar_get, .set = tar_set
-	},
-	[REGSET_EBB] = {
-		.core_note_type = NT_PPC_EBB, .n = ELF_NEBB,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.active = ebb_active, .get = ebb_get, .set = ebb_set
-	},
-	[REGSET_PMR] = {
-		.core_note_type = NT_PPC_PMU, .n = ELF_NPMU,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.active = pmu_active, .get = pmu_get, .set = pmu_set
-	},
-#endif
-#ifdef CONFIG_PPC_MEM_KEYS
-	[REGSET_PKEY] = {
-		.core_note_type = NT_PPC_PKEY, .n = ELF_NPKEY,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.active = pkey_active, .get = pkey_get, .set = pkey_set
-	},
-#endif
-};
-
-static const struct user_regset_view user_ppc_native_view = {
-	.name = UTS_MACHINE, .e_machine = ELF_ARCH, .ei_osabi = ELF_OSABI,
-	.regsets = native_regsets, .n = ARRAY_SIZE(native_regsets)
-};
-
-#include <linux/compat.h>
-
-int gpr32_get_common(struct task_struct *target,
-		     const struct user_regset *regset,
-		     unsigned int pos, unsigned int count,
-			    void *kbuf, void __user *ubuf,
-			    unsigned long *regs)
-{
-	compat_ulong_t *k = kbuf;
-	compat_ulong_t __user *u = ubuf;
-	compat_ulong_t reg;
-
-	pos /= sizeof(reg);
-	count /= sizeof(reg);
-
-	if (kbuf)
-		for (; count > 0 && pos < PT_MSR; --count)
-			*k++ = regs[pos++];
-	else
-		for (; count > 0 && pos < PT_MSR; --count)
-			if (__put_user((compat_ulong_t) regs[pos++], u++))
-				return -EFAULT;
-
-	if (count > 0 && pos == PT_MSR) {
-		reg = get_user_msr(target);
-		if (kbuf)
-			*k++ = reg;
-		else if (__put_user(reg, u++))
-			return -EFAULT;
-		++pos;
-		--count;
-	}
-
-	if (kbuf)
-		for (; count > 0 && pos < PT_REGS_COUNT; --count)
-			*k++ = regs[pos++];
-	else
-		for (; count > 0 && pos < PT_REGS_COUNT; --count)
-			if (__put_user((compat_ulong_t) regs[pos++], u++))
-				return -EFAULT;
-
-	kbuf = k;
-	ubuf = u;
-	pos *= sizeof(reg);
-	count *= sizeof(reg);
-	return user_regset_copyout_zero(&pos, &count, &kbuf, &ubuf,
-					PT_REGS_COUNT * sizeof(reg), -1);
-}
-
-int gpr32_set_common(struct task_struct *target,
-		     const struct user_regset *regset,
-		     unsigned int pos, unsigned int count,
-		     const void *kbuf, const void __user *ubuf,
-		     unsigned long *regs)
-{
-	const compat_ulong_t *k = kbuf;
-	const compat_ulong_t __user *u = ubuf;
-	compat_ulong_t reg;
-
-	pos /= sizeof(reg);
-	count /= sizeof(reg);
-
-	if (kbuf)
-		for (; count > 0 && pos < PT_MSR; --count)
-			regs[pos++] = *k++;
-	else
-		for (; count > 0 && pos < PT_MSR; --count) {
-			if (__get_user(reg, u++))
-				return -EFAULT;
-			regs[pos++] = reg;
-		}
-
-
-	if (count > 0 && pos == PT_MSR) {
-		if (kbuf)
-			reg = *k++;
-		else if (__get_user(reg, u++))
-			return -EFAULT;
-		set_user_msr(target, reg);
-		++pos;
-		--count;
-	}
-
-	if (kbuf) {
-		for (; count > 0 && pos <= PT_MAX_PUT_REG; --count)
-			regs[pos++] = *k++;
-		for (; count > 0 && pos < PT_TRAP; --count, ++pos)
-			++k;
-	} else {
-		for (; count > 0 && pos <= PT_MAX_PUT_REG; --count) {
-			if (__get_user(reg, u++))
-				return -EFAULT;
-			regs[pos++] = reg;
-		}
-		for (; count > 0 && pos < PT_TRAP; --count, ++pos)
-			if (__get_user(reg, u++))
-				return -EFAULT;
-	}
-
-	if (count > 0 && pos == PT_TRAP) {
-		if (kbuf)
-			reg = *k++;
-		else if (__get_user(reg, u++))
-			return -EFAULT;
-		set_user_trap(target, reg);
-		++pos;
-		--count;
-	}
-
-	kbuf = k;
-	ubuf = u;
-	pos *= sizeof(reg);
-	count *= sizeof(reg);
-	return user_regset_copyin_ignore(&pos, &count, &kbuf, &ubuf,
-					 (PT_TRAP + 1) * sizeof(reg), -1);
-}
-
-static int gpr32_get(struct task_struct *target,
-		     const struct user_regset *regset,
-		     unsigned int pos, unsigned int count,
-		     void *kbuf, void __user *ubuf)
-{
-	int i;
-
-	if (target->thread.regs == NULL)
-		return -EIO;
-
-	if (!FULL_REGS(target->thread.regs)) {
-		/*
-		 * We have a partial register set.
-		 * Fill 14-31 with bogus values.
-		 */
-		for (i = 14; i < 32; i++)
-			target->thread.regs->gpr[i] = NV_REG_POISON;
-	}
-	return gpr32_get_common(target, regset, pos, count, kbuf, ubuf,
-			&target->thread.regs->gpr[0]);
-}
-
-static int gpr32_set(struct task_struct *target,
-		     const struct user_regset *regset,
-		     unsigned int pos, unsigned int count,
-		     const void *kbuf, const void __user *ubuf)
-{
-	if (target->thread.regs == NULL)
-		return -EIO;
-
-	CHECK_FULL_REGS(target->thread.regs);
-	return gpr32_set_common(target, regset, pos, count, kbuf, ubuf,
-			&target->thread.regs->gpr[0]);
-}
-
-/*
- * These are the regset flavors matching the CONFIG_PPC32 native set.
- */
-static const struct user_regset compat_regsets[] = {
-	[REGSET_GPR] = {
-		.core_note_type = NT_PRSTATUS, .n = ELF_NGREG,
-		.size = sizeof(compat_long_t), .align = sizeof(compat_long_t),
-		.get = gpr32_get, .set = gpr32_set
-	},
-	[REGSET_FPR] = {
-		.core_note_type = NT_PRFPREG, .n = ELF_NFPREG,
-		.size = sizeof(double), .align = sizeof(double),
-		.get = fpr_get, .set = fpr_set
-	},
-#ifdef CONFIG_ALTIVEC
-	[REGSET_VMX] = {
-		.core_note_type = NT_PPC_VMX, .n = 34,
-		.size = sizeof(vector128), .align = sizeof(vector128),
-		.active = vr_active, .get = vr_get, .set = vr_set
-	},
-#endif
-#ifdef CONFIG_SPE
-	[REGSET_SPE] = {
-		.core_note_type = NT_PPC_SPE, .n = 35,
-		.size = sizeof(u32), .align = sizeof(u32),
-		.active = evr_active, .get = evr_get, .set = evr_set
-	},
-#endif
-#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	[REGSET_TM_CGPR] = {
-		.core_note_type = NT_PPC_TM_CGPR, .n = ELF_NGREG,
-		.size = sizeof(long), .align = sizeof(long),
-		.active = tm_cgpr_active,
-		.get = tm_cgpr32_get, .set = tm_cgpr32_set
-	},
-	[REGSET_TM_CFPR] = {
-		.core_note_type = NT_PPC_TM_CFPR, .n = ELF_NFPREG,
-		.size = sizeof(double), .align = sizeof(double),
-		.active = tm_cfpr_active, .get = tm_cfpr_get, .set = tm_cfpr_set
-	},
-	[REGSET_TM_CVMX] = {
-		.core_note_type = NT_PPC_TM_CVMX, .n = ELF_NVMX,
-		.size = sizeof(vector128), .align = sizeof(vector128),
-		.active = tm_cvmx_active, .get = tm_cvmx_get, .set = tm_cvmx_set
-	},
-	[REGSET_TM_CVSX] = {
-		.core_note_type = NT_PPC_TM_CVSX, .n = ELF_NVSX,
-		.size = sizeof(double), .align = sizeof(double),
-		.active = tm_cvsx_active, .get = tm_cvsx_get, .set = tm_cvsx_set
-	},
-	[REGSET_TM_SPR] = {
-		.core_note_type = NT_PPC_TM_SPR, .n = ELF_NTMSPRREG,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.active = tm_spr_active, .get = tm_spr_get, .set = tm_spr_set
-	},
-	[REGSET_TM_CTAR] = {
-		.core_note_type = NT_PPC_TM_CTAR, .n = 1,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.active = tm_tar_active, .get = tm_tar_get, .set = tm_tar_set
-	},
-	[REGSET_TM_CPPR] = {
-		.core_note_type = NT_PPC_TM_CPPR, .n = 1,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.active = tm_ppr_active, .get = tm_ppr_get, .set = tm_ppr_set
-	},
-	[REGSET_TM_CDSCR] = {
-		.core_note_type = NT_PPC_TM_CDSCR, .n = 1,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.active = tm_dscr_active, .get = tm_dscr_get, .set = tm_dscr_set
-	},
-#endif
-#ifdef CONFIG_PPC64
-	[REGSET_PPR] = {
-		.core_note_type = NT_PPC_PPR, .n = 1,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.get = ppr_get, .set = ppr_set
-	},
-	[REGSET_DSCR] = {
-		.core_note_type = NT_PPC_DSCR, .n = 1,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.get = dscr_get, .set = dscr_set
-	},
-#endif
-#ifdef CONFIG_PPC_BOOK3S_64
-	[REGSET_TAR] = {
-		.core_note_type = NT_PPC_TAR, .n = 1,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.get = tar_get, .set = tar_set
-	},
-	[REGSET_EBB] = {
-		.core_note_type = NT_PPC_EBB, .n = ELF_NEBB,
-		.size = sizeof(u64), .align = sizeof(u64),
-		.active = ebb_active, .get = ebb_get, .set = ebb_set
-	},
-#endif
-};
-
-static const struct user_regset_view user_ppc_compat_view = {
-	.name = "ppc", .e_machine = EM_PPC, .ei_osabi = ELF_OSABI,
-	.regsets = compat_regsets, .n = ARRAY_SIZE(compat_regsets)
-};
-
-const struct user_regset_view *task_user_regset_view(struct task_struct *task)
-{
-	if (IS_ENABLED(CONFIG_PPC64) && test_tsk_thread_flag(task, TIF_32BIT))
-		return &user_ppc_compat_view;
-	return &user_ppc_native_view;
-}
-
-
 void user_enable_single_step(struct task_struct *task)
 {
 	struct pt_regs *regs = task->thread.regs;
-- 
2.13.3

