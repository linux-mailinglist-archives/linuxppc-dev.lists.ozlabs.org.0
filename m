Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2023C242924
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 14:12:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRT8g2c2pzDqbp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 22:12:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRT1g5HlNzDqZS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 22:05:59 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BRT1Z5LjtzB09ZW;
 Wed, 12 Aug 2020 14:05:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id cPcwPcRbBfl1; Wed, 12 Aug 2020 14:05:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BRT1Z4R4LzB09ZQ;
 Wed, 12 Aug 2020 14:05:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0B3998B828;
 Wed, 12 Aug 2020 14:05:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id rf84xCHalPt4; Wed, 12 Aug 2020 14:05:55 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B6E1F8B7FC;
 Wed, 12 Aug 2020 14:05:55 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9853F65C34; Wed, 12 Aug 2020 12:05:55 +0000 (UTC)
Message-Id: <a76ace7f5867a0c6e5c940b53d02024d4e9f79aa.1597233555.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597233555.git.christophe.leroy@csgroup.eu>
References: <cover.1597233555.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 04/19] powerpc/ptrace: Create ptrace_get_fpr() and
 ptrace_put_fpr()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ldv@altlinux.org, viro@zeniv.linux.org.uk
Date: Wed, 12 Aug 2020 12:05:55 +0000 (UTC)
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

On the same model as ptrace_get_reg() and ptrace_put_reg(),
create ptrace_get_fpr() and ptrace_put_fpr() to get/set
the floating points registers.

We move the boundary checkings in them.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/ptrace/Makefile      |  1 +
 arch/powerpc/kernel/ptrace/ptrace-decl.h |  4 +++
 arch/powerpc/kernel/ptrace/ptrace-fpu.c  | 40 ++++++++++++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace.c      | 38 +++++++---------------
 4 files changed, 56 insertions(+), 27 deletions(-)
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-fpu.c

diff --git a/arch/powerpc/kernel/ptrace/Makefile b/arch/powerpc/kernel/ptrace/Makefile
index c2f2402ebc8c..77abd1a5a508 100644
--- a/arch/powerpc/kernel/ptrace/Makefile
+++ b/arch/powerpc/kernel/ptrace/Makefile
@@ -6,6 +6,7 @@
 CFLAGS_ptrace-view.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
 
 obj-y				+= ptrace.o ptrace-view.o
+obj-y				+= ptrace-fpu.o
 obj-$(CONFIG_COMPAT)		+= ptrace32.o
 obj-$(CONFIG_VSX)		+= ptrace-vsx.o
 ifneq ($(CONFIG_VSX),y)
diff --git a/arch/powerpc/kernel/ptrace/ptrace-decl.h b/arch/powerpc/kernel/ptrace/ptrace-decl.h
index 2ddc68412fa8..eafe5f0f6289 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -164,6 +164,10 @@ int ptrace_put_reg(struct task_struct *task, int regno, unsigned long data);
 
 extern const struct user_regset_view user_ppc_native_view;
 
+/* ptrace-fpu */
+int ptrace_get_fpr(struct task_struct *child, int index, unsigned long *data);
+int ptrace_put_fpr(struct task_struct *child, int index, unsigned long data);
+
 /* ptrace-(no)adv */
 void ppc_gethwdinfo(struct ppc_debug_info *dbginfo);
 int ptrace_get_debugreg(struct task_struct *child, unsigned long addr,
diff --git a/arch/powerpc/kernel/ptrace/ptrace-fpu.c b/arch/powerpc/kernel/ptrace/ptrace-fpu.c
new file mode 100644
index 000000000000..8301cb52dd99
--- /dev/null
+++ b/arch/powerpc/kernel/ptrace/ptrace-fpu.c
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/regset.h>
+
+#include <asm/switch_to.h>
+
+#include "ptrace-decl.h"
+
+int ptrace_get_fpr(struct task_struct *child, int index, unsigned long *data)
+{
+	unsigned int fpidx = index - PT_FPR0;
+
+	if (index > PT_FPSCR)
+		return -EIO;
+
+	flush_fp_to_thread(child);
+	if (fpidx < (PT_FPSCR - PT_FPR0))
+		memcpy(data, &child->thread.TS_FPR(fpidx), sizeof(long));
+	else
+		*data = child->thread.fp_state.fpscr;
+
+	return 0;
+}
+
+int ptrace_put_fpr(struct task_struct *child, int index, unsigned long data)
+{
+	unsigned int fpidx = index - PT_FPR0;
+
+	if (index > PT_FPSCR)
+		return -EIO;
+
+	flush_fp_to_thread(child);
+	if (fpidx < (PT_FPSCR - PT_FPR0))
+		memcpy(&child->thread.TS_FPR(fpidx), &data, sizeof(long));
+	else
+		child->thread.fp_state.fpscr = data;
+
+	return 0;
+}
+
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 0b4645a7a1b4..3d44b73adb83 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -56,24 +56,17 @@ long arch_ptrace(struct task_struct *child, long request,
 		ret = -EIO;
 		/* convert to index and check */
 		index = addr / sizeof(long);
-		if ((addr & (sizeof(long) - 1)) || (index > PT_FPSCR) || !child->thread.regs)
+		if ((addr & (sizeof(long) - 1)) || !child->thread.regs)
 			break;
 
 		CHECK_FULL_REGS(child->thread.regs);
-		if (index < PT_FPR0) {
+		if (index < PT_FPR0)
 			ret = ptrace_get_reg(child, (int) index, &tmp);
-			if (ret)
-				break;
-		} else {
-			unsigned int fpidx = index - PT_FPR0;
-
-			flush_fp_to_thread(child);
-			if (fpidx < (PT_FPSCR - PT_FPR0))
-				memcpy(&tmp, &child->thread.TS_FPR(fpidx),
-				       sizeof(long));
-			else
-				tmp = child->thread.fp_state.fpscr;
-		}
+		else
+			ret = ptrace_get_fpr(child, index, &tmp);
+
+		if (ret)
+			break;
 		ret = put_user(tmp, datalp);
 		break;
 	}
@@ -85,23 +78,14 @@ long arch_ptrace(struct task_struct *child, long request,
 		ret = -EIO;
 		/* convert to index and check */
 		index = addr / sizeof(long);
-		if ((addr & (sizeof(long) - 1)) || (index > PT_FPSCR) || !child->thread.regs)
+		if ((addr & (sizeof(long) - 1)) || !child->thread.regs)
 			break;
 
 		CHECK_FULL_REGS(child->thread.regs);
-		if (index < PT_FPR0) {
+		if (index < PT_FPR0)
 			ret = ptrace_put_reg(child, index, data);
-		} else {
-			unsigned int fpidx = index - PT_FPR0;
-
-			flush_fp_to_thread(child);
-			if (fpidx < (PT_FPSCR - PT_FPR0))
-				memcpy(&child->thread.TS_FPR(fpidx), &data,
-				       sizeof(long));
-			else
-				child->thread.fp_state.fpscr = data;
-			ret = 0;
-		}
+		else
+			ret = ptrace_put_fpr(child, index, data);
 		break;
 	}
 
-- 
2.25.0

