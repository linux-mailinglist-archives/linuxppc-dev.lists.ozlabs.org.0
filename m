Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95072178F35
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 12:05:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XWJ53q2KzDqfv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 22:05:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XWGZ4n9QzDqML
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 22:04:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=GjjpaZb1; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48XWGZ188kz9sR4; Wed,  4 Mar 2020 22:04:06 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48XWGZ0D9yz9sSG; Wed,  4 Mar 2020 22:04:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583319846;
 bh=b9nSCCm8tvdZujPFYesDAUQRod1GVZF/XpCS/op8SKE=;
 h=From:To:Subject:Date:From;
 b=GjjpaZb1JH3ClLuirR1w0IyoDM6QE56AvWlXcsW5tllFnzm4ImH57mFnj7j8HxEB2
 ez52NRaGTpRp900b2v+XMoUp8f4GByECIWqG08GrIIWwYZTNBWJ081KO/4kJYuDJU5
 hT9Cqhlo/sjQYd6AkoCiEbInhdgvyE5KziPKhwD55BMhRH+RuTW8077aGec2AX7QFv
 THT8KpGJtHb7IjPSgk4DFi6aAy3UF8SuVgT0DOkcpsBNv4moU9IpiNUa77Vneb6kbI
 RI0h/KlmxibrFwkIqz9oh/SS13WKP82DsO4+uaxh1izW41S10bBFRd42agfBgP1Ra9
 TbPuT+qV1J3/g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] selftests/powerpc: Add a test of sigreturn vs VDSO
Date: Wed,  4 Mar 2020 22:04:02 +1100
Message-Id: <20200304110402.6038-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There's two different paths through the sigreturn code, depending on
whether the VDSO is mapped or not. We recently discovered a bug in the
unmapped case, because it's not commonly used these days.

So add a test that sends itself a signal, then moves the VDSO, takes
another signal and finally unmaps the VDSO before sending itself
another signal. That tests the standard signal path, the code that
handles the VDSO being moved, and also the signal path in the case
where the VDSO is unmapped.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../selftests/powerpc/signal/.gitignore       |   1 +
 .../testing/selftests/powerpc/signal/Makefile |   2 +-
 .../selftests/powerpc/signal/sigreturn_vdso.c | 127 ++++++++++++++++++
 3 files changed, 129 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/signal/sigreturn_vdso.c

diff --git a/tools/testing/selftests/powerpc/signal/.gitignore b/tools/testing/selftests/powerpc/signal/.gitignore
index dca5852a1546..03dafa795255 100644
--- a/tools/testing/selftests/powerpc/signal/.gitignore
+++ b/tools/testing/selftests/powerpc/signal/.gitignore
@@ -1,3 +1,4 @@
 signal
 signal_tm
 sigfuz
+sigreturn_vdso
diff --git a/tools/testing/selftests/powerpc/signal/Makefile b/tools/testing/selftests/powerpc/signal/Makefile
index 113838fbbe7f..63b57583e07d 100644
--- a/tools/testing/selftests/powerpc/signal/Makefile
+++ b/tools/testing/selftests/powerpc/signal/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-TEST_GEN_PROGS := signal signal_tm sigfuz
+TEST_GEN_PROGS := signal signal_tm sigfuz sigreturn_vdso
 
 CFLAGS += -maltivec
 $(OUTPUT)/signal_tm: CFLAGS += -mhtm
diff --git a/tools/testing/selftests/powerpc/signal/sigreturn_vdso.c b/tools/testing/selftests/powerpc/signal/sigreturn_vdso.c
new file mode 100644
index 000000000000..e282fff0fe25
--- /dev/null
+++ b/tools/testing/selftests/powerpc/signal/sigreturn_vdso.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test that we can take signals with and without the VDSO mapped, which trigger
+ * different paths in the signal handling code.
+ *
+ * See handle_rt_signal64() and setup_trampoline() in signal_64.c
+ */
+
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <stdio.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+// Ensure assert() is not compiled out
+#undef NDEBUG
+#include <assert.h>
+
+#include "utils.h"
+
+static int search_proc_maps(char *needle, unsigned long *low, unsigned long *high)
+{
+	unsigned long start, end;
+	static char buf[4096];
+	char name[128];
+	FILE *f;
+	int rc = -1;
+
+	f = fopen("/proc/self/maps", "r");
+	if (!f) {
+		perror("fopen");
+		return -1;
+	}
+
+	while (fgets(buf, sizeof(buf), f)) {
+		rc = sscanf(buf, "%lx-%lx %*c%*c%*c%*c %*x %*d:%*d %*d %127s\n",
+			    &start, &end, name);
+		if (rc == 2)
+			continue;
+
+		if (rc != 3) {
+			printf("sscanf errored\n");
+			rc = -1;
+			break;
+		}
+
+		if (strstr(name, needle)) {
+			*low = start;
+			*high = end - 1;
+			rc = 0;
+			break;
+		}
+	}
+
+	fclose(f);
+
+	return rc;
+}
+
+static volatile sig_atomic_t took_signal = 0;
+
+static void sigusr1_handler(int sig)
+{
+	took_signal++;
+}
+
+int test_sigreturn_vdso(void)
+{
+	unsigned long low, high, size;
+	struct sigaction act;
+	char *p;
+
+	act.sa_handler = sigusr1_handler;
+	act.sa_flags = 0;
+	sigemptyset(&act.sa_mask);
+
+	assert(sigaction(SIGUSR1, &act, NULL) == 0);
+
+	// Confirm the VDSO is mapped, and work out where it is
+	assert(search_proc_maps("[vdso]", &low, &high) == 0);
+	size = high - low + 1;
+	printf("VDSO is at 0x%lx-0x%lx (%lu bytes)\n", low, high, size);
+
+	kill(getpid(), SIGUSR1);
+	assert(took_signal == 1);
+	printf("Signal delivered OK with VDSO mapped\n");
+
+	// Remap the VDSO somewhere else
+	p = mmap(NULL, size, PROT_READ|PROT_WRITE, MAP_ANONYMOUS|MAP_PRIVATE, -1, 0);
+	assert(p != MAP_FAILED);
+	assert(mremap((void *)low, size, size, MREMAP_MAYMOVE|MREMAP_FIXED, p) != MAP_FAILED);
+	assert(search_proc_maps("[vdso]", &low, &high) == 0);
+	size = high - low + 1;
+	printf("VDSO moved to 0x%lx-0x%lx (%lu bytes)\n", low, high, size);
+
+	kill(getpid(), SIGUSR1);
+	assert(took_signal == 2);
+	printf("Signal delivered OK with VDSO moved\n");
+
+	assert(munmap((void *)low, size) == 0);
+	printf("Unmapped VDSO\n");
+
+	// Confirm the VDSO is not mapped anymore
+	assert(search_proc_maps("[vdso]", &low, &high) != 0);
+
+	// Make the stack executable
+	assert(search_proc_maps("[stack]", &low, &high) == 0);
+	size = high - low + 1;
+	mprotect((void *)low, size, PROT_READ|PROT_WRITE|PROT_EXEC);
+	printf("Remapped the stack executable\n");
+
+	kill(getpid(), SIGUSR1);
+	assert(took_signal == 3);
+	printf("Signal delivered OK with VDSO unmapped\n");
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(test_sigreturn_vdso, "sigreturn_vdso");
+}
-- 
2.21.1

