Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AB386243413
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 08:40:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRxlL65Z0zDqX2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 16:40:14 +1000 (AEST)
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
 header.s=pp1 header.b=FtrMY/N7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRxhm41DmzDqbw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 16:38:00 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07D6X8Pj116749; Thu, 13 Aug 2020 02:37:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=QQGyTjfXXbWIHsNzvrt1ffF08kE64WZFD0rNF45yW9Y=;
 b=FtrMY/N7ooMdQYY+pZ/uxICPU+E++UwzgJEBbkwuZSR4ZlW4qU3ClxJNOArWAGSchGZV
 m9iIlPB/EkH+Gp4r79vyXyCj9pMtzaEVKuUS4P4Q3tR6CS3DghIfQj1YP9nMj233/Qxn
 wkE6hELgGst0W67GC+q8YY3TC9gPBFBxA0xieAj3EVNbrJV1Fu1P0HN+75354mssefD+
 gwAp6aSZ160GeQJ8Gk9hOMEv8hJ0fK3QB3x+y73IDKk2ZwmbtGofFfiJSxsKA2OYYxVb
 ip8QjoOY8h0z31kxp6wE/XavfFLMofa2mhwkXEpkUTLojOUozXE28zqC1tkGuWc8JYb1 7w== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32vqcpdcgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 02:37:48 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07D6advg009270;
 Thu, 13 Aug 2020 06:37:46 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 32skp857pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 13 Aug 2020 06:37:46 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07D6bi9015597916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 13 Aug 2020 06:37:44 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A8A74204C;
 Thu, 13 Aug 2020 06:37:44 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 144B142049;
 Thu, 13 Aug 2020 06:37:43 +0000 (GMT)
Received: from [9.79.219.81] (unknown [9.79.219.81])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 13 Aug 2020 06:37:42 +0000 (GMT)
Subject: Re: [PATCH 16/16] debug_vm_pgtable/ppc64: Add a variant of pfn_pte/pmd
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-16-aneesh.kumar@linux.ibm.com>
 <fe7beb39-97e6-dd7c-59d4-e1a72bab3d71@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <b42822c9-f8b6-55cf-7bc6-6def2faeb378@linux.ibm.com>
Date: Thu, 13 Aug 2020 12:07:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fe7beb39-97e6-dd7c-59d4-e1a72bab3d71@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-13_04:2020-08-13,
 2020-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008130049
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

On 8/13/20 11:00 AM, Anshuman Khandual wrote:
> 
> On 08/12/2020 12:03 PM, Aneesh Kumar K.V wrote:
>> The tests do expect _PAGE_PTE bit set by different page table accessors.
>> This is not true for the kernel. Within the kernel, _PAGE_PTE bits are
>> usually set by set_pte_at(). To make the below tests work correctly add test
>> specific pfn_pte/pmd helpers that set _PAGE_PTE bit.
>>
>> pte_t pte = pfn_pte(pfn, prot);
>> WARN_ON(!pte_devmap(pte_mkdevmap(pte)));
>> WARN_ON(!pte_savedwrite(pte_mk_savedwrite(pte_clear_savedwrite(pte))));
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/debug_vm_pgtable.c | 65 +++++++++++++++++++++++++++----------------
>>   1 file changed, 41 insertions(+), 24 deletions(-)
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index eea62d5e503b..153c925b5273 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -31,6 +31,23 @@
>>   #include <asm/pgalloc.h>
>>   #include <asm/tlbflush.h>
>>   
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +static inline pte_t debug_vm_pfn_pte(unsigned long pfn, pgprot_t pgprot)
>> +{
>> +	pte_t pte = pfn_pte(pfn, pgprot);
>> +	return __pte(pte_val(pte) | _PAGE_PTE);
>> +
>> +}
>> +static inline pmd_t debug_vm_pfn_pmd(unsigned long pfn, pgprot_t pgprot)
>> +{
>> +	pmd_t pmd = pfn_pmd(pfn, pgprot);
>> +	return __pmd(pmd_val(pmd) | _PAGE_PTE);
>> +}
>> +#else
>> +#define debug_vm_pfn_pte(pfn, pgprot) pfn_pte(pfn, pgprot)
>> +#define debug_vm_pfn_pmd(pfn, pgprot) pfn_pmd(pfn, pgprot)
>> +#endif
> 
> Again, no platform specific constructs please. This defeats the whole purpose of
> this test. If __PAGE_PTE is required for the helpers, then pfn_pmd/pte() could
> be modified to accommodate that. We dont see similar issues on other platforms,
> hence could you please explain why ppc64 is different here.
> 

It is not platform specific. set_pte_at is the one that set the 
_PAGE_PTE bit. We don't call that in the test.  The test seems to make 
the assumption that pfn_pte returns a proper pte which is not true.

-aneesh
