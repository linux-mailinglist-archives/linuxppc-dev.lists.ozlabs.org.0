Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E6443324A7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 07:20:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmN216jwTz3cch
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 17:20:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=hJLZ1hic;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=hJLZ1hic; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmN1Z1jLtz30Qk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 17:19:59 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id r5so2903171pfh.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 22:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pJhYswlu21mX3d9RmmMi0LSudEgv8eUU4kMgRtxiQ3o=;
 b=hJLZ1hicHcjTu9QnPIGROx2A8IgjeCGMSq/ltZ8ZD8BdqHvCPK5hiK9qkR1Uffbf71
 8X02FeGzvzLNRL6K0YZUAxf92qK6cVy8CnPaOpEWXDSA+XzajkTg1DlHBi1U+aakrECv
 2/OWCEqvbJ4XozLZRc0S6BrDE7ckZrUbEM4vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pJhYswlu21mX3d9RmmMi0LSudEgv8eUU4kMgRtxiQ3o=;
 b=myJGP/gmOSmZhs8TFv5WZ6b4FR02Ur/BnVzCVb5ng7psK7gt9Eb+gOL3g+wdaZJMLn
 FC5FVohy6wP2vT0frEQnhGe2A4GyYObErnesqqFoVvrAws6SPhNWmZL+56Pq/zheuBQx
 F4B9Pe7MrqSCrRCjNO4umjmqduCsOrtcvl9IhYccRi6JNPEnCI4YZkghMftVGnnq9fEw
 82wgFsX4uMqv6/YpcjO/f+TIHfT89Bkd1BOQbbt3wWkUv5flETRns7azUD1zRDRq7RT4
 HvATlqnsk12zr8X1C15VUjuRsk5KF3ZunWle1UdUcdeECOE7hAJMHWU4R17koKuKaEtO
 mxjw==
X-Gm-Message-State: AOAM531CabG2jq1TyxBJfkLc1d10e7DcHURtK4C/6cYoDGe1SQKZ0BcU
 t3rebthn+OUVbjksNu5+nPeb4dW+w7pu7cpI
X-Google-Smtp-Source: ABdhPJx+qVbzNiIi2VlKk5EuJFzoaoCqYz6hIraPqca2YI07Di8kWYAzXkJcYb46pYu6xEEMPAGGRQ==
X-Received: by 2002:a62:7d8a:0:b029:1ed:7164:291 with SMTP id
 y132-20020a627d8a0000b02901ed71640291mr1780625pfc.65.1614233994115; 
 Wed, 24 Feb 2021 22:19:54 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-6e65-7e50-8dac-f7ef.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:6e65:7e50:8dac:f7ef])
 by smtp.gmail.com with ESMTPSA id e12sm4814473pjj.23.2021.02.24.22.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 22:19:53 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: Add uaccess flush test
Date: Thu, 25 Feb 2021 17:19:49 +1100
Message-Id: <20210225061949.1213404-1-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>

Also based on the RFI and entry flush tests, it counts the L1D misses
by doing a syscall that does user access: uname, in this case.

Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
[dja: forward port, rename function]
Signed-off-by: Daniel Axtens <dja@axtens.net>

---

This applies on top of Russell's change to use better constants:
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210223070227.2916871-1-ruscur@russell.cc/

It's possible that we could share some more code between the tests, but
it hardly seems worth it.
---
 .../selftests/powerpc/security/Makefile       |   3 +-
 .../selftests/powerpc/security/flush_utils.c  |  13 ++
 .../selftests/powerpc/security/flush_utils.h  |   3 +
 .../powerpc/security/uaccess_flush.c          | 158 ++++++++++++++++++
 4 files changed, 176 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/security/uaccess_flush.c

diff --git a/tools/testing/selftests/powerpc/security/Makefile b/tools/testing/selftests/powerpc/security/Makefile
index f25e854fe370..844d18cd5f93 100644
--- a/tools/testing/selftests/powerpc/security/Makefile
+++ b/tools/testing/selftests/powerpc/security/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0+
 
-TEST_GEN_PROGS := rfi_flush entry_flush spectre_v2
+TEST_GEN_PROGS := rfi_flush entry_flush uaccess_flush spectre_v2
 top_srcdir = ../../../../..
 
 CFLAGS += -I../../../../../usr/include
@@ -13,3 +13,4 @@ $(OUTPUT)/spectre_v2: CFLAGS += -m64
 $(OUTPUT)/spectre_v2: ../pmu/event.c branch_loops.S
 $(OUTPUT)/rfi_flush: flush_utils.c
 $(OUTPUT)/entry_flush: flush_utils.c
+$(OUTPUT)/uaccess_flush: flush_utils.c
diff --git a/tools/testing/selftests/powerpc/security/flush_utils.c b/tools/testing/selftests/powerpc/security/flush_utils.c
index 0c3c4c40c7fb..4d95965cb751 100644
--- a/tools/testing/selftests/powerpc/security/flush_utils.c
+++ b/tools/testing/selftests/powerpc/security/flush_utils.c
@@ -13,6 +13,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <stdio.h>
+#include <sys/utsname.h>
 #include "utils.h"
 #include "flush_utils.h"
 
@@ -35,6 +36,18 @@ void syscall_loop(char *p, unsigned long iterations,
 	}
 }
 
+void syscall_loop_uaccess(char *p, unsigned long iterations,
+			  unsigned long zero_size)
+{
+	struct utsname utsname;
+
+	for (unsigned long i = 0; i < iterations; i++) {
+		for (unsigned long j = 0; j < zero_size; j += CACHELINE_SIZE)
+			load(p + j);
+		uname(&utsname);
+	}
+}
+
 static void sigill_handler(int signr, siginfo_t *info, void *unused)
 {
 	static int warned;
diff --git a/tools/testing/selftests/powerpc/security/flush_utils.h b/tools/testing/selftests/powerpc/security/flush_utils.h
index 7a3d60292916..e1e68281f7ac 100644
--- a/tools/testing/selftests/powerpc/security/flush_utils.h
+++ b/tools/testing/selftests/powerpc/security/flush_utils.h
@@ -16,6 +16,9 @@
 void syscall_loop(char *p, unsigned long iterations,
 		  unsigned long zero_size);
 
+void syscall_loop_uaccess(char *p, unsigned long iterations,
+			  unsigned long zero_size);
+
 void set_dscr(unsigned long val);
 
 #endif /* _SELFTESTS_POWERPC_SECURITY_FLUSH_UTILS_H */
diff --git a/tools/testing/selftests/powerpc/security/uaccess_flush.c b/tools/testing/selftests/powerpc/security/uaccess_flush.c
new file mode 100644
index 000000000000..cf80f960e38a
--- /dev/null
+++ b/tools/testing/selftests/powerpc/security/uaccess_flush.c
@@ -0,0 +1,158 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright 2018 IBM Corporation.
+ * Copyright 2020 Canonical Ltd.
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
+#include "flush_utils.h"
+
+int uaccess_flush_test(void)
+{
+	char *p;
+	int repetitions = 10;
+	int fd, passes = 0, iter, rc = 0;
+	struct perf_event_read v;
+	__u64 l1d_misses_total = 0;
+	unsigned long iterations = 100000, zero_size = 24 * 1024;
+	unsigned long l1d_misses_expected;
+	int rfi_flush_orig;
+	int entry_flush_orig;
+	int uaccess_flush, uaccess_flush_orig;
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
+	if (read_debugfs_file("powerpc/uaccess_flush", &uaccess_flush_orig) < 0) {
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
+	if (entry_flush_orig != 0) {
+		if (write_debugfs_file("powerpc/entry_flush", 0) < 0) {
+			perror("error writing to powerpc/entry_flush debugfs file");
+			FAIL_IF(1);
+		}
+	}
+
+	uaccess_flush = uaccess_flush_orig;
+
+	fd = perf_event_open_counter(PERF_TYPE_HW_CACHE, PERF_L1D_READ_MISS_CONFIG, -1);
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
+	syscall_loop_uaccess(p, iterations, zero_size);
+
+	FAIL_IF(read(fd, &v, sizeof(v)) != sizeof(v));
+
+	if (uaccess_flush && v.l1d_misses >= l1d_misses_expected)
+		passes++;
+	else if (!uaccess_flush && v.l1d_misses < (l1d_misses_expected / 2))
+		passes++;
+
+	l1d_misses_total += v.l1d_misses;
+
+	while (--iter)
+		goto again;
+
+	if (passes < repetitions) {
+		printf("FAIL (L1D misses with uaccess_flush=%d: %llu %c %lu) [%d/%d failures]\n",
+		       uaccess_flush, l1d_misses_total, uaccess_flush ? '<' : '>',
+		       uaccess_flush ? repetitions * l1d_misses_expected :
+		       repetitions * l1d_misses_expected / 2,
+		       repetitions - passes, repetitions);
+		rc = 1;
+	} else {
+		printf("PASS (L1D misses with uaccess_flush=%d: %llu %c %lu) [%d/%d pass]\n",
+		       uaccess_flush, l1d_misses_total, uaccess_flush ? '>' : '<',
+		       uaccess_flush ? repetitions * l1d_misses_expected :
+		       repetitions * l1d_misses_expected / 2,
+		       passes, repetitions);
+	}
+
+	if (uaccess_flush == uaccess_flush_orig) {
+		uaccess_flush = !uaccess_flush_orig;
+		if (write_debugfs_file("powerpc/uaccess_flush", uaccess_flush) < 0) {
+			perror("error writing to powerpc/uaccess_flush debugfs file");
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
+	if (write_debugfs_file("powerpc/uaccess_flush", uaccess_flush_orig) < 0) {
+		perror("unable to restore original value of powerpc/uaccess_flush debugfs file");
+		return 1;
+	}
+
+	return rc;
+}
+
+int main(int argc, char *argv[])
+{
+	return test_harness(uaccess_flush_test, "uaccess_flush_test");
+}
-- 
2.27.0

