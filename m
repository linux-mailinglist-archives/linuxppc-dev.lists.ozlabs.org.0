Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 752984D9D57
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 15:20:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHwYh2br8z3bbY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Mar 2022 01:20:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CpF/XLcQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CpF/XLcQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=CpF/XLcQ; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=CpF/XLcQ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHwWj0Shgz30Md
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Mar 2022 01:19:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647353950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jc+cEdEl7LGBIs1sXVyEIKh1m/fhthwqXZBcWFtK9j4=;
 b=CpF/XLcQRMLHjTfpTcANKJLp9uuA9p0224UiRBMBJHesdLBr3iEIrUsB8zTPiCuAt/dy9a
 M0wbVHHFtf4cxnDvUiRH7Hm2fc/vC3xw+VZEwxfQ3mZeRnXI0nuyKYPiheg13B/zEm15wX
 RF4mvFvT6jlit69kDSFWhavHt1zXT9U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647353950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jc+cEdEl7LGBIs1sXVyEIKh1m/fhthwqXZBcWFtK9j4=;
 b=CpF/XLcQRMLHjTfpTcANKJLp9uuA9p0224UiRBMBJHesdLBr3iEIrUsB8zTPiCuAt/dy9a
 M0wbVHHFtf4cxnDvUiRH7Hm2fc/vC3xw+VZEwxfQ3mZeRnXI0nuyKYPiheg13B/zEm15wX
 RF4mvFvT6jlit69kDSFWhavHt1zXT9U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-Ld5KWDtUPEq6XKGoMZ7Gdw-1; Tue, 15 Mar 2022 10:19:07 -0400
X-MC-Unique: Ld5KWDtUPEq6XKGoMZ7Gdw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 293F038008A2;
 Tue, 15 Mar 2022 14:19:05 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23B234087D7E;
 Tue, 15 Mar 2022 14:18:58 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/7] mm/debug_vm_pgtable: add tests for
 __HAVE_ARCH_PTE_SWP_EXCLUSIVE
Date: Tue, 15 Mar 2022 15:18:32 +0100
Message-Id: <20220315141837.137118-3-david@redhat.com>
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

Let's test that __HAVE_ARCH_PTE_SWP_EXCLUSIVE works as expected.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/debug_vm_pgtable.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index db2abd9e415b..55f1a8dc716f 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -837,6 +837,19 @@ static void __init pmd_soft_dirty_tests(struct pgtable_debug_args *args) { }
 static void __init pmd_swap_soft_dirty_tests(struct pgtable_debug_args *args) { }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+static void __init pte_swap_exclusive_tests(struct pgtable_debug_args *args)
+{
+#ifdef __HAVE_ARCH_PTE_SWP_EXCLUSIVE
+	pte_t pte = pfn_pte(args->fixed_pte_pfn, args->page_prot);
+
+	pr_debug("Validating PTE swap exclusive\n");
+	pte = pte_swp_mkexclusive(pte);
+	WARN_ON(!pte_swp_exclusive(pte));
+	pte = pte_swp_clear_exclusive(pte);
+	WARN_ON(pte_swp_exclusive(pte));
+#endif /* __HAVE_ARCH_PTE_SWP_EXCLUSIVE */
+}
+
 static void __init pte_swap_tests(struct pgtable_debug_args *args)
 {
 	swp_entry_t swp;
@@ -1288,6 +1301,8 @@ static int __init debug_vm_pgtable(void)
 	pte_swap_soft_dirty_tests(&args);
 	pmd_swap_soft_dirty_tests(&args);
 
+	pte_swap_exclusive_tests(&args);
+
 	pte_swap_tests(&args);
 	pmd_swap_tests(&args);
 
-- 
2.35.1

