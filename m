Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 605E875E58B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 00:30:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=HldvRjk0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R8J051gBwz3bTk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jul 2023 08:30:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=HldvRjk0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R8Hz95Pftz2yTt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jul 2023 08:29:41 +1000 (AEST)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3a44fae863fso2522712b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jul 2023 15:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1690151378; x=1690756178;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=sNTpJwF6903WETZaUR6RqWiM1FUDiqrdqTK5pWkvOlI=;
        b=HldvRjk0ys92jdNfeVWBvFtU170B3Sgl14twuVgU3PfgDSaDoMcHUhPaz6AeMDu2ht
         Uif+LfgB6gTAkrapwLoFohouFxezysGIwMIbWr79XgdEZv9T4Ta9JcXZ/xBgIhza5Wp6
         fGeIcGxiljkQ3KbjHflb2DqW6Ps1SdtwHA/t4H1ct7WpWFLF6Bv/l70pxlcxn5R0BUKr
         Iazbm5RkEcD8IGB87s3PXGfBT5AeBhyzBinqvCJhTdPqY/jJZS+FqXmJovfCB0tAmiod
         IWq1u2IAT6X27nS6190Pq6YJ8Hg+nIaVyTtHCpJcN+Q3aXVeneJaex1eWhS9PdC4bSB8
         ACrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690151378; x=1690756178;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sNTpJwF6903WETZaUR6RqWiM1FUDiqrdqTK5pWkvOlI=;
        b=Orc9SeV6jdtN3CBWNv3O6U3XEAtEtidVUtcBhvlWgswqbi2QpO5hRLMADcZHwlqpxJ
         fYM1dd1fpacWfvbDLBkfe6V/ywfNTKrX4EkLeleyAneIfsnLtnnFueI97L7C/Mw86gnj
         JtNrR54mB12qZhOYE4jC8H8+VoT+3fbEyW3yVbeDys9R0d1SaLFrL6n8Ig1kvghesThL
         GAe6hkKLZTD9g6u4EY23vPT27pNycwR7JP955y0mt8ANylqn8Nrd6XWQD7WCH/5gSIya
         hmEdjeyoUn1uhZpmfAlSkniiSPMv9Ic7ep+CITd2BamCbzDQ1ibDENJGUxH4q4U3Gnpx
         uAPQ==
X-Gm-Message-State: ABy/qLbCKdyu0LxjdbCdF/8ojXtu++DCCpmCzKQUz2LFVYCShkKKejvS
	Ny2K8yqqoik76aamTNM7gp9P+g==
X-Google-Smtp-Source: APBJJlGCOgtzl5Q2J86M2vQtJN89EUt0E/aCdYP/U+IucyQfogqdSTRUg5XhtlxwoMDwEEOnXDkYbw==
X-Received: by 2002:a05:6808:1b2b:b0:3a4:31ee:da6a with SMTP id bx43-20020a0568081b2b00b003a431eeda6amr7828406oib.55.1690151378127;
        Sun, 23 Jul 2023 15:29:38 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id o5-20020a05680803c500b003a41484b23dsm3509589oie.46.2023.07.23.15.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jul 2023 15:29:37 -0700 (PDT)
Date: Sun, 23 Jul 2023 15:29:32 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 07/13 fix] s390: add pte_free_defer() for pgtables sharing
 page: fix
In-Reply-To: <20230719162506.235856eb@p-imbrenda>
Message-ID: <3bc095ba-a180-ce3b-82b1-2bfc64612f3@google.com>
References: <7cd843a9-aa80-14f-5eb2-33427363c20@google.com> <94eccf5f-264c-8abe-4567-e77f4b4e14a@google.com> <20230719162506.235856eb@p-imbrenda>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <t
 homas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Claudio finds warning on mm_has_pgste() more useful than on mm_alloc_pgste().

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/s390/mm/pgalloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 760b4ace475e..d7374add7820 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -459,7 +459,7 @@ void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
 	 * page_table_free() does not do the pgste gmap_unlink() which
 	 * page_table_free_rcu() does: warn us if pgste ever reaches here.
 	 */
-	WARN_ON_ONCE(mm_alloc_pgste(mm));
+	WARN_ON_ONCE(mm_has_pgste(mm));
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-- 
2.35.3

