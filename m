Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAB9899820
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:41:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nio11Q+3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sR41904z3vgP
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:41:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nio11Q+3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d32; helo=mail-io1-xd32.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sJz6mK3z3vZR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:36:19 +1100 (AEDT)
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7cc77e74b5cso82836439f.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306176; x=1712910976; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4a+yvoU4Zuk7XnICvMuX6mvFgH0s9YTUf1wOlK2UPA=;
        b=nio11Q+3lNgfBvt0ilk+R+s1W/JjmiOqsv9uXfP38Q5w50orMAujXv8MXNeGkdF8bS
         eeguJ1rG3EwZyiCRfXKvn5yBuoCdYNQ7uZ7n+bqyCkhVPv0aXWLEIl3MS11TAx6hsy/y
         XCe1DB15fCkH9qFEbujWrenlKv6GXOqz1ZVch0JGGg3FSmaqr5963D6GLCMXavEmQAWa
         mfoG5QsC9PFd5LTHbt4ZC15K6qsM9500PeavccKTB/ol/5H3W+kFTKGL/3PQekcravYv
         2SXneEk1EdA/AeqBvGjP2Z7Af4X1GOjikkBifyeD925omyrXMDI5oAWAEinEsNpbfsJw
         Q0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306176; x=1712910976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4a+yvoU4Zuk7XnICvMuX6mvFgH0s9YTUf1wOlK2UPA=;
        b=iTq07VkeL5FVMAoxLVgukuMj2pu0PjQM3CJUdpfz1ufpJlgOeW96Xk2j8ZN+Pf9W9g
         uiufv75oiulQypMNvO0VdX+BSs+nn+xjkkOWfUpN9L0OQhIA4sjaAhZiuAuRiNHbeR1b
         WsVEwZF38D92r5gm3DisQ3YG10plx2N4mexI67Cfmg3JiKiQwQYaBZNZ8cJtSTFsxQ+Z
         go/7aGKbef55hhDhwh2KHJ4t4iVaLDFF5u4l4zq56IFXFrj+JBTApEmiXmBNyLpi0aIs
         c6X1L17weACKPuN/hSc5ibcZ8CeCFQ+6IsxP8s0qwXZSDfRubls9gwNj+WIgwMhskb/s
         H1iw==
X-Forwarded-Encrypted: i=1; AJvYcCVv8Ea8uHzw4hwh+GchavMTGjlBONVestHZoKKmws/p1gS6byXo5Tn1UjCXIuWr+GDpHMZSC4lO+aLdddQd8EdCO+phknAVqgQK3tMa/Q==
X-Gm-Message-State: AOJu0Yzowq2r6nUOAibTuYMtgXjZZXFNkNiLetVwGZwAUi912Q1x1Vxk
	OR/IIYJQKQPZdrPQv4O8HogE1afGNS6CZ0cuFWuD4hv1gdlmkSLWaKuNMoR0
X-Google-Smtp-Source: AGHT+IEz5LeA7ioiT1AWxwaXdvckz2ey8biz8/mbdvqQ15V+h2gAHH7T4UpG9LC+O5IOKUvjAXvvXg==
X-Received: by 2002:a05:6e02:1c87:b0:368:a5be:673 with SMTP id w7-20020a056e021c8700b00368a5be0673mr827466ill.18.1712306176706;
        Fri, 05 Apr 2024 01:36:16 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:36:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 07/35] common: add memory dirtying vs migration test
Date: Fri,  5 Apr 2024 18:35:08 +1000
Message-ID: <20240405083539.374995-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405083539.374995-1-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This test stores to a bunch of pages and verifies previous stores,
while being continually migrated. Default runtime is 5 seconds.

Add this test to ppc64 and s390x builds. This can fail due to a QEMU
TCG physical memory dirty bitmap bug, so it is not enabled in unittests
for TCG yet.

The selftest-migration test time is reduced significantly because
this test

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 common/memory-verify.c      | 68 +++++++++++++++++++++++++++++++++++++
 common/selftest-migration.c |  8 ++---
 powerpc/Makefile.common     |  1 +
 powerpc/memory-verify.c     |  1 +
 powerpc/unittests.cfg       |  7 ++++
 s390x/Makefile              |  1 +
 s390x/memory-verify.c       |  1 +
 s390x/unittests.cfg         |  6 ++++
 8 files changed, 89 insertions(+), 4 deletions(-)
 create mode 100644 common/memory-verify.c
 create mode 120000 powerpc/memory-verify.c
 create mode 120000 s390x/memory-verify.c

diff --git a/common/memory-verify.c b/common/memory-verify.c
new file mode 100644
index 000000000..1cefe95dc
--- /dev/null
+++ b/common/memory-verify.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Simple memory verification test, used to exercise dirty memory migration.
+ */
+#include <libcflat.h>
+#include <migrate.h>
+#include <alloc.h>
+#include <asm/page.h>
+#include <asm/time.h>
+
+#define NR_PAGES 32
+#define SIZE (NR_PAGES * PAGE_SIZE)
+
+static unsigned time_sec = 5;
+
+static void do_getopts(int argc, char **argv)
+{
+	int i;
+
+	for (i = 0; i < argc; ++i) {
+		if (strcmp(argv[i], "-t") == 0) {
+			i++;
+			if (i == argc)
+				break;
+			time_sec = atol(argv[i]);
+		}
+	}
+
+	printf("running for %d secs\n", time_sec);
+}
+
+int main(int argc, char **argv)
+{
+	void *mem = memalign(PAGE_SIZE, SIZE);
+	bool success = true;
+	uint64_t ms;
+	long i;
+
+	do_getopts(argc, argv);
+
+	report_prefix_push("memory");
+
+	memset(mem, 0, SIZE);
+
+	migrate_begin_continuous();
+	ms = get_clock_ms();
+	i = 0;
+	do {
+		int j;
+
+		for (j = 0; j < SIZE; j += PAGE_SIZE) {
+			if (*(volatile long *)(mem + j) != i) {
+				success = false;
+				goto out;
+			}
+			*(volatile long *)(mem + j) = i + 1;
+		}
+		i++;
+	} while (get_clock_ms() - ms < time_sec * 1000);
+out:
+	migrate_end_continuous();
+
+	report(success, "memory verification stress test");
+
+	report_prefix_pop();
+
+	return report_summary();
+}
diff --git a/common/selftest-migration.c b/common/selftest-migration.c
index 9a9b61835..3693148aa 100644
--- a/common/selftest-migration.c
+++ b/common/selftest-migration.c
@@ -11,7 +11,7 @@
 #include <migrate.h>
 #include <asm/time.h>
 
-#define NR_MIGRATIONS 15
+#define NR_MIGRATIONS 5
 
 int main(int argc, char **argv)
 {
@@ -28,11 +28,11 @@ int main(int argc, char **argv)
 		report(true, "cooperative migration");
 
 		migrate_begin_continuous();
-		mdelay(2000);
-		migrate_end_continuous();
 		mdelay(1000);
+		migrate_end_continuous();
+		mdelay(500);
 		migrate_begin_continuous();
-		mdelay(2000);
+		mdelay(1000);
 		migrate_end_continuous();
 		report(true, "continuous migration");
 	}
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index da4a7bbb8..1e181da69 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -7,6 +7,7 @@
 tests-common = \
 	$(TEST_DIR)/selftest.elf \
 	$(TEST_DIR)/selftest-migration.elf \
+	$(TEST_DIR)/memory-verify.elf \
 	$(TEST_DIR)/spapr_hcall.elf \
 	$(TEST_DIR)/rtas.elf \
 	$(TEST_DIR)/emulator.elf \
diff --git a/powerpc/memory-verify.c b/powerpc/memory-verify.c
new file mode 120000
index 000000000..5985c730f
--- /dev/null
+++ b/powerpc/memory-verify.c
@@ -0,0 +1 @@
+../common/memory-verify.c
\ No newline at end of file
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index cae4949e8..e65217c18 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -49,6 +49,13 @@ machine = pseries
 groups = selftest migration
 extra_params = -append "skip"
 
+# This fails due to a QEMU TCG bug so KVM-only until QEMU is fixed upstream
+[migration-memory]
+file = memory-verify.elf
+accel = kvm
+machine = pseries
+groups = migration
+
 [spapr_hcall]
 file = spapr_hcall.elf
 
diff --git a/s390x/Makefile b/s390x/Makefile
index 344d46d68..ddc0969f3 100644
--- a/s390x/Makefile
+++ b/s390x/Makefile
@@ -1,5 +1,6 @@
 tests = $(TEST_DIR)/selftest.elf
 tests += $(TEST_DIR)/selftest-migration.elf
+tests += $(TEST_DIR)/memory-verify.elf
 tests += $(TEST_DIR)/intercept.elf
 tests += $(TEST_DIR)/emulator.elf
 tests += $(TEST_DIR)/sieve.elf
diff --git a/s390x/memory-verify.c b/s390x/memory-verify.c
new file mode 120000
index 000000000..5985c730f
--- /dev/null
+++ b/s390x/memory-verify.c
@@ -0,0 +1 @@
+../common/memory-verify.c
\ No newline at end of file
diff --git a/s390x/unittests.cfg b/s390x/unittests.cfg
index faa0ce0eb..d7bdcfa91 100644
--- a/s390x/unittests.cfg
+++ b/s390x/unittests.cfg
@@ -44,6 +44,12 @@ file = selftest-migration.elf
 groups = selftest migration
 extra_params = -append "skip"
 
+# This fails due to a QEMU TCG bug so KVM-only until QEMU is fixed upstream
+[migration-memory]
+file = memory-verify.elf
+accel = kvm
+groups = migration
+
 [intercept]
 file = intercept.elf
 
-- 
2.43.0

