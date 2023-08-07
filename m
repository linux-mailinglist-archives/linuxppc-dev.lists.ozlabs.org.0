Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F18F57734EF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 01:25:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=mEF5uAs6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKXVh5b21z3dVm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 09:25:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=mEF5uAs6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKX436wffz3c5k
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 09:05:55 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-ccc462deca6so5489191276.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 16:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449552; x=1692054352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSWx8dFer3K04xJe2FS2V6S19uUh9FiSOjAjYMXRNjw=;
        b=mEF5uAs6LPH63FkNSBplLFspkb60DHxm6zOnUwvAQJc3E/pOwbhAIiNFZBUYHiCsiM
         p2tbQp60CKHpnlFx92kmBMq0iICGLFKDwXQ0LyWNPB5CTFYLszQ4c8mEuzgfzEni9mwM
         Ttmf1qUiq6AjtyU7518jshwfi+pChbC60Sh5kSbXAB+lvEOcHSUd/ZfP7MFS2PgNjGFo
         r7Bvb+zEwdMz3ovaFVdL7n7AY1JJbQH54hsJVFdRCSvSwoDtl5zIXSCLg5x4eEWrxL65
         mP+yB5DlcuhDlbUdEBdiXWCJptk41KogbXQLbDgKd5NU/tlto4itztjaP5et2Hvpw0rt
         7VEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449552; x=1692054352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mSWx8dFer3K04xJe2FS2V6S19uUh9FiSOjAjYMXRNjw=;
        b=Gip/L56xtk7jUOs7mtb8HcGWq/6kE+TNtKJ5Pj/juJP0Iwag7BwUYE4IYNYD0T4jz1
         lHqmLpgfRFJND+Myg/iMkoPuPm0/WjEEQt9EiTGiA048EqK/NWJrOAMLNBhfwJ/PwWVb
         xrwxN0xL84QPei8Y6OwtGq/952o86vc/MgLP2JNOBX2B3C+TuesMfvdPw7iN1304K2WY
         HBiMdYhCJYzbAZwQ038EOW9ODRKcGtZuZlXW0SPz+yd3F7f04qX4euimom49wAYEpDY+
         1VMWd3ZOjr2gAgjOjYRMMhzXcipywqFt2ugp5PHFUU61me8iJPN9tk6ihmjjAHjZJIdB
         cDpg==
X-Gm-Message-State: AOJu0Ywe9gNsv9XE41mU5V6jtHwFVdASR6PWHTfeoK9jHYAKDQXnl/A2
	uNnfpnJhVHdYG3WIruWklLU=
X-Google-Smtp-Source: AGHT+IFZB5AVL/MxN7IM/ds0EZn0mK90E4BWht9Xyb7zBcTjMbr/Qp8cCY+l+/2imbi83tiWiC1i0w==
X-Received: by 2002:a25:4e05:0:b0:d12:3108:f90f with SMTP id c5-20020a254e05000000b00d123108f90fmr10423741ybb.24.1691449552662;
        Mon, 07 Aug 2023 16:05:52 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 16:05:52 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH mm-unstable v9 17/31] arm: Convert various functions to use ptdescs
Date: Mon,  7 Aug 2023 16:04:59 -0700
Message-Id: <20230807230513.102486-18-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

late_alloc() also uses the __get_free_pages() helper function. Convert
this to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/arm/include/asm/tlb.h | 12 +++++++-----
 arch/arm/mm/mmu.c          |  7 ++++---
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index b8cbe03ad260..f40d06ad5d2a 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -39,7 +39,9 @@ static inline void __tlb_remove_table(void *_table)
 static inline void
 __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
-	pgtable_pte_page_dtor(pte);
+	struct ptdesc *ptdesc = page_ptdesc(pte);
+
+	pagetable_pte_dtor(ptdesc);
 
 #ifndef CONFIG_ARM_LPAE
 	/*
@@ -50,17 +52,17 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 	__tlb_adjust_range(tlb, addr - PAGE_SIZE, 2 * PAGE_SIZE);
 #endif
 
-	tlb_remove_table(tlb, pte);
+	tlb_remove_ptdesc(tlb, ptdesc);
 }
 
 static inline void
 __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 {
 #ifdef CONFIG_ARM_LPAE
-	struct page *page = virt_to_page(pmdp);
+	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pgtable_pmd_page_dtor(page);
-	tlb_remove_table(tlb, page);
+	pagetable_pmd_dtor(ptdesc);
+	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
 
diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index c9981c23e8e9..674ed71573a8 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -737,11 +737,12 @@ static void __init *early_alloc(unsigned long sz)
 
 static void *__init late_alloc(unsigned long sz)
 {
-	void *ptr = (void *)__get_free_pages(GFP_PGTABLE_KERNEL, get_order(sz));
+	void *ptdesc = pagetable_alloc(GFP_PGTABLE_KERNEL & ~__GFP_HIGHMEM,
+			get_order(sz));
 
-	if (!ptr || !pgtable_pte_page_ctor(virt_to_page(ptr)))
+	if (!ptdesc || !pagetable_pte_ctor(ptdesc))
 		BUG();
-	return ptr;
+	return ptdesc_to_virt(ptdesc);
 }
 
 static pte_t * __init arm_pte_alloc(pmd_t *pmd, unsigned long addr,
-- 
2.40.1

