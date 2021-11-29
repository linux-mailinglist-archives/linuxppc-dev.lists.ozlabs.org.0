Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9C7460D19
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:16:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Vqp3qLWz30HR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:16:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Bm0gMmqg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Bm0gMmqg; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Vfx3DbCz3cSC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:08:41 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id y8so10999875plg.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/z8SS7kR2MLC9EqflyQsC4arLNQTFzV14z8CAryuKVI=;
 b=Bm0gMmqgvY3bsHYa2LT082ifBd6xbppYcLdPRBPpElE8XHGF/1wJA5bt9MFcYR3R+y
 ftcrp8hdv3GRGpqsWryjMFgGtUR6ahVn3U7cc2e5o0X6l+0KBQzYvTfQM2uW3SZ63B45
 nJVtDg/ID8jgPgQyQ2jyXVppLv2m7SBicwGsLZS9S4cuWQoCIj0wwDP5yk4geIJ4hnl2
 Z9GK8kxWiz5V5revSkEj/HBBiipdB1Tg7W+Cv9/G+qnVfOrKl38gYlBkrRwoREYfH52d
 OS1YxvZgHMOjbOtRSG42H95cAdHGuMiSjIgOgAsSJNDWvTePoQxbXJsmv5yCwtaRcH8f
 AZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/z8SS7kR2MLC9EqflyQsC4arLNQTFzV14z8CAryuKVI=;
 b=cdOlAxM/I6QNj0Ali/5eAs0G11i78dlt44Dze9nK3aa/u2cnkYAibFZQF8ye+gKqLf
 /kkPa8kzFV2YrFJfs1FMn3oX0pomZB6muB+tUgMEBRPzY9XUUzwiW2UsZfnPUwQG3Lh1
 B3Q8GaE2/mwPYN1/v2HgHvoGaTlTAL9AF1EL6yZoredQn6KTzJIJ9vc8hy5epKGisAc/
 WK+1bHslj0LFG2xoa4L7B3KkzNCl/Ff8OP7y7vu21uslVRxNSTx+hRUpdics5onzp0xb
 vXzx+lglfvZGQQbRCACDUw+BNBSJ/kdJO+NedW9lVgATYgpdivNuoHFRJcQ9JJgDcWH2
 6g9Q==
X-Gm-Message-State: AOAM532MqACuV/vJbUxTW3yq2I/rSKbcm6gKGr2eKxiAwu5vQA/LAkPo
 Mk3ri8Nh4esJKxysftmaVVLoHawp1yI=
X-Google-Smtp-Source: ABdhPJw7Xruk/alECJXG4Txru4L/hqVNE+6d3vEPkzYNynAoOxoDe1A+OUVq/77xLAIfEREnq2ThxA==
X-Received: by 2002:a17:90a:d481:: with SMTP id
 s1mr34043769pju.66.1638155319299; 
 Sun, 28 Nov 2021 19:08:39 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id h8sm15462908pfh.10.2021.11.28.19.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:39 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 12/17] powerpc: make memremap_compat_align 64s-only
Date: Mon, 29 Nov 2021 13:07:58 +1000
Message-Id: <20211129030803.1888161-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211129030803.1888161-1-npiggin@gmail.com>
References: <20211129030803.1888161-1-npiggin@gmail.com>
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

