Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACDE202E43
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 04:20:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49qtR01LzkzDqcq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 12:19:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49qtPT4xspzDq9l
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 12:18:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=popple.id.au header.i=@popple.id.au header.a=rsa-sha256
 header.s=202006 header.b=goiPjfYM; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49qtPT37Cnz9sRh;
 Mon, 22 Jun 2020 12:18:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=popple.id.au;
 s=202006; t=1592792317;
 bh=sDubs/f0fWSusH057s1AAuGeMhORgQk75m0E7J0egX0=;
 h=From:To:Cc:Subject:Date:From;
 b=goiPjfYMIxq8wlDk47z3yJRgHQ5LeKntQ7XIrNfwJNdqZBqIsla07LPd54RpuENhL
 uUhUHl1fk5Md/4MaRB3LkbUCikonrZ2GDniyxQtfCnY3tLCkAxcrMKb+OTvnsF6QIH
 gcqIH0rY4+/vvYs+kdjnXpYjp6s1yUrZWBn7JTQZvXs9ySuevtD3btQmL38V4UQJ/D
 TI3hiGFsWJnKfJYG9oAC/7cYoqelchK/Yuf3h5Aqz2AWiAm1aSxJg7S0pRYNbLDHvi
 8XDZojNecsYLxmlZ53km40hAUsJDCdK9M+8058+AP/O1tkJHZ9DDCeLCX316KAntaM
 xI07XCqSZFOaA==
From: Alistair Popple <alistair@popple.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: Add matrix multiply assist (MMA) test
Date: Mon, 22 Jun 2020 12:18:32 +1000
Message-Id: <20200622021832.15870-1-alistair@popple.id.au>
X-Mailer: git-send-email 2.20.1
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
Cc: mikey@neuling.org, Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adds a simple test of some basic matrix multiply assist (MMA)
instructions.

Signed-off-by: Alistair Popple <alistair@popple.id.au>
---
 .../testing/selftests/powerpc/include/utils.h |  5 ++
 tools/testing/selftests/powerpc/math/Makefile |  6 ++-
 tools/testing/selftests/powerpc/math/mma.S    | 33 +++++++++++++
 tools/testing/selftests/powerpc/math/mma.c    | 48 +++++++++++++++++++
 4 files changed, 90 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/math/mma.S
 create mode 100644 tools/testing/selftests/powerpc/math/mma.c

diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index e089a0c30d9a..c8bdc04c63a6 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -101,6 +101,11 @@ do {								\
 #define PPC_FEATURE2_ARCH_3_00 0x00800000
 #endif
 
+/* POWER10 features */
+#ifndef PPC_FEATURE2_MMA
+#define PPC_FEATURE2_MMA 0x00020000
+#endif
+
 #if defined(__powerpc64__)
 #define UCONTEXT_NIA(UC)	(UC)->uc_mcontext.gp_regs[PT_NIP]
 #define UCONTEXT_MSR(UC)	(UC)->uc_mcontext.gp_regs[PT_MSR]
diff --git a/tools/testing/selftests/powerpc/math/Makefile b/tools/testing/selftests/powerpc/math/Makefile
index 11a10d7a2bbd..c9a24c9d1119 100644
--- a/tools/testing/selftests/powerpc/math/Makefile
+++ b/tools/testing/selftests/powerpc/math/Makefile
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
-TEST_GEN_PROGS := fpu_syscall fpu_preempt fpu_signal vmx_syscall vmx_preempt vmx_signal vsx_preempt
+TEST_GEN_PROGS := fpu_syscall fpu_preempt fpu_signal vmx_syscall vmx_preempt vmx_signal vsx_preempt mma
 
 top_srcdir = ../../../../..
 include ../../lib.mk
 
-$(TEST_GEN_PROGS): ../harness.c
+$(TEST_GEN_PROGS): ../harness.c ../utils.c
 $(TEST_GEN_PROGS): CFLAGS += -O2 -g -pthread -m64 -maltivec
 
 $(OUTPUT)/fpu_syscall: fpu_asm.S
@@ -17,3 +17,5 @@ $(OUTPUT)/vmx_signal: vmx_asm.S
 
 $(OUTPUT)/vsx_preempt: CFLAGS += -mvsx
 $(OUTPUT)/vsx_preempt: vsx_asm.S
+
+$(OUTPUT)/mma: mma.c mma.S
diff --git a/tools/testing/selftests/powerpc/math/mma.S b/tools/testing/selftests/powerpc/math/mma.S
new file mode 100644
index 000000000000..8528c9849565
--- /dev/null
+++ b/tools/testing/selftests/powerpc/math/mma.S
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Test basic matrix multiply assist (MMA) functionality if available.
+ *
+ * Copyright 2020, Alistair Popple, IBM Corp.
+ */
+	.global test_mma
+test_mma:
+	/* Load accumulator via VSX registers from image passed in r3 */
+	lxvh8x	4,0,3
+	lxvh8x	5,0,4
+
+	/* Clear and prime the accumulator (xxsetaccz) */
+	.long	0x7c030162
+
+	/* Prime the accumulator with MMA VSX move to accumulator
+	* X-form (xxmtacc) (not needed due to above zeroing) */
+	//.long 0x7c010162
+
+	/* xvi16ger2s */
+	.long	0xec042958
+
+	/* Store result in image passed in r5 */
+	stxvw4x	0,0,5
+	addi	5,5,16
+	stxvw4x	1,0,5
+	addi	5,5,16
+	stxvw4x	2,0,5
+	addi	5,5,16
+	stxvw4x	3,0,5
+	addi	5,5,16
+
+	blr
diff --git a/tools/testing/selftests/powerpc/math/mma.c b/tools/testing/selftests/powerpc/math/mma.c
new file mode 100644
index 000000000000..c7278ea103e4
--- /dev/null
+++ b/tools/testing/selftests/powerpc/math/mma.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Test basic matrix multiply assist (MMA) functionality if available.
+ *
+ * Copyright 2020, Alistair Popple, IBM Corp.
+ */
+#include <stdio.h>
+#include <stdint.h>
+
+#include "utils.h"
+
+extern void test_mma(uint16_t (*)[8], uint16_t (*)[8], uint32_t (*)[4*4]);
+
+static int mma(void)
+{
+	int i;
+	int rc = 0;
+	uint16_t x[] = {1, 0, 2, 0, 3, 0, 4, 0};
+	uint16_t y[] = {1, 0, 2, 0, 3, 0, 4, 0};
+	uint32_t z[4*4];
+	uint32_t exp[4*4] = {1, 2, 3, 4,
+			     2, 4, 6, 8,
+			     3, 6, 9, 12,
+			     4, 8, 12, 16};
+
+	SKIP_IF_MSG(!have_hwcap2(PPC_FEATURE2_ARCH_3_10), "Need ISAv3.1");
+	SKIP_IF_MSG(!have_hwcap2(PPC_FEATURE2_MMA), "Need MMA");
+
+	test_mma(&x, &y, &z);
+
+	for (i = 0; i < 16; i++) {
+		printf("MMA[%d] = %d ", i, z[i]);
+
+		if (z[i] == exp[i]) {
+			printf(" (Correct)\n");
+		} else {
+			printf(" (Incorrect)\n");
+			rc = 1;
+		}
+	}
+
+	return rc;
+}
+
+int main(int argc, char *argv[])
+{
+	return test_harness(mma, "mma");
+}
-- 
2.20.1

