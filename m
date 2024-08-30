Return-Path: <linuxppc-dev+bounces-807-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2569660CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 13:32:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwGG55lm0z309h;
	Fri, 30 Aug 2024 21:32:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725017533;
	cv=none; b=TbjJ94ikFFMQTJne+lXw/jF6MwZrSnunIJDDaWowdiQJH5h661pZ2BnsDhIa01iMiB6Y5fo9Glv0n3harnqI+ak9vMvAcQjaj+cQF+021PcbfNpbai/NRfAb3UOGBvUnQ4bGQS2Q2cYXsK7/UHsR5jLh2Cf88HfqWCSa1gH8yhkMe9RhgSULBelyuVf3ejMsCNCpoYbiVDdgz92BH4SzKD+lFokIMm4e/eMQpvJeqAB2uCvSIFezGkX7PHbPU5GWTag39AGlKYyhI+yfeos/1WPuiN99270jalykhtm+2Y9NtmlQF/aqe0wjz7F9U6tHeta0K+H2NaOFYwnBYp7wjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725017533; c=relaxed/relaxed;
	bh=yXZKztjgv9qKJyP7XRqG92pJbCD5IyljeB3zlOeX+bw=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:
	 Received:Received:Received:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:X-TM-AS-GCONF:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:Content-Transfer-Encoding:X-Proofpoint-UnRewURL:
	 MIME-Version:X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	b=KluKdbMX85SNuN737sG88EsJBhhO9lU691hS4NL+ceOuOBRQt94/96aaE/RtZ1E2R+sz+PTRtv9FuMqquEweuyVOFuwf+8DKP12OT80abjc7D46sGvQytOKPvwytl1fTlRLpz9r50/h2BABQoISaxg5leaAYpc4B0ZJ464i/ykx6gbPJPerqCLifUeU4mcU4Gg9auXW5TJ5AaUlhWxeT60tiyVddeLgLd170RENB3GM/itDritVZPWcdhyaNjCrjOVayyUdRjn1vqIQaC5O7XXz6xKsMMiSc0iBA0mr9Nw+lRraiDvJn9WscB3wtyBcTFCXyVgMpIK7SQ3Zf4Zx0gQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jwd3/+zj; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jwd3/+zj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwGG45471z309W
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 21:32:11 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47U3hkgV017461;
	Fri, 30 Aug 2024 11:31:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-transfer-encoding
	:mime-version; s=pp1; bh=yXZKztjgv9qKJyP7XRqG92pJbCD5IyljeB3zlOe
	X+bw=; b=Jwd3/+zj6zwmbkBUQLD0oVB5XVLVzQ96gO3CoKjk42tlpITAbE8TYeb
	m6iMozXN2L/rQMCa/y3KJhw89bJesHHnyHgF6qDvMF77n85djr4tI62tnTyjMgWs
	T1xElC/knj7FFKwWJkxsh6DiKaxRRnVs+rfHsFuvmYGJE35bLx4lHrTBYBHwNysW
	eBTQ8I/CbLOq+owUBak7HFDapV1oFJ0qtY9MWlwkQDlYniglD4ot9TQvX/Gf2J4B
	kzM4TOKY14Y2hQRKM5Fw1ylFqCt9eZGw+SGiR7zqUUGxiQzzNUciecguemz4pDXs
	gFmZkosk76qaKDAOC/pHwYIURSHsohg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8py202-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 11:31:56 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47UBUcG1004045;
	Fri, 30 Aug 2024 11:31:55 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 419q8py1yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 11:31:55 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47UAeQkq021761;
	Fri, 30 Aug 2024 11:31:54 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 417suuup65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Aug 2024 11:31:54 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47UBVmfA54067570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Aug 2024 11:31:48 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3317720040;
	Fri, 30 Aug 2024 11:31:48 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD35220043;
	Fri, 30 Aug 2024 11:31:46 +0000 (GMT)
Received: from ltcden3-lp14.aus.stglabs.ibm.com (unknown [9.53.174.165])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 30 Aug 2024 11:31:46 +0000 (GMT)
From: Abhishek Dubey <adubey@linux.ibm.com>
To: ltc-india-dev@lists.linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: naveen@kernel.org, hbathini@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, mhiramat@kernel.org, bpf@vger.kernel.org,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH v4 RESEND] powerpc: Replace kretprobe code with rethook on powerpc
Date: Fri, 30 Aug 2024 07:31:31 -0400
Message-ID: <20240830113131.7597-1-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IlP7anRbAkGYa1A7UTWVqYbBHDOMi9_C
X-Proofpoint-GUID: V8_3WMVZFLK-4n-wnrWCXHYkx7_y2Xtb
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-30_06,2024-08-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 clxscore=1011 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408300083

This is an adaptation of commit f3a112c0c40d ("x86,rethook,kprobes:
Replace kretprobe with rethook on x86") to powerpc.

Rethook follows the existing kretprobe implementation, but separates
it from kprobes so that it can be used by fprobe (ftrace-based
function entry/exit probes). As such, this patch also enables fprobe
to work on powerpc. The only other change compared to the existing
kretprobe implementation is doing the return address fixup in
arch_rethook_fixup_return().

Reference to other archs:
commit b57c2f124098 ("riscv: add riscv rethook implementation")
commit 7b0a096436c2 ("LoongArch: Replace kretprobe with rethook")

Note:
=====

In future, rethook will be only for kretprobe, and kretprobe
will be replaced by fprobe.

https://lore.kernel.org/all/172000134410.63468.13742222887213469474.stgit@devnote2/

We will	adapt the above	implementation for powerpc once its upstream.
Until then, we can have	this implementation of rethook to serve
current	kretprobe usecases.

Reviewed-by: Naveen Rao <naveen@kernel.org>
Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/Kconfig             |  1 +
 arch/powerpc/kernel/Makefile     |  1 +
 arch/powerpc/kernel/kprobes.c    | 65 +---------------------------
 arch/powerpc/kernel/optprobes.c  |  2 +-
 arch/powerpc/kernel/rethook.c    | 73 ++++++++++++++++++++++++++++++++
 arch/powerpc/kernel/stacktrace.c |  6 ++-
 6 files changed, 81 insertions(+), 67 deletions(-)
 create mode 100644 arch/powerpc/kernel/rethook.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d7b09b064a8a..dfe87c2f4872 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -269,6 +269,7 @@ config PPC
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
+	select HAVE_RETHOOK			if KPROBES
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 1784b6a6ca1d..f43c1198768c 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -139,6 +139,7 @@ obj-$(CONFIG_KPROBES)		+= kprobes.o
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
index 000000000000..5f5f47ae82cf
--- /dev/null
+++ b/arch/powerpc/kernel/rethook.c
@@ -0,0 +1,73 @@
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
+	return !rethook_trampoline_handler(regs, regs->gpr[1]);
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
+	 * arch_rethook_trampoline jumps back to the right instruction.
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


