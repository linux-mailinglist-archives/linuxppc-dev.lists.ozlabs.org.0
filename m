Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5628E243416
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 08:42:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRxnn1j6bzDqZC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 16:42:21 +1000 (AEST)
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
 header.s=pp1 header.b=dmn99BVF; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRxk30tbDzDqcG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 16:39:06 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D6W00J109384; Thu, 13 Aug 2020 02:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6ma4IiAmGEShavvSv5b1LplCadu9J6Z+4heNkQXf2c4=;
 b=dmn99BVFGlO7gUySQbdeCAZ1rjZY6NVnj7c2RKpd3JzPmylFarlaeZFhHEqjnYyYWNbY
 uGrRyzFm8G2Z2fIb2R3vlLE7mtgEK3gKRkCHrGS0bv7yKfCxAceXFKLajhz5tRMUCPLO
 LU1xBTrOFFVRA/JDC+Bkk6rjS9i20UsYWRHTPRLPmtrRuJoHQ0z8WwKL8jSmUFCvTATL
 2c91tplkUv0BYAbDWyF1c2sL86u4i3G7GbqTnVBUItSPYll3ipddS863Q2Crdn/+GAdg
 ve8wWMqM8BzsNwbzlrePJnBwqiZqfKYy5pD/9OAcAWb5/502WnkuXkvIWkdL60kRRWbf mg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32vbd0cveu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 02:38:57 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07D6Yv6K021916;
 Thu, 13 Aug 2020 06:38:55 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 32skp8d7j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 06:38:55 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07D6cr8c26870016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Aug 2020 06:38:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51D5D4203F;
 Thu, 13 Aug 2020 06:38:53 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18FC542042;
 Thu, 13 Aug 2020 06:38:52 +0000 (GMT)
Received: from [9.79.219.81] (unknown [9.79.219.81])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 13 Aug 2020 06:38:51 +0000 (GMT)
Subject: Re: [PATCH 10/16] debug_vm_pgtable/thp: Use page table
 depost/withdraw with THP
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-10-aneesh.kumar@linux.ibm.com>
 <40f2acb5-1da3-4c0a-5590-3fd12d128421@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <bb3821c4-0d23-e6a6-33ad-6c0e3ad67644@linux.ibm.com>
Date: Thu, 13 Aug 2020 12:08:51 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <40f2acb5-1da3-4c0a-5590-3fd12d128421@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_04:2020-08-11,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008130047
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

On 8/13/20 10:55 AM, Anshuman Khandual wrote:
> On 08/12/2020 12:03 PM, Aneesh Kumar K.V wrote:
>> Architectures like ppc64 use deposited page table while updating the huge pte
>> entries.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/debug_vm_pgtable.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 644d28861ce9..48475d288df1 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -147,7 +147,7 @@ static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
>>   static void __init pmd_advanced_tests(struct mm_struct *mm,
>>   				      struct vm_area_struct *vma, pmd_t *pmdp,
>>   				      unsigned long pfn, unsigned long vaddr,
>> -				      pgprot_t prot)
>> +				      pgprot_t prot, pgtable_t pgtable)
>>   {
>>   	pmd_t pmd;
>>   
>> @@ -158,6 +158,8 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>>   	/* Align the address wrt HPAGE_PMD_SIZE */
>>   	vaddr = (vaddr & HPAGE_PMD_MASK) + HPAGE_PMD_SIZE;
>>   
>> +	pgtable_trans_huge_deposit(mm, pmdp, pgtable);
>> +
>>   	pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>>   	set_pmd_at(mm, vaddr, pmdp, pmd);
>>   	pmdp_set_wrprotect(mm, vaddr, pmdp);
>> @@ -188,6 +190,8 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>>   	pmdp_test_and_clear_young(vma, vaddr, pmdp);
>>   	pmd = READ_ONCE(*pmdp);
>>   	WARN_ON(pmd_young(pmd));
>> +
>> +	pgtable = pgtable_trans_huge_withdraw(mm, pmdp);
>>   }
>>   
>>   static void __init pmd_leaf_tests(unsigned long pfn, pgprot_t prot)
>> @@ -1002,7 +1006,7 @@ static int __init debug_vm_pgtable(void)
>>   	pgd_clear_tests(mm, pgdp);
>>   
>>   	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>> -	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot);
>> +	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
>>   	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
>>   	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>>   
>>
> 
> Makes sense, if it is required for THP to work correctly but needs to be tested
> across enabled platforms. Why should not the same apply for pud_advanced_tests()
> on platforms that supports PUD based THP.
> 


pud doesn't have page table deposit/withdraw semantics. We use that to 
support hugepage split. With pud mapping we don't split, we just drop 
the hugepage and expect it to be faulted back in as regular page.

-aneesh
