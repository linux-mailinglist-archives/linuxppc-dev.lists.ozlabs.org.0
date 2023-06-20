Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC50736541
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 09:50:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Wlyhpqj5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qlf2C1WDPz3bZ1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jun 2023 17:50:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Wlyhpqj5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qlf130qbGz3bVf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 17:49:42 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-5704fce0f23so47448417b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jun 2023 00:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687247379; x=1689839379;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JyT8tmsQKzrYxiMI/rVOY2yPaVbA/RNeIBfphNdBMF4=;
        b=Wlyhpqj5qzfuvutrjOa/4V6PuPsDCDOgWHtSW/4kwbuOkurc1q0KurhYLqHW1JVDng
         ocfjumMCL+5VTdlkv6JFAWzHFSaf/DQcTveKuW/F1nUw+Sj6E3jgL+8I+UQrrKTcSspC
         zGEBBcceErIi3jvfUdE8XIwgkG18lQEbl2V2HS4GGiBXkvY4t9/NkaOVpMEahcggUUzl
         u8oefzeOOrLLnM3RkTGo6WsoKQCjwWkScujGOaUdyRth+pzrlMusEw0XYP/BcTSABeYV
         rleoq5m+PuifcHOelghsbpsP6kubTOIzWI9OP98uqMngj6OJlbnVDdZn1qt2293RkTnb
         aaaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687247379; x=1689839379;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JyT8tmsQKzrYxiMI/rVOY2yPaVbA/RNeIBfphNdBMF4=;
        b=bzM34/KVtorxTnYx6sr66MrtPxJ5+HLUA4L9gj1lK8Uy0ODEg1mvpdXO0tlynDT7vr
         0hQ2tENAEwZWXgKL33SJlC6AOsfC7QkFD5qbG5tFJZq9c0ixggWK4zt1I0qlQNNC5zrI
         ZHI9BIQr03ASKno4UyVXZr5ZXnguRfJsKHW8PwMRF9ODSvPAMg2GXjj9PEMukLhFgvGc
         cVaYV9piSDNw4jwogFBSfWpEF+Y9WvYUwXyx9zQ8A6fAwVqesxCnNpIRE5AyHl8dWKnc
         uYCJDVu4Caazchqr5bCorBLeHCoTE9jlwol3J1RgbS3ywYQLbs3nqX0Tgkc2y8k77ZAq
         FnKg==
X-Gm-Message-State: AC+VfDxt+aYLm5YBQtz65GfmsCpGIIBo1l4n6lRZqAQE1wXRO/GqpgIl
	JK3I1rpIBmw0GzLzzfjjP/VDhw==
X-Google-Smtp-Source: ACHHUZ5+IOPW+qBQbjfJiBwfK7g3HrB1Jv9bM1vDxBV2sAeLMGBBrGsscHleOg916F+4k1/7bPeS5w==
X-Received: by 2002:a81:8311:0:b0:568:d63e:dd2c with SMTP id t17-20020a818311000000b00568d63edd2cmr10308263ywf.11.1687247379257;
        Tue, 20 Jun 2023 00:49:39 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id o17-20020a0dcc11000000b005702597583fsm381836ywd.26.2023.06.20.00.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 00:49:38 -0700 (PDT)
Date: Tue, 20 Jun 2023 00:49:34 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 06/12] sparc: add pte_free_defer() for pte_t *pgtable_t
In-Reply-To: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
Message-ID: <cb3feef8-f49e-7a54-a6d6-2e9b188f7564@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add sparc-specific pte_free_defer(), to call pte_free() via call_rcu().
pte_free_defer() will be called inside khugepaged's retract_page_tables()
loop, where allocating extra memory cannot be relied upon.  This precedes
the generic version to avoid build breakage from incompatible pgtable_t.

sparc32 supports pagetables sharing a page, but does not support THP;
sparc64 supports THP, but does not support pagetables sharing a page.
So the sparc-specific pte_free_defer() is as simple as the generic one,
except for converting between pte_t *pgtable_t and struct page *.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/sparc/include/asm/pgalloc_64.h |  4 ++++
 arch/sparc/mm/init_64.c             | 16 ++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/sparc/include/asm/pgalloc_64.h b/arch/sparc/include/asm/pgalloc_64.h
index 7b5561d17ab1..caa7632be4c2 100644
--- a/arch/sparc/include/asm/pgalloc_64.h
+++ b/arch/sparc/include/asm/pgalloc_64.h
@@ -65,6 +65,10 @@ pgtable_t pte_alloc_one(struct mm_struct *mm);
 void pte_free_kernel(struct mm_struct *mm, pte_t *pte);
 void pte_free(struct mm_struct *mm, pgtable_t ptepage);
 
+/* arch use pte_free_defer() implementation in arch/sparc/mm/init_64.c */
+#define pte_free_defer pte_free_defer
+void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
+
 #define pmd_populate_kernel(MM, PMD, PTE)	pmd_set(MM, PMD, PTE)
 #define pmd_populate(MM, PMD, PTE)		pmd_set(MM, PMD, PTE)
 
diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
index 04f9db0c3111..0d7fd793924c 100644
--- a/arch/sparc/mm/init_64.c
+++ b/arch/sparc/mm/init_64.c
@@ -2930,6 +2930,22 @@ void pgtable_free(void *table, bool is_page)
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static void pte_free_now(struct rcu_head *head)
+{
+	struct page *page;
+
+	page = container_of(head, struct page, rcu_head);
+	__pte_free((pgtable_t)page_address(page));
+}
+
+void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
+{
+	struct page *page;
+
+	page = virt_to_page(pgtable);
+	call_rcu(&page->rcu_head, pte_free_now);
+}
+
 void update_mmu_cache_pmd(struct vm_area_struct *vma, unsigned long addr,
 			  pmd_t *pmd)
 {
-- 
2.35.3

