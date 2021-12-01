Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C83946506D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:50:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J427s0nHYz3dZp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:50:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Qxmm9yR+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Qxmm9yR+; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41yf6kZjz3cFX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:34 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id p18so17853978plf.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/z8SS7kR2MLC9EqflyQsC4arLNQTFzV14z8CAryuKVI=;
 b=Qxmm9yR+Bx8kfjFtZyT39IZrTPMWM8d179H9t/h0dlw5KV4mKkPmUltxumNGrDumc7
 1fA5KVxBFcSOc2+HrvQP05BgQBLXKHrZNghW3/ymL5+lkyYMAWOOGjNDfs9KQNfEvLtW
 D92+VGTZZOuYSPFSR3PndQCjaBJJ7H+QPOlevmrN7zNVwOz/csjEsHjOBZrTFZbkNAxA
 kAFerZiAiUmVqdzobT/wV+hiD7paYW3CfIZzLIT09+vfO538xo7T2sX585+p0TNeO9pi
 Ms3qs/dzb8KVyfvHv1Qa/EFa2bdpXw+gZ9EM2WkQCrRNNrETW7/c3C2MKO0MixIxq2Km
 kWvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/z8SS7kR2MLC9EqflyQsC4arLNQTFzV14z8CAryuKVI=;
 b=pZk2PrVGynH+wE6CImAFDyXKY9Ai+lecHRWt3GJqUirf3phUumyrKepq8PidKVEnui
 k0kRkOtjd5zQ8+Qx2zvB0MC83v32+T2QeZusfDvKQKL41knQvOZ1t6jXge1XxNhpVOK2
 DDVE7/slarBnkG1oY0VY4osvUulvDWW/lLMTaLsR2KvBioihQMK6s/fV11Dzamj5uwzk
 EJWZ4ZZ6QXqbtYEQCfWMZuoEOn+h6kqSduG0DfxWTouFC2y7d5WxlXNW09+6L00t4382
 hY9ihwt5/ZPtIPtLcYVQDomq5AMplvWG/BrpRSJN8dRwn+R/KFo0eoxv9EMc+kpOuJu6
 zz4Q==
X-Gm-Message-State: AOAM532s6ytUhl3+ADpS0e5lQeEW7sztI2jEqUiIIfYHf/v3Bk/uBdE4
 DVhvoFLzFNa6e6NRa9+/Ql0Db+gNI2c=
X-Google-Smtp-Source: ABdhPJzLEoZxHqQIVJ3dzwuoNJxn6Aloef3UQJUQljgP0WyS5iqzIxe8nBAyaZ/om/GtqFnrYnFYyg==
X-Received: by 2002:a17:903:228c:b0:141:f600:c161 with SMTP id
 b12-20020a170903228c00b00141f600c161mr8004210plh.10.1638369752941; 
 Wed, 01 Dec 2021 06:42:32 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:32 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 12/18] powerpc: make memremap_compat_align 64s-only
Date: Thu,  2 Dec 2021 00:41:47 +1000
Message-Id: <20211201144153.2456614-13-npiggin@gmail.com>
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

