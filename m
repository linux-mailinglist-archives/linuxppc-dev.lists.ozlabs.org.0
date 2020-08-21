Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3530024D066
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 10:12:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXvQ471vHzDqFS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 18:12:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HxpgaE/c; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXvNC1kPmzDqHg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 18:10:51 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07L83SV5169659; Fri, 21 Aug 2020 04:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=CrqYSsIFhB9UYjBEeMqOYUmVsPdkV+XB6MEzVcApiMo=;
 b=HxpgaE/c1zbmczPOLJD23ECl6Hpa2+ELlK05FhybhSJNtxI6x5LENPwzey9HfEYkTxSn
 y1yqYXiSob4/b/2b5bxEIyNHSdvXsfZKkNyyRB6gtkPn0Cjy0S4vehPEskNEZwIFznPT
 YzSTXJU4dylGtYv47XC2l6FSnP/oIjlpjmg3SYBAyjIh1TWfoSrK/jDrfrJjIsOgqIdb
 8NVBGa4+NY2SKUdenarmz2/R4YPN7U0yT18Z+Jz9T8khOH8MfeAl6SYnkE/oHXWOXe2S
 oNdRDqRP7Ns9NdZaDvo1JgIFsBnlV5T7LGNjhCHoUwbL3FWRSC8nAS9fSmuqLIaO8/2L ug== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33257srcmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Aug 2020 04:10:42 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07L832cq016694;
 Fri, 21 Aug 2020 08:10:40 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 330tbvttee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Aug 2020 08:10:40 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07L8AcCa16122260
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Aug 2020 08:10:38 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C42DAE058;
 Fri, 21 Aug 2020 08:10:38 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C66F9AE056;
 Fri, 21 Aug 2020 08:10:36 +0000 (GMT)
Received: from [9.102.2.201] (unknown [9.102.2.201])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 Aug 2020 08:10:36 +0000 (GMT)
Subject: Re: [PATCH v2 00/13] mm/debug_vm_pgtable fixes
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
 <87tuwyvjei.fsf@linux.ibm.com> <856eb6d7-9c09-728e-b374-d787145ac052@arm.com>
 <46cc2987-0d1e-f8e8-ecaf-2d246b33413e@linux.ibm.com>
 <6927a5cf-4100-e43e-6aba-5d7bc0533276@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <9b01e909-e6c3-1e6d-ae83-249bdab84ece@linux.ibm.com>
Date: Fri, 21 Aug 2020 13:40:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <6927a5cf-4100-e43e-6aba-5d7bc0533276@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-21_06:2020-08-19,
 2020-08-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008210075
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/21/20 1:31 PM, Anshuman Khandual wrote:
> 
> 
> On 08/21/2020 12:23 PM, Aneesh Kumar K.V wrote:
>> On 8/21/20 9:03 AM, Anshuman Khandual wrote:
>>>
>>>
>>> On 08/19/2020 07:15 PM, Aneesh Kumar K.V wrote:
>>>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>>>
>>>>> This patch series includes fixes for debug_vm_pgtable test code so that
>>>>> they follow page table updates rules correctly. The first two patches introduce
>>>>> changes w.r.t ppc64. The patches are included in this series for completeness. We can
>>>>> merge them via ppc64 tree if required.
>>>>>
>>>>> Hugetlb test is disabled on ppc64 because that needs larger change to satisfy
>>>>> page table update rules.
>>>>>
>>>>> Changes from V1:
>>>>> * Address review feedback
>>>>> * drop test specific pfn_pte and pfn_pmd.
>>>>> * Update ppc64 page table helper to add _PAGE_PTE
>>>>>
>>>>> Aneesh Kumar K.V (13):
>>>>>     powerpc/mm: Add DEBUG_VM WARN for pmd_clear
>>>>>     powerpc/mm: Move setting pte specific flags to pfn_pte
>>>>>     mm/debug_vm_pgtable/ppc64: Avoid setting top bits in radom value
>>>>>     mm/debug_vm_pgtables/hugevmap: Use the arch helper to identify huge
>>>>>       vmap support.
>>>>>     mm/debug_vm_pgtable/savedwrite: Enable savedwrite test with
>>>>>       CONFIG_NUMA_BALANCING
>>>>>     mm/debug_vm_pgtable/THP: Mark the pte entry huge before using
>>>>>       set_pmd/pud_at
>>>>>     mm/debug_vm_pgtable/set_pte/pmd/pud: Don't use set_*_at to update an
>>>>>       existing pte entry
>>>>>     mm/debug_vm_pgtable/thp: Use page table depost/withdraw with THP
>>>>>     mm/debug_vm_pgtable/locks: Move non page table modifying test together
>>>>>     mm/debug_vm_pgtable/locks: Take correct page table lock
>>>>>     mm/debug_vm_pgtable/pmd_clear: Don't use pmd/pud_clear on pte entries
>>>>>     mm/debug_vm_pgtable/hugetlb: Disable hugetlb test on ppc64
>>>>>     mm/debug_vm_pgtable: populate a pte entry before fetching it
>>>>>
>>>>>    arch/powerpc/include/asm/book3s/64/pgtable.h |  29 +++-
>>>>>    arch/powerpc/include/asm/nohash/pgtable.h    |   5 -
>>>>>    arch/powerpc/mm/book3s64/pgtable.c           |   2 +-
>>>>>    arch/powerpc/mm/pgtable.c                    |   5 -
>>>>>    include/linux/io.h                           |  12 ++
>>>>>    mm/debug_vm_pgtable.c                        | 151 +++++++++++--------
>>>>>    6 files changed, 127 insertions(+), 77 deletions(-)
>>>>>
>>>>
>>>> BTW I picked a wrong branch when sending this. Attaching the diff
>>>> against what I want to send.  pfn_pmd() no more updates _PAGE_PTE
>>>> because that is handled by pmd_mkhuge().
>>>>
>>>> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
>>>> index 3b4da7c63e28..e18ae50a275c 100644
>>>> --- a/arch/powerpc/mm/book3s64/pgtable.c
>>>> +++ b/arch/powerpc/mm/book3s64/pgtable.c
>>>> @@ -141,7 +141,7 @@ pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot)
>>>>        unsigned long pmdv;
>>>>          pmdv = (pfn << PAGE_SHIFT) & PTE_RPN_MASK;
>>>> -    return __pmd(pmdv | pgprot_val(pgprot) | _PAGE_PTE);
>>>> +    return pmd_set_protbits(__pmd(pmdv), pgprot);
>>>>    }
>>>>      pmd_t mk_pmd(struct page *page, pgprot_t pgprot)
>>>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>>>> index 7d9f8e1d790f..cad61d22f33a 100644
>>>> --- a/mm/debug_vm_pgtable.c
>>>> +++ b/mm/debug_vm_pgtable.c
>>>> @@ -229,7 +229,7 @@ static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
>>>>      static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
>>>>    {
>>>> -    pmd_t pmd = pfn_pmd(pfn, prot);
>>>> +    pmd_t pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>>>>          if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
>>>>            return;
>>>>
>>>
>>> Cover letter does not mention which branch or tag this series applies on.
>>> Just assumed it to be 5.9-rc1. Should the above changes be captured as a
>>> pre-requisite patch ?
>>>
>>> Anyways, the series fails to be build on arm64.
>>>
>>> A) Without CONFIG_TRANSPARENT_HUGEPAGE
>>>
>>> mm/debug_vm_pgtable.c: In function ‘debug_vm_pgtable’:
>>> mm/debug_vm_pgtable.c:1045:2: error: too many arguments to function ‘pmd_advanced_tests’
>>>     pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
>>>     ^~~~~~~~~~~~~~~~~~
>>> mm/debug_vm_pgtable.c:366:20: note: declared here
>>>    static void __init pmd_advanced_tests(struct mm_struct *mm,
>>>                       ^~~~~~~~~~~~~~~~~~
>>>
>>> B) As mentioned previously, this should be solved by including <linux/io.h>
>>>
>>> mm/debug_vm_pgtable.c: In function ‘pmd_huge_tests’:
>>> mm/debug_vm_pgtable.c:215:7: error: implicit declaration of function ‘arch_ioremap_pmd_supported’; did you mean ‘arch_disable_smp_support’? [-Werror=implicit-function-declaration]
>>>     if (!arch_ioremap_pmd_supported())
>>>          ^~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>>> Please make sure that the series builds on all enabled platforms i.e x86,
>>> arm64, ppc32, ppc64, arc, s390 along with selectively enabling/disabling
>>> all the features that make various #ifdefs in the test.
>>>
>>
>> I was hoping to get kernel test robot build report to verify that. But if you can help with that i have pushed a branch to github with reported build failure fixes.
>>
>> https://github.com/kvaneesh/linux/tree/debug_vm_pgtable
>>
>> I still haven't looked at the PMD_FOLDED feedback from Christophe because I am not sure i follow why we are checking for PMD folded there.
> 
> If this series does not build on existing enabled platforms, wondering
> how effective the review could be, assuming that things would need to
> change again to fix those build failures on various platforms. Getting
> this to build here is essential, as not all page table constructs are
> available across these platforms. Hence wondering, it might be better
> if you could resend the series after fixing build issues.
> 

Sure. I am hoping kernel test robot will pick this up. I did an x86 and 
about 19 different ppc config build with the series. The git tree above 
was pushed with that. Considering you authored the change i am wondering 
if you could help with checking other architecture (may be atleast arm 
variant)

-aneesh
