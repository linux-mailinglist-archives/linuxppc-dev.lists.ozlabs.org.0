Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F96714434
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 08:21:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QV5535w0wz3fBQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 May 2023 16:21:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=lDd5t1DN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=lDd5t1DN;
	dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QV54D5wMwz3bl3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 May 2023 16:20:28 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-bab8f66d3a2so4378046276.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 May 2023 23:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685341226; x=1687933226;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=osELeF1qrpmk7tMBwVJZ0+Hn0dD614B/zeb//sVH2O8=;
        b=lDd5t1DNHYrERHggJZt1tFe/2MuojYDB8DYuX4saUcSsWZjN9TJvB4D3jOc40ZJzuw
         KXTyU64u/loqgfjTny6vyEEHc7I3ap+5KBFfNEbc+et5E0P2BRIz5MO59vg+RyUV5HGF
         LQIvE8HoWeX7dfHrfHrThINSr2Jkgw1dNwKUT5ElKyxmqFpo9JxBWX275kcmdKdX3BCO
         TKmGDZP/FC8QUdgVXd4u26ydd2mkiG9rdEZxkd6dJlJez+Ye+8eFZqq1OHv/Cc+ig/ka
         6L20gyN+7z7wp1ikvxHZmZH1RAvGKKb0++xvnFOn6a1yNDE6E2enDzRJirlL0XfSo/Zh
         2JMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685341226; x=1687933226;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=osELeF1qrpmk7tMBwVJZ0+Hn0dD614B/zeb//sVH2O8=;
        b=eeU1VttmzGQtaJDVbq1hqdzgCGzislzF6cFSHpuT8fFYOU1jsAhesFaYjE9v0qyil1
         9NC8xwyOjIF7BGE+MTs+znmtsTFDtK1PKfHoC0L0AIYsEvpNEXQ9xp4Embm0I4gmPH6d
         Tb8VUZal3DHgrigrNh6M3hZqqzMZyU+7TNEYWHNTm64vbhYFFWPvzDy4OItlMvQvh0Li
         0R5T+GBgKLB8AIHFtSazIySja8W6kTqxhLJYXrfl0qO+rE5n3NyK8RrWWZD0Am/XrAVk
         ANSwyAQIBNOa9icTFFUq21XgGTZM51OcNQHzS0WZuOyZETR8jsSMj8vplXvws5Sa0wkF
         Y9KQ==
X-Gm-Message-State: AC+VfDyni5XQX4q4mbVHK9nKklLiEPKKsP1zYqKJGXB0qUJZuvKuIFSF
	ysXDaZfBuHAeCCdAyyjpDN2DOg==
X-Google-Smtp-Source: ACHHUZ5aMde8BUNH3d96u3IOrLaqOFrYAlrmuVUlWt4ugn0e7ueCBkueldmdmxLB7UIM6n20FuWD7w==
X-Received: by 2002:a81:8304:0:b0:565:c888:1d09 with SMTP id t4-20020a818304000000b00565c8881d09mr8471629ywf.30.1685341226458;
        Sun, 28 May 2023 23:20:26 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id y184-20020a0dd6c1000000b00565e57e6662sm1530559ywd.55.2023.05.28.23.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 May 2023 23:20:25 -0700 (PDT)
Date: Sun, 28 May 2023 23:20:21 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 05/12] powerpc: add pte_free_defer() for pgtables sharing
 page
In-Reply-To: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
Message-ID: <28eb289f-ea2c-8eb9-63bb-9f7d7b9ccc11@google.com>
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

Add powerpc-specific pte_free_defer(), to call pte_free() via call_rcu().
pte_free_defer() will be called inside khugepaged's retract_page_tables()
loop, where allocating extra memory cannot be relied upon.  This precedes
the generic version to avoid build breakage from incompatible pgtable_t.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/powerpc/include/asm/pgalloc.h |  4 ++++
 arch/powerpc/mm/pgtable-frag.c     | 18 ++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/powerpc/include/asm/pgalloc.h b/arch/powerpc/include/asm/pgalloc.h
index 3360cad78ace..3a971e2a8c73 100644
--- a/arch/powerpc/include/asm/pgalloc.h
+++ b/arch/powerpc/include/asm/pgalloc.h
@@ -45,6 +45,10 @@ static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
 	pte_fragment_free((unsigned long *)ptepage, 0);
 }
 
+/* arch use pte_free_defer() implementation in arch/powerpc/mm/pgtable-frag.c */
+#define pte_free_defer pte_free_defer
+void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
+
 /*
  * Functions that deal with pagetables that could be at any level of
  * the table need to be passed an "index_size" so they know how to
diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
index 20652daa1d7e..3a3dac77faf2 100644
--- a/arch/powerpc/mm/pgtable-frag.c
+++ b/arch/powerpc/mm/pgtable-frag.c
@@ -120,3 +120,21 @@ void pte_fragment_free(unsigned long *table, int kernel)
 		__free_page(page);
 	}
 }
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+static void pte_free_now(struct rcu_head *head)
+{
+	struct page *page;
+
+	page = container_of(head, struct page, rcu_head);
+	pte_fragment_free((unsigned long *)page_to_virt(page), 0);
+}
+
+void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
+{
+	struct page *page;
+
+	page = virt_to_page(pgtable);
+	call_rcu(&page->rcu_head, pte_free_now);
+}
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
-- 
2.35.3

