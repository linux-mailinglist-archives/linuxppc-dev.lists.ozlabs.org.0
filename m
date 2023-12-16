Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D1D8159BA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 15:06:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KEd2Pjpx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ssnvd1lVJz3vpw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 01:06:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KEd2Pjpx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnQg3Sshz3dKd
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:45:15 +1100 (AEDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-1f5bd86ceb3so1137718fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734312; x=1703339112; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XE9XKLSIf9UgRjfXZPBdby7Mjp122zrlXjBO3aNJ9U=;
        b=KEd2PjpxxeQQwo2E5TEE3e+SryF+0RTU9S/XsV2Yu+mKBteb/a3uL6JEQjzA7JVK9Q
         YwATihWG6Ki/4I2LDXQ/HpkyLXblJrdvcJ80O6pZCws+jt3Gl65DtJNVeAZgK09qBhwf
         CR506yrQJSNdVIf6bDy5Q1J+1JTiVN2hlVDJTpdC1T6ZeHMpxzEHraVTsxQrZnOdKtma
         4qKXXVnq9pd6Ck/Pv5c33AidflsRfw1jdOnf1X5fCIQ9xoi0m9BziiJ1VaQyl239XrBK
         xwSRtJRMyNTxWFNxQd3766TgW6EPyNqaVwyTvsqCuIuXjZJR/sYcoCl0ZPlG//pljXqH
         6rQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734312; x=1703339112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XE9XKLSIf9UgRjfXZPBdby7Mjp122zrlXjBO3aNJ9U=;
        b=CPJ9rs0fksA065pOIBuoeAmekWMlCoeTQuxHMkZsnLigS5Z/wWKwNgu8Ug60y7Aclc
         NJk1wrXL9JYpXTvS9ZubUYXyBLHuWEQHNpi0ewRvP238qJrJc5t/QtjCEUGk7K1+hoHq
         D4PzXG1go3gaP/Wd85kS5TgnrEnaD23EVsW5bmIZZZBU7VwdJMnNdXGEkAN3dmKLEf13
         6CrQUwvxkkKwQS89pXHWsqEoLY3PFWUMwsZKptnvPG/Z95V89HuinHaFBYCL8skRPMcB
         lIAcuGnEIpa3sgZpCEIUwza9GCCfjwNeNqfwWib3H5F7iJzRdTgGXO3rPk4KvLd/QE3H
         nHFw==
X-Gm-Message-State: AOJu0YzMn6MtQ2I5PkWLIb+jNzxaXWVLGY6NCqw9hGL8QwsesDUnWXiX
	JrlHyczxx46NdrJe63arIxg=
X-Google-Smtp-Source: AGHT+IFNxLFd/uFec+bI0z4pyF+adcDjIzNVsuSTkCh9dJw8ovpvK2QPpuq2Lb4ILve/oR+1XOr0ZA==
X-Received: by 2002:a05:6871:a10d:b0:1fa:fd62:18f5 with SMTP id vs13-20020a056871a10d00b001fafd6218f5mr14289888oab.22.1702734312328;
        Sat, 16 Dec 2023 05:45:12 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:45:12 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 28/29] powerpc: Add atomics tests
Date: Sat, 16 Dec 2023 23:42:55 +1000
Message-ID: <20231216134257.1743345-29-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231216134257.1743345-1-npiggin@gmail.com>
References: <20231216134257.1743345-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/Makefile.common |   1 +
 powerpc/atomics.c       | 190 ++++++++++++++++++++++++++++++++++++++++
 powerpc/unittests.cfg   |   9 ++
 3 files changed, 200 insertions(+)
 create mode 100644 powerpc/atomics.c

diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index caa807f2..697f5735 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -10,6 +10,7 @@ tests-common = \
 	$(TEST_DIR)/spapr_hcall.elf \
 	$(TEST_DIR)/rtas.elf \
 	$(TEST_DIR)/emulator.elf \
+	$(TEST_DIR)/atomics.elf \
 	$(TEST_DIR)/tm.elf \
 	$(TEST_DIR)/smp.elf \
 	$(TEST_DIR)/sprs.elf \
diff --git a/powerpc/atomics.c b/powerpc/atomics.c
new file mode 100644
index 00000000..f2e7a3e3
--- /dev/null
+++ b/powerpc/atomics.c
@@ -0,0 +1,190 @@
+/*
+ * Test some powerpc instructions
+ */
+#include <stdint.h>
+#include <libcflat.h>
+#include <migrate.h>
+#include <asm/processor.h>
+
+static int verbose;
+
+#define RSV_SIZE 128
+
+static uint8_t granule[RSV_SIZE] __attribute((__aligned__(RSV_SIZE)));
+
+static void test_lwarx_stwcx(void)
+{
+	unsigned int *var = (unsigned int *)granule;
+	unsigned int old;
+	unsigned int result;
+
+	report_prefix_push("lwarx/stwcx.");
+
+	*var = 0;
+	asm volatile ("1:"
+		      "lwarx	%0,0,%2;"
+		      "stwcx.	%1,0,%2;"
+		      "bne-	1b;"
+		      : "=&r"(old) : "r"(1), "r"(var) : "cr0", "memory");
+	report(old == 0 && *var == 1, "simple update");
+
+	*var = 0;
+	asm volatile ("li	%0,0;"
+		      "stwcx.	%1,0,%2;"
+		      "stwcx.	%1,0,%2;"
+		      "bne-	1f;"
+		      "li	%0,1;"
+		      "1:"
+		      : "=&r"(result)
+		      : "r"(1), "r"(var) : "cr0", "memory");
+	report(result == 0 && *var == 0, "failed stwcx. (no reservation)");
+
+	*var = 0;
+	asm volatile ("li	%0,0;"
+		      "lwarx	%1,0,%4;"
+		      "stw	%3,0(%4);"
+		      "stwcx.	%2,0,%4;"
+		      "bne-	1f;"
+		      "li	%0,1;"
+		      "1:"
+		      : "=&r"(result), "=&r"(old)
+		      : "r"(1), "r"(2), "r"(var) : "cr0", "memory");
+	report(result == 0 && *var == 2, "failed stwcx. (intervening store)");
+
+	report_prefix_pop();
+}
+
+static void test_lqarx_stqcx(void)
+{
+	union {
+		__int128_t var;
+		struct {
+#if  __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+			unsigned long var1;
+			unsigned long var2;
+#else
+			unsigned long var2;
+			unsigned long var1;
+#endif
+		};
+	} var __attribute__((aligned(16)));
+	register unsigned long new1 asm("r8");
+	register unsigned long new2 asm("r9");
+	register unsigned long old1 asm("r10");
+	register unsigned long old2 asm("r11");
+	unsigned int result;
+
+	var.var1 = 1;
+	var.var2 = 2;
+
+	(void)new2;
+	(void)old2;
+
+	report_prefix_push("lqarx/stqcx.");
+
+	old1 = 0;
+	old2 = 0;
+	new1 = 3;
+	new2 = 4;
+	asm volatile ("1:"
+		      "lqarx	%0,0,%4;"
+		      "stqcx.	%2,0,%4;"
+		      "bne-	1b;"
+		      : "=&r"(old1), "=&r"(old2)
+		      : "r"(new1), "r"(new2), "r"(&var)
+		      : "cr0", "memory");
+
+	report(old1 == 2 && old2 == 1 && var.var1 == 4 && var.var2 == 3,
+			"simple update");
+
+	var.var1 = 1;
+	var.var2 = 2;
+	new1 = 3;
+	new2 = 4;
+	asm volatile ("li	%0,0;"
+		      "stqcx.	%1,0,%3;"
+		      "stqcx.	%1,0,%3;"
+		      "bne-	1f;"
+		      "li	%0,1;"
+		      "1:"
+		      : "=&r"(result)
+		      : "r"(new1), "r"(new2), "r"(&var)
+		      : "cr0", "memory");
+	report(result == 0 && var.var1 == 1 && var.var2 == 2,
+			"failed stqcx. (no reservation)");
+
+	var.var1 = 1;
+	var.var2 = 2;
+	new1 = 3;
+	new2 = 4;
+	asm volatile ("li	%0,0;"
+		      "lqarx	%1,0,%6;"
+		      "std	%5,0(%6);"
+		      "stqcx.	%3,0,%6;"
+		      "bne-	1f;"
+		      "li	%0,1;"
+		      "1:"
+		      : "=&r"(result), "=&r"(old1), "=&r"(old2)
+		      : "r"(new1), "r"(new2), "r"(0), "r"(&var)
+		      : "cr0", "memory");
+	report(result == 0 && (var.var1 == 0 || var.var2 == 0),
+			"failed stqcx. (intervening store)");
+
+	report_prefix_pop();
+}
+
+static void test_migrate_reserve(void)
+{
+	unsigned int *var = (unsigned int *)granule;
+	unsigned int old;
+
+	/* ensure incorrect value does not succeed */
+	report_prefix_push("migrate reservation");
+
+	*var = 0x12345;
+	asm volatile ("lwarx	%0,0,%1" : "=&r"(old) : "r"(var) : "memory");
+	migrate();
+	*var = 0;
+	asm volatile ("stwcx.	%0,0,%1" : : "r"(0xbad), "r"(var) : "cr0", "memory");
+	report(*var == 0, "migrate reserve update fails with concurrently modified value");
+
+#if 0
+XXX this will not work with KVM and for QEMU it only works with record/replay -
+something the harness is not equipped to test.
+
+	/* ensure reservation succeds */
+	report_prefix_push("migrate reservation");
+
+	*var = 0x12345;
+	asm volatile ("lwarx	%0,0,%1" : "=&r"(old) : "r"(var) : "memory");
+	migrate();
+	asm volatile ("stwcx.	%0,0,%1" : : "r"(0xf070), "r"(var) : "cr0", "memory");
+	report(*var == 0xf070, "migrate reserve update succeeds with unmodified value");
+#endif
+}
+
+int main(int argc, char **argv)
+{
+	int i;
+	bool migrate = false;
+
+	for (i = 1; i < argc; i++) {
+		if (strcmp(argv[i], "-v") == 0) {
+			verbose = 1;
+		}
+		if (strcmp(argv[i], "-m") == 0) {
+			migrate = true;
+		}
+	}
+
+	report_prefix_push("atomics");
+
+	test_lwarx_stwcx();
+	test_lqarx_stqcx();
+	if (migrate)
+		test_migrate_reserve();
+
+	report_prefix_pop();
+
+	return report_summary();
+}
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 727712bb..9f71ea93 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -80,6 +80,15 @@ smp = 2
 file = smp.elf
 smp = 8,threads=4
 
+[atomics]
+file = atomics.elf
+
+[atomics-migration]
+file = atomics.elf
+machine = pseries
+extra_params = -append '-m'
+groups = migration
+
 [h_cede_tm]
 file = tm.elf
 machine = pseries
-- 
2.42.0

