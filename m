Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 385788670FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:29:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZadCyobZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjxgT72NJz3wPl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:29:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZadCyobZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxKr0xLJz3dRs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:14:07 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5cddfe0cb64so2189581a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942445; x=1709547245; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6pHJaaTBrGzeZZNl7/Rw9N+u8KW2C9dFJDrrfkdDXc=;
        b=ZadCyobZSktbWWrtbhccKj3rpPtZR+MMXVuEQqvl5eBsZX3vblrayI3CcynNlVsfC5
         7j+iq80ZeKEVy6NFm7kAJeknJXDn2Qm4U5ogX/K4L3X71f/FLQh6KOKDqsUmyVNfjKGO
         99aqQFGn4YQzwzFU6ST8S5z+wJFAIxJ2EvSlVfz2uBfpK1STdK3JZZdiQPOmJCU4O+bo
         TBLHPnqB6Oz1K4rXeBRwQGb0sgEL0Fk0WaH/IJQ8thQXbVxqIU6eN7ndiOL66NSCnbax
         a5Hut30K13lYtjmsClL0yZ15LUwG1yg+jANIWssRcJBHKe2tJMEgUlqkU7ptNsD05n8f
         hjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942445; x=1709547245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6pHJaaTBrGzeZZNl7/Rw9N+u8KW2C9dFJDrrfkdDXc=;
        b=JvDu6CGslkbsi2Ehk89g3gwl4aNF6K8X5zhk/IwxaZmnjuBnjIaSe7lYFn0Y87byFL
         uDepL/VueuuB5bEd8CjjYNaliyjGIAA2XIkO3OEmDkFHStpQ8H5m0lhZ6p+sQJoAirgi
         t0ZqBQtOZQ8ahmktgRYxPGLPcFtYgnleT1946vS+QaAelDX9fbV3lqfsFkSqaR+eQkS/
         t2sbwzBtFm1U4tvFtlgmhEUNAFsGx5KgknAUWSL7aytY419P3+JMMf0gYQ0R2zh4dfIa
         dtvFV462jYFWnLj7cEIeDbiPG4iNZk+fSWJtCmbsYndpIVwN0R9NkJXktGrqV3iNY7xn
         nKbw==
X-Forwarded-Encrypted: i=1; AJvYcCXiexQAmmh6nFRHNowgCahwU59ZMLAAxURnFcEXpC9ZdBJfHLQw9JpP+uohk5+dX1VmLZHRvWvdScHZIqkshDy4Sfmk+EqYfaqVpQupug==
X-Gm-Message-State: AOJu0YxQl8zuyQCACZ3Q57VT2DF9+JFrvrlktv4OIoPOhE3hVqJqFXPC
	mT+KOwVbAwZZQit6dDDZXI34pXMXxMD50/TS2InhLTCTtfNrNr3y
X-Google-Smtp-Source: AGHT+IHVqx6V/WarEWxmib3Qjr8IfmZHnp3AATCdLVVs4i0jp4vT1KsyViN7rHLhDrSFHf+ZzjEFpA==
X-Received: by 2002:a05:6a20:de1b:b0:19e:aa16:2189 with SMTP id kz27-20020a056a20de1b00b0019eaa162189mr4034075pzb.42.1708942445119;
        Mon, 26 Feb 2024 02:14:05 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:14:04 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 22/32] powerpc: Add timebase tests
Date: Mon, 26 Feb 2024 20:12:08 +1000
Message-ID: <20240226101218.1472843-23-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240226101218.1472843-1-npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This has a known failure on QEMU TCG machines where the decrementer
interrupt is not lowered when the DEC wraps from -ve to +ve.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/reg.h   |   1 +
 powerpc/Makefile.common |   1 +
 powerpc/timebase.c      | 330 ++++++++++++++++++++++++++++++++++++++++
 powerpc/unittests.cfg   |   8 +
 4 files changed, 340 insertions(+)
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
index b6f9b3b85..1348f658b 100644
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
index 000000000..6d8d54cb1
--- /dev/null
+++ b/powerpc/timebase.c
@@ -0,0 +1,330 @@
+/*
+ * Test Timebase
+ *
+ * Copyright 2024 Nicholas Piggin, IBM Corp.
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
+	report(tb2 - tb1 >= dec_max - dec, "decrementer remains within TB after mtDEC");
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
index f8d43c220..3ebdf9dd3 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -112,6 +112,14 @@ machine = pseries
 extra_params = -append "'migration -m'"
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
2.42.0

