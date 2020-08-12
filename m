Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4030424276D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 11:25:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRPRq1hdkzDqYC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 19:24:55 +1000 (AEST)
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
 header.s=pp1 header.b=pfPYDnXR; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRPPt2pjMzDqX1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 19:23:14 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07C92lQr188741; Wed, 12 Aug 2020 05:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wpgKeIr5Wh+N6AHs+sxTnyeS0xZzGHuLTME8mqw9oec=;
 b=pfPYDnXRlI00SHmFz9ATVNyVrQ95yCotxAG2+Jbg4G5o2jlRjcPouqYKdruNv8dfVgix
 XdyfWWj7HMS/igXA6J9ErHARUnIU3syYXkwaatSEdMYzQ6TUXTIp/ViHp0/dLqJmeUVR
 k5WKLf2pseFq7IUJXxwS7FaFcbFRGzY5d276pG64BZnK+YIpEjpnzzGE4zRmv5jCMfsd
 xPLJB5znyuuuaDfcsByNCmvbBRZQda7lDyTd2JPuMHsq+jNaJG5BcRqGTRoZMAa1xbh7
 gaR37l3rOxvoWo6cQPbdNANriXnVpNxYDzKWIpSgaseTTBNO0P2a5Dt0yuKlByw3oNUN Yg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32t93s3txq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 05:23:00 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07C9LY3a007779;
 Wed, 12 Aug 2020 09:22:58 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 32skp82mc4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 09:22:58 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07C9LS1147972790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2020 09:21:28 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9E364C05E;
 Wed, 12 Aug 2020 09:22:55 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B208A4C058;
 Wed, 12 Aug 2020 09:22:54 +0000 (GMT)
Received: from [9.85.71.17] (unknown [9.85.71.17])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2020 09:22:54 +0000 (GMT)
Subject: Re: [PATCH 03/16] debug_vm_pgtable/set_pte: Don't use set_pte_at to
 update an existing pte entry
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-3-aneesh.kumar@linux.ibm.com>
 <94ed519a-2cf2-af50-82be-2a559dee7d86@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <32200d05-2707-694a-70b2-e93e5ae83b4a@linux.ibm.com>
Date: Wed, 12 Aug 2020 14:52:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <94ed519a-2cf2-af50-82be-2a559dee7d86@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-12_02:2020-08-11,
 2020-08-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=801 impostorscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008120064
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

On 8/12/20 2:42 PM, Anshuman Khandual wrote:
> 
> 
> On 08/12/2020 12:03 PM, Aneesh Kumar K.V wrote:
>> set_pte_at() should not be used to set a pte entry at locations that
>> already holds a valid pte entry. Architectures like ppc64 don't do TLB
>> invalidate in set_pte_at() and hence expect it to be used to set locations
>> that are not a valid PTE.
> 
> Even though set_pte_at() is not really a arch page table helper and
> very much arch specific, I just wonder why this deviation on ppc64
> as compared to other platforms. Detecting such semantics variation
> across platforms is an objective of this test.

Not sure what you mean by set_pte_at is not a page table helper. Generic 
kernel use that helper to set a pte entry.

Now w.r.t ppc64 behavior this was discussed multiple times. I guess 
Linux kernel always used set_pte_at on a none pte entry. We had some 
exceptions in the recent past. But all fixed when noticed.


383321ab8578dfe3bbcc0bc5604c0f8ae08a5c98
mm/hugetlb/migration: use set_huge_pte_at instead of set_pte_at

cee216a696b2004017a5ecb583366093d90b1568
mm/autonuma: don't use set_pte_at when updating protnone ptes

56eecdb912b536a4fa97fb5bfe5a940a54d79be6
mm: Use ptep/pmdp_set_numa() for updating _PAGE_NUMA bit

Yes. Having a testcase like this help

> 
> As small nit.
> 
> Please follow the existing subject format for all patches in here.
> It will improve readability and also help understand these changes
> better, later on.
> 
> mm/debug_vm_pgtable: <Specify changes to an individual test>
> 
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/debug_vm_pgtable.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 4c32063a8acf..02a7c20aa4a2 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -81,8 +81,6 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
>>   	pte = ptep_get(ptep);
>>   	WARN_ON(pte_write(pte));
>>   
>> -	pte = pfn_pte(pfn, prot);
>> -	set_pte_at(mm, vaddr, ptep, pte);
>>   	ptep_get_and_clear(mm, vaddr, ptep);
>>   	pte = ptep_get(ptep);
>>   	WARN_ON(!pte_none(pte));
> 
> This makes sense. But could you please fold this code stanza with
> the previous one in order to imply that 'ptep' did have some valid
> entry before being cleared and checked against pte_none().
> 

will do that

>> @@ -97,12 +95,14 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
>>   	pte = ptep_get(ptep);
>>   	WARN_ON(!(pte_write(pte) && pte_dirty(pte)));
>>   
>> -	pte = pfn_pte(pfn, prot);
>> -	set_pte_at(mm, vaddr, ptep, pte);
>>   	ptep_get_and_clear_full(mm, vaddr, ptep, 1);
>>   	pte = ptep_get(ptep);
>>   	WARN_ON(!pte_none(pte));
> 
> Same, please fold back.
> 

ok


>> +	/*
>> +	 * We should clear pte before we do set_pte_at
>> +	 */
>> +	pte = ptep_get_and_clear(mm, vaddr, ptep);
>>   	pte = pte_mkyoung(pte);
>>   	set_pte_at(mm, vaddr, ptep, pte);
>>   	ptep_test_and_clear_young(vma, vaddr, ptep);
>>
> 
> The comment above should also explain details that are mentioned
> in the commit message i.e how platforms such as ppc64 expects a
> clear pte entry for set_pte_at() to work.
> 

I don't think it is specific to ppc64. There is nothing specific to 
ppc64 architecture in there. It is an optimization used in kernel to 
help architecture avoid TLB flush. I will update the comment as below


/* We should clear pte before we do set_pte_at so that set_pte_at don't 
find a valid pte at ptep *?

is that good?

-aneesh

