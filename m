Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B6A47C106
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 14:51:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJHtr75RDz3c7X
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Dec 2021 00:51:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=J5pG9+BJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJHtD5VtSz2yb5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Dec 2021 00:51:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=J5pG9+BJ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JJHtD2hC2z4xmw;
 Wed, 22 Dec 2021 00:51:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1640094676;
 bh=ezPXUv5+nw6NHWDgONhT6tdR1kAn7ZIOV6VY52Fxh/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J5pG9+BJvbAtezLFXIvhkBBXcZZV26AWYzrAMMjtcs8luNXlYU0kZbbyVkqULDola
 nGD/57Pj+HbhnWuD5rcN9Qq2x84BCyCI0TsayULQ47w8ghhumoHcskvFGX92jntPg2
 q3J5I1YwnjJhLt4klGKEor9IprcC5e5avHbzhxa+5V79lCRoADa1QytGRaZkkPR5L3
 +UINtH5j3Sij5nuie3Dtzpw2aQx7Ns3/7jxdwoRZfgmSNX7nEiZ4ixCwJF8W7LUVEX
 4NWnJEbsOn9PHa+4qWOBs7N4XcFOdcPVLpCxq+0m+rQjED8vEpRDTbS4xnx65FcvuJ
 5dQK6wThSzDlw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/3] selftests/powerpc: Add a test of sigreturning to an
 unaligned address
Date: Wed, 22 Dec 2021 00:51:01 +1100
Message-Id: <20211221135101.2085547-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211221135101.2085547-1-mpe@ellerman.id.au>
References: <20211221135101.2085547-1-mpe@ellerman.id.au>
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
Cc: sachinp@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a test of sigreturning to an unaligned address (low two bits set).
This should have no effect because the hardware will mask those bits.
However it previously falsely triggered a warning when
CONFIG_PPC_RFI_SRR_DEBUG=y.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../selftests/powerpc/signal/.gitignore       |  1 +
 .../testing/selftests/powerpc/signal/Makefile |  1 +
 .../powerpc/signal/sigreturn_unaligned.c      | 43 +++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/signal/sigreturn_unaligned.c

diff --git a/tools/testing/selftests/powerpc/signal/.gitignore b/tools/testing/selftests/powerpc/signal/.gitignore
index 8f6c816099a4..9d0915777fed 100644
--- a/tools/testing/selftests/powerpc/signal/.gitignore
+++ b/tools/testing/selftests/powerpc/signal/.gitignore
@@ -5,3 +5,4 @@ sigfuz
 sigreturn_vdso
 sig_sc_double_restart
 sigreturn_kernel
+sigreturn_unaligned
diff --git a/tools/testing/selftests/powerpc/signal/Makefile b/tools/testing/selftests/powerpc/signal/Makefile
index 84e201572466..f679d260afc8 100644
--- a/tools/testing/selftests/powerpc/signal/Makefile
+++ b/tools/testing/selftests/powerpc/signal/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 TEST_GEN_PROGS := signal signal_tm sigfuz sigreturn_vdso sig_sc_double_restart
 TEST_GEN_PROGS += sigreturn_kernel
+TEST_GEN_PROGS += sigreturn_unaligned
 
 CFLAGS += -maltivec
 $(OUTPUT)/signal_tm: CFLAGS += -mhtm
diff --git a/tools/testing/selftests/powerpc/signal/sigreturn_unaligned.c b/tools/testing/selftests/powerpc/signal/sigreturn_unaligned.c
new file mode 100644
index 000000000000..6e58ee4f0fdf
--- /dev/null
+++ b/tools/testing/selftests/powerpc/signal/sigreturn_unaligned.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test sigreturn to an unaligned address, ie. low 2 bits set.
+ * Nothing bad should happen.
+ * This was able to trigger warnings with CONFIG_PPC_RFI_SRR_DEBUG=y.
+ */
+
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <ucontext.h>
+#include <unistd.h>
+
+#include "utils.h"
+
+
+static void sigusr1_handler(int signo, siginfo_t *info, void *ptr)
+{
+	ucontext_t *uc = ptr;
+
+	UCONTEXT_NIA(uc) |= 3;
+}
+
+static int test_sigreturn_unaligned(void)
+{
+	struct sigaction action;
+
+	memset(&action, 0, sizeof(action));
+	action.sa_sigaction = sigusr1_handler;
+	action.sa_flags = SA_SIGINFO;
+
+	FAIL_IF(sigaction(SIGUSR1, &action, NULL) == -1);
+
+	raise(SIGUSR1);
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(test_sigreturn_unaligned, "sigreturn_unaligned");
+}
-- 
2.31.1

