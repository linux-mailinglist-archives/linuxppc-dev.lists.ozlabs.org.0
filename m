Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C66574A486
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 21:46:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=lNzL+MZH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qxn8Z32Dqz3bxr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 05:46:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=lNzL+MZH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qxn7f5kSCz3bvW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 05:45:33 +1000 (AEST)
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-bacf685150cso1195437276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 12:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688672727; x=1691264727;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jn2A84TyxlB9E6QwhZ/S3+QyShJtUiEedaODmn36QLU=;
        b=lNzL+MZHVE5Tf5jrUoH6qartx9zzmTGqRlIdWHCjVAbfYsp6CttNZlOBa0hRzJvZTL
         SocW3GJytbAfu6mxKOaeSgPA2iF9rnWdCYXvkrsIK9bHpmO7W6jRojvsd0W+wS+1M4ey
         Cy0yHMaRcD9qOOww9osMC+/qv3AnBllJOa6CwnAgkMCGCbzwsgDwWZB/A/DaH1aXsVkX
         GCRoPuBLf5rOxEvwKQVFZvVP2+nwXsMRUU4gYs9i3BpzNT/+y660I6oddp/GqxuJdZ4c
         ZEiHuDoHp93DRZmouI1YYfnuJreSUTCXVkXN8Tu0HBsepWhWGMKQWmvcj8W8/LXjSWTi
         jHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688672727; x=1691264727;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jn2A84TyxlB9E6QwhZ/S3+QyShJtUiEedaODmn36QLU=;
        b=OP1oasVGZ3W2g2t8qmqSpx5EvooclYBwJ16td7/6xX97PFxd6CHzH9mcokuFoFWXEy
         Ip5ofCV7HpngAiajKGgKIECMGPa7GqLl/GuBpM/04XohwyMcHZ6EefsVJKEkfSOgNn4E
         WFAtXVPF71vcjr5HzOC0GmXCJMoUbdc1hOUZdTtr24zyIsj03Gvu008BGiff+3EL5aCP
         Lr/tvBfZ+XD+Z+SYQWeQVyL4NY8x98Irc+vZP9KxdY5QIdv5hCPn4K0094P1KXMBEVYg
         RDap1NBeg8JUpgps/44NhiwzgTlT7J+lCsZT60dgcGRnfEPrfeS4xQwyt/WmKZSzIjay
         qaSg==
X-Gm-Message-State: ABy/qLa2PRf76zznH+svrUCPJa7UG768ZMbTorS/h6OLQqZfWImx95sA
	G6NskXPqZ8VE2l3qlN878TASjg==
X-Google-Smtp-Source: APBJJlHqKtby+pVoLzti7droMN1zKJuKs2lBA2W3Af+OZJMud2WnSKOd+NI5VCViV+RTettlilf/TQ==
X-Received: by 2002:a81:5f09:0:b0:570:6667:1cfa with SMTP id t9-20020a815f09000000b0057066671cfamr3295624ywb.47.1688672726798;
        Thu, 06 Jul 2023 12:45:26 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id z7-20020a81c207000000b005703cfc23c1sm539958ywc.104.2023.07.06.12.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 12:45:26 -0700 (PDT)
Date: Thu, 6 Jul 2023 12:45:14 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
Subject: Re: [PATCH v2 07/12] s390: add pte_free_defer() for pgtables sharing
 page
In-Reply-To: <20230706170213.2ea63606@thinkpad-T15>
Message-ID: <b454cfb1-85dc-743f-8f0-30d7e3d4376@google.com>
References: <54cb04f-3762-987f-8294-91dafd8ebfb0@google.com> <a722dbec-bd9e-1213-1edd-53cd547aa4f@google.com> <20230628211624.531cdc58@thinkpad-T15> <cd7c2851-1440-7220-6c53-16b343b1474@google.com> <ZJ2hsM5Tn+yUZ5ZV@ziepe.ca> <20230629175645.7654d0a8@thinkpad-T15>
 <edaa96f-80c1-1252-acbb-71c4f045b035@google.com> <7bef5695-fa4a-7215-7e9d-d4a83161c7ab@google.com> <20230704171905.1263478f@thinkpad-T15> <e678affb-5eee-a055-7af1-1d29a965663b@google.com> <20230705145516.7d9d554d@thinkpad-T15> <1014735-ecc4-b4bc-3ae7-48a4328ed149@google.com>
 <20230706170213.2ea63606@thinkpad-T15>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, P
 asha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 6 Jul 2023, Gerald Schaefer wrote:
> 
> Since none of my remarks on the comments seem valid or strictly necessary
> any more, and I also could not find functional issues, I think you can add
> this patch as new version for 07/12. And I can now give you this:
> 
> Reviewed-by: Gerald Schaefer <gerald.schaefer@linux.ibm.com>

Great, thanks a lot Gerald.
The one change I'm making to it is then this merged in:

--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -455,6 +455,11 @@ void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
 	page = virt_to_page(pgtable);
 	SetPageActive(page);
 	page_table_free(mm, (unsigned long *)pgtable);
+	/*
+	 * page_table_free() does not do the pgste gmap_unlink() which
+	 * page_table_free_rcu() does: warn us if pgste ever reaches here.
+	 */
+	WARN_ON_ONCE(mm_alloc_pgste(mm));
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
