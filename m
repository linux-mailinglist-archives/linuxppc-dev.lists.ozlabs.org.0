Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3035280A975
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 17:42:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kqw5cSnR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmxkV4h72z3w0L
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Dec 2023 03:42:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Kqw5cSnR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Smxb40KFtz3dGx
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Dec 2023 03:35:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C6BF624E5;
	Fri,  8 Dec 2023 16:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D02EC433C8;
	Fri,  8 Dec 2023 16:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702053341;
	bh=/Vr54DRtLZd4aKRU80jRMolyKRZJenT4nAxAfj9vNgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kqw5cSnRlXfjEbUQjs6WgIcysAOrhanmR902+VQbClMrPLkXY683HU5mJIYOzkTH3
	 Yyue4EEiHDrdVsjDxVESagqcPXSMMrn9ULPcPXs0DEBlcDzw1koo1hDb/ldwLf7+dA
	 e4lSJPR3TjZWnnHX0GERGFLrWlb9svcRzxZYBGOShKnRhor2Tqf9WNmRQNeFlBOmT+
	 /mgGpK6XejchUuv4nmS/e8wkrrD+3+ViY72f1giw+hL5APgTaAmwVfen3vxcjdbjBs
	 2ELu3e14nWeWdIWRRznQnfFErm2+uXCMBhnQqsoRklEnJGMjFpu9JMgHdvpiT849pE
	 sKPBxbOmYlk0g==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 9/9] samples/ftrace: Add support for ftrace direct samples on powerpc
Date: Fri,  8 Dec 2023 22:00:48 +0530
Message-ID: <4735fcdfb8977c6f437796590c0e3cbbf644d0de.1702045299.git.naveen@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1702045299.git.naveen@kernel.org>
References: <cover.1702045299.git.naveen@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Florent Revest <revest@chromium.org>, Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add powerpc 32-bit and 64-bit samples for ftrace direct. This serves to
show the sample instruction sequence to be used by ftrace direct calls
to adhere to the ftrace ABI.

On 64-bit powerpc, TOC setup requires some additional work.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/Kconfig                        |   2 +
 samples/ftrace/ftrace-direct-modify.c       |  94 ++++++++++++++++-
 samples/ftrace/ftrace-direct-multi-modify.c | 110 +++++++++++++++++++-
 samples/ftrace/ftrace-direct-multi.c        |  64 +++++++++++-
 samples/ftrace/ftrace-direct-too.c          |  72 ++++++++++++-
 samples/ftrace/ftrace-direct.c              |  61 ++++++++++-
 6 files changed, 398 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4fe04fdca33a..28de3a5f3e98 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -274,6 +274,8 @@ config PPC
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
 	select HAVE_RSEQ
+	select HAVE_SAMPLE_FTRACE_DIRECT	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
+	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI	if HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
 	select HAVE_SETUP_PER_CPU_AREA		if PPC64
 	select HAVE_SOFTIRQ_ON_OWN_STACK
 	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
diff --git a/samples/ftrace/ftrace-direct-modify.c b/samples/ftrace/ftrace-direct-modify.c
index e2a6a69352df..bd985035b937 100644
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
 
@@ -164,6 +164,98 @@ asm (
 
 #endif /* CONFIG_LOONGARCH */
 
+#ifdef CONFIG_PPC32
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp1, @function\n"
+"	.globl		my_tramp1\n"
+"   my_tramp1:"
+"	stw		0, 4(1)\n"
+"	stwu		1, -16(1)\n"
+"	mflr		0\n"
+"	stw		0, 4(1)\n"
+"	stwu		1, -16(1)\n"
+"	bl		my_direct_func1\n"
+"	lwz		0, 20(1)\n"
+"	mtlr		0\n"
+"	addi		1, 1, 32\n"
+"	lwz		0, 4(1)\n"
+"	blr\n"
+"	.size		my_tramp1, .-my_tramp1\n"
+
+"	.type		my_tramp2, @function\n"
+"	.globl		my_tramp2\n"
+"   my_tramp2:"
+"	stw		0, 4(1)\n"
+"	stwu		1, -16(1)\n"
+"	mflr		0\n"
+"	stw		0, 4(1)\n"
+"	stwu		1, -16(1)\n"
+"	bl		my_direct_func2\n"
+"	lwz		0, 20(1)\n"
+"	mtlr		0\n"
+"	addi		1, 1, 32\n"
+"	lwz		0, 4(1)\n"
+"	blr\n"
+"	.size		my_tramp2, .-my_tramp2\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC32 */
+
+#ifdef CONFIG_PPC64
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp1, @function\n"
+"	.globl		my_tramp1\n"
+"   my_tramp1:"
+"	std		0, 16(1)\n"
+"	stdu		1, -32(1)\n"
+"	mflr		0\n"
+"	std		0, 16(1)\n"
+"	stdu		1, -32(1)\n"
+"	std		2, 24(1)\n"
+"	bcl		20, 31, 1f\n"
+"   1:	mflr		12\n"
+"	ld		2, (2f - 1b)(12)\n"
+"	bl		my_direct_func1\n"
+"	ld		2, 24(1)\n"
+"	ld		0, 48(1)\n"
+"	mtlr		0\n"
+"	addi		1, 1, 64\n"
+"	ld		0, 16(1)\n"
+"	blr\n"
+"   2:	.quad		.TOC.@tocbase\n"
+"	.size		my_tramp1, .-my_tramp1\n"
+
+"	.type		my_tramp2, @function\n"
+"	.globl		my_tramp2\n"
+"   my_tramp2:"
+"	std		0, 16(1)\n"
+"	stdu		1, -32(1)\n"
+"	mflr		0\n"
+"	std		0, 16(1)\n"
+"	stdu		1, -32(1)\n"
+"	std		2, 24(1)\n"
+"	bcl		20, 31, 1f\n"
+"   1:	mflr		12\n"
+"	ld		2, (2f - 1b)(12)\n"
+"	bl		my_direct_func2\n"
+"	ld		2, 24(1)\n"
+"	ld		0, 48(1)\n"
+"	mtlr		0\n"
+"	addi		1, 1, 64\n"
+"	ld		0, 16(1)\n"
+"	blr\n"
+"   2:	.quad		.TOC.@tocbase\n"
+"	.size		my_tramp2, .-my_tramp2\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC64 */
+
 static struct ftrace_ops direct;
 
 static unsigned long my_tramp = (unsigned long)my_tramp1;
diff --git a/samples/ftrace/ftrace-direct-multi-modify.c b/samples/ftrace/ftrace-direct-multi-modify.c
index 2e349834d63c..478e879a23af 100644
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
 
@@ -184,6 +184,114 @@ asm (
 
 #endif /* CONFIG_LOONGARCH */
 
+#ifdef CONFIG_PPC32
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp1, @function\n"
+"	.globl		my_tramp1\n"
+"   my_tramp1:"
+"	stw		0, 4(1)\n"
+"	stwu		1, -16(1)\n"
+"	mflr		0\n"
+"	stw		0, 4(1)\n"
+"	stwu		1, -24(1)\n"
+"	stw		3, 16(1)\n"
+"	mr		3, 0\n"
+"	addi		3, 3, 16\n"
+"	bl		my_direct_func1\n"
+"	lwz		3, 16(1)\n"
+"	lwz		0, 28(1)\n"
+"	mtlr		0\n"
+"	addi		1, 1, 40\n"
+"	lwz		0, 4(1)\n"
+"	blr\n"
+"	.size		my_tramp1, .-my_tramp1\n"
+
+"	.type		my_tramp2, @function\n"
+"	.globl		my_tramp2\n"
+"   my_tramp2:"
+"	stw		0, 4(1)\n"
+"	stwu		1, -16(1)\n"
+"	mflr		0\n"
+"	stw		0, 4(1)\n"
+"	stwu		1, -24(1)\n"
+"	stw		3, 16(1)\n"
+"	mr		3, 0\n"
+"	addi		3, 3, 16\n"
+"	bl		my_direct_func2\n"
+"	lwz		3, 16(1)\n"
+"	lwz		0, 28(1)\n"
+"	mtlr		0\n"
+"	addi		1, 1, 40\n"
+"	lwz		0, 4(1)\n"
+"	blr\n"
+"	.size		my_tramp2, .-my_tramp2\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC32 */
+
+#ifdef CONFIG_PPC64
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp1, @function\n"
+"	.globl		my_tramp1\n"
+"   my_tramp1:"
+"	std		0, 16(1)\n"
+"	stdu		1, -32(1)\n"
+"	mflr		0\n"
+"	std		0, 16(1)\n"
+"	stdu		1, -48(1)\n"
+"	std		2, 24(1)\n"
+"	bcl		20, 31, 1f\n"
+"   1:	mflr		12\n"
+"	ld		2, (2f - 1b)(12)\n"
+"	std		3, 32(1)\n"
+"	mr		3, 0\n"
+"	addi		3, 3, 20\n"
+"	bl		my_direct_func1\n"
+"	ld		3, 32(1)\n"
+"	ld		2, 24(1)\n"
+"	ld		0, 64(1)\n"
+"	mtlr		0\n"
+"	addi		1, 1, 80\n"
+"	ld		0, 16(1)\n"
+"	blr\n"
+"   2:	.quad		.TOC.@tocbase\n"
+"	.size		my_tramp1, .-my_tramp1\n"
+
+"	.type		my_tramp2, @function\n"
+"	.globl		my_tramp2\n"
+"   my_tramp2:"
+"	std		0, 16(1)\n"
+"	stdu		1, -32(1)\n"
+"	mflr		0\n"
+"	std		0, 16(1)\n"
+"	stdu		1, -48(1)\n"
+"	std		2, 24(1)\n"
+"	bcl		20, 31, 1f\n"
+"   1:	mflr		12\n"
+"	ld		2, (2f - 1b)(12)\n"
+"	std		3, 32(1)\n"
+"	mr		3, 0\n"
+"	addi		3, 3, 20\n"
+"	bl		my_direct_func2\n"
+"	ld		3, 32(1)\n"
+"	ld		2, 24(1)\n"
+"	ld		0, 64(1)\n"
+"	mtlr		0\n"
+"	addi		1, 1, 80\n"
+"	ld		0, 16(1)\n"
+"	blr\n"
+"   2:	.quad		.TOC.@tocbase\n"
+"	.size		my_tramp2, .-my_tramp2\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC64 */
+
 static unsigned long my_tramp = (unsigned long)my_tramp1;
 static unsigned long tramps[2] = {
 	(unsigned long)my_tramp1,
diff --git a/samples/ftrace/ftrace-direct-multi.c b/samples/ftrace/ftrace-direct-multi.c
index 9243dbfe4d0c..558f4ad8d84a 100644
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
 
@@ -116,6 +116,68 @@ asm (
 
 #endif /* CONFIG_LOONGARCH */
 
+#ifdef CONFIG_PPC32
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp, @function\n"
+"	.globl		my_tramp\n"
+"   my_tramp:"
+"	stw		0, 4(1)\n"
+"	stwu		1, -16(1)\n"
+"	mflr		0\n"
+"	stw		0, 4(1)\n"
+"	stwu		1, -24(1)\n"
+"	stw		3, 16(1)\n"
+"	mr		3, 0\n"
+"	addi		3, 3, 16\n"
+"	bl		my_direct_func\n"
+"	lwz		3, 16(1)\n"
+"	lwz		0, 28(1)\n"
+"	mtlr		0\n"
+"	addi		1, 1, 40\n"
+"	lwz		0, 4(1)\n"
+"	blr\n"
+"	.size		my_tramp, .-my_tramp\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC32 */
+
+#ifdef CONFIG_PPC64
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp, @function\n"
+"	.globl		my_tramp\n"
+"   my_tramp:"
+"	std		0, 16(1)\n"
+"	stdu		1, -32(1)\n"
+"	mflr		0\n"
+"	std		0, 16(1)\n"
+"	stdu		1, -48(1)\n"
+"	std		2, 24(1)\n"
+"	bcl		20, 31, 1f\n"
+"   1:	mflr		12\n"
+"	ld		2, (2f - 1b)(12)\n"
+"	std		3, 32(1)\n"
+"	mr		3, 0\n"
+"	addi		3, 3, 20\n"
+"	bl		my_direct_func\n"
+"	ld		3, 32(1)\n"
+"	ld		2, 24(1)\n"
+"	ld		0, 64(1)\n"
+"	mtlr		0\n"
+"	addi		1, 1, 80\n"
+"	ld		0, 16(1)\n"
+"	blr\n"
+"   2:	.quad		.TOC.@tocbase\n"
+"	.size		my_tramp, .-my_tramp\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC64 */
+
 static struct ftrace_ops direct;
 
 static int __init ftrace_direct_multi_init(void)
diff --git a/samples/ftrace/ftrace-direct-too.c b/samples/ftrace/ftrace-direct-too.c
index e39c3563ae4e..2a35b5d88304 100644
--- a/samples/ftrace/ftrace-direct-too.c
+++ b/samples/ftrace/ftrace-direct-too.c
@@ -3,7 +3,7 @@
 
 #include <linux/mm.h> /* for handle_mm_fault() */
 #include <linux/ftrace.h>
-#ifndef CONFIG_ARM64
+#if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
 
@@ -125,6 +125,76 @@ asm (
 
 #endif /* CONFIG_LOONGARCH */
 
+#ifdef CONFIG_PPC32
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp, @function\n"
+"	.globl		my_tramp\n"
+"   my_tramp:"
+"	stw		0, 4(1)\n"
+"	stwu		1, -16(1)\n"
+"	mflr		0\n"
+"	stw		0, 4(1)\n"
+"	stwu		1, -32(1)\n"
+"	stw		3, 16(1)\n"
+"	stw		4, 20(1)\n"
+"	stw		5, 24(1)\n"
+"	stw		6, 28(1)\n"
+"	bl		my_direct_func\n"
+"	lwz		6, 28(1)\n"
+"	lwz		5, 24(1)\n"
+"	lwz		4, 20(1)\n"
+"	lwz		3, 16(1)\n"
+"	lwz		0, 36(1)\n"
+"	mtlr		0\n"
+"	addi		1, 1, 48\n"
+"	lwz		0, 4(1)\n"
+"	blr\n"
+"	.size		my_tramp, .-my_tramp\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC32 */
+
+#ifdef CONFIG_PPC64
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp, @function\n"
+"	.globl		my_tramp\n"
+"   my_tramp:"
+"	std		0, 16(1)\n"
+"	stdu		1, -32(1)\n"
+"	mflr		0\n"
+"	std		0, 16(1)\n"
+"	stdu		1, -64(1)\n"
+"	std		2, 24(1)\n"
+"	bcl		20, 31, 1f\n"
+"   1:	mflr		12\n"
+"	ld		2, (2f - 1b)(12)\n"
+"	std		3, 32(1)\n"
+"	std		4, 40(1)\n"
+"	std		5, 48(1)\n"
+"	std		6, 56(1)\n"
+"	bl		my_direct_func\n"
+"	ld		6, 56(1)\n"
+"	ld		5, 48(1)\n"
+"	ld		4, 40(1)\n"
+"	ld		3, 32(1)\n"
+"	ld		2, 24(1)\n"
+"	ld		0, 80(1)\n"
+"	mtlr		0\n"
+"	addi		1, 1, 96\n"
+"	ld		0, 16(1)\n"
+"	blr\n"
+"   2:	.quad		.TOC.@tocbase\n"
+"	.size		my_tramp, .-my_tramp\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC64 */
+
 static struct ftrace_ops direct;
 
 static int __init ftrace_direct_init(void)
diff --git a/samples/ftrace/ftrace-direct.c b/samples/ftrace/ftrace-direct.c
index 32c477da1e9a..5585ffb6dd41 100644
--- a/samples/ftrace/ftrace-direct.c
+++ b/samples/ftrace/ftrace-direct.c
@@ -3,7 +3,7 @@
 
 #include <linux/sched.h> /* for wake_up_process() */
 #include <linux/ftrace.h>
-#ifndef CONFIG_ARM64
+#if !defined(CONFIG_ARM64) && !defined(CONFIG_PPC32)
 #include <asm/asm-offsets.h>
 #endif
 
@@ -110,6 +110,65 @@ asm (
 
 #endif /* CONFIG_LOONGARCH */
 
+#ifdef CONFIG_PPC32
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp, @function\n"
+"	.globl		my_tramp\n"
+"   my_tramp:"
+"	stw		0, 4(1)\n"
+"	stwu		1, -16(1)\n"
+"	mflr		0\n"
+"	stw		0, 4(1)\n"
+"	stwu		1, -24(1)\n"
+"	stw		3, 16(1)\n"
+"	bl		my_direct_func\n"
+"	lwz		3, 16(1)\n"
+"	lwz		0, 28(1)\n"
+"	mtlr		0\n"
+"	addi		1, 1, 40\n"
+"	lwz		0, 4(1)\n"
+"	blr\n"
+"	.size		my_tramp, .-my_tramp\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC32 */
+
+#ifdef CONFIG_PPC64
+
+asm (
+"	.pushsection	.text, \"ax\", @progbits\n"
+"	.type		my_tramp, @function\n"
+"	.globl		my_tramp\n"
+"   my_tramp:"
+"	std		0, 16(1)\n"
+"	stdu		1, -32(1)\n"
+"	mflr		0\n"
+"	std		0, 16(1)\n"
+"	stdu		1, -48(1)\n"
+"	std		2, 24(1)\n"
+"	bcl		20, 31, 1f\n"
+"   1:	mflr		12\n"
+"	ld		2, (2f - 1b)(12)\n"
+"	std		3, 32(1)\n"
+"	bl		my_direct_func\n"
+"	ld		3, 32(1)\n"
+"	ld		2, 24(1)\n"
+"	ld		0, 64(1)\n"
+"	mtlr		0\n"
+"	addi		1, 1, 80\n"
+"	ld		0, 16(1)\n"
+"	blr\n"
+"   2:	.quad		.TOC.@tocbase\n"
+"	.size		my_tramp, .-my_tramp\n"
+"	.popsection\n"
+);
+
+#endif /* CONFIG_PPC64 */
+
+
 static struct ftrace_ops direct;
 
 static int __init ftrace_direct_init(void)
-- 
2.43.0

