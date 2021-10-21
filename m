Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD7D436D9B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 00:38:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hb2T13lWMz3dhg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 09:38:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V8wWKVNa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=V8wWKVNa; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hb2J00FXbz3cPD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 09:30:55 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id oa4so1557308pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 15:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E2f311VIMhbZMaqDvSwr1rwtYXp44Atiob4TfF7qX2Q=;
 b=V8wWKVNavWk4ymhLi1AeYtj/3YdnrxiqcX3u3uvGSq5i9yB/rod/B/9+bhIUOM7G5J
 +LbKLKgk6JRc+Tgf38f6k6qQCconfxIcDtQ4o/tgSqTiSxcvzNQ9YwEAeonbk0HREYQb
 /rifYyVAiI+XxOY+u/ju7PRzG6BINUvG7WgFuq9fCApJTsVd6/09LZrqPHVhJTUB9slr
 ygbMm+By77nsn2vsap5CB/eVOVRYMZENt1I6DalG0VsefFosZdBR0/2bqyzmI3W1eqtJ
 hCB6zYnHoLJ5pjb5Pm1mMwILZDl/kAsZe+t8aPi2k8jM/o6brWt0VN6eKcYORX6cB/Vr
 IeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E2f311VIMhbZMaqDvSwr1rwtYXp44Atiob4TfF7qX2Q=;
 b=UzWZhu8/xu6qryKDlQK/0gQ8HFJp344jHMTb0UsjcFEU6isvIkaCqd0fRFsLG15z3n
 dAHga7Gh5nikL5D/z31HXkwzzDwgCu73wDXwX6JImaNnPZCf4nglNpc/xmMBcXG/tQN6
 pFO2RtQoFxJPrzLrlCgSclEF5d/mNt+gJw0U8+oWyHGai28x+lqCrurJuzsZRnqQzNcn
 MbCp7tykY6OlBqT93J5h010tSbaHuKAwjlCRjUnJ6ddbX3j83jDPjeR8Iyo2geG5dUQu
 5teBmJKvmcCw0fS98XYZmaOGdwdD+Lbk6ECC57djCZAcIPyf4rPxrrVRJxuiQuFYExIS
 k3Lw==
X-Gm-Message-State: AOAM533/cEgoS194l7EO2IrJyn4XxN3kKFRsJP6JuyTxn8LcrBfbd5Ml
 39un/qW/3mqbEGAdsrewthlP3V8aERo=
X-Google-Smtp-Source: ABdhPJwJG8zYcpC1k7a3i8/MKkyawASSA+rX33cFGUhqZ48SIBRRkujSH7Xrd9QS0j3lS2CXWpOQgg==
X-Received: by 2002:a17:90a:4509:: with SMTP id
 u9mr10208681pjg.79.1634855453848; 
 Thu, 21 Oct 2021 15:30:53 -0700 (PDT)
Received: from bobo.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id e6sm7205716pfm.212.2021.10.21.15.30.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 15:30:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 12/18] powerpc: make memremap_compat_align 64s-only
Date: Fri, 22 Oct 2021 08:30:07 +1000
Message-Id: <20211021223013.2641952-13-npiggin@gmail.com>
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
index ba5b66189358..653f1fa9f8cb 100644
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
index 06565b452cbc..7d556b5513e4 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -534,3 +534,23 @@ static int __init pgtable_debugfs_setup(void)
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

