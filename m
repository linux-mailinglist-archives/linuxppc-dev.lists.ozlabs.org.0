Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CBE59FE82
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 17:40:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MCVfB6Pj3z3bcv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Aug 2022 01:40:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RaieSkTP;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RaieSkTP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RaieSkTP;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=RaieSkTP;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MCVdP0H1Bz30DP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Aug 2022 01:39:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661355556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4YDz+MpPZkiheMede1adKNb3LxgK1j3sRTyEv4HMpL0=;
	b=RaieSkTP/iLRgo2CPANS4528Brz6Z+98pB0KGlHVYnrU9MlFCO2epS62+gA2LCaem025GU
	dRHvaTKcyZI1UL7v5PMdFE9+nz/Vt0fsTmM8a1r2m4XpdBNWXj3QplFpmg6abx1anxHnBK
	/AbOXcVFPSu+1c+fIGKpdSlxvotFu8k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1661355556;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4YDz+MpPZkiheMede1adKNb3LxgK1j3sRTyEv4HMpL0=;
	b=RaieSkTP/iLRgo2CPANS4528Brz6Z+98pB0KGlHVYnrU9MlFCO2epS62+gA2LCaem025GU
	dRHvaTKcyZI1UL7v5PMdFE9+nz/Vt0fsTmM8a1r2m4XpdBNWXj3QplFpmg6abx1anxHnBK
	/AbOXcVFPSu+1c+fIGKpdSlxvotFu8k=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-130-Buwjgs0xO5-w_7SBLZ_6qQ-1; Wed, 24 Aug 2022 11:39:14 -0400
X-MC-Unique: Buwjgs0xO5-w_7SBLZ_6qQ-1
Received: by mail-qk1-f197.google.com with SMTP id s9-20020a05620a254900b006b54dd4d6deso14931140qko.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 08:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=4YDz+MpPZkiheMede1adKNb3LxgK1j3sRTyEv4HMpL0=;
        b=Dn/C1AbyHZ4eF4IRMjZgn1xF0QQZA3nP1yGFUTCZi3NEmCK0vfxBVbkZxMG1AveViR
         0cSrX7VqOUi5lJRWjxxalvdPLkM0W4Al/zCucKEhB0kqGVaPQ7F3berPLUfwaQt/gXjs
         tZZLkCYqqjfvraI/371TFMLUxQr3Gj44Xb2VMw9h7Q5OlHpb11xlwQKyxC4WcieUA/Z+
         OTSVFOYAjiGA7WsZ9sHEp5kOYGdjBSYL1hr7SsD0/KFJk3yZy1HWdcw3LSKNbp/gFqWB
         XMuGvcO3XjPBQOrpD8y8a6v6/tvE2173V5eGd6paxL5lzDKCItFtjBibiqTDu5dolW4W
         JRDg==
X-Gm-Message-State: ACgBeo0aUtRQYqay2pYoXfcjOj0zycSWOjpwlW0dATzBCICTmHzfMMI6
	5bBmF/l9b0v92j+L4rKJeQ3Rb88NFvrwJQfFJL9J2HNabDJRWncpWvIkUYZf/+CiNOQ1TDuwRDs
	udB5XePk7FzOHgFIkryYuC2j3VA==
X-Received: by 2002:ad4:5ae8:0:b0:496:f1c9:7bd with SMTP id c8-20020ad45ae8000000b00496f1c907bdmr10727638qvh.125.1661355554379;
        Wed, 24 Aug 2022 08:39:14 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6lRAWqwQD0sX2sud09VmJ+0QpTsPmTlUS5jZn09b1qgoiwGEQmQlz8zOomOo+cNaaUWHVmfg==
X-Received: by 2002:ad4:5ae8:0:b0:496:f1c9:7bd with SMTP id c8-20020ad45ae8000000b00496f1c907bdmr10727612qvh.125.1661355554146;
        Wed, 24 Aug 2022 08:39:14 -0700 (PDT)
Received: from xz-m1.local (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
        by smtp.gmail.com with ESMTPSA id h4-20020ac87764000000b0034355a352d1sm12681683qtu.92.2022.08.24.08.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 08:39:13 -0700 (PDT)
Date: Wed, 24 Aug 2022 11:39:11 -0400
From: Peter Xu <peterx@redhat.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 2/3] mm/migrate_device.c: Copy pte dirty bit to page
Message-ID: <YwZGHyYJiJ+CGLn2@xz-m1.local>
References: <3b01af093515ce2960ac39bb16ff77473150d179.1661309831.git-series.apopple@nvidia.com>
 <ffbc824af5daa2c44b91c66834a341894fba4ce6.1661309831.git-series.apopple@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <ffbc824af5daa2c44b91c66834a341894fba4ce6.1661309831.git-series.apopple@nvidia.com>
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

On Wed, Aug 24, 2022 at 01:03:38PM +1000, Alistair Popple wrote:
> migrate_vma_setup() has a fast path in migrate_vma_collect_pmd() that
> installs migration entries directly if it can lock the migrating page.
> When removing a dirty pte the dirty bit is supposed to be carried over
> to the underlying page to prevent it being lost.
> 
> Currently migrate_vma_*() can only be used for private anonymous
> mappings. That means loss of the dirty bit usually doesn't result in
> data loss because these pages are typically not file-backed. However
> pages may be backed by swap storage which can result in data loss if an
> attempt is made to migrate a dirty page that doesn't yet have the
> PageDirty flag set.
> 
> In this case migration will fail due to unexpected references but the
> dirty pte bit will be lost. If the page is subsequently reclaimed data
> won't be written back to swap storage as it is considered uptodate,
> resulting in data loss if the page is subsequently accessed.
> 
> Prevent this by copying the dirty bit to the page when removing the pte
> to match what try_to_migrate_one() does.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Acked-by: Peter Xu <peterx@redhat.com>
> Reported-by: Huang Ying <ying.huang@intel.com>
> Fixes: 8c3328f1f36a ("mm/migrate: migrate_vma() unmap page from vma while collecting pages")
> Cc: stable@vger.kernel.org
> 
> ---
> 
> Changes for v3:
> 
>  - Defer TLB flushing
>  - Split a TLB flushing fix into a separate change.
> 
> Changes for v2:
> 
>  - Fixed up Reported-by tag.
>  - Added Peter's Acked-by.
>  - Atomically read and clear the pte to prevent the dirty bit getting
>    set after reading it.
>  - Added fixes tag
> ---
>  mm/migrate_device.c |  9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 6a5ef9f..51d9afa 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -7,6 +7,7 @@
>  #include <linux/export.h>
>  #include <linux/memremap.h>
>  #include <linux/migrate.h>
> +#include <linux/mm.h>
>  #include <linux/mm_inline.h>
>  #include <linux/mmu_notifier.h>
>  #include <linux/oom.h>
> @@ -196,7 +197,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			anon_exclusive = PageAnon(page) && PageAnonExclusive(page);
>  			if (anon_exclusive) {
>  				flush_cache_page(vma, addr, pte_pfn(*ptep));
> -				ptep_clear_flush(vma, addr, ptep);
> +				pte = ptep_clear_flush(vma, addr, ptep);
>  
>  				if (page_try_share_anon_rmap(page)) {
>  					set_pte_at(mm, addr, ptep, pte);
> @@ -206,11 +207,15 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  					goto next;
>  				}
>  			} else {
> -				ptep_get_and_clear(mm, addr, ptep);
> +				pte = ptep_get_and_clear(mm, addr, ptep);
>  			}

I remember that in v2 both flush_cache_page() and ptep_get_and_clear() are
moved above the condition check so they're called unconditionally.  Could
you explain the rational on why it's changed back (since I think v2 was the
correct approach)?

The other question is if we want to split the patch, would it be better to
move the tlb changes to patch 1, and leave the dirty bit fix in patch 2?

>  
>  			migrate->cpages++;
>  
> +			/* Set the dirty flag on the folio now the pte is gone. */
> +			if (pte_dirty(pte))
> +				folio_mark_dirty(page_folio(page));
> +
>  			/* Setup special migration page table entry */
>  			if (mpfn & MIGRATE_PFN_WRITE)
>  				entry = make_writable_migration_entry(
> -- 
> git-series 0.9.1
> 

-- 
Peter Xu

