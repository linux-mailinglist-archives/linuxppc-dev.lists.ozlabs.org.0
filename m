Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B05D24D9D66
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 15:23:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHwcd41RQz3ccr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 01:23:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ieC7f8sl;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ieC7f8sl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ieC7f8sl; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ieC7f8sl; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHwXJ4f7kz3bWl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 01:19:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647353982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bMfZOVQVS5I2zZPcY9Fdh37ujSfx4fPUK1QRVEaCA5k=;
 b=ieC7f8slgsXCRAjSx2/5h2ZrF945fFKRRwAOqzEOQVLGVUjwDNoHrX+4EyhlgiBLj9yMTb
 h8wMIXyMYmCpS6QjyKMeExcbT5sEwnv1Q0/X4TSx1VgiIYanL8fLYNVLE3DskE8G191gwi
 8vzfg2pJ4dm7fIcxtnvAUNRHLLPUmiM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647353982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bMfZOVQVS5I2zZPcY9Fdh37ujSfx4fPUK1QRVEaCA5k=;
 b=ieC7f8slgsXCRAjSx2/5h2ZrF945fFKRRwAOqzEOQVLGVUjwDNoHrX+4EyhlgiBLj9yMTb
 h8wMIXyMYmCpS6QjyKMeExcbT5sEwnv1Q0/X4TSx1VgiIYanL8fLYNVLE3DskE8G191gwi
 8vzfg2pJ4dm7fIcxtnvAUNRHLLPUmiM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-641-AZN94ZEqNGCaFqi4fTYG_g-1; Tue, 15 Mar 2022 10:19:40 -0400
X-MC-Unique: AZN94ZEqNGCaFqi4fTYG_g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B9EF18E0043;
 Tue, 15 Mar 2022 14:19:38 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6428240F9D53;
 Tue, 15 Mar 2022 14:19:30 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/7] powerpc/pgtable: remove _PAGE_BIT_SWAP_TYPE for book3s
Date: Tue, 15 Mar 2022 15:18:36 +0100
Message-Id: <20220315141837.137118-7-david@redhat.com>
In-Reply-To: <20220315141837.137118-1-david@redhat.com>
References: <20220315141837.137118-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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
Cc: x86@kernel.org, Jan Kara <jack@suse.cz>,
 David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Donald Dutile <ddutile@redhat.com>, Liang Zhang <zhangliang5@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Paul Mackerras <paulus@samba.org>, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Rik van Riel <riel@surriel.com>, Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, David Rientjes <rientjes@google.com>,
 Pedro Gomes <pedrodemargomes@gmail.com>, Jann Horn <jannh@google.com>,
 John Hubbard <jhubbard@nvidia.com>, Heiko Carstens <hca@linux.ibm.com>,
 Shakeel Butt <shakeelb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Oded Gabbay <oded.gabbay@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Oleg Nesterov <oleg@redhat.com>,
 Nadav Amit <namit@vmware.com>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The swap type is simply stored in bits 0x1f of the swap pte. Let's
simplify by just getting rid of _PAGE_BIT_SWAP_TYPE. It's not like that
we can simply change it: _PAGE_SWP_SOFT_DIRTY would suddenly fall into
_RPAGE_RSV1, which isn't possible and would make the
BUILD_BUG_ON(_PAGE_HPTEFLAGS & _PAGE_SWP_SOFT_DIRTY) angry.

While at it, make it clearer which bit we're actually using for
_PAGE_SWP_SOFT_DIRTY by just using the proper define and introduce and
use SWP_TYPE_MASK.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 875730d5af40..8e98375d5c4a 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -13,7 +13,6 @@
 /*
  * Common bits between hash and Radix page table
  */
-#define _PAGE_BIT_SWAP_TYPE	0
 
 #define _PAGE_EXEC		0x00001 /* execute permission */
 #define _PAGE_WRITE		0x00002 /* write access allowed */
@@ -751,17 +750,16 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 	 * Don't have overlapping bits with _PAGE_HPTEFLAGS	\
 	 * We filter HPTEFLAGS on set_pte.			\
 	 */							\
-	BUILD_BUG_ON(_PAGE_HPTEFLAGS & (0x1f << _PAGE_BIT_SWAP_TYPE)); \
+	BUILD_BUG_ON(_PAGE_HPTEFLAGS & SWP_TYPE_MASK); \
 	BUILD_BUG_ON(_PAGE_HPTEFLAGS & _PAGE_SWP_SOFT_DIRTY);	\
 	} while (0)
 
 #define SWP_TYPE_BITS 5
-#define __swp_type(x)		(((x).val >> _PAGE_BIT_SWAP_TYPE) \
-				& ((1UL << SWP_TYPE_BITS) - 1))
+#define SWP_TYPE_MASK		((1UL << SWP_TYPE_BITS) - 1)
+#define __swp_type(x)		((x).val & SWP_TYPE_MASK)
 #define __swp_offset(x)		(((x).val & PTE_RPN_MASK) >> PAGE_SHIFT)
 #define __swp_entry(type, offset)	((swp_entry_t) { \
-				((type) << _PAGE_BIT_SWAP_TYPE) \
-				| (((offset) << PAGE_SHIFT) & PTE_RPN_MASK)})
+				(type) | (((offset) << PAGE_SHIFT) & PTE_RPN_MASK)})
 /*
  * swp_entry_t must be independent of pte bits. We build a swp_entry_t from
  * swap type and offset we get from swap and convert that to pte to find a
@@ -774,7 +772,7 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 #define __swp_entry_to_pmd(x)	(pte_pmd(__swp_entry_to_pte(x)))
 
 #ifdef CONFIG_MEM_SOFT_DIRTY
-#define _PAGE_SWP_SOFT_DIRTY   (1UL << (SWP_TYPE_BITS + _PAGE_BIT_SWAP_TYPE))
+#define _PAGE_SWP_SOFT_DIRTY	_PAGE_NON_IDEMPOTENT
 #else
 #define _PAGE_SWP_SOFT_DIRTY	0UL
 #endif /* CONFIG_MEM_SOFT_DIRTY */
-- 
2.35.1

