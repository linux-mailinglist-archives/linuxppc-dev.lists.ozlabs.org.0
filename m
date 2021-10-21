Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B95EF436DA1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 00:40:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb2W91NbJz3cTV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:40:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IT03oPWd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IT03oPWd; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb2J82cYQz3cD0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 09:31:04 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 q2-20020a17090a2e0200b001a0fd4efd49so6551385pjd.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 15:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fHRyDHB6kpC25F7D1fqytPrNxJZLBX2TER5oaOsoWIQ=;
 b=IT03oPWdQMhg+2gjwmNWqsWBkHd424FTf5g0pMbxJIRaa1oDBYlFPsPIlFXwRYTr8z
 io8UO6rXSY1kywPllfUUHfFumXYFqXlh2TBWNxi8AO2EZcBK66VrcyshgUOI3mi2u73v
 cLuyhXm3/EuzE9PJ2if4qD1H0n5LFXt8sRa48h5qUII8GW0oTyBDHeHCmm7Sv3g/G4pN
 o8+9357DaHsbkl/oYz+7kAjz2aWgyYtgEP+q++RPm/aPmMVuCvcKG6C0xD1fwIo8CEhf
 Zx0kJSjaaMwIHtudxWQe5ieCAPc02a7jJzYGHo8vAzq54hpGUXEkpXeo2z18UGtEbtyp
 e2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fHRyDHB6kpC25F7D1fqytPrNxJZLBX2TER5oaOsoWIQ=;
 b=8MBSTLrDwpyfvhQrCSQjmdIO21/RU3g9PzilUriCZe27rH0rc3LSOzscqhmzwtz9ZR
 MBDPuLsR2B6eYYDs2THg9wuig/Xew3R2iBnhmTTy5ClP53Tdpxfu/3Clq+HGt/rlaiRw
 e3JySQvvvKjR3LMa2vc/OExDLitiTxZUvWRuuQqcdcUhc27tb5eNOn3Btn6uMEM3Jq81
 ULQR3KYDm4ftSweYy8rK5aW91+/QbEIJ5xMXzJuhOj3wMf/9Z3p96vaDHqOqdNLsv50L
 WHObhuJgmSogKm74ExniQsv6AbmHCpMOYKTuy/L1ukBjpL9xkSZeIVo6gUMYA5nOu9q2
 uEnQ==
X-Gm-Message-State: AOAM5319veWuVsnMFjnyBSALlgvgATftpQEjKkmBdEioTWlcl/FjuMj+
 MH1PVHMIgdXaZj7yPvqyAX9vBY1dyhA=
X-Google-Smtp-Source: ABdhPJzvOcgKMiYDaEHZZO077WqL8vchQwAmUaZzjpjw0mEjXE/H9KEY7vsAaJt999AyUxYNHcepyw==
X-Received: by 2002:a17:90a:c901:: with SMTP id
 v1mr9944063pjt.162.1634855461774; 
 Thu, 21 Oct 2021 15:31:01 -0700 (PDT)
Received: from bobo.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id e6sm7205716pfm.212.2021.10.21.15.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 15:31:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 15/18] powerpc/64s: Make hash MMU support configurable
Date: Fri, 22 Oct 2021 08:30:10 +1000
Message-Id: <20211021223013.2641952-16-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021223013.2641952-1-npiggin@gmail.com>
References: <20211021223013.2641952-1-npiggin@gmail.com>
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
 arch/powerpc/include/asm/mmu.h           | 16 ++++++++++---
 arch/powerpc/kernel/dt_cpu_ftrs.c        | 14 ++++++++----
 arch/powerpc/kvm/Kconfig                 |  1 +
 arch/powerpc/mm/init_64.c                | 15 +++++++++---
 arch/powerpc/platforms/Kconfig.cputype   | 29 ++++++++++++++++++++++--
 arch/powerpc/platforms/cell/Kconfig      |  1 +
 arch/powerpc/platforms/maple/Kconfig     |  1 +
 arch/powerpc/platforms/microwatt/Kconfig |  2 +-
 arch/powerpc/platforms/pasemi/Kconfig    |  1 +
 arch/powerpc/platforms/powermac/Kconfig  |  1 +
 arch/powerpc/platforms/powernv/Kconfig   |  2 +-
 12 files changed, 71 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 653f1fa9f8cb..94cdd1cb94a2 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -838,7 +838,7 @@ config FORCE_MAX_ZONEORDER
 config PPC_SUBPAGE_PROT
 	bool "Support setting protections for 4k subpages (subpage_prot syscall)"
 	default n
-	depends on PPC_BOOK3S_64 && PPC_64K_PAGES
+	depends on PPC_64S_HASH_MMU && PPC_64K_PAGES
 	help
 	  This option adds support for system call to allow user programs
 	  to set access permissions (read/write, readonly, or no access)
@@ -936,6 +936,7 @@ config PPC_MEM_KEYS
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
index 358aee7c2d79..f1b86d687095 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -271,6 +271,9 @@ static int __init feat_enable_mmu_hash(struct dt_cpu_feature *f)
 {
 	u64 lpcr;
 
+	if (!IS_ENABLED(CONFIG_PPC_64S_HASH_MMU))
+		return 0;
+
 	lpcr = mfspr(SPRN_LPCR);
 	lpcr &= ~LPCR_ISL;
 
@@ -290,6 +293,9 @@ static int __init feat_enable_mmu_hash_v3(struct dt_cpu_feature *f)
 {
 	u64 lpcr;
 
+	if (!IS_ENABLED(CONFIG_PPC_64S_HASH_MMU))
+		return 0;
+
 	lpcr = mfspr(SPRN_LPCR);
 	lpcr &= ~(LPCR_ISL | LPCR_UPRT | LPCR_HR);
 	mtspr(SPRN_LPCR, lpcr);
@@ -303,15 +309,15 @@ static int __init feat_enable_mmu_hash_v3(struct dt_cpu_feature *f)
 
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
index ff581d70f20c..4801424614be 100644
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
index 23fbb2b0277c..21e5592b0d6f 100644
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
@@ -453,8 +457,9 @@ void __init mmu_early_init_devtree(void)
 		early_check_vec5();
 
 	if (early_radix_enabled()) {
-		cur_cpu_spec->mmu_features &= ~MMU_FTR_HPTE_TABLE;
 		radix__early_init_devtree();
+		cur_cpu_spec->mmu_features &= ~MMU_FTR_HPTE_TABLE;
+
 		/*
 		 * We have finalized the translation we are going to use by now.
 		 * Radix mode is not limited by RMA / VRMA addressing.
@@ -464,5 +469,9 @@ void __init mmu_early_init_devtree(void)
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
index a208997ade88..1cf254a5d5d4 100644
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
@@ -374,9 +392,10 @@ config PPC_RADIX_MMU
 	  is only implemented by IBM Power9 CPUs, if you don't have one of them
 	  you can probably disable this.
 
-config PPC_RADIX_MMU_DEFAULT
+config PPC_RADIX_MMU_DEFAULT_OPTION
 	bool "Default to using the Radix MMU when possible"
 	depends on PPC_RADIX_MMU
+	depends on PPC_64S_HASH_MMU
 	default y
 	help
 	  When the hardware supports the Radix MMU, default to using it unless
@@ -387,6 +406,12 @@ config PPC_RADIX_MMU_DEFAULT
 
 	  If you're unsure, say Y.
 
+config PPC_RADIX_MMU_DEFAULT
+	bool
+	depends on PPC_BOOK3S_64
+	depends on PPC_RADIX_MMU_DEFAULT_OPTION || !PPC_64S_HASH_MMU
+	default y
+
 config PPC_HAVE_KUEP
 	bool
 
diff --git a/arch/powerpc/platforms/cell/Kconfig b/arch/powerpc/platforms/cell/Kconfig
index db4465c51b56..faa894714a2a 100644
--- a/arch/powerpc/platforms/cell/Kconfig
+++ b/arch/powerpc/platforms/cell/Kconfig
@@ -8,6 +8,7 @@ config PPC_CELL_COMMON
 	select PPC_DCR_MMIO
 	select PPC_INDIRECT_PIO
 	select PPC_INDIRECT_MMIO
+	select PPC_64S_HASH_MMU
 	select PPC_HASH_MMU_NATIVE
 	select PPC_RTAS
 	select IRQ_EDGE_EOI_HANDLER
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
-- 
2.23.0

