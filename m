Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 985465954A6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 10:11:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6P473xzxz3c6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 18:11:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Gk7z9Pyo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=huang.ying.caritas@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Gk7z9Pyo;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6P3T464tz2xXS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 18:10:45 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id w11-20020a17090a380b00b001f73f75a1feso16714533pjb.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 01:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=npv9I4bKA8ZgPtTOpLA+17ug9RBYn0uNyctxT/S2BXk=;
        b=Gk7z9Pyooee/z7neyc5X3qWBvOiS7QqIZqEuR0pcH01M3Jh5/T8r344Avch+ETYrjn
         d5twJgTyXpSMgFIiugl6+uz4rJzalG70JsjUdavzPbPEMO6nm7lGSyovYppJpsyzvyH7
         tjJK5MQUXiXiNUw1ObEfWGtcMFSx7x4uFiEOACiUJ/dhwNTtNAekVYSZWxbrxIm0X87r
         wQoQgE3J2rPISgJ8kRwZmo36ybCeQIqoE6AwFKJW6mC5I3ZeQUGrDSLwrv2iJ6e5Jkq3
         qMuVnOQwgjC0mR6Y1/kr2RjV1r1FZ3IO8hg1iWmIJMbPwcfV3LY62647LEzIa2rL3wtz
         GFjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=npv9I4bKA8ZgPtTOpLA+17ug9RBYn0uNyctxT/S2BXk=;
        b=1/NipdONwdeUH66rB/+DqU6mL19N2WY3yTXBEd1bIXvXhmQ6UiqZqAdJjF/dQORtAW
         Bo/duSdCLOljeT6ruojbao+0/HBU1X5IxLiNl1WUvCRlwjDMZEimMws6656cfj8H2aO3
         h5p2jeRAontwixCyiDvLLEumj8PDAUiOevYQxxAXdj93kTjlbmu6Vmcrzr9US2eM+TlS
         uWebp57r1/fzWoiXdADpatjNlIcL9W3eTyNGMtI4HYfYXQXvxLzmPoulrTtYWO7vuBLq
         ddkL24gvIIovB31TQK3STP4Uf2FjsfGaSaNr3rJVPnfR05IAU7pCUkvqVc2J+xEoofzU
         h2Wg==
X-Gm-Message-State: ACgBeo22d74foRJJX8qPqAst4AYzI36oGj5X/Xxhv7e4eAKlbQDMzrlz
	uY3O9Pl8/RBzqe3m1uZKmdfLZi3xUJG/ylYnEh4=
X-Google-Smtp-Source: AA6agR4Mn4n64eyX8+OYcOJtDGTGKX2uMWMH1ncKXJXQwJuHWqMtGHGxuO2sGHP21TECYnZ4sssysqqJZ1+o3D8RbUE=
X-Received: by 2002:a17:90b:3147:b0:1f5:2cbb:9c5 with SMTP id
 ip7-20020a17090b314700b001f52cbb09c5mr32868353pjb.96.1660637442515; Tue, 16
 Aug 2022 01:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <6e77914685ede036c419fa65b6adc27f25a6c3e9.1660635033.git-series.apopple@nvidia.com>
In-Reply-To: <6e77914685ede036c419fa65b6adc27f25a6c3e9.1660635033.git-series.apopple@nvidia.com>
From: huang ying <huang.ying.caritas@gmail.com>
Date: Tue, 16 Aug 2022 16:10:29 +0800
Message-ID: <CAC=cRTPGiXWjk=CYnCrhJnLx3mdkGDXZpvApo6yTbeW7+ZGajA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm/migrate_device.c: Copy pte dirty bit to page
To: Alistair Popple <apopple@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>, Lyude Paul <lyude@redhat.com>, Karol Herbst <kherbst@redhat.com>, David Hildenbrand <david@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Felix Kuehling <Felix.Kuehling@amd.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Peter Xu <peterx@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Huang Ying <ying.huang@intel.com>, stable@vger.kernel.org, akpm@linux-foundation.org, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 16, 2022 at 3:39 PM Alistair Popple <apopple@nvidia.com> wrote:
>
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
> Changes for v2:
>
>  - Fixed up Reported-by tag.
>  - Added Peter's Acked-by.
>  - Atomically read and clear the pte to prevent the dirty bit getting
>    set after reading it.
>  - Added fixes tag
> ---
>  mm/migrate_device.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
>
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 27fb37d..e2d09e5 100644
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
> @@ -61,7 +62,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>         struct migrate_vma *migrate = walk->private;
>         struct vm_area_struct *vma = walk->vma;
>         struct mm_struct *mm = vma->vm_mm;
> -       unsigned long addr = start, unmapped = 0;
> +       unsigned long addr = start;
>         spinlock_t *ptl;
>         pte_t *ptep;
>
> @@ -193,11 +194,10 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>                         bool anon_exclusive;
>                         pte_t swp_pte;
>
> +                       flush_cache_page(vma, addr, pte_pfn(*ptep));
> +                       pte = ptep_clear_flush(vma, addr, ptep);

Although I think it's possible to batch the TLB flushing just before
unlocking PTL.  The current code looks correct.

Reviewed-by: "Huang, Ying" <ying.huang@intel.com>

Best Regards,
Huang, Ying

>                         anon_exclusive = PageAnon(page) && PageAnonExclusive(page);
>                         if (anon_exclusive) {
> -                               flush_cache_page(vma, addr, pte_pfn(*ptep));
> -                               ptep_clear_flush(vma, addr, ptep);
> -
>                                 if (page_try_share_anon_rmap(page)) {
>                                         set_pte_at(mm, addr, ptep, pte);
>                                         unlock_page(page);
> @@ -205,12 +205,14 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>                                         mpfn = 0;
>                                         goto next;
>                                 }
> -                       } else {
> -                               ptep_get_and_clear(mm, addr, ptep);
>                         }
>
>                         migrate->cpages++;
>
> +                       /* Set the dirty flag on the folio now the pte is gone. */
> +                       if (pte_dirty(pte))
> +                               folio_mark_dirty(page_folio(page));
> +
>                         /* Setup special migration page table entry */
>                         if (mpfn & MIGRATE_PFN_WRITE)
>                                 entry = make_writable_migration_entry(
> @@ -242,9 +244,6 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>                          */
>                         page_remove_rmap(page, vma, false);
>                         put_page(page);
> -
> -                       if (pte_present(pte))
> -                               unmapped++;
>                 } else {
>                         put_page(page);
>                         mpfn = 0;
> @@ -257,10 +256,6 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>         arch_leave_lazy_mmu_mode();
>         pte_unmap_unlock(ptep - 1, ptl);
>
> -       /* Only flush the TLB if we actually modified any entries */
> -       if (unmapped)
> -               flush_tlb_range(walk->vma, start, end);
> -
>         return 0;
>  }
>
>
> base-commit: ffcf9c5700e49c0aee42dcba9a12ba21338e8136
> --
> git-series 0.9.1
>
