Return-Path: <linuxppc-dev+bounces-13711-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7CFC2F5C1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 06:19:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0xZr2Y5Vz3bd8;
	Tue,  4 Nov 2025 16:19:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762233556;
	cv=none; b=jhNAf08ISCbP/U9LQMU+7sXpuzwwz9NLLrj0bi6i81ihfWVRokmrSta3L3Kx6XISpcJRIArnZUnlW2fjxxDMW4nBMrE3GN3LAzgNi6bAHIGWpQ3dag8ZZ0fM77+iGVesKW+qgMNp+wcDiZa3YUWYzfq534nBGpccqxZ0g27gZKucoOoBxte7dHqJxbE/XA1Luqkwl9ognQoqupWpuenV/lStpW5OnnHaP0sPz7ZkJBuVunMliQWQhU50BRfxYB1IZ9bVHEXm5WwATsjV//sGeIUi7PNV6swJ8E+JyjQVJsl12SStL6k+nFET8A4DoNQ9sv6bqNRhyDRNWhhVQs1h0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762233556; c=relaxed/relaxed;
	bh=AyyyY69URHXBHBXuKwIvHGG00IaZNhocmOIAOtV3/CU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eaLWd8ctW3kRfC54GvipTOEpFTxrO9Jw2EqXNI06/0NiXnuNnTaA00KX3QYYw25sRe2qJ+6gX+fDvKAkQEs/r3vlIgPnkuQyqTl2MrKs+NakErSQhKJGGEuUJBeKi65Gw3KvUSQM6HhrcuoAwBRLs9MZbw7NAWv+8dmXWcLehkJMg3C8fkfJ8XvUt37XYrJb4/8fcl/1ndsEfNnMNtpquS3/zGhKguVJkTrXIH7++cA9aqxnqttf9dalrjT+d+HGw6nQ9SwSECQnJMeLqygwV63tB90E60g25l44pR5bBujBq83OrxQFUWHAGC5jMKwX+W/ncwVh/Nq1f6gP5cd+5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PSSIc7Jg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PSSIc7Jg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0xZq1vTmz2yjq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 16:19:14 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A41EAMs029973;
	Tue, 4 Nov 2025 05:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=AyyyY6
	9URHXBHBXuKwIvHGG00IaZNhocmOIAOtV3/CU=; b=PSSIc7JgJKOM68Dv8STiix
	2h+5nQEV3qSNMdaN1z4yrxr3rgYT73n/d753rZ1SqzwmFTYC0Ml/G5nGKJYDzra4
	wyuYeJZGaXeVWu2D/GRSqr+ce8Q3bTAdyCunSX4OEKHRJEBOt96iralXz9Si7Y/Y
	o6i7b5+nv1yc2cB/SSkcPP9cYgYZWr9vwTfQlxD7PeWjsctaDjOquRx8E95l7I65
	pm9hHTdt1l3HfwqYPp5wtxRU/CSjs58D65S0GuT/7FkS6PF6B5VmILDipnFFlqAW
	c7ypgukLqQ6GH33awBE5OiIa74g/oMG1++g7D2Gcbkv5bQWXLI51UGyykJayjfPQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a58mkt9hf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 05:19:00 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A45Ixe4032491;
	Tue, 4 Nov 2025 05:18:59 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a58mkt9hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 05:18:59 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A41DnMc027371;
	Tue, 4 Nov 2025 05:18:59 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5vwy9n2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Nov 2025 05:18:59 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A45Iteb38863322
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Nov 2025 05:18:55 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E89A72004D;
	Tue,  4 Nov 2025 05:18:54 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA87020040;
	Tue,  4 Nov 2025 05:18:52 +0000 (GMT)
Received: from [9.109.204.116] (unknown [9.109.204.116])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Nov 2025 05:18:52 +0000 (GMT)
Message-ID: <7957bd55-5bda-406f-aab3-64e0620bd452@linux.ibm.com>
Date: Tue, 4 Nov 2025 10:48:51 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] powerpc/kdump: Add support for crashkernel CMA
 reservation
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shivang Upadhyay <shivangu@linux.ibm.com>, kexec@lists.infradead.org
References: <20251103043747.1298065-1-sourabhjain@linux.ibm.com>
 <87y0on4ebh.ritesh.list@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87y0on4ebh.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UkAx3kwOJ9S9O5mlKPjnN7jbhGBPBt8y
X-Proofpoint-GUID: di6hm1RBHV5cS9mxBGLGt8ISfQ-uQnGW
X-Authority-Analysis: v=2.4 cv=SqidKfO0 c=1 sm=1 tr=0 ts=69098cc4 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8
 a=Zr8hIzOWfm08TC8BTWsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAwOSBTYWx0ZWRfX+8B8W+L3+amY
 aQ3pF9cHSV1h4UUtxpOFXpul5sdLjelJVeghrwnqxsSknUivJmAz5jyY8B9hkWTjOKkkAYEHf1p
 h+i7ZiZOn0aVnt1ewO6yzetlKp2ZV5xoSY/j9iffyGHWEhfJBObfnLbufHp341nbOTV8/NJ8OpV
 E+nYahgPqZv+ZstvXWZ6OwgMuc7QUzKoh/JTg8EYlPTiPCd4GJWbFC0mYNldpWXP79QvPzoAUi2
 IygywZyKVjrxEwlL4dPxLCCyE8z8KhYkyr7WamVQnJR/syty5WEXhEGw2qtQmk3CCtvYv6EnWc4
 qrBMnTonp0JnM1Kgspf8mE6aC5B3q4D+tNz3sbHdYoR+3AiVaY6hUx1YmFwTMdnqArmiqTR+LoF
 Grj/8Z0zUJa4lvy1mYqQ2pnMN3g/bg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010009
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 03/11/25 15:40, Ritesh Harjani (IBM) wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>
>> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
>> crashkernel= command line option") and commit ab475510e042 ("kdump:
>> implement reserve_crashkernel_cma") added CMA support for kdump
>> crashkernel reservation.
>>
>> Extend crashkernel CMA reservation support to powerpc.
>>
>> The following changes are made to enable CMA reservation on powerpc:
>>
>> - Parse and obtain the CMA reservation size along with other crashkernel
>>    parameters
>> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump
>> - Include the CMA-reserved ranges in the usable memory ranges for the
>>    kdump kernel to use.
>> - Exclude the CMA-reserved ranges from the crash kernel memory to
>>    prevent them from being exported through /proc/vmcore.
>>
>> With the introduction of the CMA crashkernel regions,
>> crash_exclude_mem_range() needs to be called multiple times to exclude
>> both crashk_res and crashk_cma_ranges from the crash memory ranges. To
>> avoid repetitive logic for validating mem_ranges size and handling
>> reallocation when required, this functionality is moved to a new wrapper
>> function crash_exclude_mem_range_guarded().
>>
>> To ensure proper CMA reservation, reserve_crashkernel_cma() is called
>> after pageblock_order is initialized.
>>
>> Update kernel-parameters.txt to document CMA support for crashkernel on
>> powerpc architecture.
>>
>> Cc: Baoquan he <bhe@redhat.com>
>> Cc: Jiri Bohac <jbohac@suse.cz>
>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
>> Cc: kexec@lists.infradead.org
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> ---
>> Changlog:
>>
>> v3 -> v4
>>   - Removed repeated initialization to tmem in
>>     crash_exclude_mem_range_guarded()
>>   - Call crash_exclude_mem_range() with right crashk ranges
>>
>> v4 -> v5:
>>   - Document CMA-based crashkernel support for ppc64 in kernel-parameters.txt
>> ---
>>   .../admin-guide/kernel-parameters.txt         |  2 +-
>>   arch/powerpc/include/asm/kexec.h              |  2 +
>>   arch/powerpc/kernel/setup-common.c            |  4 +-
>>   arch/powerpc/kexec/core.c                     | 10 ++++-
>>   arch/powerpc/kexec/ranges.c                   | 43 ++++++++++++++-----
>>   5 files changed, 47 insertions(+), 14 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>> index 6c42061ca20e..0f386b546cec 100644
>> --- a/Documentation/admin-guide/kernel-parameters.txt
>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>> @@ -1013,7 +1013,7 @@
>>   			It will be ignored when crashkernel=X,high is not used
>>   			or memory reserved is below 4G.
>>   	crashkernel=size[KMG],cma
>> -			[KNL, X86] Reserve additional crash kernel memory from
>> +			[KNL, X86, ppc64] Reserve additional crash kernel memory from
> Shouldn't this be PPC and not ppc64?
>
> If I see the crash_dump support...
>
> config ARCH_SUPPORTS_CRASH_DUMP
> 	def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
>
> The changes below aren't specific to ppc64 correct?

The thing is this feature is only supported with KEXEC_FILE and which 
only supported on PPC64:

config ARCH_SUPPORTS_KEXEC_FILE
     def_bool PPC64

Hence I kept it as ppc64.

I think I should update that in the commit message.

Also do you think is it good to restrict this feature to KEXEC_FILE?

>
>>   			CMA. This reservation is usable by the first system's
>>   			userspace memory and kernel movable allocations (memory
>>   			balloon, zswap). Pages allocated from this memory range
>> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
>> index 4bbf9f699aaa..bd4a6c42a5f3 100644
>> --- a/arch/powerpc/include/asm/kexec.h
>> +++ b/arch/powerpc/include/asm/kexec.h
>> @@ -115,9 +115,11 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt, struct crash_mem
>>   #ifdef CONFIG_CRASH_RESERVE
>>   int __init overlaps_crashkernel(unsigned long start, unsigned long size);
>>   extern void arch_reserve_crashkernel(void);
>> +extern void kdump_cma_reserve(void);
>>   #else
>>   static inline void arch_reserve_crashkernel(void) {}
>>   static inline int overlaps_crashkernel(unsigned long start, unsigned long size) { return 0; }
>> +static inline void kdump_cma_reserve(void) { }
>>   #endif
>>   
>>   #if defined(CONFIG_CRASH_DUMP)
>> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
>> index 68d47c53876c..c8c42b419742 100644
>> --- a/arch/powerpc/kernel/setup-common.c
>> +++ b/arch/powerpc/kernel/setup-common.c
>> @@ -35,6 +35,7 @@
>>   #include <linux/of_irq.h>
>>   #include <linux/hugetlb.h>
>>   #include <linux/pgtable.h>
>> +#include <asm/kexec.h>
>>   #include <asm/io.h>
>>   #include <asm/paca.h>
>>   #include <asm/processor.h>
>> @@ -995,11 +996,12 @@ void __init setup_arch(char **cmdline_p)
>>   	initmem_init();
>>   
>>   	/*
>> -	 * Reserve large chunks of memory for use by CMA for fadump, KVM and
>> +	 * Reserve large chunks of memory for use by CMA for kdump, fadump, KVM and
>>   	 * hugetlb. These must be called after initmem_init(), so that
>>   	 * pageblock_order is initialised.
>>   	 */
>>   	fadump_cma_init();
>> +	kdump_cma_reserve();
>>   	kvm_cma_reserve();
>>   	gigantic_hugetlb_cma_reserve();
>>   
>> diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
>> index d1a2d755381c..25744737eff5 100644
>> --- a/arch/powerpc/kexec/core.c
>> +++ b/arch/powerpc/kexec/core.c
>> @@ -33,6 +33,8 @@ void machine_kexec_cleanup(struct kimage *image)
>>   {
>>   }
>>   
>> +unsigned long long cma_size;
>> +
> nit:
> Since this is a gloabal powerpc variable you are defining, then can we
> keep it's name to crashk_cma_size?

Yeah make sense. I will update the variable name.


>
>>   /*
>>    * Do not allocate memory (or fail in any way) in machine_kexec().
>>    * We are past the point of no return, committed to rebooting now.
>> @@ -110,7 +112,7 @@ void __init arch_reserve_crashkernel(void)
>>   
>>   	/* use common parsing */
>>   	ret = parse_crashkernel(boot_command_line, total_mem_sz, &crash_size,
>> -				&crash_base, NULL, NULL, NULL);
>> +				&crash_base, NULL, &cma_size, NULL);
>>   
>>   	if (ret)
>>   		return;
>> @@ -130,6 +132,12 @@ void __init arch_reserve_crashkernel(void)
>>   	reserve_crashkernel_generic(crash_size, crash_base, 0, false);
>>   }
>>   
>> +void __init kdump_cma_reserve(void)
>> +{
>> +	if (cma_size)
>> +		reserve_crashkernel_cma(cma_size);
>> +}
>> +
> nit:
> cma_size is already checked for null within reserve_crashkernel_cma(),
> so we don't really need kdump_cma_reserve() function call as such.
>
> Also kdump_cma_reserve() only make sense with #ifdef CRASHKERNEL_CMA..
> so instead do you think we can directly call reserve_crashkernel_cma(cma_size)?

I think the above kdump_cma_reserve() definition should come under 
CONFIG_CRASH_RESERVE
because the way it is declared in arch/powerpc/include/asm/kexec.h.

I would like to keep kdump_cma_reserve() as is it because of two reasons:

- It keeps setup_arch() free from kdump #ifdefs
- In case if we want to add some condition on this reservation it would 
straight forward.

So lets keep kdump_cma_reserve as is, unless you have strong opinion on 
not to.

>>   int __init overlaps_crashkernel(unsigned long start, unsigned long size)
>>   {
>>   	return (start + size) > crashk_res.start && start <= crashk_res.end;
>> diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
>> index 3702b0bdab14..3bd27c38726b 100644
>> --- a/arch/powerpc/kexec/ranges.c
>> +++ b/arch/powerpc/kexec/ranges.c
>> @@ -515,7 +515,7 @@ int get_exclude_memory_ranges(struct crash_mem **mem_ranges)
>>    */
>>   int get_usable_memory_ranges(struct crash_mem **mem_ranges)
>>   {
>> -	int ret;
>> +	int ret, i;
>>   
>>   	/*
>>   	 * Early boot failure observed on guests when low memory (first memory
>> @@ -528,6 +528,13 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
>>   	if (ret)
>>   		goto out;
>>   
>> +	for (i = 0; i < crashk_cma_cnt; i++) {
>> +		ret = add_mem_range(mem_ranges, crashk_cma_ranges[i].start,
>> +				    crashk_cma_ranges[i].end - crashk_cma_ranges[i].start + 1);
>> +		if (ret)
>> +			goto out;
>> +	}
>> +
>>   	ret = add_rtas_mem_range(mem_ranges);
>>   	if (ret)
>>   		goto out;
>> @@ -546,6 +553,22 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
>>   #endif /* CONFIG_KEXEC_FILE */
>>   
>>   #ifdef CONFIG_CRASH_DUMP
>> +static int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
>> +					   unsigned long long mstart,
>> +					   unsigned long long mend)
>> +{
>> +	struct crash_mem *tmem = *mem_ranges;
>> +
>> +	/* Reallocate memory ranges if there is no space to split ranges */
>> +	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
>> +		tmem = realloc_mem_ranges(mem_ranges);
>> +		if (!tmem)
>> +			return -ENOMEM;
>> +	}
>> +
>> +	return crash_exclude_mem_range(tmem, mstart, mend);
>> +}
>> +
>>   /**
>>    * get_crash_memory_ranges - Get crash memory ranges. This list includes
>>    *                           first/crashing kernel's memory regions that
>> @@ -557,7 +580,6 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
>>   int get_crash_memory_ranges(struct crash_mem **mem_ranges)
>>   {
>>   	phys_addr_t base, end;
>> -	struct crash_mem *tmem;
>>   	u64 i;
>>   	int ret;
>>   
>> @@ -582,19 +604,18 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
>>   			sort_memory_ranges(*mem_ranges, true);
>>   	}
>>   
>> -	/* Reallocate memory ranges if there is no space to split ranges */
>> -	tmem = *mem_ranges;
>> -	if (tmem && (tmem->nr_ranges == tmem->max_nr_ranges)) {
>> -		tmem = realloc_mem_ranges(mem_ranges);
>> -		if (!tmem)
>> -			goto out;
>> -	}
>> -
>>   	/* Exclude crashkernel region */
>> -	ret = crash_exclude_mem_range(tmem, crashk_res.start, crashk_res.end);
>> +	ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_res.start, crashk_res.end);
>>   	if (ret)
>>   		goto out;
>>   
>> +	for (i = 0; i < crashk_cma_cnt; ++i) {
>> +		ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_cma_ranges[i].start,
>> +					      crashk_cma_ranges[i].end);
>> +		if (ret)
>> +			goto out;
>> +	}
>> +
>>   	/*
>>   	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
>>   	 *        regions are exported to save their context at the time of
>> -- 
>> 2.51.0


