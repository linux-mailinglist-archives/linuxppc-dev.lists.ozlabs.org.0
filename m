Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A73034EB240
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 18:50:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSbCq3Svhz3ccq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 03:50:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bDVd2P4K;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M4T5grVH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=bDVd2P4K; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=M4T5grVH; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KSbBl0cJYz3cFJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 03:49:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648572571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sC+ymRkt7JVDUa+jsWm6tHAksM2n+k+zaIL6QWBa32I=;
 b=bDVd2P4KK/C8/LaZVehMbBOmblGR3nNe2vd7tLQVp4WqSwVwUM/C0lFfZtve5pP6WzApPC
 gbBuh/j7DY3dAMj8ICkiymkVeja5LFZkq7A6C4nuseWAKkSf3HZTRHXDiV0d6dn52ZKCBL
 juhJZgnW+NweKqSBCR09+hOsjU2aUaM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648572572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sC+ymRkt7JVDUa+jsWm6tHAksM2n+k+zaIL6QWBa32I=;
 b=M4T5grVHXRQLIfoQfkgJMKlwEzp/+gu7RVxvUWWq5QShNSAb7AcG3xF6Grcl7aXi4I6ZNF
 IkMHJzw1+fHVEzPqpTlAExl/qXTgSw569WObk6KipdDn9UIFpIAWGHgOI4YswMcJJA9UiP
 QesmmbLu9n5GpHrbB9URgkxcjBNAeP8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-roYzQxbCMv-hrUjMfAj--g-1; Tue, 29 Mar 2022 12:49:29 -0400
X-MC-Unique: roYzQxbCMv-hrUjMfAj--g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5ED81811E9B;
 Tue, 29 Mar 2022 16:49:27 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BA641121314;
 Tue, 29 Mar 2022 16:48:32 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] s390/pgtable: support __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date: Tue, 29 Mar 2022 18:43:27 +0200
Message-Id: <20220329164329.208407-7-david@redhat.com>
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

Let's use bit 52, which is unused.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 arch/s390/include/asm/pgtable.h | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 3982575bb586..a397b072a580 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -181,6 +181,8 @@ static inline int is_module_addr(void *addr)
 #define _PAGE_SOFT_DIRTY 0x000
 #endif
 
+#define _PAGE_SWP_EXCLUSIVE _PAGE_LARGE	/* SW pte exclusive swap bit */
+
 /* Set of bits not changed in pte_modify */
 #define _PAGE_CHG_MASK		(PAGE_MASK | _PAGE_SPECIAL | _PAGE_DIRTY | \
 				 _PAGE_YOUNG | _PAGE_SOFT_DIRTY)
@@ -826,6 +828,22 @@ static inline int pmd_protnone(pmd_t pmd)
 }
 #endif
 
+#define __HAVE_ARCH_PTE_SWP_EXCLUSIVE
+static inline int pte_swp_exclusive(pte_t pte)
+{
+	return pte_val(pte) & _PAGE_SWP_EXCLUSIVE;
+}
+
+static inline pte_t pte_swp_mkexclusive(pte_t pte)
+{
+	return set_pte_bit(pte, __pgprot(_PAGE_SWP_EXCLUSIVE));
+}
+
+static inline pte_t pte_swp_clear_exclusive(pte_t pte)
+{
+	return clear_pte_bit(pte, __pgprot(_PAGE_SWP_EXCLUSIVE));
+}
+
 static inline int pte_soft_dirty(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_SOFT_DIRTY;
@@ -1715,14 +1733,15 @@ static inline int has_transparent_hugepage(void)
  * Bits 54 and 63 are used to indicate the page type. Bit 53 marks the pte
  * as invalid.
  * A swap pte is indicated by bit pattern (pte & 0x201) == 0x200
- * |			  offset			|X11XX|type |S0|
+ * |			  offset			|E11XX|type |S0|
  * |0000000000111111111122222222223333333333444444444455|55555|55566|66|
  * |0123456789012345678901234567890123456789012345678901|23456|78901|23|
  *
  * Bits 0-51 store the offset.
+ * Bit 52 (E) is used to remember PG_anon_exclusive.
  * Bits 57-61 store the type.
  * Bit 62 (S) is used for softdirty tracking.
- * Bits 52, 55 and 56 (X) are unused.
+ * Bits 55 and 56 (X) are unused.
  */
 
 #define __SWP_OFFSET_MASK	((1UL << 52) - 1)
-- 
2.35.1

