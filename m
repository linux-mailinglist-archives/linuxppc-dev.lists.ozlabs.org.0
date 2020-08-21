Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8543324D05D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 10:09:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXvM04hlPzDr99
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 18:09:48 +1000 (AEST)
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
 header.s=pp1 header.b=DkO98DcK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXvKQ4hbCzDqHg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 18:08:26 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07L82Bta072215; Fri, 21 Aug 2020 04:08:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=582P2VgFpqEjNvO7jzL0Xtm00j/cXcE0NAKGQENkwI0=;
 b=DkO98DcKp7Ok5sVUSJXtttMT0rh+ydC+wN1SDQkYhaXOXxfm4NgxB2s5VWTCKKTnQoTb
 v7sm4jTfpSIiHfGS2ZBrDMCvTz8K/CcIBsqrS/eYA0U7EKFARFontxBGpjW/bfzTTOnh
 0FzcYhdDJAGz1gEG/kWSBSyDiS4rFJVUmNf+KqUDyfPXG2WGI+Oza6fY0tQwZqyn7GrO
 C2FKmRuyXq4N1Xdjoq7OHJZbgcrBUMcSAR2AhGMG0KQaO4y8Bbn6ZjzYrOcVbi7mpYb5
 Ozr9jp4J1bmU8H/ghuGeFVXShrddHGF5EFTrCW2qLfiX1zJtYFUAKRBF3LR5AUmZCJRp tw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 331yc8fwfv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Aug 2020 04:08:16 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07L85Dx3015221;
 Fri, 21 Aug 2020 08:08:13 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3304c92h85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Aug 2020 08:08:13 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07L88Bbn28377422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Aug 2020 08:08:11 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5516FAE057;
 Fri, 21 Aug 2020 08:08:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE469AE045;
 Fri, 21 Aug 2020 08:08:09 +0000 (GMT)
Received: from [9.102.2.201] (unknown [9.102.2.201])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 Aug 2020 08:08:09 +0000 (GMT)
Subject: Re: [PATCH v2 10/13] mm/debug_vm_pgtable/locks: Take correct page
 table lock
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
 <20200819130107.478414-11-aneesh.kumar@linux.ibm.com>
 <af7282c1-0d59-3f29-2a59-05575cd9d7f3@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <ac6456b5-d01d-b8e6-9683-5e3c3013e4e7@linux.ibm.com>
Date: Fri, 21 Aug 2020 13:38:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <af7282c1-0d59-3f29-2a59-05575cd9d7f3@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-21_05:2020-08-19,
 2020-08-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008210070
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

On 8/21/20 1:33 PM, Anshuman Khandual wrote:
> 
> 
> On 08/19/2020 06:31 PM, Aneesh Kumar K.V wrote:
>> Make sure we call pte accessors with correct lock held.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/debug_vm_pgtable.c | 34 ++++++++++++++++++++--------------
>>   1 file changed, 20 insertions(+), 14 deletions(-)
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 69fe3cd8126c..8f7a8ccb5a54 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -1024,33 +1024,39 @@ static int __init debug_vm_pgtable(void)
>>   	pmd_thp_tests(pmd_aligned, prot);
>>   	pud_thp_tests(pud_aligned, prot);
>>   
>> +	hugetlb_basic_tests(pte_aligned, prot);
>> +
>>   	/*
>>   	 * Page table modifying tests
>>   	 */
>> -	pte_clear_tests(mm, ptep, vaddr);
>> -	pmd_clear_tests(mm, pmdp);
>> -	pud_clear_tests(mm, pudp);
>> -	p4d_clear_tests(mm, p4dp);
>> -	pgd_clear_tests(mm, pgdp);
>>   
>>   	ptep = pte_alloc_map_lock(mm, pmdp, vaddr, &ptl);
>> +	pte_clear_tests(mm, ptep, vaddr);
>>   	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>> -	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
>> -	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
>> -	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>> -
>> +	pte_unmap_unlock(ptep, ptl);
>>   
>> +	ptl = pmd_lock(mm, pmdp);
>> +	pmd_clear_tests(mm, pmdp);
>> +	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
>>   	pmd_huge_tests(pmdp, pmd_aligned, prot);
>> +	pmd_populate_tests(mm, pmdp, saved_ptep);
>> +	spin_unlock(ptl);
>> +
>> +	ptl = pud_lock(mm, pudp);
>> +	pud_clear_tests(mm, pudp);
>> +	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
>>   	pud_huge_tests(pudp, pud_aligned, prot);
>> +	pud_populate_tests(mm, pudp, saved_pmdp);
>> +	spin_unlock(ptl);
>>   
>> -	pte_unmap_unlock(ptep, ptl);
>> +	//hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
> 
> Commenting out an existing test in the middle of another change ?
> 

That is already fixed. That was me creating a git diff against a wrong 
branch.

Thanks.
-aneesh
