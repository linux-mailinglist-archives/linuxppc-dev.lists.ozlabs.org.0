Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 071371F176B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 13:18:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gW2g3CXLzDqSq
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 21:18:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gW0m4CWPzDqKN
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 21:16:40 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 058B27NS026343; Mon, 8 Jun 2020 07:16:29 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31g42s61r2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 07:16:29 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 058BAXuH012598;
 Mon, 8 Jun 2020 11:16:27 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma05fra.de.ibm.com with ESMTP id 31g2s7shwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 11:16:27 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 058BGPhX63045962
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jun 2020 11:16:25 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D240A4055;
 Mon,  8 Jun 2020 11:16:25 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE2BAA4051;
 Mon,  8 Jun 2020 11:16:23 +0000 (GMT)
Received: from [9.85.88.17] (unknown [9.85.88.17])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jun 2020 11:16:23 +0000 (GMT)
Subject: Re: [PATCH] mm/debug_vm_pgtable: Fix kernel crash with page table
 validate
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <20200608062739.378902-1-aneesh.kumar@linux.ibm.com>
 <2497c7b7-b5cf-8df4-dc82-efefe2fb6f5a@arm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <c5c48970-714b-271f-1242-b789be801d9b@linux.ibm.com>
Date: Mon, 8 Jun 2020 16:46:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <2497c7b7-b5cf-8df4-dc82-efefe2fb6f5a@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-08_07:2020-06-08,
 2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 cotscore=-2147483648 lowpriorityscore=0
 adultscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080082
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
Cc: akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/8/20 4:31 PM, Anshuman Khandual wrote:
> Hi Aneesh,
> 
> On 06/08/2020 11:57 AM, Aneesh Kumar K.V wrote:
>> Architectures can have CONFIG_TRANSPARENT_HUGEPAGE enabled but
>> no THP support enabled based on platforms. For ex: with 4K
>> PAGE_SIZE ppc64 supports THP only with radix translation.
> 
> Good catch, never hit this before.
> 
>>
>> This results in below crash when running with hash translation and
>> 4K PAGE_SIZE.
>>
>> kernel BUG at arch/powerpc/include/asm/book3s/64/hash-4k.h:140!
>> cpu 0x61: Vector: 700 (Program Check) at [c000000ff948f860]
>>      pc: c0000000018810f8: debug_vm_pgtable+0x480/0x8b0
>>      lr: c0000000018810ec: debug_vm_pgtable+0x474/0x8b0
>> ...
>> [c000000ff948faf0] c000000001880fec debug_vm_pgtable+0x374/0x8b0 (unreliable)
>> [c000000ff948fbf0] c000000000011648 do_one_initcall+0x98/0x4f0
>> [c000000ff948fcd0] c000000001843928 kernel_init_freeable+0x330/0x3fc
>> [c000000ff948fdb0] c0000000000122ac kernel_init+0x24/0x148
>> [c000000ff948fe20] c00000000000cc44 ret_from_kernel_thread+0x5c/0x78
>>
>> Check for THP support correctly
> 
> Makes sense, is this the only configuration which hit the problem ?

4K hash ppc64 is the only config i guess.

> 
>>
>> Cc: anshuman.khandual@arm.com
>> Fixes: 399145f9eb6c ("mm/debug: add tests validating architecture page table helpers")
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/debug_vm_pgtable.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 188c18908964..e60151c5e997 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -61,6 +61,9 @@ static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
>>   {
>>   	pmd_t pmd = pfn_pmd(pfn, prot);
>>   
>> +	if (!has_transparent_hugepage())
>> +		return;
>> +
> 
> We should also add this check to pud_basic_tests() as well.


Do we have a function that check for runtime support for pud level THP? 
ppc64 don't do pud level THP yet. So  we have 
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=n

are you suggesting we do the same check for pud level THP too?


> 
>>   	WARN_ON(!pmd_same(pmd, pmd));
>>   	WARN_ON(!pmd_young(pmd_mkyoung(pmd_mkold(pmd))));
>>   	WARN_ON(!pmd_dirty(pmd_mkdirty(pmd_mkclean(pmd))));
>>
> 
> The subject line here should mention about correct THP support
> detection which fixes the problem. Probably something like this
> or similar ("Fix kernel crash with correct THP support check").


Not sure about that. This fix a kernel crash with page table validate code.


-aneesh
