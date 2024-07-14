Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 187D0930941
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 10:33:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PcI1piYa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMJWw61bZz3cXd
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 18:33:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PcI1piYa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMJQp1PtWz3cfn
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 18:29:22 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 633FF60B4E;
	Sun, 14 Jul 2024 08:29:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76279C4AF09;
	Sun, 14 Jul 2024 08:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720945760;
	bh=u9jgla6YbJDeyFGkMjt0JK9jjbDJbcx+QV5+4gHm0hc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PcI1piYakO5jIXRHsyUWUmAt0rINQfbMsa2lH8SuH3XdNYLhPpwg8KMtrL89RHVdA
	 ZVjtQFqmXQECfrEBbbSwmi3YuvDNKQGVrpEdvj+JE6Y4coSo18Ac/exrhAMepSGOwW
	 1VmN3wPcSNpN0xLLGxL2zXPvC2VHjlDKJBds5L8AkUXkG/0abGZC/ZHWU7VHrb86lI
	 w7RW4hlpGBj9Xy6D+IzJWsPW5U51KX4ec96PryNONYGulLkeXp+NmvArXlEMCy06nB
	 bMPDCDoRmh7Xb+D9mypH7fUj9/ShZTtctVUYLqwv0/nmMy34COJv0ZAYdIHDvYI97U
	 hA2kXSEvg/8zA==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>,
	<linux-trace-kernel@vger.kernel.org>,
	<bpf@vger.kernel.org>,
	linux-kbuild@vger.kernel.org,
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH v4 16/17] samples/ftrace: Add support for ftrace direct samples on powerpc
Date: Sun, 14 Jul 2024 13:57:52 +0530
Message-ID: <1ecbd80f9d91dcf1f3a283a14fce7d3c3a0a0f71.1720942106.git.naveen@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720942106.git.naveen@kernel.org>
References: <cover.1720942106.git.naveen@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>, Daniel Borkmann <daniel@iogearbox.net>, Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Andrii Nakryiko <andrii@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Vishal Chourasia <vishalc@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add powerpc 32-bit and 64-bit samples for ftrace direct. This serves to
show the sample instruction sequence to be used by ftrace direct calls
to adhere to the ftrace ABI.

On 64-bit powerpc, TOC setup requires some additional work.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/Kconfig                        |   2 +
 samples/ftrace/ftrace-direct-modify.c       |  85 +++++++++++++++-
 samples/ftrace/ftrace-direct-multi-modify.c | 101 +++++++++++++++++++-
 samples/ftrace/ftrace-direct-multi.c        |  79 ++++++++++++++-
 samples/ftrace/ftrace-direct-too.c          |  83 +++++++++++++++-
 samples/ftrace/ftrace-direct.c              |  69 ++++++++++++-
 6 files changed, 414 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 29aab3770415..f6ff44acf112 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -275,6 +275,8 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
+	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
diff --git a/samples/ftrace/ftrace-direct-modify.c b/samples/ftrace/ftrace-direct-modify.c
index 81220390851a..cfea7a38befb 100644
--- a/samples/ftrace/ftrace-direct-modify.c
+++ b/samples/ftrace/ftrace-direct-modify.c
@@ -2,7 +2,7 @@
 #include <linux/module.h>
 #include <linux/kthread.h>
 #include <linux/ftrace.h>
-#ifndef CONFIG_ARM64
+#if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
 
@@ -199,6 +199,89 @@ asm (
 
 #endif /* CONFIG_LOONGARCH */
 
+#ifdef CONFIG_PPC
+#include <asm/ppc_asm.h>
+
+#ifdef CONFIG_PPC64
+#define STACK_FRAME_SIZE 48
+#else
+#define STACK_FRAME_SIZE 24
+#endif
+
+#if defined(CONFIG_PPC64_ELF_ABI_V2) && !defined(CONFIG_PPC_KERNEL_PCREL)
+#define PPC64_TOC_SAVE_AND_UPDATE			\
+"	std		2, 24(1)\n"			\
+"	bcl		20, 31, 1f\n"			\
+"   1:	mflr		12\n"				\
+"	ld		2, (99f - 1b)(12)\n"
+#define PPC64_TOC_RESTORE				\
+"	ld		2, 24(1)\n"
+#define PPC64_TOC					\
+"   99:	.quad		.TOC.@tocbase\n"
+#else
+#define PPC64_TOC_SAVE_AND_UPDATE ""
+#define PPC64_TOC_RESTORE ""
+#define PPC64_TOC ""
+#endif
+
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtlr		0\n"
+#define PPC_FTRACE_RET					\
+"	blr\n"
+#else
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtctr		0\n"
+#define PPC_FTRACE_RET					\
+"	mtlr		0\n"				\
+"	bctr\n"
+#endif
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp1, @function\n"
+"	.globl		my_tramp1\n"
+"   my_tramp1:\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mflr		0\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_SIZE)"(1)\n"
+	PPC64_TOC_SAVE_AND_UPDATE
+"	bl		my_direct_func1\n"
+	PPC64_TOC_RESTORE
+"	addi		1, 1, "__stringify(STACK_FRAME_SIZE)"\n"
+	PPC_FTRACE_RESTORE_LR
+"	addi		1, 1, "__stringify(STACK_FRAME_MIN_SIZE)"\n"
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_FTRACE_RET
+"	.size		my_tramp1, .-my_tramp1\n"
+
+"	.type		my_tramp2, @function\n"
+"	.globl		my_tramp2\n"
+"   my_tramp2:\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mflr		0\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_SIZE)"(1)\n"
+	PPC64_TOC_SAVE_AND_UPDATE
+"	bl		my_direct_func2\n"
+	PPC64_TOC_RESTORE
+"	addi		1, 1, "__stringify(STACK_FRAME_SIZE)"\n"
+	PPC_FTRACE_RESTORE_LR
+"	addi		1, 1, "__stringify(STACK_FRAME_MIN_SIZE)"\n"
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_FTRACE_RET
+	PPC64_TOC
+"	.size		my_tramp2, .-my_tramp2\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC */
+
 static struct ftrace_ops direct;
 
 static unsigned long my_tramp = (unsigned long)my_tramp1;
diff --git a/samples/ftrace/ftrace-direct-multi-modify.c b/samples/ftrace/ftrace-direct-multi-modify.c
index f943e40d57fd..8f7986d698d8 100644
--- a/samples/ftrace/ftrace-direct-multi-modify.c
+++ b/samples/ftrace/ftrace-direct-multi-modify.c
@@ -2,7 +2,7 @@
 #include <linux/module.h>
 #include <linux/kthread.h>
 #include <linux/ftrace.h>
-#ifndef CONFIG_ARM64
+#if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
 
@@ -225,6 +225,105 @@ asm (
 
 #endif /* CONFIG_LOONGARCH */
 
+#ifdef CONFIG_PPC
+#include <asm/ppc_asm.h>
+
+#ifdef CONFIG_PPC64
+#define STACK_FRAME_SIZE 48
+#else
+#define STACK_FRAME_SIZE 24
+#endif
+
+#if defined(CONFIG_PPC64_ELF_ABI_V2) && !defined(CONFIG_PPC_KERNEL_PCREL)
+#define PPC64_TOC_SAVE_AND_UPDATE			\
+"	std		2, 24(1)\n"			\
+"	bcl		20, 31, 1f\n"			\
+"   1:	mflr		12\n"				\
+"	ld		2, (99f - 1b)(12)\n"
+#define PPC64_TOC_RESTORE				\
+"	ld		2, 24(1)\n"
+#define PPC64_TOC					\
+"   99:	.quad		.TOC.@tocbase\n"
+#else
+#define PPC64_TOC_SAVE_AND_UPDATE ""
+#define PPC64_TOC_RESTORE ""
+#define PPC64_TOC ""
+#endif
+
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtlr		0\n"
+#define PPC_FTRACE_RET					\
+"	blr\n"
+#define PPC_FTRACE_RECOVER_IP				\
+"	lwz		8, 4(3)\n"			\
+"	li		9, 6\n"				\
+"	slw		8, 8, 9\n"			\
+"	sraw		8, 8, 9\n"			\
+"	add		3, 3, 8\n"			\
+"	addi		3, 3, 4\n"
+#else
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtctr		0\n"
+#define PPC_FTRACE_RET					\
+"	mtlr		0\n"				\
+"	bctr\n"
+#define PPC_FTRACE_RECOVER_IP ""
+#endif
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp1, @function\n"
+"	.globl		my_tramp1\n"
+"   my_tramp1:\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mflr		0\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_SIZE)"(1)\n"
+	PPC64_TOC_SAVE_AND_UPDATE
+	PPC_STL"	3, "__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mr		3, 0\n"
+	PPC_FTRACE_RECOVER_IP
+"	bl		my_direct_func1\n"
+	PPC_LL"		3, "__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+	PPC64_TOC_RESTORE
+"	addi		1, 1, "__stringify(STACK_FRAME_SIZE)"\n"
+	PPC_FTRACE_RESTORE_LR
+"	addi		1, 1, "__stringify(STACK_FRAME_MIN_SIZE)"\n"
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_FTRACE_RET
+"	.size		my_tramp1, .-my_tramp1\n"
+
+"	.type		my_tramp2, @function\n"
+"	.globl		my_tramp2\n"
+"   my_tramp2:\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mflr		0\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_SIZE)"(1)\n"
+	PPC64_TOC_SAVE_AND_UPDATE
+	PPC_STL"	3, "__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mr		3, 0\n"
+	PPC_FTRACE_RECOVER_IP
+"	bl		my_direct_func2\n"
+	PPC_LL"		3, "__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+	PPC64_TOC_RESTORE
+"	addi		1, 1, "__stringify(STACK_FRAME_SIZE)"\n"
+	PPC_FTRACE_RESTORE_LR
+"	addi		1, 1, "__stringify(STACK_FRAME_MIN_SIZE)"\n"
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_FTRACE_RET
+	PPC64_TOC
+	"	.size		my_tramp2, .-my_tramp2\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC */
+
 static unsigned long my_tramp = (unsigned long)my_tramp1;
 static unsigned long tramps[2] = {
 	(unsigned long)my_tramp1,
diff --git a/samples/ftrace/ftrace-direct-multi.c b/samples/ftrace/ftrace-direct-multi.c
index aed6df2927ce..db326c81a27d 100644
--- a/samples/ftrace/ftrace-direct-multi.c
+++ b/samples/ftrace/ftrace-direct-multi.c
@@ -4,7 +4,7 @@
 #include <linux/mm.h> /* for handle_mm_fault() */
 #include <linux/ftrace.h>
 #include <linux/sched/stat.h>
-#ifndef CONFIG_ARM64
+#if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
 
@@ -141,6 +141,83 @@ asm (
 
 #endif /* CONFIG_LOONGARCH */
 
+#ifdef CONFIG_PPC
+#include <asm/ppc_asm.h>
+
+#ifdef CONFIG_PPC64
+#define STACK_FRAME_SIZE 48
+#else
+#define STACK_FRAME_SIZE 24
+#endif
+
+#if defined(CONFIG_PPC64_ELF_ABI_V2) && !defined(CONFIG_PPC_KERNEL_PCREL)
+#define PPC64_TOC_SAVE_AND_UPDATE			\
+"	std		2, 24(1)\n"			\
+"	bcl		20, 31, 1f\n"			\
+"   1:	mflr		12\n"				\
+"	ld		2, (99f - 1b)(12)\n"
+#define PPC64_TOC_RESTORE				\
+"	ld		2, 24(1)\n"
+#define PPC64_TOC					\
+"   99:	.quad		.TOC.@tocbase\n"
+#else
+#define PPC64_TOC_SAVE_AND_UPDATE ""
+#define PPC64_TOC_RESTORE ""
+#define PPC64_TOC ""
+#endif
+
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtlr		0\n"
+#define PPC_FTRACE_RET					\
+"	blr\n"
+#define PPC_FTRACE_RECOVER_IP				\
+"	lwz		8, 4(3)\n"			\
+"	li		9, 6\n"				\
+"	slw		8, 8, 9\n"			\
+"	sraw		8, 8, 9\n"			\
+"	add		3, 3, 8\n"			\
+"	addi		3, 3, 4\n"
+#else
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtctr		0\n"
+#define PPC_FTRACE_RET					\
+"	mtlr		0\n"				\
+"	bctr\n"
+#define PPC_FTRACE_RECOVER_IP ""
+#endif
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp, @function\n"
+"	.globl		my_tramp\n"
+"   my_tramp:\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mflr		0\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_SIZE)"(1)\n"
+	PPC64_TOC_SAVE_AND_UPDATE
+	PPC_STL"	3, "__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mr		3, 0\n"
+	PPC_FTRACE_RECOVER_IP
+"	bl		my_direct_func\n"
+	PPC_LL"		3, "__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+	PPC64_TOC_RESTORE
+"	addi		1, 1, "__stringify(STACK_FRAME_SIZE)"\n"
+	PPC_FTRACE_RESTORE_LR
+"	addi		1, 1, "__stringify(STACK_FRAME_MIN_SIZE)"\n"
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_FTRACE_RET
+	PPC64_TOC
+"	.size		my_tramp, .-my_tramp\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC */
+
 static struct ftrace_ops direct;
 
 static int __init ftrace_direct_multi_init(void)
diff --git a/samples/ftrace/ftrace-direct-too.c b/samples/ftrace/ftrace-direct-too.c
index 6ff546a5d7eb..3d0fa260332d 100644
--- a/samples/ftrace/ftrace-direct-too.c
+++ b/samples/ftrace/ftrace-direct-too.c
@@ -3,7 +3,7 @@
 
 #include <linux/mm.h> /* for handle_mm_fault() */
 #include <linux/ftrace.h>
-#ifndef CONFIG_ARM64
+#if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
 
@@ -153,6 +153,87 @@ asm (
 
 #endif /* CONFIG_LOONGARCH */
 
+#ifdef CONFIG_PPC
+#include <asm/ppc_asm.h>
+
+#ifdef CONFIG_PPC64
+#define STACK_FRAME_SIZE 64
+#define STACK_FRAME_ARG1 32
+#define STACK_FRAME_ARG2 40
+#define STACK_FRAME_ARG3 48
+#define STACK_FRAME_ARG4 56
+#else
+#define STACK_FRAME_SIZE 32
+#define STACK_FRAME_ARG1 16
+#define STACK_FRAME_ARG2 20
+#define STACK_FRAME_ARG3 24
+#define STACK_FRAME_ARG4 28
+#endif
+
+#if defined(CONFIG_PPC64_ELF_ABI_V2) && !defined(CONFIG_PPC_KERNEL_PCREL)
+#define PPC64_TOC_SAVE_AND_UPDATE			\
+"	std		2, 24(1)\n"			\
+"	bcl		20, 31, 1f\n"			\
+"   1:	mflr		12\n"				\
+"	ld		2, (99f - 1b)(12)\n"
+#define PPC64_TOC_RESTORE				\
+"	ld		2, 24(1)\n"
+#define PPC64_TOC					\
+"   99:	.quad		.TOC.@tocbase\n"
+#else
+#define PPC64_TOC_SAVE_AND_UPDATE ""
+#define PPC64_TOC_RESTORE ""
+#define PPC64_TOC ""
+#endif
+
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtlr		0\n"
+#define PPC_FTRACE_RET					\
+"	blr\n"
+#else
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtctr		0\n"
+#define PPC_FTRACE_RET					\
+"	mtlr		0\n"				\
+"	bctr\n"
+#endif
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp, @function\n"
+"	.globl		my_tramp\n"
+"   my_tramp:\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mflr		0\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_SIZE)"(1)\n"
+	PPC64_TOC_SAVE_AND_UPDATE
+	PPC_STL"	3, "__stringify(STACK_FRAME_ARG1)"(1)\n"
+	PPC_STL"	4, "__stringify(STACK_FRAME_ARG2)"(1)\n"
+	PPC_STL"	5, "__stringify(STACK_FRAME_ARG3)"(1)\n"
+	PPC_STL"	6, "__stringify(STACK_FRAME_ARG4)"(1)\n"
+"	bl		my_direct_func\n"
+	PPC_LL"		6, "__stringify(STACK_FRAME_ARG4)"(1)\n"
+	PPC_LL"		5, "__stringify(STACK_FRAME_ARG3)"(1)\n"
+	PPC_LL"		4, "__stringify(STACK_FRAME_ARG2)"(1)\n"
+	PPC_LL"		3, "__stringify(STACK_FRAME_ARG1)"(1)\n"
+	PPC64_TOC_RESTORE
+"	addi		1, 1, "__stringify(STACK_FRAME_SIZE)"\n"
+	PPC_FTRACE_RESTORE_LR
+"	addi		1, 1, "__stringify(STACK_FRAME_MIN_SIZE)"\n"
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_FTRACE_RET
+	PPC64_TOC
+"	.size		my_tramp, .-my_tramp\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC */
+
 static struct ftrace_ops direct;
 
 static int __init ftrace_direct_init(void)
diff --git a/samples/ftrace/ftrace-direct.c b/samples/ftrace/ftrace-direct.c
index ef0945670e1e..956834b0d19a 100644
--- a/samples/ftrace/ftrace-direct.c
+++ b/samples/ftrace/ftrace-direct.c
@@ -3,7 +3,7 @@
 
 #include <linux/sched.h> /* for wake_up_process() */
 #include <linux/ftrace.h>
-#ifndef CONFIG_ARM64
+#if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
 
@@ -134,6 +134,73 @@ asm (
 
 #endif /* CONFIG_LOONGARCH */
 
+#ifdef CONFIG_PPC
+#include <asm/ppc_asm.h>
+
+#ifdef CONFIG_PPC64
+#define STACK_FRAME_SIZE 48
+#else
+#define STACK_FRAME_SIZE 24
+#endif
+
+#if defined(CONFIG_PPC64_ELF_ABI_V2) && !defined(CONFIG_PPC_KERNEL_PCREL)
+#define PPC64_TOC_SAVE_AND_UPDATE			\
+"	std		2, 24(1)\n"			\
+"	bcl		20, 31, 1f\n"			\
+"   1:	mflr		12\n"				\
+"	ld		2, (99f - 1b)(12)\n"
+#define PPC64_TOC_RESTORE				\
+"	ld		2, 24(1)\n"
+#define PPC64_TOC					\
+"   99:	.quad		.TOC.@tocbase\n"
+#else
+#define PPC64_TOC_SAVE_AND_UPDATE ""
+#define PPC64_TOC_RESTORE ""
+#define PPC64_TOC ""
+#endif
+
+#ifdef CONFIG_PPC_FTRACE_OUT_OF_LINE
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtlr		0\n"
+#define PPC_FTRACE_RET					\
+"	blr\n"
+#else
+#define PPC_FTRACE_RESTORE_LR				\
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"	\
+"	mtctr		0\n"
+#define PPC_FTRACE_RET					\
+"	mtlr		0\n"				\
+"	bctr\n"
+#endif
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp, @function\n"
+"	.globl		my_tramp\n"
+"   my_tramp:\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	mflr		0\n"
+	PPC_STL"	0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_STLU"	1, -"__stringify(STACK_FRAME_SIZE)"(1)\n"
+	PPC64_TOC_SAVE_AND_UPDATE
+	PPC_STL"	3, "__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+"	bl		my_direct_func\n"
+	PPC_LL"		3, "__stringify(STACK_FRAME_MIN_SIZE)"(1)\n"
+	PPC64_TOC_RESTORE
+"	addi		1, 1, "__stringify(STACK_FRAME_SIZE)"\n"
+	PPC_FTRACE_RESTORE_LR
+"	addi		1, 1, "__stringify(STACK_FRAME_MIN_SIZE)"\n"
+	PPC_LL"		0, "__stringify(PPC_LR_STKOFF)"(1)\n"
+	PPC_FTRACE_RET
+	PPC64_TOC
+"	.size		my_tramp, .-my_tramp\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC */
+
 static struct ftrace_ops direct;
 
 static int __init ftrace_direct_init(void)
-- 
2.45.2

