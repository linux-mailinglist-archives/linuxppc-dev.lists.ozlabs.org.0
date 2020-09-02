Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABC325A7B5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 10:23:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhH544WRmzDqfv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 18:23:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pmM8HGr/; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhGwK4Qm9zDqkS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 18:15:45 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0828343Q017029; Wed, 2 Sep 2020 04:15:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=HJvOF45pEBgjjHYGZbQ440KOfVbr+uQ62ipIV2zmLLc=;
 b=pmM8HGr/9I5vP/CfISrMN/k8Ifjrg/8zCjAttAhC3xw+eryP/cfpok3RVsTy/rmJOW2R
 IZuD+eqeACyL+DhyD93b8LqI7g/djW1ITpXKLdmGMwZDe6jYNnjBpehBwTczix/UeEPV
 AUJRbnYm5rzM1jNICEZXOJB6t8V0wn8ZkaRD+s1PK6mYNiZQa0jlNHPm5DGGrs0ZOsqe
 vHS2aytjoXW4NmMogdi3hPiy+fRSRllYNy3GUiib9LMASfoMgFLLpqraJHa/I8+FFI5z
 PBkEFBUzncPExZzlP3U0KbCNX29SquaagfZHg75RRo897oJw8dV/kZBxj0FbOmGAvDrz hQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33a4ffnae4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 04:15:25 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0828Cn8c032106;
 Wed, 2 Sep 2020 08:15:24 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 339ap7s1yn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 08:15:23 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0828FLp025559420
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 08:15:21 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2450BA405B;
 Wed,  2 Sep 2020 08:15:21 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9252A407E;
 Wed,  2 Sep 2020 08:15:19 +0000 (GMT)
Received: from [9.199.61.124] (unknown [9.199.61.124])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 08:15:19 +0000 (GMT)
Subject: Re: [PATCH] powerpc: Fix random segfault when freeing hugetlb range
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <f0cb2a5477cd87d1eaadb128042e20aeb2bc2859.1598860677.git.christophe.leroy@csgroup.eu>
 <875z8weua7.fsf@linux.ibm.com>
 <96409d24-c8bf-7f3a-0a81-0830174d6bcc@csgroup.eu>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <24074aed-e9dc-bfc6-2f67-2c24b11ee60f@linux.ibm.com>
Date: Wed, 2 Sep 2020 13:45:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <96409d24-c8bf-7f3a-0a81-0830174d6bcc@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_03:2020-09-02,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=2 priorityscore=1501 mlxscore=0 impostorscore=0
 bulkscore=0 phishscore=0 clxscore=1015 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009020074
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/2/20 1:41 PM, Christophe Leroy wrote:
> 
> 
> Le 02/09/2020 à 05:23, Aneesh Kumar K.V a écrit :
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>
>>> The following random segfault is observed from time to time with
>>> map_hugetlb selftest:
>>>
>>> root@localhost:~# ./map_hugetlb 1 19
>>> 524288 kB hugepages
>>> Mapping 1 Mbytes
>>> Segmentation fault
>>>
>>> [   31.219972] map_hugetlb[365]: segfault (11) at 117 nip 77974f8c lr 
>>> 779a6834 code 1 in ld-2.23.so[77966000+21000]
>>> [   31.220192] map_hugetlb[365]: code: 9421ffc0 480318d1 93410028 
>>> 90010044 9361002c 93810030 93a10034 93c10038
>>> [   31.220307] map_hugetlb[365]: code: 93e1003c 93210024 8123007c 
>>> 81430038 <80e90004> 814a0004 7f443a14 813a0004
>>> [   31.221911] BUG: Bad rss-counter state mm:(ptrval) 
>>> type:MM_FILEPAGES val:33
>>> [   31.229362] BUG: Bad rss-counter state mm:(ptrval) 
>>> type:MM_ANONPAGES val:5
>>>
>>> This fault is due to hugetlb_free_pgd_range() freeing page tables
>>> that are also used by regular pages.
>>>
>>> As explain in the comment at the beginning of
>>> hugetlb_free_pgd_range(), the verification done in free_pgd_range()
>>> on floor and ceiling is not done here, which means
>>> hugetlb_free_pte_range() can free outside the expected range.
>>>
>>> As the verification cannot be done in hugetlb_free_pgd_range(), it
>>> must be done in hugetlb_free_pte_range().
>>>
>>
>> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>
>>> Fixes: b250c8c08c79 ("powerpc/8xx: Manage 512k huge pages as standard 
>>> pages.")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> ---
>>>   arch/powerpc/mm/hugetlbpage.c | 18 ++++++++++++++++--
>>>   1 file changed, 16 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/mm/hugetlbpage.c 
>>> b/arch/powerpc/mm/hugetlbpage.c
>>> index 26292544630f..e7ae2a2c4545 100644
>>> --- a/arch/powerpc/mm/hugetlbpage.c
>>> +++ b/arch/powerpc/mm/hugetlbpage.c
>>> @@ -330,10 +330,24 @@ static void free_hugepd_range(struct mmu_gather 
>>> *tlb, hugepd_t *hpdp, int pdshif
>>>                    get_hugepd_cache_index(pdshift - shift));
>>>   }
>>> -static void hugetlb_free_pte_range(struct mmu_gather *tlb, pmd_t 
>>> *pmd, unsigned long addr)
>>> +static void hugetlb_free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
>>> +                   unsigned long addr, unsigned long end,
>>> +                   unsigned long floor, unsigned long ceiling)
>>>   {
>>> +    unsigned long start = addr;
>>>       pgtable_t token = pmd_pgtable(*pmd);
>>> +    start &= PMD_MASK;
>>> +    if (start < floor)
>>> +        return;
>>> +    if (ceiling) {
>>> +        ceiling &= PMD_MASK;
>>> +        if (!ceiling)
>>> +            return;
>>> +    }
>>> +    if (end - 1 > ceiling - 1)
>>> +        return;
>>> +
>>
>> We do repeat that for pud/pmd/pte hugetlb_free_range. Can we consolidate
>> that with comment explaining we are checking if the pgtable entry is
>> mapping outside the range?
> 
> I was thinking about refactoring that into a helper and add all the 
> necessary comments to explain what it does.
> 
> Will do that in a followup series if you are OK. This patch is a bug fix 
> and also have to go through stable.
> 

agreed.

Thanks.
-aneesh
