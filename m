Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3895355BA47
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:08:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWqLy0Tg4z3f34
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 00:08:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iEMvUuF6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWqF03k3Fz3bmk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:03:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iEMvUuF6;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LWqF02rKvz4xR1;
	Tue, 28 Jun 2022 00:03:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656338580;
	bh=E0e5tHJTYZE+q0JD8v1dV3Eo2maBL0LbfkuwFMQCwmM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iEMvUuF6dHl/vWPabKMKostPNY9Du1BIhek6BTcDnP0CudO7F2qqY/qPHg+AB0JWu
	 N7S8YgsXj2mYi/szaLNowxsKarWhlHDr9jw+7JK2K2Sszr34OBG6Aw3aaV5mpHHWmz
	 cB4Xld843Yr3Z3an2bt7CQx2za5zt1O8lAPHqMv+jH7ckQHlE0PNe7n7dO0wAaHTdc
	 OSJylPUZZrkIWVU1GQijsw3YkOZtglgwZ5QyDQgSXXj88i4w1ospBjVRrjejZvWgF4
	 lRqKqO55wJ42lPkycD+1Li7+t1wyE/eJOVdJlVWzdSSRMicB9baJkctLAZBFvaYUcc
	 95pGQrbIZWcSg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 10/13] selftests/powerpc/ptrace: Do more of ptrace-gpr in asm
Date: Tue, 28 Jun 2022 00:02:36 +1000
Message-Id: <20220627140239.2464900-10-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220627140239.2464900-1-mpe@ellerman.id.au>
References: <20220627140239.2464900-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ptrace-gpr test includes some inline asm to load GPR and FPR
registers. It then goes back to C to wait for the parent to trace it and
then checks register contents.

The split between inline asm and C is fragile, it relies on the compiler
not using any non-volatile GPRs after the inline asm block. It also
requires a very large and unwieldy inline asm block.

So convert the logic to set registers, wait, and store registers to a
single asm function, meaning there's no window for the compiler to
intervene.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../selftests/powerpc/include/basic_asm.h     |  8 +++
 .../testing/selftests/powerpc/ptrace/Makefile |  1 +
 .../selftests/powerpc/ptrace/ptrace-gpr.S     | 52 +++++++++++++++++++
 .../selftests/powerpc/ptrace/ptrace-gpr.c     | 29 +++++------
 4 files changed, 73 insertions(+), 17 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/ptrace/ptrace-gpr.S

diff --git a/tools/testing/selftests/powerpc/include/basic_asm.h b/tools/testing/selftests/powerpc/include/basic_asm.h
index 2d7f6e592dd9..26cde8ea1f49 100644
--- a/tools/testing/selftests/powerpc/include/basic_asm.h
+++ b/tools/testing/selftests/powerpc/include/basic_asm.h
@@ -94,4 +94,12 @@
 	PPC_LL	r0, STACK_FRAME_LR_POS(%r1); \
 	mtlr	r0;
 
+.macro OP_REGS op, reg_width, start_reg, end_reg, base_reg, base_reg_offset=0, skip=0
+	.set i, \start_reg
+	.rept (\end_reg - \start_reg + 1)
+	\op	i, (\reg_width * (i - \skip) + \base_reg_offset)(\base_reg)
+	.set i, i + 1
+	.endr
+.endm
+
 #endif /* _SELFTESTS_POWERPC_BASIC_ASM_H */
diff --git a/tools/testing/selftests/powerpc/ptrace/Makefile b/tools/testing/selftests/powerpc/ptrace/Makefile
index 3434a624ed77..2f02cb54224d 100644
--- a/tools/testing/selftests/powerpc/ptrace/Makefile
+++ b/tools/testing/selftests/powerpc/ptrace/Makefile
@@ -35,6 +35,7 @@ $(TM_TESTS): CFLAGS += -I../tm -mhtm
 
 CFLAGS += -I../../../../../usr/include -fno-pie
 
+$(OUTPUT)/ptrace-gpr: ptrace-gpr.S
 $(OUTPUT)/ptrace-pkey $(OUTPUT)/core-pkey: LDLIBS += -pthread
 
 $(TEST_GEN_PROGS): ../harness.c ../utils.c ../lib/reg.S
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.S b/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.S
new file mode 100644
index 000000000000..070e8443e3cc
--- /dev/null
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.S
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * test helper assembly functions
+ *
+ * Copyright (C) 2016 Simon Guo, IBM Corporation.
+ * Copyright 2022 Michael Ellerman, IBM Corporation.
+ */
+#include "basic_asm.h"
+
+#define GPR_SIZE	__SIZEOF_LONG__
+#define FIRST_GPR	14
+#define NUM_GPRS	(32 - FIRST_GPR)
+#define STACK_SIZE	(NUM_GPRS * GPR_SIZE)
+
+// gpr_child_loop(int *read_flag, int *write_flag,
+//		  unsigned long *gpr_buf, double *fpr_buf);
+FUNC_START(gpr_child_loop)
+	// r3 = read_flag
+	// r4 = write_flag
+	// r5 = gpr_buf
+	// r6 = fpr_buf
+	PUSH_BASIC_STACK(STACK_SIZE)
+
+	// Save non-volatile GPRs
+	OP_REGS PPC_STL, GPR_SIZE, FIRST_GPR, 31, %r1, STACK_FRAME_LOCAL(0, 0), FIRST_GPR
+
+	// Load GPRs with expected values
+	OP_REGS PPC_LL, GPR_SIZE, FIRST_GPR, 31, r5, 0, FIRST_GPR
+
+	// Load FPRs with expected values
+	OP_REGS lfd, 8, 0, 31, r6
+
+	// Signal to parent that we're ready
+	li	r0, 1
+	stw	r0, 0(r4)
+
+	// Wait for parent to finish
+1:	lwz	r0, 0(r3)
+	cmpwi	r0, 0
+	beq	1b	// Loop while flag is zero
+
+	// Save GPRs back to caller buffer
+	OP_REGS PPC_STL, GPR_SIZE, FIRST_GPR, 31, r5, 0, FIRST_GPR
+
+	// Save FPRs
+	OP_REGS stfd, 8, 0, 31, r6
+
+	// Reload non-volatile GPRs
+	OP_REGS PPC_LL, GPR_SIZE, FIRST_GPR, 31, %r1, STACK_FRAME_LOCAL(0, 0), FIRST_GPR
+
+	POP_BASIC_STACK(STACK_SIZE)
+	blr
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c
index 1468e89c044b..4e7a7eb01e3a 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c
@@ -16,32 +16,27 @@ double a = FPR_1;
 double b = FPR_2;
 double c = FPR_3;
 
+extern void gpr_child_loop(int *read_flag, int *write_flag,
+			   unsigned long *gpr_buf, double *fpr_buf);
+
 void gpr(void)
 {
-	unsigned long gpr_buf[18];
+	unsigned long gpr_buf[32];
 	double fpr_buf[32];
+	int i;
 
 	cptr = (int *)shmat(shm_id, NULL, 0);
+	memset(gpr_buf, 0, sizeof(gpr_buf));
+	memset(fpr_buf, 0, sizeof(fpr_buf));
 
-	asm __volatile__(
-		ASM_LOAD_GPR_IMMED(gpr_1)
-		ASM_LOAD_FPR(flt_1)
-		:
-		: [gpr_1]"i"(GPR_1), [flt_1] "b" (&a)
-		: "memory", "r6", "r7", "r8", "r9", "r10",
-		"r11", "r12", "r13", "r14", "r15", "r16", "r17",
-		"r18", "r19", "r20", "r21", "r22", "r23", "r24",
-		"r25", "r26", "r27", "r28", "r29", "r30", "r31"
-		);
-
-	cptr[1] = 1;
+	for (i = 0; i < 32; i++) {
+		gpr_buf[i] = GPR_1;
+		fpr_buf[i] = a;
+	}
 
-	while (!cptr[0])
-		asm volatile("" : : : "memory");
+	gpr_child_loop(&cptr[0], &cptr[1], gpr_buf, fpr_buf);
 
 	shmdt((void *)cptr);
-	store_gpr(gpr_buf);
-	store_fpr(fpr_buf);
 
 	if (validate_gpr(gpr_buf, GPR_3))
 		exit(1);
-- 
2.35.3

