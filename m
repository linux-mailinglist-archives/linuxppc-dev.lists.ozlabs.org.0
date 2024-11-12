Return-Path: <linuxppc-dev+bounces-3118-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 642199C5880
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 14:03:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xnmn96sy8z2xCW;
	Wed, 13 Nov 2024 00:03:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731416605;
	cv=none; b=JuAd+WQbKsen2qc/xWp679JYm8UTaXgCYw6eV8T0fWcOgiNj5qAMTRvQ018Iltws+6gz+D+EpLr0wTm6aVSh9T86wvOTXSMc3jpmGSjqe5uBsSD6/Y2s6nySEeQKDMMa62FA2u0IZ9z2p/6VIKrv38ysH4IwGkToG4xmAdty7Rr18fRYopgf7kivZa48Q3ziI94tZ40zSpQ4WQQ1YlvbzWfERKZg9EAEcaq1hmFwXqT3tfRm3mggHLKXQA3r3KFzZ9OrAmb+e+ZAbfm+qFQF/ScJMbc75WednCPtwVmfGnDhPGyPK/guQ1MRfB341UUT+yoSLNVDPe6cKYsTXGctRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731416605; c=relaxed/relaxed;
	bh=DQNctv/aivfPHKpsBZ+7qENDzqap/j3V33U1V6XrErE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WIcBTzy/pBqw3CN/wsYW46WiFHfiJWa3lDIFKH/BXYri//TnxX5JmWdFcD1y3LSIgE/gVQRGGsGfS+2cMa40jpVz+uhfojx5okX74D7VY+IcNg8TRC7ujNtGGl/QIUNy4Rq3vOa0mtg7qaEezQSgyUVYKmuvn/GRejMV8CnGCY3CEHTWm13xatMv8RHlAXLbkmijIr3uqNJy5sEvAoSVASnACtqK87ab82gkdPOGbJD0l/nVEmt3iHzcRuaQtlKLugmoizdGZIskxd0Zj8h7RJ8dQdyI/you/SBQfqZaww7JPuTY4OUmYW/HZstYmQ8wkLzUL7fP1sjmFtLTRIWl3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=spydqI/j; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=spydqI/j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xnmn857snz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 00:03:24 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACBA2YE021867;
	Tue, 12 Nov 2024 13:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=DQNctv
	/aivfPHKpsBZ+7qENDzqap/j3V33U1V6XrErE=; b=spydqI/j8Nd8hCwR+KH5Bp
	1vsH0kf0wQdDPRF5CeSPWtjKMkrsuimxlA161uK3rdzEEczeI1WgJPwaAsiWfjBJ
	JqmH5ybJL+ksuLiXMPJfFVTSAyqURftuMZv1g63OzakoJ9DB5t3jO7PTjJsYNISG
	askR+VmW3mFnDCjD9G71aooQlelKqW5myWR8DICGdaKhD0Zy/+BwdDwyT94H+0df
	QBeRGyP8yR5ZQZyepkKacC0vLXnKJE3IaiLhDB4euK1v5oWmAujXRVmOoHSEd954
	H72xp9hMOlaWdWbCNRnCDYIltY4Ind7zfdqDt5mea2cDjTPha//9wi4gijjv3HMg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42v5we0e4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 13:03:13 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4ACD36wx004257;
	Tue, 12 Nov 2024 13:03:13 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42v5we0e49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 13:03:13 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC7UUPD006616;
	Tue, 12 Nov 2024 13:03:12 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 42tm9jc5c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 13:03:12 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4ACD38dH61669660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Nov 2024 13:03:08 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8049720040;
	Tue, 12 Nov 2024 13:03:08 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9AA4A20043;
	Tue, 12 Nov 2024 13:03:06 +0000 (GMT)
Received: from [9.43.111.219] (unknown [9.43.111.219])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Nov 2024 13:03:06 +0000 (GMT)
Message-ID: <34d3e468-b867-4567-9d39-47b27409a2a8@linux.ibm.com>
Date: Tue, 12 Nov 2024 18:33:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] fadump: reserve param area if below boot_mem_top
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Hari Bathini <hbathini@linux.ibm.com>
References: <20241107055817.489795-1-sourabhjain@linux.ibm.com>
 <20241107055817.489795-2-sourabhjain@linux.ibm.com>
 <87zfm5m0p5.fsf@gmail.com>
 <b2047c3b-ec84-456f-8f95-734bcb9a0cd1@linux.ibm.com>
 <87ttccn0oz.fsf@gmail.com> <87serwmzvv.fsf@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87serwmzvv.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AojQuORflMlcIpzvNNgJNH81jrQWetZ0
X-Proofpoint-GUID: bEZ1JeLaSGlbc5q3f_gXftpIcH_C2kX4
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
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
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 bulkscore=0
 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411120102
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Ritesh,


On 12/11/24 17:23, Ritesh Harjani (IBM) wrote:
> Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:
>
>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>
>>> Hello Ritesh,
>>>
>>>
>>> On 12/11/24 11:51, Ritesh Harjani (IBM) wrote:
>>>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>>>
>>>>> The param area is a memory region where the kernel places additional
>>>>> command-line arguments for fadump kernel. Currently, the param memory
>>>>> area is reserved in fadump kernel if it is above boot_mem_top. However,
>>>>> it should be reserved if it is below boot_mem_top because the fadump
>>>>> kernel already reserves memory from boot_mem_top to the end of DRAM.
>>>> did you mean s/reserves/preserves ?
>>> Yeah, preserves is better.
>>>
>>>>> Currently, there is no impact from not reserving param memory if it is
>>>>> below boot_mem_top, as it is not used after the early boot phase of the
>>>>> fadump kernel. However, if this changes in the future, it could lead to
>>>>> issues in the fadump kernel.
>>>> This will only affect Hash and not radix correct? Because for radix your
>>>> param_area is somewhere within [memblock_end_of_DRAM() / 2, memblock_end_of_DRAM()]
>>>> which is anyway above boot_mem_top so it is anyway preserved as is...
>>> Yes.
>>>
>>>> ... On second thoughts since param_area during normal kernel boot anyway
>>>> comes from memblock now. And irrespective of where it falls (above or below
>>>> boot_mem_top), we anyway append the bootargs to that. So we don't really
>>>> preserve the original contents :) right?
>>> Sorry I didn't get it. We append strings from param_area to
>>> boot_command_line
>>> not the other way.
>>>
>>>
>> Right. My bad.
>>
>>>> So why not just always call for
>>>> memblock_reserve() on param_area during capture kernel run?
>>>>
>>>> Thoughts?
>>> Yes, there is no harm in calling memblock_reserve regardless of whether
>>> param_area
>>> is below or above boot_mem_top. However, calling it when param_area is
>>> higher than
>>> boot_mem_top is redundant, as we know fadump preserves memory from
>>> boot_mem_top
>>> to the end of DRAM during early boot.
>> So if we don't reserve the param_area then the kernel may use it for
>> some other purposes once memory is released to buddy, right. But I guess,
>> given we anyway copied the param_area in fadump_append_bootargs() during
>> early boot to cmdline (before parse_early_param()), we anyway don't need
>> it for later, right?
>>
>> In that case we don't need for Hash too (i.e when param_area falls under
>> boot_mem_top), right? Since we anyway copied the param_area before
>> parse_early_param() in fadump_append_bootargs. So what is the point in
>> calling memblock_reserve() on that? Maybe I am missing something, can
>> you please help explain.
>>
> Ok. I think I got it now. You did mention in the changelog -
>
> "Currently, there is no impact from not reserving param memory if it is
> below boot_mem_top, as it is not used after the early boot phase of the
> fadump kernel. However, if this changes in the future, it could lead to
> issues in the fadump kernel."
>
>
> So it is not an issue now, since the param area is not used after the
> contents is copied over. So I think today we anyway don't need to call
> memblock_reserve() on the param area - but if we are making it future
> proof then we might as well just call memblock_reserve() on param_area
> irrespective because otherwise once the kernel starts up it might re-use
> that area for other purposes. So isn't it better to reserve for fadump
> use of the param_area for either during early boot or during late kernel
> boot phase of the capture kernel?

Seems like there is some confusion. Here is the full picture with the 
current patch:

First kernel boot: Reserve param_area during early boot and let it 
remain reserved.

First kernel crashed

Fadump/second kernel boot

fadump_reserve_mem() does memblock_reserve() from boot_mem_top to 
end_of_dram().
This covers param_area if it is above boot_mem_top.

fadump_setup_param_area() does memblock_reserve() for param_area only if 
it falls below
boot_mem_top. This ensures it is covered if param_area falls below 
boot_mem_top.

This way, we make sure that param_area is preserved during the fadump 
kernel's early boot in both cases.

Note: fadump_reserve_mem() is executed before fadump_setup_param_area().

IIUC, you are suggesting doing memblock_reserve() for param_area in 
fadump_setup_param_area() regardless
of its location. If we do this, memblock_reserve() will be called twice 
for the case where it falls above
boot_mem_top. I agree there is no harm in doing so, but do we have to?

Again, I don't have a strong opinion on this but just wanted to put 
things forward to make sure we are on the
same page. Let me know your opinion.

Thanks,
Sourabh Jain


>>> According to the memblock documentation, when reserving memory regions,
>>> the new
>>> regions can overlap with existing ones, but I don't see any advantage in
>>> calling memblock_reserve
>>> for param_area if it falls above boot_mem_top.
>>>
>>> Regardless, I don’t have a strong opinion. If you think we should call
>>> memblock_reserve regardless
>>> of where param_area is placed, I can do that. Please let me know your
>>> opinion.
>>>
>>> Sourabh Jain
>>>
>>>
>>>
>>>>> Fixes: 3416c9daa6b1 ("powerpc/fadump: pass additional parameters when fadump is active")
> Not really IIUC, this is not really a fix but a future proofing of if
> fadump ever tries to use param_area later during early boot or during
> late kernel boot.

The reason I put the Fixes tags because we mistakenly put the wrong 
condition there.
The intention was to reserve memory if it below boot_mem_top.
But yes if see this patch as future proofing the Fixes tag can be avoided.

- Sourabh Jain

>
>>>>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>>>> Acked-by: Hari Bathini <hbathini@linux.ibm.com>
>>>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>>>> ---
>>>>>
>>>>> Changelog:
>>>>>
>>>>> Since v1: https://lore.kernel.org/all/20241104083528.99520-1-sourabhjain@linux.ibm.com/
>>>>>     - Include Fixes and Acked-by tag in the commit message
>>>>>     - No functional changes
>>>>>
>>>>> ---
>>>>>    arch/powerpc/kernel/fadump.c | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>>>>> index 3a2863307863..3f3674060164 100644
>>>>> --- a/arch/powerpc/kernel/fadump.c
>>>>> +++ b/arch/powerpc/kernel/fadump.c
>>>>> @@ -143,7 +143,7 @@ void __init fadump_append_bootargs(void)
>>>>>    	if (!fw_dump.dump_active || !fw_dump.param_area_supported || !fw_dump.param_area)
>>>>>    		return;
>>>>>    
>>>>> -	if (fw_dump.param_area >= fw_dump.boot_mem_top) {
>>>>> +	if (fw_dump.param_area < fw_dump.boot_mem_top) {
>>>>>    		if (memblock_reserve(fw_dump.param_area, COMMAND_LINE_SIZE)) {
>>>>>    			pr_warn("WARNING: Can't use additional parameters area!\n");
>>>>>    			fw_dump.param_area = 0;
>>>>> -- 
>>>>> 2.46.2


