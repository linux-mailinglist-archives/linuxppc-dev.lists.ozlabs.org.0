Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9F4460D13
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 04:14:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2Vng2c14z3f08
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 14:14:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=YjF9jDvz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=YjF9jDvz; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2Vfn66xsz3c7y
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Nov 2021 14:08:33 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id v19so10978298plo.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Nov 2021 19:08:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0wURW3cXMNPeuq1RNJDjBPCrSRMpCGyzyOCithD74+A=;
 b=YjF9jDvzQvtx7UDuTxHJE8c5m01Eqvsg3bdeS+rZDAwI9sk3BjiVVkYcp6aXcfnnnc
 TAwx7xXDIz3LcsGQV1S/QOSd8ox6YCi71Kk7osbIRJYp8uB7g5twdLdakxDlBFrraNCE
 EcwK1RnSvz8dOcF9cjRENxB40Hi6WC9/XBzz2QQsHTVI9wUzcTdI4jybUIzcYlGBwO3r
 Vd55E49j3ca4ApdoTmW2WYIzFvmVJdqR8OHqGpTf+tXlhQMvHe9tRf7McyVXKq45QoG3
 abNIeJlTCH3rYfvVmxT7RmLtC9M+HxEXeXhtq9EzUWC/pFPZBg8TZe0WDx8AlO3AqYGp
 uQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0wURW3cXMNPeuq1RNJDjBPCrSRMpCGyzyOCithD74+A=;
 b=EOto64RepwP3btlDEfofK+p5oX3gMFFK9NVjtBURIYNhk7O7McMmi6OcSzT7TwCsjC
 /rG25jIoezNVhudd6ZY17+8UMWLeBL3jtrk+6AYqgWgj2gybKx7gTlu7rDxnAo5UpGgZ
 mQzzWDxsjf/84B9Emd+MNNogS0IhGx2Pt00Lb5Onr0GHCm/GTQhLUBhNpOzJQwCQzSC4
 1WHMix/GGWRZQk1YBwnPK4aMrHmje4pcmz9GRnfoDMmxHjWwO+uYJuocILw9L1NPanIc
 +7DZ4n+TIo1/aGw+zs2XJa0fwDdYPHDZsgBhUj0RatUu1VCCjqe46HVh2RmapB4u0ptK
 0ReA==
X-Gm-Message-State: AOAM531v0lpvNVF4tXwY3GlwDCzoQ3HaGb1VoNMv8xPi99P9P3DoVrEF
 IgCVtoCC5B9+nTSR7lqpyahJPjNVfGA=
X-Google-Smtp-Source: ABdhPJz+ZeCYMk0Ip4cVCJoS9Kk9kMCiz1AHWvkwOelLrpLFbDEqZ8WvUFLBrGb3Qk/pPJP+iYOl5g==
X-Received: by 2002:a17:902:b110:b0:142:7621:aecb with SMTP id
 q16-20020a170902b11000b001427621aecbmr57155981plr.55.1638155311741; 
 Sun, 28 Nov 2021 19:08:31 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id h8sm15462908pfh.10.2021.11.28.19.08.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Nov 2021 19:08:31 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 09/17] powerpc/64s: move page size definitions from hash
 specific file
Date: Mon, 29 Nov 2021 13:07:55 +1000
Message-Id: <20211129030803.1888161-10-npiggin@gmail.com>
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

