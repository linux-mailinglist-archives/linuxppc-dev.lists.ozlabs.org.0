Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CC091A7C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 15:22:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HLTI4jDt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8zkL3VPqz3cY3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 23:22:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HLTI4jDt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8zjd6MkJz3cQL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 23:21:25 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45RCv9Rw008736;
	Thu, 27 Jun 2024 13:21:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=XumVNRUYbdSOYKH2okpTxkK+ei
	s8oq0jKzcK8NxA0QE=; b=HLTI4jDt7OuOTER/J452OtUc7zpMazR/2kmI2i896d
	D+RxX9jxkbC2BW5h5un9zz9G6gaOTKj8AxLRTmzjLUW6A80A6cVApKNjFPwlSfGo
	t9VlqKI0kHw5iYaeEIHLZZcwk4Rp2GNwPD5u7+p5ge+zsDIUmBkHM7bpfB9BgkGh
	Ozl46EW4UV+GByAXAWq3gJbCy9Myqp1BrsuQgxJnQvpgNs8zawgG20cjcYnXanHN
	3dCiLHzT8PeLglXMovt81XaldqmtfwvvkHx57IaNGFj+oI62UIUA/XzrO+Leoc5f
	OzBQDHDcEUvQWWq+hJ7roINIZ6RM57PxUbGu5skYaSQw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4014ks8p40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 13:21:11 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 45RDLBsb015646;
	Thu, 27 Jun 2024 13:21:11 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4014ks8p3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 13:21:11 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45R9p6XH000388;
	Thu, 27 Jun 2024 13:21:10 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yxbn3jg61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Jun 2024 13:21:10 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45RDL6Kx46399882
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2024 13:21:08 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A461920049;
	Thu, 27 Jun 2024 13:21:06 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 926C220040;
	Thu, 27 Jun 2024 13:21:05 +0000 (GMT)
Received: from ltcden3-lp14.aus.stglabs.ibm.com (unknown [9.53.174.165])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 27 Jun 2024 13:21:05 +0000 (GMT)
From: Abhishek Dubey <adubey@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] PowerPC: Replace kretprobe with rethook
Date: Thu, 27 Jun 2024 09:21:01 -0400
Message-ID: <20240627132101.405665-1-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G9MVeOemlIhPV2V7xTfrZjsw14ZEMCD-
X-Proofpoint-ORIG-GUID: IXfpC4MKHNK8isqHAfjqYJ9bgooxAP2e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_08,2024-06-27_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406270097
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
Replace kretprobe with rethook on x86") to PowerPC.

Replaces the kretprobe code with rethook on Power. With this patch,
kretprobe on Power uses the rethook instead of kretprobe specific
trampoline code.

Reference to other archs:
commit b57c2f124098 ("riscv: add riscv rethook implementation")
commit 7b0a096436c2 ("LoongArch: Replace kretprobe with rethook")

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---

Changes in v3:
* Fixing return address moved to arch_rethook_fixup_return()
* Addressed other minor comments
* show_stack mods to show correct fn name to go in separate patch
---
 arch/powerpc/Kconfig             |  1 +
 arch/powerpc/kernel/Makefile     |  1 +
 arch/powerpc/kernel/kprobes.c    | 65 +--------------------------
 arch/powerpc/kernel/optprobes.c  |  2 +-
 arch/powerpc/kernel/rethook.c    | 77 ++++++++++++++++++++++++++++++++
 arch/powerpc/kernel/stacktrace.c |  6 ++-
 6 files changed, 85 insertions(+), 67 deletions(-)
 create mode 100644 arch/powerpc/kernel/rethook.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c88c6d46a5bc..fa0b1ab3f935 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -270,6 +270,7 @@ config PPC
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
+	select HAVE_RETHOOK
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 8585d03c02d3..7dd1b523b17f 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -140,6 +140,7 @@ obj-$(CONFIG_KPROBES)		+= kprobes.o
 obj-$(CONFIG_OPTPROBES)		+= optprobes.o optprobes_head.o
 obj-$(CONFIG_KPROBES_ON_FTRACE)	+= kprobes-ftrace.o
 obj-$(CONFIG_UPROBES)		+= uprobes.o
+obj-$(CONFIG_RETHOOK)           += rethook.o
 obj-$(CONFIG_PPC_UDBG_16550)	+= legacy_serial.o udbg_16550.o
 obj-$(CONFIG_SWIOTLB)		+= dma-swiotlb.o
 obj-$(CONFIG_ARCH_HAS_DMA_SET_MASK) += dma-mask.o
diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
index 14c5ddec3056..f8aa91bc3b17 100644
--- a/arch/powerpc/kernel/kprobes.c
+++ b/arch/powerpc/kernel/kprobes.c
@@ -228,16 +228,6 @@ static nokprobe_inline void set_current_kprobe(struct kprobe *p, struct pt_regs
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
@@ -394,49 +384,6 @@ int kprobe_handler(struct pt_regs *regs)
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
@@ -539,19 +486,9 @@ int kprobe_fault_handler(struct pt_regs *regs, int trapnr)
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
index 000000000000..d2453793ea5d
--- /dev/null
+++ b/arch/powerpc/kernel/rethook.c
@@ -0,0 +1,77 @@
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
+	rethook_trampoline_handler(regs, orig_ret_address);
+	return 0;
+}
+NOKPROBE_SYMBOL(trampoline_rethook_handler);
+
+void arch_rethook_prepare(struct rethook_node *rh, struct pt_regs *regs, bool mcount)
+{
+	rh->ret_addr = regs->link;
+	rh->frame = regs->gpr[1];
+
+	/* Replace the return addr with trampoline addr */
+	regs->link = (unsigned long)arch_rethook_trampoline;
+}
+NOKPROBE_SYMBOL(arch_rethook_prepare);
+
+/* This is called from rethook_trampoline_handler(). */
+void arch_rethook_fixup_return(struct pt_regs *regs, unsigned long orig_ret_address)
+{
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
+}
+NOKPROBE_SYMBOL(arch_rethook_fixup_return);
+
+static struct kprobe trampoline_p = {
+	.addr = (kprobe_opcode_t *) &arch_rethook_trampoline,
+	.pre_handler = trampoline_rethook_handler
+};
+
+/* rethook initializer */
+int __init arch_init_kprobes(void)
+{
+	return register_kprobe(&trampoline_p);
+}
diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
index e6a958a5da27..90882b5175cd 100644
--- a/arch/powerpc/kernel/stacktrace.c
+++ b/arch/powerpc/kernel/stacktrace.c
@@ -21,6 +21,7 @@
 #include <asm/processor.h>
 #include <linux/ftrace.h>
 #include <asm/kprobes.h>
+#include <linux/rethook.h>
 
 #include <asm/paca.h>
 
@@ -133,12 +134,13 @@ int __no_sanitize_address arch_stack_walk_reliable(stack_trace_consume_fn consum
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
+#ifdef CONFIG_RETHOOK
+		if (ip == (unsigned long)arch_rethook_trampoline)
 			return -EINVAL;
 #endif
 
-- 
2.44.0

