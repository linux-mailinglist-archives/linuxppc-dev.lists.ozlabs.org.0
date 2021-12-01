Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FE446503D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:43:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J420D4RJJz3cnK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:43:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Eq0e9VxX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e;
 helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Eq0e9VxX; dkim-atps=neutral
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41yD4z93z2yyK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:12 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id q17so17853076plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tF4tpA8vXvgZOdNmOBO+qTUJMqVIyzTDq75T6lbmLT4=;
 b=Eq0e9VxXrVLRCNeP8EDvvqHR16Fq6TlNSf9je843bvpMBmiSu/NVoMkVI++FHgeasJ
 b6Wj49IHa3bRT2CJ4VMXOmdQoydXF/l91+FqAtL7tirUhE4VzmITiBAHQ/0n+I/AWTt1
 c4DJgArvBBQItZP2fjqRsLL3/kO2qtiJ+YQ0t2exXjz1TGg3GiDvQvgOjnRUAS79yOTC
 fbpFVSNXSexNIhWOp2/74Ruyojcusz1NvWhCX2yY0/i6fXjb2iSvF8Ygi2DYkLAXLw/y
 9Qfv1WcR03KDrSGMaWvwtZ/ZfKoIRQnZ7kizXf3vIXR2nubwIq8HiUXIJqbjZhoxH2Vh
 NGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tF4tpA8vXvgZOdNmOBO+qTUJMqVIyzTDq75T6lbmLT4=;
 b=0F4lFja6RKzcfjdf6xe1u0ik03pr1i+ozltF2eqsaDKNgffi/x4QESlFrHW8AG652R
 aFeqzVKiXw/A/seQrCqudaKkkJ/4guyBBkDAM/k+/uaiV+XFJnqXNlQg+5ATyIJer08B
 gvkS2a/4zXQyOzkE2aSqNFBusNwOw9H3UOtoZq/uajzxkvUfBQxbk74dvOx6Y1w/Crrr
 ycVDBMfLZHIupscqe56fZVk/p9GyDCLVdaD8vSwZywvi55jBDjnlWLkQJpNKxDiKvUgV
 eV3STgTXILtVBdmrNit6/Q5KnNCCWoDp1NnnbXFuYEcXOULYzPV72Ic1TRxNjipUzy7X
 PY7Q==
X-Gm-Message-State: AOAM531QhSGNfuZpS4bbcp3BUasXH5ma5KlV05845LEk9N1svtQfVJI7
 TUtaAT64LOjmXclTZ+3zmBQzQYFgjw4=
X-Google-Smtp-Source: ABdhPJy/L1dy5QaqTn6x4DY3ZgVUyX2BPPV9dUtPsmU9waU1hDs5nnGqEpZM26pOXxfVBYTEe0UVnA==
X-Received: by 2002:a17:90a:28c4:: with SMTP id
 f62mr7954441pjd.207.1638369730439; 
 Wed, 01 Dec 2021 06:42:10 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:10 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 02/18] powerpc: Rename PPC_NATIVE to PPC_HASH_MMU_NATIVE
Date: Thu,  2 Dec 2021 00:41:37 +1000
Message-Id: <20211201144153.2456614-3-npiggin@gmail.com>
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

PPC_NATIVE now only controls the native HPT code, so rename it to be
more descriptive. Restrict it to Book3S only.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/Makefile          | 2 +-
 arch/powerpc/mm/book3s64/hash_utils.c      | 2 +-
 arch/powerpc/platforms/52xx/Kconfig        | 2 +-
 arch/powerpc/platforms/Kconfig             | 4 ++--
 arch/powerpc/platforms/cell/Kconfig        | 2 +-
 arch/powerpc/platforms/chrp/Kconfig        | 2 +-
 arch/powerpc/platforms/embedded6xx/Kconfig | 2 +-
 arch/powerpc/platforms/maple/Kconfig       | 2 +-
 arch/powerpc/platforms/microwatt/Kconfig   | 2 +-
 arch/powerpc/platforms/pasemi/Kconfig      | 2 +-
 arch/powerpc/platforms/powermac/Kconfig    | 2 +-
 arch/powerpc/platforms/powernv/Kconfig     | 2 +-
 arch/powerpc/platforms/pseries/Kconfig     | 2 +-
 13 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/Makefile b/arch/powerpc/mm/book3s64/Makefile
index 1b56d3af47d4..319f4b7f3357 100644
--- a/arch/powerpc/mm/book3s64/Makefile
+++ b/arch/powerpc/mm/book3s64/Makefile
@@ -6,7 +6,7 @@ CFLAGS_REMOVE_slb.o = $(CC_FLAGS_FTRACE)
 
 obj-y				+= hash_pgtable.o hash_utils.o slb.o \
 				   mmu_context.o pgtable.o hash_tlb.o
-obj-$(CONFIG_PPC_NATIVE)	+= hash_native.o
+obj-$(CONFIG_PPC_HASH_MMU_NATIVE)	+= hash_native.o
 obj-$(CONFIG_PPC_RADIX_MMU)	+= radix_pgtable.o radix_tlb.o
 obj-$(CONFIG_PPC_4K_PAGES)	+= hash_4k.o
 obj-$(CONFIG_PPC_64K_PAGES)	+= hash_64k.o
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index cfd45245d009..92680da5229a 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1091,7 +1091,7 @@ void __init hash__early_init_mmu(void)
 		ps3_early_mm_init();
 	else if (firmware_has_feature(FW_FEATURE_LPAR))
 		hpte_init_pseries();
-	else if (IS_ENABLED(CONFIG_PPC_NATIVE))
+	else if (IS_ENABLED(CONFIG_PPC_HASH_MMU_NATIVE))
 		hpte_init_native();
 
 	if (!mmu_hash_ops.hpte_insert)
diff --git a/arch/powerpc/platforms/52xx/Kconfig b/arch/powerpc/platforms/52xx/Kconfig
index 99d60acc20c8..b72ed2950ca8 100644
--- a/arch/powerpc/platforms/52xx/Kconfig
+++ b/arch/powerpc/platforms/52xx/Kconfig
@@ -34,7 +34,7 @@ config PPC_EFIKA
 	bool "bPlan Efika 5k2. MPC5200B based computer"
 	depends on PPC_MPC52xx
 	select PPC_RTAS
-	select PPC_NATIVE
+	select PPC_HASH_MMU_NATIVE
 
 config PPC_LITE5200
 	bool "Freescale Lite5200 Eval Board"
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index e02d29a9d12f..d41dad227de8 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -40,9 +40,9 @@ config EPAPR_PARAVIRT
 
 	  In case of doubt, say Y
 
-config PPC_NATIVE
+config PPC_HASH_MMU_NATIVE
 	bool
-	depends on PPC_BOOK3S_32 || PPC64
+	depends on PPC_BOOK3S
 	help
 	  Support for running natively on the hardware, i.e. without
 	  a hypervisor. This option is not user-selectable but should
diff --git a/arch/powerpc/platforms/cell/Kconfig b/arch/powerpc/platforms/cell/Kconfig
index cb70c5f25bc6..db4465c51b56 100644
--- a/arch/powerpc/platforms/cell/Kconfig
+++ b/arch/powerpc/platforms/cell/Kconfig
@@ -8,7 +8,7 @@ config PPC_CELL_COMMON
 	select PPC_DCR_MMIO
 	select PPC_INDIRECT_PIO
 	select PPC_INDIRECT_MMIO
-	select PPC_NATIVE
+	select PPC_HASH_MMU_NATIVE
 	select PPC_RTAS
 	select IRQ_EDGE_EOI_HANDLER
 
diff --git a/arch/powerpc/platforms/chrp/Kconfig b/arch/powerpc/platforms/chrp/Kconfig
index 9b5c5505718a..ff30ed579a39 100644
--- a/arch/powerpc/platforms/chrp/Kconfig
+++ b/arch/powerpc/platforms/chrp/Kconfig
@@ -11,6 +11,6 @@ config PPC_CHRP
 	select RTAS_ERROR_LOGGING
 	select PPC_MPC106
 	select PPC_UDBG_16550
-	select PPC_NATIVE
+	select PPC_HASH_MMU_NATIVE
 	select FORCE_PCI
 	default y
diff --git a/arch/powerpc/platforms/embedded6xx/Kconfig b/arch/powerpc/platforms/embedded6xx/Kconfig
index 4c6d703a4284..c54786f8461e 100644
--- a/arch/powerpc/platforms/embedded6xx/Kconfig
+++ b/arch/powerpc/platforms/embedded6xx/Kconfig
@@ -55,7 +55,7 @@ config MVME5100
 	select FORCE_PCI
 	select PPC_INDIRECT_PCI
 	select PPC_I8259
-	select PPC_NATIVE
+	select PPC_HASH_MMU_NATIVE
 	select PPC_UDBG_16550
 	help
 	  This option enables support for the Motorola (now Emerson) MVME5100
diff --git a/arch/powerpc/platforms/maple/Kconfig b/arch/powerpc/platforms/maple/Kconfig
index 86ae210bee9a..7fd84311ade5 100644
--- a/arch/powerpc/platforms/maple/Kconfig
+++ b/arch/powerpc/platforms/maple/Kconfig
@@ -9,7 +9,7 @@ config PPC_MAPLE
 	select GENERIC_TBSYNC
 	select PPC_UDBG_16550
 	select PPC_970_NAP
-	select PPC_NATIVE
+	select PPC_HASH_MMU_NATIVE
 	select PPC_RTAS
 	select MMIO_NVRAM
 	select ATA_NONSTANDARD if ATA
diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
index 8f6a81978461..62b51e37fc05 100644
--- a/arch/powerpc/platforms/microwatt/Kconfig
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -5,7 +5,7 @@ config PPC_MICROWATT
 	select PPC_XICS
 	select PPC_ICS_NATIVE
 	select PPC_ICP_NATIVE
-	select PPC_NATIVE
+	select PPC_HASH_MMU_NATIVE
 	select PPC_UDBG_16550
 	select ARCH_RANDOM
 	help
diff --git a/arch/powerpc/platforms/pasemi/Kconfig b/arch/powerpc/platforms/pasemi/Kconfig
index c52731a7773f..bc7137353a7f 100644
--- a/arch/powerpc/platforms/pasemi/Kconfig
+++ b/arch/powerpc/platforms/pasemi/Kconfig
@@ -5,7 +5,7 @@ config PPC_PASEMI
 	select MPIC
 	select FORCE_PCI
 	select PPC_UDBG_16550
-	select PPC_NATIVE
+	select PPC_HASH_MMU_NATIVE
 	select MPIC_BROKEN_REGREAD
 	help
 	  This option enables support for PA Semi's PWRficient line
diff --git a/arch/powerpc/platforms/powermac/Kconfig b/arch/powerpc/platforms/powermac/Kconfig
index b97bf12801eb..2b56df145b82 100644
--- a/arch/powerpc/platforms/powermac/Kconfig
+++ b/arch/powerpc/platforms/powermac/Kconfig
@@ -6,7 +6,7 @@ config PPC_PMAC
 	select FORCE_PCI
 	select PPC_INDIRECT_PCI if PPC32
 	select PPC_MPC106 if PPC32
-	select PPC_NATIVE
+	select PPC_HASH_MMU_NATIVE
 	select ZONE_DMA if PPC32
 	default y
 
diff --git a/arch/powerpc/platforms/powernv/Kconfig b/arch/powerpc/platforms/powernv/Kconfig
index 043eefbbdd28..cd754e116184 100644
--- a/arch/powerpc/platforms/powernv/Kconfig
+++ b/arch/powerpc/platforms/powernv/Kconfig
@@ -2,7 +2,7 @@
 config PPC_POWERNV
 	depends on PPC64 && PPC_BOOK3S
 	bool "IBM PowerNV (Non-Virtualized) platform support"
-	select PPC_NATIVE
+	select PPC_HASH_MMU_NATIVE
 	select PPC_XICS
 	select PPC_ICP_NATIVE
 	select PPC_XIVE_NATIVE
diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index 9bd542164128..30618750bd98 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -17,7 +17,7 @@ config PPC_PSERIES
 	select PPC_RTAS_DAEMON
 	select RTAS_ERROR_LOGGING
 	select PPC_UDBG_16550
-	select PPC_NATIVE
+	select PPC_HASH_MMU_NATIVE
 	select PPC_DOORBELL
 	select HOTPLUG_CPU
 	select ARCH_RANDOM
-- 
2.23.0

