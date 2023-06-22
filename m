Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 620A873AB85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Jun 2023 23:23:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TppJif0B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnCz120hGz3dhr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 07:23:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=TppJif0B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b; helo=mail-qk1-x72b.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnCQm3t2nz3bd6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 06:58:56 +1000 (AEST)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-763e968b795so157541485a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jun 2023 13:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467534; x=1690059534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VT4pshsioiI3cvxCaccwxS3QnyiZywL9n+n1KwplTM=;
        b=TppJif0BHo6hnPlcQL9KC8WSGCLNYWnZ5TWCUGNi9Yse0euGomuzrLUl2hHWg+xOcN
         AtrgkmMfCUjy9KLBFfUuEG2s0Ihpe5FTyr5metIKFf6zbktuYMraC91YUKi/KWfbgyVG
         lvJTabP9ygpBud7nE/7yiG7FvQtoPgmdiRSK2sy5kuq4cEPaMRzkmi7ezbneoKdvpKLs
         RzOr7Yyw6OYIFnxYXzw+JpXxuwUJk+Gv++J63O8G6cjfEEYoESBKv3QgdI5Gny8Js2Dl
         u397T8c8ML9be3fyfcRz9z/KIcbHqeskiUObgkxyvqYvJ9bImtnagHyVKviaetoXJ3oC
         RmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467534; x=1690059534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VT4pshsioiI3cvxCaccwxS3QnyiZywL9n+n1KwplTM=;
        b=LVXAa8drro7BILwWUx9JS1c51Mgra9n9NJe3YiXpPmhL4ywyhZdjKdOFF6OXrOn0tC
         JZDJ6swccVpBLvBcRFLtIgh0B0YblsQ/6tua/IMB0UCBvyS8j8D0PKp0jingLPFHgR9T
         3ettjJArzp4svGs5khWlPgICJtJ/aqC6uwwDmNeKIYHfXdzDd/7FsKLH7hrRpxD4rBhw
         jnzvORdSxsdVRC98N4QQdBHnwTVUAKY80SPwC3VtZ3kW9g3YkPehmDOTZU1mrXJLsbbQ
         vLQuLe2tSqqWmbOItKcjM3ULs078cx6wXJBJ0amJu3p/gRDd1rTRK7L2On7Y6sl+DKyF
         dWqw==
X-Gm-Message-State: AC+VfDyQQruTp7NZ8fSQfdnY6RXCeZwwqjWZtcJelV4jKQyDu1BWPZNu
	Ue1Ex0Cy9DGu1UFjQ8kf4sU=
X-Google-Smtp-Source: ACHHUZ4bdUBNX+PQFkV86pN6qHx4P8fCpAOyeLEg1MMh49m7gk0ETU/OT0t4ehwniJxuP5YNErTIxg==
X-Received: by 2002:a05:620a:2455:b0:763:de2c:1a8a with SMTP id h21-20020a05620a245500b00763de2c1a8amr6902545qkn.57.1687467534343;
        Thu, 22 Jun 2023 13:58:54 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
        by smtp.googlemail.com with ESMTPSA id d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 13:58:54 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v5 28/33] riscv: Convert alloc_{pmd, pte}_late() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:40 -0700
Message-Id: <20230622205745.79707-29-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
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
Cc: kvm@vger.kernel.org, linux-sh@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, Hugh Dickins <hughd@google.com>, linux-csky@vger.kernel.org, xen-devel@lists.xenproject.org, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-mips@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents, convert various page table functions to use ptdescs.

Some of the functions use the *get*page*() helper functions. Convert
these to use pagetable_alloc() and ptdesc_address() instead to help
standardize page tables further.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/riscv/include/asm/pgalloc.h |  8 ++++----
 arch/riscv/mm/init.c             | 16 ++++++----------
 2 files changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index 59dc12b5b7e8..d169a4f41a2e 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -153,10 +153,10 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #endif /* __PAGETABLE_PMD_FOLDED */
 
-#define __pte_free_tlb(tlb, pte, buf)   \
-do {                                    \
-	pgtable_pte_page_dtor(pte);     \
-	tlb_remove_page((tlb), pte);    \
+#define __pte_free_tlb(tlb, pte, buf)			\
+do {							\
+	pagetable_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));\
 } while (0)
 #endif /* CONFIG_MMU */
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4b95d8999120..efff9c752fcf 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -354,12 +354,10 @@ static inline phys_addr_t __init alloc_pte_fixmap(uintptr_t va)
 
 static phys_addr_t __init alloc_pte_late(uintptr_t va)
 {
-	unsigned long vaddr;
-
-	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pte_page_ctor(virt_to_page((void *)vaddr)));
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
 
-	return __pa(vaddr);
+	BUG_ON(!ptdesc || !pagetable_pte_ctor(ptdesc));
+	return __pa((pte_t *)ptdesc_address(ptdesc));
 }
 
 static void __init create_pte_mapping(pte_t *ptep,
@@ -437,12 +435,10 @@ static phys_addr_t __init alloc_pmd_fixmap(uintptr_t va)
 
 static phys_addr_t __init alloc_pmd_late(uintptr_t va)
 {
-	unsigned long vaddr;
-
-	vaddr = __get_free_page(GFP_KERNEL);
-	BUG_ON(!vaddr || !pgtable_pmd_page_ctor(virt_to_page((void *)vaddr)));
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
 
-	return __pa(vaddr);
+	BUG_ON(!ptdesc || !pagetable_pmd_ctor(ptdesc));
+	return __pa((pmd_t *)ptdesc_address(ptdesc));
 }
 
 static void __init create_pmd_mapping(pmd_t *pmdp,
-- 
2.40.1

