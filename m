Return-Path: <linuxppc-dev+bounces-3120-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4639C5995
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2024 14:53:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xnnv02RZ7z2xJT;
	Wed, 13 Nov 2024 00:53:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731419612;
	cv=none; b=dEr8AwZsU4kr6nxtQ2meACsIvBpNvBsppq60OyFLzVDhuhkhDa2Jk1nnyGZtZT3PKzyKekNmKt69AKZRweDZskV9Sjh5Jjeu0vCmrYmW5QqqGCaJ0lLfJYGCTO6CtqIut3AlrL1YQgFIP2rH+C4wf3MYGMG30IvwGWHxj8xpJNOSbBxhJSXRZ1IHltsuJWUDU3SJgoB9YV0J2LW0y8lKbNCOT7G33+cBvRRlIXK6RlmXUjc/y3dHA0uDtnEAtrkZUSNCWBlh6CAqeTmJey1xFAmlCO4/a6+kKoVDRmYjDizq2p0BHbzp+Yfb2BVj/q4lJonEYTJZRZbpJwLzGLOR4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731419612; c=relaxed/relaxed;
	bh=2/goUWIFYSRj0QcAH3DIGrOQvYYN450NiykTJhVZVa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zv6cCeSW7fnuarK1NIp+JE2+kHto/2LlrzONKpVo9bwjy8ARltdwRKnvtoRlmd9FpN5Dsz9yt3MiutzcenfmryXyld7reUo2rjDbuJqRK45fiaB7M1DUQYhq5EVR5eb6IQBBopu50Rk1bkOCvJbmTHRzpFBjM4/TF6G4P8qUDF5nkX7BonZwNv96UCZUlbHPNaFYOZfM57TBh5d25gHUcCZ8ZREbIL7p2Zn/yYyfN5LmpqC0P2DjSTUueRWpItGFyK3u75HORPD5stgE1ChDtYLGdjaJhUQ+BukOtEmn1pyHAfFqGCPrTEDU2KB7E91QtbtwR2Rboi5glqRPrQX6yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QSOrR5aA; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QSOrR5aA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xnnty4H0Wz2xJK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2024 00:53:30 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACBeHZI026451;
	Tue, 12 Nov 2024 13:53:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2/goUW
	IFYSRj0QcAH3DIGrOQvYYN450NiykTJhVZVa8=; b=QSOrR5aACegEIGvrh9S4jp
	uHWvkFTn1rAu7mMBBTkmw+lJ3IaKF2gGcMcn3lty4Qe0f5MPK+B5Sts2f3Sc6weg
	UN3P1qQu0UTm0n2kA5oGyoOHBJiQSb4PmdpFo3a5o5Im8qP5LMfGC1dGZPCSPOwA
	LoU7I5woDbgl5+fmH/PwWu1hq65pDmUmiJr726E6vKVlKlSQAivdMNP9VKK7dyqF
	E0+Pqz57cuFOizCILbIB0RzNjqKfxiZakeSPi8oLVX5E4jYTyzG+59eswpEP3NWP
	OXc/fM56m0Ia999s6j3FSR17Fdle/dReU8Y6EjAgoJTqTDKFRptz/7svd2nP2sSA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42v6begh9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 13:53:20 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4ACDrJv7022801;
	Tue, 12 Nov 2024 13:53:19 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42v6begh9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 13:53:19 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACCqaaO008243;
	Tue, 12 Nov 2024 13:53:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42tjeyhyc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 13:53:19 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4ACDrFPO51249494
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Nov 2024 13:53:15 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7347720043;
	Tue, 12 Nov 2024 13:53:15 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA0FD20040;
	Tue, 12 Nov 2024 13:53:13 +0000 (GMT)
Received: from [9.43.111.219] (unknown [9.43.111.219])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Nov 2024 13:53:13 +0000 (GMT)
Message-ID: <a714bc9e-838c-43d8-bb22-bb8d9a13d38f@linux.ibm.com>
Date: Tue, 12 Nov 2024 19:23:12 +0530
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
 <34d3e468-b867-4567-9d39-47b27409a2a8@linux.ibm.com>
 <87r07gmwbl.fsf@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87r07gmwbl.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pbH4-pq_Q7AIZ3_qG1wxNidzxxVmrpKK
X-Proofpoint-GUID: zsf8gCYSOnxJ_goDFLQrSBwxLLdIy7Ba
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411120110
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Ritesh,

On 12/11/24 18:40, Ritesh Harjani (IBM) wrote:
> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>
>> Hello Ritesh,
>>
>>
>> On 12/11/24 17:23, Ritesh Harjani (IBM) wrote:
>>> Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:
>>>
>>>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>>>
>>>>> Hello Ritesh,
>>>>>
>>>>>
>>>>> On 12/11/24 11:51, Ritesh Harjani (IBM) wrote:
>>>>>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>>>>>
>>>>>>> The param area is a memory region where the kernel places additional
>>>>>>> command-line arguments for fadump kernel. Currently, the param memory
>>>>>>> area is reserved in fadump kernel if it is above boot_mem_top. However,
>>>>>>> it should be reserved if it is below boot_mem_top because the fadump
>>>>>>> kernel already reserves memory from boot_mem_top to the end of DRAM.
>>>>>> did you mean s/reserves/preserves ?
>>>>> Yeah, preserves is better.
>>>>>
>>>>>>> Currently, there is no impact from not reserving param memory if it is
>>>>>>> below boot_mem_top, as it is not used after the early boot phase of the
>>>>>>> fadump kernel. However, if this changes in the future, it could lead to
>>>>>>> issues in the fadump kernel.
>>>>>> This will only affect Hash and not radix correct? Because for radix your
>>>>>> param_area is somewhere within [memblock_end_of_DRAM() / 2, memblock_end_of_DRAM()]
>>>>>> which is anyway above boot_mem_top so it is anyway preserved as is...
>>>>> Yes.
>>>>>
>>>>>> ... On second thoughts since param_area during normal kernel boot anyway
>>>>>> comes from memblock now. And irrespective of where it falls (above or below
>>>>>> boot_mem_top), we anyway append the bootargs to that. So we don't really
>>>>>> preserve the original contents :) right?
>>>>> Sorry I didn't get it. We append strings from param_area to
>>>>> boot_command_line
>>>>> not the other way.
>>>>>
>>>>>
>>>> Right. My bad.
>>>>
>>>>>> So why not just always call for
>>>>>> memblock_reserve() on param_area during capture kernel run?
>>>>>>
>>>>>> Thoughts?
>>>>> Yes, there is no harm in calling memblock_reserve regardless of whether
>>>>> param_area
>>>>> is below or above boot_mem_top. However, calling it when param_area is
>>>>> higher than
>>>>> boot_mem_top is redundant, as we know fadump preserves memory from
>>>>> boot_mem_top
>>>>> to the end of DRAM during early boot.
>>>> So if we don't reserve the param_area then the kernel may use it for
>>>> some other purposes once memory is released to buddy, right. But I guess,
>>>> given we anyway copied the param_area in fadump_append_bootargs() during
>>>> early boot to cmdline (before parse_early_param()), we anyway don't need
>>>> it for later, right?
>>>>
>>>> In that case we don't need for Hash too (i.e when param_area falls under
>>>> boot_mem_top), right? Since we anyway copied the param_area before
>>>> parse_early_param() in fadump_append_bootargs. So what is the point in
>>>> calling memblock_reserve() on that? Maybe I am missing something, can
>>>> you please help explain.
>>>>
>>> Ok. I think I got it now. You did mention in the changelog -
>>>
>>> "Currently, there is no impact from not reserving param memory if it is
>>> below boot_mem_top, as it is not used after the early boot phase of the
>>> fadump kernel. However, if this changes in the future, it could lead to
>>> issues in the fadump kernel."
>>>
>>>
>>> So it is not an issue now, since the param area is not used after the
>>> contents is copied over. So I think today we anyway don't need to call
>>> memblock_reserve() on the param area - but if we are making it future
>>> proof then we might as well just call memblock_reserve() on param_area
>>> irrespective because otherwise once the kernel starts up it might re-use
>>> that area for other purposes. So isn't it better to reserve for fadump
>>> use of the param_area for either during early boot or during late kernel
>>> boot phase of the capture kernel?
>> Seems like there is some confusion. Here is the full picture with the
>> current patch:
>>
>> First kernel boot: Reserve param_area during early boot and let it
>> remain reserved.
>>
>> First kernel crashed
>>
>> Fadump/second kernel boot
>>
>> fadump_reserve_mem() does memblock_reserve() from boot_mem_top to
>> end_of_dram().
>> This covers param_area if it is above boot_mem_top.
>>
>> fadump_setup_param_area() does memblock_reserve() for param_area only if
>> it falls below
>> boot_mem_top. This ensures it is covered if param_area falls below
>> boot_mem_top.
>>
>> This way, we make sure that param_area is preserved during the fadump
>> kernel's early boot in both cases.
>>
>> Note: fadump_reserve_mem() is executed before fadump_setup_param_area().
>>
> Ohk. I think I missd to look into the dump_active portion of the code
> which is where the fadump calls fadump_reserve_mem() -> fadump_reserve_crash_area().
> I will be pay more attention to these details the next time :)
>
>> IIUC, you are suggesting doing memblock_reserve() for param_area in
>> fadump_setup_param_area() regardless
>> of its location. If we do this, memblock_reserve() will be called twice
>> for the case where it falls above
>> boot_mem_top. I agree there is no harm in doing so, but do we have to?
>>
>> Again, I don't have a strong opinion on this but just wanted to put
>> things forward to make sure we are on the
>> same page. Let me know your opinion.
> No. The current patch is doing the right thing. Thanks for taking time
> and answering my queries. I agree with the approach and logic taken in
> this patch including that of the "Fixes" tag.
>
> The patch looks good to me. Please feel free to add -
>
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

Thank you for putting in the effort to review that patch.

- Sourabh Jain


