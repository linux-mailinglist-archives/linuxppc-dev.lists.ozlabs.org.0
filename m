Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A4B46508D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:53:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J42By06gjz3dvr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:53:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TrrPPGT6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=TrrPPGT6; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41yq5r0lz30Bm
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:43 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id s137so23862287pgs.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1CtIpWtzSNVSIPCDHR1letiJQj3t+zeoX74kFBLQP7Y=;
 b=TrrPPGT6rxM6hYKt8W0M7YdzbHnQiiMeTaiO8bvJ1XtqQAv2WmX7cpyH6kGn95dSZz
 xqvgrCBBUW8EnBIEakMwj6yYXI+3E+HmIaIIJUIZd36C5GNAtSA5waxErB5IFKyv5luW
 ujvRX/92PkRGZx00gS/WOawlOV9zhNqAfGshZka0qcsQskMD7+U6moKVj0MA8sZN3jUU
 xPdMTVsxHQTzhBrns61Yo/mVMWEjh+gu6jLjP+hUuW6++3R55JY3NK8gJAZ/fUi4usGy
 80RxYXnRtk2Ip3zAHlCDAFlOIS4dhDl30wLqptWd9XxguqMEokohuSqh1etfBDAQTH91
 epGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1CtIpWtzSNVSIPCDHR1letiJQj3t+zeoX74kFBLQP7Y=;
 b=klM7tYEyqL7miGKDTGwUKM3onl6yBhoHoSRGIJUpj5C2VP1F/IoQZ7wAzCwDNJvGyW
 eX8pHYiWDcp71tB/ZeI4w77rPhjibXLk89ZwF2zuiWIXjesAogSTlt/oBhnPkGH/Daq0
 kIuKx5TocATThpL5iWBREPmOtbFY9MaZP/6IG0869ePfyCf+upe9BNnoMvVCQvcnUZOL
 +YfMlRclAk37EXbR+ST+FfSYw4FHKWbJrS3Lg3+RqNxlsr1RILkLhpVvQs5455fiSHiz
 PaTawVwR2RXLRJ88jxpgJzIUMjQDN0uwwYYwUFgEQMr41f9PBK727wExuxy/M81mNnUU
 H/kQ==
X-Gm-Message-State: AOAM533Ejba8NH8ODt8yxvKuFYy3sU2IycX+sOcNJXD4hRkWXzChDQUk
 niZwXRH28/JFrDoRwX0vETRTLpptfQo=
X-Google-Smtp-Source: ABdhPJwPsFH94c5W3HjRlcQJMflUWEnJ7ujEWwkpnWtiDlDDh5htG/fjJiT5CV6mH7d0ixKMmr9EXg==
X-Received: by 2002:a65:4cc1:: with SMTP id n1mr4982585pgt.420.1638369762018; 
 Wed, 01 Dec 2021 06:42:42 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 16/18] powerpc/64s: Make hash MMU support configurable
Date: Thu,  2 Dec 2021 00:41:51 +1000
Message-Id: <20211201144153.2456614-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211201144153.2456614-1-npiggin@gmail.com>
References: <20211201144153.2456614-1-npiggin@gmail.com>
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

This adds Kconfig selection which allows 64s hash MMU support to be
disabled. It can be disabled if radix support is enabled, the minimum
supported CPU type is POWER9 (or higher), and KVM is not selected.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                     |  3 ++-
 arch/powerpc/include/asm/mmu.h           | 16 +++++++++++---
 arch/powerpc/kernel/dt_cpu_ftrs.c        | 14 ++++++++----
 arch/powerpc/kvm/Kconfig                 |  1 +
 arch/powerpc/mm/init_64.c                | 13 +++++++++--
 arch/powerpc/platforms/Kconfig.cputype   | 28 ++++++++++++++++++++++--
 arch/powerpc/platforms/cell/Kconfig      |  1 +
 arch/powerpc/platforms/maple/Kconfig     |  1 +
 arch/powerpc/platforms/microwatt/Kconfig |  2 +-
 arch/powerpc/platforms/pasemi/Kconfig    |  1 +
 arch/powerpc/platforms/powermac/Kconfig  |  1 +
 arch/powerpc/platforms/powernv/Kconfig   |  2 +-
 drivers/misc/cxl/Kconfig                 |  1 +
 drivers/misc/lkdtm/Makefile              |  2 +-
 14 files changed, 71 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 27afb64d027c..1fa336ec8faf 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -845,7 +845,7 @@ config FORCE_MAX_ZONEORDER
 config PPC_SUBPAGE_PROT
 	bool "Support setting protections for 4k subpages (subpage_prot syscall)"
 	default n
-	depends on PPC_BOOK3S_64 && PPC_64K_PAGES
+	depends on PPC_64S_HASH_MMU && PPC_64K_PAGES
 	help
 	  This option adds support for system call to allow user programs
 	  to set access permissions (read/write, readonly, or no access)
@@ -943,6 +943,7 @@ config PPC_MEM_KEYS
 	prompt "PowerPC Memory Protection Keys"
 	def_bool y
 	depends on PPC_BOOK3S_64
+	depends on PPC_64S_HASH_MMU
 	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_PKEYS
 	help
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 8abe8e42e045..5f41565a1e5d 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -157,7 +157,7 @@ DECLARE_PER_CPU(int, next_tlbcam_idx);
 
 enum {
 	MMU_FTRS_POSSIBLE =
-#if defined(CONFIG_PPC_BOOK3S_64) || defined(CONFIG_PPC_BOOK3S_604)
+#if defined(CONFIG_PPC_BOOK3S_604)
 		MMU_FTR_HPTE_TABLE |
 #endif
 #ifdef CONFIG_PPC_8xx
@@ -184,15 +184,18 @@ enum {
 		MMU_FTR_USE_TLBRSRV | MMU_FTR_USE_PAIRED_MAS |
 #endif
 #ifdef CONFIG_PPC_BOOK3S_64
+		MMU_FTR_KERNEL_RO |
+#ifdef CONFIG_PPC_64S_HASH_MMU
 		MMU_FTR_NO_SLBIE_B | MMU_FTR_16M_PAGE | MMU_FTR_TLBIEL |
 		MMU_FTR_LOCKLESS_TLBIE | MMU_FTR_CI_LARGE_PAGE |
 		MMU_FTR_1T_SEGMENT | MMU_FTR_TLBIE_CROP_VA |
-		MMU_FTR_KERNEL_RO | MMU_FTR_68_BIT_VA |
+		MMU_FTR_68_BIT_VA | MMU_FTR_HPTE_TABLE |
 #endif
 #ifdef CONFIG_PPC_RADIX_MMU
 		MMU_FTR_TYPE_RADIX |
 		MMU_FTR_GTSE |
 #endif /* CONFIG_PPC_RADIX_MMU */
+#endif
 #ifdef CONFIG_PPC_KUAP
 	MMU_FTR_BOOK3S_KUAP |
 #endif /* CONFIG_PPC_KUAP */
@@ -224,6 +227,13 @@ enum {
 #define MMU_FTRS_ALWAYS		MMU_FTR_TYPE_FSL_E
 #endif
 
+/* BOOK3S_64 options */
+#if defined(CONFIG_PPC_RADIX_MMU) && !defined(CONFIG_PPC_64S_HASH_MMU)
+#define MMU_FTRS_ALWAYS		MMU_FTR_TYPE_RADIX
+#elif !defined(CONFIG_PPC_RADIX_MMU) && defined(CONFIG_PPC_64S_HASH_MMU)
+#define MMU_FTRS_ALWAYS		MMU_FTR_HPTE_TABLE
+#endif
+
 #ifndef MMU_FTRS_ALWAYS
 #define MMU_FTRS_ALWAYS		0
 #endif
@@ -329,7 +339,7 @@ static __always_inline bool radix_enabled(void)
 	return mmu_has_feature(MMU_FTR_TYPE_RADIX);
 }
 
-static inline bool early_radix_enabled(void)
+static __always_inline bool early_radix_enabled(void)
 {
 	return early_mmu_has_feature(MMU_FTR_TYPE_RADIX);
 }
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index d2b35fb9181d..1ac8d7357195 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -273,6 +273,9 @@ static int __init feat_enable_mmu_hash(struct dt_cpu_feature *f)
 {
 	u64 lpcr;
 
+	if (!IS_ENABLED(CONFIG_PPC_64S_HASH_MMU))
+		return 0;
+
 	lpcr = mfspr(SPRN_LPCR);
 	lpcr &= ~LPCR_ISL;
 
@@ -292,6 +295,9 @@ static int __init feat_enable_mmu_hash_v3(struct dt_cpu_feature *f)
 {
 	u64 lpcr;
 
+	if (!IS_ENABLED(CONFIG_PPC_64S_HASH_MMU))
+		return 0;
+
 	lpcr = mfspr(SPRN_LPCR);
 	lpcr &= ~(LPCR_ISL | LPCR_UPRT | LPCR_HR);
 	mtspr(SPRN_LPCR, lpcr);
@@ -305,15 +311,15 @@ static int __init feat_enable_mmu_hash_v3(struct dt_cpu_feature *f)
 
 static int __init feat_enable_mmu_radix(struct dt_cpu_feature *f)
 {
-#ifdef CONFIG_PPC_RADIX_MMU
+	if (!IS_ENABLED(CONFIG_PPC_RADIX_MMU))
+		return 0;
+
+	cur_cpu_spec->mmu_features |= MMU_FTR_KERNEL_RO;
 	cur_cpu_spec->mmu_features |= MMU_FTR_TYPE_RADIX;
-	cur_cpu_spec->mmu_features |= MMU_FTRS_HASH_BASE;
 	cur_cpu_spec->mmu_features |= MMU_FTR_GTSE;
 	cur_cpu_spec->cpu_user_features |= PPC_FEATURE_HAS_MMU;
 
 	return 1;
-#endif
-	return 0;
 }
 
 static int __init feat_enable_dscr(struct dt_cpu_feature *f)
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index 6a58532300c5..f947b77386a9 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -69,6 +69,7 @@ config KVM_BOOK3S_64
 	select KVM_BOOK3S_64_HANDLER
 	select KVM
 	select KVM_BOOK3S_PR_POSSIBLE if !KVM_BOOK3S_HV_POSSIBLE
+	select PPC_64S_HASH_MMU
 	select SPAPR_TCE_IOMMU if IOMMU_SUPPORT && (PPC_PSERIES || PPC_POWERNV)
 	help
 	  Support running unmodified book3s_64 and book3s_32 guest kernels
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index 386be136026e..e6876e702d8f 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -440,8 +440,12 @@ static void __init early_check_vec5(void)
 void __init mmu_early_init_devtree(void)
 {
 	/* Disable radix mode based on kernel command line. */
-	if (disable_radix)
-		cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
+	if (disable_radix) {
+		if (IS_ENABLED(CONFIG_PPC_64S_HASH_MMU))
+			cur_cpu_spec->mmu_features &= ~MMU_FTR_TYPE_RADIX;
+		else
+			pr_warn("WARNING: Ignoring cmdline option disable_radix\n");
+	}
 
 	/*
 	 * Check /chosen/ibm,architecture-vec-5 if running as a guest.
@@ -454,6 +458,7 @@ void __init mmu_early_init_devtree(void)
 
 	if (early_radix_enabled()) {
 		radix__early_init_devtree();
+
 		/*
 		 * We have finalized the translation we are going to use by now.
 		 * Radix mode is not limited by RMA / VRMA addressing.
@@ -463,5 +468,9 @@ void __init mmu_early_init_devtree(void)
 		memblock_set_current_limit(MEMBLOCK_ALLOC_ANYWHERE);
 	} else
 		hash__early_init_devtree();
+
+	if (!(cur_cpu_spec->mmu_features & MMU_FTR_HPTE_TABLE) &&
+	    !(cur_cpu_spec->mmu_features & MMU_FTR_TYPE_RADIX))
+		panic("kernel does not support any MMU type offered by platform");
 }
 #endif /* CONFIG_PPC_BOOK3S_64 */
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index a208997ade88..7ca07df1c374 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -105,9 +105,9 @@ config PPC_BOOK3S_64
 	select HAVE_MOVE_PMD
 	select HAVE_MOVE_PUD
 	select IRQ_WORK
-	select PPC_MM_SLICES
 	select PPC_HAVE_KUEP
 	select PPC_HAVE_KUAP
+	select PPC_64S_HASH_MMU if !PPC_RADIX_MMU
 
 config PPC_BOOK3E_64
 	bool "Embedded processors"
@@ -130,11 +130,13 @@ choice
 config GENERIC_CPU
 	bool "Generic (POWER4 and above)"
 	depends on PPC64 && !CPU_LITTLE_ENDIAN
+	select PPC_64S_HASH_MMU if PPC_BOOK3S_64
 
 config GENERIC_CPU
 	bool "Generic (POWER8 and above)"
 	depends on PPC64 && CPU_LITTLE_ENDIAN
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_64S_HASH_MMU
 
 config GENERIC_CPU
 	bool "Generic 32 bits powerpc"
@@ -143,24 +145,29 @@ config GENERIC_CPU
 config CELL_CPU
 	bool "Cell Broadband Engine"
 	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
+	select PPC_64S_HASH_MMU
 
 config POWER5_CPU
 	bool "POWER5"
 	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
+	select PPC_64S_HASH_MMU
 
 config POWER6_CPU
 	bool "POWER6"
 	depends on PPC_BOOK3S_64 && !CPU_LITTLE_ENDIAN
+	select PPC_64S_HASH_MMU
 
 config POWER7_CPU
 	bool "POWER7"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_64S_HASH_MMU
 
 config POWER8_CPU
 	bool "POWER8"
 	depends on PPC_BOOK3S_64
 	select ARCH_HAS_FAST_MULTIPLIER
+	select PPC_64S_HASH_MMU
 
 config POWER9_CPU
 	bool "POWER9"
@@ -364,6 +371,22 @@ config SPE
 
 	  If in doubt, say Y here.
 
+config PPC_64S_HASH_MMU
+	bool "Hash MMU Support"
+	depends on PPC_BOOK3S_64
+	select PPC_MM_SLICES
+	default y
+	help
+	  Enable support for the Power ISA Hash style MMU. This is implemented
+	  by all IBM Power and other 64-bit Book3S CPUs before ISA v3.0. The
+	  OpenPOWER ISA does not mandate the hash MMU and some CPUs do not
+	  implement it (e.g., Microwatt).
+
+	  Note that POWER9 PowerVM platforms only support the hash
+	  MMU. From POWER10 radix is also supported by PowerVM.
+
+	  If you're unsure, say Y.
+
 config PPC_RADIX_MMU
 	bool "Radix MMU Support"
 	depends on PPC_BOOK3S_64
@@ -375,7 +398,8 @@ config PPC_RADIX_MMU
 	  you can probably disable this.
 
 config PPC_RADIX_MMU_DEFAULT
-	bool "Default to using the Radix MMU when possible"
+	bool "Default to using the Radix MMU when possible" if PPC_64S_HASH_MMU
+	depends on PPC_BOOK3S_64
 	depends on PPC_RADIX_MMU
 	default y
 	help
diff --git a/arch/powerpc/platforms/cell/Kconfig b/arch/powerpc/platforms/cell/Kconfig
index db4465c51b56..34669b060f36 100644
--- a/arch/powerpc/platforms/cell/Kconfig
+++ b/arch/powerpc/platforms/cell/Kconfig
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 config PPC_CELL
+	select PPC_64S_HASH_MMU if PPC64
 	bool
 
 config PPC_CELL_COMMON
diff --git a/arch/powerpc/platforms/maple/Kconfig b/arch/powerpc/platforms/maple/Kconfig
index 7fd84311ade5..4c058cc57c90 100644
--- a/arch/powerpc/platforms/maple/Kconfig
+++ b/arch/powerpc/platforms/maple/Kconfig
@@ -9,6 +9,7 @@ config PPC_MAPLE
 	select GENERIC_TBSYNC
 	select PPC_UDBG_16550
 	select PPC_970_NAP
+	select PPC_64S_HASH_MMU
 	select PPC_HASH_MMU_NATIVE
 	select PPC_RTAS
 	select MMIO_NVRAM
diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
index 62b51e37fc05..823192e9d38a 100644
--- a/arch/powerpc/platforms/microwatt/Kconfig
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -5,7 +5,7 @@ config PPC_MICROWATT
 	select PPC_XICS
 	select PPC_ICS_NATIVE
 	select PPC_ICP_NATIVE
-	select PPC_HASH_MMU_NATIVE
+	select PPC_HASH_MMU_NATIVE if PPC_64S_HASH_MMU
 	select PPC_UDBG_16550
 	select ARCH_RANDOM
 	help
diff --git a/arch/powerpc/platforms/pasemi/Kconfig b/arch/powerpc/platforms/pasemi/Kconfig
index bc7137353a7f..85ae18ddd911 100644
--- a/arch/powerpc/platforms/pasemi/Kconfig
+++ b/arch/powerpc/platforms/pasemi/Kconfig
@@ -5,6 +5,7 @@ config PPC_PASEMI
 	select MPIC
 	select FORCE_PCI
 	select PPC_UDBG_16550
+	select PPC_64S_HASH_MMU
 	select PPC_HASH_MMU_NATIVE
 	select MPIC_BROKEN_REGREAD
 	help
diff --git a/arch/powerpc/platforms/powermac/Kconfig b/arch/powerpc/platforms/powermac/Kconfig
index 2b56df145b82..130707ec9f99 100644
--- a/arch/powerpc/platforms/powermac/Kconfig
+++ b/arch/powerpc/platforms/powermac/Kconfig
@@ -6,6 +6,7 @@ config PPC_PMAC
 	select FORCE_PCI
 	select PPC_INDIRECT_PCI if PPC32
 	select PPC_MPC106 if PPC32
+	select PPC_64S_HASH_MMU if PPC64
 	select PPC_HASH_MMU_NATIVE
 	select ZONE_DMA if PPC32
 	default y
diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
index cd754e116184..161dfe024085 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -2,7 +2,7 @@
 config PPC_POWERNV
 	depends on PPC64 && PPC_BOOK3S
 	bool "IBM PowerNV (Non-Virtualized) platform support"
-	select PPC_HASH_MMU_NATIVE
+	select PPC_HASH_MMU_NATIVE if PPC_64S_HASH_MMU
 	select PPC_XICS
 	select PPC_ICP_NATIVE
 	select PPC_XIVE_NATIVE
diff --git a/drivers/misc/cxl/Kconfig b/drivers/misc/cxl/Kconfig
index 51aecafdcbdf..5efc4151bf58 100644
--- a/drivers/misc/cxl/Kconfig
+++ b/drivers/misc/cxl/Kconfig
@@ -6,6 +6,7 @@
 config CXL_BASE
 	bool
 	select PPC_COPRO_BASE
+	select PPC_64S_HASH_MMU
 
 config CXL
 	tristate "Support for IBM Coherent Accelerators (CXL)"
diff --git a/drivers/misc/lkdtm/Makefile b/drivers/misc/lkdtm/Makefile
index aa12097668d3..83a7baf5df82 100644
--- a/drivers/misc/lkdtm/Makefile
+++ b/drivers/misc/lkdtm/Makefile
@@ -11,7 +11,7 @@ lkdtm-$(CONFIG_LKDTM)		+= usercopy.o
 lkdtm-$(CONFIG_LKDTM)		+= stackleak.o
 lkdtm-$(CONFIG_LKDTM)		+= cfi.o
 lkdtm-$(CONFIG_LKDTM)		+= fortify.o
-lkdtm-$(CONFIG_PPC_BOOK3S_64)	+= powerpc.o
+lkdtm-$(CONFIG_PPC_64S_HASH_MMU)	+= powerpc.o
 
 KASAN_SANITIZE_rodata.o		:= n
 KASAN_SANITIZE_stackleak.o	:= n
-- 
2.23.0

