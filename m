Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E8A51E397
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 04:33:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwBLl06F5z3c9g
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 12:33:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.43;
 helo=out30-43.freemail.mail.aliyun.com;
 envelope-from=baolin.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-43.freemail.mail.aliyun.com
 (out30-43.freemail.mail.aliyun.com [115.124.30.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwBLD6FyDz2xlF
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 12:32:50 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=30; SR=0;
 TI=SMTPD_---0VCUh82p_1651890757; 
Received: from 30.236.9.83(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VCUh82p_1651890757) by smtp.aliyun-inc.com(127.0.0.1);
 Sat, 07 May 2022 10:32:39 +0800
Message-ID: <e8b56f7d-ad95-7938-21a5-55caedbbb354@linux.alibaba.com>
Date: Sat, 7 May 2022 10:33:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when
 migration
To: Mike Kravetz <mike.kravetz@oracle.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, will@kernel.org
References: <cover.1651216964.git.baolin.wang@linux.alibaba.com>
 <11b92502b3df0e0bba6a1dc71476d79cab6c79ba.1651216964.git.baolin.wang@linux.alibaba.com>
 <5cab0eca-9630-a7c6-4f5d-5cb45ff82c83@oracle.com>
 <21b11024-e893-8c11-9b98-ab1d13413b61@linux.alibaba.com>
 <85bd80b4-b4fd-0d3f-a2e5-149559f2f387@oracle.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <85bd80b4-b4fd-0d3f-a2e5-149559f2f387@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 linux-mm@kvack.org, paulus@samba.org, sparclinux@vger.kernel.org,
 agordeev@linux.ibm.com, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 arnd@arndb.de, ysato@users.sourceforge.jp, deller@gmx.de,
 borntraeger@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, svens@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/7/2022 1:56 AM, Mike Kravetz wrote:
> On 5/5/22 20:39, Baolin Wang wrote:
>>
>> On 5/6/2022 7:53 AM, Mike Kravetz wrote:
>>> On 4/29/22 01:14, Baolin Wang wrote:
>>>> On some architectures (like ARM64), it can support CONT-PTE/PMD size
>>>> hugetlb, which means it can support not only PMD/PUD size hugetlb:
>>>> 2M and 1G, but also CONT-PTE/PMD size: 64K and 32M if a 4K page
>>>> size specified.
>>> <snip>
>>>> diff --git a/mm/rmap.c b/mm/rmap.c
>>>> index 6fdd198..7cf2408 100644
>>>> --- a/mm/rmap.c
>>>> +++ b/mm/rmap.c
>>>> @@ -1924,13 +1924,15 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>>>>                        break;
>>>>                    }
>>>>                }
>>>> +
>>>> +            /* Nuke the hugetlb page table entry */
>>>> +            pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
>>>>            } else {
>>>>                flush_cache_page(vma, address, pte_pfn(*pvmw.pte));
>>>> +            /* Nuke the page table entry. */
>>>> +            pteval = ptep_clear_flush(vma, address, pvmw.pte);
>>>>            }
>>>>    
>>>
>>> On arm64 with CONT-PTE/PMD the returned pteval will have dirty or young set
>>> if ANY of the PTE/PMDs had dirty or young set.
>>
>> Right.
>>
>>>
>>>> -        /* Nuke the page table entry. */
>>>> -        pteval = ptep_clear_flush(vma, address, pvmw.pte);
>>>> -
>>>>            /* Set the dirty flag on the folio now the pte is gone. */
>>>>            if (pte_dirty(pteval))
>>>>                folio_mark_dirty(folio);
>>>> @@ -2015,7 +2017,10 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>>>>                pte_t swp_pte;
>>>>                  if (arch_unmap_one(mm, vma, address, pteval) < 0) {
>>>> -                set_pte_at(mm, address, pvmw.pte, pteval);
>>>> +                if (folio_test_hugetlb(folio))
>>>> +                    set_huge_pte_at(mm, address, pvmw.pte, pteval);
>>>
>>> And, we will use that pteval for ALL the PTE/PMDs here.  So, we would set
>>> the dirty or young bit in ALL PTE/PMDs.
>>>
>>> Could that cause any issues?  May be more of a question for the arm64 people.
>>
>> I don't think this will cause any issues. Since the hugetlb can not be split, and we should not lose the the dirty or young state if any subpages were set. Meanwhile we already did like this in hugetlb.c:
>>
>> pte = huge_ptep_get_and_clear(mm, address, ptep);
>> tlb_remove_huge_tlb_entry(h, tlb, ptep, address);
>> if (huge_pte_dirty(pte))
>>      set_page_dirty(page);
>>
> 
> Agree that it 'should not' cause issues.  It just seems inconsistent.
> This is not a problem specifically with your patch, just the handling of
> CONT-PTE/PMD entries.
> 
> There does not appear to be an arm64 specific version of huge_ptep_get()
> that takes CONT-PTE/PMD into account.  So, huge_ptep_get() would only
> return the one specific value.  It would not take into account the dirty
> or young bits of CONT-PTE/PMDs like your new version of
> huge_ptep_get_and_clear.  Is that correct?  Or, am I missing something.

Yes, you are right.

> 
> If I am correct, then code like the following may not work:
> 
> static int gather_hugetlb_stats(pte_t *pte, unsigned long hmask,
>                  unsigned long addr, unsigned long end, struct mm_walk *walk)
> {
>          pte_t huge_pte = huge_ptep_get(pte);
>          struct numa_maps *md;
>          struct page *page;
> 
>          if (!pte_present(huge_pte))
>                  return 0;
> 
>          page = pte_page(huge_pte);
> 
>          md = walk->private;
>          gather_stats(page, md, pte_dirty(huge_pte), 1);
>          return 0;
> }

Right, this is inconsistent with current huge_ptep_get() interface like 
you said. So I think we can define an ARCH-specific huge_ptep_get() 
interface for arm64, and some sample code like below. How do you think?

+pte_t huge_ptep_get(pte_t *ptep, unsigned long size)
+{
+       int ncontig;
+       pte_t orig_pte = ptep_get(ptep);
+
+       if (!pte_cont(orig_pte))
+               return orig_pte;
+
+       switch (size) {
+       case CONT_PMD_SIZE:
+               ncontig = CONT_PMDS;
+               break;
+       case CONT_PTE_SIZE:
+               ncontig = CONT_PTES;
+               break;
+       default:
+               WARN_ON_ONCE(1);
+               return orig_pte;
+       }
+
+       for (i = 0; i < ncontig; i++, ptep++) {
+               pte_t pte = ptep_get(ptep);
+
+               if (pte_dirty(pte))
+                       orig_pte = pte_mkdirty(orig_pte);
+
+               if (pte_young(pte))
+                       orig_pte = pte_mkyong(orig_pte);
+       }
+
+       return orig_pte;
+}
