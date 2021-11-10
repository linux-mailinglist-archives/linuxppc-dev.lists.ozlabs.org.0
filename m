Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A627A44BC78
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 09:00:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hpy2n4F5hz2yfc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 19:00:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jLIBJDLt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jLIBJDLt; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hpy285tcZz2yPL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 19:00:14 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id b4so1557171pgh.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 00:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VZJzI1dTrepa0x2ntMXopmiKk/CSq9fEtHvWmknhbU4=;
 b=jLIBJDLt1d3avDzzNZHLrnoLXWp/oy92HEMOcDUyoldBetRtssvnyY2suwCweYODsr
 8s+GFpaW82j7y9KxbmU+Fvgq+ya2RUtHRFnJRtN0laQpAJyK153VnFa+T+GtcqTV9fMA
 fkx1MxsGQPlvfGzwUdCG0l3h9FgMfmmRxKqIYZQBo1lxbFzjSEIT+sdbln8cK2Qt9pw+
 41KOeSFAab1rLCvZko9wnOgOLKVBu+O5tPjkIjw26KKjjaDAT83QoEdRd9vxY1JhbV9X
 aK9o0zwv+XrH1oBD3oO3UI2Dft2bU3ivAyhW6Ri0q59R4F1hh8Z59QOWL93N6zlnbAZB
 TY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VZJzI1dTrepa0x2ntMXopmiKk/CSq9fEtHvWmknhbU4=;
 b=daG9pkUtojiAeWj53Sq6cWYytbuRxUSiwc/OEBbZmOME6hKqY/G8RZCEZ/2qpl6rpK
 7kWjtNg6M2okHl3awoJp/botfRMne5jYdW1GF7NT23yEfS90D8mHlro1V1dRSOrMchH0
 U0PmACsbPN1/wnWGRQwrsN108ixSBFvrU774ZZ7HnFAjyhG5jc79c62XhcpblU5pgFA0
 r8p5O62GRo+M7OKZs0XUFHFODOVV4CU7MrI/Bf8z+J56M+Q+y6CHqHM2V7WaHrQg35mf
 YggbG3kIdva4tdIKf3qlns+ioXfo2RUH1aooiwUqxs0j22DNkx4uhN7poCbWjtW0jtOs
 vF5A==
X-Gm-Message-State: AOAM533bJIsybrtB2yPpF7dDaL6mclCRCMbBrcIWh4NgKCOe9NaXqTMG
 yiOYtrSpxDVjiF6XCKJfZzm3wuKMGJA=
X-Google-Smtp-Source: ABdhPJzJjffSt72iiy/6Mc6e44W26vhDdlrDpmTDSNmu2lLTJHO0GroP8ZTImz+S+UV9FmUK1Hhdlg==
X-Received: by 2002:a63:af44:: with SMTP id s4mr10695668pgo.219.1636531211236; 
 Wed, 10 Nov 2021 00:00:11 -0800 (PST)
Received: from bobo.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id w12sm5200237pjq.2.2021.11.10.00.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Nov 2021 00:00:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/64s: Get LPID bit width from device tree
Date: Wed, 10 Nov 2021 18:00:04 +1000
Message-Id: <20211110080004.2148773-1-npiggin@gmail.com>
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

KVM does not support using different sizes yet, this is mainly required
to get the PTCR register values correct.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h |  9 +++--
 arch/powerpc/mm/book3s64/pgtable.c       |  5 ---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 13 +------
 arch/powerpc/mm/init_64.c                | 47 +++++++++++++++++++++++-
 4 files changed, 52 insertions(+), 22 deletions(-)

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
index 386be136026e..04f45fcb1222 100644
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
@@ -437,19 +440,61 @@ static void __init early_check_vec5(void)
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
+	bool hvmode = !!(mfmsr() & MSR_HV);
+
 	/* Disable radix mode based on kernel command line. */
 	if (disable_radix)
 		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
 
+	rc = of_scan_flat_dt(dt_scan_mmu_pid_width, NULL);
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

