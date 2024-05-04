Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE178BBB7D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:44:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X3xzGhLI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWnSG4QFdz3vyV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:44:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=X3xzGhLI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn7V20mTz3c5J
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:30:14 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6edb76d83d0so511303b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825812; x=1715430612; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ex+SxNXbtxHc+7eehoPisO4bpsSQtf/mN9p+UJCwI0U=;
        b=X3xzGhLIHVmVRI6dZMjBP9g6QnZjQxypW+lcxiC68ELx6FkU8nptZjaiHdNpTxCWS4
         6cnupDzNr6HXa7AIFbqXAz6rFiias6rU0dDCWiqJGnIdT+jocR7hBknpYqQsJYgLy3YI
         PWWqpBNJ9xDYSXucauRB/BvMtKF73rUcDgJSEwwJElAi046mBknZUqD+BI95A0ZJGr9G
         hsTstVwOhVbpBBWqD2f13PaHUbsNdFOoSYf9jIEc6ZU5QFbt5Mthujs2DHt3ob89pw7i
         L+f3/V1GYpXpxiDS81XjC4vpANX/PPfuSdRZ9r/zck8YFd0xbQgsWXCik4jTzN4vYgWn
         hLVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825812; x=1715430612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ex+SxNXbtxHc+7eehoPisO4bpsSQtf/mN9p+UJCwI0U=;
        b=jdz7vA6xMH5FzKhBfteKtGT3Q++oR2k3/PDwsa5HJQzroC3TImkaaayQBwxAg+Rna4
         BRkurkwp7BowtEaZU2fucYZx/EA3QABaihYYfkLX+mPgQz7qqXVEGaxKmvHLs0cDAj0g
         6tP8q6bhUCKdxYi/q2ideL5ABzniAHqmnTsCX8mXXVEm2NAJFmF7m8zFX2VSzYN/hsVs
         9Yc9n/F2EW6Qp4g3LMFQNzbKAeuKikJTsLiEOTh+790sryu2qMKmv6R8XGgWcdGIMja7
         dCo49Lkp6F9h6+uipfTje/+jmHqw6P8QW0bEw91w52uI4xpYclTG2pepbR6KjCMdi1eU
         Av7A==
X-Forwarded-Encrypted: i=1; AJvYcCWJ6tQfUOrqiUid/cfEw+QwWyukz8izeObx+cHFweV2K5UsvocG/m8/g1QUCOtoXTNlJtY+O9Dtb7nUyXYJkRu+kgSQhPngKk2L2WC/zg==
X-Gm-Message-State: AOJu0YxcIyrvsDBOuppLFbrfTQOoz+8fHMw2zoW00HiJDLzVvOWhYeeh
	kixWZbTe0B+RnDI2rJNb4uhizSUYYf1xeTJ7hWYBs8SIAwChtEjd
X-Google-Smtp-Source: AGHT+IG0fFbbW3YKxQSYIB6Odvi+DEnlXT1BnkYx0IAJxuiZdpGcSJo4tew9A3NZcIpQMVmwkeKy0w==
X-Received: by 2002:a05:6a00:1704:b0:6f3:854c:dee0 with SMTP id h4-20020a056a00170400b006f3854cdee0mr6747466pfc.21.1714825811715;
        Sat, 04 May 2024 05:30:11 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:30:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 21/31] powerpc: Add timebase tests
Date: Sat,  4 May 2024 22:28:27 +1000
Message-ID: <20240504122841.1177683-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504122841.1177683-1-npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This has a known failure on QEMU TCG machines where the decrementer
interrupt is not lowered when the DEC wraps from -ve to +ve.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/reg.h   |   1 +
 powerpc/Makefile.common |   1 +
 powerpc/timebase.c      | 331 ++++++++++++++++++++++++++++++++++++++++
 powerpc/unittests.cfg   |   8 +
 4 files changed, 341 insertions(+)
 create mode 100644 powerpc/timebase.c

diff --git a/lib/powerpc/asm/reg.h b/lib/powerpc/asm/reg.h
index d2ca964c4..12f9e8ac6 100644
--- a/lib/powerpc/asm/reg.h
+++ b/lib/powerpc/asm/reg.h
@@ -35,6 +35,7 @@
 #define SPR_HSRR1	0x13b
 #define SPR_LPCR	0x13e
 #define   LPCR_HDICE		UL(0x1)
+#define   LPCR_LD		UL(0x20000)
 #define SPR_HEIR	0x153
 #define SPR_MMCR0	0x31b
 #define   MMCR0_FC		UL(0x80000000)
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index 420103c87..b273033d1 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -15,6 +15,7 @@ tests-common = \
 	$(TEST_DIR)/tm.elf \
 	$(TEST_DIR)/smp.elf \
 	$(TEST_DIR)/sprs.elf \
+	$(TEST_DIR)/timebase.elf \
 	$(TEST_DIR)/interrupts.elf
 
 tests-all = $(tests-common) $(tests)
diff --git a/powerpc/timebase.c b/powerpc/timebase.c
new file mode 100644
index 000000000..02a4e33c0
--- /dev/null
+++ b/powerpc/timebase.c
@@ -0,0 +1,331 @@
+/* SPDX-License-Identifier: LGPL-2.0-only */
+/*
+ * Test Timebase
+ *
+ * Copyright 2024 Nicholas Piggin, IBM Corp.
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
+#include <asm/time.h>
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
+	int i;
+
+	handle_exception(0x900, &dec_handler, NULL);
+
+	for (i = 0; i < 100; i++) {
+		tb1 = get_tb();
+		mtspr(SPR_DEC, dec_max);
+		dec = mfspr(SPR_DEC);
+		tb2 = get_tb();
+		if (tb2 - tb1 < dec_max - dec)
+			break;
+	}
+	/* POWER CPUs can have a slight (few ticks) variation here */
+	report_kfail(true, tb2 - tb1 >= dec_max - dec, "decrementer remains within TB after mtDEC");
+
+	tb1 = get_tb();
+	mtspr(SPR_DEC, dec_max);
+	mdelay(1000);
+	dec = mfspr(SPR_DEC);
+	tb2 = get_tb();
+	report(tb2 - tb1 >= dec_max - dec, "decrementer remains within TB after 1s");
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
+	/* TCG does not model this correctly */
+	report_kfail(true, !got_interrupt, "no interrupt after wrap to positive");
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
+
+	tb1 = get_tb();
+	mtspr(SPR_HDEC, dec_max);
+	mdelay(1000);
+	hdec = mfspr(SPR_HDEC);
+	tb2 = get_tb();
+	report(tb2 - tb1 >= dec_max - hdec, "hdecrementer remains within TB after 1s");
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
index a4210ab2a..39e6dea3c 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -92,6 +92,14 @@ machine = pseries
 extra_params = -append "migration -m"
 groups = migration
 
+[timebase]
+file = timebase.elf
+
+[timebase-icount]
+file = timebase.elf
+accel = tcg
+extra_params = -icount shift=5
+
 [h_cede_tm]
 file = tm.elf
 machine = pseries
-- 
2.43.0

