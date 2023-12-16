Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B40E58159BB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 15:07:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WAi54+aq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsnwX2r56z3vds
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 01:07:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WAi54+aq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2b; helo=mail-oa1-x2b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com [IPv6:2001:4860:4864:20::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnQk36pnz3dKm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:45:18 +1100 (AEDT)
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-2037b2d77dbso872469fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734316; x=1703339116; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJmrD4DH3cdeEkRHraBHWWLs8eEQ/ZsCK6qzMNjQ7GM=;
        b=WAi54+aqmQAu8OX7W1Gf8GFxzTiQ548QkYD8pbTYIFJjzRZOWqrPDSXCKqY3RO5P0K
         vn1swj/YJjJquIgZq/mrEUgz3A3RCNUxvGTDq6qR4WYULlkiVzMDv3NF1a3WRPBueD12
         g3+aT7pp2RSEqlzI3qtJM8ZR8V8ekTB5UdMAcfpDlpKf6Er6OLqPkYYGL1Cz59ACB3Sn
         hO/6gg8LLZrxl835VuKVrBf8MoBX0zyZgQBxESINWWgU/ftstkKyIhIeFCp0/7K+7fM4
         Sf271G/e5JJBSyZh4ihgc9vJ/4zWCsRFNz9lhAmLdNeKC9EvCFi8aqhEzFhPFSUg9/bY
         TCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734316; x=1703339116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LJmrD4DH3cdeEkRHraBHWWLs8eEQ/ZsCK6qzMNjQ7GM=;
        b=GBJP8t1cdfR6XJ7Oe7JI8zPMezEHaAY3ulrokIxF+Nhsq8il+cPszlRNDbjtifQrNt
         dcnjqvfJTEK89YNBJ03168tRu0kJoT1v9Hmqq6cFVQgmCwETdoGEsjfwWhoqZ0EKPlul
         w2C7sfUcEdlWUz8jbD7ThPa8WGjWreaKJBqpA7meEP3eM+uJcvTIJeI9ldwwXFOWptxZ
         H5WPXMFwoBDfoKG8FN9CYKsQglV7YwXhtOTqM024NwR5gIiRmYxPeHimTfQolc514CKX
         yOgrd00kOb59uRA8+MQvbqnz57FRfjy6KJoGucHc1wRF7ETDaIn3z+yqD5Z36KTZgWO9
         uHVw==
X-Gm-Message-State: AOJu0YwII1SH8AsycldggV8j/DGaW6kPK/Zo+DpuY9Tt4kQuLfEPyWPl
	LQzDFQaPK38jXNASlFGDT0I=
X-Google-Smtp-Source: AGHT+IGGeAlho+mZSPmtOQg/Jfr0/6REw+iNG0NCoMDzCHLm7jtFw3n1MNH2qehR2hFQfCQ9R1VbDw==
X-Received: by 2002:a05:6870:9110:b0:203:c7a:618a with SMTP id o16-20020a056870911000b002030c7a618amr8315250oae.94.1702734316393;
        Sat, 16 Dec 2023 05:45:16 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:45:16 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 29/29] powerpc: Add timebase tests
Date: Sat, 16 Dec 2023 23:42:56 +1000
Message-ID: <20231216134257.1743345-30-npiggin@gmail.com>
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

This has a known failure on QEMU TCG machines where the decrementer
interrupt is not lowered when the DEC wraps from -ve to +ve.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/ppc_asm.h   |   1 +
 lib/powerpc/asm/processor.h |  22 +++
 powerpc/Makefile.common     |   1 +
 powerpc/smp.c               |  22 ---
 powerpc/timebase.c          | 328 ++++++++++++++++++++++++++++++++++++
 powerpc/unittests.cfg       |   8 +
 6 files changed, 360 insertions(+), 22 deletions(-)
 create mode 100644 powerpc/timebase.c

diff --git a/lib/powerpc/asm/ppc_asm.h b/lib/powerpc/asm/ppc_asm.h
index 778e78ee..18b25fe0 100644
--- a/lib/powerpc/asm/ppc_asm.h
+++ b/lib/powerpc/asm/ppc_asm.h
@@ -47,6 +47,7 @@
 #define SPR_HSRR1	0x13B
 #define SPR_LPCR	0x13E
 #define   LPCR_HDICE	0x1UL
+#define   LPCR_LD	0x20000UL
 #define SPR_HEIR	0x153
 #define SPR_SIAR	0x31C
 
diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index 924451da..995656b6 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -45,6 +45,28 @@ static inline void mtmsr(uint64_t msr)
 	asm volatile ("mtmsrd %[msr]" :: [msr] "r" (msr) : "memory");
 }
 
+static inline void local_irq_enable(void)
+{
+	unsigned long msr;
+
+	asm volatile(
+"		mfmsr	%0		\n \
+		ori	%0,%0,%1	\n \
+		mtmsrd	%0,1		"
+		: "=r"(msr) : "i"(MSR_EE): "memory");
+}
+
+static inline void local_irq_disable(void)
+{
+	unsigned long msr;
+
+	asm volatile(
+"		mfmsr	%0		\n \
+		andc	%0,%0,%1	\n \
+		mtmsrd	%0,1		"
+		: "=r"(msr) : "r"(MSR_EE): "memory");
+}
+
 /*
  * This returns true on PowerNV / OPAL machines which run in hypervisor
  * mode. False on pseries / PAPR machines that run in guest mode.
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index 697f5735..448b0ded 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -14,6 +14,7 @@ tests-common = \
 	$(TEST_DIR)/tm.elf \
 	$(TEST_DIR)/smp.elf \
 	$(TEST_DIR)/sprs.elf \
+	$(TEST_DIR)/timebase.elf \
 	$(TEST_DIR)/interrupts.elf
 
 tests-all = $(tests-common) $(tests)
diff --git a/powerpc/smp.c b/powerpc/smp.c
index b0a99069..60503977 100644
--- a/powerpc/smp.c
+++ b/powerpc/smp.c
@@ -43,28 +43,6 @@ static void ipi_handler(struct pt_regs *regs, void *data)
 	atomic_fetch_inc(&nr_cpus_ipi);
 }
 
-static void local_irq_enable(void)
-{
-	unsigned long msr;
-
-	asm volatile(
-"		mfmsr	%0		\n \
-		ori	%0,%0,%1	\n \
-		mtmsrd	%0,1		"
-		: "=r"(msr) : "i"(MSR_EE): "memory");
-}
-
-static void local_irq_disable(void)
-{
-	unsigned long msr;
-
-	asm volatile(
-"		mfmsr	%0		\n \
-		andc	%0,%0,%1	\n \
-		mtmsrd	%0,1		"
-		: "=r"(msr) : "r"(MSR_EE): "memory");
-}
-
 static volatile bool ipi_test_running = true;
 
 static void ipi_fn(int cpu_id)
diff --git a/powerpc/timebase.c b/powerpc/timebase.c
new file mode 100644
index 00000000..4d80ea09
--- /dev/null
+++ b/powerpc/timebase.c
@@ -0,0 +1,328 @@
+/*
+ * Test Timebase
+ *
+ * Copyright 2017  Thomas Huth, Red Hat Inc.
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.
+ *
+ * This contains tests of timebase facility, TB, DEC, etc.
+ */
+#include <libcflat.h>
+#include <util.h>
+#include <migrate.h>
+#include <alloc.h>
+#include <asm/handlers.h>
+#include <devicetree.h>
+#include <asm/hcall.h>
+#include <asm/processor.h>
+#include <asm/barrier.h>
+
+static int dec_bits = 0;
+
+static void cpu_dec_bits(int fdtnode, u64 regval __unused, void *arg __unused)
+{
+	const struct fdt_property *prop;
+	int plen;
+
+	prop = fdt_get_property(dt_fdt(), fdtnode, "ibm,dec-bits", &plen);
+	if (!prop) {
+		dec_bits = 32;
+		return;
+	}
+
+	/* Sanity check for the property layout (first two bytes are header) */
+	assert(plen == 4);
+
+	dec_bits = fdt32_to_cpu(*(uint32_t *)prop->data);
+}
+
+/* Check amount of CPUs nodes that have the TM flag */
+static int find_dec_bits(void)
+{
+	int ret;
+
+	ret = dt_for_each_cpu_node(cpu_dec_bits, NULL);
+	if (ret < 0)
+		return ret;
+
+	return dec_bits;
+}
+
+
+static bool do_migrate = false;
+static volatile bool got_interrupt;
+static volatile struct pt_regs recorded_regs;
+
+static uint64_t dec_max;
+static uint64_t dec_min;
+
+static void test_tb(int argc, char **argv)
+{
+	uint64_t tb;
+
+	tb = get_tb();
+	if (do_migrate)
+		migrate();
+	report(get_tb() >= tb, "timebase is incrementing");
+}
+
+static void dec_stop_handler(struct pt_regs *regs, void *data)
+{
+	mtspr(SPR_DEC, dec_max);
+}
+
+static void dec_handler(struct pt_regs *regs, void *data)
+{
+	got_interrupt = true;
+	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
+	regs->msr &= ~MSR_EE;
+}
+
+static void test_dec(int argc, char **argv)
+{
+	uint64_t tb1, tb2, dec;
+
+	handle_exception(0x900, &dec_handler, NULL);
+
+	tb1 = get_tb();
+	mtspr(SPR_DEC, dec_max);
+	dec = mfspr(SPR_DEC);
+	tb2 = get_tb();
+	report(tb2 - tb1 >= dec_max - dec, "decrementer remains within TB");
+	assert(tb2 - tb1 >= dec_max - dec);
+
+	tb1 = get_tb();
+	mtspr(SPR_DEC, dec_max);
+	mdelay(1000);
+	dec = mfspr(SPR_DEC);
+	tb2 = get_tb();
+	report(tb2 - tb1 >= dec_max - dec, "decrementer remains within TB after 1s");
+	assert(tb2 - tb1 >= dec_max - dec);
+
+	mtspr(SPR_DEC, dec_max);
+	local_irq_enable();
+	local_irq_disable();
+	if (mfspr(SPR_DEC) <= dec_max) {
+		report(!got_interrupt, "no interrupt on decrementer positive");
+	}
+	got_interrupt = false;
+
+	mtspr(SPR_DEC, 1);
+	mdelay(100); /* Give the timer a chance to run */
+	if (do_migrate)
+		migrate();
+	local_irq_enable();
+	local_irq_disable();
+	report(got_interrupt, "interrupt on decrementer underflow");
+	got_interrupt = false;
+
+	if (do_migrate)
+		migrate();
+	local_irq_enable();
+	local_irq_disable();
+	report(got_interrupt, "interrupt on decrementer still underflown");
+	got_interrupt = false;
+
+	mtspr(SPR_DEC, 0);
+	mdelay(100); /* Give the timer a chance to run */
+	if (do_migrate)
+		migrate();
+	local_irq_enable();
+	local_irq_disable();
+	report(got_interrupt, "DEC deal with set to 0");
+	got_interrupt = false;
+
+	/* Test for level-triggered decrementer */
+	mtspr(SPR_DEC, -1ULL);
+	if (do_migrate)
+		migrate();
+	local_irq_enable();
+	local_irq_disable();
+	report(got_interrupt, "interrupt on decrementer write MSB");
+	got_interrupt = false;
+
+	mtspr(SPR_DEC, dec_max);
+	local_irq_enable();
+	if (do_migrate)
+		migrate();
+	mtspr(SPR_DEC, -1);
+	local_irq_disable();
+	report(got_interrupt, "interrupt on decrementer write MSB with irqs on");
+	got_interrupt = false;
+
+	mtspr(SPR_DEC, dec_min + 1);
+	mdelay(100);
+	local_irq_enable();
+	local_irq_disable();
+	report(!got_interrupt, "no interrupt after wrap to positive");
+	got_interrupt = false;
+
+	handle_exception(0x900, NULL, NULL);
+}
+
+static void test_hdec(int argc, char **argv)
+{
+	uint64_t tb1, tb2, hdec;
+
+	if (!machine_is_powernv()) {
+		report_skip("skipping on !powernv machine");
+		return;
+	}
+
+	handle_exception(0x900, &dec_stop_handler, NULL);
+	handle_exception(0x980, &dec_handler, NULL);
+
+	mtspr(SPR_HDEC, dec_max);
+	mtspr(SPR_LPCR, mfspr(SPR_LPCR) | LPCR_HDICE);
+
+	tb1 = get_tb();
+	mtspr(SPR_HDEC, dec_max);
+	hdec = mfspr(SPR_HDEC);
+	tb2 = get_tb();
+	report(tb2 - tb1 >= dec_max - hdec, "hdecrementer remains within TB");
+	assert(tb2 - tb1 >= dec_max - hdec);
+
+	tb1 = get_tb();
+	mtspr(SPR_HDEC, dec_max);
+	mdelay(1000);
+	hdec = mfspr(SPR_HDEC);
+	tb2 = get_tb();
+	report(tb2 - tb1 >= dec_max - hdec, "hdecrementer remains within TB after 1s");
+	assert(tb2 - tb1 >= dec_max - hdec);
+
+	mtspr(SPR_HDEC, dec_max);
+	local_irq_enable();
+	local_irq_disable();
+	if (mfspr(SPR_HDEC) <= dec_max) {
+		report(!got_interrupt, "no interrupt on decrementer positive");
+	}
+	got_interrupt = false;
+
+	mtspr(SPR_HDEC, 1);
+	mdelay(100); /* Give the timer a chance to run */
+	if (do_migrate)
+		migrate();
+	/* HDEC is edge triggered so ensure it still fires */
+	mtspr(SPR_HDEC, dec_max);
+	local_irq_enable();
+	local_irq_disable();
+	report(got_interrupt, "interrupt on hdecrementer underflow");
+	got_interrupt = false;
+
+	if (do_migrate)
+		migrate();
+	local_irq_enable();
+	local_irq_disable();
+	report(!got_interrupt, "no interrupt on hdecrementer still underflown");
+	got_interrupt = false;
+
+	mtspr(SPR_HDEC, -1ULL);
+	if (do_migrate)
+		migrate();
+	local_irq_enable();
+	local_irq_disable();
+	report(got_interrupt, "no interrupt on hdecrementer underflown write MSB");
+	got_interrupt = false;
+
+	mtspr(SPR_HDEC, 0);
+	mdelay(100); /* Give the timer a chance to run */
+	if (do_migrate)
+		migrate();
+	/* HDEC is edge triggered so ensure it still fires */
+	mtspr(SPR_HDEC, dec_max);
+	local_irq_enable();
+	local_irq_disable();
+	report(got_interrupt, "HDEC deal with set to 0");
+	got_interrupt = false;
+
+	mtspr(SPR_HDEC, dec_max);
+	local_irq_enable();
+	if (do_migrate)
+		migrate();
+	mtspr(SPR_HDEC, -1ULL);
+	local_irq_disable();
+	report(got_interrupt, "interrupt on hdecrementer write MSB with irqs on");
+	got_interrupt = false;
+
+	mtspr(SPR_HDEC, dec_max);
+	got_interrupt = false;
+	mtspr(SPR_HDEC, dec_min + 1);
+	if (do_migrate)
+		migrate();
+	mdelay(100);
+	local_irq_enable();
+	local_irq_disable();
+	report(got_interrupt, "got interrupt after wrap to positive");
+	got_interrupt = false;
+
+	mtspr(SPR_HDEC, -1ULL);
+	local_irq_enable();
+	local_irq_disable();
+	got_interrupt = false;
+	mtspr(SPR_HDEC, dec_min + 1000000);
+	if (do_migrate)
+		migrate();
+	mdelay(100);
+	mtspr(SPR_HDEC, -1ULL);
+	local_irq_enable();
+	local_irq_disable();
+	report(got_interrupt, "edge re-armed after wrap to positive");
+	got_interrupt = false;
+
+	mtspr(SPR_LPCR, mfspr(SPR_LPCR) & ~LPCR_HDICE);
+
+	handle_exception(0x900, NULL, NULL);
+	handle_exception(0x980, NULL, NULL);
+}
+
+struct {
+	const char *name;
+	void (*func)(int argc, char **argv);
+} hctests[] = {
+	{ "tb", test_tb },
+	{ "dec", test_dec },
+	{ "hdec", test_hdec },
+	{ NULL, NULL }
+};
+
+int main(int argc, char **argv)
+{
+	bool all;
+	int i;
+
+	all = argc == 1 || !strcmp(argv[1], "all");
+
+	for (i = 1; i < argc; i++) {
+		if (!strcmp(argv[i], "-w")) {
+			do_migrate = true;
+			if (!all && argc == 2)
+				all = true;
+		}
+	}
+
+	find_dec_bits();
+	dec_max = (1ULL << (dec_bits - 1)) - 1;
+	dec_min = (1ULL << (dec_bits - 1));
+
+	if (machine_is_powernv() && dec_bits > 32) {
+		mtspr(SPR_LPCR, mfspr(SPR_LPCR) | LPCR_LD);
+	}
+
+	report_prefix_push("timebase");
+
+	for (i = 0; hctests[i].name != NULL; i++) {
+		if (all || strcmp(argv[1], hctests[i].name) == 0) {
+			report_prefix_push(hctests[i].name);
+			hctests[i].func(argc, argv);
+			report_prefix_pop();
+		}
+	}
+
+	report_prefix_pop();
+
+	if (machine_is_powernv() && dec_bits > 32) {
+		mtspr(SPR_LPCR, mfspr(SPR_LPCR) & ~LPCR_LD);
+	}
+
+	return report_summary();
+}
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 9f71ea93..882d48da 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -89,6 +89,14 @@ machine = pseries
 extra_params = -append '-m'
 groups = migration
 
+[timebase]
+file = timebase.elf
+
+[timebase-icount]
+file = timebase.elf
+accel = tcg
+extra_params = -icount shift=0
+
 [h_cede_tm]
 file = tm.elf
 machine = pseries
-- 
2.42.0

