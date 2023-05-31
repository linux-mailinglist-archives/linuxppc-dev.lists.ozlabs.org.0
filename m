Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 889CC71886D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 May 2023 19:26:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWblj1NW7z3fG4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 03:26:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=pPY2FZvQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com; envelope-from=jannh@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=pPY2FZvQ;
	dkim-atps=neutral
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWbks6vzxz3cCh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 03:25:40 +1000 (AEST)
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-33b398f2ab8so10705ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 May 2023 10:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1685553937; x=1688145937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f9rDw2v1LEmye3RLuD/RrrSGCh1UZ3V6JVzZJFvjbWQ=;
        b=pPY2FZvQFtkDzHzwujcrcVV1o6urAaQAKVD7hUnhGzcrrNFmSGt2E8p0G1SJstcN3P
         rEy92IErBB/gIX0E6S683fJGWg6huMyO7xVoLXH4uoxmjwGBsnTQnluGeQrklkKO1g+3
         o9EkWGghzH1l3GeROw+T5Le/Bk788QRWG9RyF7qblX+iPNkL33x8yL0QjlgITNlsDPlA
         /zIT05f78cjbOGS7EbFlYn+rh7mj7OT2TrcOUMi/GiTNQB0dRJUs5umCCeh2Wbg+DOvm
         ut0FOUzoqnSARdClPb9K37XdGgds4b3SteralKC3Jyx7kj7f3Mh+XYZ6zrxJZ2+f0zYh
         jb0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685553937; x=1688145937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9rDw2v1LEmye3RLuD/RrrSGCh1UZ3V6JVzZJFvjbWQ=;
        b=ARVdNyqBDppA8LfyfDvp4bOvd0xtvLrTR/EaNh/N/1TTFKizhlp1aHw6OtES03GChH
         vjYnSbJ7PlQdxn0OyZ35FNBpTXd7oO4XHzMAFAozoIiuztSbkzhIm5A+sGW4t7iPHP/g
         eLEjcO4RFqJH2gjoO9VQg72/FzDdC+1mGZgdfXq2NK/ZhlJEO88fdSYRpFjjmVNmUuof
         +/A0X9sOUln4W8NjUn2sFg5+OK3cHTyCAGsdZ3bLd7T1s+eypsqpOQEdvkqCWtPa4uEE
         ilG2H9a/oQBdDtQPx58RM4iBfbt/tzZN1L7fw6rgXpJPCLCacG2Zj71QxogFLLE4z0mp
         Kf0A==
X-Gm-Message-State: AC+VfDwY4qZ21qVOUBFwMa0AKQbPbU7A2p/C/bBd1LW1bRQRFlYSq7Lb
	jc6AMMG+tGFDdQjo/zAjmnTs6gJ0JByu5ge4/i7DaQ==
X-Google-Smtp-Source: ACHHUZ6Afl+xZKFHZomNksLJA//ac6T4P12fNCTRCN7NynywZdGagjN9pdDeftj4IADrAcP1/u34lNvJe8J80I1ISvg=
X-Received: by 2002:a05:6e02:1a44:b0:33a:e716:a76e with SMTP id
 u4-20020a056e021a4400b0033ae716a76emr187444ilv.28.1685553937544; Wed, 31 May
 2023 10:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <35e983f5-7ed3-b310-d949-9ae8b130cdab@google.com> <563340a4-7ac9-7cc8-33d8-f7cc6ef19ea6@google.com>
In-Reply-To: <563340a4-7ac9-7cc8-33d8-f7cc6ef19ea6@google.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 31 May 2023 19:25:01 +0200
Message-ID: <CAG48ez2X5oZyxaFniZ-HeGHDGjNuPBewGTjZLEHPWkBbBCaigg@mail.gmail.com>
Subject: Re: [PATCH 10/12] mm/khugepaged: collapse_pte_mapped_thp() with mmap_read_lock()
To: Hugh Dickins <hughd@google.com>
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Yang Shi <shy828301@gmail.com>, Peter Xu <peterx@redhat.com>, Song Liu <song@kernel.org>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-s390@vger.kernel.org, Yu Zhao <yuzhao@google.com>, Ira Weiny <ira.weiny@intel.com>, Alistair Popple <apopple@nvidia.com>, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, Steven Price <steven.price@arm.com>, Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Axel Rasmussen <axelrasmussen@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Thomas Hellstrom <thomas.hellstrom@linux.intel.com>, Ralph Campbell <rcampbell@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Ca
 rstens <hca@linux.ibm.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Naoya Horiguchi <naoya.horiguchi@nec.com>, linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>, Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mel Gorman <mgorman@techsingularity.net>, "David S. Miller" <davem@davemloft.net>, Zack Rusin <zackr@vmware.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 29, 2023 at 8:26=E2=80=AFAM Hugh Dickins <hughd@google.com> wro=
te:
> Bring collapse_and_free_pmd() back into collapse_pte_mapped_thp().
> It does need mmap_read_lock(), but it does not need mmap_write_lock(),
> nor vma_start_write() nor i_mmap lock nor anon_vma lock.  All racing
> paths are relying on pte_offset_map_lock() and pmd_lock(), so use those.

I think there's a weirdness in the existing code, and this change
probably turns that into a UAF bug.

collapse_pte_mapped_thp() can be called on an address that might not
be associated with a VMA anymore, and after this change, the page
tables for that address might be in the middle of page table teardown
in munmap(), right? The existing mmap_write_lock() guards against
concurrent munmap() (so in the old code we are guaranteed to either
see a normal VMA or not see the page tables anymore), but
mmap_read_lock() only guards against the part of munmap() up to the
mmap_write_downgrade() in do_vmi_align_munmap(), and unmap_region()
(including free_pgtables()) happens after that.

So we can now enter collapse_pte_mapped_thp() and race with concurrent
free_pgtables() such that a PUD disappears under us while we're
walking it or something like that:


int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
          bool install_pmd)
{
  struct mmu_notifier_range range;
  unsigned long haddr =3D addr & HPAGE_PMD_MASK;
  struct vm_area_struct *vma =3D vma_lookup(mm, haddr); // <<< returns NULL
  struct page *hpage;
  pte_t *start_pte, *pte;
  pmd_t *pmd, pgt_pmd;
  spinlock_t *pml, *ptl;
  int nr_ptes =3D 0, result =3D SCAN_FAIL;
  int i;

  mmap_assert_locked(mm);

  /* Fast check before locking page if already PMD-mapped */
  result =3D find_pmd_or_thp_or_none(mm, haddr, &pmd); // <<< PUD UAF in he=
re
  if (result =3D=3D SCAN_PMD_MAPPED)
    return result;

  if (!vma || !vma->vm_file || // <<< bailout happens too late
      !range_in_vma(vma, haddr, haddr + HPAGE_PMD_SIZE))
    return SCAN_VMA_CHECK;


I guess the right fix here is to make sure that at least the basic VMA
revalidation stuff (making sure there still is a VMA covering this
range) happens before find_pmd_or_thp_or_none()? Like:


diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 301c0e54a2ef..5db365587556 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1481,15 +1481,15 @@ int collapse_pte_mapped_thp(struct mm_struct
*mm, unsigned long addr,

         mmap_assert_locked(mm);

+        if (!vma || !vma->vm_file ||
+            !range_in_vma(vma, haddr, haddr + HPAGE_PMD_SIZE))
+                return SCAN_VMA_CHECK;
+
         /* Fast check before locking page if already PMD-mapped */
         result =3D find_pmd_or_thp_or_none(mm, haddr, &pmd);
         if (result =3D=3D SCAN_PMD_MAPPED)
                 return result;

-        if (!vma || !vma->vm_file ||
-            !range_in_vma(vma, haddr, haddr + HPAGE_PMD_SIZE))
-                return SCAN_VMA_CHECK;
-
         /*
          * If we are here, we've succeeded in replacing all the native pag=
es
          * in the page cache with a single hugepage. If a mm were to fault=
-in
