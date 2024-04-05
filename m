Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 759F88998B0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:59:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QAGzvpNC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sr11TRHz86mf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:59:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QAGzvpNC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sLz5pgVz3vZL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:38:03 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6ecfeefe94cso300254b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306281; x=1712911081; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/JkaRv4B+Z8LhYS2oU48Vg7Iv8HdXfwMEn7kADCtiQ=;
        b=QAGzvpNCm8VtG4kM4eD/0nDmhZtJjDQ14ExdA1ojU/XT7nN/5luZ/PTvfUo9NUMEtz
         WKnt9KPnSM8oCAMNa+9Yauv3UBzjzs/ATXTVEljjZ5UMi8OzAh9Ke+tvYUZRgvo2vtAT
         EEmGF9gHImhlLtQ3FWyBOZeWSYG3UohxD15HRdQBIskAya/YKZhJ0DlvjYIF4tFil4Vz
         5G2/CofN/PnDqePGaoozIlFfW4SoFgP/Mh8uX9FY5Y1SKJaPsqsdYgvDqBUKOzCiKO6n
         lOfHYKOnBzbiGR8Ug7h5nZkGuWRsqT5hGXOA8GgNBiUe88OBXqVb8L52ANCbaz6C8n/V
         C2bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306281; x=1712911081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/JkaRv4B+Z8LhYS2oU48Vg7Iv8HdXfwMEn7kADCtiQ=;
        b=OiK3pwAZPoWSxj9rA9syhTxFEEeC6bwgJzWpKmnyxk964Qvv0mrtMOMiNEElZLcTO3
         3CU1JtJ8i5s05vsR3HZKt6ta941ePiG2Y/+CqilSYJLX8qJvt7Jm4+Olr2qVtF9hXUAY
         D66ZMCJzu7yNYbypTC7z2N/EV4D+gaKH64+o61YsGi2AJYsIK0R5kdTkBpJ3w9XNTazY
         ccUnrYJtTgTRAncSeFVNzNKHi3Ln8CDp/Yz/RhLgBs/GzVZwlgYN0p9ZT4orLDEvoMnb
         JzizrgF+ssze/0rYCGxlozMO/bF/A9Z1kGJTBVg+omnSDYi1yWAYLEhMgaApPQikJdYd
         SWIA==
X-Forwarded-Encrypted: i=1; AJvYcCXczA4g8fpjTGGTX5ovVMNdSDbQwKv87aBR4Y5HpnU0FlKQYzdLeZXMFfj+xe5ezulGdMY5cz8M7gL7JWRPlP0qfcsxdH4hFjjXEOpsVw==
X-Gm-Message-State: AOJu0YxkjsXjL9xuVzxU5K0RIbPWI6aWiYMIeIB9h0pdjQ0K4F6J2fxN
	gUC7DZcso8pUGLZ7YPyh4c+sCafpBLxtMRcqqQ4E52pTMhrhYHNd
X-Google-Smtp-Source: AGHT+IFbOWkRjuz9A2EP8Z3M3LSSQ17idZNIlmJ3dvmdG8CpYH7j0L72J86UHbSbzkbiQwnyU7o5EA==
X-Received: by 2002:a05:6a21:329d:b0:1a7:17a:9ac1 with SMTP id yt29-20020a056a21329d00b001a7017a9ac1mr1570625pzb.1.1712306280761;
        Fri, 05 Apr 2024 01:38:00 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:38:00 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 32/35] powerpc: add pmu tests
Date: Fri,  5 Apr 2024 18:35:33 +1000
Message-ID: <20240405083539.374995-33-npiggin@gmail.com>
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

Add some initial PMU testing.

- PMC5/6 tests
- PMAE / PMI test
- BHRB basic tests

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/processor.h |   2 +
 lib/powerpc/asm/reg.h       |   9 +
 lib/powerpc/asm/setup.h     |   1 +
 lib/powerpc/setup.c         |  23 ++
 powerpc/Makefile.common     |   3 +-
 powerpc/pmu.c               | 405 ++++++++++++++++++++++++++++++++++++
 powerpc/unittests.cfg       |   3 +
 7 files changed, 445 insertions(+), 1 deletion(-)
 create mode 100644 powerpc/pmu.c

diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index 749155696..28239c610 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -14,6 +14,8 @@ extern bool cpu_has_hv;
 extern bool cpu_has_power_mce;
 extern bool cpu_has_siar;
 extern bool cpu_has_heai;
+extern bool cpu_has_bhrb;
+extern bool cpu_has_p10_bhrb;
 extern bool cpu_has_radix;
 extern bool cpu_has_prefix;
 extern bool cpu_has_sc_lev;
diff --git a/lib/powerpc/asm/reg.h b/lib/powerpc/asm/reg.h
index 69ef21adb..602fba1b6 100644
--- a/lib/powerpc/asm/reg.h
+++ b/lib/powerpc/asm/reg.h
@@ -40,10 +40,19 @@
 #define SPR_LPIDR	0x13f
 #define SPR_HEIR	0x153
 #define SPR_PTCR	0x1d0
+#define SPR_MMCRA	0x312
+#define   MMCRA_BHRBRD		UL(0x0000002000000000)
+#define   MMCRA_IFM_MASK	UL(0x00000000c0000000)
+#define SPR_PMC5	0x317
+#define SPR_PMC6	0x318
 #define SPR_MMCR0	0x31b
 #define   MMCR0_FC		UL(0x80000000)
+#define   MMCR0_FCP		UL(0x20000000)
 #define   MMCR0_PMAE		UL(0x04000000)
+#define   MMCR0_BHRBA		UL(0x00200000)
+#define   MMCR0_FCPC		UL(0x00001000)
 #define   MMCR0_PMAO		UL(0x00000080)
+#define   MMCR0_FC56		UL(0x00000010)
 #define SPR_SIAR	0x31c
 
 /* Machine State Register definitions: */
diff --git a/lib/powerpc/asm/setup.h b/lib/powerpc/asm/setup.h
index 9ca318ce6..8f0b58ed0 100644
--- a/lib/powerpc/asm/setup.h
+++ b/lib/powerpc/asm/setup.h
@@ -10,6 +10,7 @@
 #define NR_CPUS			8	/* arbitrarily set for now */
 
 extern uint64_t tb_hz;
+extern uint64_t cpu_hz;
 
 #define NR_MEM_REGIONS		8
 #define MR_F_PRIMARY		(1U << 0)
diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
index da56cb369..b56a1981a 100644
--- a/lib/powerpc/setup.c
+++ b/lib/powerpc/setup.c
@@ -33,6 +33,7 @@ u32 initrd_size;
 u32 cpu_to_hwid[NR_CPUS] = { [0 ... NR_CPUS-1] = (~0U) };
 int nr_cpus_present;
 uint64_t tb_hz;
+uint64_t cpu_hz;
 
 struct mem_region mem_regions[NR_MEM_REGIONS];
 phys_addr_t __physical_start, __physical_end;
@@ -42,6 +43,7 @@ struct cpu_set_params {
 	unsigned icache_bytes;
 	unsigned dcache_bytes;
 	uint64_t tb_hz;
+	uint64_t cpu_hz;
 };
 
 static void cpu_set(int fdtnode, u64 regval, void *info)
@@ -95,6 +97,22 @@ static void cpu_set(int fdtnode, u64 regval, void *info)
 		data = (u32 *)prop->data;
 		params->tb_hz = fdt32_to_cpu(*data);
 
+		prop = fdt_get_property(dt_fdt(), fdtnode,
+					"ibm,extended-clock-frequency", NULL);
+		if (prop) {
+			data = (u32 *)prop->data;
+			params->cpu_hz = fdt32_to_cpu(*data);
+			params->cpu_hz <<= 32;
+			data = (u32 *)prop->data + 1;
+			params->cpu_hz |= fdt32_to_cpu(*data);
+		} else {
+			prop = fdt_get_property(dt_fdt(), fdtnode,
+						"clock-frequency", NULL);
+			assert(prop != NULL);
+			data = (u32 *)prop->data;
+			params->cpu_hz = fdt32_to_cpu(*data);
+		}
+
 		read_common_info = true;
 	}
 }
@@ -103,6 +121,8 @@ bool cpu_has_hv;
 bool cpu_has_power_mce; /* POWER CPU machine checks */
 bool cpu_has_siar;
 bool cpu_has_heai;
+bool cpu_has_bhrb;
+bool cpu_has_p10_bhrb;
 bool cpu_has_radix;
 bool cpu_has_prefix;
 bool cpu_has_sc_lev; /* sc interrupt has LEV field in SRR1 */
@@ -119,12 +139,14 @@ static void cpu_init_params(void)
 	__icache_bytes = params.icache_bytes;
 	__dcache_bytes = params.dcache_bytes;
 	tb_hz = params.tb_hz;
+	cpu_hz = params.cpu_hz;
 
 	switch (mfspr(SPR_PVR) & PVR_VERSION_MASK) {
 	case PVR_VER_POWER10:
 		cpu_has_prefix = true;
 		cpu_has_sc_lev = true;
 		cpu_has_pause_short = true;
+		cpu_has_p10_bhrb = true;
 	case PVR_VER_POWER9:
 		cpu_has_radix = true;
 	case PVR_VER_POWER8E:
@@ -133,6 +155,7 @@ static void cpu_init_params(void)
 		cpu_has_power_mce = true;
 		cpu_has_heai = true;
 		cpu_has_siar = true;
+		cpu_has_bhrb = true;
 		break;
 	default:
 		break;
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index 410a675d9..64a3d93e4 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -17,7 +17,8 @@ tests-common = \
 	$(TEST_DIR)/smp.elf \
 	$(TEST_DIR)/sprs.elf \
 	$(TEST_DIR)/timebase.elf \
-	$(TEST_DIR)/interrupts.elf
+	$(TEST_DIR)/interrupts.elf \
+	$(TEST_DIR)/pmu.elf
 
 tests-all = $(tests-common) $(tests)
 all: directories $(TEST_DIR)/boot_rom.bin $(tests-all)
diff --git a/powerpc/pmu.c b/powerpc/pmu.c
new file mode 100644
index 000000000..7adf77e3a
--- /dev/null
+++ b/powerpc/pmu.c
@@ -0,0 +1,405 @@
+/* SPDX-License-Identifier: LGPL-2.0-only */
+/*
+ * Test PMU
+ *
+ * Copyright 2024 Nicholas Piggin, IBM Corp.
+ */
+#include <libcflat.h>
+#include <util.h>
+#include <migrate.h>
+#include <alloc.h>
+#include <asm/setup.h>
+#include <asm/handlers.h>
+#include <asm/hcall.h>
+#include <asm/processor.h>
+#include <asm/time.h>
+#include <asm/barrier.h>
+#include <asm/mmu.h>
+#include "alloc_phys.h"
+#include "vmalloc.h"
+
+static volatile bool got_interrupt;
+static volatile struct pt_regs recorded_regs;
+static volatile unsigned long recorded_mmcr0;
+
+static void illegal_handler(struct pt_regs *regs, void *data)
+{
+	got_interrupt = true;
+	regs_advance_insn(regs);
+}
+
+static void sc_handler(struct pt_regs *regs, void *data)
+{
+	got_interrupt = true;
+}
+
+static void reset_mmcr0(void)
+{
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_PMAE | MMCR0_PMAO));
+}
+
+static __attribute__((__noinline__)) unsigned long pmc5_count_nr_insns(unsigned long nr)
+{
+	reset_mmcr0();
+	mtspr(SPR_PMC5, 0);
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
+	asm volatile("mtctr %0 ; 1: bdnz 1b" :: "r"(nr) : "ctr");
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
+
+	return mfspr(SPR_PMC5);
+}
+
+static void test_pmc5_with_fault(void)
+{
+	unsigned long pmc5_1, pmc5_2;
+
+	handle_exception(0x700, &illegal_handler, NULL);
+	handle_exception(0xe40, &illegal_handler, NULL);
+
+	reset_mmcr0();
+	mtspr(SPR_PMC5, 0);
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
+	asm volatile(".long 0x0" ::: "memory");
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
+	assert(got_interrupt);
+	got_interrupt = false;
+	pmc5_1 = mfspr(SPR_PMC5);
+
+	reset_mmcr0();
+	mtspr(SPR_PMC5, 0);
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
+	asm volatile(".rep 20 ; nop ; .endr ; .long 0x0" ::: "memory");
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
+	assert(got_interrupt);
+	got_interrupt = false;
+	pmc5_2 = mfspr(SPR_PMC5);
+
+	report(pmc5_1 + 20 == pmc5_2, "PMC5 counts instructions with fault");
+
+	handle_exception(0x700, NULL, NULL);
+	handle_exception(0xe40, NULL, NULL);
+}
+
+static void test_pmc5_with_sc(void)
+{
+	unsigned long pmc5_1, pmc5_2;
+
+	handle_exception(0xc00, &sc_handler, NULL);
+
+	reset_mmcr0();
+	mtspr(SPR_PMC5, 0);
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
+	asm volatile("sc 0" ::: "memory");
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
+	assert(got_interrupt);
+	got_interrupt = false;
+	pmc5_1 = mfspr(SPR_PMC5);
+
+	reset_mmcr0();
+	mtspr(SPR_PMC5, 0);
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
+	asm volatile(".rep 20 ; nop ; .endr ; sc 0" ::: "memory");
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
+	assert(got_interrupt);
+	got_interrupt = false;
+	pmc5_2 = mfspr(SPR_PMC5);
+
+	report(pmc5_1 + 20 == pmc5_2, "PMC5 counts instructions with syscall");
+
+	handle_exception(0xc00, NULL, NULL);
+}
+
+static void test_pmc56(void)
+{
+	unsigned long tmp;
+
+	report_prefix_push("pmc56");
+
+	reset_mmcr0();
+	mtspr(SPR_PMC5, 0);
+	mtspr(SPR_PMC6, 0);
+	report(mfspr(SPR_PMC5) == 0, "PMC5 zeroed");
+	report(mfspr(SPR_PMC6) == 0, "PMC6 zeroed");
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~MMCR0_FC);
+	msleep(100);
+	report(mfspr(SPR_PMC5) == 0, "PMC5 frozen");
+	report(mfspr(SPR_PMC6) == 0, "PMC6 frozen");
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~MMCR0_FC56);
+	mdelay(100);
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
+	report(mfspr(SPR_PMC5) != 0, "PMC5 counting");
+	report(mfspr(SPR_PMC6) != 0, "PMC6 counting");
+
+	/* Dynamic frequency scaling could cause to be out, so don't fail. */
+	tmp = mfspr(SPR_PMC6);
+	report(true, "PMC6 ratio to reported clock frequency is %ld%%", tmp * 1000 / cpu_hz);
+
+	tmp = pmc5_count_nr_insns(100);
+	tmp = pmc5_count_nr_insns(1000) - tmp;
+	report(tmp == 900, "PMC5 counts instructions precisely");
+
+	test_pmc5_with_fault();
+	test_pmc5_with_sc();
+
+	report_prefix_pop();
+}
+
+static void dec_ignore_handler(struct pt_regs *regs, void *data)
+{
+	mtspr(SPR_DEC, 0x7fffffff);
+}
+
+static void pmi_handler(struct pt_regs *regs, void *data)
+{
+	got_interrupt = true;
+	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
+	recorded_mmcr0 = mfspr(SPR_MMCR0);
+	if (mfspr(SPR_MMCR0) & MMCR0_PMAO) {
+		/* This may cause infinite interrupts, so clear it. */
+		mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~MMCR0_PMAO);
+	}
+}
+
+static void test_pmi(void)
+{
+	report_prefix_push("pmi");
+	handle_exception(0x900, &dec_ignore_handler, NULL);
+	handle_exception(0xf00, &pmi_handler, NULL);
+	reset_mmcr0();
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | MMCR0_PMAO);
+	mtmsr(mfmsr() | MSR_EE);
+	mtmsr(mfmsr() & ~MSR_EE);
+	report(got_interrupt, "PMAO caused interrupt");
+	got_interrupt = false;
+	handle_exception(0xf00, NULL, NULL);
+	handle_exception(0x900, NULL, NULL);
+	report_prefix_pop();
+}
+
+static void clrbhrb(void)
+{
+	asm volatile("clrbhrb" ::: "memory");
+}
+
+static inline unsigned long mfbhrbe(int nr)
+{
+	unsigned long e;
+
+	asm volatile("mfbhrbe %0,%1" : "=r"(e) : "i"(nr) : "memory");
+
+	return e;
+}
+
+extern unsigned char dummy_branch_1[];
+extern unsigned char dummy_branch_2[];
+
+static __attribute__((__noinline__)) void bhrb_dummy(int i)
+{
+	asm volatile(
+	"	cmpdi %0,1	\n\t"
+	"	beq 1f		\n\t"
+	".global dummy_branch_1	\n\t"
+	"dummy_branch_1:	\n\t"
+	"	b 2f		\n\t"
+	"1:	trap		\n\t"
+	".global dummy_branch_2	\n\t"
+	"dummy_branch_2:	\n\t"
+	"2:	bne 3f		\n\t"
+	"	trap		\n\t"
+	"3:	nop		\n\t"
+	: : "r"(i));
+}
+
+#define NR_BHRBE 16
+static unsigned long bhrbe[NR_BHRBE];
+static int nr_bhrbe;
+
+static void run_and_load_bhrb(void)
+{
+	int i;
+
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~MMCR0_PMAE);
+	clrbhrb();
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | MMCR0_BHRBA);
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FCP | MMCR0_FCPC));
+	mtspr(SPR_MMCRA, mfspr(SPR_MMCRA) & ~(MMCRA_BHRBRD | MMCRA_IFM_MASK));
+
+	if (cpu_has_p10_bhrb) {
+		mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | MMCR0_PMAE);
+		asm volatile("isync" ::: "memory");
+		enter_usermode();
+		bhrb_dummy(0);
+		exit_usermode();
+		mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~MMCR0_PMAE);
+		asm volatile("isync" ::: "memory");
+	} else {
+		mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | MMCR0_PMAE);
+		asm volatile("isync" ::: "memory");
+		mtmsr(mfmsr());
+		asm volatile(".rept 100 ; nop ; .endr");
+		bhrb_dummy(0);
+		mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~MMCR0_PMAE);
+		asm volatile("isync" ::: "memory");
+	}
+
+	bhrbe[0] = mfbhrbe(0);
+	bhrbe[1] = mfbhrbe(1);
+	bhrbe[2] = mfbhrbe(2);
+	bhrbe[3] = mfbhrbe(3);
+	bhrbe[4] = mfbhrbe(4);
+	bhrbe[5] = mfbhrbe(5);
+	bhrbe[6] = mfbhrbe(6);
+	bhrbe[7] = mfbhrbe(7);
+	bhrbe[8] = mfbhrbe(8);
+	bhrbe[9] = mfbhrbe(9);
+	bhrbe[10] = mfbhrbe(10);
+	bhrbe[11] = mfbhrbe(11);
+	bhrbe[12] = mfbhrbe(12);
+	bhrbe[13] = mfbhrbe(13);
+	bhrbe[14] = mfbhrbe(14);
+	bhrbe[15] = mfbhrbe(15);
+
+	for (i = 0; i < NR_BHRBE; i++) {
+		bhrbe[i] &= ~0x1UL; /* remove prediction bit */
+		if (!bhrbe[i])
+			break;
+	}
+	nr_bhrbe = i;
+}
+
+static void test_bhrb(void)
+{
+	int i;
+
+	if (cpu_has_p10_bhrb && !vm_available())
+		return;
+
+	report_prefix_push("bhrb");
+
+	/* TCG doesn't impelment BHRB yet */
+	handle_exception(0x700, &illegal_handler, NULL);
+	handle_exception(0xe40, &illegal_handler, NULL);
+	clrbhrb();
+	handle_exception(0x700, NULL, NULL);
+	handle_exception(0xe40, NULL, NULL);
+	if (got_interrupt) {
+		got_interrupt = false;
+		report_skip("BHRB support missing");
+		report_prefix_pop();
+		return;
+	}
+
+	handle_exception(0x900, &illegal_handler, NULL);
+
+	if (vm_available()) {
+		handle_exception(0x900, &dec_ignore_handler, NULL);
+		setup_vm();
+	}
+	reset_mmcr0();
+	clrbhrb();
+	if (cpu_has_p10_bhrb) {
+		enter_usermode();
+		bhrb_dummy(0);
+		exit_usermode();
+	} else {
+		bhrb_dummy(0);
+	}
+	report(mfbhrbe(0) == 0, "BHRB is frozen");
+
+	/*
+	 * BHRB may be cleared at any time (e.g., by OS or hypervisor)
+	 * so this test could be occasionally incorrect. Try several
+	 * times before giving up...
+	 */
+
+	if (cpu_has_p10_bhrb) {
+		/*
+		 * BHRB should have 8 entries:
+		 * 1. enter_usermode blr
+		 * 2. enter_usermode blr target
+		 * 3. bl dummy
+		 * 4. dummy unconditional
+		 * 5. dummy conditional
+		 * 6. dummy blr
+		 * 7. dummy blr target
+		 * 8. exit_usermode bl
+		 *
+		 * POWER10 often gives 4 entries, if other threads are
+		 * running on the core, it seems to struggle.
+		 */
+		for (i = 0; i < 200; i++) {
+			run_and_load_bhrb();
+			if (nr_bhrbe == 8)
+				break;
+			if (i > 100 && nr_bhrbe == 4)
+				break;
+		}
+		if (nr_bhrbe != 8)
+			printf("nr_bhrbe=%d\n", nr_bhrbe);
+		report(nr_bhrbe, "BHRB has been written");
+		if (nr_bhrbe == 8) {
+			report(nr_bhrbe == 8, "BHRB has written 8 entries");
+			report(bhrbe[4] == (unsigned long)dummy_branch_1,
+					"correct unconditional branch address");
+			report(bhrbe[3] == (unsigned long)dummy_branch_2,
+					"correct conditional branch address");
+		} else if (nr_bhrbe == 4) {
+			/* POWER10 workaround */
+			report(nr_bhrbe == 4, "BHRB has written 4 entries");
+			report(bhrbe[3] == (unsigned long)dummy_branch_2,
+					"correct conditional branch address");
+		}
+	} else {
+		/*
+		 * BHRB should have 6 entries:
+		 * 1. bl dummy
+		 * 2. dummy unconditional
+		 * 3. dummy conditional
+		 * 4. dummy blr
+		 * 5. dummy blr target
+		 * 6. Final b loop before disabled.
+		 *
+		 * POWER9 often gives 4 entries, if other threads are
+		 * running on the core, it seems to struggle.
+		 */
+		for (i = 0; i < 200; i++) {
+			run_and_load_bhrb();
+			if (nr_bhrbe == 6)
+				break;
+			if (i > 100 && nr_bhrbe == 4)
+				break;
+		}
+		report(nr_bhrbe, "BHRB has been written");
+		report(nr_bhrbe == 6, "BHRB has written 6 entries");
+		if (nr_bhrbe == 6) {
+			report(bhrbe[4] == (unsigned long)dummy_branch_1,
+					"correct unconditional branch address");
+			report(bhrbe[3] == (unsigned long)dummy_branch_2,
+					"correct conditional branch address");
+		} else if (nr_bhrbe == 4) {
+			/* POWER9 workaround */
+			report(nr_bhrbe == 4, "BHRB has written 4 entries");
+			report(bhrbe[3] == (unsigned long)dummy_branch_2,
+					"correct conditional branch address");
+		}
+	}
+
+	handle_exception(0x900, NULL, NULL);
+
+	report_prefix_pop();
+}
+
+int main(int argc, char **argv)
+{
+	report_prefix_push("pmu");
+
+	test_pmc56();
+	test_pmi();
+	if (cpu_has_bhrb)
+		test_bhrb();
+
+	report_prefix_pop();
+
+	return report_summary();
+}
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 351da46a6..379aa166b 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -74,6 +74,9 @@ file = emulator.elf
 [interrupts]
 file = interrupts.elf
 
+[pmu]
+file = pmu.elf
+
 [smp]
 file = smp.elf
 smp = 2
-- 
2.43.0

