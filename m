Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E227266C6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 19:09:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qbv2f6CNwz3gC9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 03:09:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BhisoVWh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BhisoVWh;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qbtrq0FvQz3dy8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 03:00:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 627FD60B34;
	Wed,  7 Jun 2023 17:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51021C433D2;
	Wed,  7 Jun 2023 17:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686157240;
	bh=+h+3LyPm6CZYkFnOmOUKuPI8mQbyKGMHvHU2h6EHRe4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BhisoVWhHXhGg59cm/rJ6XZDFngs1MTgL9d8AkLQXXTyQedLqb8q32mvTEKpFzzvd
	 Y3RaSoAP14oqHyTFToB95vT2Hq9RqHRArb5r8wny6s7RMmvR/N+peVsMvRGfBTgWrf
	 5WMj/d1n+X7qVQLz8qX+dRjswM2ZkR7aAeFCp5w92w4M2sa/mSuBT+VBx4gREFOLa0
	 tWrYhsSVDVRnPLxkjEb1pZxd3TdMtT1Zq7Y6b9D507NVT2n4A3Yyl2rI57zsn8VutH
	 EX8nnp49GKhP0myXIwuW8yyPSpCUUYpQ89Dnq8ExL4DkQuLwylv7+rZp8BVggCMj1l
	 lgTJZTFfEGT4A==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC PATCH 06/15] powerpc/ftrace: Consolidate ftrace support into fewer files
Date: Wed,  7 Jun 2023 22:25:21 +0530
Message-Id: <daef74ca5682c7d4443f546168e58d56329aa729.1686151854.git.naveen@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1686151854.git.naveen@kernel.org>
References: <cover.1686151854.git.naveen@kernel.org>
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
Cc: Steven Rostedt <rostedt@goodmis.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ftrace_low.S has just the _mcount stub and return_to_handler(). Merge
this back into ftrace_mprofile.S and ftrace_64_pg.S to keep all ftrace
code together, and to allow those to evolve independently.

ftrace_mprofile.S is also not an entirely accurate name since this also
holds ppc32 code. This will be all the more incorrect once support for
-fpatchable-function-entry is added. Rename files here to more
accurately describe the code:
- ftrace_mprofile.S is renamed to ftrace_entry.S
- ftrace_pg.c is renamed to ftrace_64_pg.c
- ftrace_64_pg.S is rename to ftrace_64_pg_entry.S

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/Makefile            | 17 +++--
 arch/powerpc/kernel/trace/ftrace_64_pg.S      | 67 -------------------
 .../trace/{ftrace_pg.c => ftrace_64_pg.c}     |  0
 .../{ftrace_low.S => ftrace_64_pg_entry.S}    | 58 +++++++++++++++-
 .../{ftrace_mprofile.S => ftrace_entry.S}     | 65 ++++++++++++++++++
 5 files changed, 130 insertions(+), 77 deletions(-)
 delete mode 100644 arch/powerpc/kernel/trace/ftrace_64_pg.S
 rename arch/powerpc/kernel/trace/{ftrace_pg.c => ftrace_64_pg.c} (100%)
 rename arch/powerpc/kernel/trace/{ftrace_low.S => ftrace_64_pg_entry.S} (55%)
 rename arch/powerpc/kernel/trace/{ftrace_mprofile.S => ftrace_entry.S} (83%)

diff --git a/arch/powerpc/kernel/trace/Makefile b/arch/powerpc/kernel/trace/Makefile
index 342a2d1ae86cd0..125f4ca588b98a 100644
--- a/arch/powerpc/kernel/trace/Makefile
+++ b/arch/powerpc/kernel/trace/Makefile
@@ -6,16 +6,15 @@
 ifdef CONFIG_FUNCTION_TRACER
 # do not trace tracer code
 CFLAGS_REMOVE_ftrace.o = $(CC_FLAGS_FTRACE)
-CFLAGS_REMOVE_ftrace_pg.o = $(CC_FLAGS_FTRACE)
+CFLAGS_REMOVE_ftrace_64_pg.o = $(CC_FLAGS_FTRACE)
 endif
 
-obj32-$(CONFIG_FUNCTION_TRACER)		+= ftrace_mprofile.o ftrace.o
+obj32-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o ftrace_entry.o
 ifdef CONFIG_MPROFILE_KERNEL
-obj64-$(CONFIG_FUNCTION_TRACER)		+= ftrace_mprofile.o ftrace.o
+obj64-$(CONFIG_FUNCTION_TRACER)		+= ftrace.o ftrace_entry.o
 else
-obj64-$(CONFIG_FUNCTION_TRACER)		+= ftrace_64_pg.o ftrace_pg.o
+obj64-$(CONFIG_FUNCTION_TRACER)		+= ftrace_64_pg.o ftrace_64_pg_entry.o
 endif
-obj-$(CONFIG_FUNCTION_TRACER)		+= ftrace_low.o
 obj-$(CONFIG_TRACING)			+= trace_clock.o
 
 obj-$(CONFIG_PPC64)			+= $(obj64-y)
@@ -26,7 +25,7 @@ GCOV_PROFILE_ftrace.o := n
 KCOV_INSTRUMENT_ftrace.o := n
 KCSAN_SANITIZE_ftrace.o := n
 UBSAN_SANITIZE_ftrace.o := n
-GCOV_PROFILE_ftrace_pg.o := n
-KCOV_INSTRUMENT_ftrace_pg.o := n
-KCSAN_SANITIZE_ftrace_pg.o := n
-UBSAN_SANITIZE_ftrace_pg.o := n
+GCOV_PROFILE_ftrace_64_pg.o := n
+KCOV_INSTRUMENT_ftrace_64_pg.o := n
+KCSAN_SANITIZE_ftrace_64_pg.o := n
+UBSAN_SANITIZE_ftrace_64_pg.o := n
diff --git a/arch/powerpc/kernel/trace/ftrace_64_pg.S b/arch/powerpc/kernel/trace/ftrace_64_pg.S
deleted file mode 100644
index 6708e24db0aba8..00000000000000
--- a/arch/powerpc/kernel/trace/ftrace_64_pg.S
+++ /dev/null
@@ -1,67 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Split from ftrace_64.S
- */
-
-#include <linux/magic.h>
-#include <asm/ppc_asm.h>
-#include <asm/asm-offsets.h>
-#include <asm/ftrace.h>
-#include <asm/ppc-opcode.h>
-#include <asm/export.h>
-
-_GLOBAL_TOC(ftrace_caller)
-	lbz	r3, PACA_FTRACE_ENABLED(r13)
-	cmpdi	r3, 0
-	beqlr
-
-	/* Taken from output of objdump from lib64/glibc */
-	mflr	r3
-	ld	r11, 0(r1)
-	stdu	r1, -112(r1)
-	std	r3, 128(r1)
-	ld	r4, 16(r11)
-	subi	r3, r3, MCOUNT_INSN_SIZE
-.globl ftrace_call
-ftrace_call:
-	bl	ftrace_stub
-	nop
-#ifdef CONFIG_FUNCTION_GRAPH_TRACER
-.globl ftrace_graph_call
-ftrace_graph_call:
-	b	ftrace_graph_stub
-_GLOBAL(ftrace_graph_stub)
-#endif
-	ld	r0, 128(r1)
-	mtlr	r0
-	addi	r1, r1, 112
-
-_GLOBAL(ftrace_stub)
-	blr
-
-#ifdef CONFIG_FUNCTION_GRAPH_TRACER
-_GLOBAL(ftrace_graph_caller)
-	addi	r5, r1, 112
-	/* load r4 with local address */
-	ld	r4, 128(r1)
-	subi	r4, r4, MCOUNT_INSN_SIZE
-
-	/* Grab the LR out of the caller stack frame */
-	ld	r11, 112(r1)
-	ld	r3, 16(r11)
-
-	bl	prepare_ftrace_return
-	nop
-
-	/*
-	 * prepare_ftrace_return gives us the address we divert to.
-	 * Change the LR in the callers stack frame to this.
-	 */
-	ld	r11, 112(r1)
-	std	r3, 16(r11)
-
-	ld	r0, 128(r1)
-	mtlr	r0
-	addi	r1, r1, 112
-	blr
-#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
diff --git a/arch/powerpc/kernel/trace/ftrace_pg.c b/arch/powerpc/kernel/trace/ftrace_64_pg.c
similarity index 100%
rename from arch/powerpc/kernel/trace/ftrace_pg.c
rename to arch/powerpc/kernel/trace/ftrace_64_pg.c
diff --git a/arch/powerpc/kernel/trace/ftrace_low.S b/arch/powerpc/kernel/trace/ftrace_64_pg_entry.S
similarity index 55%
rename from arch/powerpc/kernel/trace/ftrace_low.S
rename to arch/powerpc/kernel/trace/ftrace_64_pg_entry.S
index 2fc7dd0a5ae968..81dbaf70b1513a 100644
--- a/arch/powerpc/kernel/trace/ftrace_low.S
+++ b/arch/powerpc/kernel/trace/ftrace_64_pg_entry.S
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 /*
- * Split from entry_64.S
+ * Split from ftrace_64.S
  */
 
 #include <linux/magic.h>
@@ -10,6 +10,62 @@
 #include <asm/ppc-opcode.h>
 #include <asm/export.h>
 
+_GLOBAL_TOC(ftrace_caller)
+	lbz	r3, PACA_FTRACE_ENABLED(r13)
+	cmpdi	r3, 0
+	beqlr
+
+	/* Taken from output of objdump from lib64/glibc */
+	mflr	r3
+	ld	r11, 0(r1)
+	stdu	r1, -112(r1)
+	std	r3, 128(r1)
+	ld	r4, 16(r11)
+	subi	r3, r3, MCOUNT_INSN_SIZE
+.globl ftrace_call
+ftrace_call:
+	bl	ftrace_stub
+	nop
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+.globl ftrace_graph_call
+ftrace_graph_call:
+	b	ftrace_graph_stub
+_GLOBAL(ftrace_graph_stub)
+#endif
+	ld	r0, 128(r1)
+	mtlr	r0
+	addi	r1, r1, 112
+
+_GLOBAL(ftrace_stub)
+	blr
+
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+_GLOBAL(ftrace_graph_caller)
+	addi	r5, r1, 112
+	/* load r4 with local address */
+	ld	r4, 128(r1)
+	subi	r4, r4, MCOUNT_INSN_SIZE
+
+	/* Grab the LR out of the caller stack frame */
+	ld	r11, 112(r1)
+	ld	r3, 16(r11)
+
+	bl	prepare_ftrace_return
+	nop
+
+	/*
+	 * prepare_ftrace_return gives us the address we divert to.
+	 * Change the LR in the callers stack frame to this.
+	 */
+	ld	r11, 112(r1)
+	std	r3, 16(r11)
+
+	ld	r0, 128(r1)
+	mtlr	r0
+	addi	r1, r1, 112
+	blr
+#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
+
 .pushsection ".tramp.ftrace.text","aw",@progbits;
 .globl ftrace_tramp_text
 ftrace_tramp_text:
diff --git a/arch/powerpc/kernel/trace/ftrace_mprofile.S b/arch/powerpc/kernel/trace/ftrace_entry.S
similarity index 83%
rename from arch/powerpc/kernel/trace/ftrace_mprofile.S
rename to arch/powerpc/kernel/trace/ftrace_entry.S
index ffb1db38684998..e8339706e735b1 100644
--- a/arch/powerpc/kernel/trace/ftrace_mprofile.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -249,3 +249,68 @@ livepatch_handler:
 	/* Return to original caller of live patched function */
 	blr
 #endif /* CONFIG_LIVEPATCH */
+
+_GLOBAL(mcount)
+_GLOBAL(_mcount)
+EXPORT_SYMBOL(_mcount)
+	mflr	r12
+	mtctr	r12
+	mtlr	r0
+	bctr
+
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
+_GLOBAL(return_to_handler)
+	/* need to save return values */
+#ifdef CONFIG_PPC64
+	std	r4,  -32(r1)
+	std	r3,  -24(r1)
+	/* save TOC */
+	std	r2,  -16(r1)
+	std	r31, -8(r1)
+	mr	r31, r1
+	stdu	r1, -112(r1)
+
+	/*
+	 * We might be called from a module.
+	 * Switch to our TOC to run inside the core kernel.
+	 */
+	LOAD_PACA_TOC()
+#else
+	stwu	r1, -16(r1)
+	stw	r3, 8(r1)
+	stw	r4, 12(r1)
+#endif
+
+	bl	ftrace_return_to_handler
+	nop
+
+	/* return value has real return address */
+	mtlr	r3
+
+#ifdef CONFIG_PPC64
+	ld	r1, 0(r1)
+	ld	r4,  -32(r1)
+	ld	r3,  -24(r1)
+	ld	r2,  -16(r1)
+	ld	r31, -8(r1)
+#else
+	lwz	r3, 8(r1)
+	lwz	r4, 12(r1)
+	addi	r1, r1, 16
+#endif
+
+	/* Jump back to real return address */
+	blr
+#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
+
+.pushsection ".tramp.ftrace.text","aw",@progbits;
+.globl ftrace_tramp_text
+ftrace_tramp_text:
+	.space 32
+.popsection
+
+.pushsection ".tramp.ftrace.init","aw",@progbits;
+.globl ftrace_tramp_init
+ftrace_tramp_init:
+	.space 32
+.popsection
-- 
2.40.1

