Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8A784F0A4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 08:08:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lbb4bnrS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWQ1W17ggz3vm4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 18:08:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=lbb4bnrS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWPvF3Gtyz3cY2
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 18:03:05 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6e0518c83c6so417682b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 23:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707462183; x=1708066983; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLcEDOFfXRm4asPXfN/h/emKx6nM9DLWqis1Tw2BV0c=;
        b=lbb4bnrS+TJ/rPJ7VkeSUsSsAZ9NnYc6TVAwnibB7JAEraL78vGWUgv3Ck+v1OB3Yy
         AcIb/lkBHF7EU2ydMTJIIYejSChmrv+GckjcUWf3Vq0mV7j9M3f8eAeT7BRkTKqGyk3M
         TssCymu4nNTjwi387KcQPHiJGTrfE4gFd7hcSNSeolYuzx6ZqavzsqwnxCnJ+9XA6rQv
         KgB9uubBwhjySVxTwn5r0wYS/nZuUpCI1r3uCNNCC9voiDOkAxJNJHQOf8cxvtAXvney
         guXbmm96r9+vYZdiLifWRs8U9x6LnMdeOzD1KgVK1cbZ4Po9P1lJnBxM6p/dSFXtE02r
         mTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707462183; x=1708066983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nLcEDOFfXRm4asPXfN/h/emKx6nM9DLWqis1Tw2BV0c=;
        b=O5K08cS+mfoEA+lzW8cilp/TkSc6huyr7mNNIaGDOTET98nj+BiHoL1OqF7XOakiHB
         +KGc15M5RUnw9mfXPCLOq3Qh+iaWFqg5ttm/TzJHGQpi8ijW+Ii3rs9EG++3Nd8YxziJ
         FsKA9gZjnVJcJYEpkbDnXYGA0nzB5SiDv63A6atTvS6Oi3+DrxF6Tk4Q7I+uNVlsojEg
         oYdUkhydLu0VEtdoemLizttVexVTofQnIT2TwUxHUnRa/reQo4STRyKMaIekjRTTcqFr
         9pRKiOor1CMMq+iO3QgsbNc8mDt2FrxfAdFfWaTzTMfbY1VNR6L12wRR4G50cR/RDtUH
         h9Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWKeQEoOFiJhpWT7uJdCE1bxNztgYfpmiQIa3nyyAAXbXoD9J7EDS3qCwXn4Q/BGWrHTkJxnjjCZltxg59V1Dq0q0z0UY4PtNNSukpkzA==
X-Gm-Message-State: AOJu0YyNsooBm+L2apj9RyHoO7x3yt2V+M1mRUMfdQOMdC1s8zncht9L
	upAVbyI9D6To1HbjvCQ+LhlKqriHqWfyb1LLz5pqhFBleQsx4gdC
X-Google-Smtp-Source: AGHT+IHCDQmhvrErtDNERE9RrkYau41AxB4oBcYKBUMctdPXanPruVPXCMJmeFh2pOIguDwPif262w==
X-Received: by 2002:a05:6a20:94ce:b0:19e:99fd:3f5c with SMTP id ht14-20020a056a2094ce00b0019e99fd3f5cmr1013600pzb.25.1707462182771;
        Thu, 08 Feb 2024 23:03:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUXjVIucCvEhqf7rvEFHTsNvZRp6jchNyZ+VPMsRdJDMsygxun8hUVxG2Y9mmn+X1wF20AwZkwuxOqKvnmXHpi9Ya7qdy/vQC1E8gcH8PMc7eRyxEQ8mxGRUcypUXdhMh5JNVzlCEUQn8zSJY5XWu7q9rUVLSdJRbAApVO3gxxx1wTOt9T5wuHIddoEFJ/CkUbe+ZaSr2EMUqb7uSZ9BG5yLWDyPSq0hBIjYZBEECml7FVaVkrV/Zuv+Mh+iVhI9fyn6tIai8lu4zaiajlWuaOLax7bDifk3TcJ0450njTgSSaMih51NGiRSQTbt5GfxXki6u5W+6T1MlF5lfjdZBtkNKW30gvRDaC0z0USNqRdKSFUhhngff5ouSHO68CgNwA1BOK4njt4vZ8qETP2fDsDhU2vgvMMeZdOGNcjIJtVNrDga/XQyaVyKUnraQN1U7rTY3mqC6Q8dAu5li30gvg7lhS31t1VyOq2ib3S6QOqL3A6gvEgf+d9zZjbG/M1dacZipocfeTU0ghXUdrosLA70IEtXqxgRi2+jQQjc25jY6VBoqWsSQQp
Received: from wheely.local0.net ([1.146.102.26])
        by smtp.gmail.com with ESMTPSA id r10-20020a170903410a00b001d7284b9461sm839285pld.128.2024.02.08.23.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 23:03:02 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v3 8/8] migration: add a migration selftest
Date: Fri,  9 Feb 2024 17:01:41 +1000
Message-ID: <20240209070141.421569-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240209070141.421569-1-npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
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
code. It performs migrations a tight loop to irritate races and bugs in
the test harness code.

Include the test in arm, s390, powerpc.

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com> (s390x)
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
This has flushed out several bugs in developing the multi migration test
harness code already.

Thanks,
Nick

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
index fe601cbb..1ffd9a82 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -55,6 +55,12 @@ smp = $MAX_SMP
 extra_params = -append 'smp'
 groups = selftest
 
+# Test migration
+[selftest-migration]
+file = selftest-migration.flat
+groups = selftest migration
+
+arch = arm64
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

