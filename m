Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D57E3904AE3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 07:29:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LtIRPoz9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzYyW5yzRz3cjr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 15:29:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LtIRPoz9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzYql0DMXz3fmS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 15:24:02 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-6570bd6c3d7so3865393a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 22:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718169840; x=1718774640; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUZ7haKJPLcNY+7dMPiQw+LV6uqcYGY2ey80/7sMZ+I=;
        b=LtIRPoz9/2kuaMvXmHU+uHQUTf3VdbdLG+QPJDVnLmdz7bETKqsY83eMoIlFAqsQT0
         KLsUM2f0i92MOljZ4OjcIBoBpCmB0R93JrLMqFIzcTROaLqiuH5KLS1eud1YLBq4d/n9
         MWP7gh7TW6QbiIjpTvSrd6NLJXJ1uoNDx6rUZydSb8t36CQPuj8fyEJwcZt1r99spRf1
         dGf+iT2YBwA1J5MqpO1u2f5V0kh3Q2L30CpBbRQiRaP0h73sZQmuP8TJ14GObSruKKOf
         PPMl6vPjaF6edu5pgyER8aEouW9E8UHRGgDqZuU2p48d6HXLYeRLQ95GgacPgVjVgO0o
         xn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718169840; x=1718774640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lUZ7haKJPLcNY+7dMPiQw+LV6uqcYGY2ey80/7sMZ+I=;
        b=b0tsFwgVZVvrNob+9G6nWUzkSPUZosECUK35AaA4CeS5MnXDRSLgjCwXS9ROv09V7z
         i4MJMN9gdZotK9yZxfupAwbu3lceJbD37mjb7ROysjuvEsdou0QRaJt7eQ7rH5QSIByB
         6L7XFNZzZwfCyisxK3m1swwdSiNruSKy2AM00VymrowGjcz2ZpPRJsKm43dWUtJyJA8C
         +Q0ATftoasQF9xoiQY04i4HUpgGUZU+fu5p0f2Sh2OfAPdILWQu8A96FEm50kq88QcRa
         Ojno+L53MoX4UD2jdjuOeyZiNDHf9JqwbOanReIveis0uxT0zTYKyXw6t62+FgQesL59
         nY/w==
X-Forwarded-Encrypted: i=1; AJvYcCXcV+vjkGNU0U14RJPxAIF5y+WvQi6HFU9SUDKzcPvAv0ENQL74QJlWF13tcviVpRYrpt17B8ZUcfMhRvSzQaqnsfSKXr+Sl+t8UaEvvg==
X-Gm-Message-State: AOJu0YzejHijsQ/UzidX7sQECzlInqUXTgrFU59I9kCEertJo8Plb65V
	t30A0j+FbGWT4B0tOslhb4EAV95CXOm4ATyJhR1YvniZ54VI0zJO
X-Google-Smtp-Source: AGHT+IHvAfJikW4Ez/0OAetIgGBwLgBggFBQVnLUaJ30/eTVGEc5FkBqrZlhRtPVzYC15fp7UGQcdQ==
X-Received: by 2002:a17:903:2307:b0:1f7:3e75:20c3 with SMTP id d9443c01a7336-1f83b6fcd7cmr10415445ad.42.1718169840184;
        Tue, 11 Jun 2024 22:24:00 -0700 (PDT)
Received: from wheely.local0.net (220-235-199-47.tpgi.com.au. [220.235.199.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd75f711sm112170705ad.11.2024.06.11.22.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:23:59 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v10 08/15] powerpc: add pmu tests
Date: Wed, 12 Jun 2024 15:23:13 +1000
Message-ID: <20240612052322.218726-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240612052322.218726-1-npiggin@gmail.com>
References: <20240612052322.218726-1-npiggin@gmail.com>
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

Add some initial PMU testing.

- PMC5/6 tests
- PMAE / PMI test
- BHRB basic tests

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/asm/processor.h |   2 +
 lib/powerpc/asm/reg.h       |   9 +
 lib/powerpc/asm/setup.h     |   1 +
 lib/powerpc/setup.c         |  20 ++
 powerpc/Makefile.common     |   3 +-
 powerpc/pmu.c               | 562 ++++++++++++++++++++++++++++++++++++
 powerpc/unittests.cfg       |   3 +
 7 files changed, 599 insertions(+), 1 deletion(-)
 create mode 100644 powerpc/pmu.c

diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index 9609c9c67..09535f8c3 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -17,6 +17,8 @@ extern bool cpu_has_hv;
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
index c1f0f9adf..ef4ebdbce 100644
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
@@ -95,6 +97,19 @@ static void cpu_set(int fdtnode, u64 regval, void *info)
 		data = (u32 *)prop->data;
 		params->tb_hz = fdt32_to_cpu(*data);
 
+		prop = fdt_get_property(dt_fdt(), fdtnode,
+					"ibm,extended-clock-frequency", NULL);
+		if (prop) {
+			u64 *data64 = (u64 *)prop->data;
+			params->cpu_hz = fdt64_to_cpu(*data64);
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
@@ -103,6 +118,8 @@ bool cpu_has_hv;
 bool cpu_has_power_mce; /* POWER CPU machine checks */
 bool cpu_has_siar;
 bool cpu_has_heai;
+bool cpu_has_bhrb;
+bool cpu_has_p10_bhrb;
 bool cpu_has_radix;
 bool cpu_has_prefix;
 bool cpu_has_sc_lev; /* sc interrupt has LEV field in SRR1 */
@@ -119,12 +136,14 @@ static void cpu_init_params(void)
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
@@ -133,6 +152,7 @@ static void cpu_init_params(void)
 		cpu_has_power_mce = true;
 		cpu_has_heai = true;
 		cpu_has_siar = true;
+		cpu_has_bhrb = true;
 		break;
 	default:
 		break;
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index 900b1f00b..0d271cdb6 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -18,7 +18,8 @@ tests-common = \
 	$(TEST_DIR)/sprs.elf \
 	$(TEST_DIR)/timebase.elf \
 	$(TEST_DIR)/interrupts.elf \
-	$(TEST_DIR)/mmu.elf
+	$(TEST_DIR)/mmu.elf \
+	$(TEST_DIR)/pmu.elf
 
 tests-all = $(tests-common) $(tests)
 all: directories $(TEST_DIR)/boot_rom.bin $(tests-all)
diff --git a/powerpc/pmu.c b/powerpc/pmu.c
new file mode 100644
index 000000000..bdc45e167
--- /dev/null
+++ b/powerpc/pmu.c
@@ -0,0 +1,562 @@
+// SPDX-License-Identifier: GPL-2.0-only
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
+#include <asm/smp.h>
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
+static void fault_handler(struct pt_regs *regs, void *data)
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
+static void test_pmc5(void)
+{
+	unsigned long pmc5;
+	unsigned long mmcr;
+
+	reset_mmcr0();
+	mmcr = mfspr(SPR_MMCR0);
+	mtspr(SPR_PMC5, 0);
+	mtspr(SPR_MMCR0, mmcr & ~(MMCR0_FC | MMCR0_FC56));
+	asm volatile(".rep 20 ; nop ; .endr" ::: "memory");
+	mtspr(SPR_MMCR0, mmcr);
+	pmc5 = mfspr(SPR_PMC5);
+
+	report_kfail(true, pmc5 == 21, "PMC5 counts instructions exactly %ld", pmc5);
+}
+
+static void test_pmc5_with_branch(void)
+{
+	unsigned long pmc5;
+	unsigned long mmcr;
+
+	reset_mmcr0();
+	mmcr = mfspr(SPR_MMCR0);
+	mtspr(SPR_PMC5, 0);
+	mtspr(SPR_MMCR0, mmcr & ~(MMCR0_FC | MMCR0_FC56));
+	asm volatile(".rep 20 ; b $+4 ; .endr" ::: "memory");
+	mtspr(SPR_MMCR0, mmcr);
+	pmc5 = mfspr(SPR_PMC5);
+
+	/* TCG and POWER9 do not count instructions around faults correctly */
+	report_kfail(true, pmc5 == 21, "PMC5 counts instructions with branch %ld", pmc5);
+}
+
+static void test_pmc5_with_cond_branch(void)
+{
+	unsigned long pmc5;
+	unsigned long mmcr;
+
+	reset_mmcr0();
+	mmcr = mfspr(SPR_MMCR0);
+	mtspr(SPR_PMC5, 0);
+	mtspr(SPR_MMCR0, mmcr & ~(MMCR0_FC | MMCR0_FC56));
+	asm volatile(".rep 10 ; nop ; .endr ; cmpdi %0,1 ; beq 1f ; .rep 10 ; nop ; .endr ; 1:" :  : "r"(0) : "memory", "cr0");
+	mtspr(SPR_MMCR0, mmcr);
+	pmc5 = mfspr(SPR_PMC5);
+
+	/* TCG and POWER9 do not count instructions around faults correctly */
+	report_kfail(true, pmc5 == 24,
+		     "PMC5 counts instructions wth conditional branch %ld", pmc5);
+}
+
+static void test_pmc5_with_ill(void)
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
+	asm volatile(".rep 10 ; nop ; .endr ; .long 0x0 ; .rep 10 ; nop ; .endr " ::: "memory");
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
+	assert(got_interrupt);
+	got_interrupt = false;
+	pmc5_2 = mfspr(SPR_PMC5);
+
+	/* TCG and POWER9 do not count instructions around faults correctly */
+	report_kfail(true, pmc5_1 + 20 == pmc5_2,
+		     "PMC5 counts instructions with illegal instruction");
+
+	handle_exception(0x700, NULL, NULL);
+	handle_exception(0xe40, NULL, NULL);
+}
+
+static void test_pmc5_with_fault(void)
+{
+	unsigned long pmc5_1, pmc5_2;
+	unsigned long tmp;
+
+	setup_vm();
+
+	handle_exception(0x300, &fault_handler, NULL);
+	handle_exception(0x380, &fault_handler, NULL);
+
+	reset_mmcr0();
+	mtspr(SPR_PMC5, 0);
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
+	asm volatile("ld %0,0(%1)" : "=r"(tmp) : "r"(NULL) : "memory");
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
+	assert(got_interrupt);
+	got_interrupt = false;
+	pmc5_1 = mfspr(SPR_PMC5);
+
+	reset_mmcr0();
+	mtspr(SPR_PMC5, 0);
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
+	asm volatile(".rep 10 ; nop ; .endr ; ld %0,0(%1) ; .rep 10 ; nop ; .endr " : "=r"(tmp) : "r"(NULL) : "memory");
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
+	assert(got_interrupt);
+	got_interrupt = false;
+	pmc5_2 = mfspr(SPR_PMC5);
+
+	/* TCG and POWER9 do not count instructions around faults correctly */
+	report_kfail(true, pmc5_1 + 20 == pmc5_2, "PMC5 counts instructions with fault");
+
+	handle_exception(0x300, NULL, NULL);
+	handle_exception(0x380, NULL, NULL);
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
+	asm volatile(".rep 10 ; nop ; .endr ; sc 0 ; .rep 10 ; nop ; .endr" ::: "memory");
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
+	assert(got_interrupt);
+	got_interrupt = false;
+	pmc5_2 = mfspr(SPR_PMC5);
+
+	/* TCG does not count instructions around syscalls correctly */
+	report_kfail(host_is_tcg, pmc5_1 + 20 == pmc5_2,
+		     "PMC5 counts instructions with syscall");
+
+	handle_exception(0xc00, NULL, NULL);
+}
+
+extern char next_insn[];
+
+static void test_pmc5_with_rfid(void)
+{
+	unsigned long pmc5;
+	unsigned long mmcr;
+
+	mtspr(SPR_SRR0, (unsigned long)next_insn);
+	mtspr(SPR_SRR1, mfmsr());
+	reset_mmcr0();
+	mmcr = mfspr(SPR_MMCR0);
+	mtspr(SPR_PMC5, 0);
+	mtspr(SPR_MMCR0, mmcr & ~(MMCR0_FC | MMCR0_FC56));
+	asm volatile("rfid ; trap ; .global next_insn ; next_insn: " ::: "memory");
+	mtspr(SPR_MMCR0, mmcr);
+	pmc5 = mfspr(SPR_PMC5);
+
+	/* TCG does not count instructions around syscalls correctly */
+	report_kfail(host_is_tcg, pmc5 == 2,
+		     "PMC5 counts instructions with rfid %ld", pmc5);
+}
+
+static void test_pmc5_with_ldat(void)
+{
+	unsigned long pmc5_1, pmc5_2;
+	register unsigned long r4 asm("r4");
+	register unsigned long r5 asm("r5");
+	register unsigned long r6 asm("r6");
+	uint64_t val;
+
+	reset_mmcr0();
+	mtspr(SPR_PMC5, 0);
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
+	asm volatile(".rep 20 ; nop ; .endr" ::: "memory");
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
+	pmc5_1 = mfspr(SPR_PMC5);
+
+	val = 0xdeadbeef;
+	r4 = 0;
+	r5 = 0xdeadbeef;
+	r6 = 100;
+	reset_mmcr0();
+	mtspr(SPR_PMC5, 0);
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
+	asm volatile(".rep 10 ; nop ; .endr ; ldat %0,%3,0x10 ; .rep 10 ; nop ; .endr" : "=r"(r4), "+r"(r5), "+r"(r6) : "r"(&val) : "memory");
+	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
+	pmc5_2 = mfspr(SPR_PMC5);
+	assert(r4 == 0xdeadbeef);
+	assert(val == 0xdeadbeef);
+
+	/* TCG does not count instructions around syscalls correctly */
+	report_kfail(host_is_tcg, pmc5_1 != pmc5_2 + 1,
+		     "PMC5 counts instructions with ldat");
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
+	report(true, "PMC6 ratio to reported clock frequency is %ld%%",
+	       tmp * 1000 / cpu_hz);
+
+	tmp = pmc5_count_nr_insns(100);
+	tmp = pmc5_count_nr_insns(1000) - tmp;
+	report(tmp == 900, "PMC5 counts instructions precisely %ld", tmp);
+
+	test_pmc5();
+	test_pmc5_with_branch();
+	test_pmc5_with_cond_branch();
+	test_pmc5_with_ill();
+	test_pmc5_with_fault();
+	test_pmc5_with_sc();
+	test_pmc5_with_rfid();
+	test_pmc5_with_ldat();
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
+		report(nr_bhrbe, "BHRB has been written");
+		report_kfail(!host_is_tcg, nr_bhrbe == 8,
+			     "BHRB has written 8 entries");
+		if (nr_bhrbe == 8) {
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
+		report_kfail(!host_is_tcg, nr_bhrbe == 6,
+			     "BHRB has written 6 entries");
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
index 149f963f3..79a123e9f 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -73,6 +73,9 @@ file = interrupts.elf
 file = mmu.elf
 smp = 2
 
+[pmu]
+file = pmu.elf
+
 [smp]
 file = smp.elf
 smp = 2
-- 
2.45.1

