Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 336D087F8D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:05:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eN3PLoiT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPR66jD4z3vkj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:05:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eN3PLoiT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPK020Y3z3dWS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:00:04 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3c3775ce48fso2702789b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835201; x=1711440001; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeFiA3EfY+1JD1RuYQnw5HbvsQt45vIrT0LQVWviu8g=;
        b=eN3PLoiTJRgrnlVUf+zLxRdgpQRleqwnQx1O35lgZ+uIGeUm3ZnCyOE65ce2DyPts6
         lW9mTQ3FlEcGgVpA6Go/Q0Wr3dPc1GTMmJ1wEQgOQqMs19stkWmivHrFlinhEVuu+OGy
         u35M5v7HpCRrlxOs2RBcXWb9M6Ms9PYZSGx8o2AFPGy1cDRzYg4s+Su0qrS0w0G8wJ53
         XAHS/l/1KG+zPZQ5T7Z+KKuHUpeTpiCIJLMmHSDP55Ki/jD9Hoh2trloGHI4UM60zKxI
         E9DzG0WsfqALB27KklvcPU24g5snnaIhLz8huB0xGSsXV1awV265N+LTwyr/18S2I3Im
         pThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835201; x=1711440001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yeFiA3EfY+1JD1RuYQnw5HbvsQt45vIrT0LQVWviu8g=;
        b=VKP0MyGtTIsEGb4lukMhAqaBtpa8D1Jdv4MHxh8OOqaDNqmq3SdKT1EdLY0VtL29Qr
         cl/t4cNbc4qEuuHHEwQlS5Eun6rBsZxmhbvQECNEi46JytLGoL5h/vO5CYvJ+4X5Ca6P
         Y4NfRw2aKL6fYz6H1PN2pAtOVM+FwoP7/g4HdEwfAn008x7708Q1c6endWAHBO7m5bT9
         YemYbM5gJSIp9Dr27uUkE+VrTQ/Use5vk7xuEWX1uO6PmFamIXzpZteL7FzyOnfkVYhb
         kSzN+GfZ2I3DSqvn3SuKE+Tp71pcpFPR/DWGsF+K347IHUYdkjQA3KY8j4/xqtKgh9i8
         iQ+g==
X-Forwarded-Encrypted: i=1; AJvYcCVi0xaXGAu2Qqr8QlG0YZrgdPJuYdOeZmKju7rVU2jQyNQrjkUisS22QaZ/9PBXrm0in6AwA5AkCeCVgoKQhQJ3CrJH/GRwJqhLenVG1w==
X-Gm-Message-State: AOJu0YxSl+LhQnz207fmdwxJgKESgFhVzVGo5zw+zVhOO0EK60Y94X16
	dDouCZY0Ykg/FaVuE3BciRWjCdX/SsJ2naUdEiCo9JRYmq80ge52
X-Google-Smtp-Source: AGHT+IEKjVgOynnGlounTLvOmvJWwFgatUFePuOrHk3/ueXtGI7nUei9T7Qa+BG/xrhoE5qSdYaWUg==
X-Received: by 2002:a05:6808:1b24:b0:3c3:8540:8641 with SMTP id bx36-20020a0568081b2400b003c385408641mr6963268oib.9.1710835200772;
        Tue, 19 Mar 2024 01:00:00 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.00.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:00:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 07/35] common: add memory dirtying vs migration test
Date: Tue, 19 Mar 2024 17:58:58 +1000
Message-ID: <20240319075926.2422707-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240319075926.2422707-1-npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 common/memory-verify.c      | 67 +++++++++++++++++++++++++++++++++++++
 common/selftest-migration.c |  8 ++---
 powerpc/Makefile.common     |  1 +
 powerpc/memory-verify.c     |  1 +
 powerpc/unittests.cfg       |  7 ++++
 s390x/Makefile              |  1 +
 s390x/memory-verify.c       |  1 +
 s390x/unittests.cfg         |  6 ++++
 8 files changed, 88 insertions(+), 4 deletions(-)
 create mode 100644 common/memory-verify.c
 create mode 120000 powerpc/memory-verify.c
 create mode 120000 s390x/memory-verify.c

diff --git a/common/memory-verify.c b/common/memory-verify.c
new file mode 100644
index 000000000..e78fb4338
--- /dev/null
+++ b/common/memory-verify.c
@@ -0,0 +1,67 @@
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
+	void *mem = malloc(NR_PAGES*PAGE_SIZE);
+	bool success = true;
+	uint64_t ms;
+	long i;
+
+	do_getopts(argc, argv);
+
+	report_prefix_push("memory");
+
+	memset(mem, 0, NR_PAGES*PAGE_SIZE);
+
+	migrate_begin_continuous();
+	ms = get_clock_ms();
+	i = 0;
+	do {
+		int j;
+
+		for (j = 0; j < NR_PAGES*PAGE_SIZE; j += PAGE_SIZE) {
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
index b79b99416..550eff787 100644
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
2.42.0

