Return-Path: <linuxppc-dev+bounces-1030-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2A496CF57
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 08:34:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzqMD32zCz2yRC;
	Thu,  5 Sep 2024 16:34:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::ad"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725518040;
	cv=none; b=CnQlT+mafMwbyGkP+/JWFkbpns544aLmKPvyQM3Nm7+g7UBLZHm8wtFCYdN/cylT3u1q2h+NKvIeMQfc+3eww0mpQhOTNNUmgRQQCKmImGhvQunPiKZ/jd0F6Sya4RijS3Y63yo3pcEj0HvdJHvsCWrY7VQPCUGpqjeQL17t7ulYnRy70AfynW3k0rL5gBSp0sM8wSHnsBogJLyVZN8b09j3lFDE8rUu41CbuhwFveN987ibWZV7Lb/jPgtnYR9TVC60qqK8ctdSNnCkD5ZiWV62RXcw5QbZcOKPxCV2sgLFV0M956s8a1jGGAwl9Cmm+cp7FjgZHMLp+t+D12VyJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725518040; c=relaxed/relaxed;
	bh=ksx22GPeHsqr/AARD3Kz3GMedfunDXYI9hMA6uigG5g=;
	h=Content-Type:DKIM-Signature:Mime-Version:Subject:From:In-Reply-To:
	 Date:Cc:Message-Id:References:To; b=LxwiOniuxpojbfBSAVp1EYL7dECfqQBquK61s8HqaA25V0GUyx2eCAMUKCbd4Mxisy7zXUGYG+SMvwKqJyZFbhOrkJRgZd0Qj3LTl76r2SgL1yBQoueQhPqw1Fsl1mNBDon9KHsENu/HyZ02+c4pHAk8etEZyOyW0GmvTLt65cGdF9E4hKkiYJtG8UpdaXc1ocqFbIBNuOu9tNoTm/jMnh14zxUIXOP7YxLeo0Iztv9XDV7U62VU/hhCvDDtglGy80Zzp4Qe5L1Ikq178kVOUX4UyzZY6AqXlBca722cOk3fLh8yXM0uxvyaMHGtzNJZv84rTug/0ctwa6voFOGigQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RLu7mycF; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:1004:224b::ad; helo=out-173.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RLu7mycF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::ad; helo=out-173.mta0.migadu.com; envelope-from=muchun.song@linux.dev; receiver=lists.ozlabs.org)
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [IPv6:2001:41d0:1004:224b::ad])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzqM971znz2xr2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 16:33:54 +1000 (AEST)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725518009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ksx22GPeHsqr/AARD3Kz3GMedfunDXYI9hMA6uigG5g=;
	b=RLu7mycFOgF59AgkyN6sSQyBId6kbznssyisAv642gvR8ipqt29Lkad550xwM3XC5i0xuy
	w6vXjYG+TmTANMF23rlD1fddyYK7eqC0z5dDGe19Hl9oqA7jJgbrpuYJ7VxlJVwrKc2DzX
	9JP+wn68fbsvBkV8OiiriUiBUa01AUs=
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v2 07/14] mm: khugepaged: collapse_pte_mapped_thp() use
 pte_offset_map_rw_nolock()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <cd137540-ae01-46a1-93d2-062bc21b827c@bytedance.com>
Date: Thu, 5 Sep 2024 14:32:48 +0800
Cc: David Hildenbrand <david@redhat.com>,
 Hugh Dickins <hughd@google.com>,
 Matthew Wilcox <willy@infradead.org>,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
 Vishal Moola <vishal.moola@gmail.com>,
 Peter Xu <peterx@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>,
 christophe.leroy2@cs-soprasteria.com,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <05955456-8743-448A-B7A4-BC45FABEA628@linux.dev>
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
 <c377dab2bf55950e6155ea051aba3887ed5a2773.1724310149.git.zhengqi.arch@bytedance.com>
 <24be821f-a95f-47f1-879a-c392a79072cc@linux.dev>
 <cd137540-ae01-46a1-93d2-062bc21b827c@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Aug 30, 2024, at 14:54, Qi Zheng <zhengqi.arch@bytedance.com> =
wrote:
>=20
>=20
>=20
> On 2024/8/29 16:10, Muchun Song wrote:
>> On 2024/8/22 15:13, Qi Zheng wrote:
>>> In collapse_pte_mapped_thp(), we may modify the pte and pmd entry =
after
>>> acquring the ptl, so convert it to using pte_offset_map_rw_nolock(). =
At
>>> this time, the write lock of mmap_lock is not held, and the =
pte_same()
>>> check is not performed after the PTL held. So we should get pgt_pmd =
and do
>>> pmd_same() check after the ptl held.
>>>=20
>>> For the case where the ptl is released first and then the pml is =
acquired,
>>> the PTE page may have been freed, so we must do pmd_same() check =
before
>>> reacquiring the ptl.
>>>=20
>>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>>> ---
>>>  mm/khugepaged.c | 16 +++++++++++++++-
>>>  1 file changed, 15 insertions(+), 1 deletion(-)
>>>=20
>>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>>> index 53bfa7f4b7f82..15d3f7f3c65f2 100644
>>> --- a/mm/khugepaged.c
>>> +++ b/mm/khugepaged.c
>>> @@ -1604,7 +1604,7 @@ int collapse_pte_mapped_thp(struct mm_struct =
*mm, unsigned long addr,
>>>      if (userfaultfd_armed(vma) && !(vma->vm_flags & VM_SHARED))
>>>          pml =3D pmd_lock(mm, pmd);
>>> -    start_pte =3D pte_offset_map_nolock(mm, pmd, haddr, &ptl);
>>> +    start_pte =3D pte_offset_map_rw_nolock(mm, pmd, haddr, =
&pgt_pmd, &ptl);
>>>      if (!start_pte)        /* mmap_lock + page lock should prevent =
this */
>>>          goto abort;
>>>      if (!pml)
>>> @@ -1612,6 +1612,9 @@ int collapse_pte_mapped_thp(struct mm_struct =
*mm, unsigned long addr,
>>>      else if (ptl !=3D pml)
>>>          spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>>> +    if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
>>> +        goto abort;
>>> +
>>>      /* step 2: clear page table and adjust rmap */
>>>      for (i =3D 0, addr =3D haddr, pte =3D start_pte;
>>>           i < HPAGE_PMD_NR; i++, addr +=3D PAGE_SIZE, pte++) {
>>> @@ -1657,6 +1660,16 @@ int collapse_pte_mapped_thp(struct mm_struct =
*mm, unsigned long addr,
>>>      /* step 4: remove empty page table */
>>>      if (!pml) {
>>>          pml =3D pmd_lock(mm, pmd);
>>> +        /*
>>> +         * We called pte_unmap() and release the ptl before =
acquiring
>>> +         * the pml, which means we left the RCU critical section, =
so the
>>> +         * PTE page may have been freed, so we must do pmd_same() =
check
>>> +         * before reacquiring the ptl.
>>> +         */
>>> +        if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd)))) {
>>> +            spin_unlock(pml);
>>> +            goto pmd_change;
>> Seems we forget to flush TLB since we've cleared some pte entry?
>=20
> See comment above the ptep_clear():
>=20
> /*
> * Must clear entry, or a racing truncate may re-remove it.
> * TLB flush can be left until pmdp_collapse_flush() does it.
> * PTE dirty? Shmem page is already dirty; file is read-only.
> */
>=20
> The TLB flush was handed over to pmdp_collapse_flush(). If a

But you skipped pmdp_collapse_flush().

> concurrent thread free the PTE page at this time, the TLB will
> also be flushed after pmd_clear().
>=20
>>> +        }
>>>          if (ptl !=3D pml)
>>>              spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
>>>      }
>>> @@ -1688,6 +1701,7 @@ int collapse_pte_mapped_thp(struct mm_struct =
*mm, unsigned long addr,
>>>          pte_unmap_unlock(start_pte, ptl);
>>>      if (pml && pml !=3D ptl)
>>>          spin_unlock(pml);
>>> +pmd_change:
>>>      if (notified)
>>>          mmu_notifier_invalidate_range_end(&range);
>>>  drop_folio:


