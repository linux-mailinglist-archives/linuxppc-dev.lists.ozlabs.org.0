Return-Path: <linuxppc-dev+bounces-1564-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCEC984188
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 11:04:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCYpB2cYbz2yZd;
	Tue, 24 Sep 2024 19:04:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727168674;
	cv=none; b=XVktBNUmpRm7Gjo9bBttQGtgyRlP0huc6CKW80QH1/L/2Cu8mB8nlvujuBp9TTgc8CpDaFXAUQKnnO6GCs/ojjQ3HFm9R/MdF2urJMMucu3dFq4BXfHQM3ZXBhx5lkJHVCKNL9qUCVvQXNxgKhAx8puCvJndYaxRQN2pFkAtdBi1Z7ZMxB3U/V/d7b0ViqXA8H5WDYClBLvFCBE7UQXvkefnqWpyqkKpvYxSfdyb8a28z6cC/SYdk86O0evf1mPNTqg5/X/JOxEANYu+A0qEYbzFxAA6ciu5Jwlwjn8hCabKI++cCTwuZq4a3XBwUofL+DGZbUySnoG1NkkSsxaVvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727168674; c=relaxed/relaxed;
	bh=abs3n/vpyfYl04oV7NjYPSTvEDkl0o9BNDpstpMewHs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=APs2tohdSCMg1rpyG3efMKSmbI6zzswmXYfaGV06NJ8mDNqbUyk+EKtFNu6PRRz/ZoBamIZx6+kMgruaPCMzpiInhiQ+OOWYMNoTi8UeGF40OgE1GK5NZc/3PntUkzy3uzN1i+9s8ltsX4x1j8nT0/gYek1X+PkWr8y6m7Uu8efme5L+qeLP7tc6DE4A+rXBVHro/QcGd23bo9dH6gKYykYXRBc6ZtkIrygwnYNtdoj/lwoImRTXAWB72gG7yq280/N3+Mh6bW0lmhgEBeFJ7MH9zmTUum43M8e30OXrS39yMZnJDgLfjwbWf1iNV6WWdwUYD+s7fDLE9vz2gJJ6yQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Z0vloto/; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::b1; helo=out-177.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Z0vloto/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b1; helo=out-177.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCYp85ch1z2yRd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 19:04:30 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727168648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=abs3n/vpyfYl04oV7NjYPSTvEDkl0o9BNDpstpMewHs=;
	b=Z0vloto/ZEnjeTfwU4wrjMDWCaS6OARpqwqeRDxUEenzjgdT65bmqjPHwc5jL058fGMvyK
	chtcsw3tPiZpoq0gwt8s4kHRiTzwlUAMLlJeT4RIymaVhIwbxxRTElrNhAhzUwKRBS9S4A
	NMmxn0ToZD0BtEm3Oak81Xuzkbyeyo8=
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH v4 07/13] mm: khugepaged: collapse_pte_mapped_thp() use
 pte_offset_map_rw_nolock()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <e9b08c12-8212-412f-9dbe-261b06367f6e@bytedance.com>
Date: Tue, 24 Sep 2024 17:03:16 +0800
Cc: david@redhat.com,
 hughd@google.com,
 willy@infradead.org,
 vbabka@kernel.org,
 akpm@linux-foundation.org,
 rppt@kernel.org,
 vishal.moola@gmail.com,
 peterx@redhat.com,
 ryan.roberts@arm.com,
 christophe.leroy2@cs-soprasteria.com,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <C0310EA0-CB67-48DA-B391-F4A6A2685D03@linux.dev>
References: <07d975c50fe09c246e087303b39998430b1a66bd.1727148662.git.zhengqi.arch@bytedance.com>
 <79699B24-0D99-4051-91F3-5695D32D62AC@linux.dev>
 <2343da2e-f91f-4861-bb22-28f77db98c52@bytedance.com>
 <1D1872F1-7280-4F43-8213-A720C56B0646@linux.dev>
 <e9b08c12-8212-412f-9dbe-261b06367f6e@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Sep 24, 2024, at 16:57, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>=20
>=20
>=20
> On 2024/9/24 16:52, Muchun Song wrote:
>>> On Sep 24, 2024, at 15:29, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>>>=20
>>>=20
>>>=20
>>> On 2024/9/24 15:14, Muchun Song wrote:
>>>>> On Sep 24, 2024, at 14:11, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>>>>> =EF=BB=BFIn collapse_pte_mapped_thp(), we may modify the pte and =
pmd entry after
>>>>> acquring the ptl, so convert it to using =
pte_offset_map_rw_nolock(). At
>>>>> this time, the pte_same() check is not performed after the PTL =
held. So we
>>>>> should get pgt_pmd and do pmd_same() check after the ptl held.
>>>>>=20
>>>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>>>> ---
>>>>> mm/khugepaged.c | 14 +++++++++++---
>>>>> 1 file changed, 11 insertions(+), 3 deletions(-)
>>>>>=20
>>>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>>>> index 6498721d4783a..8ab79c13d077f 100644
>>>>> --- a/mm/khugepaged.c
>>>>> +++ b/mm/khugepaged.c
>>>>> @@ -1605,7 +1605,7 @@ int collapse_pte_mapped_thp(struct mm_struct =
*mm, unsigned long addr,
>>>>>    if (userfaultfd_armed(vma) && !(vma->vm_flags & VM_SHARED))
>>>>>        pml =3D pmd_lock(mm, pmd);
>>>>>=20
>>>>> -    start_pte =3D pte_offset_map_nolock(mm, pmd, haddr, &ptl);
>>>>> +    start_pte =3D pte_offset_map_rw_nolock(mm, pmd, haddr, =
&pgt_pmd, &ptl);
>>>>>    if (!start_pte)        /* mmap_lock + page lock should prevent =
this */
>>>>>        goto abort;
>>>>>    if (!pml)
>>>>> @@ -1613,6 +1613,9 @@ int collapse_pte_mapped_thp(struct mm_struct =
*mm, unsigned long addr,
>>>>>    else if (ptl !=3D pml)
>>>>>        spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>>>>>=20
>>>>> +    if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
>>>>> +        goto abort;
>>>>> +
>>>>>    /* step 2: clear page table and adjust rmap */
>>>>>    for (i =3D 0, addr =3D haddr, pte =3D start_pte;
>>>>>         i < HPAGE_PMD_NR; i++, addr +=3D PAGE_SIZE, pte++) {
>>>>> @@ -1645,7 +1648,6 @@ int collapse_pte_mapped_thp(struct mm_struct =
*mm, unsigned long addr,
>>>>>        nr_ptes++;
>>>>>    }
>>>>>=20
>>>>> -    pte_unmap(start_pte);
>>>>>    if (!pml)
>>>>>        spin_unlock(ptl);
>>>>>=20
>>>>> @@ -1658,13 +1660,19 @@ int collapse_pte_mapped_thp(struct =
mm_struct *mm, unsigned long addr,
>>>>>    /* step 4: remove empty page table */
>>>>>    if (!pml) {
>>>>>        pml =3D pmd_lock(mm, pmd);
>>>>> -        if (ptl !=3D pml)
>>>>> +        if (ptl !=3D pml) {
>>>>>            spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>>>>> +            if (unlikely(!pmd_same(pgt_pmd, =
pmdp_get_lockless(pmd)))) {
>>>>> +                spin_unlock(pml);
>>>>> +                goto abort;
>>>> Drop the reference of folio and the mm counter twice at the label =
of abort and the step 3.
>>>=20
>>> My bad, should set nr_ptes to 0 and call flush_tlb_mm() here, right?
>> Or add a new label "out" just below the "abort". Then go to out.
>=20
> For this way, we also need to call flush_tlb_mm() first, like the
> following:
>=20
> if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd)))) {
> 	spin_unlock(pml);
> 	flush_tlb_mm(mm);
> 	goto out;
> }

Fine.

>=20
>>>=20
>>>>> +            }
>>>>> +        }
>>>>>    }
>>>>>    pgt_pmd =3D pmdp_collapse_flush(vma, haddr, pmd);
>>>>>    pmdp_get_lockless_sync();
>>>>>    if (ptl !=3D pml)
>>>>>        spin_unlock(ptl);
>>>>> +    pte_unmap(start_pte);
>>>>>    spin_unlock(pml);
>>>> Why not?
>>>> pte_unmap_unlock(start_pte, ptl);
>>>> if (pml !=3D ptl)
>>>>         spin_unlock(pml);
>>>=20
>>> Both are fine, will do.
>>>=20
>>> Thanks,
>>> Qi
>>>=20
>>>>>=20
>>>>>    mmu_notifier_invalidate_range_end(&range);
>>>>> --
>>>>> 2.20.1



