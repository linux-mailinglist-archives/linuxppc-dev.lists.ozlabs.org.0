Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C41FB246C26
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 18:11:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVfDY3XxNzDq8v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 02:11:25 +1000 (AEST)
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
 header.s=pp1 header.b=sMEvkWQk; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVdxm6kGGzDqRL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 01:58:36 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HFXF1q012263; Mon, 17 Aug 2020 11:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sN6fy6GsDmh3MJkR2UwxawPAZSIAguRldgLD/b/VjLk=;
 b=sMEvkWQkzVDXGH21uLSKwKRf7XqMb62wv9yHJjPir83OGWh5nqDk1Nx8qpEtep2MSe9E
 8Vbu9qZJh3MCOMZQA2xZcTo0Prvb5J7UbXBphjJYmRGT67SuTxBJgeMUWM/S+OXMnghj
 RCbeATqZCNrFTrnyOhpQt+gwTeUp1FaCXWvKb1FN4Kn+NRAWe1NNxPtZi9f6ajL+zoDY
 ObtHntda6pMnji/qRO1Oy+7Wr8F3KGdjJRtzjvhhuf5cchh7fGHhjL02S8kclKh1Aq3F
 fCjwxlt2Xo4g82q9eLOfsX7vtba/i+wKDUVi6+XSVmywx9OH8AHsZ58UcyOHdBAEOaLN /Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32y4kwypt4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 11:58:30 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07HFXPYB012628;
 Mon, 17 Aug 2020 11:58:30 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32y4kwypsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 11:58:30 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07HFYW9R000538;
 Mon, 17 Aug 2020 15:58:28 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 32x7b81fmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 15:58:28 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07HFwN7n23331216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 15:58:23 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50F2B4C044;
 Mon, 17 Aug 2020 15:58:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F41634C040;
 Mon, 17 Aug 2020 15:58:21 +0000 (GMT)
Received: from [9.102.2.56] (unknown [9.102.2.56])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Aug 2020 15:58:21 +0000 (GMT)
Subject: Re: [PATCH] powerpc/book3s64/radix: Fix boot failure with large
 amount of guest memory
To: Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200813162039.608649-1-aneesh.kumar@linux.ibm.com>
 <87c4ab91-b0a0-bd79-40fd-df93aedd98f3@linux.ibm.com>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <09f1ea36-54cd-9b45-9cc8-478cb4c93edc@linux.ibm.com>
Date: Mon, 17 Aug 2020 21:28:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87c4ab91-b0a0-bd79-40fd-df93aedd98f3@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_10:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008170118
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
Cc: Shirisha Ganta <shiganta@in.ibm.com>, Sandipan Das <sandipan@linux.ibm.com>,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/17/20 9:13 PM, Hari Bathini wrote:
> 
> 
> On 13/08/20 9:50 pm, Aneesh Kumar K.V wrote:
>> If the hypervisor doesn't support hugepages, the kernel ends up 
>> allocating a large
>> number of page table pages. The early page table allocation was wrongly
>> setting the max memblock limit to ppc64_rma_size with radix translation
>> which resulted in boot failure as shown below.
>>
>> Kernel panic - not syncing:
>> early_alloc_pgtable: Failed to allocate 16777216 bytes align=0x1000000 
>> nid=-1 from=0x0000000000000000 max_addr=0xffffffffffffffff
>>   CPU: 0 PID: 0 Comm: swapper Not tainted 5.8.0-24.9-default+ #2
>>   Call Trace:
>>   [c0000000016f3d00] [c0000000007c6470] dump_stack+0xc4/0x114 
>> (unreliable)
>>   [c0000000016f3d40] [c00000000014c78c] panic+0x164/0x418
>>   [c0000000016f3dd0] [c000000000098890] early_alloc_pgtable+0xe0/0xec
>>   [c0000000016f3e60] [c0000000010a5440] radix__early_init_mmu+0x360/0x4b4
>>   [c0000000016f3ef0] [c000000001099bac] early_init_mmu+0x1c/0x3c
>>   [c0000000016f3f10] [c00000000109a320] early_setup+0x134/0x170
>>
>> This was because the kernel was checking for the radix feature before 
>> we enable the
>> feature via mmu_features. This resulted in the kernel using hash 
>> restrictions on
>> radix.
>>
>> Rework the early init code such that the kernel boot with memblock 
>> restrictions
>> as imposed by hash. At that point, the kernel still hasn't finalized the
>> translation the kernel will end up using.
>>
>> We have three different ways of detecting radix.
>>
>> 1. dt_cpu_ftrs_scan -> used only in case of PowerNV
>> 2. ibm,pa-features -> Used when we don't use cpu_dt_ftr_scan
>> 3. CAS -> Where we negotiate with hypervisor about the supported 
>> translation.
>>
>> We look at 1 or 2 early in the boot and after that, we look at the CAS 
>> vector to
>> finalize the translation the kernel will use. We also support a kernel 
>> command
>> line option (disable_radix) to switch to hash.
>>
>> Update the memblock limit after mmu_early_init_devtree() if the kernel 
>> is going
>> to use radix translation. This forces some of the memblock allocations 
>> we do before
>> mmu_early_init_devtree() to be within the RMA limit.
> 
> Minor comments below. Nonetheless...
> 
> Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>
> 
>>
>> Fixes: 2bfd65e45e87 ("powerpc/mm/radix: Add radix callbacks for early 
>> init routines")
>> Reported-by: Shirisha Ganta <shiganta@in.ibm.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/book3s/64/mmu.h | 8 +++++---
>>   arch/powerpc/kernel/prom.c               | 6 ++++++
>>   arch/powerpc/mm/book3s64/radix_pgtable.c | 2 ++
>>   3 files changed, 13 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h 
>> b/arch/powerpc/include/asm/book3s/64/mmu.h
>> index 55442d45c597..4245f99453f5 100644
>> --- a/arch/powerpc/include/asm/book3s/64/mmu.h
>> +++ b/arch/powerpc/include/asm/book3s/64/mmu.h
>> @@ -244,9 +244,11 @@ extern void 
>> radix__setup_initial_memory_limit(phys_addr_t first_memblock_base,
>>   static inline void setup_initial_memory_limit(phys_addr_t 
>> first_memblock_base,
>>                             phys_addr_t first_memblock_size)
>>   {
>> -    if (early_radix_enabled())
>> -        return radix__setup_initial_memory_limit(first_memblock_base,
>> -                           first_memblock_size);
>> +    /*
>> +     * Hash has more strict restrictions. At this point we don't
>> +     * know which translations we will pick. Hence got with hash
> 
> :s/got with/go with/
> 
>> +     * restrictions.
>> +     */
>>       return hash__setup_initial_memory_limit(first_memblock_base,
>>                          first_memblock_size);
>>   }
>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>> index d8a2fb87ba0c..340900ae95a4 100644
>> --- a/arch/powerpc/kernel/prom.c
>> +++ b/arch/powerpc/kernel/prom.c
>> @@ -811,6 +811,12 @@ void __init early_init_devtree(void *params)
>>       mmu_early_init_devtree();
>> +    /*
>> +     * Reset ppc64_rma_size and memblock memory limit
>> +     */
>> +    if (early_radix_enabled())
>> +        radix__setup_initial_memory_limit(memstart_addr, 
>> first_memblock_size);
>> +
>>   #ifdef CONFIG_PPC_POWERNV
>>       /* Scan and build the list of machine check recoverable ranges */
>>       of_scan_flat_dt(early_init_dt_scan_recoverable_ranges, NULL);
>> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c 
>> b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> index 28c784976bed..094daf16acac 100644
>> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
>> @@ -747,6 +747,8 @@ void radix__setup_initial_memory_limit(phys_addr_t 
>> first_memblock_base,
>>        * Radix mode is not limited by RMA / VRMA addressing.
>>        */
>>       ppc64_rma_size = ULONG_MAX;
> 
>> +
>> +    memblock_set_current_limit(MEMBLOCK_ALLOC_ANYWHERE);
> 
> Probably the same thing but I would prefer the below instead:
> 
> memblock_set_current_limit(ppc64_rma_size);

This is not really related to ppc64_rma_size right? On radix what we 
actually want is memblock alloc from anywhere. Actually what we want is

memblock_set_current_limit(memblock_limit_from_rma(ppc64_rma_size))


But that is unnecessary complication?

-aneesh

