Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D874772D1A2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 23:08:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NyvAW5xc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qg4674tyMz3bfp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 07:08:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NyvAW5xc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qg42H5rYgz2yKy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 07:04:55 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-651f2f38634so4998932b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jun 2023 14:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686603892; x=1689195892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5BTNYEJrMvEdgPHE9qghL8qlsXVOst+iBLMKLVFrSI=;
        b=NyvAW5xcJ/1RwE9QmSiFJ+QoLspe4N8bc4rT8FqwnwCneI2MtPt+zR2zPpLqApF4NL
         U1okS2jcBv5boWFVjS3ZWFOO57AXCrm8924Yzy4TWhUVvSSQaBnBXCQN1FwgNux+a5wh
         DsFZHudMr3gw7SxF9mDXLpRFyJexdPdYzbIm/1S5JJIGYV9GOI+NthRwDASTis3Fze4p
         V6ixmPm9cBdQ1cAVmEM6h/YPAwNhp4idZwgbxQNshhMy1ADo1GloFQRBJ0Q5sP9FFktv
         iWvvuohJvJZTnnhPK8vd97XGBVPC/qP/sL8+3CeVXYInAaBFtRMw40MKTPvSoWZiFPoO
         gspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686603892; x=1689195892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5BTNYEJrMvEdgPHE9qghL8qlsXVOst+iBLMKLVFrSI=;
        b=a8nit5vAfET0kBN/kh5ROQsgj8u5WAfPnVQclLCyrElbrieZtK8sOmPlWEl0LTMarU
         K5sAAIBMZlDQitRyYu2Ty34r0Za07IQPQQ3Lm1itPaLSa3MwTHAWb7PHwHNSvk9rf2bs
         TrH4bNLaYqHDPXwzfR/emPt+5sPH0oxycu1LWwCTxxBDrlSRrcxK+MrXzc9HS3/GhJM3
         Xy2pIiXWCzNcbW4mS65u8JK455nbhFyVm2XGRTqEqVzOCKWyLYFtwjn9bavp/duQHp7V
         BSREbMXLqfzjAzh3YzvlLv4x44fdsdX7WSC6KdWBrbNLfXzngaTKnJ18IXXdnV2jQZUY
         mFQw==
X-Gm-Message-State: AC+VfDyJijhCmahucoRD83Io/xIJZ3RGP37MeEP1y1VQaXCwSJTN9076
	zkkSlvGwGnpqUR4uRcnhSzE=
X-Google-Smtp-Source: ACHHUZ7txlwQKhNIkJlSWkpy4O9/GHkXq934dfDZR66J7e8THGAZbbGg45zrTEyJTMim3NRAIaYTPA==
X-Received: by 2002:a05:6a20:e617:b0:10c:2349:459e with SMTP id my23-20020a056a20e61700b0010c2349459emr10483492pzb.10.1686603892270;
        Mon, 12 Jun 2023 14:04:52 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s125-20020a817783000000b00569eb609458sm2757115ywc.81.2023.06.12.14.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 14:04:51 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v4 03/34] s390: Use pt_frag_refcount for pagetables
Date: Mon, 12 Jun 2023 14:03:52 -0700
Message-Id: <20230612210423.18611-4-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612210423.18611-1-vishal.moola@gmail.com>
References: <20230612210423.18611-1-vishal.moola@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

