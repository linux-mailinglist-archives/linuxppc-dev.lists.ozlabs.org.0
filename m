Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4A94359A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 06:00:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZYfy6Pyrz3dq0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 15:00:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZXpYyg3N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZXpYyg3N; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZYX46pDZz305Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 14:54:44 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id k26so4718233pfi.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 20:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k7Tkq5sXkw4cpQUD/GPghO3VPNRygmiIp7/r25/whiQ=;
 b=ZXpYyg3NTzS425Y3y4iMJ5YTX/oKQo0jNqxg8x8LikMwpVCIjyY0b54yfydaqETAOY
 XH6Vmd+g21CJ+reMj1L9UPaHNvJY23c7Jrn4C3i32QD9J9U3BBDdtwwLLU6W5avwbGTk
 NT8No6lgHl1JjDN/e55oWhoeVWr71GhZZdYukKJClb19rqJFF4dExpyt3/uNEr1gtwsI
 9U2Mr/SgCs/vnPTS2W3sQxOP6OUfB4cbWiV2rbkY/ce4qk/MymBc6pOl7y++l70ALgvb
 1ABdh+rpU8xDrkpzR/Lqs/tIMFylOJLwznH8irAaeFj4d8ZLZAIsVBNlp9TVufEVRQ65
 LhYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k7Tkq5sXkw4cpQUD/GPghO3VPNRygmiIp7/r25/whiQ=;
 b=E4WMMrvxr7fJ2KWvVN6zHUMi9C9Ct7nN9dGX0/t1xYg+J1Y/Ui+JAaYQUemeDAZt+R
 RW+IrJVsmSXyh5v61tpSAJ3Qu+Cx6JdGFYDrjkMYtSa5uYnE1XetudX3k7ZNPDfheh3P
 T9w85UgInC9YsbeDSFcx7xiyhTJLXLBKmftaLYCKCB9rhi5Wh11Uq6tdOlgrE9VySp2f
 JvXojvF6ODr646w/R1ed9GJxy2xsz18FYpJGoNnuDKT5lkfE7pJzpjvz6j6IY+h1iHrv
 /3uJ3rYsG7jAmJzw5rMVrvvnSETh4HXvW9nh0UiM7aCwxiAvzwCSVV6HkVeWmLKZH9jy
 7S+g==
X-Gm-Message-State: AOAM533+jz4zQqCsIM750h1rgBhNWgXqubRZTygSim1eiq2n7EqHRD/X
 M5QTSpyK1xJqiXDhn951QqJNOxtCTN8=
X-Google-Smtp-Source: ABdhPJx50tM64B/SGZwSdRuCCXZsS4z4mdxIa7wdwgmU8SpogOt/hilHWAdIEhj/dgk03FHq7OsLXg==
X-Received: by 2002:a05:6a00:1709:b0:44d:faf3:ef2d with SMTP id
 h9-20020a056a00170900b0044dfaf3ef2dmr2952241pfc.43.1634788482548; 
 Wed, 20 Oct 2021 20:54:42 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (14-203-144-177.static.tpgi.com.au.
 [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id t9sm7369249pjm.36.2021.10.20.20.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 20:54:42 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 09/16] powerpc/64s: move page size definitions from hash
 specific file
Date: Thu, 21 Oct 2021 13:54:10 +1000
Message-Id: <20211021035417.2157804-10-npiggin@gmail.com>
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

The radix code uses some of the psize variables. Move the common
ones from hash_utils.c to pgtable.c.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 5 -----
 arch/powerpc/mm/book3s64/pgtable.c    | 7 +++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index ffc52ff0b3f0..1cd28e3cd3b5 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -99,8 +99,6 @@
  */
 
 static unsigned long _SDR1;
-struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT];
-EXPORT_SYMBOL_GPL(mmu_psize_defs);
 
 u8 hpte_page_sizes[1 << LP_BITS];
 EXPORT_SYMBOL_GPL(hpte_page_sizes);
@@ -114,9 +112,6 @@ EXPORT_SYMBOL_GPL(mmu_linear_psize);
 int mmu_virtual_psize = MMU_PAGE_4K;
 int mmu_vmalloc_psize = MMU_PAGE_4K;
 EXPORT_SYMBOL_GPL(mmu_vmalloc_psize);
-#ifdef CONFIG_SPARSEMEM_VMEMMAP
-int mmu_vmemmap_psize = MMU_PAGE_4K;
-#endif
 int mmu_io_psize = MMU_PAGE_4K;
 int mmu_kernel_ssize = MMU_SEGSIZE_256M;
 EXPORT_SYMBOL_GPL(mmu_kernel_ssize);
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 049843c8c875..06565b452cbc 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -22,6 +22,13 @@
 
 #include "internal.h"
 
+struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT];
+EXPORT_SYMBOL_GPL(mmu_psize_defs);
+
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+int mmu_vmemmap_psize = MMU_PAGE_4K;
+#endif
+
 unsigned long __pmd_frag_nr;
 EXPORT_SYMBOL(__pmd_frag_nr);
 unsigned long __pmd_frag_size_shift;
-- 
2.23.0

