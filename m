Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B4B242A6C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 15:34:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRVzJ5yhgzDqQP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 23:34:04 +1000 (AEST)
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
 header.s=pp1 header.b=AfKBxYlo; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRVbW2Q23zDqjn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 23:16:55 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07CD3Mxc181030; Wed, 12 Aug 2020 09:16:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6EJAr1Nw0p1PfkaHP7FfJceaddbAQ3EsA4xCrO9zYvs=;
 b=AfKBxYlob60w+mb7LXobPBsgU2XmxehuYwJDXn9Cd6qlYioXEVRonRAwEz7qmj8dPwrj
 /DZ+lsBJ3nl/juwlm3DJ/x0cD+4tWSESHCogY1gmk7V+JnL2dgL8V9YXVVkZfPFZ5UsY
 o4to8V/fvjqFAcTcCqIFYT1Fe2vmMl+sTIFFJYUc8Mk2QSC9y/xpaVGqHrGhCmoT1jkM
 JAOYRgQBwgXTKjZh7k3QmjfM5QnvES7OaMKLM/4EbqbHKKKXJLtQS5P8FtlDWrOTXVom
 qoE5hi8RlqgEJ6nk1YnBQIG3YdUeDxvJ6uk21/m+WbiqeUf8aeADHN9QPleNJrn3eNso EA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32vcsxqxa4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 09:16:41 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07CDGeff026055;
 Wed, 12 Aug 2020 13:16:40 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 32skp82r4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 13:16:40 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07CDGbBC26411510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2020 13:16:37 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C22924C052;
 Wed, 12 Aug 2020 13:16:37 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A05094C040;
 Wed, 12 Aug 2020 13:16:36 +0000 (GMT)
Received: from [9.85.71.17] (unknown [9.85.71.17])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2020 13:16:36 +0000 (GMT)
Subject: Re: [PATCH 14/16] debug_vm_pgtable/hugetlb: Disable hugetlb test on
 ppc64
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-14-aneesh.kumar@linux.ibm.com>
 <d067c278-6391-72f1-75c2-ccbd52909233@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <efc8f8c8-c16d-0826-9401-a45005ecaf62@linux.ibm.com>
Date: Wed, 12 Aug 2020 18:46:35 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d067c278-6391-72f1-75c2-ccbd52909233@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-12_04:2020-08-11,
 2020-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 adultscore=0 mlxlogscore=965 malwarescore=0 phishscore=0
 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008120090
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

On 8/12/20 6:33 PM, Anshuman Khandual wrote:
> 
> 
> On 08/12/2020 12:03 PM, Aneesh Kumar K.V wrote:
>> The seems to be missing quite a lot of details w.r.t allocating
>> the correct pgtable_t page (huge_pte_alloc()), holding the right
>> lock (huge_pte_lock()) etc. The vma used is also not a hugetlb VMA.
>>
>> ppc64 do have runtime checks within CONFIG_DEBUG_VM for most of these.
>> Hence disable the test on ppc64.
> 
> This test is free from any platform specific #ifdefs which should
> never be broken. If hugetlb_advanced_tests() does not work or is
> not detailed enough for ppc64, then it would be great if you could
> suggest some improvements so that it works for all enabled platforms.
> 
>

As mentioned the test is broken. For hugetlb, the pgtable_t pages should 
be allocated by huge_pte_alloc(). We need to hold huget_pte_lock() 
before  updating huge tlb pte. That takes hugepage size, which is mostly 
derived out of vma. Hence vma need to be a hugetlb vma. Some of the 
functions also depend on hstate. Also we should use set_huge_pte_at() 
when setting up hugetlb pte entries. I was tempted to remove that test 
completely marking it broken. But avoided that by marking it broken on 
only PPC64.



>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/debug_vm_pgtable.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 529892b9be2f..3e112d0ba1b2 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -800,6 +800,7 @@ static void __init hugetlb_basic_tests(unsigned long pfn, pgprot_t prot)
>>   #endif /* CONFIG_ARCH_WANT_GENERAL_HUGETLB */
>>   }
>>   
>> +#ifndef CONFIG_PPC_BOOK3S_64
>>   static void __init hugetlb_advanced_tests(struct mm_struct *mm,
>>   					  struct vm_area_struct *vma,
>>   					  pte_t *ptep, unsigned long pfn,
>> @@ -842,6 +843,7 @@ static void __init hugetlb_advanced_tests(struct mm_struct *mm,
>>   	pte = huge_ptep_get(ptep);
>>   	WARN_ON(!(huge_pte_write(pte) && huge_pte_dirty(pte)));
>>   }
>> +#endif
>>   #else  /* !CONFIG_HUGETLB_PAGE */
>>   static void __init hugetlb_basic_tests(unsigned long pfn, pgprot_t prot) { }
>>   static void __init hugetlb_advanced_tests(struct mm_struct *mm,
>> @@ -1053,7 +1055,9 @@ static int __init debug_vm_pgtable(void)
>>   	pud_populate_tests(mm, pudp, saved_pmdp);
>>   	spin_unlock(ptl);
>>   
>> -	//hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>> +#ifndef CONFIG_PPC_BOOK3S_64
>> +	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>> +#endif
>>   
>>   	spin_lock(&mm->page_table_lock);
>>   	p4d_clear_tests(mm, p4dp);
>>

