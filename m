Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D08D485CECE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 04:34:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SM4r+fPA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfhjV5K98z3vlD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 14:34:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SM4r+fPA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tfhb46wQZz3dTg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 14:29:20 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1dbae7b8ff2so25853405ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 19:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708486158; x=1709090958; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rKTDdfNq5MGrQ+0iUWX57avIL8YHWFp0YDpAZCY+Suc=;
        b=SM4r+fPA4Sto4gMPuEGqbn1WJxH/Lapfx9+0T/OdFWJRXzTu3AjTTplRwRsXbm903b
         zajltEgmSGYDstWWRTUzOLM0IKtm2h7y+t4Zje80h8BrmgjQ20ZgMzLilehsbHBBgnAe
         CJvoOLZC6bvWVZ19A4Jiq2xGctnSdMgWWyciA8/ph6kT/ELzByGssEMByNAHOGeTKhhK
         1g6ZYVGekYmyILkKqpmM3II2Xa8GjOVLcJnhFnHDNM6tJMuW0J9p04qGl4hQZchuU0UB
         c5bwZZ/NFiq4FLprkCUwCshjXq7wOM8nw3nfo/9estY+aNKEVlxCx3gAbnVa+BLj5bal
         DGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486158; x=1709090958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rKTDdfNq5MGrQ+0iUWX57avIL8YHWFp0YDpAZCY+Suc=;
        b=jhBWqlY6EWVCr2WlM6oi6QVCWHUH9lenC7/P+Lcd1tJHO/amddnLmylw/yv7qlv+MJ
         84aky5Z9yZKZSUhz3fM9rSzfFGxfjl/yV4dDCGJGkESCeEkqwUn6xnpb9yWsJX+ZHeGb
         9h1Hn4pHkKChh/IbbmbNkuSUS2gK2SqzQXnHvqVZApElqR+VDdsMayElPGbHAGeRoh+u
         hl2HcV0wjrurHcXdod5c/u4hXsqZQvjvCuBNz/6tkSqME+6ExPLP78LM3Qx8TjNbkyPR
         btvoEn+q3bIg+M+th6czc001wwv6rO5R3tBLenBOuU9/Ye8hxpEqrmlYcJEMDg8l52QG
         fSpA==
X-Forwarded-Encrypted: i=1; AJvYcCUDvGudIpTeejpuE1hGUjvrg+2FAWzz3x/tkAxDMNZdsjZAW5HKtB/anSIBin/Hm4yVQPtdAlsAyIoGKVyQIMUXCv5edpkaxAHB3FooqQ==
X-Gm-Message-State: AOJu0YxhtFjaeJefyd1Eljcjuw/Xc1i6EZPZ5ud/iDhgdaxmZ8Yjge6n
	TozPdlz6MH+7A8zDsNwfHe6nZssbBAFB+FPY0nWbyFeJjRhBN1SC
X-Google-Smtp-Source: AGHT+IH1x5xMI9uoPg2lnHlSiQRJh3IyeLPtdt/kc7CIoeguyY7MUFojlqvGni7okVmY4JK8i1uByQ==
X-Received: by 2002:a17:902:ccce:b0:1dc:30bb:b5cf with SMTP id z14-20020a170902ccce00b001dc30bbb5cfmr558973ple.59.1708486158130;
        Tue, 20 Feb 2024 19:29:18 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902b10700b001dc214f7353sm1246457plr.249.2024.02.20.19.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:29:17 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v5 8/8] migration: add a migration selftest
Date: Wed, 21 Feb 2024 13:27:57 +1000
Message-ID: <20240221032757.454524-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240221032757.454524-1-npiggin@gmail.com>
References: <20240221032757.454524-1-npiggin@gmail.com>
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

Include the test in s390, powerpc.

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com> (s390x)
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 common/selftest-migration.c  | 29 +++++++++++++++++++++++++++++
 powerpc/Makefile.common      |  1 +
 powerpc/selftest-migration.c |  1 +
 powerpc/unittests.cfg        |  4 ++++
 s390x/Makefile               |  1 +
 s390x/selftest-migration.c   |  1 +
 s390x/unittests.cfg          |  4 ++++
 7 files changed, 41 insertions(+)
 create mode 100644 common/selftest-migration.c
 create mode 120000 powerpc/selftest-migration.c
 create mode 120000 s390x/selftest-migration.c

diff --git a/common/selftest-migration.c b/common/selftest-migration.c
new file mode 100644
index 000000000..54b5d6b2d
--- /dev/null
+++ b/common/selftest-migration.c
@@ -0,0 +1,29 @@
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
+#define NR_MIGRATIONS 30
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
index eb88398d8..da4a7bbb8 100644
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
index 000000000..bd1eb266d
--- /dev/null
+++ b/powerpc/selftest-migration.c
@@ -0,0 +1 @@
+../common/selftest-migration.c
\ No newline at end of file
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index e71140aa5..7ce57de02 100644
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
index b72f7578f..344d46d68 100644
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
index 000000000..bd1eb266d
--- /dev/null
+++ b/s390x/selftest-migration.c
@@ -0,0 +1 @@
+../common/selftest-migration.c
\ No newline at end of file
diff --git a/s390x/unittests.cfg b/s390x/unittests.cfg
index f5024b6ee..a7ad522ca 100644
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

