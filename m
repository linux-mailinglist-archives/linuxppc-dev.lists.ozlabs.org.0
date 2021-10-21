Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D595435994
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 05:56:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZYYd692Vz3cWm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 14:56:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YKW+fl8n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YKW+fl8n; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZYWp13ghz2yLq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 14:54:29 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id
 a15-20020a17090a688f00b001a132a1679bso2144183pjd.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 20:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4OB4HKpSTSvec7tdhOyh9+lefNKDv2WVmjlpMbglA3o=;
 b=YKW+fl8nIaiqVVPdACidPVyNm81RKQLzjibc5C8uWaxuVB5C56IDjccjheSYIt54Yu
 ums5PUIMRvngixwc6hrIOSQew8aGQmywQFvKFaoxuDRGmmX8x/mRlGAF8cSCWEi0ubT0
 FFCPo/xtaobyzkige2UOdDKLDknSrN6O5+TGhD6tKksHWfl7qKaeGSiqdXHnC4h/aYqP
 PoU1tY3LuUimoGxK24G17nJ5EA/7w7P7xBfhj+cnSTVzdqgLc4SyT/21rLbt2roJ3Ap5
 qn25G5Gf+LP8CSMB34jD0akPaoQKfCFNh8cXIIlcDjYjySSik7GRMBZqAMAmNPa3ayzO
 4jgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4OB4HKpSTSvec7tdhOyh9+lefNKDv2WVmjlpMbglA3o=;
 b=VN0O0EztoKBwFFws7m5JaI+ViLacigMDNtiImoy1pBSZ9EEHjGRuVyQvIkHXSmUGsN
 mDG0cgYw2SPFXWHAhz6tkiqDeW3emueeXVEyH1+/Y0cks4bbHJCcVvnkp7656ooHyeNi
 qoxnRcIMItSJu36ngBkL0SKj/6ztJsJtdXG29tcl0UrK09+qTXrgH5IWekkbXLd3EFyw
 Hp1jON0qF2fv6UuAssm+TyCMmDtTvco77rn+3Ia0WpOqOPgfzMBn+Auy+9MyyURW7Nf2
 K2hnY7/xs2t3rv2BnihJrPXRWbNteSnz+i6HaRAsXVB3YhXmZc7TIXh/BhajlCIoJThE
 Vtzw==
X-Gm-Message-State: AOAM5323a6jfsFObPA9gyO0WWpVBIThV7kePM1656QlmaqjX7FuEL0dB
 4gm64Z5jqXB6rIzMIP4U0NIb5AboWOM=
X-Google-Smtp-Source: ABdhPJwsvBtWdUvrRvMhvExDkVdCxWQ9tNCVcTqKy7C71gPVIVRezwKm4eUaSnDx3X0LSCDQXjgB6Q==
X-Received: by 2002:a17:90b:4c4a:: with SMTP id
 np10mr3606954pjb.233.1634788467538; 
 Wed, 20 Oct 2021 20:54:27 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id t9sm7369249pjm.36.2021.10.20.20.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:54:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 02/16] powerpc: Rename PPC_NATIVE to PPC_HASH_MMU_NATIVE
Date: Thu, 21 Oct 2021 13:54:03 +1000
Message-Id: <20211021035417.2157804-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211021035417.2157804-1-npiggin@gmail.com>
References: <20211021035417.2157804-1-npiggin@gmail.com>
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
index c145776d3ae5..ebe3044711ce 100644
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
index 5e037df2a3a1..69a1ff8c079b 100644
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

