Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A8454D59
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 13:18:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y3Yk5R01zDq9P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 21:18:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Kuj+uSD5"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y36g5722zDq9F
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 20:58:19 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Y36b0L5Gz9v18P;
 Tue, 25 Jun 2019 12:58:15 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Kuj+uSD5; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id oVtjY7nCApiB; Tue, 25 Jun 2019 12:58:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Y36Z6LmHz9v17d;
 Tue, 25 Jun 2019 12:58:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561460294; bh=v9juh9b7QRUaCSAzWHO4frSwV+EiBbDYtfiu9UE7P5k=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=Kuj+uSD5G6jtYXg2CWM1utaN3t3T5QbAwbLqeC1OyTzOAKj7mYcESCQ3LV4qHyy03
 euaIH7lAYkuU7f8H82ujYuHTm6qpPGoIekLkT98jSG4BnjB08Mzcu0q7cLqyBehj7V
 BQCUg5TFfsXHLGD0EekESa5sab/mrN/XoKAkYXlY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EF29F8B879;
 Tue, 25 Jun 2019 12:58:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ya30cC-jghZt; Tue, 25 Jun 2019 12:58:15 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4D3828B87A;
 Tue, 25 Jun 2019 12:58:15 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1D6CE68E1D; Tue, 25 Jun 2019 10:58:15 +0000 (UTC)
Message-Id: <b7963d98a1f43ee433349d3f5e8df9ef6e5f2619.1561459984.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1561459983.git.christophe.leroy@c-s.fr>
References: <cover.1561459983.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v1 09/13] powerpc/ptrace: split out ADV_DEBUG_REGS related
 functions.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Tue, 25 Jun 2019 10:58:15 +0000 (UTC)
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

Move ADV_DEBUG_REGS functions out of ptrace.c, into
ptrace-adv.c and ptrace-noadv.c

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/ptrace/Makefile       |   4 +
 arch/powerpc/kernel/ptrace/ptrace-adv.c   | 487 ++++++++++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace-decl.h  |   6 +
 arch/powerpc/kernel/ptrace/ptrace-noadv.c | 258 ++++++++++++
 arch/powerpc/kernel/ptrace/ptrace.c       | 652 ------------------------------
 5 files changed, 755 insertions(+), 652 deletions(-)
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-adv.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-noadv.c

diff --git a/arch/powerpc/kernel/ptrace/Makefile b/arch/powerpc/kernel/ptrace/Makefile
index 7addc5994bb9..e9d97c2d063e 100644
--- a/arch/powerpc/kernel/ptrace/Makefile
+++ b/arch/powerpc/kernel/ptrace/Makefile
@@ -14,3 +14,7 @@ endif
 obj-$(CONFIG_ALTIVEC)		+= ptrace-altivec.o
 obj-$(CONFIG_SPE)		+= ptrace-spe.o
 obj-$(CONFIG_PPC_TRANSACTIONAL_MEM)	+= ptrace-tm.o
+obj-$(CONFIG_PPC_ADV_DEBUG_REGS)	+= ptrace-adv.o
+ifneq ($(CONFIG_PPC_ADV_DEBUG_REGS),y)
+obj-y				+= ptrace-noadv.o
+endif
diff --git a/arch/powerpc/kernel/ptrace/ptrace-adv.c b/arch/powerpc/kernel/ptrace/ptrace-adv.c
new file mode 100644
index 000000000000..86e71fa6c5c8
--- /dev/null
+++ b/arch/powerpc/kernel/ptrace/ptrace-adv.c
@@ -0,0 +1,487 @@
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
+void user_enable_single_step(struct task_struct *task)
+{
+	struct pt_regs *regs = task->thread.regs;
+
+	if (regs != NULL) {
+		task->thread.debug.dbcr0 &= ~DBCR0_BT;
+		task->thread.debug.dbcr0 |= DBCR0_IDM | DBCR0_IC;
+		regs->msr |= MSR_DE;
+	}
+	set_tsk_thread_flag(task, TIF_SINGLESTEP);
+}
+
+void user_enable_block_step(struct task_struct *task)
+{
+	struct pt_regs *regs = task->thread.regs;
+
+	if (regs != NULL) {
+		task->thread.debug.dbcr0 &= ~DBCR0_IC;
+		task->thread.debug.dbcr0 = DBCR0_IDM | DBCR0_BT;
+		regs->msr |= MSR_DE;
+	}
+	set_tsk_thread_flag(task, TIF_SINGLESTEP);
+}
+
+void user_disable_single_step(struct task_struct *task)
+{
+	struct pt_regs *regs = task->thread.regs;
+
+	if (regs != NULL) {
+		/*
+		 * The logic to disable single stepping should be as
+		 * simple as turning off the Instruction Complete flag.
+		 * And, after doing so, if all debug flags are off, turn
+		 * off DBCR0(IDM) and MSR(DE) .... Torez
+		 */
+		task->thread.debug.dbcr0 &= ~(DBCR0_IC|DBCR0_BT);
+		/*
+		 * Test to see if any of the DBCR_ACTIVE_EVENTS bits are set.
+		 */
+		if (!DBCR_ACTIVE_EVENTS(task->thread.debug.dbcr0,
+					task->thread.debug.dbcr1)) {
+			/*
+			 * All debug events were off.....
+			 */
+			task->thread.debug.dbcr0 &= ~DBCR0_IDM;
+			regs->msr &= ~MSR_DE;
+		}
+	}
+	clear_tsk_thread_flag(task, TIF_SINGLESTEP);
+}
+
+int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned long data)
+{
+	/* For ppc64 we support one DABR and no IABR's at the moment (ppc64).
+	 *  For embedded processors we support one DAC and no IAC's at the
+	 *  moment.
+	 */
+	if (addr > 0)
+		return -EINVAL;
+
+	/* The bottom 3 bits in dabr are flags */
+	if ((data & ~0x7UL) >= TASK_SIZE)
+		return -EIO;
+
+	/* As described above, it was assumed 3 bits were passed with the data
+	 *  address, but we will assume only the mode bits will be passed
+	 *  as to not cause alignment restrictions for DAC-based processors.
+	 */
+
+	/* DAC's hold the whole address without any mode flags */
+	task->thread.debug.dac1 = data & ~0x3UL;
+
+	if (task->thread.debug.dac1 == 0) {
+		dbcr_dac(task) &= ~(DBCR_DAC1R | DBCR_DAC1W);
+		if (!DBCR_ACTIVE_EVENTS(task->thread.debug.dbcr0,
+					task->thread.debug.dbcr1)) {
+			task->thread.regs->msr &= ~MSR_DE;
+			task->thread.debug.dbcr0 &= ~DBCR0_IDM;
+		}
+		return 0;
+	}
+
+	/* Read or Write bits must be set */
+
+	if (!(data & 0x3UL))
+		return -EINVAL;
+
+	/* Set the Internal Debugging flag (IDM bit 1) for the DBCR0
+	   register */
+	task->thread.debug.dbcr0 |= DBCR0_IDM;
+
+	/* Check for write and read flags and set DBCR0
+	   accordingly */
+	dbcr_dac(task) &= ~(DBCR_DAC1R|DBCR_DAC1W);
+	if (data & 0x1UL)
+		dbcr_dac(task) |= DBCR_DAC1R;
+	if (data & 0x2UL)
+		dbcr_dac(task) |= DBCR_DAC1W;
+	task->thread.regs->msr |= MSR_DE;
+	return 0;
+}
+
+static long set_instruction_bp(struct task_struct *child,
+			      struct ppc_hw_breakpoint *bp_info)
+{
+	int slot;
+	int slot1_in_use = ((child->thread.debug.dbcr0 & DBCR0_IAC1) != 0);
+	int slot2_in_use = ((child->thread.debug.dbcr0 & DBCR0_IAC2) != 0);
+	int slot3_in_use = ((child->thread.debug.dbcr0 & DBCR0_IAC3) != 0);
+	int slot4_in_use = ((child->thread.debug.dbcr0 & DBCR0_IAC4) != 0);
+
+	if (dbcr_iac_range(child) & DBCR_IAC12MODE)
+		slot2_in_use = 1;
+	if (dbcr_iac_range(child) & DBCR_IAC34MODE)
+		slot4_in_use = 1;
+
+	if (bp_info->addr >= TASK_SIZE)
+		return -EIO;
+
+	if (bp_info->addr_mode != PPC_BREAKPOINT_MODE_EXACT) {
+
+		/* Make sure range is valid. */
+		if (bp_info->addr2 >= TASK_SIZE)
+			return -EIO;
+
+		/* We need a pair of IAC regsisters */
+		if ((!slot1_in_use) && (!slot2_in_use)) {
+			slot = 1;
+			child->thread.debug.iac1 = bp_info->addr;
+			child->thread.debug.iac2 = bp_info->addr2;
+			child->thread.debug.dbcr0 |= DBCR0_IAC1;
+			if (bp_info->addr_mode ==
+					PPC_BREAKPOINT_MODE_RANGE_EXCLUSIVE)
+				dbcr_iac_range(child) |= DBCR_IAC12X;
+			else
+				dbcr_iac_range(child) |= DBCR_IAC12I;
+#if CONFIG_PPC_ADV_DEBUG_IACS > 2
+		} else if ((!slot3_in_use) && (!slot4_in_use)) {
+			slot = 3;
+			child->thread.debug.iac3 = bp_info->addr;
+			child->thread.debug.iac4 = bp_info->addr2;
+			child->thread.debug.dbcr0 |= DBCR0_IAC3;
+			if (bp_info->addr_mode ==
+					PPC_BREAKPOINT_MODE_RANGE_EXCLUSIVE)
+				dbcr_iac_range(child) |= DBCR_IAC34X;
+			else
+				dbcr_iac_range(child) |= DBCR_IAC34I;
+#endif
+		} else
+			return -ENOSPC;
+	} else {
+		/* We only need one.  If possible leave a pair free in
+		 * case a range is needed later
+		 */
+		if (!slot1_in_use) {
+			/*
+			 * Don't use iac1 if iac1-iac2 are free and either
+			 * iac3 or iac4 (but not both) are free
+			 */
+			if (slot2_in_use || (slot3_in_use == slot4_in_use)) {
+				slot = 1;
+				child->thread.debug.iac1 = bp_info->addr;
+				child->thread.debug.dbcr0 |= DBCR0_IAC1;
+				goto out;
+			}
+		}
+		if (!slot2_in_use) {
+			slot = 2;
+			child->thread.debug.iac2 = bp_info->addr;
+			child->thread.debug.dbcr0 |= DBCR0_IAC2;
+#if CONFIG_PPC_ADV_DEBUG_IACS > 2
+		} else if (!slot3_in_use) {
+			slot = 3;
+			child->thread.debug.iac3 = bp_info->addr;
+			child->thread.debug.dbcr0 |= DBCR0_IAC3;
+		} else if (!slot4_in_use) {
+			slot = 4;
+			child->thread.debug.iac4 = bp_info->addr;
+			child->thread.debug.dbcr0 |= DBCR0_IAC4;
+#endif
+		} else
+			return -ENOSPC;
+	}
+out:
+	child->thread.debug.dbcr0 |= DBCR0_IDM;
+	child->thread.regs->msr |= MSR_DE;
+
+	return slot;
+}
+
+static int del_instruction_bp(struct task_struct *child, int slot)
+{
+	switch (slot) {
+	case 1:
+		if ((child->thread.debug.dbcr0 & DBCR0_IAC1) == 0)
+			return -ENOENT;
+
+		if (dbcr_iac_range(child) & DBCR_IAC12MODE) {
+			/* address range - clear slots 1 & 2 */
+			child->thread.debug.iac2 = 0;
+			dbcr_iac_range(child) &= ~DBCR_IAC12MODE;
+		}
+		child->thread.debug.iac1 = 0;
+		child->thread.debug.dbcr0 &= ~DBCR0_IAC1;
+		break;
+	case 2:
+		if ((child->thread.debug.dbcr0 & DBCR0_IAC2) == 0)
+			return -ENOENT;
+
+		if (dbcr_iac_range(child) & DBCR_IAC12MODE)
+			/* used in a range */
+			return -EINVAL;
+		child->thread.debug.iac2 = 0;
+		child->thread.debug.dbcr0 &= ~DBCR0_IAC2;
+		break;
+#if CONFIG_PPC_ADV_DEBUG_IACS > 2
+	case 3:
+		if ((child->thread.debug.dbcr0 & DBCR0_IAC3) == 0)
+			return -ENOENT;
+
+		if (dbcr_iac_range(child) & DBCR_IAC34MODE) {
+			/* address range - clear slots 3 & 4 */
+			child->thread.debug.iac4 = 0;
+			dbcr_iac_range(child) &= ~DBCR_IAC34MODE;
+		}
+		child->thread.debug.iac3 = 0;
+		child->thread.debug.dbcr0 &= ~DBCR0_IAC3;
+		break;
+	case 4:
+		if ((child->thread.debug.dbcr0 & DBCR0_IAC4) == 0)
+			return -ENOENT;
+
+		if (dbcr_iac_range(child) & DBCR_IAC34MODE)
+			/* Used in a range */
+			return -EINVAL;
+		child->thread.debug.iac4 = 0;
+		child->thread.debug.dbcr0 &= ~DBCR0_IAC4;
+		break;
+#endif
+	default:
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int set_dac(struct task_struct *child, struct ppc_hw_breakpoint *bp_info)
+{
+	int byte_enable =
+		(bp_info->condition_mode >> PPC_BREAKPOINT_CONDITION_BE_SHIFT)
+		& 0xf;
+	int condition_mode =
+		bp_info->condition_mode & PPC_BREAKPOINT_CONDITION_MODE;
+	int slot;
+
+	if (byte_enable && (condition_mode == 0))
+		return -EINVAL;
+
+	if (bp_info->addr >= TASK_SIZE)
+		return -EIO;
+
+	if ((dbcr_dac(child) & (DBCR_DAC1R | DBCR_DAC1W)) == 0) {
+		slot = 1;
+		if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
+			dbcr_dac(child) |= DBCR_DAC1R;
+		if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_WRITE)
+			dbcr_dac(child) |= DBCR_DAC1W;
+		child->thread.debug.dac1 = (unsigned long)bp_info->addr;
+#if CONFIG_PPC_ADV_DEBUG_DVCS > 0
+		if (byte_enable) {
+			child->thread.debug.dvc1 =
+				(unsigned long)bp_info->condition_value;
+			child->thread.debug.dbcr2 |=
+				((byte_enable << DBCR2_DVC1BE_SHIFT) |
+				 (condition_mode << DBCR2_DVC1M_SHIFT));
+		}
+#endif
+#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
+	} else if (child->thread.debug.dbcr2 & DBCR2_DAC12MODE) {
+		/* Both dac1 and dac2 are part of a range */
+		return -ENOSPC;
+#endif
+	} else if ((dbcr_dac(child) & (DBCR_DAC2R | DBCR_DAC2W)) == 0) {
+		slot = 2;
+		if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
+			dbcr_dac(child) |= DBCR_DAC2R;
+		if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_WRITE)
+			dbcr_dac(child) |= DBCR_DAC2W;
+		child->thread.debug.dac2 = (unsigned long)bp_info->addr;
+#if CONFIG_PPC_ADV_DEBUG_DVCS > 0
+		if (byte_enable) {
+			child->thread.debug.dvc2 =
+				(unsigned long)bp_info->condition_value;
+			child->thread.debug.dbcr2 |=
+				((byte_enable << DBCR2_DVC2BE_SHIFT) |
+				 (condition_mode << DBCR2_DVC2M_SHIFT));
+		}
+#endif
+	} else
+		return -ENOSPC;
+	child->thread.debug.dbcr0 |= DBCR0_IDM;
+	child->thread.regs->msr |= MSR_DE;
+
+	return slot + 4;
+}
+
+static int del_dac(struct task_struct *child, int slot)
+{
+	if (slot == 1) {
+		if ((dbcr_dac(child) & (DBCR_DAC1R | DBCR_DAC1W)) == 0)
+			return -ENOENT;
+
+		child->thread.debug.dac1 = 0;
+		dbcr_dac(child) &= ~(DBCR_DAC1R | DBCR_DAC1W);
+#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
+		if (child->thread.debug.dbcr2 & DBCR2_DAC12MODE) {
+			child->thread.debug.dac2 = 0;
+			child->thread.debug.dbcr2 &= ~DBCR2_DAC12MODE;
+		}
+		child->thread.debug.dbcr2 &= ~(DBCR2_DVC1M | DBCR2_DVC1BE);
+#endif
+#if CONFIG_PPC_ADV_DEBUG_DVCS > 0
+		child->thread.debug.dvc1 = 0;
+#endif
+	} else if (slot == 2) {
+		if ((dbcr_dac(child) & (DBCR_DAC2R | DBCR_DAC2W)) == 0)
+			return -ENOENT;
+
+#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
+		if (child->thread.debug.dbcr2 & DBCR2_DAC12MODE)
+			/* Part of a range */
+			return -EINVAL;
+		child->thread.debug.dbcr2 &= ~(DBCR2_DVC2M | DBCR2_DVC2BE);
+#endif
+#if CONFIG_PPC_ADV_DEBUG_DVCS > 0
+		child->thread.debug.dvc2 = 0;
+#endif
+		child->thread.debug.dac2 = 0;
+		dbcr_dac(child) &= ~(DBCR_DAC2R | DBCR_DAC2W);
+	} else
+		return -EINVAL;
+
+	return 0;
+}
+
+#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
+static int set_dac_range(struct task_struct *child,
+			 struct ppc_hw_breakpoint *bp_info)
+{
+	int mode = bp_info->addr_mode & PPC_BREAKPOINT_MODE_MASK;
+
+	/* We don't allow range watchpoints to be used with DVC */
+	if (bp_info->condition_mode)
+		return -EINVAL;
+
+	/*
+	 * Best effort to verify the address range.  The user/supervisor bits
+	 * prevent trapping in kernel space, but let's fail on an obvious bad
+	 * range.  The simple test on the mask is not fool-proof, and any
+	 * exclusive range will spill over into kernel space.
+	 */
+	if (bp_info->addr >= TASK_SIZE)
+		return -EIO;
+	if (mode == PPC_BREAKPOINT_MODE_MASK) {
+		/*
+		 * dac2 is a bitmask.  Don't allow a mask that makes a
+		 * kernel space address from a valid dac1 value
+		 */
+		if (~((unsigned long)bp_info->addr2) >= TASK_SIZE)
+			return -EIO;
+	} else {
+		/*
+		 * For range breakpoints, addr2 must also be a valid address
+		 */
+		if (bp_info->addr2 >= TASK_SIZE)
+			return -EIO;
+	}
+
+	if (child->thread.debug.dbcr0 &
+	    (DBCR0_DAC1R | DBCR0_DAC1W | DBCR0_DAC2R | DBCR0_DAC2W))
+		return -ENOSPC;
+
+	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
+		child->thread.debug.dbcr0 |= (DBCR0_DAC1R | DBCR0_IDM);
+	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_WRITE)
+		child->thread.debug.dbcr0 |= (DBCR0_DAC1W | DBCR0_IDM);
+	child->thread.debug.dac1 = bp_info->addr;
+	child->thread.debug.dac2 = bp_info->addr2;
+	if (mode == PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE)
+		child->thread.debug.dbcr2  |= DBCR2_DAC12M;
+	else if (mode == PPC_BREAKPOINT_MODE_RANGE_EXCLUSIVE)
+		child->thread.debug.dbcr2  |= DBCR2_DAC12MX;
+	else	/* PPC_BREAKPOINT_MODE_MASK */
+		child->thread.debug.dbcr2  |= DBCR2_DAC12MM;
+	child->thread.regs->msr |= MSR_DE;
+
+	return 5;
+}
+#endif /* CONFIG_PPC_ADV_DEBUG_DAC_RANGE */
+
+long ppc_set_hwdebug(struct task_struct *child, struct ppc_hw_breakpoint *bp_info)
+{
+	if (bp_info->version != 1)
+		return -ENOTSUPP;
+	/*
+	 * Check for invalid flags and combinations
+	 */
+	if ((bp_info->trigger_type == 0) ||
+	    (bp_info->trigger_type & ~(PPC_BREAKPOINT_TRIGGER_EXECUTE |
+				       PPC_BREAKPOINT_TRIGGER_RW)) ||
+	    (bp_info->addr_mode & ~PPC_BREAKPOINT_MODE_MASK) ||
+	    (bp_info->condition_mode &
+	     ~(PPC_BREAKPOINT_CONDITION_MODE |
+	       PPC_BREAKPOINT_CONDITION_BE_ALL)))
+		return -EINVAL;
+#if CONFIG_PPC_ADV_DEBUG_DVCS == 0
+	if (bp_info->condition_mode != PPC_BREAKPOINT_CONDITION_NONE)
+		return -EINVAL;
+#endif
+
+	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_EXECUTE) {
+		if ((bp_info->trigger_type != PPC_BREAKPOINT_TRIGGER_EXECUTE) ||
+		    (bp_info->condition_mode != PPC_BREAKPOINT_CONDITION_NONE))
+			return -EINVAL;
+		return set_instruction_bp(child, bp_info);
+	}
+	if (bp_info->addr_mode == PPC_BREAKPOINT_MODE_EXACT)
+		return set_dac(child, bp_info);
+
+#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
+	return set_dac_range(child, bp_info);
+#else
+	return -EINVAL;
+#endif
+}
+
+long ppc_del_hwdebug(struct task_struct *child, long data)
+{
+	int rc;
+
+	if (data <= 4)
+		rc = del_instruction_bp(child, (int)data);
+	else
+		rc = del_dac(child, (int)data - 4);
+
+	if (!rc) {
+		if (!DBCR_ACTIVE_EVENTS(child->thread.debug.dbcr0,
+					child->thread.debug.dbcr1)) {
+			child->thread.debug.dbcr0 &= ~DBCR0_IDM;
+			child->thread.regs->msr &= ~MSR_DE;
+		}
+	}
+	return rc;
+}
diff --git a/arch/powerpc/kernel/ptrace/ptrace-decl.h b/arch/powerpc/kernel/ptrace/ptrace-decl.h
index ad82260a018c..078e7e5a7fa2 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -139,3 +139,9 @@ int tm_cgpr32_set(struct task_struct *target, const struct user_regset *regset,
 
 /* ptrace-view */
 extern const struct user_regset_view user_ppc_native_view;
+
+/* ptrace-(no)adv */
+int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned long data);
+long ppc_set_hwdebug(struct task_struct *child, struct ppc_hw_breakpoint *bp_info);
+long ppc_del_hwdebug(struct task_struct *child, long data);
+
diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
new file mode 100644
index 000000000000..7db330c94538
--- /dev/null
+++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
@@ -0,0 +1,258 @@
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
+void user_enable_single_step(struct task_struct *task)
+{
+	struct pt_regs *regs = task->thread.regs;
+
+	if (regs != NULL) {
+		regs->msr &= ~MSR_BE;
+		regs->msr |= MSR_SE;
+	}
+	set_tsk_thread_flag(task, TIF_SINGLESTEP);
+}
+
+void user_enable_block_step(struct task_struct *task)
+{
+	struct pt_regs *regs = task->thread.regs;
+
+	if (regs != NULL) {
+		regs->msr &= ~MSR_SE;
+		regs->msr |= MSR_BE;
+	}
+	set_tsk_thread_flag(task, TIF_SINGLESTEP);
+}
+
+void user_disable_single_step(struct task_struct *task)
+{
+	struct pt_regs *regs = task->thread.regs;
+
+	if (regs != NULL)
+		regs->msr &= ~(MSR_SE | MSR_BE);
+
+	clear_tsk_thread_flag(task, TIF_SINGLESTEP);
+}
+
+int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned long data)
+{
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	int ret;
+	struct thread_struct *thread = &(task->thread);
+	struct perf_event *bp;
+	struct perf_event_attr attr;
+#endif /* CONFIG_HAVE_HW_BREAKPOINT */
+	bool set_bp = true;
+	struct arch_hw_breakpoint hw_brk;
+
+	/* For ppc64 we support one DABR and no IABR's at the moment (ppc64).
+	 *  For embedded processors we support one DAC and no IAC's at the
+	 *  moment.
+	 */
+	if (addr > 0)
+		return -EINVAL;
+
+	/* The bottom 3 bits in dabr are flags */
+	if ((data & ~0x7UL) >= TASK_SIZE)
+		return -EIO;
+
+	/* For processors using DABR (i.e. 970), the bottom 3 bits are flags.
+	 *  It was assumed, on previous implementations, that 3 bits were
+	 *  passed together with the data address, fitting the design of the
+	 *  DABR register, as follows:
+	 *
+	 *  bit 0: Read flag
+	 *  bit 1: Write flag
+	 *  bit 2: Breakpoint translation
+	 *
+	 *  Thus, we use them here as so.
+	 */
+
+	/* Ensure breakpoint translation bit is set */
+	if (data && !(data & HW_BRK_TYPE_TRANSLATE))
+		return -EIO;
+	hw_brk.address = data & (~HW_BRK_TYPE_DABR);
+	hw_brk.type = (data & HW_BRK_TYPE_DABR) | HW_BRK_TYPE_PRIV_ALL;
+	hw_brk.len = 8;
+	set_bp = (data) && (hw_brk.type & HW_BRK_TYPE_RDWR);
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	bp = thread->ptrace_bps[0];
+	if (!set_bp) {
+		if (bp) {
+			unregister_hw_breakpoint(bp);
+			thread->ptrace_bps[0] = NULL;
+		}
+		return 0;
+	}
+	if (bp) {
+		attr = bp->attr;
+		attr.bp_addr = hw_brk.address;
+		arch_bp_generic_fields(hw_brk.type, &attr.bp_type);
+
+		/* Enable breakpoint */
+		attr.disabled = false;
+
+		ret =  modify_user_hw_breakpoint(bp, &attr);
+		if (ret) {
+			return ret;
+		}
+		thread->ptrace_bps[0] = bp;
+		thread->hw_brk = hw_brk;
+		return 0;
+	}
+
+	/* Create a new breakpoint request if one doesn't exist already */
+	hw_breakpoint_init(&attr);
+	attr.bp_addr = hw_brk.address;
+	attr.bp_len = 8;
+	arch_bp_generic_fields(hw_brk.type,
+			       &attr.bp_type);
+
+	thread->ptrace_bps[0] = bp = register_user_hw_breakpoint(&attr,
+					       ptrace_triggered, NULL, task);
+	if (IS_ERR(bp)) {
+		thread->ptrace_bps[0] = NULL;
+		return PTR_ERR(bp);
+	}
+
+#else /* !CONFIG_HAVE_HW_BREAKPOINT */
+	if (set_bp && (!ppc_breakpoint_available()))
+		return -ENODEV;
+#endif /* CONFIG_HAVE_HW_BREAKPOINT */
+	task->thread.hw_brk = hw_brk;
+	return 0;
+}
+
+long ppc_set_hwdebug(struct task_struct *child, struct ppc_hw_breakpoint *bp_info)
+{
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	int len = 0;
+	struct thread_struct *thread = &(child->thread);
+	struct perf_event *bp;
+	struct perf_event_attr attr;
+#endif /* CONFIG_HAVE_HW_BREAKPOINT */
+	struct arch_hw_breakpoint brk;
+
+	if (bp_info->version != 1)
+		return -ENOTSUPP;
+	/*
+	 * We only support one data breakpoint
+	 */
+	if ((bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_RW) == 0 ||
+	    (bp_info->trigger_type & ~PPC_BREAKPOINT_TRIGGER_RW) != 0 ||
+	    bp_info->condition_mode != PPC_BREAKPOINT_CONDITION_NONE)
+		return -EINVAL;
+
+	if ((unsigned long)bp_info->addr >= TASK_SIZE)
+		return -EIO;
+
+	brk.address = bp_info->addr & ~7UL;
+	brk.type = HW_BRK_TYPE_TRANSLATE;
+	brk.len = 8;
+	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
+		brk.type |= HW_BRK_TYPE_READ;
+	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_WRITE)
+		brk.type |= HW_BRK_TYPE_WRITE;
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	/*
+	 * Check if the request is for 'range' breakpoints. We can
+	 * support it if range < 8 bytes.
+	 */
+	if (bp_info->addr_mode == PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE)
+		len = bp_info->addr2 - bp_info->addr;
+	else if (bp_info->addr_mode == PPC_BREAKPOINT_MODE_EXACT)
+		len = 1;
+	else
+		return -EINVAL;
+	bp = thread->ptrace_bps[0];
+	if (bp)
+		return -ENOSPC;
+
+	/* Create a new breakpoint request if one doesn't exist already */
+	hw_breakpoint_init(&attr);
+	attr.bp_addr = (unsigned long)bp_info->addr & ~HW_BREAKPOINT_ALIGN;
+	attr.bp_len = len;
+	arch_bp_generic_fields(brk.type, &attr.bp_type);
+
+	thread->ptrace_bps[0] = bp = register_user_hw_breakpoint(&attr,
+					       ptrace_triggered, NULL, child);
+	if (IS_ERR(bp)) {
+		thread->ptrace_bps[0] = NULL;
+		return PTR_ERR(bp);
+	}
+
+	return 1;
+#endif /* CONFIG_HAVE_HW_BREAKPOINT */
+
+	if (bp_info->addr_mode != PPC_BREAKPOINT_MODE_EXACT)
+		return -EINVAL;
+
+	if (child->thread.hw_brk.address)
+		return -ENOSPC;
+
+	if (!ppc_breakpoint_available())
+		return -ENODEV;
+
+	child->thread.hw_brk = brk;
+
+	return 1;
+}
+
+long ppc_del_hwdebug(struct task_struct *child, long data)
+{
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	int ret = 0;
+	struct thread_struct *thread = &(child->thread);
+	struct perf_event *bp;
+#endif /* CONFIG_HAVE_HW_BREAKPOINT */
+	if (data != 1)
+		return -EINVAL;
+
+#ifdef CONFIG_HAVE_HW_BREAKPOINT
+	bp = thread->ptrace_bps[0];
+	if (bp) {
+		unregister_hw_breakpoint(bp);
+		thread->ptrace_bps[0] = NULL;
+	} else
+		ret = -ENOENT;
+	return ret;
+#else /* CONFIG_HAVE_HW_BREAKPOINT */
+	if (child->thread.hw_brk.address == 0)
+		return -ENOENT;
+
+	child->thread.hw_brk.address = 0;
+	child->thread.hw_brk.type = 0;
+#endif /* CONFIG_HAVE_HW_BREAKPOINT */
+
+	return 0;
+}
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 78068f513353..377e0e541d5f 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -50,71 +50,6 @@
 
 #include <kernel/ptrace/ptrace-decl.h>
 
-void user_enable_single_step(struct task_struct *task)
-{
-	struct pt_regs *regs = task->thread.regs;
-
-	if (regs != NULL) {
-#ifdef CONFIG_PPC_ADV_DEBUG_REGS
-		task->thread.debug.dbcr0 &= ~DBCR0_BT;
-		task->thread.debug.dbcr0 |= DBCR0_IDM | DBCR0_IC;
-		regs->msr |= MSR_DE;
-#else
-		regs->msr &= ~MSR_BE;
-		regs->msr |= MSR_SE;
-#endif
-	}
-	set_tsk_thread_flag(task, TIF_SINGLESTEP);
-}
-
-void user_enable_block_step(struct task_struct *task)
-{
-	struct pt_regs *regs = task->thread.regs;
-
-	if (regs != NULL) {
-#ifdef CONFIG_PPC_ADV_DEBUG_REGS
-		task->thread.debug.dbcr0 &= ~DBCR0_IC;
-		task->thread.debug.dbcr0 = DBCR0_IDM | DBCR0_BT;
-		regs->msr |= MSR_DE;
-#else
-		regs->msr &= ~MSR_SE;
-		regs->msr |= MSR_BE;
-#endif
-	}
-	set_tsk_thread_flag(task, TIF_SINGLESTEP);
-}
-
-void user_disable_single_step(struct task_struct *task)
-{
-	struct pt_regs *regs = task->thread.regs;
-
-	if (regs != NULL) {
-#ifdef CONFIG_PPC_ADV_DEBUG_REGS
-		/*
-		 * The logic to disable single stepping should be as
-		 * simple as turning off the Instruction Complete flag.
-		 * And, after doing so, if all debug flags are off, turn
-		 * off DBCR0(IDM) and MSR(DE) .... Torez
-		 */
-		task->thread.debug.dbcr0 &= ~(DBCR0_IC|DBCR0_BT);
-		/*
-		 * Test to see if any of the DBCR_ACTIVE_EVENTS bits are set.
-		 */
-		if (!DBCR_ACTIVE_EVENTS(task->thread.debug.dbcr0,
-					task->thread.debug.dbcr1)) {
-			/*
-			 * All debug events were off.....
-			 */
-			task->thread.debug.dbcr0 &= ~DBCR0_IDM;
-			regs->msr &= ~MSR_DE;
-		}
-#else
-		regs->msr &= ~(MSR_SE | MSR_BE);
-#endif
-	}
-	clear_tsk_thread_flag(task, TIF_SINGLESTEP);
-}
-
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 void ptrace_triggered(struct perf_event *bp,
 		      struct perf_sample_data *data, struct pt_regs *regs)
@@ -133,136 +68,6 @@ void ptrace_triggered(struct perf_event *bp,
 }
 #endif /* CONFIG_HAVE_HW_BREAKPOINT */
 
-static int ptrace_set_debugreg(struct task_struct *task, unsigned long addr,
-			       unsigned long data)
-{
-#ifdef CONFIG_HAVE_HW_BREAKPOINT
-	int ret;
-	struct thread_struct *thread = &(task->thread);
-	struct perf_event *bp;
-	struct perf_event_attr attr;
-#endif /* CONFIG_HAVE_HW_BREAKPOINT */
-#ifndef CONFIG_PPC_ADV_DEBUG_REGS
-	bool set_bp = true;
-	struct arch_hw_breakpoint hw_brk;
-#endif
-
-	/* For ppc64 we support one DABR and no IABR's at the moment (ppc64).
-	 *  For embedded processors we support one DAC and no IAC's at the
-	 *  moment.
-	 */
-	if (addr > 0)
-		return -EINVAL;
-
-	/* The bottom 3 bits in dabr are flags */
-	if ((data & ~0x7UL) >= TASK_SIZE)
-		return -EIO;
-
-#ifndef CONFIG_PPC_ADV_DEBUG_REGS
-	/* For processors using DABR (i.e. 970), the bottom 3 bits are flags.
-	 *  It was assumed, on previous implementations, that 3 bits were
-	 *  passed together with the data address, fitting the design of the
-	 *  DABR register, as follows:
-	 *
-	 *  bit 0: Read flag
-	 *  bit 1: Write flag
-	 *  bit 2: Breakpoint translation
-	 *
-	 *  Thus, we use them here as so.
-	 */
-
-	/* Ensure breakpoint translation bit is set */
-	if (data && !(data & HW_BRK_TYPE_TRANSLATE))
-		return -EIO;
-	hw_brk.address = data & (~HW_BRK_TYPE_DABR);
-	hw_brk.type = (data & HW_BRK_TYPE_DABR) | HW_BRK_TYPE_PRIV_ALL;
-	hw_brk.len = 8;
-	set_bp = (data) && (hw_brk.type & HW_BRK_TYPE_RDWR);
-#ifdef CONFIG_HAVE_HW_BREAKPOINT
-	bp = thread->ptrace_bps[0];
-	if (!set_bp) {
-		if (bp) {
-			unregister_hw_breakpoint(bp);
-			thread->ptrace_bps[0] = NULL;
-		}
-		return 0;
-	}
-	if (bp) {
-		attr = bp->attr;
-		attr.bp_addr = hw_brk.address;
-		arch_bp_generic_fields(hw_brk.type, &attr.bp_type);
-
-		/* Enable breakpoint */
-		attr.disabled = false;
-
-		ret =  modify_user_hw_breakpoint(bp, &attr);
-		if (ret) {
-			return ret;
-		}
-		thread->ptrace_bps[0] = bp;
-		thread->hw_brk = hw_brk;
-		return 0;
-	}
-
-	/* Create a new breakpoint request if one doesn't exist already */
-	hw_breakpoint_init(&attr);
-	attr.bp_addr = hw_brk.address;
-	attr.bp_len = 8;
-	arch_bp_generic_fields(hw_brk.type,
-			       &attr.bp_type);
-
-	thread->ptrace_bps[0] = bp = register_user_hw_breakpoint(&attr,
-					       ptrace_triggered, NULL, task);
-	if (IS_ERR(bp)) {
-		thread->ptrace_bps[0] = NULL;
-		return PTR_ERR(bp);
-	}
-
-#else /* !CONFIG_HAVE_HW_BREAKPOINT */
-	if (set_bp && (!ppc_breakpoint_available()))
-		return -ENODEV;
-#endif /* CONFIG_HAVE_HW_BREAKPOINT */
-	task->thread.hw_brk = hw_brk;
-#else /* CONFIG_PPC_ADV_DEBUG_REGS */
-	/* As described above, it was assumed 3 bits were passed with the data
-	 *  address, but we will assume only the mode bits will be passed
-	 *  as to not cause alignment restrictions for DAC-based processors.
-	 */
-
-	/* DAC's hold the whole address without any mode flags */
-	task->thread.debug.dac1 = data & ~0x3UL;
-
-	if (task->thread.debug.dac1 == 0) {
-		dbcr_dac(task) &= ~(DBCR_DAC1R | DBCR_DAC1W);
-		if (!DBCR_ACTIVE_EVENTS(task->thread.debug.dbcr0,
-					task->thread.debug.dbcr1)) {
-			task->thread.regs->msr &= ~MSR_DE;
-			task->thread.debug.dbcr0 &= ~DBCR0_IDM;
-		}
-		return 0;
-	}
-
-	/* Read or Write bits must be set */
-
-	if (!(data & 0x3UL))
-		return -EINVAL;
-
-	/* Set the Internal Debugging flag (IDM bit 1) for the DBCR0
-	   register */
-	task->thread.debug.dbcr0 |= DBCR0_IDM;
-
-	/* Check for write and read flags and set DBCR0
-	   accordingly */
-	dbcr_dac(task) &= ~(DBCR_DAC1R|DBCR_DAC1W);
-	if (data & 0x1UL)
-		dbcr_dac(task) |= DBCR_DAC1R;
-	if (data & 0x2UL)
-		dbcr_dac(task) |= DBCR_DAC1W;
-	task->thread.regs->msr |= MSR_DE;
-#endif /* CONFIG_PPC_ADV_DEBUG_REGS */
-	return 0;
-}
-
 /*
  * Called by kernel/ptrace.c when detaching..
  *
@@ -275,463 +80,6 @@ void ptrace_disable(struct task_struct *child)
 	clear_tsk_thread_flag(child, TIF_SYSCALL_EMU);
 }
 
-#ifdef CONFIG_PPC_ADV_DEBUG_REGS
-static long set_instruction_bp(struct task_struct *child,
-			      struct ppc_hw_breakpoint *bp_info)
-{
-	int slot;
-	int slot1_in_use = ((child->thread.debug.dbcr0 & DBCR0_IAC1) != 0);
-	int slot2_in_use = ((child->thread.debug.dbcr0 & DBCR0_IAC2) != 0);
-	int slot3_in_use = ((child->thread.debug.dbcr0 & DBCR0_IAC3) != 0);
-	int slot4_in_use = ((child->thread.debug.dbcr0 & DBCR0_IAC4) != 0);
-
-	if (dbcr_iac_range(child) & DBCR_IAC12MODE)
-		slot2_in_use = 1;
-	if (dbcr_iac_range(child) & DBCR_IAC34MODE)
-		slot4_in_use = 1;
-
-	if (bp_info->addr >= TASK_SIZE)
-		return -EIO;
-
-	if (bp_info->addr_mode != PPC_BREAKPOINT_MODE_EXACT) {
-
-		/* Make sure range is valid. */
-		if (bp_info->addr2 >= TASK_SIZE)
-			return -EIO;
-
-		/* We need a pair of IAC regsisters */
-		if ((!slot1_in_use) && (!slot2_in_use)) {
-			slot = 1;
-			child->thread.debug.iac1 = bp_info->addr;
-			child->thread.debug.iac2 = bp_info->addr2;
-			child->thread.debug.dbcr0 |= DBCR0_IAC1;
-			if (bp_info->addr_mode ==
-					PPC_BREAKPOINT_MODE_RANGE_EXCLUSIVE)
-				dbcr_iac_range(child) |= DBCR_IAC12X;
-			else
-				dbcr_iac_range(child) |= DBCR_IAC12I;
-#if CONFIG_PPC_ADV_DEBUG_IACS > 2
-		} else if ((!slot3_in_use) && (!slot4_in_use)) {
-			slot = 3;
-			child->thread.debug.iac3 = bp_info->addr;
-			child->thread.debug.iac4 = bp_info->addr2;
-			child->thread.debug.dbcr0 |= DBCR0_IAC3;
-			if (bp_info->addr_mode ==
-					PPC_BREAKPOINT_MODE_RANGE_EXCLUSIVE)
-				dbcr_iac_range(child) |= DBCR_IAC34X;
-			else
-				dbcr_iac_range(child) |= DBCR_IAC34I;
-#endif
-		} else
-			return -ENOSPC;
-	} else {
-		/* We only need one.  If possible leave a pair free in
-		 * case a range is needed later
-		 */
-		if (!slot1_in_use) {
-			/*
-			 * Don't use iac1 if iac1-iac2 are free and either
-			 * iac3 or iac4 (but not both) are free
-			 */
-			if (slot2_in_use || (slot3_in_use == slot4_in_use)) {
-				slot = 1;
-				child->thread.debug.iac1 = bp_info->addr;
-				child->thread.debug.dbcr0 |= DBCR0_IAC1;
-				goto out;
-			}
-		}
-		if (!slot2_in_use) {
-			slot = 2;
-			child->thread.debug.iac2 = bp_info->addr;
-			child->thread.debug.dbcr0 |= DBCR0_IAC2;
-#if CONFIG_PPC_ADV_DEBUG_IACS > 2
-		} else if (!slot3_in_use) {
-			slot = 3;
-			child->thread.debug.iac3 = bp_info->addr;
-			child->thread.debug.dbcr0 |= DBCR0_IAC3;
-		} else if (!slot4_in_use) {
-			slot = 4;
-			child->thread.debug.iac4 = bp_info->addr;
-			child->thread.debug.dbcr0 |= DBCR0_IAC4;
-#endif
-		} else
-			return -ENOSPC;
-	}
-out:
-	child->thread.debug.dbcr0 |= DBCR0_IDM;
-	child->thread.regs->msr |= MSR_DE;
-
-	return slot;
-}
-
-static int del_instruction_bp(struct task_struct *child, int slot)
-{
-	switch (slot) {
-	case 1:
-		if ((child->thread.debug.dbcr0 & DBCR0_IAC1) == 0)
-			return -ENOENT;
-
-		if (dbcr_iac_range(child) & DBCR_IAC12MODE) {
-			/* address range - clear slots 1 & 2 */
-			child->thread.debug.iac2 = 0;
-			dbcr_iac_range(child) &= ~DBCR_IAC12MODE;
-		}
-		child->thread.debug.iac1 = 0;
-		child->thread.debug.dbcr0 &= ~DBCR0_IAC1;
-		break;
-	case 2:
-		if ((child->thread.debug.dbcr0 & DBCR0_IAC2) == 0)
-			return -ENOENT;
-
-		if (dbcr_iac_range(child) & DBCR_IAC12MODE)
-			/* used in a range */
-			return -EINVAL;
-		child->thread.debug.iac2 = 0;
-		child->thread.debug.dbcr0 &= ~DBCR0_IAC2;
-		break;
-#if CONFIG_PPC_ADV_DEBUG_IACS > 2
-	case 3:
-		if ((child->thread.debug.dbcr0 & DBCR0_IAC3) == 0)
-			return -ENOENT;
-
-		if (dbcr_iac_range(child) & DBCR_IAC34MODE) {
-			/* address range - clear slots 3 & 4 */
-			child->thread.debug.iac4 = 0;
-			dbcr_iac_range(child) &= ~DBCR_IAC34MODE;
-		}
-		child->thread.debug.iac3 = 0;
-		child->thread.debug.dbcr0 &= ~DBCR0_IAC3;
-		break;
-	case 4:
-		if ((child->thread.debug.dbcr0 & DBCR0_IAC4) == 0)
-			return -ENOENT;
-
-		if (dbcr_iac_range(child) & DBCR_IAC34MODE)
-			/* Used in a range */
-			return -EINVAL;
-		child->thread.debug.iac4 = 0;
-		child->thread.debug.dbcr0 &= ~DBCR0_IAC4;
-		break;
-#endif
-	default:
-		return -EINVAL;
-	}
-	return 0;
-}
-
-static int set_dac(struct task_struct *child, struct ppc_hw_breakpoint *bp_info)
-{
-	int byte_enable =
-		(bp_info->condition_mode >> PPC_BREAKPOINT_CONDITION_BE_SHIFT)
-		& 0xf;
-	int condition_mode =
-		bp_info->condition_mode & PPC_BREAKPOINT_CONDITION_MODE;
-	int slot;
-
-	if (byte_enable && (condition_mode == 0))
-		return -EINVAL;
-
-	if (bp_info->addr >= TASK_SIZE)
-		return -EIO;
-
-	if ((dbcr_dac(child) & (DBCR_DAC1R | DBCR_DAC1W)) == 0) {
-		slot = 1;
-		if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
-			dbcr_dac(child) |= DBCR_DAC1R;
-		if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_WRITE)
-			dbcr_dac(child) |= DBCR_DAC1W;
-		child->thread.debug.dac1 = (unsigned long)bp_info->addr;
-#if CONFIG_PPC_ADV_DEBUG_DVCS > 0
-		if (byte_enable) {
-			child->thread.debug.dvc1 =
-				(unsigned long)bp_info->condition_value;
-			child->thread.debug.dbcr2 |=
-				((byte_enable << DBCR2_DVC1BE_SHIFT) |
-				 (condition_mode << DBCR2_DVC1M_SHIFT));
-		}
-#endif
-#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
-	} else if (child->thread.debug.dbcr2 & DBCR2_DAC12MODE) {
-		/* Both dac1 and dac2 are part of a range */
-		return -ENOSPC;
-#endif
-	} else if ((dbcr_dac(child) & (DBCR_DAC2R | DBCR_DAC2W)) == 0) {
-		slot = 2;
-		if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
-			dbcr_dac(child) |= DBCR_DAC2R;
-		if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_WRITE)
-			dbcr_dac(child) |= DBCR_DAC2W;
-		child->thread.debug.dac2 = (unsigned long)bp_info->addr;
-#if CONFIG_PPC_ADV_DEBUG_DVCS > 0
-		if (byte_enable) {
-			child->thread.debug.dvc2 =
-				(unsigned long)bp_info->condition_value;
-			child->thread.debug.dbcr2 |=
-				((byte_enable << DBCR2_DVC2BE_SHIFT) |
-				 (condition_mode << DBCR2_DVC2M_SHIFT));
-		}
-#endif
-	} else
-		return -ENOSPC;
-	child->thread.debug.dbcr0 |= DBCR0_IDM;
-	child->thread.regs->msr |= MSR_DE;
-
-	return slot + 4;
-}
-
-static int del_dac(struct task_struct *child, int slot)
-{
-	if (slot == 1) {
-		if ((dbcr_dac(child) & (DBCR_DAC1R | DBCR_DAC1W)) == 0)
-			return -ENOENT;
-
-		child->thread.debug.dac1 = 0;
-		dbcr_dac(child) &= ~(DBCR_DAC1R | DBCR_DAC1W);
-#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
-		if (child->thread.debug.dbcr2 & DBCR2_DAC12MODE) {
-			child->thread.debug.dac2 = 0;
-			child->thread.debug.dbcr2 &= ~DBCR2_DAC12MODE;
-		}
-		child->thread.debug.dbcr2 &= ~(DBCR2_DVC1M | DBCR2_DVC1BE);
-#endif
-#if CONFIG_PPC_ADV_DEBUG_DVCS > 0
-		child->thread.debug.dvc1 = 0;
-#endif
-	} else if (slot == 2) {
-		if ((dbcr_dac(child) & (DBCR_DAC2R | DBCR_DAC2W)) == 0)
-			return -ENOENT;
-
-#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
-		if (child->thread.debug.dbcr2 & DBCR2_DAC12MODE)
-			/* Part of a range */
-			return -EINVAL;
-		child->thread.debug.dbcr2 &= ~(DBCR2_DVC2M | DBCR2_DVC2BE);
-#endif
-#if CONFIG_PPC_ADV_DEBUG_DVCS > 0
-		child->thread.debug.dvc2 = 0;
-#endif
-		child->thread.debug.dac2 = 0;
-		dbcr_dac(child) &= ~(DBCR_DAC2R | DBCR_DAC2W);
-	} else
-		return -EINVAL;
-
-	return 0;
-}
-#endif /* CONFIG_PPC_ADV_DEBUG_REGS */
-
-#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
-static int set_dac_range(struct task_struct *child,
-			 struct ppc_hw_breakpoint *bp_info)
-{
-	int mode = bp_info->addr_mode & PPC_BREAKPOINT_MODE_MASK;
-
-	/* We don't allow range watchpoints to be used with DVC */
-	if (bp_info->condition_mode)
-		return -EINVAL;
-
-	/*
-	 * Best effort to verify the address range.  The user/supervisor bits
-	 * prevent trapping in kernel space, but let's fail on an obvious bad
-	 * range.  The simple test on the mask is not fool-proof, and any
-	 * exclusive range will spill over into kernel space.
-	 */
-	if (bp_info->addr >= TASK_SIZE)
-		return -EIO;
-	if (mode == PPC_BREAKPOINT_MODE_MASK) {
-		/*
-		 * dac2 is a bitmask.  Don't allow a mask that makes a
-		 * kernel space address from a valid dac1 value
-		 */
-		if (~((unsigned long)bp_info->addr2) >= TASK_SIZE)
-			return -EIO;
-	} else {
-		/*
-		 * For range breakpoints, addr2 must also be a valid address
-		 */
-		if (bp_info->addr2 >= TASK_SIZE)
-			return -EIO;
-	}
-
-	if (child->thread.debug.dbcr0 &
-	    (DBCR0_DAC1R | DBCR0_DAC1W | DBCR0_DAC2R | DBCR0_DAC2W))
-		return -ENOSPC;
-
-	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
-		child->thread.debug.dbcr0 |= (DBCR0_DAC1R | DBCR0_IDM);
-	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_WRITE)
-		child->thread.debug.dbcr0 |= (DBCR0_DAC1W | DBCR0_IDM);
-	child->thread.debug.dac1 = bp_info->addr;
-	child->thread.debug.dac2 = bp_info->addr2;
-	if (mode == PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE)
-		child->thread.debug.dbcr2  |= DBCR2_DAC12M;
-	else if (mode == PPC_BREAKPOINT_MODE_RANGE_EXCLUSIVE)
-		child->thread.debug.dbcr2  |= DBCR2_DAC12MX;
-	else	/* PPC_BREAKPOINT_MODE_MASK */
-		child->thread.debug.dbcr2  |= DBCR2_DAC12MM;
-	child->thread.regs->msr |= MSR_DE;
-
-	return 5;
-}
-#endif /* CONFIG_PPC_ADV_DEBUG_DAC_RANGE */
-
-static long ppc_set_hwdebug(struct task_struct *child,
-		     struct ppc_hw_breakpoint *bp_info)
-{
-#ifdef CONFIG_HAVE_HW_BREAKPOINT
-	int len = 0;
-	struct thread_struct *thread = &(child->thread);
-	struct perf_event *bp;
-	struct perf_event_attr attr;
-#endif /* CONFIG_HAVE_HW_BREAKPOINT */
-#ifndef CONFIG_PPC_ADV_DEBUG_REGS
-	struct arch_hw_breakpoint brk;
-#endif
-
-	if (bp_info->version != 1)
-		return -ENOTSUPP;
-#ifdef CONFIG_PPC_ADV_DEBUG_REGS
-	/*
-	 * Check for invalid flags and combinations
-	 */
-	if ((bp_info->trigger_type == 0) ||
-	    (bp_info->trigger_type & ~(PPC_BREAKPOINT_TRIGGER_EXECUTE |
-				       PPC_BREAKPOINT_TRIGGER_RW)) ||
-	    (bp_info->addr_mode & ~PPC_BREAKPOINT_MODE_MASK) ||
-	    (bp_info->condition_mode &
-	     ~(PPC_BREAKPOINT_CONDITION_MODE |
-	       PPC_BREAKPOINT_CONDITION_BE_ALL)))
-		return -EINVAL;
-#if CONFIG_PPC_ADV_DEBUG_DVCS == 0
-	if (bp_info->condition_mode != PPC_BREAKPOINT_CONDITION_NONE)
-		return -EINVAL;
-#endif
-
-	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_EXECUTE) {
-		if ((bp_info->trigger_type != PPC_BREAKPOINT_TRIGGER_EXECUTE) ||
-		    (bp_info->condition_mode != PPC_BREAKPOINT_CONDITION_NONE))
-			return -EINVAL;
-		return set_instruction_bp(child, bp_info);
-	}
-	if (bp_info->addr_mode == PPC_BREAKPOINT_MODE_EXACT)
-		return set_dac(child, bp_info);
-
-#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
-	return set_dac_range(child, bp_info);
-#else
-	return -EINVAL;
-#endif
-#else /* !CONFIG_PPC_ADV_DEBUG_DVCS */
-	/*
-	 * We only support one data breakpoint
-	 */
-	if ((bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_RW) == 0 ||
-	    (bp_info->trigger_type & ~PPC_BREAKPOINT_TRIGGER_RW) != 0 ||
-	    bp_info->condition_mode != PPC_BREAKPOINT_CONDITION_NONE)
-		return -EINVAL;
-
-	if ((unsigned long)bp_info->addr >= TASK_SIZE)
-		return -EIO;
-
-	brk.address = bp_info->addr & ~7UL;
-	brk.type = HW_BRK_TYPE_TRANSLATE;
-	brk.len = 8;
-	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_READ)
-		brk.type |= HW_BRK_TYPE_READ;
-	if (bp_info->trigger_type & PPC_BREAKPOINT_TRIGGER_WRITE)
-		brk.type |= HW_BRK_TYPE_WRITE;
-#ifdef CONFIG_HAVE_HW_BREAKPOINT
-	/*
-	 * Check if the request is for 'range' breakpoints. We can
-	 * support it if range < 8 bytes.
-	 */
-	if (bp_info->addr_mode == PPC_BREAKPOINT_MODE_RANGE_INCLUSIVE)
-		len = bp_info->addr2 - bp_info->addr;
-	else if (bp_info->addr_mode == PPC_BREAKPOINT_MODE_EXACT)
-		len = 1;
-	else
-		return -EINVAL;
-	bp = thread->ptrace_bps[0];
-	if (bp)
-		return -ENOSPC;
-
-	/* Create a new breakpoint request if one doesn't exist already */
-	hw_breakpoint_init(&attr);
-	attr.bp_addr = (unsigned long)bp_info->addr & ~HW_BREAKPOINT_ALIGN;
-	attr.bp_len = len;
-	arch_bp_generic_fields(brk.type, &attr.bp_type);
-
-	thread->ptrace_bps[0] = bp = register_user_hw_breakpoint(&attr,
-					       ptrace_triggered, NULL, child);
-	if (IS_ERR(bp)) {
-		thread->ptrace_bps[0] = NULL;
-		return PTR_ERR(bp);
-	}
-
-	return 1;
-#endif /* CONFIG_HAVE_HW_BREAKPOINT */
-
-	if (bp_info->addr_mode != PPC_BREAKPOINT_MODE_EXACT)
-		return -EINVAL;
-
-	if (child->thread.hw_brk.address)
-		return -ENOSPC;
-
-	if (!ppc_breakpoint_available())
-		return -ENODEV;
-
-	child->thread.hw_brk = brk;
-
-	return 1;
-#endif /* !CONFIG_PPC_ADV_DEBUG_DVCS */
-}
-
-static long ppc_del_hwdebug(struct task_struct *child, long data)
-{
-#ifdef CONFIG_HAVE_HW_BREAKPOINT
-	int ret = 0;
-	struct thread_struct *thread = &(child->thread);
-	struct perf_event *bp;
-#endif /* CONFIG_HAVE_HW_BREAKPOINT */
-#ifdef CONFIG_PPC_ADV_DEBUG_REGS
-	int rc;
-
-	if (data <= 4)
-		rc = del_instruction_bp(child, (int)data);
-	else
-		rc = del_dac(child, (int)data - 4);
-
-	if (!rc) {
-		if (!DBCR_ACTIVE_EVENTS(child->thread.debug.dbcr0,
-					child->thread.debug.dbcr1)) {
-			child->thread.debug.dbcr0 &= ~DBCR0_IDM;
-			child->thread.regs->msr &= ~MSR_DE;
-		}
-	}
-	return rc;
-#else
-	if (data != 1)
-		return -EINVAL;
-
-#ifdef CONFIG_HAVE_HW_BREAKPOINT
-	bp = thread->ptrace_bps[0];
-	if (bp) {
-		unregister_hw_breakpoint(bp);
-		thread->ptrace_bps[0] = NULL;
-	} else
-		ret = -ENOENT;
-	return ret;
-#else /* CONFIG_HAVE_HW_BREAKPOINT */
-	if (child->thread.hw_brk.address == 0)
-		return -ENOENT;
-
-	child->thread.hw_brk.address = 0;
-	child->thread.hw_brk.type = 0;
-#endif /* CONFIG_HAVE_HW_BREAKPOINT */
-
-	return 0;
-#endif
-}
-
 long arch_ptrace(struct task_struct *child, long request,
 		 unsigned long addr, unsigned long data)
 {
-- 
2.13.3



