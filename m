Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F7345DA84
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 13:57:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Hvb37CWz3dwG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 23:56:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mx5X5SL4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=mx5X5SL4; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Hmh3NtFz3c99
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 23:51:00 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id i12so5839382pfd.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 04:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0wURW3cXMNPeuq1RNJDjBPCrSRMpCGyzyOCithD74+A=;
 b=mx5X5SL4uh7JaO1j0VrGK4ffSAqnflT/4X7vSMVhz6KlYMthiTg+Iov2APo4z+TdZU
 ux8/8AFTEOyF1A0I2sdRC55lfArgsPijAc8rjVnU+kizWr+nEFBBRuNCfXnq2W3q4RdU
 rxTfWjVQyKbnC19QaLmBlpuEUamkvYSFgvjPPTzUyCDoHlU5GO66a0W3AfX+XiSCO8ed
 qT0dcZZ9diQLz5Pmo3jYxPLvQgIaCF9GYv1VOU+ZA2/iDMIBafzvBOhnxxRkIcZBwiEI
 URwbOEnqFn+7njCsVRlt93cvPywdVeESUKmZhL91YLkrRpotbvVYFhcvE+nWCGWqlRQg
 F3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0wURW3cXMNPeuq1RNJDjBPCrSRMpCGyzyOCithD74+A=;
 b=KbtP8H0+kbqyZ7vHpAx6bpXbjqGdk5Gmktkx1lJP2eaK1M7XOWi0NqDbVcqKn0lu5s
 9DKCYQ5jMJ72eii9QWV3s08cX5bdLmpP0CX2QNpj5mLQSnCBgmSUi0uhqply7za7j+TQ
 8RvKtjzUBnIl+iZC4dQ4iMFNlwI9p3Hd1L3SaqvnimPjU/hupQ5D2s26ZaxfHFInNy9A
 frtztb2EEdF5bE7OXcA37CBMC1Ygj7GLlcADKwtiOwPS/d2ukhX7FsPzdcpehupOrCh5
 fAGEwOgoMBAtNsoI5LvOJV7j93HvNEhCjzsoaAUmMduV2mmDCO7crnrYHd7TDhi7GeKf
 nV0A==
X-Gm-Message-State: AOAM5338kHqK5flxmHg818jxn3YsQ43hOXGhDU2HdbXj5hf13myqZzQN
 tgRiUUyMoWQ/GZFuDgW7y8zch6DxNW0=
X-Google-Smtp-Source: ABdhPJx0YpbCRtGIQQ0iJRdghZ64oO3CHAu7pTRU5V0V0nXJmw4O6R14Vqmbpa1Q6Jv0qu8IBWoNWg==
X-Received: by 2002:aa7:8a56:0:b0:494:6b49:cbfa with SMTP id
 n22-20020aa78a56000000b004946b49cbfamr14005597pfa.72.1637844658635; 
 Thu, 25 Nov 2021 04:50:58 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id gc22sm7242851pjb.57.2021.11.25.04.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:50:58 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 09/17] powerpc/64s: move page size definitions from hash
 specific file
Date: Thu, 25 Nov 2021 22:50:17 +1000
Message-Id: <20211125125025.1472060-10-npiggin@gmail.com>
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

