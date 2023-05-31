Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 157CA718B7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 22:55:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWhNy4ZxSz3fBN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 06:55:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yt3bZi8g;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rwj89m6f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Yt3bZi8g;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Rwj89m6f;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWhN14JKJz3f6j
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 06:54:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685566475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cwd4SgM5APPGh7VO0y71b+pefPbg5/lxjd5iAY5Yg7M=;
	b=Yt3bZi8gAoq/nrWw+X1MY3hobw32g7ftUdKzN3+YvEzVA4puIh/pA+GFOLKXYTVWas2H/q
	aEyfoDG915k4gOGildsdEC4ZJb2LTZeVDuoiKN34T4Njf5BcmRX/sy+I02sF170ckEVEvm
	NUZH6kr6sT6Q511lv/1+hlYxxkk8QmM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685566476;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cwd4SgM5APPGh7VO0y71b+pefPbg5/lxjd5iAY5Yg7M=;
	b=Rwj89m6fUSp8XAUoAH3aGJrgVkWKAWbDdIeeZSKkZD2xd2SoppqYM4I+HDwMXqPz4otZdi
	MkQTt3e6E/+GN7ofhrjaWQ3Am0Pn8vcjRw3OLZd1HvTY/dtIBw7HbRR5DSeIvSart0yTwp
	wH7HezE5EW8Ivcxk/Fe0+WqnnlLAeJg=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-wTd9AdMoMOOvMpXIk_vIWA-1; Wed, 31 May 2023 16:54:33 -0400
X-MC-Unique: wTd9AdMoMOOvMpXIk_vIWA-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-75c9b116dddso16953585a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 13:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685566473; x=1688158473;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cwd4SgM5APPGh7VO0y71b+pefPbg5/lxjd5iAY5Yg7M=;
        b=VAKZjcZ+yZUSkhlS/+gu27UAL77WFxzEi6vtoMFsiP7CU+LCswYBzl1HXMLaZE3d4i
         Lnd/Nc4dIMhpswEPWG/J+cE+assdrcy/YavCogzIorxs4KVlHN0RXsa+qhmBLw7VE3l1
         0eq+g/A91nbePzatRohl33aIhAdBjkKPBRAYn5/Pb135/sdtF9383629GVRgJJkW+pKy
         /qAbWCaYV1yI+YSxyMu7rRFznmL+/6m6IHV/2r9CUffrGEVO4bJ2JqGQ/9BGHaoTB3bV
         Nj9icciz5I38/YujDXvVczjqWJWvKMjwcwsfWAXiS8tWo2NQ3F4RAzOwUp5x2Y9S0I33
         dIpA==
X-Gm-Message-State: AC+VfDxylUyTU1yV+6Bz3oUnDbmh89WJdbgdwf2k2kE8ks7V6Az6Npra
	Idu7PFHKiQwyqtWri+IvzBpvtlLDKn50qI8KUWMZqp2KLf7th/3Ur4uNZ99K/0AzuvjTbTWcjnn
	EZusRUn7kFnuMzzodFgZIMeV7/Q==
X-Received: by 2002:a05:620a:890d:b0:75b:23a1:82a4 with SMTP id ql13-20020a05620a890d00b0075b23a182a4mr3313713qkn.5.1685566472704;
        Wed, 31 May 2023 13:54:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7K8gisroUbkQdWW7zoLWfYHa+/7bJeNWQUDGgP3g/Ti4u2xb2+wWVE1kXodA9+OAH0aYYjBQ==
X-Received: by 2002:a05:620a:890d:b0:75b:23a1:82a4 with SMTP id ql13-20020a05620a890d00b0075b23a182a4mr3313655qkn.5.1685566472234;
        Wed, 31 May 2023 13:54:32 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-62-70-24-86-62.dsl.bell.ca. [70.24.86.62])
        by smtp.gmail.com with ESMTPSA id b8-20020a05620a126800b0074df2ac52f8sm5684553qkl.21.2023.05.31.13.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 13:54:31 -0700 (PDT)
Date: Wed, 31 May 2023 16:54:27 -0400
From: Peter Xu <peterx@redhat.com>
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH 09/12] mm/khugepaged: retract_page_tables() without mmap
 or vma lock
Message-ID: <ZHe0A079X9B8jWlH@x1n>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com>
 <2e9996fa-d238-e7c-1194-834a2bd1f60@google.com>
 <CAG48ez0aF1Rf1apSjn9YcnfyFQ4YqSd4GqB6f2wfhF7jMdi5Hg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAG48ez0aF1Rf1apSjn9YcnfyFQ4YqSd4GqB6f2wfhF7jMdi5Hg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Wed, May 31, 2023 at 05:34:58PM +0200, Jann Horn wrote:
> On Mon, May 29, 2023 at 8:25 AM Hugh Dickins <hughd@google.com> wrote:
> > -static int retract_page_tables(struct address_space *mapping, pgoff_t pgoff,
> > -                              struct mm_struct *target_mm,
> > -                              unsigned long target_addr, struct page *hpage,
> > -                              struct collapse_control *cc)
> > +static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
> >  {
> >         struct vm_area_struct *vma;
> > -       int target_result = SCAN_FAIL;
> >
> > -       i_mmap_lock_write(mapping);
> > +       i_mmap_lock_read(mapping);
> >         vma_interval_tree_foreach(vma, &mapping->i_mmap, pgoff, pgoff) {
> > -               int result = SCAN_FAIL;
> > -               struct mm_struct *mm = NULL;
> > -               unsigned long addr = 0;
> > -               pmd_t *pmd;
> > -               bool is_target = false;
> > +               struct mm_struct *mm;
> > +               unsigned long addr;
> > +               pmd_t *pmd, pgt_pmd;
> > +               spinlock_t *pml;
> > +               spinlock_t *ptl;
> >
> >                 /*
> >                  * Check vma->anon_vma to exclude MAP_PRIVATE mappings that
> > -                * got written to. These VMAs are likely not worth investing
> > -                * mmap_write_lock(mm) as PMD-mapping is likely to be split
> > -                * later.
> > +                * got written to. These VMAs are likely not worth removing
> > +                * page tables from, as PMD-mapping is likely to be split later.
> >                  *
> > -                * Note that vma->anon_vma check is racy: it can be set up after
> > -                * the check but before we took mmap_lock by the fault path.
> > -                * But page lock would prevent establishing any new ptes of the
> > -                * page, so we are safe.
> > -                *
> > -                * An alternative would be drop the check, but check that page
> > -                * table is clear before calling pmdp_collapse_flush() under
> > -                * ptl. It has higher chance to recover THP for the VMA, but
> > -                * has higher cost too. It would also probably require locking
> > -                * the anon_vma.
> > +                * Note that vma->anon_vma check is racy: it can be set after
> > +                * the check, but page locks (with XA_RETRY_ENTRYs in holes)
> > +                * prevented establishing new ptes of the page. So we are safe
> > +                * to remove page table below, without even checking it's empty.
> 
> This "we are safe to remove page table below, without even checking
> it's empty" assumes that the only way to create new anonymous PTEs is
> to use existing file PTEs, right? What about private shmem VMAs that
> are registered with userfaultfd as VM_UFFD_MISSING? I think for those,
> the UFFDIO_COPY ioctl lets you directly insert anonymous PTEs without
> looking at the mapping and its pages (except for checking that the
> insertion point is before end-of-file), protected only by mmap_lock
> (shared) and pte_offset_map_lock().

Hmm, yes.  We probably need to keep that though, and 5b51072e97 explained
the reason (to still respect file permissions).

Maybe the anon_vma check can also be moved into the pgtable lock section,
with some comments explaining (but it's getting a bit ugly..)?

> 
> 
> >                  */
> > -               if (READ_ONCE(vma->anon_vma)) {
> > -                       result = SCAN_PAGE_ANON;
> > -                       goto next;
> > -               }
> > +               if (READ_ONCE(vma->anon_vma))
> > +                       continue;
> > +
> >                 addr = vma->vm_start + ((pgoff - vma->vm_pgoff) << PAGE_SHIFT);
> >                 if (addr & ~HPAGE_PMD_MASK ||
> > -                   vma->vm_end < addr + HPAGE_PMD_SIZE) {
> > -                       result = SCAN_VMA_CHECK;
> > -                       goto next;
> > -               }
> > -               mm = vma->vm_mm;
> > -               is_target = mm == target_mm && addr == target_addr;
> > -               result = find_pmd_or_thp_or_none(mm, addr, &pmd);
> > -               if (result != SCAN_SUCCEED)
> > -                       goto next;
> > -               /*
> > -                * We need exclusive mmap_lock to retract page table.
> > -                *
> > -                * We use trylock due to lock inversion: we need to acquire
> > -                * mmap_lock while holding page lock. Fault path does it in
> > -                * reverse order. Trylock is a way to avoid deadlock.
> > -                *
> > -                * Also, it's not MADV_COLLAPSE's job to collapse other
> > -                * mappings - let khugepaged take care of them later.
> > -                */
> > -               result = SCAN_PTE_MAPPED_HUGEPAGE;
> > -               if ((cc->is_khugepaged || is_target) &&
> > -                   mmap_write_trylock(mm)) {
> > -                       /* trylock for the same lock inversion as above */
> > -                       if (!vma_try_start_write(vma))
> > -                               goto unlock_next;
> > -
> > -                       /*
> > -                        * Re-check whether we have an ->anon_vma, because
> > -                        * collapse_and_free_pmd() requires that either no
> > -                        * ->anon_vma exists or the anon_vma is locked.
> > -                        * We already checked ->anon_vma above, but that check
> > -                        * is racy because ->anon_vma can be populated under the
> > -                        * mmap lock in read mode.
> > -                        */
> > -                       if (vma->anon_vma) {
> > -                               result = SCAN_PAGE_ANON;
> > -                               goto unlock_next;
> > -                       }
> > -                       /*
> > -                        * When a vma is registered with uffd-wp, we can't
> > -                        * recycle the pmd pgtable because there can be pte
> > -                        * markers installed.  Skip it only, so the rest mm/vma
> > -                        * can still have the same file mapped hugely, however
> > -                        * it'll always mapped in small page size for uffd-wp
> > -                        * registered ranges.
> > -                        */
> > -                       if (hpage_collapse_test_exit(mm)) {
> > -                               result = SCAN_ANY_PROCESS;
> > -                               goto unlock_next;
> > -                       }
> > -                       if (userfaultfd_wp(vma)) {
> > -                               result = SCAN_PTE_UFFD_WP;
> > -                               goto unlock_next;
> > -                       }
> > -                       collapse_and_free_pmd(mm, vma, addr, pmd);
> 
> The old code called collapse_and_free_pmd(), which involves MMU
> notifier invocation...
> 
> > -                       if (!cc->is_khugepaged && is_target)
> > -                               result = set_huge_pmd(vma, addr, pmd, hpage);
> > -                       else
> > -                               result = SCAN_SUCCEED;
> > -
> > -unlock_next:
> > -                       mmap_write_unlock(mm);
> > -                       goto next;
> > -               }
> > -               /*
> > -                * Calling context will handle target mm/addr. Otherwise, let
> > -                * khugepaged try again later.
> > -                */
> > -               if (!is_target) {
> > -                       khugepaged_add_pte_mapped_thp(mm, addr);
> > +                   vma->vm_end < addr + HPAGE_PMD_SIZE)
> >                         continue;
> > -               }
> > -next:
> > -               if (is_target)
> > -                       target_result = result;
> > +
> > +               mm = vma->vm_mm;
> > +               if (find_pmd_or_thp_or_none(mm, addr, &pmd) != SCAN_SUCCEED)
> > +                       continue;
> > +
> > +               if (hpage_collapse_test_exit(mm))
> > +                       continue;
> > +               /*
> > +                * When a vma is registered with uffd-wp, we cannot recycle
> > +                * the page table because there may be pte markers installed.
> > +                * Other vmas can still have the same file mapped hugely, but
> > +                * skip this one: it will always be mapped in small page size
> > +                * for uffd-wp registered ranges.
> > +                *
> > +                * What if VM_UFFD_WP is set a moment after this check?  No
> > +                * problem, huge page lock is still held, stopping new mappings
> > +                * of page which might then get replaced by pte markers: only
> > +                * existing markers need to be protected here.  (We could check
> > +                * after getting ptl below, but this comment distracting there!)
> > +                */
> > +               if (userfaultfd_wp(vma))
> > +                       continue;
> > +
> > +               /* Huge page lock is still held, so page table must be empty */
> > +               pml = pmd_lock(mm, pmd);
> > +               ptl = pte_lockptr(mm, pmd);
> > +               if (ptl != pml)
> > +                       spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
> > +               pgt_pmd = pmdp_collapse_flush(vma, addr, pmd);
> 
> ... while the new code only does pmdp_collapse_flush(), which clears
> the pmd entry and does a TLB flush, but AFAICS doesn't use MMU
> notifiers. My understanding is that that's problematic - maybe (?) it
> is sort of okay with regards to classic MMU notifier users like KVM,
> but it's probably wrong for IOMMUv2 users, where an IOMMU directly
> consumes the normal page tables?

The iommuv2 wasn't "consuming" the pgtables?  IIUC it relies on that to
make sure no secondary (and illegal) tlb exists in the iommu tlbs.

For this case if the pgtable _must_ be empty when reaching here (we'd
better make sure of it..), maybe we're good?  Because we should have just
invalidated once when unmap all the pages in the thp range, so no existing
tlb should generate anyway for either cpu or iommu hardwares.

However OTOH, maybe it'll also be safer to just have the mmu notifiers like
before (e.g., no idea whether anything can cache invalidate tlb
translations from the empty pgtable)? As that doesn't seems to beat the
purpose of the patchset as notifiers shouldn't fail.

> 
> (FWIW, last I looked, there also seemed to be some other issues with
> MMU notifier usage wrt IOMMUv2, see the thread
> <https://lore.kernel.org/linux-mm/Yzbaf9HW1%2FreKqR8@nvidia.com/>.)
> 
> 
> > +               if (ptl != pml)
> > +                       spin_unlock(ptl);
> > +               spin_unlock(pml);
> > +
> > +               mm_dec_nr_ptes(mm);
> > +               page_table_check_pte_clear_range(mm, addr, pgt_pmd);
> > +               pte_free_defer(mm, pmd_pgtable(pgt_pmd));
> >         }
> > -       i_mmap_unlock_write(mapping);
> > -       return target_result;
> > +       i_mmap_unlock_read(mapping);
> >  }
> >
> >  /**
> > @@ -2261,9 +2210,11 @@ static int collapse_file(struct mm_struct *mm, unsigned long addr,
> >
> >         /*
> >          * Remove pte page tables, so we can re-fault the page as huge.
> > +        * If MADV_COLLAPSE, adjust result to call collapse_pte_mapped_thp().
> >          */
> > -       result = retract_page_tables(mapping, start, mm, addr, hpage,
> > -                                    cc);
> > +       retract_page_tables(mapping, start);
> > +       if (cc && !cc->is_khugepaged)
> > +               result = SCAN_PTE_MAPPED_HUGEPAGE;
> >         unlock_page(hpage);
> >
> >         /*
> > --
> > 2.35.3
> >
> 

-- 
Peter Xu

