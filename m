Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9107C471E56
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 23:50:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0Gp46BNz3dgT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:50:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hZuwqUyM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d;
 helo=mail-ed1-x52d.google.com; envelope-from=shy828301@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=hZuwqUyM; dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9dwP73f1z2yJM
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 05:00:03 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id r11so31800765edd.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q4cSh71dzUGeiXZRE4QW36EmwcI8AZrCxMvROIrZS14=;
 b=hZuwqUyMx6p4vq+XxIbn+14N9qyb4VjVKFc+XlT24PuxI8wuTRByd6L5UShZbYCPn6
 hFJEMkb+ZcKlIYkUV0tDiyObLesBR7irNUCiCMAa2lVRi3CC57aTV1alPZFU5Ysazrph
 YFhWPMKpxva8rtigETs3FTPO6R5mZn5VOWtBPJXZadHgtSqBE5wuIb/YuK6Qz1CH7KoK
 hnKUK9t4YQwu/yKgZT3oT89+N75FsEO9VhEY0F2y2bLckImDe4uov8SNI0AQgrJ3ZD5d
 S7s4cNZ1Mv66posmbYafTGVHKgSQlseJKI92d9yXya7GxXHGbGAnv0tL4KEZr7IYPLWc
 FeuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q4cSh71dzUGeiXZRE4QW36EmwcI8AZrCxMvROIrZS14=;
 b=h+o+d2O1J3fzMNU33rRwQ/xW/u9Uth/s8T/Yh9HulrHST9dF3aYbnpJZsMLc2uTSi6
 XV9GSAklchj/EpJWwUZNz8R2179IGwx61gd+Twu3TAUJy/TdjksCw9HqmPLWUjpIGiNF
 Y6J8XeZDK3b9z9pkMbjJCNYmGp+A53hT69WOIMvimDQNihTzauvKmkcDRr7fZIXlynzM
 kGKx54K7OUjNlHkqECNpO/+t+KXyLfk7HAR+N9NPT5A/0MXxvDVIYxYxpLUDdQDwCkgF
 /6Z1DgjhISoBm22s+e3amqyD6Bu6Pw9sOpuS5exoBZk8Lwf51Bs1mgCPtgUxnzubURFA
 a5+Q==
X-Gm-Message-State: AOAM533ULOav5UYrOVqPv0308yQxHp3Q7nWy1lgCUbVxeqZd20LoNnbl
 TMlS3woXLwN2SoDkufs09yt3b/hH40UH1EX5fMg=
X-Google-Smtp-Source: ABdhPJyMR1vnybSwdT0dzOqAU1cPEp/zYKbnjixRaU/JBnWxGfH4bMnkNn+t2j/Uf7ySIMQBrI/ELelqVgOUVCZ6KxY=
X-Received: by 2002:a50:e003:: with SMTP id e3mr40230046edl.374.1639159198508; 
 Fri, 10 Dec 2021 09:59:58 -0800 (PST)
MIME-Version: 1.0
References: <20211209230414.2766515-1-zi.yan@sent.com>
 <20211209230414.2766515-4-zi.yan@sent.com>
 <84807a03-f7d1-83cb-16df-bacc58de4529@gmail.com>
 <971750C3-DAEC-4EE8-B838-2DD3CBC29781@nvidia.com>
In-Reply-To: <971750C3-DAEC-4EE8-B838-2DD3CBC29781@nvidia.com>
From: Yang Shi <shy828301@gmail.com>
Date: Fri, 10 Dec 2021 09:59:46 -0800
Message-ID: <CAHbLzkr627vwDovZ23Ofje1vfu+m6BbYWs=tvptNpQwf1ramyQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/7] mm: migrate: allocate the right size of non
 hugetlb or THP compound pages.
To: Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 13 Dec 2021 09:47:48 +1100
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
Cc: Mel Gorman <mgorman@techsingularity.net>,
 David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 virtualization@lists.linux-foundation.org, Linux MM <linux-mm@kvack.org>,
 iommu@lists.linux-foundation.org, Eric Ren <renzhengeek@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 10, 2021 at 8:08 AM Zi Yan <ziy@nvidia.com> wrote:
>
> On 10 Dec 2021, at 2:53, Eric Ren wrote:
>
> > Hi,
> >
> > On 2021/12/10 07:04, Zi Yan wrote:
> >> From: Zi Yan <ziy@nvidia.com>
> >>
> >> alloc_migration_target() is used by alloc_contig_range() and non-LRU
> >> movable compound pages can be migrated. Current code does not allocate the
> >> right page size for such pages. Check THP precisely using
> >> is_transparent_huge() and add allocation support for non-LRU compound
> >> pages.
> > Could you elaborate on why the current code doesn't get the right size?  how this patch fixes it.
>
> The current code only check PageHuge() and PageTransHuge(). Non-LRU compound
> pages will be regarded as PageTransHuge() and an order-9 page is always allocated
> regardless of the actual page order. This patch makes the exact check for
> THPs using is_transparent_huge() instead of PageTransHuge() and checks PageCompound()
> after PageHuge() and is_transparent_huge() for non-LRU compound pages.
>
> >
> > The description sounds like it's an existing bug, if so, the patch subject should be changed to
> > "Fixes ..."?
>
> I have not seen any related bug report.
>
> >
> >>
> >> Signed-off-by: Zi Yan <ziy@nvidia.com>
> >> ---
> >>   mm/migrate.c | 8 ++++++--
> >>   1 file changed, 6 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/mm/migrate.c b/mm/migrate.c
> >> index d487a399253b..2ce3c771b1de 100644
> >> --- a/mm/migrate.c
> >> +++ b/mm/migrate.c
> >> @@ -1563,7 +1563,7 @@ struct page *alloc_migration_target(struct page *page, unsigned long private)
> >>              return alloc_huge_page_nodemask(h, nid, mtc->nmask, gfp_mask);
> >>      }
> >>  -   if (PageTransHuge(page)) {
> >> +    if (is_transparent_hugepage(page)) {
> >>              /*
> >>               * clear __GFP_RECLAIM to make the migration callback
> >>               * consistent with regular THP allocations.
> >> @@ -1572,13 +1572,17 @@ struct page *alloc_migration_target(struct page *page, unsigned long private)
> > if (PageTransHuge(page)) {  // just give more code context
> > ...
> >>              gfp_mask |= GFP_TRANSHUGE;
> >>              order = HPAGE_PMD_ORDER;
> > order assigned here
> >>      }
> >> +    if (PageCompound(page)) {
> >> +            gfp_mask |= __GFP_COMP;
> >> +            order = compound_order(page);
> > re-assinged again as THP is a compound page?
>
> Ah, you are right. Will use else if instead. Thanks.

You don't have to use else if, you could just do:

if (PageCompound(page)) {
    gfp_mask |= __GFP_COMP;
    order = compound_order(page);
}

if (is_transparent_hugepage(page)) {
    /* Manipulate THP specific gfp mask */
    ....
}


>
> > Thanks,
> > Eric
> >> +    }
> >>      zidx = zone_idx(page_zone(page));
> >>      if (is_highmem_idx(zidx) || zidx == ZONE_MOVABLE)
> >>              gfp_mask |= __GFP_HIGHMEM;
> >>      new_page = __alloc_pages(gfp_mask, order, nid, mtc->nmask);
> >>  -   if (new_page && PageTransHuge(new_page))
> >> +    if (new_page && is_transparent_hugepage(page))
> >>              prep_transhuge_page(new_page);
> >>      return new_page;
>
>
> --
> Best Regards,
> Yan, Zi
