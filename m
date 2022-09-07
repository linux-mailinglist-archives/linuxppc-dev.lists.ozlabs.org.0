Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1155AFB6B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 06:52:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMqbw4kNZz3c3m
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 14:51:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YpjTPO1i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YpjTPO1i;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMqb82GnBz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 14:51:15 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2874mt7w015380;
	Wed, 7 Sep 2022 04:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vndKWlxQYj9qgYpLvjZBBlckEdMAz+1Rb02b7fDNByo=;
 b=YpjTPO1iwLwZIEPjdrEcEpnFUywihEfLH0TIvt/X9Gtzr5fXyITovyjn+dzOscCsRFl8
 JSaL9zlGhpoNMI4i6Y6iwWb6k/RYi7s+8HhiR8rUbK59/MZ4lBWSyPJcJ/DJQshIG1oq
 3MA1OnjU+OK2oKUhXxCMguTGL7gajBt0nlYiPY1a0rdzCQ1OPcHB/KllCRl7zTCCMku0
 hNHvhvMsEcptrWLx3coGc8HTn7F1Vw3dPHIBY4ahyuDZwFqRo1htuM0SH5W+eiTHgw8V
 G+0i0Uo3Bh76Std0u27kXzCIrv20z9MlWokzPZ1HlxsdtrCwvaLes+d6dsVM3HZ0Q0ig 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jemkjr0u1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Sep 2022 04:51:01 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2874nf0l018976;
	Wed, 7 Sep 2022 04:51:01 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jemkjr0td-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Sep 2022 04:51:01 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2874a9OI029407;
	Wed, 7 Sep 2022 04:50:59 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma02fra.de.ibm.com with ESMTP id 3jbxj8ud2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Sep 2022 04:50:59 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2874ouZP38928790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Sep 2022 04:50:56 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D02FB5204E;
	Wed,  7 Sep 2022 04:50:56 +0000 (GMT)
Received: from [9.43.98.238] (unknown [9.43.98.238])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id E3DDD52051;
	Wed,  7 Sep 2022 04:50:53 +0000 (GMT)
Message-ID: <92fe7b10-cbcf-6fdb-af23-4cb2f314e612@linux.ibm.com>
Date: Wed, 7 Sep 2022 10:20:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] mm: gup: fix the fast GUP race against THP collapse
Content-Language: en-US
To: Yang Shi <shy828301@gmail.com>
References: <20220901222707.477402-1-shy828301@gmail.com>
 <YxE/vuQlWJCJMuG2@xz-m1.local>
 <CAHbLzkqjZ_UhUbJ_f9Br7WCAgQvjrm5bMPRsKYvaFc2bzSuzrw@mail.gmail.com>
 <YxIofPiI8jvGzcjC@xz-m1.local>
 <CAHbLzkqGdnwY4P8jKQR0ojm6QV6b3dBi5pwrC1UJ4dqi3EqS4w@mail.gmail.com>
 <87ilm2jj4t.fsf@linux.ibm.com>
 <CAHbLzkohKvOFyfsVr=ry8Goi6kgxh9ig84FX0+pY4qzL4i0xWg@mail.gmail.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <CAHbLzkohKvOFyfsVr=ry8Goi6kgxh9ig84FX0+pY4qzL4i0xWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: R6no5A1uwDxNieytBvb7dfUyKxJpvrQX
X-Proofpoint-ORIG-GUID: FtC2oqDJ3IeOedeIl4dVhqvDYT8dTLy5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_02,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxlogscore=759 mlxscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209070017
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
Cc: david@redhat.com, jhubbard@nvidia.com, hughd@google.com, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, jgg@nvidia.com, akpm@linux-foundation.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/7/22 12:37 AM, Yang Shi wrote:
> On Mon, Sep 5, 2022 at 1:56 AM Aneesh Kumar K.V
> <aneesh.kumar@linux.ibm.com> wrote:
>>
>> Yang Shi <shy828301@gmail.com> writes:
>>
>>>
>>> On Fri, Sep 2, 2022 at 9:00 AM Peter Xu <peterx@redhat.com> wrote:
>>>>
>>>> On Thu, Sep 01, 2022 at 04:50:45PM -0700, Yang Shi wrote:
>>>>> On Thu, Sep 1, 2022 at 4:26 PM Peter Xu <peterx@redhat.com> wrote:
>>>>>>
>>>>>> Hi, Yang,
>>>>>>
>>>>>> On Thu, Sep 01, 2022 at 03:27:07PM -0700, Yang Shi wrote:
>>>>>>> Since general RCU GUP fast was introduced in commit 2667f50e8b81 ("mm:
>>>>>>> introduce a general RCU get_user_pages_fast()"), a TLB flush is no longer
>>>>>>> sufficient to handle concurrent GUP-fast in all cases, it only handles
>>>>>>> traditional IPI-based GUP-fast correctly.
>>>>>>
>>>>>> If TLB flush (or, IPI broadcasts) used to work to protect against gup-fast,
>>>>>> I'm kind of confused why it's not sufficient even if with RCU gup?  Isn't
>>>>>> that'll keep working as long as interrupt disabled (which current fast-gup
>>>>>> will still do)?
>>>>>
>>>>> Actually the wording was copied from David's commit log for his
>>>>> PageAnonExclusive fix. My understanding is the IPI broadcast still
>>>>> works, but it may not be supported by all architectures and not
>>>>> preferred anymore. So we should avoid depending on IPI broadcast IIUC.
>>>>>
>>>>>>
>>>>>> IIUC the issue is you suspect not all archs correctly implemented
>>>>>> pmdp_collapse_flush(), or am I wrong?
>>>>>
>>>>> This is a possible fix, please see below for details.
>>>>>
>>>>>>
>>>>>>> On architectures that send
>>>>>>> an IPI broadcast on TLB flush, it works as expected.  But on the
>>>>>>> architectures that do not use IPI to broadcast TLB flush, it may have
>>>>>>> the below race:
>>>>>>>
>>>>>>>    CPU A                                          CPU B
>>>>>>> THP collapse                                     fast GUP
>>>>>>>                                               gup_pmd_range() <-- see valid pmd
>>>>>>>                                                   gup_pte_range() <-- work on pte
>>>>>>> pmdp_collapse_flush() <-- clear pmd and flush
>>>>>>> __collapse_huge_page_isolate()
>>>>>>>     check page pinned <-- before GUP bump refcount
>>>>>>>                                                       pin the page
>>>>>>>                                                       check PTE <-- no change
>>>>>>> __collapse_huge_page_copy()
>>>>>>>     copy data to huge page
>>>>>>>     ptep_clear()
>>>>>>> install huge pmd for the huge page
>>>>>>>                                                       return the stale page
>>>>>>> discard the stale page
>>>>>>>
>>>>>>> The race could be fixed by checking whether PMD is changed or not after
>>>>>>> taking the page pin in fast GUP, just like what it does for PTE.  If the
>>>>>>> PMD is changed it means there may be parallel THP collapse, so GUP
>>>>>>> should back off.
>>>>>>
>>>>>> Could the race also be fixed by impl pmdp_collapse_flush() correctly for
>>>>>> the archs that are missing? Do you know which arch(s) is broken with it?
>>>>>
>>>>> Yes, and this was suggested by me in the first place, but per the
>>>>> suggestion from John and David, this is not the preferred way. I think
>>>>> it is because:
>>>>>
>>>>> Firstly, using IPI to serialize against fast GUP is not recommended
>>>>> anymore since fast GUP does check PTE then back off so we should avoid
>>>>> it.
>>>>> Secondly, if checking PMD then backing off could solve the problem,
>>>>> why do we still need broadcast IPI? It doesn't sound performant.
>>>>>
>>>>>>
>>>>>> It's just not clear to me whether this patch is an optimization or a fix,
>>>>>> if it's a fix whether the IPI broadcast in ppc pmdp_collapse_flush() would
>>>>>> still be needed.
>>>>>
>>>>> It is a fix and the fix will make IPI broadcast not useful anymore.
>>>>
>>>> How about another patch to remove the ppc impl too?  Then it can be a two
>>>> patches series.
>>>
>>> BTW, I don't think we could remove the ppc implementation since it is
>>> different from the generic pmdp_collapse_flush(), particularly for the
>>> hash part IIUC.
>>>
>>> The generic version calls flush_tlb_range() -> hash__flush_tlb_range()
>>> for hash, but the hash call is actually no-op. The ppc version calls
>>> hash__pmdp_collapse_flush() -> flush_tlb_pmd_range(), which does
>>> something useful.
>>>
>>
>> We should actually rename flush_tlb_pmd_range(). It actually flush the
>> hash page table entries.
>>
>> I will do the below patch for ppc64 to clarify this better
> 
> Thanks, Aneesh. It looks more readable. A follow-up question, I think
> we could remove serialize_against_pte_lookup(), which just issues IPI
> broadcast to run a dummy function. This IPI should not be needed
> anymore with my patch. Of course, we need to keep the memory barrier.
> 


For radix translation yes. For hash we still need that. W.r.t memory barrier,
radix do use radix__flush_tlb_collapsed_pmd() which does a tlb invalidate.
IIUC that will enfocre the required memory barrier there. So you should be able
to just remove 

modified   arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -937,15 +937,6 @@ pmd_t radix__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addre
 	pmd = *pmdp;
 	pmd_clear(pmdp);
 
-	/*
-	 * pmdp collapse_flush need to ensure that there are no parallel gup
-	 * walk after this call. This is needed so that we can have stable
-	 * page ref count when collapsing a page. We don't allow a collapse page
-	 * if we have gup taken on the page. We can ensure that by sending IPI
-	 * because gup walk happens with IRQ disabled.
-	 */
-	serialize_against_pte_lookup(vma->vm_mm);
-
 	radix__flush_tlb_collapsed_pmd(vma->vm_mm, address);
 
 	return pmd;

in your patch. This will also consolidate all the related changes together.

>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> index 8b762f282190..fd30fa20c392 100644
>> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
>> @@ -112,13 +112,12 @@ static inline void hash__flush_tlb_kernel_range(unsigned long start,
>>
>>  struct mmu_gather;
>>  extern void hash__tlb_flush(struct mmu_gather *tlb);
>> -void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long addr);
>>
>>  #ifdef CONFIG_PPC_64S_HASH_MMU
>>  /* Private function for use by PCI IO mapping code */
>>  extern void __flush_hash_table_range(unsigned long start, unsigned long end);
>> -extern void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd,
>> -                               unsigned long addr);
>> +extern void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd,
>> +                                      unsigned long addr);
>>  #else
>>  static inline void __flush_hash_table_range(unsigned long start, unsigned long end) { }
>>  #endif
>> diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
>> index ae008b9df0e6..f30131933a01 100644
>> --- a/arch/powerpc/mm/book3s64/hash_pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
>> @@ -256,7 +256,7 @@ pmd_t hash__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addres
>>          * the __collapse_huge_page_copy can result in copying
>>          * the old content.
>>          */
>> -       flush_tlb_pmd_range(vma->vm_mm, &pmd, address);
>> +       flush_hash_table_pmd_range(vma->vm_mm, &pmd, address);
>>         return pmd;
>>  }
>>
>> diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
>> index eb0bccaf221e..a64ea0a7ef96 100644
>> --- a/arch/powerpc/mm/book3s64/hash_tlb.c
>> +++ b/arch/powerpc/mm/book3s64/hash_tlb.c
>> @@ -221,7 +221,7 @@ void __flush_hash_table_range(unsigned long start, unsigned long end)
>>         local_irq_restore(flags);
>>  }
>>
>> -void flush_tlb_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long addr)
>> +void flush_hash_table_pmd_range(struct mm_struct *mm, pmd_t *pmd, unsigned long addr)
>>  {
>>         pte_t *pte;
>>         pte_t *start_pte;
>>

