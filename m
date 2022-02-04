Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD70C4A95D5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 10:15:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jqqcm51Yhz3cNS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 20:15:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oN4v+w8E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oN4v+w8E; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jqqc10Vpyz2x9b
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 20:14:24 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21480hhR006708
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 4 Feb 2022 09:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=OJbj2uXlsvdoj088Tg7LqiNHcMl9UadGDIgfkBfXGuM=;
 b=oN4v+w8EoX3Y4O49ykA31twcWzJF0+fh667zM8FftLkGNA5p1+0EnLcck03/P46aHAnH
 mzIWg6mU7tjGMfLpGO7lbj/LapmyqfctWleq2YvlJsHqn4N7KjEC7j7Rpt/+gU/AzB4r
 MMxUZQpCvrd10mW6G+TgOoMNGPGWmOeU9MuVFdEQ5gVFdMhhjETzBzM28asmsZEVpUsf
 NXd+aUJYqzG1/dT0ZyXRGv/Vi4kwexR0QDAavjqS5JZGulBCtgQ7gr0YekNyDUnzU/fX
 GbsHXGzm6+jcdSD5PV0qGhQd7Slxt7uCQ2HYKSur50/zRCUbPsnzT0KHAm8YI8PqYDND 5A== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx0h3ex-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Feb 2022 09:14:19 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2149DSB3003446
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 4 Feb 2022 09:14:16 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3e0r0yaw6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Feb 2022 09:14:16 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2149EE2843909566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 4 Feb 2022 09:14:14 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 036C442041
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 09:14:14 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 67D374204C
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 09:14:13 +0000 (GMT)
Received: from [9.43.124.60] (unknown [9.43.124.60])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 09:14:13 +0000 (GMT)
Message-ID: <a4352457-7ffd-0fb9-7a86-92c9b50c957b@linux.ibm.com>
Date: Fri, 4 Feb 2022 14:44:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: powerpc: Set crashkernel offset to mid of RMA region
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org
References: <20220128100445.251233-1-sourabhjain@linux.ibm.com>
 <87r18mn74r.fsf@mpe.ellerman.id.au>
 <1c61a544-7ec9-5e5a-4b76-4725675cde7a@linux.ibm.com>
 <87czk4mco0.fsf@mpe.ellerman.id.au>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87czk4mco0.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dn4unHaKNx0rrpIIpGWCqHd4NqDvpgor
X-Proofpoint-ORIG-GUID: dn4unHaKNx0rrpIIpGWCqHd4NqDvpgor
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040047
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 03/02/22 16:37, Michael Ellerman wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>> On 01/02/22 17:14, Michael Ellerman wrote:
>>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>>> On large config LPARs (having 192 and more cores), Linux fails to boot
>>>> due to insufficient memory in the first memblock. It is due to the
>>>> memory reservation for the crash kernel which starts at 128MB offset of
>>>> the first memblock. This memory reservation for the crash kernel doesn't
>>>> leave enough space in the first memblock to accommodate other essential
>>>> system resources.
>>>>
>>>> The crash kernel start address was set to 128MB offset by default to
>>>> ensure that the crash kernel get some memory below the RMA region which
>>>> is used to be of size 256MB. But given that the RMA region size can be
>>>> 512MB or more, setting the crash kernel offset to mid of RMA size will
>>>> leave enough space for kernel to allocate memory for other system
>>>> resources.
>>>>
>>>> Since the above crash kernel offset change is only applicable to the LPAR
>>>> platform, the LPAR feature detection is pushed before the crash kernel
>>>> reservation. The rest of LPAR specific initialization will still
>>>> be done during pseries_probe_fw_features as usual.
>>>>
>>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>>> Reported-and-tested-by: Abdul haleem <abdhalee@linux.vnet.ibm.com>
>>>>
>>>> ---
>>>>    arch/powerpc/kernel/rtas.c |  4 ++++
>>>>    arch/powerpc/kexec/core.c  | 15 +++++++++++----
>>>>    2 files changed, 15 insertions(+), 4 deletions(-)
>>>>
>>>>    ---
>>>>    Change in v3:
>>>> 	Dropped 1st and 2nd patch from v2. 1st and 2nd patch from v2 patch
>>>> 	series [1] try to discover 1T segment MMU feature support
>>>> 	BEFORE boot CPU paca allocation ([1] describes why it is needed).
>>>> 	MPE has posted a patch [2] that archives a similar objective by moving
>>>> 	boot CPU paca allocation after mmu_early_init_devtree().
>>>>
>>>> NOTE: This patch is dependent on the patch [2].
>>>>
>>>> [1] https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20211018084434.217772-3-sourabhjain@linux.ibm.com/
>>>> [2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-January/239175.html
>>>>    ---
>>>>
>>>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>>>> index 733e6ef36758..06df7464fb57 100644
>>>> --- a/arch/powerpc/kernel/rtas.c
>>>> +++ b/arch/powerpc/kernel/rtas.c
>>>> @@ -1313,6 +1313,10 @@ int __init early_init_dt_scan_rtas(unsigned long node,
>>>>    	entryp = of_get_flat_dt_prop(node, "linux,rtas-entry", NULL);
>>>>    	sizep  = of_get_flat_dt_prop(node, "rtas-size", NULL);
>>>>    
>>>> +	/* need this feature to decide the crashkernel offset */
>>>> +	if (of_get_flat_dt_prop(node, "ibm,hypertas-functions", NULL))
>>>> +		powerpc_firmware_features |= FW_FEATURE_LPAR;
>>>> +
>>> As you'd have seen this breaks the 32-bit build. It will need an #ifdef
>>> CONFIG_PPC64 around it.
>>>
>>>>    	if (basep && entryp && sizep) {
>>>>    		rtas.base = *basep;
>>>>    		rtas.entry = *entryp;
>>>> diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
>>>> index 8b68d9f91a03..abf5897ae88c 100644
>>>> --- a/arch/powerpc/kexec/core.c
>>>> +++ b/arch/powerpc/kexec/core.c
>>>> @@ -134,11 +134,18 @@ void __init reserve_crashkernel(void)
>>>>    	if (!crashk_res.start) {
>>>>    #ifdef CONFIG_PPC64
>>>>    		/*
>>>> -		 * On 64bit we split the RMO in half but cap it at half of
>>>> -		 * a small SLB (128MB) since the crash kernel needs to place
>>>> -		 * itself and some stacks to be in the first segment.
>>>> +		 * On the LPAR platform place the crash kernel to mid of
>>>> +		 * RMA size (512MB or more) to ensure the crash kernel
>>>> +		 * gets enough space to place itself and some stack to be
>>>> +		 * in the first segment. At the same time normal kernel
>>>> +		 * also get enough space to allocate memory for essential
>>>> +		 * system resource in the first segment. Keep the crash
>>>> +		 * kernel starts at 128MB offset on other platforms.
>>>>    		 */
>>>> -		crashk_res.start = min(0x8000000ULL, (ppc64_rma_size / 2));
>>>> +		if (firmware_has_feature(FW_FEATURE_LPAR))
>>>> +			crashk_res.start = ppc64_rma_size / 2;
>>>> +		else
>>>> +			crashk_res.start = min(0x8000000ULL, (ppc64_rma_size / 2));
>>> I think this will break on machines using Radix won't it? At this point
>>> in boot ppc64_rma_size will be == 0. Because we won't call into
>>> hash__setup_initial_memory_limit().
>>>
>>> That's not changed by your patch, but seems like this code needs to be
>>> more careful/clever.
>> Interesting, but in my testing, I found that ppc64_rma_size
>> did get initialized before reserve_crashkernel() using radix on LPAR.
>>
>> I am not sure why but hash__setup_initial_memory_limit() function is
>> gets called
>> regardless of radix or hash. Not sure whether it is by design but here
>> is the flow:
> It sort of is by design. See:
>
>    103a8542cb35 ("powerpc/book3s64/radix: Fix boot failure with large amount of guest memory")
>
> Basically the hash restrictions are more strict, so we apply them until
> we know we will use radix.
>
> But ...
>
>> setup_initial_memory_limit()
>>
>>        static inline void setup_initial_memory_limit()
>> (arch/powerpc/include/asm/book3s/64/mmu.h)
>>
>>               if (!early_radix_enabled())  // FALSE regardless of radix is enabled or not
> You mean early_radix_enabled() is False regardless. But that's not true
> in all cases.
>
> We can now build the kernel without hash MMU support at all, see:
>
>    387e220a2e5e ("powerpc/64s: Move hash MMU support code under CONFIG_PPC_64S_HASH_MMU")
>
> In which case early_radix_enabled() will be true here, because it's hard
> coded to be true at build time.

Sorry, my bad I was not aware of that. But when both hash and radix
are enabled the early_radix_enabled return FALSE regardless it is disabled
using kernel command line or not is confusing to me. Maybe it is too early
in the boot sequence...


>
>>                   hash__setup_initial_memory_limit() // initialize ppc64_rma_size
>>
>>        reserve_crashkernel()  // initialize crashkernel offset to mid of RMA size.
>>
>>
>> For the sack of understanding even if we restrict crashkernel offset
>> setting to mid RMA (i.e. ppc64_rma_size/2) for
>> only hash it may not save radix because even today we are assigning
>> crashkernel offset using
>> ppc64_rma_size variable.
> Yes. There's already a bug there, your patch doesn't make it better or worse.
>
>> Is the current flow of initializing ppc64_rma_size variable before
>> reserve_crashkernel() for radix expected?
>>
>> Please provide your input.
> I wonder if we're better off moving the crash kernel reservation later,
> once we've discovered what MMU we're using.
>
> I can't immediately see why that would be a problem, as long as we do
> the reservation before we do any (many?) allocations. I'll have to think
> about it a bit more though, these boot ordering things are always
> subtle.
Agree we have space to improve this piece of code. Let me know
if I can help you to make this better.
> For now I think this patch is OK if you send a v2 to fix the compile
> error
I sent the next version in the mailing list. Thanks for the support.

- Sourabh Jain
