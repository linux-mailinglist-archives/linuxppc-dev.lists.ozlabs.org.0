Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFF071443D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 08:22:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QV56P4Xtfz3fGc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 16:22:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=rWUgEbcR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b35; helo=mail-yb1-xb35.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=rWUgEbcR;
	dkim-atps=neutral
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QV55W634dz3bl3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 16:21:35 +1000 (AEST)
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-ba829e17aacso4347338276.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 May 2023 23:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685341293; x=1687933293;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kjV6xBD8+Z39YuH4hgrLfpItULNEjB3if/M/mkAbsVQ=;
        b=rWUgEbcRxN+0lh7aV7n4UOuWoW/akkZOM/gqoHjVcxn/6hheszcuPJOLVJ4sguWyP8
         nkQlUMJmy6e/Jx9YVzvAF7u4UBrtQ7Gt8z6ETj5pN1DYiBGqn6irZMUv2C9TbfCBC78I
         xaCU0qKIPP/XwpIBhRQPgPdjxQJW6d4VJskC/kyJTtslu2euOqK8ik9oIKBYFLT0OWAQ
         hthSfePHY1Fj36lFOt87PpfGm9V25DdJkUjrx5h6k5n/1x83JounXfxF7b0VnDNmT3pg
         /B3jbAdtHb1fjyAf9CqPVGMMMvFfo7sNqLyn5ELpZamilbHqPMk5v4bK33lqW9qB8lmS
         adrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685341293; x=1687933293;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kjV6xBD8+Z39YuH4hgrLfpItULNEjB3if/M/mkAbsVQ=;
        b=ThfcsTzbQu0tBVRp5gGHBD+rYGfkZBtR3NBkZtWcdTtkmw6vZswYc4RdYyzeCsKzlW
         oFxyhS6NxG8409J7Ra7yZaPoabvc9I8lhsCHbj/ZQyq1NmVB6unwamwt5smVZXhBi6GL
         NLBID1n8AxXODSEEINzNbwyezQ0tkHxZA9d2MK5QfWGN2H8zFLFgGTiCm7CPDIXOiFvw
         UGcAvktOPL7HxdKbE5LuPVvpoLkjA2WJEvg/WjmXCBf3nLrj7+2ACzQ2b6pEdOol0lki
         uAmGYA/v5vOucO3GoTjqrah41MgDfQYyuaIhd541lu8JX98YyhiKvJQWt0EoZbMvhCMa
         nvlg==
X-Gm-Message-State: AC+VfDzDnmRSrEbPCQIjs2OgHwAtSL8209ZeEmKzAjlpz8Ppfvonoj8U
	x6/gLSmhOpUV8LaRcFKqACLWHQ==
X-Google-Smtp-Source: ACHHUZ6EPD4pm5LL+EWBEb/p2RZtAUzDMPbUfE7F4FXgHJQ8XYwzEv8l0puT9pEGX6+B6Mzd+dzTzw==
X-Received: by 2002:a25:d796:0:b0:ba8:3e89:bd69 with SMTP id o144-20020a25d796000000b00ba83e89bd69mr9536233ybg.12.1685341292952;
        Sun, 28 May 2023 23:21:32 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id m205-20020a2571d6000000b00ba87bc06fe5sm2712527ybc.52.2023.05.28.23.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 23:21:32 -0700 (PDT)
Date: Sun, 28 May 2023 23:21:27 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 06/12] sparc: add pte_free_defer() for pgtables sharing
 page
In-Reply-To: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
Message-ID: <f8d84fb8-eb9-6649-7137-715c6010468c@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Ca
 rstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add sparc-specific pte_free_defer(), to call pte_free() via call_rcu().
pte_free_defer() will be called inside khugepaged's retract_page_tables()
loop, where allocating extra memory cannot be relied upon.  This precedes
the generic version to avoid build breakage from incompatible pgtable_t.

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
index 04f9db0c3111..b7c6aa085ef6 100644
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
+	__pte_free((pgtable_t)page_to_virt(page));
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

