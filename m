Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECF25A1D2E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 01:27:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDJzS2F9jz3c1p
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Aug 2022 09:27:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZLB31PtO;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZLB31PtO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZLB31PtO;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZLB31PtO;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDJym1Jzrz2yT0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Aug 2022 09:27:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661470027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8enL1rrDOi/OnKgKQtLA4H9w0YLjxz1gjz5XS9Gs15s=;
	b=ZLB31PtOBcKYBEalbaNejUIqVUkgqh3Qk+wvVQ6NQMPGewXvL8FdFVrV9+QMzB4IDd56Ry
	JjMVIK0TUJXo/UPrTeYDs52FQfmmxNiE6K7eFXa1AgFjKZH9blH8UhiQgI+TZ4i/d8bkqY
	sKGXuKQg6Np19AQpAGHvtVTD4c2Fp2E=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661470027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8enL1rrDOi/OnKgKQtLA4H9w0YLjxz1gjz5XS9Gs15s=;
	b=ZLB31PtOBcKYBEalbaNejUIqVUkgqh3Qk+wvVQ6NQMPGewXvL8FdFVrV9+QMzB4IDd56Ry
	JjMVIK0TUJXo/UPrTeYDs52FQfmmxNiE6K7eFXa1AgFjKZH9blH8UhiQgI+TZ4i/d8bkqY
	sKGXuKQg6Np19AQpAGHvtVTD4c2Fp2E=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-306-VDNYA8TmOiCHC1Eic2VR8Q-1; Thu, 25 Aug 2022 19:27:03 -0400
X-MC-Unique: VDNYA8TmOiCHC1Eic2VR8Q-1
Received: by mail-qt1-f197.google.com with SMTP id k9-20020ac80749000000b0034302b53c6cso93085qth.22
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 16:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=8enL1rrDOi/OnKgKQtLA4H9w0YLjxz1gjz5XS9Gs15s=;
        b=d4TNu2Msx+EmDC8uu1sa/94g/zTSzYgEZIS0Bceh/mdmIET5VycVlr8ELOAdaZFwXl
         309rO3kGgVQP5lUYfpAz98E/2rKzLxRu5K9H4opPI/WxaMJNE1ZQ9GBCg1/fW8n13vjN
         lwXjhbI/2cb2dA7+7XbXHtgYcB1C3BN/B5xvgNcZgJy296sYtrCvhUJdh5OYLN2aW6Ho
         8/J/2ObjXFwuAYZcpzdyNUtEUavn5TvNZOekpAjliEp/YuYxPe02qP7/lmQ91YKC+2uL
         SBns4It7QuSuT4ey1TfoqGCsG+oT3TUSd0vcld6Zk04QjggdEHJIvOn3sC283fcvW8hS
         BTNw==
X-Gm-Message-State: ACgBeo0qDs3+nnEDLOGE425gAS0aPpxPfZW2+2TWPY4URIrn5o9Gwi/8
	gjmA/hgToMXCgtp/eabWdwAgvkT7YEutT76AZz0CW3IDmKfpMqT3koiB0oZCMhT9pANH8nsCc8p
	8YJCvbKgeMW4IJ15xuDELWH42+w==
X-Received: by 2002:a05:620a:1111:b0:6bb:604e:9d3d with SMTP id o17-20020a05620a111100b006bb604e9d3dmr4747579qkk.61.1661470023306;
        Thu, 25 Aug 2022 16:27:03 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7yqCUTQPAFxdfqhgCoZWa8dIEgb2UAHgMekDc93LYhHe8Ujqd1dkT+XYo5GK51eAd882LClw==
X-Received: by 2002:a05:620a:1111:b0:6bb:604e:9d3d with SMTP id o17-20020a05620a111100b006bb604e9d3dmr4747543qkk.61.1661470022876;
        Thu, 25 Aug 2022 16:27:02 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id u13-20020a05620a0c4d00b006b9c6d590fasm704728qki.61.2022.08.25.16.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 16:27:02 -0700 (PDT)
Date: Thu, 25 Aug 2022 19:27:00 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 2/3] mm/migrate_device.c: Copy pte dirty bit to page
Message-ID: <YwgFRLn43+U/hxwt@xz-m1.local>
References: <3b01af093515ce2960ac39bb16ff77473150d179.1661309831.git-series.apopple@nvidia.com>
 <ffbc824af5daa2c44b91c66834a341894fba4ce6.1661309831.git-series.apopple@nvidia.com>
 <YwZGHyYJiJ+CGLn2@xz-m1.local>
 <8735dkeyyg.fsf@nvdebian.thelocal>
MIME-Version: 1.0
In-Reply-To: <8735dkeyyg.fsf@nvdebian.thelocal>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Huang Ying <ying.huang@intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, Nadav Amit <nadav.amit@gmail.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Logan Gunthorpe <logang@deltatee.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, stable@vger.kernel.org, akpm@linux-foundation.org, huang ying <huang.ying.caritas@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 26, 2022 at 08:21:44AM +1000, Alistair Popple wrote:
> 
> Peter Xu <peterx@redhat.com> writes:
> 
> > On Wed, Aug 24, 2022 at 01:03:38PM +1000, Alistair Popple wrote:
> >> migrate_vma_setup() has a fast path in migrate_vma_collect_pmd() that
> >> installs migration entries directly if it can lock the migrating page.
> >> When removing a dirty pte the dirty bit is supposed to be carried over
> >> to the underlying page to prevent it being lost.
> >>
> >> Currently migrate_vma_*() can only be used for private anonymous
> >> mappings. That means loss of the dirty bit usually doesn't result in
> >> data loss because these pages are typically not file-backed. However
> >> pages may be backed by swap storage which can result in data loss if an
> >> attempt is made to migrate a dirty page that doesn't yet have the
> >> PageDirty flag set.
> >>
> >> In this case migration will fail due to unexpected references but the
> >> dirty pte bit will be lost. If the page is subsequently reclaimed data
> >> won't be written back to swap storage as it is considered uptodate,
> >> resulting in data loss if the page is subsequently accessed.
> >>
> >> Prevent this by copying the dirty bit to the page when removing the pte
> >> to match what try_to_migrate_one() does.
> >>
> >> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> >> Acked-by: Peter Xu <peterx@redhat.com>
> >> Reported-by: Huang Ying <ying.huang@intel.com>
> >> Fixes: 8c3328f1f36a ("mm/migrate: migrate_vma() unmap page from vma while collecting pages")
> >> Cc: stable@vger.kernel.org
> >>
> >> ---
> >>
> >> Changes for v3:
> >>
> >>  - Defer TLB flushing
> >>  - Split a TLB flushing fix into a separate change.
> >>
> >> Changes for v2:
> >>
> >>  - Fixed up Reported-by tag.
> >>  - Added Peter's Acked-by.
> >>  - Atomically read and clear the pte to prevent the dirty bit getting
> >>    set after reading it.
> >>  - Added fixes tag
> >> ---
> >>  mm/migrate_device.c |  9 +++++++--
> >>  1 file changed, 7 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> >> index 6a5ef9f..51d9afa 100644
> >> --- a/mm/migrate_device.c
> >> +++ b/mm/migrate_device.c
> >> @@ -7,6 +7,7 @@
> >>  #include <linux/export.h>
> >>  #include <linux/memremap.h>
> >>  #include <linux/migrate.h>
> >> +#include <linux/mm.h>
> >>  #include <linux/mm_inline.h>
> >>  #include <linux/mmu_notifier.h>
> >>  #include <linux/oom.h>
> >> @@ -196,7 +197,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >>  			anon_exclusive = PageAnon(page) && PageAnonExclusive(page);
> >>  			if (anon_exclusive) {
> >>  				flush_cache_page(vma, addr, pte_pfn(*ptep));
> >> -				ptep_clear_flush(vma, addr, ptep);
> >> +				pte = ptep_clear_flush(vma, addr, ptep);
> >>
> >>  				if (page_try_share_anon_rmap(page)) {
> >>  					set_pte_at(mm, addr, ptep, pte);
> >> @@ -206,11 +207,15 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
> >>  					goto next;
> >>  				}
> >>  			} else {
> >> -				ptep_get_and_clear(mm, addr, ptep);
> >> +				pte = ptep_get_and_clear(mm, addr, ptep);
> >>  			}
> >
> > I remember that in v2 both flush_cache_page() and ptep_get_and_clear() are
> > moved above the condition check so they're called unconditionally.  Could
> > you explain the rational on why it's changed back (since I think v2 was the
> > correct approach)?
> 
> Mainly because I agree with your original comments, that it would be
> better to keep the batching of TLB flushing if possible. After the
> discussion I don't think there is any issues with HW pte dirty bits
> here. There are already other cases where HW needs to get that right
> anyway (eg. zap_pte_range).

Yes tlb batching was kept, thanks for doing that way.  Though if only apply
patch 1 we'll have both ptep_clear_flush() and batched flush which seems to
be redundant.

> 
> > The other question is if we want to split the patch, would it be better to
> > move the tlb changes to patch 1, and leave the dirty bit fix in patch 2?
> 
> Isn't that already the case? Patch 1 moves the TLB flush before the PTL
> as suggested, patch 2 atomically copies the dirty bit without changing
> any TLB flushing.

IMHO it's cleaner to have patch 1 fix batch flush, replace
ptep_clear_flush() with ptep_get_and_clear() and update pte properly.

No strong opinions on the layout, but I still think we should drop the
redundant ptep_clear_flush() above, meanwhile add the flush_cache_page()
properly for !exclusive case too.

Thanks,

-- 
Peter Xu

