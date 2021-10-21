Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE694359B4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 06:03:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZYkR0b10z3dg4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 15:03:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=g81sgJtJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=g81sgJtJ; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZYXH5tK1z3c7r
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 14:54:55 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d5so4736978pfu.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 20:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1V6hQVBHUXaiq8U51kuMoyXZNSDfwyY12TnsF6BcNI8=;
 b=g81sgJtJOtiK5o5Vd7yHPOqm9JzqeVlaLn8pe71uhIJtDeCb5NRZYZDtASxB2Y3bJK
 hshin85ph9F3R2c5cQy5n5sSaIFQFNrhwS+CHvlnYJHVm27LAlDG89k7oufKdgwRnJTz
 gGbnjJnkjevJQ3ixD1nOc7JWL8RDa2fpox62dcNbYVw3biOMONPYVZSrEn1JNAdXcXYV
 215mHCorkCjH+dy7TPl+gZHetk8gymY7n/DVLg8zmn8nk1ab6K/gLBAFLOW+ur0hiG00
 UdMsJI4QWAQ3M1tZYQYp15I1dOIq4quSbCICpgoy8P0F0rjrg0h+VoQDvX3lPtFz/n4S
 uXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1V6hQVBHUXaiq8U51kuMoyXZNSDfwyY12TnsF6BcNI8=;
 b=1RMQRyI2tHIqyvRcAlvHPMFgOv9lc43Racj7JRJTDjYJeTo61EJ35ljJAVLALxTzYI
 X2BnxTf0doP4BbVEI1NUjxh3y0QztZi+JMbTXZrULg6RcsBvuvh1jFXDsfRjbpv9ET5h
 K0ICswgU9kHkEtBMDZEWCc4TgZompET9sqVjAa+jvnAwUb0rJAzFp/fk30jkDhoFCtXk
 dYMo0/kEQF+LuTNNnllvFu6vJfIBAyJj5WsBTPiZdIwngXQFNg1xB+YcxUAL14IcqypI
 KjIX2TXLUaaYIuBK+QiJgLYXQiVsTPn4m+ijyoGWfYI9BnX+uJlbVcJ/EWgnNXsRRVTg
 xYXQ==
X-Gm-Message-State: AOAM531NAEhLvUpDmaweTleU7bDsdh7w3/sdsQAL0S9+bP9pusNsxWIq
 8Vt9U/Uh1Im85VZafMqHUV49waCamZ4=
X-Google-Smtp-Source: ABdhPJzJQJ+0lDDd5fELGorlVkzyxZZp35Lisni+eo1m8w8ksKeISnDM5nH/eOFxbX+6MfGQbajFgw==
X-Received: by 2002:a05:6a00:1a8e:b0:44c:5f27:e971 with SMTP id
 e14-20020a056a001a8e00b0044c5f27e971mr2976463pfv.72.1634788493781; 
 Wed, 20 Oct 2021 20:54:53 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id t9sm7369249pjm.36.2021.10.20.20.54.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:54:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 14/16] powerpc/64s: Make hash MMU support configurable
Date: Thu, 21 Oct 2021 13:54:15 +1000
Message-Id: <20211021035417.2157804-15-npiggin@gmail.com>
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

Thisa adds Kconfig selection which allows the 64s hash MMU code to be
compiled out if radix is selected and the minimum supported CPU type is
POWER9 or higher, and KVM is not selected.

This saves 128kB kernel image size (90kB text) on powernv_defconfig
minus KVM, 350kB on pseries_defconfig minus KVM, 40kB on a tiny config.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                     |  1 +
 arch/powerpc/kvm/Kconfig                 |  1 +
 arch/powerpc/platforms/Kconfig.cputype   | 21 ++++++++++++++++++---
 arch/powerpc/platforms/cell/Kconfig      |  1 +
 arch/powerpc/platforms/maple/Kconfig     |  1 +
 arch/powerpc/platforms/microwatt/Kconfig |  2 +-
 arch/powerpc/platforms/pasemi/Kconfig    |  1 +
 arch/powerpc/platforms/powermac/Kconfig  |  1 +
 arch/powerpc/platforms/powernv/Kconfig   |  2 +-
 9 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4b34e408a3e6..5e122c67f6ca 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -936,6 +936,7 @@ config PPC_MEM_KEYS
 	prompt "PowerPC Memory Protection Keys"
 	def_bool y
 	depends on PPC_BOOK3S_64
+	depends on PPC_64S_HASH_MMU
 	select ARCH_USES_HIGH_VMA_FLAGS
 	select ARCH_HAS_PKEYS
 	help
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
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 01726e7f2c7f..1834cdd9626e 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -105,10 +105,9 @@ config PPC_BOOK3S_64
 	select HAVE_MOVE_PMD
 	select HAVE_MOVE_PUD
 	select IRQ_WORK
-	select PPC_64S_HASH_MMU
-	select PPC_MM_SLICES
 	select PPC_HAVE_KUEP
 	select PPC_HAVE_KUAP
+	select PPC_64S_HASH_MMU if !PPC_RADIX_MMU
 
 config PPC_BOOK3E_64
 	bool "Embedded processors"
@@ -131,11 +130,13 @@ choice
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
@@ -144,24 +145,29 @@ config GENERIC_CPU
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
@@ -366,7 +372,15 @@ config SPE
 	  If in doubt, say Y here.
 
 config PPC_64S_HASH_MMU
-	bool
+	bool "Hash MMU Support"
+	depends on PPC_BOOK3S_64
+	select PPC_MM_SLICES
+	default y
+	help
+	  Enable support for the Power ISA Hash style MMU. This is implemented
+	  by all IBM Power and other Book3S CPUs.
+
+	  If you're unsure, say Y.
 
 config PPC_RADIX_MMU
 	bool "Radix MMU Support"
@@ -381,6 +395,7 @@ config PPC_RADIX_MMU
 config PPC_RADIX_MMU_DEFAULT
 	bool "Default to using the Radix MMU when possible"
 	depends on PPC_RADIX_MMU
+	depends on PPC_64S_HASH_MMU
 	default y
 	help
 	  When the hardware supports the Radix MMU, default to using it unless
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

