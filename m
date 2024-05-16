Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BDA8C77EA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 15:48:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=elos5Wel;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VgBHk0Qhlz3fqx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2024 23:48:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=elos5Wel;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VgBGx3j0wz3cWt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2024 23:47:21 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44GDV530013168;
	Thu, 16 May 2024 13:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=6gaHarKIAbMz1pB27OcpCN1bLSWvb3+9V93Mf0WBqtI=;
 b=elos5WelvGU+TKWZwZ9ZZbg/G4blMaoqw9Iotfr8H/qB73cB4EL4DCN8KY9LUXve+Gi4
 VypDg4knw5HL+uQBjPO/ovh0P12zSGylD8VdBjaG7p87uXrb4oj0Dw+QP1DKRAzdi0+0
 gYOD9h++KsgG2fdlyUqmyCk78WjEVPSz0tV/iLimsjuxl8gJgrzD5as0VnKQh6M+GDEC
 HwoolpNs7iMxsQknis8xRwsX0Z56srMRq1mBvHP1fYA0R4pI2B/NcrZOi2g+ZreWUtwd
 5QPFFCAcF1Wwj+rwpnmZU6NrbCaJ3lvfgE5eHvnCQcRATj4J3lIWV0FqGip9enwQ+kgW EA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5jny041f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 13:47:14 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44GDlDDZ011597;
	Thu, 16 May 2024 13:47:13 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y5jny041d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 13:47:13 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44GAesm8020460;
	Thu, 16 May 2024 13:47:12 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y2kd0ack4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 13:47:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44GDl8S711731410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 May 2024 13:47:10 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 385B120043;
	Thu, 16 May 2024 13:47:08 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28D8820040;
	Thu, 16 May 2024 13:47:07 +0000 (GMT)
Received: from ltcden3-lp14.aus.stglabs.ibm.com (unknown [9.53.174.165])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2024 13:47:06 +0000 (GMT)
From: Abhishek Dubey <adubey@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] PowerPC: Replace kretprobe with rethook
Date: Thu, 16 May 2024 09:46:46 -0400
Message-ID: <20240516134646.1059114-1-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Rpc9VwVyKlTEX2eFNvEPV3S5iawQZbZS
X-Proofpoint-ORIG-GUID: MkcM4OqAfzQyHRgRJa-EE24ncfrNNhJp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 bulkscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=995 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405160097
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
Cc: naveen.n.rao@linux.vnet.ibm.com, mhiramat@kernel.org, npiggin@gmail.com, Abhishek Dubey <adubey@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an adaptation of commit f3a112c0c40d ("x86,rethook,kprobes:
Replace kretprobe with rethook on x86") to Power.

Replaces the kretprobe code with rethook on Power. With this patch,
kretprobe on Power uses the rethook instead of kretprobe specific
trampoline code.

Reference to other archs:
commit b57c2f124098 ("riscv: add riscv rethook implementation")
commit 7b0a096436c2 ("LoongArch: Replace kretprobe with rethook")

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/Kconfig             |  1 +
 arch/powerpc/kernel/Makefile     |  1 +
 arch/powerpc/kernel/kprobes.c    | 65 +----------------------------
 arch/powerpc/kernel/optprobes.c  |  2 +-
 arch/powerpc/kernel/rethook.c    | 71 ++++++++++++++++++++++++++++++++
 arch/powerpc/kernel/stacktrace.c |  6 +--
 include/linux/rethook.h          |  1 -
 7 files changed, 78 insertions(+), 69 deletions(-)
 create mode 100644 arch/powerpc/kernel/rethook.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1c4be3373686..108de491965a 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -268,6 +268,7 @@ config PPC
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
+	select HAVE_RETHOOK
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index d3282fbea4f2..181d764be3a6 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -142,6 +142,7 @@ obj-$(CONFIG_KPROBES)		+= kprobes.o
 obj-$(CONFIG_OPTPROBES)		+= optprobes.o optprobes_head.o
 obj-$(CONFIG_KPROBES_ON_FTRACE)	+= kprobes-ftrace.o
 obj-$(CONFIG_UPROBES)		+= uprobes.o
+obj-$(CONFIG_RETHOOK)           += rethook.o
 obj-$(CONFIG_PPC_UDBG_16550)	+= legacy_serial.o udbg_16550.o
 obj-$(CONFIG_SWIOTLB)		+= dma-swiotlb.o
 obj-$(CONFIG_ARCH_HAS_DMA_SET_MASK) += dma-mask.o
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index bbca90a5e2ec..614bb68ad0e6 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -248,16 +248,6 @@ static nokprobe_inline void set_current_kprobe(struct kprobe *p, struct pt_regs
 	kcb->kprobe_saved_msr = regs->msr;
 }
 
-void arch_prepare_kretprobe(struct kretprobe_instance *ri, struct pt_regs *regs)
-{
-	ri->ret_addr = (kprobe_opcode_t *)regs->link;
-	ri->fp = NULL;
-
-	/* Replace the return addr with trampoline addr */
-	regs->link = (unsigned long)__kretprobe_trampoline;
-}
-NOKPROBE_SYMBOL(arch_prepare_kretprobe);
-
 static int try_to_emulate(struct kprobe *p, struct pt_regs *regs)
 {
 	int ret;
@@ -414,49 +404,6 @@ int kprobe_handler(struct pt_regs *regs)
 }
 NOKPROBE_SYMBOL(kprobe_handler);
 
-/*
- * Function return probe trampoline:
- * 	- init_kprobes() establishes a probepoint here
- * 	- When the probed function returns, this probe
- * 		causes the handlers to fire
- */
-asm(".global __kretprobe_trampoline\n"
-	".type __kretprobe_trampoline, @function\n"
-	"__kretprobe_trampoline:\n"
-	"nop\n"
-	"blr\n"
-	".size __kretprobe_trampoline, .-__kretprobe_trampoline\n");
-
-/*
- * Called when the probe at kretprobe trampoline is hit
- */
-static int trampoline_probe_handler(struct kprobe *p, struct pt_regs *regs)
-{
-	unsigned long orig_ret_address;
-
-	orig_ret_address = __kretprobe_trampoline_handler(regs, NULL);
-	/*
-	 * We get here through one of two paths:
-	 * 1. by taking a trap -> kprobe_handler() -> here
-	 * 2. by optprobe branch -> optimized_callback() -> opt_pre_handler() -> here
-	 *
-	 * When going back through (1), we need regs->nip to be setup properly
-	 * as it is used to determine the return address from the trap.
-	 * For (2), since nip is not honoured with optprobes, we instead setup
-	 * the link register properly so that the subsequent 'blr' in
-	 * __kretprobe_trampoline jumps back to the right instruction.
-	 *
-	 * For nip, we should set the address to the previous instruction since
-	 * we end up emulating it in kprobe_handler(), which increments the nip
-	 * again.
-	 */
-	regs_set_return_ip(regs, orig_ret_address - 4);
-	regs->link = orig_ret_address;
-
-	return 0;
-}
-NOKPROBE_SYMBOL(trampoline_probe_handler);
-
 /*
  * Called after single-stepping.  p->addr is the address of the
  * instruction whose first byte has been replaced by the "breakpoint"
@@ -559,19 +506,9 @@ int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
 }
 NOKPROBE_SYMBOL(kprobe_fault_handler);
 
-static struct kprobe trampoline_p = {
-	.addr = (kprobe_opcode_t *) &__kretprobe_trampoline,
-	.pre_handler = trampoline_probe_handler
-};
-
-int __init arch_init_kprobes(void)
-{
-	return register_kprobe(&trampoline_p);
-}
-
 int arch_trampoline_kprobe(struct kprobe *p)
 {
-	if (p->addr == (kprobe_opcode_t *)&__kretprobe_trampoline)
+	if (p->addr == (kprobe_opcode_t *)&arch_rethook_trampoline)
 		return 1;
 
 	return 0;
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 004fae2044a3..c0b351d61058 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -56,7 +56,7 @@ static unsigned long can_optimize(struct kprobe *p)
 	 * has a 'nop' instruction, which can be emulated.
 	 * So further checks can be skipped.
 	 */
-	if (p->addr == (kprobe_opcode_t *)&__kretprobe_trampoline)
+	if (p->addr == (kprobe_opcode_t *)&arch_rethook_trampoline)
 		return addr + sizeof(kprobe_opcode_t);
 
 	/*
diff --git a/arch/powerpc/kernel/rethook.c b/arch/powerpc/kernel/rethook.c
new file mode 100644
index 000000000000..7386f602c9ab
--- /dev/null
+++ b/arch/powerpc/kernel/rethook.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * PowerPC implementation of rethook. This depends on kprobes.
+ */
+
+#include <linux/kprobes.h>
+#include <linux/rethook.h>
+
+/*
+ * Function return trampoline:
+ *     - init_kprobes() establishes a probepoint here
+ *     - When the probed function returns, this probe
+ *         causes the handlers to fire
+ */
+asm(".global arch_rethook_trampoline\n"
+	".type arch_rethook_trampoline, @function\n"
+	"arch_rethook_trampoline:\n"
+	"nop\n"
+	"blr\n"
+	".size arch_rethook_trampoline, .-arch_rethook_trampoline\n");
+
+/*
+ * Called when the probe at kretprobe trampoline is hit
+ */
+static int trampoline_rethook_handler(struct kprobe *p, struct pt_regs *regs)
+{
+	unsigned long orig_ret_address;
+
+	orig_ret_address = rethook_trampoline_handler(regs, 0);
+	/*
+	 * We get here through one of two paths:
+	 * 1. by taking a trap -> kprobe_handler() -> here
+	 * 2. by optprobe branch -> optimized_callback() -> opt_pre_handler() -> here
+	 *
+	 * When going back through (1), we need regs->nip to be setup properly
+	 * as it is used to determine the return address from the trap.
+	 * For (2), since nip is not honoured with optprobes, we instead setup
+	 * the link register properly so that the subsequent 'blr' in
+	 * __kretprobe_trampoline jumps back to the right instruction.
+	 *
+	 * For nip, we should set the address to the previous instruction since
+	 * we end up emulating it in kprobe_handler(), which increments the nip
+	 * again.
+	 */
+	regs_set_return_ip(regs, orig_ret_address - 4);
+	regs->link = orig_ret_address;
+
+	return 0;
+}
+NOKPROBE_SYMBOL(trampoline_rethook_handler);
+
+void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
+{
+	rh->ret_addr = regs->link;
+	rh->frame = 0;
+
+	/* Replace the return addr with trampoline addr */
+	regs->link = (unsigned long)arch_rethook_trampoline;
+}
+NOKPROBE_SYMBOL(arch_rethook_prepare);
+
+static struct kprobe trampoline_p = {
+	.addr = (kprobe_opcode_t *) &arch_rethook_trampoline,
+	.pre_handler = trampoline_rethook_handler
+};
+
+/* rethook initializer */
+int arch_init_kprobes(void)
+{
+	return register_kprobe(&trampoline_p);
+}
diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index e6a958a5da27..6de912cf198c 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -21,6 +21,7 @@
 #include <asm/processor.h>
 #include <linux/ftrace.h>
 #include <asm/kprobes.h>
+#include <linux/rethook.h>
 
 #include <asm/paca.h>
 
@@ -133,14 +134,13 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
 		 * arch-dependent code, they are generic.
 		 */
 		ip = ftrace_graph_ret_addr(task, &graph_idx, ip, stack);
-#ifdef CONFIG_KPROBES
+
 		/*
 		 * Mark stacktraces with kretprobed functions on them
 		 * as unreliable.
 		 */
-		if (ip == (unsigned long)__kretprobe_trampoline)
+		if (ip == (unsigned long)arch_rethook_trampoline)
 			return -EINVAL;
-#endif
 
 		if (!consume_entry(cookie, ip))
 			return -EINVAL;
diff --git a/include/linux/rethook.h b/include/linux/rethook.h
index ba60962805f6..9f2fb6abdc60 100644
--- a/include/linux/rethook.h
+++ b/include/linux/rethook.h
@@ -65,7 +65,6 @@ void rethook_recycle(struct rethook_node *node);
 void rethook_hook(struct rethook_node *node, struct pt_regs *regs, bool mcount);
 unsigned long rethook_find_ret_addr(struct task_struct *tsk, unsigned long frame,
 				    struct llist_node **cur);
-
 /* Arch dependent code must implement arch_* and trampoline code */
 void arch_rethook_prepare(struct rethook_node *node, struct pt_regs *regs, bool mcount);
 void arch_rethook_trampoline(void);
-- 
2.44.0

