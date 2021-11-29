Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 411EB460D2B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:20:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2VwT0lCwz3fTs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:20:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pkaH3qcC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=pkaH3qcC; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Vgm1mXfz3cbY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:09:24 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id x131so15278060pfc.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZiF3ljuRgZe1NLuIeK3CsbuLcre1/PvF+/YVxdlQXwI=;
 b=pkaH3qcCV/A8GWw0EbacFqMH/8QWQ9idsRfpA2qfRf9P5eVkzHvkHuJ2wM5prkuQ3y
 IZ/bEnbp8HKCuheVE4Hynk/oRRGxJpE8sFu1zrMG8bq6Phfk/7ZtWpxrZWCW1+ksbFQG
 ehfod0C2JlDdJevm97XUWSAt900k90wF7U+cwluQQPRGwOOinTdZkooiIMS+xVPc4d/S
 NQa0noiZ/gzmzy0xQeotEuevPWje/slsPHS86Sq4qN/Y1WFZlzp6Swhl64RK4LiByitE
 FmS5fmVnULFyFP8EkKyLOb0czPe+Z8zSq1nMivcEsGlMfEz/v60+ENvVu8XTlUfyGZPT
 T0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZiF3ljuRgZe1NLuIeK3CsbuLcre1/PvF+/YVxdlQXwI=;
 b=W8j7nqA331L0Okog0/6WKtfZpUkAVA6iY+5YfYFsmEcVoiW3tNGkASU6wncqR+bGsQ
 rKEWpNGICfIZ1eu8xTqEGpsPElT5R6iAC2i0xjFlLI7oZ/TX+D1xxAX3bVaoufmhwqYr
 3Ur41QpU2rAtLk0eCpDmjc1gzeYXgv3wVIDV20MshCDmoCEBjBHPJQC9vqY6T7LIrCtc
 U/ecGr4pcUf/gGBJgfWY3Qxw4VReCqLDSLN0M5Q3YRcw2w/43YXhGGEw8Q5IWhC9yYif
 6+XIlR6sg4Tgbuw1t2pQ+gVBsbSeHSNDyznk77Q8QT79rxGcjnoZN3Va+rE3C9jvewik
 B3hg==
X-Gm-Message-State: AOAM531bTE2RPC+DdqRlCbsGOf/EJ8XrDay+8BEUmmEYgwnzNYxos+e3
 +PpaIuXK4HHz5mjtKvzjYd+Zz8DEOt8=
X-Google-Smtp-Source: ABdhPJxPH3GCPaG6HLCfQG06yumzBTuLbm7+NKET43M8z4qBExQlTr+ovAEJvKt8XhLouw/9ejfukQ==
X-Received: by 2002:a63:c55:: with SMTP id 21mr19524592pgm.624.1638155361210; 
 Sun, 28 Nov 2021 19:09:21 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id b15sm14747181pfv.48.2021.11.28.19.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:09:20 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] powerpc/64s: Get LPID bit width from device tree
Date: Mon, 29 Nov 2021 13:09:15 +1000
Message-Id: <20211129030915.1888332-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Allow the LPID bit width and partition table size to be set at runtime
from the device tree.

Move the PID bit width detection into the same place.

KVM does not support using the extra bits yet, this is mainly required
to get the PTCR register values correct (so KVM will run but it will
not allocate > 4096 LPIDs).

OPAL firmware provides this property for POWER10 CPUs since skiboot
commit 9b85f7d961f2 ("hdata: add mmu-pid-bits and mmu-lpid-bits for
POWER10 CPUs").

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v2: fixed compile bug, added skiboot commit hash in changelog.

 arch/powerpc/include/asm/book3s/64/mmu.h |  9 ++---
 arch/powerpc/mm/book3s64/pgtable.c       |  5 ---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 13 +------
 arch/powerpc/mm/init_64.c                | 46 +++++++++++++++++++++++-
 4 files changed, 51 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index c02f42d1031e..8c500dd6fee4 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -62,6 +62,9 @@ extern struct patb_entry *partition_tb;
 #define PRTS_MASK	0x1f		/* process table size field */
 #define PRTB_MASK	0x0ffffffffffff000UL
 
+/* Number of supported LPID bits */
+extern unsigned int mmu_lpid_bits;
+
 /* Number of supported PID bits */
 extern unsigned int mmu_pid_bits;
 
@@ -76,10 +79,8 @@ extern unsigned long __ro_after_init radix_mem_block_size;
 #define PRTB_SIZE_SHIFT	(mmu_pid_bits + 4)
 #define PRTB_ENTRIES	(1ul << mmu_pid_bits)
 
-/*
- * Power9 currently only support 64K partition table size.
- */
-#define PATB_SIZE_SHIFT	16
+#define PATB_SIZE_SHIFT	(mmu_lpid_bits + 4)
+#define PATB_ENTRIES	(1ul << mmu_lpid_bits)
 
 typedef unsigned long mm_context_id_t;
 struct spinlock;
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 9e16c7b1a6c5..13d1fbddecb9 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -207,17 +207,12 @@ void __init mmu_partition_table_init(void)
 	unsigned long patb_size = 1UL << PATB_SIZE_SHIFT;
 	unsigned long ptcr;
 
-	BUILD_BUG_ON_MSG((PATB_SIZE_SHIFT > 36), "Partition table size too large.");
 	/* Initialize the Partition Table with no entries */
 	partition_tb = memblock_alloc(patb_size, patb_size);
 	if (!partition_tb)
 		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
 		      __func__, patb_size, patb_size);
 
-	/*
-	 * update partition table control register,
-	 * 64 K size.
-	 */
 	ptcr = __pa(partition_tb) | (PATB_SIZE_SHIFT - 12);
 	set_ptcr_when_no_uv(ptcr);
 	powernv_set_nmmu_ptcr(ptcr);
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 3a600bd7fbc6..6e365dab9b87 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -33,7 +33,6 @@
 
 #include <trace/events/thp.h>
 
-unsigned int mmu_pid_bits;
 unsigned int mmu_base_pid;
 unsigned long radix_mem_block_size __ro_after_init;
 
@@ -357,18 +356,13 @@ static void __init radix_init_pgtable(void)
 						-1, PAGE_KERNEL));
 	}
 
-	/* Find out how many PID bits are supported */
 	if (!cpu_has_feature(CPU_FTR_HVMODE) &&
 			cpu_has_feature(CPU_FTR_P9_RADIX_PREFETCH_BUG)) {
 		/*
 		 * Older versions of KVM on these machines perfer if the
 		 * guest only uses the low 19 PID bits.
 		 */
-		if (!mmu_pid_bits)
-			mmu_pid_bits = 19;
-	} else {
-		if (!mmu_pid_bits)
-			mmu_pid_bits = 20;
+		mmu_pid_bits = 19;
 	}
 	mmu_base_pid = 1;
 
@@ -449,11 +443,6 @@ static int __init radix_dt_scan_page_sizes(unsigned long node,
 	if (type == NULL || strcmp(type, "cpu") != 0)
 		return 0;
 
-	/* Find MMU PID size */
-	prop = of_get_flat_dt_prop(node, "ibm,mmu-pid-bits", &size);
-	if (prop && size == 4)
-		mmu_pid_bits = be32_to_cpup(prop);
-
 	/* Grab page size encodings */
 	prop = of_get_flat_dt_prop(node, "ibm,processor-radix-AP-encodings", &size);
 	if (!prop)
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 386be136026e..3e5f9ac9dded 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -370,6 +370,9 @@ void register_page_bootmem_memmap(unsigned long section_nr,
 #endif /* CONFIG_SPARSEMEM_VMEMMAP */
 
 #ifdef CONFIG_PPC_BOOK3S_64
+unsigned int mmu_lpid_bits;
+unsigned int mmu_pid_bits;
+
 static bool disable_radix = !IS_ENABLED(CONFIG_PPC_RADIX_MMU_DEFAULT);
 
 static int __init parse_disable_radix(char *p)
@@ -437,19 +440,60 @@ static void __init early_check_vec5(void)
 	}
 }
 
+static int __init dt_scan_mmu_pid_width(unsigned long node,
+					   const char *uname, int depth,
+					   void *data)
+{
+	int size = 0;
+	const __be32 *prop;
+	const char *type = of_get_flat_dt_prop(node, "device_type", NULL);
+
+	/* We are scanning "cpu" nodes only */
+	if (type == NULL || strcmp(type, "cpu") != 0)
+		return 0;
+
+	/* Find MMU LPID, PID register size */
+	prop = of_get_flat_dt_prop(node, "ibm,mmu-lpid-bits", &size);
+	if (prop && size == 4)
+		mmu_lpid_bits = be32_to_cpup(prop);
+
+	prop = of_get_flat_dt_prop(node, "ibm,mmu-pid-bits", &size);
+	if (prop && size == 4)
+		mmu_pid_bits = be32_to_cpup(prop);
+
+	if (!mmu_pid_bits && !mmu_lpid_bits)
+		return 0;
+
+	return 1;
+}
+
 void __init mmu_early_init_devtree(void)
 {
+	bool hvmode = !!(mfmsr() & MSR_HV);
+
 	/* Disable radix mode based on kernel command line. */
 	if (disable_radix)
 		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
 
+	of_scan_flat_dt(dt_scan_mmu_pid_width, NULL);
+	if (hvmode && !mmu_lpid_bits) {
+		if (early_cpu_has_feature(CPU_FTR_ARCH_207S))
+			mmu_lpid_bits = 12; /* POWER8-10 */
+		else
+			mmu_lpid_bits = 10; /* POWER7 */
+	}
+	if (!mmu_pid_bits) {
+		if (early_cpu_has_feature(CPU_FTR_ARCH_300))
+			mmu_pid_bits = 20; /* POWER9-10 */
+	}
+
 	/*
 	 * Check /chosen/ibm,architecture-vec-5 if running as a guest.
 	 * When running bare-metal, we can use radix if we like
 	 * even though the ibm,architecture-vec-5 property created by
 	 * skiboot doesn't have the necessary bits set.
 	 */
-	if (!(mfmsr() & MSR_HV))
+	if (!hvmode)
 		early_check_vec5();
 
 	if (early_radix_enabled()) {
-- 
2.23.0

