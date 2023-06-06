Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FD7723779
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 08:19:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb0gs0dJpz3f6S
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 16:19:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=YVpcnR57;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com; envelope-from=hughd@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=YVpcnR57;
	dkim-atps=neutral
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com [IPv6:2607:f8b0:4864:20::112b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb0fy2mYvz3bhK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 16:19:05 +1000 (AEST)
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-565cfe4ece7so62695957b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jun 2023 23:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686032342; x=1688624342;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+sTRYTVdx/ux01uBjEjpeUqJbg1WCUQQStTJJJ+iSYQ=;
        b=YVpcnR57XK58Ak9HJaKiD+AbmN0H/CYge3w1rDZy+kp+ixEQ5UXDhUW9pOYeesSqFj
         UIRUIc+94+rFepe5SS0IdOo5iztw/rOy6CZpzWrU+IO4mNui1Zkgo9h3jingrr3fdVeR
         HIuDw7tANLptHE48ffNhMDJFR/2yVZoygTObBxZHLrYwZ5ig0FO5oMVOAbG5JmgJ0UWU
         6+2GTtgCPvXlaoClixmzd6lsXHoN+YRamBAk/DTYCWg1LdM33PXGWziAwYwNFEbX76sd
         8nwM0BIPLw8ZG/nUnsDIXqbiioZwSbfpAnbTQqesPpDB88/NKXiVlbDpREXhm6LvGiU9
         9BzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686032342; x=1688624342;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+sTRYTVdx/ux01uBjEjpeUqJbg1WCUQQStTJJJ+iSYQ=;
        b=GFlOY7Kbht/h/+7d/fovrxbWbc5FSD+jkT0Necw+9SZDOW48KqWHNbp0964Z7KcsC2
         FsyyVCYwoVck9apz6hrJJ2/l8+mwT2kOfPnLTGplA0515sYhV2H33IMQcUO96O8MlyYW
         AMTxh94wb/Rb+FSZ7/ZtyO3ct1hRfDObX5rbvDiCENWEL46FjyWycmv07+cprhJNp7Em
         wosPln4tOMhdmiZrlvY8nrKZpLVljCVIuD22BgT+bSd/eP4SE5N7IoHq7TBhBYwIf9R5
         Q2+6T2JTK5IRmZLLp0s/5pZREHUZkTptkmZSbRJIP37OTpR2mW2I5zaIzLflRDgPNOKc
         V1Yg==
X-Gm-Message-State: AC+VfDwaPly5MtyStCR1l98Viv+icIYymhVOhxpgUri9RpvMnxs3KiZc
	yUsrPCgH6geeyu4M+KlVl3VMRQ==
X-Google-Smtp-Source: ACHHUZ5WPUWoPm4xuDxQsHa6AYmw1XOJYysfo3qH0lT+OY94v7UN7xIfgoB+mAV06b+Ahd1uLZ7ohg==
X-Received: by 2002:a81:6d46:0:b0:565:d3f9:209e with SMTP id i67-20020a816d46000000b00565d3f9209emr1132264ywc.34.1686032341554;
        Mon, 05 Jun 2023 23:19:01 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id i187-20020a816dc4000000b0055d820f11cesm3876070ywc.13.2023.06.05.23.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 23:19:00 -0700 (PDT)
Date: Mon, 5 Jun 2023 23:18:50 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH 09/12] mm/khugepaged: retract_page_tables() without mmap
 or vma lock
In-Reply-To: <CAG48ez0aF1Rf1apSjn9YcnfyFQ4YqSd4GqB6f2wfhF7jMdi5Hg@mail.gmail.com>
Message-ID: <c096f6fb-93c4-3f23-7698-8e4c5286c2b2@google.com>
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com> <2e9996fa-d238-e7c-1194-834a2bd1f60@google.com> <CAG48ez0aF1Rf1apSjn9YcnfyFQ4YqSd4GqB6f2wfhF7jMdi5Hg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463760895-64387534-1686032340=:3708"
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@solee
 n.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463760895-64387534-1686032340=:3708
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 31 May 2023, Jann Horn wrote:
> On Mon, May 29, 2023 at 8:25=E2=80=AFAM Hugh Dickins <hughd@google.com> w=
rote:
> > +static void retract_page_tables(struct address_space *mapping, pgoff_t=
 pgoff)
=2E..
> > +                * Note that vma->anon_vma check is racy: it can be set=
 after
> > +                * the check, but page locks (with XA_RETRY_ENTRYs in h=
oles)
> > +                * prevented establishing new ptes of the page. So we a=
re safe
> > +                * to remove page table below, without even checking it=
's empty.
>=20
> This "we are safe to remove page table below, without even checking
> it's empty" assumes that the only way to create new anonymous PTEs is
> to use existing file PTEs, right? What about private shmem VMAs that
> are registered with userfaultfd as VM_UFFD_MISSING? I think for those,
> the UFFDIO_COPY ioctl lets you directly insert anonymous PTEs without
> looking at the mapping and its pages (except for checking that the
> insertion point is before end-of-file), protected only by mmap_lock
> (shared) and pte_offset_map_lock().

Right, from your comments and Peter's, thank you both, I can see that
userfaultfd breaks the usual assumptions here: so I'm putting an
=09=09if (unlikely(vma->anon_vma || userfaultfd_wp(vma)))
check in once we've got the ptlock; with a comment above it to point
the blame at uffd, though I gave up on describing all the detail.
And deleted this earlier "we are safe" paragraph.

You did suggest, in another mail, that perhaps there should be a scan
checking all pte_none() when we get the ptlock.  I wasn't keen on yet
another debug scan for bugs and didn't add that, thinking I was going
to add a patch on the end to do so in page_table_check_pte_clear_range().

But when I came to write that patch, found that I'd been misled by its
name: it's about checking or adjusting some accounting, not really a
suitable place to check for pte_none() at all; so just scrapped it.

=2E..
> > -                       collapse_and_free_pmd(mm, vma, addr, pmd);
>=20
> The old code called collapse_and_free_pmd(), which involves MMU
> notifier invocation...

=2E..
> > +               pml =3D pmd_lock(mm, pmd);
> > +               ptl =3D pte_lockptr(mm, pmd);
> > +               if (ptl !=3D pml)
> > +                       spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
> > +               pgt_pmd =3D pmdp_collapse_flush(vma, addr, pmd);
>=20
> ... while the new code only does pmdp_collapse_flush(), which clears
> the pmd entry and does a TLB flush, but AFAICS doesn't use MMU
> notifiers. My understanding is that that's problematic - maybe (?) it
> is sort of okay with regards to classic MMU notifier users like KVM,
> but it's probably wrong for IOMMUv2 users, where an IOMMU directly
> consumes the normal page tables?

Right, I intentionally left out the MMU notifier invocation, knowing
that we have already done an MMU notifier invocation when unmapping
any PTEs which were mapped: it was necessary for collapse_and_free_pmd()
in the collapse_pte_mapped_thp() case, but there was no notifier in this
case for many years, and I was glad to be rid of it.

However, I now see that you were adding it intentionally even for this
case in your f268f6cf875f; and from later comments in this thread, it
looks like there is still uncertainty about whether it is needed here,
but safer to assume that it is needed: I'll add it back.

>=20
> (FWIW, last I looked, there also seemed to be some other issues with
> MMU notifier usage wrt IOMMUv2, see the thread
> <https://lore.kernel.org/linux-mm/Yzbaf9HW1%2FreKqR8@nvidia.com/>.)
---1463760895-64387534-1686032340=:3708--
