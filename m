Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2175D46505D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 15:48:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J425Z0Tshz3f1L
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 01:48:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qM7YezPp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qM7YezPp; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J41yX4Wkdz3c6t
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Dec 2021 01:42:28 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id y7so17908625plp.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Dec 2021 06:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0wURW3cXMNPeuq1RNJDjBPCrSRMpCGyzyOCithD74+A=;
 b=qM7YezPpAteVbR20inlTxHd/PHNV4fVLJOfZrSzlcxLDLO7Np4C7SRvtTmNaJ1x46D
 NVjkjvXL88vm2aCiCOYNFzqIKvKKi5kke4ZJL3+tYQZvoujydn4Kj65ET1DJQ6wSYBao
 NM5tDcDbNnisi03ZKspvF+or0cFhlNGTKHPDhsNcMtmbC5bM8q36BpxiZVrED6kGeA8p
 CdwrXFJp2/3jUsaruiNn07+Qbfpn4gx5VswZBJ0NzhE2QYhapGvfqhIpyvODLZ/Wg5l7
 mjDR6s/uiy/QES18CuFpus1G6nWSIdhWeV3PWl+h3Z2ZobEpOpu7aCaBC4N+Kbch9ke4
 dOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0wURW3cXMNPeuq1RNJDjBPCrSRMpCGyzyOCithD74+A=;
 b=WmAcf4w08AtdaVM1c4G7ckTfQb36XFWjOvsrJnaWc0d2giM39KyKGMs7OC5joje3oV
 LQID7O1ypGXTHySF5Ph/yzDINfbSRMUse8xuYcxqzOhhdmCOl5tww9R1J2lyhmyjKSAR
 JsWoBLBKDtxYbvHaBl65oLkCOG4R+L8KeNxYjtVynrIvVMK0lnSkyPqf+dV3H4ZWHFcc
 ON67SmF1S9aFNmBkgNl9Hs4IGsqEaQoRqvCYPNuXAs657Ffshf3jtfpOIG1jHOpavhMH
 nSsfAJ2LFVi+EKuD3PvcIEQtG6SItUfkLhtaw2qzfsWvq36abghCxb6G9U4miNfdmG2F
 FlHQ==
X-Gm-Message-State: AOAM5306CLl51u0WKJAjS/sGU5/OgEPBaWOKS7BLhGqmbN58lZuVwJB7
 vQ/QWwx8M2kA84kpDpoSyyoUJlkALVE=
X-Google-Smtp-Source: ABdhPJzvP2Tj1f20xJ/5QGe/DewBwed4ApISug3fjVg30c6JDP20dBQKLmkBcRKG9GN4ZGDVSUVawg==
X-Received: by 2002:a17:902:7797:b0:143:88c3:7ff1 with SMTP id
 o23-20020a170902779700b0014388c37ff1mr7930506pll.22.1638369746460; 
 Wed, 01 Dec 2021 06:42:26 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id e13sm29230pgb.8.2021.12.01.06.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 06:42:26 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 09/18] powerpc/64s: move page size definitions from hash
 specific file
Date: Thu,  2 Dec 2021 00:41:44 +1000
Message-Id: <20211201144153.2456614-10-npiggin@gmail.com>
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

The radix code uses some of the psize variables. Move the common
ones from hash_utils.c to pgtable.c.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 5 -----
 arch/powerpc/mm/book3s64/pgtable.c    | 7 +++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 97a36fa3940e..eced266dc5e9 100644
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
index 9e16c7b1a6c5..81f2e5b670e2 100644
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

