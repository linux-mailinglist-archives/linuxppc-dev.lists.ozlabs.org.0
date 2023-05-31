Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 375CD718E57
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 00:20:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWkGk0JzRz3fFN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 08:20:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=iFly5zo2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=iFly5zo2;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWkFq0qXXz3c8v
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 08:19:25 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1ac65ab7432so57695ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 15:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685571561; x=1688163561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRWZmpqRL5XiZgWOPMSUq0KvjrtvR8XR5rQAecF0oZ4=;
        b=iFly5zo2sy/lAtQ3HhlOMridVqfu6qfPcrLzIVcmWu/D50gTe+1qsog0OpXKba34AM
         7esxxoXOZgU2b+4rTYCP+2F/ejY/GbJXfa8A0sXnuFj7+DxPAktAXb+wGoZtLoXg5tim
         8FVVTy8jjyDam8f/fgX6o6yBT5D2Ux5xVafJN8A3GMDq9V/Or1MzonxwP3QsfC+snDRI
         SG3rH2NlTWHLM+fLjB0A3DIE2aVMGT4l8yR+KOkWkwY4wfKWwzHbJ5Lt9eMn+eI2VQ5P
         tEC9elQXXr9HqOHN0kX0stjJ0Pj3TwUHQMpx82B74M3E43CdU87AkDrhxLhNvlnutHZ1
         tGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685571561; x=1688163561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRWZmpqRL5XiZgWOPMSUq0KvjrtvR8XR5rQAecF0oZ4=;
        b=ElhY/JOYuUuTwRBhsOdkk9VAGE83pKwwC1HwbziLd53rlAEiobIHhzKFYr0pSYG5uZ
         WlZ10M4DpJGe72A6vq5WQQc3w3WowwkOskc6vKSHwxJX4hwzibxS0iSDgwXj4NBWisYE
         TwhKLYe5CUL0xLX6TrMeR1ZASixFwPyXyJ/iCDoYNrzE0Ax0XdInevbXjRZqVilEdkXv
         dFRLr9maK+gsV0E1KbWXOUyu2SfKK5ForEZEF6CJ9I6/V5LIMp8mSNa3qeMnEb47+hYf
         eYTOjCWZ7rNCpcXo37cuz/VfHrzEeoOCKI3LdVCBML017ceKyvRETjgfYPSneTNehR7j
         j8aw==
X-Gm-Message-State: AC+VfDwz7Pj2TM8X28ZQibUXg5t3vohvFaaVRnfG1ML2GFTwU6CnTOmF
	q0eW2kAFp/M/l+3BQLvEl0KsQd8peoZwR6//0Mkwbw==
X-Google-Smtp-Source: ACHHUZ7bko0KTAnjbjNbOVblk4XWzcVkxerfCOFFo5yNT5TaXIaEurY3iGbtCSYhOAX0x9zwiXMTvT/Osanj9HTXgSc=
X-Received: by 2002:a17:902:e54e:b0:1b0:4a2:5920 with SMTP id
 n14-20020a170902e54e00b001b004a25920mr13931plf.19.1685571560674; Wed, 31 May
 2023 15:19:20 -0700 (PDT)
MIME-Version: 1.0
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
 <2e9996fa-d238-e7c-1194-834a2bd1f60@google.com> <CAG48ez0aF1Rf1apSjn9YcnfyFQ4YqSd4GqB6f2wfhF7jMdi5Hg@mail.gmail.com>
 <ZHe0A079X9B8jWlH@x1n>
In-Reply-To: <ZHe0A079X9B8jWlH@x1n>
From: Jann Horn <jannh@google.com>
Date: Thu, 1 Jun 2023 00:18:43 +0200
Message-ID: <CAG48ez1UNFfpTUph6ZMuN61CoTGne05NLAweL_=ijRfqj5evMg@mail.gmail.com>
Subject: Re: [PATCH 09/12] mm/khugepaged: retract_page_tables() without mmap
 or vma lock
To: Peter Xu <peterx@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khan
 dual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 31, 2023 at 10:54=E2=80=AFPM Peter Xu <peterx@redhat.com> wrote=
:
> On Wed, May 31, 2023 at 05:34:58PM +0200, Jann Horn wrote:
> > On Mon, May 29, 2023 at 8:25=E2=80=AFAM Hugh Dickins <hughd@google.com>=
 wrote:
> > > -static int retract_page_tables(struct address_space *mapping, pgoff_=
t pgoff,
> > > -                              struct mm_struct *target_mm,
> > > -                              unsigned long target_addr, struct page=
 *hpage,
> > > -                              struct collapse_control *cc)
> > > +static void retract_page_tables(struct address_space *mapping, pgoff=
_t pgoff)
> > >  {
> > >         struct vm_area_struct *vma;
> > > -       int target_result =3D SCAN_FAIL;
> > >
> > > -       i_mmap_lock_write(mapping);
> > > +       i_mmap_lock_read(mapping);
> > >         vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff=
) {
> > > -               int result =3D SCAN_FAIL;
> > > -               struct mm_struct *mm =3D NULL;
> > > -               unsigned long addr =3D 0;
> > > -               pmd_t *pmd;
> > > -               bool is_target =3D false;
> > > +               struct mm_struct *mm;
> > > +               unsigned long addr;
> > > +               pmd_t *pmd, pgt_pmd;
> > > +               spinlock_t *pml;
> > > +               spinlock_t *ptl;
> > >
> > >                 /*
> > >                  * Check vma->anon_vma to exclude MAP_PRIVATE mapping=
s that
> > > -                * got written to. These VMAs are likely not worth in=
vesting
> > > -                * mmap_write_lock(mm) as PMD-mapping is likely to be=
 split
> > > -                * later.
> > > +                * got written to. These VMAs are likely not worth re=
moving
> > > +                * page tables from, as PMD-mapping is likely to be s=
plit later.
> > >                  *
> > > -                * Note that vma->anon_vma check is racy: it can be s=
et up after
> > > -                * the check but before we took mmap_lock by the faul=
t path.
> > > -                * But page lock would prevent establishing any new p=
tes of the
> > > -                * page, so we are safe.
> > > -                *
> > > -                * An alternative would be drop the check, but check =
that page
> > > -                * table is clear before calling pmdp_collapse_flush(=
) under
> > > -                * ptl. It has higher chance to recover THP for the V=
MA, but
> > > -                * has higher cost too. It would also probably requir=
e locking
> > > -                * the anon_vma.
> > > +                * Note that vma->anon_vma check is racy: it can be s=
et after
> > > +                * the check, but page locks (with XA_RETRY_ENTRYs in=
 holes)
> > > +                * prevented establishing new ptes of the page. So we=
 are safe
> > > +                * to remove page table below, without even checking =
it's empty.
> >
> > This "we are safe to remove page table below, without even checking
> > it's empty" assumes that the only way to create new anonymous PTEs is
> > to use existing file PTEs, right? What about private shmem VMAs that
> > are registered with userfaultfd as VM_UFFD_MISSING? I think for those,
> > the UFFDIO_COPY ioctl lets you directly insert anonymous PTEs without
> > looking at the mapping and its pages (except for checking that the
> > insertion point is before end-of-file), protected only by mmap_lock
> > (shared) and pte_offset_map_lock().
>
> Hmm, yes.  We probably need to keep that though, and 5b51072e97 explained
> the reason (to still respect file permissions).
>
> Maybe the anon_vma check can also be moved into the pgtable lock section,
> with some comments explaining (but it's getting a bit ugly..)?

Or check that all entries are pte_none() or something like that inside
the pgtable-locked section?

[...]
> > The old code called collapse_and_free_pmd(), which involves MMU
> > notifier invocation...
[...]
> > ... while the new code only does pmdp_collapse_flush(), which clears
> > the pmd entry and does a TLB flush, but AFAICS doesn't use MMU
> > notifiers. My understanding is that that's problematic - maybe (?) it
> > is sort of okay with regards to classic MMU notifier users like KVM,
> > but it's probably wrong for IOMMUv2 users, where an IOMMU directly
> > consumes the normal page tables?
>
> The iommuv2 wasn't "consuming" the pgtables?

My wording was confusing, I meant that as "the iommuv2 hardware
directly uses/walks the page tables".

> IIUC it relies on that to
> make sure no secondary (and illegal) tlb exists in the iommu tlbs.
>
> For this case if the pgtable _must_ be empty when reaching here (we'd
> better make sure of it..), maybe we're good?  Because we should have just
> invalidated once when unmap all the pages in the thp range, so no existin=
g
> tlb should generate anyway for either cpu or iommu hardwares.

My headcanon is that there are approximately three reasons why we
normally have to do iommuv2 invalidations and I think one or two of
them might still apply here, though admittedly I haven't actually dug
up documentation on how this stuff actually works for IOMMUv2, so
maybe one of y'all can tell me that my concerns here are unfounded:

1. We have to flush normal TLB entries. This is probably not necessary
if the page table contains no entries.
2. We might have to flush "paging-structure caches" / "intermediate
table walk caches", if the IOMMU caches the physical addresses of page
tables to skip some levels of page table walk. IDK if IOMMUs do that,
but normal MMUs definitely do it, so I wouldn't be surprised if the
IOMMUs did it too (or reserved the right to do it in a future hardware
generation or whatever).
3. We have to *serialize* with page table walks performed by the
IOMMU. We're doing an RCU barrier to synchronize against page table
walks from the MMU, but without an appropriate mmu_notifier call, we
have nothing to ensure that we aren't yanking a page table out from
under an IOMMU page table walker while it's in the middle of its walk.
Sure, this isn't very likely in practice, the IOMMU page table walker
is probably pretty fast, but still we need some kind of explicit
synchronization to make this robust, I think.

> However OTOH, maybe it'll also be safer to just have the mmu notifiers li=
ke
> before (e.g., no idea whether anything can cache invalidate tlb
> translations from the empty pgtable)? As that doesn't seems to beat the
> purpose of the patchset as notifiers shouldn't fail.
>
> >
> > (FWIW, last I looked, there also seemed to be some other issues with
> > MMU notifier usage wrt IOMMUv2, see the thread
> > <https://lore.kernel.org/linux-mm/Yzbaf9HW1%2FreKqR8@nvidia.com/>.)
