Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 145B1718CE1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 23:34:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWjG44rjXz3fmT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 07:34:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZOrjRpzt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ZOrjRpzt;
	dkim-atps=neutral
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWjBG0K21z3fDN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 07:31:17 +1000 (AEST)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5659d85876dso731437b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 14:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568676; x=1688160676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5BTNYEJrMvEdgPHE9qghL8qlsXVOst+iBLMKLVFrSI=;
        b=ZOrjRpztCykn5S2UQynBNzBa3MWmWRXtFOidHPb8ljWg9idLGbr9+vMldhGKYgTruN
         1934LTH9c2Wh9xXG+tZ6quTSzUJuhszO9LCf/AYBJsPXuQjHo4TfwO3yqkVoV4JnI7mh
         lK7Zjtt0YSLV9vHzTQP3W+nJ0auBkrTwfRrAwKmblLPqRjLTgj5BxN/zgR0xbn+upf0o
         apfiugG50HJ8VEu2RIDT+46U7OJf8q3uoGBfoRDouzvlyJiG8pcaDr4mVE+vzfndDM01
         /Jv+1rxOJiA9ppMDbAjm8+j8FmFsNys3enhgZaJmy9pp0lvroiQaVp9oa4sPbWaYs1n7
         Zxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568676; x=1688160676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5BTNYEJrMvEdgPHE9qghL8qlsXVOst+iBLMKLVFrSI=;
        b=KIDyXQnLxLgZhBIN1+glkia96bavQ3nD0kMjCMOhLp+M72hvYSvJDw6OvvbfC6OFBD
         74Rj4LtJbxRkxG/CbdSMbohrCu9AB+qeTdPU+Zy9XbW+kHG+HeDhmA5cOeI2+pLXWwtm
         u7iRwChIlOZ22LWTk+HHCEgxDfXF266L6ST3w4bvMozER8VsuydQeHss5FekuzH+Vk/q
         V0tJyBxPrcoqXOQQ8ehCQsqFqSVbcSz+dLkkGGVbikRCm5XLLpSGKIoKMbcy9c69cWTh
         l7aSJVpTMW+2vSFZtf2xosbCyY1h/PVvZQXOCAaaXCqhiCGxuF0HHcU3X/82tt+k8Psh
         OTtA==
X-Gm-Message-State: AC+VfDwCEuPpXBd7RbA5qmqNvLiLf4+ZT3HtcYIKxxetx+yz3FcigD0p
	Y0MEOO6hN3KaZJgBwmFTfOg=
X-Google-Smtp-Source: ACHHUZ7A4AW0g1EJo54eGQeBH+bfqFv0MB7wzzUtb0w1cODVt+jOCsqaj2lzyysVEFaa+9MnJMXYag==
X-Received: by 2002:a0d:df81:0:b0:561:bd01:9ff with SMTP id i123-20020a0ddf81000000b00561bd0109ffmr7412356ywe.28.1685568675532;
        Wed, 31 May 2023 14:31:15 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
        by smtp.googlemail.com with ESMTPSA id t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 14:31:15 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v3 03/34] s390: Use pt_frag_refcount for pagetables
Date: Wed, 31 May 2023 14:30:01 -0700
Message-Id: <20230531213032.25338-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

s390 currently uses _refcount to identify fragmented page tables.
The page table struct already has a member pt_frag_refcount used by
powerpc, so have s390 use that instead of the _refcount field as well.
This improves the safety for _refcount and the page table tracking.

This also allows us to simplify the tracking since we can once again use
the lower byte of pt_frag_refcount instead of the upper byte of _refcount.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/s390/mm/pgalloc.c | 38 +++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 66ab68db9842..6b99932abc66 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -182,20 +182,17 @@ void page_table_free_pgste(struct page *page)
  * As follows from the above, no unallocated or fully allocated parent
  * pages are contained in mm_context_t::pgtable_list.
  *
- * The upper byte (bits 24-31) of the parent page _refcount is used
+ * The lower byte (bits 0-7) of the parent page pt_frag_refcount is used
  * for tracking contained 2KB-pgtables and has the following format:
  *
  *   PP  AA
- * 01234567    upper byte (bits 24-31) of struct page::_refcount
+ * 01234567    upper byte (bits 0-7) of struct page::pt_frag_refcount
  *   ||  ||
  *   ||  |+--- upper 2KB-pgtable is allocated
  *   ||  +---- lower 2KB-pgtable is allocated
  *   |+------- upper 2KB-pgtable is pending for removal
  *   +-------- lower 2KB-pgtable is pending for removal
  *
- * (See commit 620b4e903179 ("s390: use _refcount for pgtables") on why
- * using _refcount is possible).
- *
  * When 2KB-pgtable is allocated the corresponding AA bit is set to 1.
  * The parent page is either:
  *   - added to mm_context_t::pgtable_list in case the second half of the
@@ -243,11 +240,12 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 		if (!list_empty(&mm->context.pgtable_list)) {
 			page = list_first_entry(&mm->context.pgtable_list,
 						struct page, lru);
-			mask = atomic_read(&page->_refcount) >> 24;
+			mask = atomic_read(&page->pt_frag_refcount);
 			/*
 			 * The pending removal bits must also be checked.
 			 * Failure to do so might lead to an impossible
-			 * value of (i.e 0x13 or 0x23) written to _refcount.
+			 * value of (i.e 0x13 or 0x23) written to
+			 * pt_frag_refcount.
 			 * Such values violate the assumption that pending and
 			 * allocation bits are mutually exclusive, and the rest
 			 * of the code unrails as result. That could lead to
@@ -259,8 +257,8 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 				bit = mask & 1;		/* =1 -> second 2K */
 				if (bit)
 					table += PTRS_PER_PTE;
-				atomic_xor_bits(&page->_refcount,
-							0x01U << (bit + 24));
+				atomic_xor_bits(&page->pt_frag_refcount,
+							0x01U << bit);
 				list_del(&page->lru);
 			}
 		}
@@ -281,12 +279,12 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 	table = (unsigned long *) page_to_virt(page);
 	if (mm_alloc_pgste(mm)) {
 		/* Return 4K page table with PGSTEs */
-		atomic_xor_bits(&page->_refcount, 0x03U << 24);
+		atomic_xor_bits(&page->pt_frag_refcount, 0x03U);
 		memset64((u64 *)table, _PAGE_INVALID, PTRS_PER_PTE);
 		memset64((u64 *)table + PTRS_PER_PTE, 0, PTRS_PER_PTE);
 	} else {
 		/* Return the first 2K fragment of the page */
-		atomic_xor_bits(&page->_refcount, 0x01U << 24);
+		atomic_xor_bits(&page->pt_frag_refcount, 0x01U);
 		memset64((u64 *)table, _PAGE_INVALID, 2 * PTRS_PER_PTE);
 		spin_lock_bh(&mm->context.lock);
 		list_add(&page->lru, &mm->context.pgtable_list);
@@ -323,22 +321,19 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
 		 * will happen outside of the critical section from this
 		 * function or from __tlb_remove_table()
 		 */
-		mask = atomic_xor_bits(&page->_refcount, 0x11U << (bit + 24));
-		mask >>= 24;
+		mask = atomic_xor_bits(&page->pt_frag_refcount, 0x11U << bit);
 		if (mask & 0x03U)
 			list_add(&page->lru, &mm->context.pgtable_list);
 		else
 			list_del(&page->lru);
 		spin_unlock_bh(&mm->context.lock);
-		mask = atomic_xor_bits(&page->_refcount, 0x10U << (bit + 24));
-		mask >>= 24;
+		mask = atomic_xor_bits(&page->pt_frag_refcount, 0x10U << bit);
 		if (mask != 0x00U)
 			return;
 		half = 0x01U << bit;
 	} else {
 		half = 0x03U;
-		mask = atomic_xor_bits(&page->_refcount, 0x03U << 24);
-		mask >>= 24;
+		mask = atomic_xor_bits(&page->pt_frag_refcount, 0x03U);
 	}
 
 	page_table_release_check(page, table, half, mask);
@@ -368,8 +363,7 @@ void page_table_free_rcu(struct mmu_gather *tlb, unsigned long *table,
 	 * outside of the critical section from __tlb_remove_table() or from
 	 * page_table_free()
 	 */
-	mask = atomic_xor_bits(&page->_refcount, 0x11U << (bit + 24));
-	mask >>= 24;
+	mask = atomic_xor_bits(&page->pt_frag_refcount, 0x11U << bit);
 	if (mask & 0x03U)
 		list_add_tail(&page->lru, &mm->context.pgtable_list);
 	else
@@ -391,14 +385,12 @@ void __tlb_remove_table(void *_table)
 		return;
 	case 0x01U:	/* lower 2K of a 4K page table */
 	case 0x02U:	/* higher 2K of a 4K page table */
-		mask = atomic_xor_bits(&page->_refcount, mask << (4 + 24));
-		mask >>= 24;
+		mask = atomic_xor_bits(&page->pt_frag_refcount, mask << 4);
 		if (mask != 0x00U)
 			return;
 		break;
 	case 0x03U:	/* 4K page table with pgstes */
-		mask = atomic_xor_bits(&page->_refcount, 0x03U << 24);
-		mask >>= 24;
+		mask = atomic_xor_bits(&page->pt_frag_refcount, 0x03U);
 		break;
 	}
 
-- 
2.40.1

