Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B931E85B77
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 09:20:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4640BR55qRzDqgC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 17:19:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=hslester96@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ofe+C/6D"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46408S2RpNzDqdX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 17:18:15 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id t16so43546236pfe.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2019 00:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9QURP9tOX78OoV4YHCAVa4gci4kleUEql2IHdV0xtxs=;
 b=ofe+C/6DddZyrlA676hoMNYEomzxlCl46Fw00Ol5KRPmYwLSXIvjNgpKXzEhKBFXx2
 2eJVS8sdC7xB/JWrbk1vuYQF6/RJQnZCg/4Y7fncYaY2oQkxtMl2WeAurHsBvHCdQHSC
 1pVhBxZU7PavnfiYxuOe53Hi/zm3kFxYxZHo429vz75VB9F+gZHSMAnSGVY3t73OyF0R
 osXEriXi46YAOfRfkG8klF/r7ZnzhdXrlYSzHZXR2DNFGz3OI8i1oIFbzqMv6y1s7PaW
 tF1v9G+h6WTLPfGytr1qSWojG0LiIfwXB9AhSY8xMMNc8nHJVuPUBCN4/KEX5qrjhxIx
 GyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9QURP9tOX78OoV4YHCAVa4gci4kleUEql2IHdV0xtxs=;
 b=M/AWGU3LsDsa5B4wDMjpeQqNcA9FPVY+eWa0XVJQfRxJ4idVcvO6hdzEkuQaBbDfzE
 gOR5SJN2XUFxdNUncbubhzfsr5ifPU7Cun762sx+ollUOLX6Vk8kIo7WOnEfnCoqgzUG
 O2tze8GBLthEW8IRi6RMIO/22VeYFhFqqvdd73bSB5ivJBj+QUXXavJCOzlo6g1LATmU
 6kPh6e/ZnvJIDdVkDrh1is7MPjKARZgNhfkooLq3q4rxo8rqhj2sv1SK5rbj+lPL5bDI
 Iv6sBvTf4r3llsfDOjHrJ0mEoKHTiYN5qPWqv5Ul99yIqw+SEngoJe5/E8PvE0svd3so
 2M9A==
X-Gm-Message-State: APjAAAU2YYVHdo3htyrsg+cKCk6N0tIVPKZnq/L6NQyHnp4ND4c3Ycgi
 dP2jYDL3zzA6vunQWWIuwws=
X-Google-Smtp-Source: APXvYqxaB9L2RCswOePuUQM+DhSwxpmDjg2nAbPkGip2xWbLOC1BEw2+nSXFh6g4o27B11DrViofsw==
X-Received: by 2002:a62:8f91:: with SMTP id n139mr11570927pfd.48.1565248693830; 
 Thu, 08 Aug 2019 00:18:13 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id w22sm99435168pfi.175.2019.08.08.00.18.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 00:18:13 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] powerpc/mm: Use refcount_t for refcount
Date: Thu,  8 Aug 2019 15:18:08 +0800
Message-Id: <20190808071808.6531-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reference counters are preferred to use refcount_t instead of
atomic_t.
This is because the implementation of refcount_t can prevent
overflows and detect possible use-after-free.
So convert atomic_t ref counters to refcount_t.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 arch/powerpc/mm/book3s64/mmu_context.c | 2 +-
 arch/powerpc/mm/book3s64/pgtable.c     | 7 +++----
 arch/powerpc/mm/pgtable-frag.c         | 9 ++++-----
 include/linux/mm_types.h               | 3 ++-
 4 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index 2d0cb5ba9a47..f836fd5a6abc 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -231,7 +231,7 @@ static void pmd_frag_destroy(void *pmd_frag)
 	/* drop all the pending references */
 	count = ((unsigned long)pmd_frag & ~PAGE_MASK) >> PMD_FRAG_SIZE_SHIFT;
 	/* We allow PTE_FRAG_NR fragments from a PTE page */
-	if (atomic_sub_and_test(PMD_FRAG_NR - count, &page->pt_frag_refcount)) {
+	if (refcount_sub_and_test(PMD_FRAG_NR - count, &page->pt_frag_refcount)) {
 		pgtable_pmd_page_dtor(page);
 		__free_page(page);
 	}
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 7d0e0d0d22c4..40056896ce4e 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -277,7 +277,7 @@ static pmd_t *__alloc_for_pmdcache(struct mm_struct *mm)
 		return NULL;
 	}
 
-	atomic_set(&page->pt_frag_refcount, 1);
+	refcount_set(&page->pt_frag_refcount, 1);
 
 	ret = page_address(page);
 	/*
@@ -294,7 +294,7 @@ static pmd_t *__alloc_for_pmdcache(struct mm_struct *mm)
 	 * count.
 	 */
 	if (likely(!mm->context.pmd_frag)) {
-		atomic_set(&page->pt_frag_refcount, PMD_FRAG_NR);
+		refcount_set(&page->pt_frag_refcount, PMD_FRAG_NR);
 		mm->context.pmd_frag = ret + PMD_FRAG_SIZE;
 	}
 	spin_unlock(&mm->page_table_lock);
@@ -317,8 +317,7 @@ void pmd_fragment_free(unsigned long *pmd)
 {
 	struct page *page = virt_to_page(pmd);
 
-	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
-	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
+	if (refcount_dec_and_test(&page->pt_frag_refcount)) {
 		pgtable_pmd_page_dtor(page);
 		__free_page(page);
 	}
diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
index a7b05214760c..4ef8231b677f 100644
--- a/arch/powerpc/mm/pgtable-frag.c
+++ b/arch/powerpc/mm/pgtable-frag.c
@@ -24,7 +24,7 @@ void pte_frag_destroy(void *pte_frag)
 	/* drop all the pending references */
 	count = ((unsigned long)pte_frag & ~PAGE_MASK) >> PTE_FRAG_SIZE_SHIFT;
 	/* We allow PTE_FRAG_NR fragments from a PTE page */
-	if (atomic_sub_and_test(PTE_FRAG_NR - count, &page->pt_frag_refcount)) {
+	if (refcount_sub_and_test(PTE_FRAG_NR - count, &page->pt_frag_refcount)) {
 		pgtable_page_dtor(page);
 		__free_page(page);
 	}
@@ -71,7 +71,7 @@ static pte_t *__alloc_for_ptecache(struct mm_struct *mm, int kernel)
 			return NULL;
 	}
 
-	atomic_set(&page->pt_frag_refcount, 1);
+	refcount_set(&page->pt_frag_refcount, 1);
 
 	ret = page_address(page);
 	/*
@@ -87,7 +87,7 @@ static pte_t *__alloc_for_ptecache(struct mm_struct *mm, int kernel)
 	 * count.
 	 */
 	if (likely(!pte_frag_get(&mm->context))) {
-		atomic_set(&page->pt_frag_refcount, PTE_FRAG_NR);
+		refcount_set(&page->pt_frag_refcount, PTE_FRAG_NR);
 		pte_frag_set(&mm->context, ret + PTE_FRAG_SIZE);
 	}
 	spin_unlock(&mm->page_table_lock);
@@ -110,8 +110,7 @@ void pte_fragment_free(unsigned long *table, int kernel)
 {
 	struct page *page = virt_to_page(table);
 
-	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
-	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
+	if (refcount_dec_and_test(&page->pt_frag_refcount)) {
 		if (!kernel)
 			pgtable_page_dtor(page);
 		__free_page(page);
diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 3a37a89eb7a7..7fe23a3faf95 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -14,6 +14,7 @@
 #include <linux/uprobes.h>
 #include <linux/page-flags-layout.h>
 #include <linux/workqueue.h>
+#include <linux/refcount.h>
 
 #include <asm/mmu.h>
 
@@ -147,7 +148,7 @@ struct page {
 			unsigned long _pt_pad_2;	/* mapping */
 			union {
 				struct mm_struct *pt_mm; /* x86 pgds only */
-				atomic_t pt_frag_refcount; /* powerpc */
+				refcount_t pt_frag_refcount; /* powerpc */
 			};
 #if ALLOC_SPLIT_PTLOCKS
 			spinlock_t *ptl;
-- 
2.20.1

