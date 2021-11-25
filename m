Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 938F345DA9E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 14:00:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0J053BFNz3fGc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 00:00:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SU3492cR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42c;
 helo=mail-pf1-x42c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SU3492cR; dkim-atps=neutral
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Hn047Dxz3cQj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 23:51:16 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id i12so5839942pfd.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 04:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EZzsOzOPIFaogJ9LmBooqztKD5TdKRd+etwN1K6k0MA=;
 b=SU3492cR3XnZyiILlPPnWIZ5MOVuFb9AguoYuiWQX74y/ENz1fkbMFDkxTOlQZMR0V
 Gy111uofq3eAxmbLP34xeyh23Vjf6lngRM9Llg0AjR5KeOaX8BuAAD55dt8PVI/8nMaZ
 ll4WAFwldwHGPcVTVEMusbYNch8DZruDWJjvtwG7rLzXDky3ZzJ7IeVYGtpSsCw/2dlQ
 xKucXpviDFjPpP++rb+Q0nz5/iLI4Mzwsmpp3CP5A5cYQ5QJ4fo9sEW9sPr6kdurU2oh
 plFm5694ihXKpZ/4caUWeFHfYpUhHOtUj7uCob5Nqopn/TfUNwI7jxoN7uh4kl5O/0N1
 ChBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EZzsOzOPIFaogJ9LmBooqztKD5TdKRd+etwN1K6k0MA=;
 b=7cLbqgKs4p+2bCVm1Jw3xcHB3/+StdhqokBETiY8dEyILePaNlGsovJBt9nb40utKV
 0SKxtDXvipEt81gnUG81BRZnMo5/un++9efF3UqNMkGerS/+NTL45QDLG6sopp0udI0r
 7PKz7fdGWWpLu4t9MsjxDqlKa8/GVWzKobTK56DWOoEGqVkl8rK2eMJSPL3tUFdmvwh8
 K5Fz/yuhi+cZzTv5dkJaE/iOx2s5jWLD+8ozxtkFMZvgoK7Wxgkfqn2fMyprfp6FzDSd
 xzzQEATYp5PARxFeVa/pWDT+GVWVomSTjZj1MZzd31HpAGbFE6sOja3yXoq1yFew6jRi
 jsjg==
X-Gm-Message-State: AOAM530Q7UhOIEEYWMzZiCHgEt1hPpMdLgCro+1+FS+1nXHIzCXoKRbJ
 ma6miCC1CJbj0tbWFoTtz+wUZVMvKTA=
X-Google-Smtp-Source: ABdhPJybwFgU+xQbv6642dLy/2MsUUBrl3YpFGiKZw6h7+WuJQmCk6z76ukjQqP08GmoajrVNvAUeQ==
X-Received: by 2002:a63:ff1f:: with SMTP id k31mr1931990pgi.564.1637844674199; 
 Thu, 25 Nov 2021 04:51:14 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id gc22sm7242851pjb.57.2021.11.25.04.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:51:13 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 15/17] powerpc/64s: Make hash MMU support configurable
Date: Thu, 25 Nov 2021 22:50:23 +1000
Message-Id: <20211125125025.1472060-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211125125025.1472060-1-npiggin@gmail.com>
References: <20211125125025.1472060-1-npiggin@gmail.com>
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
 arch/powerpc/include/asm/mmu.h           | 16 +++++++++++++---
 arch/powerpc/kernel/dt_cpu_ftrs.c        | 14 ++++++++++----
 arch/powerpc/kvm/Kconfig                 |  1 +
 arch/powerpc/mm/init_64.c                | 13 +++++++++++--
 arch/powerpc/platforms/Kconfig.cputype   | 23 +++++++++++++++++++++--
 arch/powerpc/platforms/microwatt/Kconfig |  2 +-
 arch/powerpc/platforms/powernv/Kconfig   |  2 +-
 8 files changed, 60 insertions(+), 14 deletions(-)

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
index a208997ade88..7806a9661aa4 100644
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
@@ -364,6 +371,17 @@ config SPE
 
 	  If in doubt, say Y here.
 
+config PPC_64S_HASH_MMU
+	bool "Hash MMU Support"
+	depends on PPC_BOOK3S_64
+	select PPC_MM_SLICES
+	default y
+	help
+	  Enable support for the Power ISA Hash style MMU. This is implemented
+	  by all IBM Power and other Book3S CPUs.
+
+	  If you're unsure, say Y.
+
 config PPC_RADIX_MMU
 	bool "Radix MMU Support"
 	depends on PPC_BOOK3S_64
@@ -375,7 +393,8 @@ config PPC_RADIX_MMU
 	  you can probably disable this.
 
 config PPC_RADIX_MMU_DEFAULT
-	bool "Default to using the Radix MMU when possible"
+	bool "Default to using the Radix MMU when possible" if PPC_64S_HASH_MMU
+	depends on PPC_BOOK3S_64
 	depends on PPC_RADIX_MMU
 	default y
 	help
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
-- 
2.23.0

