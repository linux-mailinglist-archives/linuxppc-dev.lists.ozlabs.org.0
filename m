Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC54124CEB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 09:16:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXt9v2VjgzDr7n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 17:16:51 +1000 (AEST)
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
 header.s=pp1 header.b=djeDcFTD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXt866m1CzDr4q
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 17:15:18 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07L74WiJ062821; Fri, 21 Aug 2020 03:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=70UOR7nwFWRkCla2CKkYVciZ4+/nBYafjOfMpFHZ8cY=;
 b=djeDcFTDA7g1IMXDyeg5ApBicF2cMO3N19HAljOEuS3XwwE/01W6+y9wv+dI7iWMICIu
 eyTfcSbTaZqCJhl0J2Kx0sGtD6Xjtjty2p/4Eu8aAngUzB0H2mVyiPeXvDjQ7q6bfrIJ
 2jvaXmVce3CyWCzm0Qic22cqgW54eFwgQBY5rzLLn/XoZGhVvwb6Fok1Wy0vQ/2o9iih
 n7+rbjl90BV27Nz9BfO3gHiS0o/g1NkLXP3ScLsGbXQC/N07/bI+lTzuhFvbsGrpK3Ec
 VobkL8ZwRnPKW2Z44sgqiarDgTmbkgOii0a5la8nWceizTSEYrskreq6Z29TCvqTm4gH KA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3329c98hr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Aug 2020 03:15:00 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07L7AJd2012891;
 Fri, 21 Aug 2020 07:14:58 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3304um41qb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Aug 2020 07:14:58 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07L7Eusl28901636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Aug 2020 07:14:56 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F326FAE045;
 Fri, 21 Aug 2020 07:14:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2622AE04D;
 Fri, 21 Aug 2020 07:14:54 +0000 (GMT)
Received: from [9.102.2.201] (unknown [9.102.2.201])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 Aug 2020 07:14:54 +0000 (GMT)
Subject: Re: [PATCH v2 07/13] mm/debug_vm_pgtable/set_pte/pmd/pud: Don't use
 set_*_at to update an existing pte entry
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
 <20200819130107.478414-8-aneesh.kumar@linux.ibm.com>
 <b21d1dbb-7439-d317-8516-94c80f333e92@csgroup.eu>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <3d966519-0a6b-3ccb-fd21-b7f06c8e4df7@linux.ibm.com>
Date: Fri, 21 Aug 2020 12:44:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b21d1dbb-7439-d317-8516-94c80f333e92@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-21_05:2020-08-19,
 2020-08-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=671 impostorscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008210065
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/20/20 8:02 PM, Christophe Leroy wrote:
> 
> 
> Le 19/08/2020 à 15:01, Aneesh Kumar K.V a écrit :
>> set_pte_at() should not be used to set a pte entry at locations that
>> already holds a valid pte entry. Architectures like ppc64 don't do TLB
>> invalidate in set_pte_at() and hence expect it to be used to set 
>> locations
>> that are not a valid PTE.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/debug_vm_pgtable.c | 35 +++++++++++++++--------------------
>>   1 file changed, 15 insertions(+), 20 deletions(-)
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 76f4c713e5a3..9c7e2c9cfc76 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -74,15 +74,18 @@ static void __init pte_advanced_tests(struct 
>> mm_struct *mm,
>>   {
>>       pte_t pte = pfn_pte(pfn, prot);
>> +    /*
>> +     * Architectures optimize set_pte_at by avoiding TLB flush.
>> +     * This requires set_pte_at to be not used to update an
>> +     * existing pte entry. Clear pte before we do set_pte_at
>> +     */
>> +
>>       pr_debug("Validating PTE advanced\n");
>>       pte = pfn_pte(pfn, prot);
>>       set_pte_at(mm, vaddr, ptep, pte);
>>       ptep_set_wrprotect(mm, vaddr, ptep);
>>       pte = ptep_get(ptep);
>>       WARN_ON(pte_write(pte));
>> -
>> -    pte = pfn_pte(pfn, prot);
>> -    set_pte_at(mm, vaddr, ptep, pte);
>>       ptep_get_and_clear(mm, vaddr, ptep);
>>       pte = ptep_get(ptep);
>>       WARN_ON(!pte_none(pte));
>> @@ -96,13 +99,11 @@ static void __init pte_advanced_tests(struct 
>> mm_struct *mm,
>>       ptep_set_access_flags(vma, vaddr, ptep, pte, 1);
>>       pte = ptep_get(ptep);
>>       WARN_ON(!(pte_write(pte) && pte_dirty(pte)));
>> -
>> -    pte = pfn_pte(pfn, prot);
>> -    set_pte_at(mm, vaddr, ptep, pte);
>>       ptep_get_and_clear_full(mm, vaddr, ptep, 1);
>>       pte = ptep_get(ptep);
>>       WARN_ON(!pte_none(pte));
>> +    pte = pfn_pte(pfn, prot);
>>       pte = pte_mkyoung(pte);
>>       set_pte_at(mm, vaddr, ptep, pte);
>>       ptep_test_and_clear_young(vma, vaddr, ptep);
>> @@ -164,9 +165,6 @@ static void __init pmd_advanced_tests(struct 
>> mm_struct *mm,
>>       pmdp_set_wrprotect(mm, vaddr, pmdp);
>>       pmd = READ_ONCE(*pmdp);
>>       WARN_ON(pmd_write(pmd));
>> -
>> -    pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>> -    set_pmd_at(mm, vaddr, pmdp, pmd);
>>       pmdp_huge_get_and_clear(mm, vaddr, pmdp);
>>       pmd = READ_ONCE(*pmdp);
>>       WARN_ON(!pmd_none(pmd));
>> @@ -180,13 +178,11 @@ static void __init pmd_advanced_tests(struct 
>> mm_struct *mm,
>>       pmdp_set_access_flags(vma, vaddr, pmdp, pmd, 1);
>>       pmd = READ_ONCE(*pmdp);
>>       WARN_ON(!(pmd_write(pmd) && pmd_dirty(pmd)));
>> -
>> -    pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>> -    set_pmd_at(mm, vaddr, pmdp, pmd);
>>       pmdp_huge_get_and_clear_full(vma, vaddr, pmdp, 1);
>>       pmd = READ_ONCE(*pmdp);
>>       WARN_ON(!pmd_none(pmd));
>> +    pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>>       pmd = pmd_mkyoung(pmd);
>>       set_pmd_at(mm, vaddr, pmdp, pmd);
>>       pmdp_test_and_clear_young(vma, vaddr, pmdp);
>> @@ -283,18 +279,10 @@ static void __init pud_advanced_tests(struct 
>> mm_struct *mm,
>>       WARN_ON(pud_write(pud));
>>   #ifndef __PAGETABLE_PMD_FOLDED
> 
> Same as below, once set_put_at() is gone, I don't think this #ifndef 
> __PAGETABLE_PMD_FOLDED is still need, should be possible to replace by 
> 'if (mm_pmd_folded())'

I would skip that change in this series because I still haven't worked 
out what it means to have FOLDED PMD with 
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.


We should probably push that as a cleanup later and somebody who can 
test that config can do that? Currently i can't boot ppc64 with 
DBUG_VM_PGTABLE enabled on ppc64 because it is all buggy w.r.t rules.

-aneesh
