Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EE039F4CA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 13:18:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FznmB5M0Nz3bs8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 21:18:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sxoSDmU2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sxoSDmU2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fznld4HnZz2xZg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 21:17:48 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 158B45gr093565; Tue, 8 Jun 2021 07:17:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=aHOtXjzUd8dtKhzElXpJYDKE9PW2av64f40ZykyZxWY=;
 b=sxoSDmU2ErGMyOMx5r4j5TjHUXJc5f70mzCQDbBbogrV7+UARoxJQiI4uemMaavleeBl
 qhFMIhzeVO5M5kPYxsMda7lXQIkfHsj+6+Qezq7c1g2QL0jlKk/4324QpKctXneJRnLl
 oS7BELKeosaVo60OvY5yVVy0SAYlFfBUKTkAhvjVfwtMzAvsFMbweuNZtTZsrQ4jnGn9
 9NvAIQGCr0oXo9/JVfdHozxNH+7VXZwSTKCQo9jBtgtyArKZzGhzEmf30tmwHFQAJ95U
 T6x7Bh9I2fRjOE+BrLoV0hyTMeBgYsVgrIjGRnSkebHJ+DarrsfP1ECCbXHwkPG1pZpd gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39266djc53-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 07:17:27 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 158B4r8x099060;
 Tue, 8 Jun 2021 07:17:26 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39266djc4m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 07:17:26 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 158BHOr1020731;
 Tue, 8 Jun 2021 11:17:24 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3900w88tn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 11:17:24 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 158BHMG032506352
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Jun 2021 11:17:22 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2878E4C052;
 Tue,  8 Jun 2021 11:17:22 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 509204C04E;
 Tue,  8 Jun 2021 11:17:20 +0000 (GMT)
Received: from [9.199.43.138] (unknown [9.199.43.138])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Jun 2021 11:17:20 +0000 (GMT)
Subject: Re: [PATCH v7 01/11] mm/mremap: Fix race between MOVE_PMD mremap and
 pageout
To: "Kirill A. Shutemov" <kirill@shutemov.name>
References: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
 <20210607055131.156184-2-aneesh.kumar@linux.ibm.com>
 <f789af6-8924-3b83-6f82-c662175af126@google.com>
 <87o8cgokso.fsf@linux.ibm.com>
 <20210608094222.xcpvlc3kaq5j5sh3@box.shutemov.name>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <e7de1397-e982-9236-1545-9beb4233926f@linux.ibm.com>
Date: Tue, 8 Jun 2021 16:47:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <20210608094222.xcpvlc3kaq5j5sh3@box.shutemov.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 06JZJ_vMkVOI4A9OTT7JfJVzmmhyr5U1
X-Proofpoint-ORIG-GUID: TlqKRZbkC5VOWj4EGpBtBJfA8FVeJ1Va
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-08_08:2021-06-04,
 2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 mlxscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080074
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>, npiggin@gmail.com, linux-mm@kvack.org,
 kaleshsingh@google.com, joel@joelfernandes.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/8/21 3:12 PM, Kirill A. Shutemov wrote:
> On Tue, Jun 08, 2021 at 01:22:23PM +0530, Aneesh Kumar K.V wrote:
>>
>> Hi Hugh,
>>
>> Hugh Dickins <hughd@google.com> writes:
>>
>>> On Mon, 7 Jun 2021, Aneesh Kumar K.V wrote:
>>>
>>>> CPU 1				CPU 2					CPU 3
>>>>
>>>> mremap(old_addr, new_addr)      page_shrinker/try_to_unmap_one
>>>>
>>>> mmap_write_lock_killable()
>>>>
>>>> 				addr = old_addr
>>>> 				lock(pte_ptl)
>>>> lock(pmd_ptl)
>>>> pmd = *old_pmd
>>>> pmd_clear(old_pmd)
>>>> flush_tlb_range(old_addr)
>>>>
>>>> *new_pmd = pmd
>>>> 									*new_addr = 10; and fills
>>>> 									TLB with new addr
>>>> 									and old pfn
>>>>
>>>> unlock(pmd_ptl)
>>>> 				ptep_clear_flush()
>>>> 				old pfn is free.
>>>> 									Stale TLB entry
>>>>
>>>> Fix this race by holding pmd lock in pageout. This still doesn't handle the race
>>>> between MOVE_PUD and pageout.
>>>>
>>>> Fixes: 2c91bd4a4e2e ("mm: speed up mremap by 20x on large regions")
>>>> Link: https://lore.kernel.org/linux-mm/CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com
>>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>>
>>> This seems very wrong to me, to require another level of locking in the
>>> rmap lookup, just to fix some new pagetable games in mremap.
>>>
>>> But Linus asked "Am I missing something?": neither of you have mentioned
>>> mremap's take_rmap_locks(), so I hope that already meets your need.  And
>>> if it needs to be called more often than before (see "need_rmap_locks"),
>>> that's probably okay.
>>>
>>> Hugh
>>>
>>
>> Thanks for reviewing the change. I missed the rmap lock in the code
>> path. How about the below change?
>>
>>      mm/mremap: hold the rmap lock in write mode when moving page table entries.
>>      
>>      To avoid a race between rmap walk and mremap, mremap does take_rmap_locks().
>>      The lock was taken to ensure that rmap walk don't miss a page table entry due to
>>      PTE moves via move_pagetables(). The kernel does further optimization of
>>      this lock such that if we are going to find the newly added vma after the
>>      old vma, the rmap lock is not taken. This is because rmap walk would find the
>>      vmas in the same order and if we don't find the page table attached to
>>      older vma we would find it with the new vma which we would iterate later.
>>      The actual lifetime of the page is still controlled by the PTE lock.
>>      
>>      This patch updates the locking requirement to handle another race condition
>>      explained below with optimized mremap::
>>      
>>      Optmized PMD move
>>      
>>          CPU 1                           CPU 2                                   CPU 3
>>      
>>          mremap(old_addr, new_addr)      page_shrinker/try_to_unmap_one
>>      
>>          mmap_write_lock_killable()
>>      
>>                                          addr = old_addr
>>                                          lock(pte_ptl)
>>          lock(pmd_ptl)
>>          pmd = *old_pmd
>>          pmd_clear(old_pmd)
>>          flush_tlb_range(old_addr)
>>      
>>          *new_pmd = pmd
>>                                                                                  *new_addr = 10; and fills
>>                                                                                  TLB with new addr
>>                                                                                  and old pfn
>>      
>>          unlock(pmd_ptl)
>>                                          ptep_clear_flush()
>>                                          old pfn is free.
>>                                                                                  Stale TLB entry
>>      
>>      Optmized PUD move:
>>      
>>          CPU 1                           CPU 2                                   CPU 3
>>      
>>          mremap(old_addr, new_addr)      page_shrinker/try_to_unmap_one
>>      
>>          mmap_write_lock_killable()
>>      
>>                                          addr = old_addr
>>                                          lock(pte_ptl)
>>          lock(pud_ptl)
>>          pud = *old_pud
>>          pud_clear(old_pud)
>>          flush_tlb_range(old_addr)
>>      
>>          *new_pud = pud
>>                                                                                  *new_addr = 10; and fills
>>                                                                                  TLB with new addr
>>                                                                                  and old pfn
>>      
>>          unlock(pud_ptl)
>>                                          ptep_clear_flush()
>>                                          old pfn is free.
>>                                                                                  Stale TLB entry
>>      
>>      Both the above race condition can be fixed if we force mremap path to take rmap lock.
>>      
>>      Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> 
> Looks like it should be enough to address the race.
> 
> It would be nice to understand what is performance overhead of the
> additional locking. Is it still faster to move single PMD page table under
> these locks comparing to moving PTE page table entries without the locks?
> 

The improvements provided by optimized mremap as captured in patch 11 is
large.

mremap HAVE_MOVE_PMD/PUD optimization time comparison for 1GB region:
1GB mremap - Source PTE-aligned, Destination PTE-aligned
   mremap time:      2292772ns
1GB mremap - Source PMD-aligned, Destination PMD-aligned
   mremap time:      1158928ns
1GB mremap - Source PUD-aligned, Destination PUD-aligned
   mremap time:        63886ns

With additional locking, I haven't observed much change in those 
numbers. But that could also be because there is no contention on these 
locks when this test is run?

-aneesh


