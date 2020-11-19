Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 950E72B9E4E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 00:27:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcbSF6JH1zDqpB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 10:27:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=QwWezDWE; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ccb8r6gYFzDqsy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 10:14:04 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id w4so5609434pgg.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 15:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dJ4kb0iK5eBB++5Ev6/x4lKgN4Y1TXDfiBMiWWxa16I=;
 b=QwWezDWEuj2PfWJtsdnQI235yQoNGLnRimpAOnzNlQ3N+zJkAYYglfmJtWNXvaU1m7
 FxEw486h67QQLM7kIla3S0URBJgHj31Mk0XzPLduYRKz3rJUu6XKppqBUYmR5crRZaOO
 ZI3V4RWlYlBUdcd2LC0KenIruHy2OK0UF8H3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dJ4kb0iK5eBB++5Ev6/x4lKgN4Y1TXDfiBMiWWxa16I=;
 b=rp14DvmYjtOkgohbytvFtrNCXAtva9KZe1mPgo8dAXbCucu8JY9KgIfpX+zoUVcu1I
 HpYI4YfyUrXQHV/sbSoG0DPaFANrsQIJCnRe7ktGSNI5sa3o8l2085xzh4wO3GEQW2bC
 0KX9jxlTpY9GWJOoT0vQm0NNfh+863G1qdPAiw9nemMXGy5/DxVALXEMxj+fiA5LrnFt
 NoJy0Pz+JF4HkIYrojEHr3GiMRf3GtZazF8b5b892uQvkeJBIsxk2CRufvWkJZwl7Txz
 X5Mvw0k9JRF6MX5LauTG+1KyDoLNpTDZi/Fu8tCHInakkTS67w1Efg3r1LRaXHMkEV99
 Re/Q==
X-Gm-Message-State: AOAM532vusEsAYN4S5afu0R78fW17RHLh3uAkvvUlDqClWj1onVJSA6U
 kKy/mUJmaiXQOnxQoKgWMaB0iEX7ozGcRg==
X-Google-Smtp-Source: ABdhPJwvhJJgNN1BCsWaRfoBmAexf6P5hdk1e3qqAdONO/G4B6BJcoiO17hY8gtC9e5V96LE0c57iA==
X-Received: by 2002:a63:9d01:: with SMTP id i1mr2310925pgd.50.1605827641601;
 Thu, 19 Nov 2020 15:14:01 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-4d44-522c-3789-8f33.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:4d44:522c:3789:8f33])
 by smtp.gmail.com with ESMTPSA id a12sm1059397pfl.191.2020.11.19.15.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 15:14:01 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 6/7] selftests/powerpc: refactor entry and rfi_flush tests
Date: Fri, 20 Nov 2020 10:13:32 +1100
Message-Id: <20201119231333.361771-7-dja@axtens.net>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119231333.361771-1-dja@axtens.net>
References: <20201119231333.361771-1-dja@axtens.net>
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
Cc: dja@axtens.net, cmr@informatik.wtf, spoorts2@in.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For simplicity in backporting, the original entry_flush test contained
a lot of duplicated code from the rfi_flush test. De-duplicate that code.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 .../testing/selftests/powerpc/include/utils.h |  5 ++
 .../selftests/powerpc/security/Makefile       |  2 +
 .../selftests/powerpc/security/entry_flush.c  | 61 +---------------
 .../selftests/powerpc/security/flush_utils.c  | 70 +++++++++++++++++++
 .../selftests/powerpc/security/flush_utils.h  | 17 +++++
 .../selftests/powerpc/security/rfi_flush.c    | 61 +---------------
 6 files changed, 96 insertions(+), 120 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/security/flush_utils.c
 create mode 100644 tools/testing/selftests/powerpc/security/flush_utils.h

diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index 052b5a775dc2..b7d188fc87c7 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -42,6 +42,11 @@ int perf_event_enable(int fd);
 int perf_event_disable(int fd);
 int perf_event_reset(int fd);
 
+struct perf_event_read {
+	__u64 nr;
+	__u64 l1d_misses;
+};
+
 #if !defined(__GLIBC_PREREQ) || !__GLIBC_PREREQ(2, 30)
 #include <unistd.h>
 #include <sys/syscall.h>
diff --git a/tools/testing/selftests/powerpc/security/Makefile b/tools/testing/selftests/powerpc/security/Makefile
index 921152caf1dc..f25e854fe370 100644
--- a/tools/testing/selftests/powerpc/security/Makefile
+++ b/tools/testing/selftests/powerpc/security/Makefile
@@ -11,3 +11,5 @@ $(TEST_GEN_PROGS): ../harness.c ../utils.c
 
 $(OUTPUT)/spectre_v2: CFLAGS += -m64
 $(OUTPUT)/spectre_v2: ../pmu/event.c branch_loops.S
+$(OUTPUT)/rfi_flush: flush_utils.c
+$(OUTPUT)/entry_flush: flush_utils.c
diff --git a/tools/testing/selftests/powerpc/security/entry_flush.c b/tools/testing/selftests/powerpc/security/entry_flush.c
index 7ae7e37204c5..78cf914fa321 100644
--- a/tools/testing/selftests/powerpc/security/entry_flush.c
+++ b/tools/testing/selftests/powerpc/security/entry_flush.c
@@ -15,66 +15,7 @@
 #include <string.h>
 #include <stdio.h>
 #include "utils.h"
-
-#define CACHELINE_SIZE 128
-
-struct perf_event_read {
-	__u64 nr;
-	__u64 l1d_misses;
-};
-
-static inline __u64 load(void *addr)
-{
-	__u64 tmp;
-
-	asm volatile("ld %0,0(%1)" : "=r"(tmp) : "b"(addr));
-
-	return tmp;
-}
-
-static void syscall_loop(char *p, unsigned long iterations,
-			 unsigned long zero_size)
-{
-	for (unsigned long i = 0; i < iterations; i++) {
-		for (unsigned long j = 0; j < zero_size; j += CACHELINE_SIZE)
-			load(p + j);
-		getppid();
-	}
-}
-
-static void sigill_handler(int signr, siginfo_t *info, void *unused)
-{
-	static int warned;
-	ucontext_t *ctx = (ucontext_t *)unused;
-	unsigned long *pc = &UCONTEXT_NIA(ctx);
-
-	/* mtspr 3,RS to check for move to DSCR below */
-	if ((*((unsigned int *)*pc) & 0xfc1fffff) == 0x7c0303a6) {
-		if (!warned++)
-			printf("WARNING: Skipping over dscr setup. Consider running 'ppc64_cpu --dscr=1' manually.\n");
-		*pc += 4;
-	} else {
-		printf("SIGILL at %p\n", pc);
-		abort();
-	}
-}
-
-static void set_dscr(unsigned long val)
-{
-	static int init;
-	struct sigaction sa;
-
-	if (!init) {
-		memset(&sa, 0, sizeof(sa));
-		sa.sa_sigaction = sigill_handler;
-		sa.sa_flags = SA_SIGINFO;
-		if (sigaction(SIGILL, &sa, NULL))
-			perror("sigill_handler");
-		init = 1;
-	}
-
-	asm volatile("mtspr %1,%0" : : "r" (val), "i" (SPRN_DSCR));
-}
+#include "flush_utils.h"
 
 int entry_flush_test(void)
 {
diff --git a/tools/testing/selftests/powerpc/security/flush_utils.c b/tools/testing/selftests/powerpc/security/flush_utils.c
new file mode 100644
index 000000000000..0c3c4c40c7fb
--- /dev/null
+++ b/tools/testing/selftests/powerpc/security/flush_utils.c
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2018 IBM Corporation.
+ */
+
+#define __SANE_USERSPACE_TYPES__
+
+#include <sys/types.h>
+#include <stdint.h>
+#include <unistd.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdio.h>
+#include "utils.h"
+#include "flush_utils.h"
+
+static inline __u64 load(void *addr)
+{
+	__u64 tmp;
+
+	asm volatile("ld %0,0(%1)" : "=r"(tmp) : "b"(addr));
+
+	return tmp;
+}
+
+void syscall_loop(char *p, unsigned long iterations,
+		  unsigned long zero_size)
+{
+	for (unsigned long i = 0; i < iterations; i++) {
+		for (unsigned long j = 0; j < zero_size; j += CACHELINE_SIZE)
+			load(p + j);
+		getppid();
+	}
+}
+
+static void sigill_handler(int signr, siginfo_t *info, void *unused)
+{
+	static int warned;
+	ucontext_t *ctx = (ucontext_t *)unused;
+	unsigned long *pc = &UCONTEXT_NIA(ctx);
+
+	/* mtspr 3,RS to check for move to DSCR below */
+	if ((*((unsigned int *)*pc) & 0xfc1fffff) == 0x7c0303a6) {
+		if (!warned++)
+			printf("WARNING: Skipping over dscr setup. Consider running 'ppc64_cpu --dscr=1' manually.\n");
+		*pc += 4;
+	} else {
+		printf("SIGILL at %p\n", pc);
+		abort();
+	}
+}
+
+void set_dscr(unsigned long val)
+{
+	static int init;
+	struct sigaction sa;
+
+	if (!init) {
+		memset(&sa, 0, sizeof(sa));
+		sa.sa_sigaction = sigill_handler;
+		sa.sa_flags = SA_SIGINFO;
+		if (sigaction(SIGILL, &sa, NULL))
+			perror("sigill_handler");
+		init = 1;
+	}
+
+	asm volatile("mtspr %1,%0" : : "r" (val), "i" (SPRN_DSCR));
+}
diff --git a/tools/testing/selftests/powerpc/security/flush_utils.h b/tools/testing/selftests/powerpc/security/flush_utils.h
new file mode 100644
index 000000000000..07a5eb301466
--- /dev/null
+++ b/tools/testing/selftests/powerpc/security/flush_utils.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+/*
+ * Copyright 2018 IBM Corporation.
+ */
+
+#ifndef _SELFTESTS_POWERPC_SECURITY_FLUSH_UTILS_H
+#define _SELFTESTS_POWERPC_SECURITY_FLUSH_UTILS_H
+
+#define CACHELINE_SIZE 128
+
+void syscall_loop(char *p, unsigned long iterations,
+		  unsigned long zero_size);
+
+void set_dscr(unsigned long val);
+
+#endif /* _SELFTESTS_POWERPC_SECURITY_FLUSH_UTILS_H */
diff --git a/tools/testing/selftests/powerpc/security/rfi_flush.c b/tools/testing/selftests/powerpc/security/rfi_flush.c
index 4e7b2776c367..7565fd786640 100644
--- a/tools/testing/selftests/powerpc/security/rfi_flush.c
+++ b/tools/testing/selftests/powerpc/security/rfi_flush.c
@@ -10,71 +10,12 @@
 #include <stdint.h>
 #include <malloc.h>
 #include <unistd.h>
-#include <signal.h>
 #include <stdlib.h>
 #include <string.h>
 #include <stdio.h>
 #include "utils.h"
+#include "flush_utils.h"
 
-#define CACHELINE_SIZE 128
-
-struct perf_event_read {
-	__u64 nr;
-	__u64 l1d_misses;
-};
-
-static inline __u64 load(void *addr)
-{
-	__u64 tmp;
-
-	asm volatile("ld %0,0(%1)" : "=r"(tmp) : "b"(addr));
-
-	return tmp;
-}
-
-static void syscall_loop(char *p, unsigned long iterations,
-			 unsigned long zero_size)
-{
-	for (unsigned long i = 0; i < iterations; i++) {
-		for (unsigned long j = 0; j < zero_size; j += CACHELINE_SIZE)
-			load(p + j);
-		getppid();
-	}
-}
-
-static void sigill_handler(int signr, siginfo_t *info, void *unused)
-{
-	static int warned = 0;
-	ucontext_t *ctx = (ucontext_t *)unused;
-	unsigned long *pc = &UCONTEXT_NIA(ctx);
-
-	/* mtspr 3,RS to check for move to DSCR below */
-	if ((*((unsigned int *)*pc) & 0xfc1fffff) == 0x7c0303a6) {
-		if (!warned++)
-			printf("WARNING: Skipping over dscr setup. Consider running 'ppc64_cpu --dscr=1' manually.\n");
-		*pc += 4;
-	} else {
-		printf("SIGILL at %p\n", pc);
-		abort();
-	}
-}
-
-static void set_dscr(unsigned long val)
-{
-	static int init = 0;
-	struct sigaction sa;
-
-	if (!init) {
-		memset(&sa, 0, sizeof(sa));
-		sa.sa_sigaction = sigill_handler;
-		sa.sa_flags = SA_SIGINFO;
-		if (sigaction(SIGILL, &sa, NULL))
-			perror("sigill_handler");
-		init = 1;
-	}
-
-	asm volatile("mtspr %1,%0" : : "r" (val), "i" (SPRN_DSCR));
-}
 
 int rfi_flush_test(void)
 {
-- 
2.25.1

