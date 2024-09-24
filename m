Return-Path: <linuxppc-dev+bounces-1562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB7798411F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 10:53:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCYYb5TMTz2yZN;
	Tue, 24 Sep 2024 18:53:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.171
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727168019;
	cv=none; b=KQUwR0mNLcF8bGfpPg97qPxyM4+cKIEx5IwjMmSVdM6TOE/HDOHBBdvEQWcCZ5hyUfoLBl62RmwY0UUL/m2XdbijNb4YdzbN7zzZyUCZDwh+6fICu8rHBOBrzhK3co6ByOGhNhxL+PfuLNIbxGmyZx3jkER5j8uj8+anGIxiRuuZ0Z/tcngJ0a2HEqsWudJy+bm2n4WBIIO5XXcrhNdvJi4s9a/vOV9z1zm023xTeVLhFHHUUOe7G8NaB1TaEPgXtfFTtiQsdyFSNzEg6aIQ4KeJAvnOTdLDzWw7YBXZtAWh6Db0nLdDLqPRONuVaA2SsfynwAM5fQDcRCepnxB9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727168019; c=relaxed/relaxed;
	bh=wpyNjX3SywB8uvA6z8NNxtoy61vc2SVjYp0FLcYU0Bg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=UeKWFsNXJ5Dt2/5O8zdB6HeOfWRhnpCIOOoxZniz2HfOw3FCA41FZ9PJ+AmUgnZ/IfiN5Y3eA9ZF+rBUSGFajyKhPaLdOkJPcN4Yzf8Bm82GbXDAmnCjfRYBvGE0jEnvneNpxzV0qPgItIy1D1oN/+zZ6m+CMprmKnZ0GO/QAEj8Z+rpA4bj4ApYY0x8A5TIenYhARFVK93x1pLglMJ2KumQuwatkzshtwJDPQ+K6yrIS8JACIluZunrMO/x2d4dBMUewLLK7pROG4/Q/G2Qc4m5l9MRW4yRUkM5So7maKYB5fzjnMm4wAjJazlk7bkTVPG3eEjIJ8pZ7Yyir7cu9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y/NlUSsN; dkim-atps=neutral; spf=pass (client-ip=91.218.175.171; helo=out-171.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y/NlUSsN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.171; helo=out-171.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCYYZ083bz2yTs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 18:53:36 +1000 (AEST)
Content-Type: text/plain;
	charset=utf-8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1727167995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wpyNjX3SywB8uvA6z8NNxtoy61vc2SVjYp0FLcYU0Bg=;
	b=Y/NlUSsNLr1ACfiVoikNI877ntJ8eQYVJ79owK8l2o96uz/W+SW5BzZ9Yl2sW1QHthH6qw
	/K38dLAstL3gN/S/H9vCtK6QVpg/3wmjbBNVlh8Sm8CfOZrojR5+YCAeqlErfWBM3S6tYR
	84G6gXzxoUGE03YcUoZZL6IjT8URxhc=
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
In-Reply-To: <2343da2e-f91f-4861-bb22-28f77db98c52@bytedance.com>
Date: Tue, 24 Sep 2024 16:52:34 +0800
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
Message-Id: <1D1872F1-7280-4F43-8213-A720C56B0646@linux.dev>
References: <07d975c50fe09c246e087303b39998430b1a66bd.1727148662.git.zhengqi.arch@bytedance.com>
 <79699B24-0D99-4051-91F3-5695D32D62AC@linux.dev>
 <2343da2e-f91f-4861-bb22-28f77db98c52@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Sep 24, 2024, at 15:29, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>=20
>=20
>=20
> On 2024/9/24 15:14, Muchun Song wrote:
>>> On Sep 24, 2024, at 14:11, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>>> =EF=BB=BFIn collapse_pte_mapped_thp(), we may modify the pte and pmd =
entry after
>>> acquring the ptl, so convert it to using pte_offset_map_rw_nolock(). =
At
>>> this time, the pte_same() check is not performed after the PTL held. =
So we
>>> should get pgt_pmd and do pmd_same() check after the ptl held.
>>>=20
>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>> ---
>>> mm/khugepaged.c | 14 +++++++++++---
>>> 1 file changed, 11 insertions(+), 3 deletions(-)
>>>=20
>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>> index 6498721d4783a..8ab79c13d077f 100644
>>> --- a/mm/khugepaged.c
>>> +++ b/mm/khugepaged.c
>>> @@ -1605,7 +1605,7 @@ int collapse_pte_mapped_thp(struct mm_struct =
*mm, unsigned long addr,
>>>    if (userfaultfd_armed(vma) && !(vma->vm_flags & VM_SHARED))
>>>        pml =3D pmd_lock(mm, pmd);
>>>=20
>>> -    start_pte =3D pte_offset_map_nolock(mm, pmd, haddr, &ptl);
>>> +    start_pte =3D pte_offset_map_rw_nolock(mm, pmd, haddr, =
&pgt_pmd, &ptl);
>>>    if (!start_pte)        /* mmap_lock + page lock should prevent =
this */
>>>        goto abort;
>>>    if (!pml)
>>> @@ -1613,6 +1613,9 @@ int collapse_pte_mapped_thp(struct mm_struct =
*mm, unsigned long addr,
>>>    else if (ptl !=3D pml)
>>>        spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>>>=20
>>> +    if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
>>> +        goto abort;
>>> +
>>>    /* step 2: clear page table and adjust rmap */
>>>    for (i =3D 0, addr =3D haddr, pte =3D start_pte;
>>>         i < HPAGE_PMD_NR; i++, addr +=3D PAGE_SIZE, pte++) {
>>> @@ -1645,7 +1648,6 @@ int collapse_pte_mapped_thp(struct mm_struct =
*mm, unsigned long addr,
>>>        nr_ptes++;
>>>    }
>>>=20
>>> -    pte_unmap(start_pte);
>>>    if (!pml)
>>>        spin_unlock(ptl);
>>>=20
>>> @@ -1658,13 +1660,19 @@ int collapse_pte_mapped_thp(struct mm_struct =
*mm, unsigned long addr,
>>>    /* step 4: remove empty page table */
>>>    if (!pml) {
>>>        pml =3D pmd_lock(mm, pmd);
>>> -        if (ptl !=3D pml)
>>> +        if (ptl !=3D pml) {
>>>            spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>>> +            if (unlikely(!pmd_same(pgt_pmd, =
pmdp_get_lockless(pmd)))) {
>>> +                spin_unlock(pml);
>>> +                goto abort;
>> Drop the reference of folio and the mm counter twice at the label of =
abort and the step 3.
>=20
> My bad, should set nr_ptes to 0 and call flush_tlb_mm() here, right?

Or add a new label "out" just below the "abort". Then go to out.

>=20
>>> +            }
>>> +        }
>>>    }
>>>    pgt_pmd =3D pmdp_collapse_flush(vma, haddr, pmd);
>>>    pmdp_get_lockless_sync();
>>>    if (ptl !=3D pml)
>>>        spin_unlock(ptl);
>>> +    pte_unmap(start_pte);
>>>    spin_unlock(pml);
>> Why not?
>> pte_unmap_unlock(start_pte, ptl);
>> if (pml !=3D ptl)
>>         spin_unlock(pml);
>=20
> Both are fine, will do.
>=20
> Thanks,
> Qi
>=20
>>>=20
>>>    mmu_notifier_invalidate_range_end(&range);
>>> --
>>> 2.20.1



