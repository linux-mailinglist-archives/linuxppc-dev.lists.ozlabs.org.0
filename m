Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70116783832
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 04:52:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Q0qcwIyC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVDRK2fHrz3c0X
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 12:52:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=Q0qcwIyC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=hughd@google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVDQP2140z2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Aug 2023 12:51:56 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d74a012e613so2700701276.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 19:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1692672710; x=1693277510;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BD58/XthciO0sTCaxjR+dsg5ZYNZ/J3nmIWihGISY24=;
        b=Q0qcwIyCJhThDsq21LrOEUM4nzcH1AytzGvc8q68ncl1mJ+TCbnsbsnqgXNKXHlnfV
         DW1P2aIRbJwxPz4W/lCAKObkYGQ21iOYfNp3rzyR5qwadhIk7ILSWaIULUS2h8WGw6a9
         rlXKAzIVrjqasXr8byUeVrdd0PyWBbTaDz736M7iFsTTtsTwOgxmkEgo8Y8npLfzZ6le
         vZjEl3gNCkWohBuLVPgBLHLBjkVeDc1/PGmPEP/IZ9tWMePJ1s8nI8wLexg9la++INv1
         iFWlafywvOUU+emzq1kdkkES4j9YqSSYxNCUuV1wQo77eM3kjveaJMseJ2onnShSco3s
         XhRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692672710; x=1693277510;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BD58/XthciO0sTCaxjR+dsg5ZYNZ/J3nmIWihGISY24=;
        b=CAW2JFY/Lc7UlyBEkpC9kCzfCyezGtKW7Kj8pLBRMTqqki17Ly5Im6Sl6YD9Gs0Xpv
         evpYuQxqIX1XEIFHdSuSk5T4JE+3xulhJRD+YJpnFZQSstkTd/7Wdzdo8LGmekOYzhIe
         lX3+QlsP0XMislC4YG8A1ftixDfCmmr77wQrcTNyPQg7QR19l9G7DyBfRF8HH5rcf4vX
         iHVYfwgzXCnnfHRjc0Kt1EriTxPO0wv6r26KBl6iSlDzpvRmvKv2F758ZEc1tpcWDSUv
         ltQ5zEKvWVWv1LJynbEUMT+xX8IQbuYC0qBbBDpa0aziu+y38DL3tCdvYdZS9c1WqbKd
         pjUw==
X-Gm-Message-State: AOJu0YxxiEzwYfb34uk4VcKr+2+0rm78GzP0PwZ3QAnXZnpl3TXXDF4L
	xWclsz0zjYFY8elQFR0Af43m0g==
X-Google-Smtp-Source: AGHT+IEEalFENjTwS6ybo+mX3CovLc5hqPqdTe+cS18Ojl4MmAmt12MBrpQ2mhlWRcpCfqQmCFJDnQ==
X-Received: by 2002:a05:6902:566:b0:d0f:dc7d:ff19 with SMTP id a6-20020a056902056600b00d0fdc7dff19mr6752743ybt.9.1692672710361;
        Mon, 21 Aug 2023 19:51:50 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id n82-20020a25da55000000b00d5d4bae6fdfsm2146761ybf.30.2023.08.21.19.51.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 19:51:49 -0700 (PDT)
Date: Mon, 21 Aug 2023 19:51:38 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Jann Horn <jannh@google.com>
Subject: Re: [PATCH mm-unstable] mm/khugepaged: fix collapse_pte_mapped_thp()
 versus uffd
In-Reply-To: <CAG48ez1XAePj5MUG8AUmnTjRLcxKre-NGYV82kB68-X8Rh6fxA@mail.gmail.com>
Message-ID: <f2dc6d6b-c516-932-1598-a58e2afffe9a@google.com>
References: <4d31abf5-56c0-9f3d-d12f-c9317936691@google.com> <CAG48ez1XAePj5MUG8AUmnTjRLcxKre-NGYV82kB68-X8Rh6fxA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="-1463760895-2088143463-1692672709=:1872"
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, kernel list <linux-kernel@vger.kernel.org>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390 <linux-s390@vger.kernel.org>, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Hugh Dickins <hughd@google.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, Huang Ying <ying.huang@intel.com>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ib
 m.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Vasily Gorbik <gor@linux.ibm.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, Linux-MM <linux-mm@kvack.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Naoya Horiguchi <naoya.horiguchi@nec.com>, Zack Rusin <zackr@vmware.com>, Zach O'Keefe <zokeefe@google.com>, Vishal Moola <vishal.moola@gmail.com>, Minchan Kim <minchan@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@or
 acle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463760895-2088143463-1692672709=:1872
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 21 Aug 2023, Jann Horn wrote:
> On Mon, Aug 21, 2023 at 9:51=E2=80=AFPM Hugh Dickins <hughd@google.com> w=
rote:
> > Jann Horn demonstrated how userfaultfd ioctl UFFDIO_COPY into a private
> > shmem mapping can add valid PTEs to page table collapse_pte_mapped_thp(=
)
> > thought it had emptied: page lock on the huge page is enough to protect
> > against WP faults (which find the PTE has been cleared), but not enough
> > to protect against userfaultfd.  "BUG: Bad rss-counter state" followed.
> >
> > retract_page_tables() protects against this by checking !vma->anon_vma;
> > but we know that MADV_COLLAPSE needs to be able to work on private shme=
m
> > mappings, even those with an anon_vma prepared for another part of the
> > mapping; and we know that MADV_COLLAPSE needs to work on shared shmem
> > mappings which are userfaultfd_armed().  Whether it needs to work on
> > private shmem mappings which are userfaultfd_armed(), I'm not so sure:
> > but assume that it does.
>=20
> I think we couldn't rely on anon_vma here anyway, since holding the
> mmap_lock in read mode doesn't prevent concurrent creation of an
> anon_vma?

We would have had to do the same as in retract_page_tables() (which
doesn't even have mmap_lock for read): recheck !vma->anon_vma after
finally acquiring ptlock.  But the !anon_vma limitation is certainly
not acceptable here anyway.

>=20
> > Just for this case, take the pmd_lock() two steps earlier: not because
> > it gives any protection against this case itself, but because ptlock
> > nests inside it, and it's the dropping of ptlock which let the bug in.
> > In other cases, continue to minimize the pmd_lock() hold time.
>=20
> Special-casing userfaultfd like this makes me a bit uncomfortable; but
> I also can't find anything other than userfaultfd that would insert
> pages into regions that are khugepaged-compatible, so I guess this
> works?

I'm as sure as I can be that it's solely because userfaultfd breaks
the usual rules here (and in fairness, IIRC Andrea did ask my permission
before making it behave that way on shmem, COWing without a source page).

Perhaps something else will want that same behaviour in future (it's
tempting, but difficult to guarantee correctness); for now, it is just
userfaultfd (but by saying "_armed" rather than "_missing", I'm half-
expecting uffd to add more such exceptional modes in future).

>=20
> I guess an alternative would be to use a spin_trylock() instead of the
> current pmd_lock(), and if that fails, temporarily drop the page table
> lock and then restart from step 2 with both locks held - and at that
> point the page table scan should be fast since we expect it to usually
> be empty.

That's certainly a good idea, if collapse on userfaultfd_armed private
is anything of a common case (I doubt, but I don't know).  It may be a
better idea anyway (saving a drop and retake of ptlock).

I gave it a try, expecting to end up with something that would lead
me to say "I tried it, but it didn't work out well"; but actually it
looks okay to me.  I wouldn't say I prefer it, but it seems reasonable,
and no more complicated (as Peter rightly observes) than the original.

It's up to you and Peter, and whoever has strong feelings about it,
to choose between them: I don't mind (but I shall be sad if someone
demands that I indent that comment deeper - I'm not a fan of long
multi-line comments near column 80).


[PATCH mm-unstable v2] mm/khugepaged: fix collapse_pte_mapped_thp() versus =
uffd

Jann Horn demonstrated how userfaultfd ioctl UFFDIO_COPY into a private
shmem mapping can add valid PTEs to page table collapse_pte_mapped_thp()
thought it had emptied: page lock on the huge page is enough to protect
against WP faults (which find the PTE has been cleared), but not enough
to protect against userfaultfd.  "BUG: Bad rss-counter state" followed.

retract_page_tables() protects against this by checking !vma->anon_vma;
but we know that MADV_COLLAPSE needs to be able to work on private shmem
mappings, even those with an anon_vma prepared for another part of the
mapping; and we know that MADV_COLLAPSE needs to work on shared shmem
mappings which are userfaultfd_armed().  Whether it needs to work on
private shmem mappings which are userfaultfd_armed(), I'm not so sure:
but assume that it does.

Now trylock pmd lock without dropping ptlock (suggested by jannh): if
that fails, drop and retake ptlock around taking pmd lock, and just in
the uffd private case, go back to recheck and empty the page table.

Reported-by: Jann Horn <jannh@google.com>
Closes: https://lore.kernel.org/linux-mm/CAG48ez0FxiRC4d3VTu_a9h=3Drg5FW-kY=
D5Rg5xo_RDBM0LTTqZQ@mail.gmail.com/
Fixes: 1043173eb5eb ("mm/khugepaged: collapse_pte_mapped_thp() with mmap_re=
ad_lock()")
Signed-off-by: Hugh Dickins <hughd@google.com>
---
 mm/khugepaged.c | 39 +++++++++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 40d43eccdee8..ad1c571772fe 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1476,7 +1476,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, uns=
igned long addr,
 =09struct page *hpage;
 =09pte_t *start_pte, *pte;
 =09pmd_t *pmd, pgt_pmd;
-=09spinlock_t *pml, *ptl;
+=09spinlock_t *pml =3D NULL, *ptl;
 =09int nr_ptes =3D 0, result =3D SCAN_FAIL;
 =09int i;
=20
@@ -1572,9 +1572,10 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, un=
signed long addr,
 =09=09=09=09haddr, haddr + HPAGE_PMD_SIZE);
 =09mmu_notifier_invalidate_range_start(&range);
 =09notified =3D true;
-=09start_pte =3D pte_offset_map_lock(mm, pmd, haddr, &ptl);
-=09if (!start_pte)=09=09/* mmap_lock + page lock should prevent this */
-=09=09goto abort;
+=09spin_lock(ptl);
+recheck:
+=09start_pte =3D pte_offset_map(pmd, haddr);
+=09VM_BUG_ON(!start_pte);=09/* mmap_lock + page lock should prevent this *=
/
=20
 =09/* step 2: clear page table and adjust rmap */
 =09for (i =3D 0, addr =3D haddr, pte =3D start_pte;
@@ -1608,20 +1609,36 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, u=
nsigned long addr,
 =09=09nr_ptes++;
 =09}
=20
-=09pte_unmap_unlock(start_pte, ptl);
+=09pte_unmap(start_pte);
=20
 =09/* step 3: set proper refcount and mm_counters. */
 =09if (nr_ptes) {
 =09=09page_ref_sub(hpage, nr_ptes);
 =09=09add_mm_counter(mm, mm_counter_file(hpage), -nr_ptes);
+=09=09nr_ptes =3D 0;
 =09}
=20
-=09/* step 4: remove page table */
+=09/* step 4: remove empty page table */
+=09if (!pml) {
+=09=09pml =3D pmd_lockptr(mm, pmd);
+=09=09if (pml !=3D ptl && !spin_trylock(pml)) {
+=09=09=09spin_unlock(ptl);
+=09=09=09spin_lock(pml);
+=09=09=09spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
+=09/*
+=09 * pmd_lock covers a wider range than ptl, and (if split from mm's
+=09 * page_table_lock) ptl nests inside pml. The less time we hold pml,
+=09 * the better; but userfaultfd's mfill_atomic_pte() on a private VMA
+=09 * inserts a valid as-if-COWed PTE without even looking up page cache.
+=09 * So page lock of hpage does not protect from it, so we must not drop
+=09 * ptl before pgt_pmd is removed, so uffd private needs rechecking.
+=09 */
+=09=09=09if (userfaultfd_armed(vma) &&
+=09=09=09    !(vma->vm_flags & VM_SHARED))
+=09=09=09=09goto recheck;
+=09=09}
+=09}
=20
-=09/* Huge page lock is still held, so page table must remain empty */
-=09pml =3D pmd_lock(mm, pmd);
-=09if (ptl !=3D pml)
-=09=09spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 =09pgt_pmd =3D pmdp_collapse_flush(vma, haddr, pmd);
 =09pmdp_get_lockless_sync();
 =09if (ptl !=3D pml)
@@ -1648,6 +1665,8 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, uns=
igned long addr,
 =09}
 =09if (start_pte)
 =09=09pte_unmap_unlock(start_pte, ptl);
+=09if (pml && pml !=3D ptl)
+=09=09spin_unlock(pml);
 =09if (notified)
 =09=09mmu_notifier_invalidate_range_end(&range);
 drop_hpage:
--=20
2.35.3
---1463760895-2088143463-1692672709=:1872--
