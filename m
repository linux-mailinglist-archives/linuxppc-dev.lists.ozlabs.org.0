Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 610094EB227
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 18:48:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSb9f1m8Fz3c7K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 03:48:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a0f++STM;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a0f++STM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=a0f++STM; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=a0f++STM; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSb7j2TWHz2yXf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 03:46:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648572414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qCOLd7ScB3TWjSGdY4CbToIDZJ4hYbd0NeSKJa+Yxms=;
 b=a0f++STMOOv+ZcXg2j47wSQnvZ6anv4Ur4QWloYRXjJ3MWaF8H5Lc6/Vd/83K4B861SCOe
 Y+N0JG0bm7+tCp//T2VOp1IbwE8xHw3I01T+v1adcmWnQn7m7PfDbLiAkJnJ2IiAoud/Al
 pzX+pDJdy7jliqmpgoZYycGaBg5BTi8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648572414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qCOLd7ScB3TWjSGdY4CbToIDZJ4hYbd0NeSKJa+Yxms=;
 b=a0f++STMOOv+ZcXg2j47wSQnvZ6anv4Ur4QWloYRXjJ3MWaF8H5Lc6/Vd/83K4B861SCOe
 Y+N0JG0bm7+tCp//T2VOp1IbwE8xHw3I01T+v1adcmWnQn7m7PfDbLiAkJnJ2IiAoud/Al
 pzX+pDJdy7jliqmpgoZYycGaBg5BTi8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-498-ujdDMkxTNKC-pLfA0LZt3w-1; Tue, 29 Mar 2022 12:46:52 -0400
X-MC-Unique: ujdDMkxTNKC-pLfA0LZt3w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F395D804198;
 Tue, 29 Mar 2022 16:46:49 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8487B111F3B0;
 Tue, 29 Mar 2022 16:46:18 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] x86/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date: Tue, 29 Mar 2022 18:43:24 +0200
Message-Id: <20220329164329.208407-4-david@redhat.com>
In-Reply-To: <20220329164329.208407-1-david@redhat.com>
References: <20220329164329.208407-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
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

Let's use bit 3 to remember PG_anon_exclusive in swap ptes.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/x86/include/asm/pgtable.h       | 16 ++++++++++++++++
 arch/x86/include/asm/pgtable_64.h    |  4 +++-
 arch/x86/include/asm/pgtable_types.h |  5 +++++
 3 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 62ab07e24aef..e42e668153e9 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1292,6 +1292,22 @@ static inline void update_mmu_cache_pud(struct vm_area_struct *vma,
 {
 }
 
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
+static inline pte_t pte_swp_mkexclusive(pte_t pte)
+{
+	return pte_set_flags(pte, _PAGE_SWP_EXCLUSIVE);
+}
+
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return pte_flags(pte) & _PAGE_SWP_EXCLUSIVE;
+}
+
+static inline pte_t pte_swp_clear_exclusive(pte_t pte)
+{
+	return pte_clear_flags(pte, _PAGE_SWP_EXCLUSIVE);
+}
+
 #ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
 static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
 {
diff --git a/arch/x86/include/asm/pgtable_64.h b/arch/x86/include/asm/pgtable_64.h
index 56d0399a0cd1..e479491da8d5 100644
--- a/arch/x86/include/asm/pgtable_64.h
+++ b/arch/x86/include/asm/pgtable_64.h
@@ -186,7 +186,7 @@ static inline void native_pgd_clear(pgd_t *pgd)
  *
  * |     ...            | 11| 10|  9|8|7|6|5| 4| 3|2| 1|0| <- bit number
  * |     ...            |SW3|SW2|SW1|G|L|D|A|CD|WT|U| W|P| <- bit names
- * | TYPE (59-63) | ~OFFSET (9-58)  |0|0|X|X| X| X|F|SD|0| <- swp entry
+ * | TYPE (59-63) | ~OFFSET (9-58)  |0|0|X|X| X| E|F|SD|0| <- swp entry
  *
  * G (8) is aliased and used as a PROT_NONE indicator for
  * !present ptes.  We need to start storing swap entries above
@@ -203,6 +203,8 @@ static inline void native_pgd_clear(pgd_t *pgd)
  * F (2) in swp entry is used to record when a pagetable is
  * writeprotected by userfaultfd WP support.
  *
+ * E (3) in swp entry is used to rememeber PG_anon_exclusive.
+ *
  * Bit 7 in swp entry should be 0 because pmd_present checks not only P,
  * but also L and G.
  *
diff --git a/arch/x86/include/asm/pgtable_types.h b/arch/x86/include/asm/pgtable_types.h
index 40497a9020c6..54a8f370046d 100644
--- a/arch/x86/include/asm/pgtable_types.h
+++ b/arch/x86/include/asm/pgtable_types.h
@@ -83,6 +83,11 @@
 #define _PAGE_SOFT_DIRTY	(_AT(pteval_t, 0))
 #endif
 
+/*
+ * We borrow bit 3 to remember PG_anon_exclusive.
+ */
+#define _PAGE_SWP_EXCLUSIVE	_PAGE_PWT
+
 /*
  * Tracking soft dirty bit when a page goes to a swap is tricky.
  * We need a bit which can be stored in pte _and_ not conflict
-- 
2.35.1

