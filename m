Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9AF2436E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 10:47:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BS0ZX4JkZzDqcK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 18:47:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=T0eA6NW3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BS0XY0M56zDqbc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 18:46:04 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D8YPO5004812; Thu, 13 Aug 2020 04:45:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=QE1XDVyIUMtACQ0AbuBKoBI214WEY5HuOpe4fyCjdic=;
 b=T0eA6NW3v+AcAHbTXuFnMGfdyHmHi16dnDjztncUxqG+6u9CGUge6mQmqFazWZ0tVZeC
 u2AbfkZNpQmaEa+2WM4M0O6fDlTSeoNvL/H3KRPcuo+m/84vLzmn4LuWm8S1nMx8yKVm
 1vQNgci2isGE/hCbFPYlPfHixvZIHtmTL2Cj1bmwFUrl9JkTKwS9vlk4J/CkGkTKBk3f
 SpgOrnT+djgVYNgye2DC8GsqF2QT9oIrmnC7fV/JykjN2+5ILAjgho4ixdN4FvfJHA+R
 VHacgNsb0H/Us7WLh2vXoUSv+rOzUaaRb2rwwR19fQTSUYu6MKw2N9au/1pi1viOWlBT 0w== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32w24gra5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 04:45:51 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07D8id2K007559;
 Thu, 13 Aug 2020 08:45:49 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 32skp7u9rx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 08:45:49 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07D8jlQV26345904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Aug 2020 08:45:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 313034203F;
 Thu, 13 Aug 2020 08:45:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1164D42042;
 Thu, 13 Aug 2020 08:45:46 +0000 (GMT)
Received: from [9.79.219.81] (unknown [9.79.219.81])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 13 Aug 2020 08:45:45 +0000 (GMT)
Subject: Re: [PATCH 13/16] debug_vm_pgtable/pmd_clear: Don't use pmd/pud_clear
 on pte entries
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-13-aneesh.kumar@linux.ibm.com>
 <1bb841d2-4622-b122-7176-246eb3702c9f@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <15d79ab1-2638-cb0f-2323-7c91c8d8e802@linux.ibm.com>
Date: Thu, 13 Aug 2020 14:15:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1bb841d2-4622-b122-7176-246eb3702c9f@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_06:2020-08-13,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130064
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

On 8/13/20 10:57 AM, Anshuman Khandual wrote:
> 
> 
> On 08/12/2020 12:03 PM, Aneesh Kumar K.V wrote:
>> pmd_clear() should not be used to clear pmd level pte entries.
> 
> Could you please elaborate on this. The proposed change set does
> not match the description here.
> 

pmd_clear is implemented such that we don't use that to clear a huge pte 
entry. We use pmdp_huge_get_and_clear() for that. Hence we have check in 
pmd_clear which add a WARN if we find a _PAGE_PTE set on the entry.

In the test we follow a hugepmd usage with a pmd_clear. We should 
instead at the end of the advanced pmd test use pmdp_huge_get_and_clear().



>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/debug_vm_pgtable.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 061c19bba7f0..529892b9be2f 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -191,6 +191,8 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>>   	pmd = READ_ONCE(*pmdp);
>>   	WARN_ON(pmd_young(pmd));
>>   
>> +	/*  Clear the pte entries  */
>> +	pmdp_huge_get_and_clear(mm, vaddr, pmdp);
>>   	pgtable = pgtable_trans_huge_withdraw(mm, pmdp);
>>   }
>>   
>> @@ -313,6 +315,8 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
>>   	pudp_test_and_clear_young(vma, vaddr, pudp);
>>   	pud = READ_ONCE(*pudp);
>>   	WARN_ON(pud_young(pud));
>> +
>> +	pudp_huge_get_and_clear(mm, vaddr, pudp);
>>   }
>>   
>>   static void __init pud_leaf_tests(unsigned long pfn, pgprot_t prot)
>> @@ -431,8 +435,6 @@ static void __init pud_populate_tests(struct mm_struct *mm, pud_t *pudp,
>>   	 * This entry points to next level page table page.
>>   	 * Hence this must not qualify as pud_bad().
>>   	 */
>> -	pmd_clear(pmdp);
>> -	pud_clear(pudp);
> 
> Both entires are cleared before creating a fresh page table entry.
> Why that is a problem.
> 
>>   	pud_populate(mm, pudp, pmdp);
>>   	pud = READ_ONCE(*pudp);
>>   	WARN_ON(pud_bad(pud));
>> @@ -564,7 +566,6 @@ static void __init pmd_populate_tests(struct mm_struct *mm, pmd_t *pmdp,
>>   	 * This entry points to next level page table page.
>>   	 * Hence this must not qualify as pmd_bad().
>>   	 */
>> -	pmd_clear(pmdp);
> 
> Ditto.
> 
>>   	pmd_populate(mm, pmdp, pgtable);
>>   	pmd = READ_ONCE(*pmdp);
>>   	WARN_ON(pmd_bad(pmd));
>>

