Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE4244A6A1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 07:08:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpHbD4qmGz3c5l
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 17:08:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QvtKaz5h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QvtKaz5h; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpHZT0z4nz2xCM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 17:07:26 +1100 (AEDT)
Received: by mail-pg1-x52c.google.com with SMTP id s136so17511480pgs.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Nov 2021 22:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FI7+EvSpo2ZaeonVkCYnVavvXcLMhjfs2drZHtdcBwY=;
 b=QvtKaz5hbCVZpIeGtF2jFUoTIDdfo6ea+mrvWl3NNUp1vbtF5iIPJc0kpQaqb8UmGr
 cxCct8XgqATTyRE/Fo5jz665bCcXXopYJFHzZh+50oQjeI7ueXFtwjGMoomEEtCn9rpc
 QHS09n2ScGEvAfpQcSrx26KdKdOzM553NdF+aF5IFmSdwd4sD59xJNkrZPi8cHVY1lSR
 o8FCm1A9uD7e75wcAf6fs76IjBPU/H2o9TnEEnTFvXx8hZSdvONJ4q8J6UiXvLrTNsrh
 jFbdj1aDe+s7/VBlYuyim8V8Lcgxk4GixBSL9KwSCLzCaGkEW0gD0lCTmdp+jH/NgTjw
 qApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FI7+EvSpo2ZaeonVkCYnVavvXcLMhjfs2drZHtdcBwY=;
 b=ShB+cOOh24O9mynkpQrZoc7ZhIQfhV5Sgji2k2bLbiWQolEWE6djMU/KFkC2dh9Lcx
 toFWxud/uvCaYTu1PN5jNImzl8KcKjGx+kwQvETHtqJiJGzTeRNriUASZ5ZRktXqJp47
 CBvJqHhLMyvfNZxMt1P3yX9yaK+ekGxHc2xgdbr1mscbOhM39r8e03jVO7ga8W7slOke
 QwPHE6RCyMpLCV9lNSXb8+H88J8WLPr02lLbta8AnzMdum3bwq3fefM6UeSV4aDrQgjs
 4wSmxUD9+uNK3NoOuKgD32det4Dgc05+DXxCa3rj0z8f2f9v9FG48vjGvy6wtjrQ6T0N
 uwqw==
X-Gm-Message-State: AOAM533RwVUmDd4OzcpenbBUQA0H3qP8mLpeipucb1bZhT5EF1Bd1MEP
 oF7m+kvGCPx2h2JHFYdXzDsE4y8IgTk=
X-Google-Smtp-Source: ABdhPJzKlWoksyZqMKPrWdmyAHXx4GLroigo5pfmjqwZv+6l6W9j7iqnGVwTdtARcFcexeP4SNEftA==
X-Received: by 2002:a63:920b:: with SMTP id o11mr3984336pgd.314.1636438042033; 
 Mon, 08 Nov 2021 22:07:22 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id
 j7sm1239383pjf.41.2021.11.08.22.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 22:07:21 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1] powerpc/64s: Get LPID bit width from device tree
Date: Tue,  9 Nov 2021 16:07:16 +1000
Message-Id: <20211109060716.1977825-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Allow the LPID bit width and partition table size to be set at runtime
from the device tree.

Move the PID bit width detection into the same place.

KVM does not support using the extra bits yet, this is mainly required
to get the PTCR register values correct.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h  |  9 ++---
 arch/powerpc/include/asm/kvm_book3s_asm.h |  6 +++-
 arch/powerpc/include/asm/reg.h            |  2 --
 arch/powerpc/mm/book3s64/pgtable.c        |  5 ---
 arch/powerpc/mm/book3s64/radix_pgtable.c  | 13 +------
 arch/powerpc/mm/init_64.c                 | 44 +++++++++++++++++++++++
 6 files changed, 55 insertions(+), 24 deletions(-)

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
diff --git a/arch/powerpc/include/asm/kvm_book3s_asm.h b/arch/powerpc/include/asm/kvm_book3s_asm.h
index b6d31bff5209..4d93e09a1ab9 100644
--- a/arch/powerpc/include/asm/kvm_book3s_asm.h
+++ b/arch/powerpc/include/asm/kvm_book3s_asm.h
@@ -15,7 +15,11 @@
 #define XICS_IPI		2	/* interrupt source # for IPIs */
 
 /* LPIDs we support with this build -- runtime limit may be lower */
-#define KVMPPC_NR_LPIDS			(LPID_RSVD + 1)
+#define KVMPPC_NR_LPIDS		(1ul << 12)
+
+/* Reserved LPID for partn switching */
+#define   LPID_RSVD_POWER7	((1ul << 10) - 1)
+#define   LPID_RSVD		(KVMPPC_NR_LPIDS - 1)
 
 /* Maximum number of threads per physical core */
 #define MAX_SMT_THREADS		8
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index e9d27265253b..30983f2fd6a4 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -474,8 +474,6 @@
 #ifndef SPRN_LPID
 #define SPRN_LPID	0x13F	/* Logical Partition Identifier */
 #endif
-#define   LPID_RSVD_POWER7	0x3ff	/* Reserved LPID for partn switching */
-#define   LPID_RSVD		0xfff	/* Reserved LPID for partn switching */
 #define	SPRN_HMER	0x150	/* Hypervisor maintenance exception reg */
 #define   HMER_DEBUG_TRIG	(1ul << (63 - 17)) /* Debug trigger */
 #define	SPRN_HMEER	0x151	/* Hyp maintenance exception enable reg */
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
index ae20add7954a..1c855434f8dc 100644
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
index 386be136026e..7d5a6cb7c76d 100644
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
@@ -437,12 +440,53 @@ static void __init early_check_vec5(void)
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
+	int rc;
+
 	/* Disable radix mode based on kernel command line. */
 	if (disable_radix)
 		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
 
+	rc = of_scan_flat_dt(dt_scan_mmu_pid_width, NULL);
+	if (!rc) {
+		/* No LPID or PID register size details found in device tree. */
+		if (early_cpu_has_feature(CPU_FTR_ARCH_300))
+			mmu_pid_bits = 20; /* POWER9-10 */
+
+		if (early_cpu_has_feature(CPU_FTR_ARCH_207S))
+			mmu_lpid_bits = 12; /* POWER8-10 */
+		else
+			mmu_lpid_bits = 10; /* POWER7 */
+	}
+
 	/*
 	 * Check /chosen/ibm,architecture-vec-5 if running as a guest.
 	 * When running bare-metal, we can use radix if we like
-- 
2.23.0

