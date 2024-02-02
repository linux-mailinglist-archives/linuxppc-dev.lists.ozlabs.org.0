Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EAF8468FA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 08:05:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Up2sWxJQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR6H85l5Zz3dKS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 18:05:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Up2sWxJQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TR6885y9cz3cZG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 17:59:20 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d74045c463so14890745ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Feb 2024 22:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706857159; x=1707461959; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjGoSmks1AnXMChnPHaCCI0+kK+ugRn2W8NsPjJCZUU=;
        b=Up2sWxJQTusPyvpT/cJ6cxdUhRcZdce+Bifd+tG6lclhOAh+WnRZl0nYuwVGPz+Cu2
         v0rhip8jga6B50TETJeYhkLVkySCcD9USiqJw5O8uvOP7z+0OCVE7Cn/WaeMX/Dv+qr9
         kNEo60iXJ1JIV9IuwBmNcBsZF3aJ+W9lANwthphLJoV8iGkj8peu1sPEE6qkSzNZ17YM
         5ebMYGqZ9dkCYen2a9XdpJXQYqjKON6sIep2vMKtpashCE3nRXRQp/CrpxG4hFwC18hV
         4LUBxYdD2qWfqfu3KGv4zw3P89qV3wkaJvX6v5eA/onv2ksaMjpIAeYXY93/AioFDuSa
         +Lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706857159; x=1707461959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjGoSmks1AnXMChnPHaCCI0+kK+ugRn2W8NsPjJCZUU=;
        b=ekiIxQ3D6y7y27G+QvQU4/r8yU8XOxPuU2lcSTn3JCny3LIZGfWRyIHPn/iWEBeXG1
         2UWJD7yXX3C+koMkX9geY/odglOPPCzJ0+jdBFrSd9SfWwct88f31X1DScIzS4nJGWlQ
         usE7/3803DWz0Zh7z3MiIDH+NRscYGHanwlaifikaQ+sGxESFiNQPvPZkCZu0rO4aFiK
         qaDioh+WjX0K4Af3ltAERmnAZL1O5gKHskxLs0i7zxJjZ4/txP6SZ5gM8VlfKMd02kdI
         2R82SkEi6ntrZScMDQiV4aGW7d5be8uESS0ycvLIodxr4iAx3uKm0lT50S6LtV16BxSY
         qivw==
X-Gm-Message-State: AOJu0Yx3vomat+9NiP52bejTt4QkLHX+E9tJbhaB8KxRq13eW3+/XGve
	qJlGTlWg3/8r8Qfy2WlWWu1sCf1i3WcQUnggZRy41pAtt73uet1Y
X-Google-Smtp-Source: AGHT+IGNcwlMvoqjjMx7S0tilyD6LP0972eDlmeEGxt1rTpDEdMA+PGwhHdjfkb9sruwSSLgt7sSAQ==
X-Received: by 2002:a17:902:7847:b0:1d9:d:5730 with SMTP id e7-20020a170902784700b001d9000d5730mr1104086pln.3.1706857159061;
        Thu, 01 Feb 2024 22:59:19 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXMFpmzv+sw/9fGzfBrXMtUzkOqt4yxTX4S9LpgchJ6GlcxuaqKoM5whKP+fJRmXM2QTFsy5mwrFyimGhnVxwjB/BgfCxbfpoHa44jAc1Pu6xlt4NK0D0oLh8AUgQqek5byqjl409Tdco3PHCd0eRC0Sz7mc/EcR+p7yuPWqyv8mElN/Wq6FDWVuSMPyhyF5vdo/Mu2OIWXvwnAY9AlYnSW02WUPnkVlZN+XZzks5G1peQOyAlX49ftWwZI6VDWG14w/pbGyMi72CTfs15ZvezIdTtqLJtIWEiQpeX6XOPN88RNtPdMifLkZk7mFmK8vC17sPUKR2QJv5MQ9VJdj8rGOM9cUYxzqUOYDf2ChlOLYuw4nEksUOFdp5gL7N0RrknPqLjUHSjl2/YLSFg9zaCJfsizkIhiYi/G8Wj8bMNm7Bw/OR/mSi/6Us6VWoBYeSKbf+cspqYPDKM1GMuFirWAmoRKG2lTlWzcQgIzPfZGeo7fT5BtLaQeXnzLU/xVq3xu38fp+WC/YpE=
Received: from wheely.local0.net ([1.146.53.155])
        by smtp.gmail.com with ESMTPSA id d18-20020a170903209200b001d948adc19fsm905734plc.46.2024.02.01.22.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 22:59:18 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v2 9/9] migration: add a migration selftest
Date: Fri,  2 Feb 2024 16:57:40 +1000
Message-ID: <20240202065740.68643-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240202065740.68643-1-npiggin@gmail.com>
References: <20240202065740.68643-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a selftest for migration support in  guest library and test harness
code. It performs migrations a tight loop to irritate races and bugs in
the test harness code.

Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com> (s390x)
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

This has flushed out several bugs in developing the multi migration test
harness code already.
---
 arm/Makefile.common         |  1 +
 arm/unittests.cfg           |  6 ++++++
 common/selftest-migration.c | 34 ++++++++++++++++++++++++++++++++++
 powerpc/Makefile.common     |  1 +
 powerpc/unittests.cfg       |  4 ++++
 s390x/Makefile              |  1 +
 s390x/unittests.cfg         |  4 ++++
 7 files changed, 51 insertions(+)
 create mode 100644 common/selftest-migration.c

diff --git a/arm/Makefile.common b/arm/Makefile.common
index c2ee568c..371a2c6a 100644
--- a/arm/Makefile.common
+++ b/arm/Makefile.common
@@ -5,6 +5,7 @@
 #
 
 tests-common  = $(TEST_DIR)/selftest.$(exe)
+tests-common += $(TEST_DIR)/selftest-migration.$(exe)
 tests-common += $(TEST_DIR)/spinlock-test.$(exe)
 tests-common += $(TEST_DIR)/pci-test.$(exe)
 tests-common += $(TEST_DIR)/pmu.$(exe)
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

