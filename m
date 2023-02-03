Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C00ED6897A1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 12:21:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7YB54Dtfz3fBY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 22:21:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TjtWDHoU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=TjtWDHoU;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Y656dnyz3f7N
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 22:17:33 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id m2so4889425plg.4
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 03:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48YFaNCLRJJqW41HHDBi+5xfANsipTmFh9JB3btUi5Y=;
        b=TjtWDHoUpxwffYtN8qHuISDw9QBSsOUf6DvC0KSlkqLkWyidL/gtRT3y0qZKQhMTMB
         oYmLn1RE6bLLyxZyK+AvNE5dz2IfI5V7idqQAfXIjIDX+SbHjlpuLykgSpar1siW3scH
         4Nvm0z6egodNOGxJlW6j/pVWGrPxJZ0Tw9h0dU1/1Et+q4zBh59o6B5eYyFCsQxAG6XY
         Z/Wga6qQfShegnn6X7JPbPZSc/NLyUMbwq+UpiYRSZsoDwAm41KGcdTwDpUW0DGsvBAp
         5pGhF5cS0h85LptBBd9T9ky/yqCTxmlvhSQX1HBB91ng9nh1gnPqNYhfjd2M3zNH/z65
         CsYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48YFaNCLRJJqW41HHDBi+5xfANsipTmFh9JB3btUi5Y=;
        b=UIQtbxvdVvMUE2/BDJ4lxo5PI4Erbkwd6cCHXm7kZLa6FhOfjGfMkBth8g2IxO7gem
         HinxY/FuuEbdcaqG82wGmTyLJ6Mjx0m9NRXS0pN0psl6ramVWngybpzDhTU8NoCQYb7+
         uHDcSBBeclgqAN8KYVMyVvHWfN1044ZT6YtbA8dBZLd4gJSTG/B2+CXMLyPPXrRb467V
         fuZfOl7Kai2bl8II/sdSTSIjSkOrJX24fDHjB9H8SQ2jcbapvD82C7qDdsloHukzmzKQ
         8VSDnGMi/Igkl32F568c520QPLmi/4NqANXxjeE0dL5Pn5jcoU1n8deYdtV6wqugB9fv
         /8vQ==
X-Gm-Message-State: AO0yUKX32Hm8yvlg1RfA+yaVq6Z2rB4kIlZPBSVEg2p3ln9qjWdqcEZV
	z9LckNVHPGz7oFnaVvwnk967v0zIiuo=
X-Google-Smtp-Source: AK7set8P9XRsTkhP6zu3BiUAVGvmERk00xG/SCrgSY7NjsX8sFtY5F/wi45XkvHJNPNVhwt9wIUFRg==
X-Received: by 2002:a17:90b:1a91:b0:230:537c:a39d with SMTP id ng17-20020a17090b1a9100b00230537ca39dmr4092556pjb.0.1675423051241;
        Fri, 03 Feb 2023 03:17:31 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-117-77.tpgi.com.au. [193.116.117.77])
        by smtp.gmail.com with ESMTPSA id i15-20020a63bf4f000000b004f2c088328bsm1285151pgo.43.2023.02.03.03.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 03:17:30 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/64s/radix: Remove TLB_FLUSH_ALL test from range flushes
Date: Fri,  3 Feb 2023 21:17:18 +1000
Message-Id: <20230203111718.1149852-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230203111718.1149852-1-npiggin@gmail.com>
References: <20230203111718.1149852-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This looks like it came across from x86, but x86 uses TLB_FLUSH_ALL as
a parameter to internal functions. Powerpc never sets it anywhere.

Remove the associated logic and leave a warning for now.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 27aa5b0fbb3f..2608ff7cf62c 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1107,6 +1107,9 @@ void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end)
 }
 EXPORT_SYMBOL(radix__flush_tlb_kernel_range);
 
+/*
+ * Doesn't appear to be used anywhere. Remove.
+ */
 #define TLB_FLUSH_ALL -1UL
 
 /*
@@ -1128,7 +1131,6 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 	unsigned int page_shift = mmu_psize_defs[mmu_virtual_psize].shift;
 	unsigned long page_size = 1UL << page_shift;
 	unsigned long nr_pages = (end - start) >> page_shift;
-	bool fullmm = (end == TLB_FLUSH_ALL);
 	bool flush_pid, flush_pwc = false;
 	enum tlb_flush_type type;
 
@@ -1136,15 +1138,15 @@ static inline void __radix__flush_tlb_range(struct mm_struct *mm,
 	if (WARN_ON_ONCE(pid == MMU_NO_CONTEXT))
 		return;
 
+	WARN_ON_ONCE(end == TLB_FLUSH_ALL);
+
 	preempt_disable();
 	smp_mb(); /* see radix__flush_tlb_mm */
-	type = flush_type_needed(mm, fullmm);
+	type = flush_type_needed(mm, false);
 	if (type == FLUSH_TYPE_NONE)
 		goto out;
 
-	if (fullmm)
-		flush_pid = true;
-	else if (type == FLUSH_TYPE_GLOBAL)
+	if (type == FLUSH_TYPE_GLOBAL)
 		flush_pid = nr_pages > tlb_single_page_flush_ceiling;
 	else
 		flush_pid = nr_pages > tlb_local_single_page_flush_ceiling;
@@ -1328,7 +1330,6 @@ static void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 	unsigned int page_shift = mmu_psize_defs[psize].shift;
 	unsigned long page_size = 1UL << page_shift;
 	unsigned long nr_pages = (end - start) >> page_shift;
-	bool fullmm = (end == TLB_FLUSH_ALL);
 	bool flush_pid;
 	enum tlb_flush_type type;
 
@@ -1336,17 +1337,15 @@ static void __radix__flush_tlb_range_psize(struct mm_struct *mm,
 	if (WARN_ON_ONCE(pid == MMU_NO_CONTEXT))
 		return;
 
-	fullmm = (end == TLB_FLUSH_ALL);
+	WARN_ON_ONCE(end == TLB_FLUSH_ALL);
 
 	preempt_disable();
 	smp_mb(); /* see radix__flush_tlb_mm */
-	type = flush_type_needed(mm, fullmm);
+	type = flush_type_needed(mm, false);
 	if (type == FLUSH_TYPE_NONE)
 		goto out;
 
-	if (fullmm)
-		flush_pid = true;
-	else if (type == FLUSH_TYPE_GLOBAL)
+	if (type == FLUSH_TYPE_GLOBAL)
 		flush_pid = nr_pages > tlb_single_page_flush_ceiling;
 	else
 		flush_pid = nr_pages > tlb_local_single_page_flush_ceiling;
-- 
2.37.2

