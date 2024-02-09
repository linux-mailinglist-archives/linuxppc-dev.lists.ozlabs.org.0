Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1850E84F226
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 10:18:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nBtq1M9Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWSvL754yz3vnY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 20:18:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nBtq1M9Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWSmv0kJWz3d8F
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 20:12:46 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-6e04f29c7bcso518705b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 01:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707469964; x=1708074764; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xUi8tWoV7y43d8/rADxcJNoz7Om9vKHwuVyyk4R4P/0=;
        b=nBtq1M9YucGd9kbzf1m0/nWyBP9/7jBB/o3oTjz1HhbpflS0R4S+PCnPDyM+Wpk1uh
         yLtJkAwVEsUpokAy60TdmllzkL2v7nRwyMI5A4X/J/OKSzp5NTkxR4bfmFCL2EF+Rd95
         q5qsXIF9zFYGkeIyIyCSZQpnuLvCEhuFI/kx1dCv08VZz84gVd6kUDBsoVSeE4YzIKQf
         31CcWi52agpIdI2rmsSaC4+erWWHy+4FSCNkFT1LMeKVJOiiJfy26PkP8POpjW2Jw0sK
         eHOXSv6vOEbglF5PORnrEjiBvSPeb/C0KKh/d15QZzUfWA4FzulRpxTyLMFXXrdBDVgX
         9rOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707469964; x=1708074764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUi8tWoV7y43d8/rADxcJNoz7Om9vKHwuVyyk4R4P/0=;
        b=kW7C5mto1uwPiuycPdQQl3JL7OrtX3WgbIB7oYR9ZdrbxDXNok3RC7L5yuzViMzryB
         aYApj+VltclA1hPZmNzJbUFnmucsBxScWvRrP5fYJe8N/TaOjd+gWrv8jbt6pmb+xCaP
         cc32Ah3V1cIvzOmfdAAruyEZwBIMfS6qPz126xKneOj+XFKH+hPcy648JzNwG6nFSyRr
         Kmj0u9kvmq5xuCkY2miglYYfEh+m1u60ksmo3F7MjosUizdRpKCjDqEh9hiRpc9qnraF
         g58HBUGjw/hMGNz5UlsJNTmn4kyKZgITdKKPB0P8pqzbrF8zr+FXJuuRJ49FB6XwZlQY
         qQJQ==
X-Gm-Message-State: AOJu0Yy4k4wBlJJpcHgo3fCC6ScWX7LxDutAl6O/diYzoFgb7t7ZNmhn
	s1hrwcySpyYCPvHV48TTXu48D7zKUd3uY2YdNdR7sXI2NqlU3bJ5
X-Google-Smtp-Source: AGHT+IEU4SjDeB439gZ1v+vHOsu9gIns1aZMUMmovHkP67opmUKwsDY5/bROOCbrnRZ9ZxCiwcuKiA==
X-Received: by 2002:a05:6a00:80e0:b0:6dd:db87:6356 with SMTP id ei32-20020a056a0080e000b006dddb876356mr897226pfb.7.1707469964083;
        Fri, 09 Feb 2024 01:12:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXrwZjktcf61HetSLBq6YFmOCC03GE86GQEfIt7eieexAYX156hMSSPKOXp7y3e12XVLDSW4UuAQGUhgwTKyp0ERxQ+7FDd0Rvk9hb7ibp1h+V4KNfsR7GMwMXcPYGUsH//ZAt/n7cxghZKwqfsahSlqC1uLBO1NNvZMNa/9LUNtk98M/3JSP4eg6VwJL325/HPcjWWfm8UwurysoUGcBNBOGnpdqlwPXk6p3YuDXbKNk0mI3Ea400fweEVt0bzLpG+dsqWnZ2yjR3Er3jtBi14nN6pC6rZP/dJ7l5sxSAtbkq+ya/AxRx1Ntrl5UjE9TdUB5qL27ZAMTaEiMb2Wiohr42TS9qrRI0j6M5X1TVVoxnBEwVOGBabsSIGDjYgLb3VA2aXN27xfXXDByohtjQtJ4qHk+KMPAS1B/Y23na7l0wbcRJnJJBXyqdmmhESa3FrkiW5DXrRneZjTbBAGkXfeFi5LQ1B2kvdOSqzLTaC0oZkKQPJDWhGjTZPXMliWp1tirt027OA3K5bSh2Tkk24RrjmC21CBtlObJ/PL1sw+jY+ky4qfTwb
Received: from wheely.local0.net ([118.208.150.76])
        by smtp.gmail.com with ESMTPSA id cb1-20020a056a02070100b005c1ce3c960bsm1101742pgb.50.2024.02.09.01.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 01:12:43 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v4 8/8] migration: add a migration selftest
Date: Fri,  9 Feb 2024 19:11:34 +1000
Message-ID: <20240209091134.600228-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240209091134.600228-1-npiggin@gmail.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a selftest for migration support in  guest library and test harness
code. It performs migrations in a tight loop to irritate races and bugs
in the test harness code.

Include the test in arm, s390, powerpc.

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com> (s390x)
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arm/Makefile.common          |  1 +
 arm/selftest-migration.c     |  1 +
 arm/unittests.cfg            |  6 ++++++
 common/selftest-migration.c  | 34 ++++++++++++++++++++++++++++++++++
 powerpc/Makefile.common      |  1 +
 powerpc/selftest-migration.c |  1 +
 powerpc/unittests.cfg        |  4 ++++
 s390x/Makefile               |  1 +
 s390x/selftest-migration.c   |  1 +
 s390x/unittests.cfg          |  4 ++++
 10 files changed, 54 insertions(+)
 create mode 120000 arm/selftest-migration.c
 create mode 100644 common/selftest-migration.c
 create mode 120000 powerpc/selftest-migration.c
 create mode 120000 s390x/selftest-migration.c

diff --git a/arm/Makefile.common b/arm/Makefile.common
index f828dbe0..f107c478 100644
--- a/arm/Makefile.common
+++ b/arm/Makefile.common
@@ -5,6 +5,7 @@
 #
 
 tests-common  = $(TEST_DIR)/selftest.$(exe)
+tests-common += $(TEST_DIR)/selftest-migration.$(exe)
 tests-common += $(TEST_DIR)/spinlock-test.$(exe)
 tests-common += $(TEST_DIR)/pci-test.$(exe)
 tests-common += $(TEST_DIR)/pmu.$(exe)
diff --git a/arm/selftest-migration.c b/arm/selftest-migration.c
new file mode 120000
index 00000000..bd1eb266
--- /dev/null
+++ b/arm/selftest-migration.c
@@ -0,0 +1 @@
+../common/selftest-migration.c
\ No newline at end of file
diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index fe601cbb..db0e4c9b 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -55,6 +55,12 @@ smp = $MAX_SMP
 extra_params = -append 'smp'
 groups = selftest
 
+# Test migration
+[selftest-migration]
+file = selftest-migration.flat
+groups = selftest migration
+arch = arm64
+
 # Test PCI emulation
 [pci-test]
 file = pci-test.flat
diff --git a/common/selftest-migration.c b/common/selftest-migration.c
new file mode 100644
index 00000000..f70c505f
--- /dev/null
+++ b/common/selftest-migration.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Machine independent migration tests
+ *
+ * This is just a very simple test that is intended to stress the migration
+ * support in the test harness. This could be expanded to test more guest
+ * library code, but architecture-specific tests should be used to test
+ * migration of tricky machine state.
+ */
+#include <libcflat.h>
+#include <migrate.h>
+
+#if defined(__arm__) || defined(__aarch64__)
+/* arm can only call getchar 15 times */
+#define NR_MIGRATIONS 15
+#else
+#define NR_MIGRATIONS 100
+#endif
+
+int main(int argc, char **argv)
+{
+	int i = 0;
+
+	report_prefix_push("migration");
+
+	for (i = 0; i < NR_MIGRATIONS; i++)
+		migrate_quiet();
+
+	report(true, "simple harness stress test");
+
+	report_prefix_pop();
+
+	return report_summary();
+}
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index eb88398d..da4a7bbb 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -6,6 +6,7 @@
 
 tests-common = \
 	$(TEST_DIR)/selftest.elf \
+	$(TEST_DIR)/selftest-migration.elf \
 	$(TEST_DIR)/spapr_hcall.elf \
 	$(TEST_DIR)/rtas.elf \
 	$(TEST_DIR)/emulator.elf \
diff --git a/powerpc/selftest-migration.c b/powerpc/selftest-migration.c
new file mode 120000
index 00000000..bd1eb266
--- /dev/null
+++ b/powerpc/selftest-migration.c
@@ -0,0 +1 @@
+../common/selftest-migration.c
\ No newline at end of file
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index e71140aa..7ce57de0 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -36,6 +36,10 @@ smp = 2
 extra_params = -m 256 -append 'setup smp=2 mem=256'
 groups = selftest
 
+[selftest-migration]
+file = selftest-migration.elf
+groups = selftest migration
+
 [spapr_hcall]
 file = spapr_hcall.elf
 
diff --git a/s390x/Makefile b/s390x/Makefile
index b72f7578..344d46d6 100644
--- a/s390x/Makefile
+++ b/s390x/Makefile
@@ -1,4 +1,5 @@
 tests = $(TEST_DIR)/selftest.elf
+tests += $(TEST_DIR)/selftest-migration.elf
 tests += $(TEST_DIR)/intercept.elf
 tests += $(TEST_DIR)/emulator.elf
 tests += $(TEST_DIR)/sieve.elf
diff --git a/s390x/selftest-migration.c b/s390x/selftest-migration.c
new file mode 120000
index 00000000..bd1eb266
--- /dev/null
+++ b/s390x/selftest-migration.c
@@ -0,0 +1 @@
+../common/selftest-migration.c
\ No newline at end of file
diff --git a/s390x/unittests.cfg b/s390x/unittests.cfg
index f5024b6e..a7ad522c 100644
--- a/s390x/unittests.cfg
+++ b/s390x/unittests.cfg
@@ -24,6 +24,10 @@ groups = selftest
 # please keep the kernel cmdline in sync with $(TEST_DIR)/selftest.parmfile
 extra_params = -append 'test 123'
 
+[selftest-migration]
+file = selftest-migration.elf
+groups = selftest migration
+
 [intercept]
 file = intercept.elf
 
-- 
2.42.0

