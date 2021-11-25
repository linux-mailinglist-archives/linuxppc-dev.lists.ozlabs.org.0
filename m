Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAE045DA90
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 13:59:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Hxw5lCYz3f5s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 23:59:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MqIHnLw0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MqIHnLw0; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Hmr3Kk7z3cG3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 23:51:08 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id k4so4477858plx.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 04:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/z8SS7kR2MLC9EqflyQsC4arLNQTFzV14z8CAryuKVI=;
 b=MqIHnLw0MvtPBGvASeBcOiLDNL5lOfUOie1fIeW/Y6WMfmck5EusrsrhMOozgBLJfk
 QpAnlylJwFrg9hyn/dnzx+9CubpEA0hDajEPZw4DKVgLXgCZpIMixXk+82tpmd31QCfg
 pr4y5W+6tTAqfcAjapOkcPTCUUTjyvBYspaeWXqu7Kv7b1alM5lGcwqQlnY2/BUJ92pG
 BRTSwWC2irRljXDxSMLmBDlMU/ZHznaa1EDnIuXdCT6q+rr3CKkbf1IOH8bjSVmJA5i8
 u4pGPcbNgNr+LwBt6joAxw9WtbOk7Oqd3Em8E7a4ZysMKeCmgmFpFGU+H7B1b3/XLSfy
 xv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/z8SS7kR2MLC9EqflyQsC4arLNQTFzV14z8CAryuKVI=;
 b=zvCQZJWJyAIhhHjtbkiW13Cu4HSZEOBfgYdB/QSey3ZYPAyi5mxVOAbw1TIszXTQGl
 3EhW5rhBPH4mn50pCoVkBIXc+r4bi/McUprGvtdsOJ2Ro9rUbV4enrgbfNjLsZh9K1lr
 XTdI9arvK5ooUat5OiCxfUOhN/PAoIs01KZrETqiZjAiUyKVmj+4G6K9EYNNVNs2HKv9
 ExYOR7iRxcJvtgWIcCzxM2XXP7iuySVd0RG1Sh7GFCu+37j63Uxb5UrdCMCMbzJcfPGE
 fyWERCbWA6J4MDPCANIy6xkPuGaekalR4dnEsa7eEfkdFgiR5OoxyFrZuCWOfnNcwjKf
 g+Yg==
X-Gm-Message-State: AOAM530wKt7RIyNSs+D7rWzMUOiYVAfLtTMUygGzJ/t8Mtqiqdkm2HGU
 BPGaBpvC/1yrGdk9ooMXsVJitUvnTTs=
X-Google-Smtp-Source: ABdhPJwJqAlezxaaWgJpwjWERKUpj2W/7BM0Wtm5a3Y76CeGNRch3SyoPfqRtK4FZaI6MPK07c+Klg==
X-Received: by 2002:a17:903:124e:b0:143:a388:865e with SMTP id
 u14-20020a170903124e00b00143a388865emr28510613plh.42.1637844666310; 
 Thu, 25 Nov 2021 04:51:06 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id gc22sm7242851pjb.57.2021.11.25.04.51.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:51:06 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 12/17] powerpc: make memremap_compat_align 64s-only
Date: Thu, 25 Nov 2021 22:50:20 +1000
Message-Id: <20211125125025.1472060-13-npiggin@gmail.com>
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

memremap_compat_align is only relevant when ZONE_DEVICE is selected.
ZONE_DEVICE depends on ARCH_HAS_PTE_DEVMAP, which is only selected
by PPC_BOOK3S_64.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig               |  2 +-
 arch/powerpc/mm/book3s64/pgtable.c | 20 ++++++++++++++++++++
 arch/powerpc/mm/ioremap.c          | 20 --------------------
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index dea74d7717c0..27afb64d027c 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -129,7 +129,7 @@ config PPC
 	select ARCH_HAS_KCOV
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
-	select ARCH_HAS_MEMREMAP_COMPAT_ALIGN
+	select ARCH_HAS_MEMREMAP_COMPAT_ALIGN	if PPC_BOOK3S_64
 	select ARCH_HAS_MMIOWB			if PPC64
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PHYS_TO_DMA
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 81f2e5b670e2..4d97d1525d49 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -533,3 +533,23 @@ static int __init pgtable_debugfs_setup(void)
 	return 0;
 }
 arch_initcall(pgtable_debugfs_setup);
+
+#ifdef CONFIG_ZONE_DEVICE
+/*
+ * Override the generic version in mm/memremap.c.
+ *
+ * With hash translation, the direct-map range is mapped with just one
+ * page size selected by htab_init_page_sizes(). Consult
+ * mmu_psize_defs[] to determine the minimum page size alignment.
+*/
+unsigned long memremap_compat_align(void)
+{
+	if (!radix_enabled()) {
+		unsigned int shift = mmu_psize_defs[mmu_linear_psize].shift;
+		return max(SUBSECTION_SIZE, 1UL << shift);
+	}
+
+	return SUBSECTION_SIZE;
+}
+EXPORT_SYMBOL_GPL(memremap_compat_align);
+#endif
diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
index 57342154d2b0..4f12504fb405 100644
--- a/arch/powerpc/mm/ioremap.c
+++ b/arch/powerpc/mm/ioremap.c
@@ -98,23 +98,3 @@ void __iomem *do_ioremap(phys_addr_t pa, phys_addr_t offset, unsigned long size,
 
 	return NULL;
 }
-
-#ifdef CONFIG_ZONE_DEVICE
-/*
- * Override the generic version in mm/memremap.c.
- *
- * With hash translation, the direct-map range is mapped with just one
- * page size selected by htab_init_page_sizes(). Consult
- * mmu_psize_defs[] to determine the minimum page size alignment.
-*/
-unsigned long memremap_compat_align(void)
-{
-	unsigned int shift = mmu_psize_defs[mmu_linear_psize].shift;
-
-	if (radix_enabled())
-		return SUBSECTION_SIZE;
-	return max(SUBSECTION_SIZE, 1UL << shift);
-
-}
-EXPORT_SYMBOL_GPL(memremap_compat_align);
-#endif
-- 
2.23.0

