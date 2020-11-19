Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 072BA2B9E13
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 00:25:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcbPy3HlmzDqvR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 10:25:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=mzKLrau8; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ccb8n0W7RzDqtW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Nov 2020 10:14:00 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id a18so6006879pfl.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 15:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rwk+QW7FdWny6nDirdRfiZzcgaidxkWwf9/+zmB9OBY=;
 b=mzKLrau8TxKHGC1n9fbB0VcYzgBp4uwdEU1ETmEuV7vHV2dgfzbdfcQQQXKxF27t/E
 OUsO77a6VwHuwPYqhqyIT7G08jurdFyKP4sZYAVvvRjmqotjalZOK/NvXVnHZzEkVcI8
 9XGBXHFsphRx7fZkGXKTNpaF1x3B6LM8mLYGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rwk+QW7FdWny6nDirdRfiZzcgaidxkWwf9/+zmB9OBY=;
 b=P4bzd9ILePy0pN3NRw17viWsLRnUmphgZXeF/tThNrgQ0YgcFu9Wruw98CRX7+Nc0J
 E0j99nu/b9C30i714y83azaW17XEKpHW1JtHGL/Urr0KTeyxd0YazLgGzYQ5EIfsSNRe
 l3QLW8E2fbUxq8L8eYv2oj+b7HUDG93885olV4t2kSzDU9gJMXR3KO9IjFUBAEmN4VSp
 b/7w3bfcXiz9XDLHzy5Jp66QYGDOGgofog/Z2ps9e0QtVaRLaJrQf654KNfLMh/x2PLB
 Nnt22+XJA/EQ4VmTB0qbsma/sroDsZv91rBc1KsVJ1/hFb4CUSlGpA27cgU7B0wGyNQJ
 P7EQ==
X-Gm-Message-State: AOAM5308uIZUOefTaDDkMaGwWoqw7eys0yaXePFjV9XFSwiqGQ/QHmQf
 YffrD2RN8gizQvicmil4vlrLxI86ZFqt5g==
X-Google-Smtp-Source: ABdhPJyShvbLK1+WS5iVE8/JqZOqI6U329u63iRuW+7TUVWzg1Q+ktrnKbWh4v1DJih4isWKwjzymw==
X-Received: by 2002:a63:2e41:: with SMTP id u62mr15006141pgu.235.1605827637846; 
 Thu, 19 Nov 2020 15:13:57 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-4d44-522c-3789-8f33.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:4d44:522c:3789:8f33])
 by smtp.gmail.com with ESMTPSA id f134sm994518pfa.208.2020.11.19.15.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 15:13:57 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/7] selftests/powerpc: entry flush test
Date: Fri, 20 Nov 2020 10:13:31 +1100
Message-Id: <20201119231333.361771-6-dja@axtens.net>
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

Add a test modelled on the RFI flush test which counts the number
of L1D misses doing a simple syscall with the entry flush on and off.

For simplicity of backporting, this test duplicates a lot of code from
rfi_flush. We clean that up in the next patch.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 .../selftests/powerpc/security/.gitignore     |   1 +
 .../selftests/powerpc/security/Makefile       |   2 +-
 .../selftests/powerpc/security/entry_flush.c  | 198 ++++++++++++++++++
 3 files changed, 200 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/security/entry_flush.c

diff --git a/tools/testing/selftests/powerpc/security/.gitignore b/tools/testing/selftests/powerpc/security/.gitignore
index f795e06f5ae3..4257a1f156bb 100644
--- a/tools/testing/selftests/powerpc/security/.gitignore
+++ b/tools/testing/selftests/powerpc/security/.gitignore
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 rfi_flush
+entry_flush
diff --git a/tools/testing/selftests/powerpc/security/Makefile b/tools/testing/selftests/powerpc/security/Makefile
index eadbbff50be6..921152caf1dc 100644
--- a/tools/testing/selftests/powerpc/security/Makefile
+++ b/tools/testing/selftests/powerpc/security/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0+
 
-TEST_GEN_PROGS := rfi_flush spectre_v2
+TEST_GEN_PROGS := rfi_flush entry_flush spectre_v2
 top_srcdir = ../../../../..
 
 CFLAGS += -I../../../../../usr/include
diff --git a/tools/testing/selftests/powerpc/security/entry_flush.c b/tools/testing/selftests/powerpc/security/entry_flush.c
new file mode 100644
index 000000000000..7ae7e37204c5
--- /dev/null
+++ b/tools/testing/selftests/powerpc/security/entry_flush.c
@@ -0,0 +1,198 @@
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
+#include <malloc.h>
+#include <unistd.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <string.h>
+#include <stdio.h>
+#include "utils.h"
+
+#define CACHELINE_SIZE 128
+
+struct perf_event_read {
+	__u64 nr;
+	__u64 l1d_misses;
+};
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
+static void syscall_loop(char *p, unsigned long iterations,
+			 unsigned long zero_size)
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
+static void set_dscr(unsigned long val)
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
+
+int entry_flush_test(void)
+{
+	char *p;
+	int repetitions = 10;
+	int fd, passes = 0, iter, rc = 0;
+	struct perf_event_read v;
+	__u64 l1d_misses_total = 0;
+	unsigned long iterations = 100000, zero_size = 24 * 1024;
+	unsigned long l1d_misses_expected;
+	int rfi_flush_orig;
+	int entry_flush, entry_flush_orig;
+
+	SKIP_IF(geteuid() != 0);
+
+	// The PMU event we use only works on Power7 or later
+	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06));
+
+	if (read_debugfs_file("powerpc/rfi_flush", &rfi_flush_orig) < 0) {
+		perror("Unable to read powerpc/rfi_flush debugfs file");
+		SKIP_IF(1);
+	}
+
+	if (read_debugfs_file("powerpc/entry_flush", &entry_flush_orig) < 0) {
+		perror("Unable to read powerpc/entry_flush debugfs file");
+		SKIP_IF(1);
+	}
+
+	if (rfi_flush_orig != 0) {
+		if (write_debugfs_file("powerpc/rfi_flush", 0) < 0) {
+			perror("error writing to powerpc/rfi_flush debugfs file");
+			FAIL_IF(1);
+		}
+	}
+
+	entry_flush = entry_flush_orig;
+
+	fd = perf_event_open_counter(PERF_TYPE_RAW, /* L1d miss */ 0x400f0, -1);
+	FAIL_IF(fd < 0);
+
+	p = (char *)memalign(zero_size, CACHELINE_SIZE);
+
+	FAIL_IF(perf_event_enable(fd));
+
+	// disable L1 prefetching
+	set_dscr(1);
+
+	iter = repetitions;
+
+	/*
+	 * We expect to see l1d miss for each cacheline access when entry_flush
+	 * is set. Allow a small variation on this.
+	 */
+	l1d_misses_expected = iterations * (zero_size / CACHELINE_SIZE - 2);
+
+again:
+	FAIL_IF(perf_event_reset(fd));
+
+	syscall_loop(p, iterations, zero_size);
+
+	FAIL_IF(read(fd, &v, sizeof(v)) != sizeof(v));
+
+	if (entry_flush && v.l1d_misses >= l1d_misses_expected)
+		passes++;
+	else if (!entry_flush && v.l1d_misses < (l1d_misses_expected / 2))
+		passes++;
+
+	l1d_misses_total += v.l1d_misses;
+
+	while (--iter)
+		goto again;
+
+	if (passes < repetitions) {
+		printf("FAIL (L1D misses with entry_flush=%d: %llu %c %lu) [%d/%d failures]\n",
+		       entry_flush, l1d_misses_total, entry_flush ? '<' : '>',
+		       entry_flush ? repetitions * l1d_misses_expected :
+		       repetitions * l1d_misses_expected / 2,
+		       repetitions - passes, repetitions);
+		rc = 1;
+	} else {
+		printf("PASS (L1D misses with entry_flush=%d: %llu %c %lu) [%d/%d pass]\n",
+		       entry_flush, l1d_misses_total, entry_flush ? '>' : '<',
+		       entry_flush ? repetitions * l1d_misses_expected :
+		       repetitions * l1d_misses_expected / 2,
+		       passes, repetitions);
+	}
+
+	if (entry_flush == entry_flush_orig) {
+		entry_flush = !entry_flush_orig;
+		if (write_debugfs_file("powerpc/entry_flush", entry_flush) < 0) {
+			perror("error writing to powerpc/entry_flush debugfs file");
+			return 1;
+		}
+		iter = repetitions;
+		l1d_misses_total = 0;
+		passes = 0;
+		goto again;
+	}
+
+	perf_event_disable(fd);
+	close(fd);
+
+	set_dscr(0);
+
+	if (write_debugfs_file("powerpc/rfi_flush", rfi_flush_orig) < 0) {
+		perror("unable to restore original value of powerpc/rfi_flush debugfs file");
+		return 1;
+	}
+
+	if (write_debugfs_file("powerpc/entry_flush", entry_flush_orig) < 0) {
+		perror("unable to restore original value of powerpc/entry_flush debugfs file");
+		return 1;
+	}
+
+	return rc;
+}
+
+int main(int argc, char *argv[])
+{
+	return test_harness(entry_flush_test, "entry_flush_test");
+}
-- 
2.25.1

