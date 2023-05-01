Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8D86F3818
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 May 2023 21:31:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q9CyK2cmwz3fPX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 May 2023 05:31:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=B4azYqsU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=vishal.moola@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=B4azYqsU;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q9Ctd1Fxgz3bh3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 May 2023 05:28:40 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1aaf21bb427so10619545ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 May 2023 12:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969319; x=1685561319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmbsS8DkaHNij/v9bdafzBlktB7f+f7NAeK2Q02GvbI=;
        b=B4azYqsU+PZdNT5sPYRuRynEP/yG+nnQZzCwWNiJuBYZMp7zK7WPiFNkyYATyiWLs9
         KXu3O4UXjROzHmg5BH+SgHHBIK4HaE73RnqEPc9ZoVRSl4Uh4CCXlTE9MpnCo1Ir9cR5
         1tT0IRumxWPV12suNOkG+VwHWOIH3Na7v0j8RESqGnAScgYPrOMUDDIHfUYdpmcQFIY7
         vF1i0igsbLRBnZPi2HEPlzfFt+R0Rd+c2dVX9RoHx/GLiWbMDfrtbVlk0iN4TeEGJT4d
         1bO8trvKRg+pq0Q4NgCg3JPagFS7MkJj/4qfBc8P2r4TUch12xgUcUg4F69rFfadNKuw
         8vIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969319; x=1685561319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmbsS8DkaHNij/v9bdafzBlktB7f+f7NAeK2Q02GvbI=;
        b=buvpCj/wc/e+rOScgx4AcR67k4D3VF/EGs20BzipugFrEEEauE/hSVREL80iKjPBdx
         KwuKYQMc84cUQaYZPrGqMuKbzB+oDUbnYUM0cc5lOwtw0IkV4tjydppNXGGbyFjDfe/S
         UCUJeWyb+U2hhcTwQytrWsXgdRMyWtixY8ilSu7jZIiyCWadovOXX97SwnTUplXAgKMB
         I1L9C/B8WxUly0DO06H0z3Ar6XOihoXzglUVE3KoLmzj7i1KHDjEabJm4OAyhcLThTE9
         WBLAMgZs7diRoHyREEi/wGo0fOVjvXPw1/cXfwmB56ncZ3v61nfku5hcc4EluhGfXFW/
         reyQ==
X-Gm-Message-State: AC+VfDxPtDb12eErGB2yLv/2FDwZ5WFMtxczhrHLC//HAZxeuLwx7o9z
	wrCYeu3klnR8djfPR0VSsCg=
X-Google-Smtp-Source: ACHHUZ4E/JVh2DFvUW/bEZgIHPiMJ+Zfpw7pvXWZYNeWA42FHZxnOhQrWiIO3kxV0xxzCmUatMgqYw==
X-Received: by 2002:a17:902:8c91:b0:1a9:2b7f:a594 with SMTP id t17-20020a1709028c9100b001a92b7fa594mr13894676plo.29.1682969318714;
        Mon, 01 May 2023 12:28:38 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
        by smtp.googlemail.com with ESMTPSA id u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 12:28:38 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v2 03/34] s390: Use pt_frag_refcount for pagetables
Date: Mon,  1 May 2023 12:27:58 -0700
Message-Id: <20230501192829.17086-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
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
2.39.2

