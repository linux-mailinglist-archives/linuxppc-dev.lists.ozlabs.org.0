Return-Path: <linuxppc-dev+bounces-8135-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 583BBAA02FC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 08:19:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zmqss5pGgz3064;
	Tue, 29 Apr 2025 16:19:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745907585;
	cv=none; b=W+1yDNIAF/DhnCEVZeF/qbYhUUcSDPa8L9BTxeiKI3mi/a9NDO+mhXZvzGBiSQd5/jiI8Zdc+iSDH4UVAyKzpdyijZ+EG99qkmCkteozJeNIFgqOovv8+eq74rYTXSSPfYPlETh5N1N0Had06HC29V6Y7kayxR9bpruzhjYSbtamdwTjc1BmSl4yVO8uizS//kGlnAhL4Sq89QxVW+8WEhr0xoApb4k143/62s8l5fQyqbvcqWvZZ8fnoWLbgVulDtPBIyDFSzmQeNry2NgkggDxGmY7WkZlJcPC91I5nZQlwMnUTcVQHsHH9afZNslM28B2dSrzfmmjDIWeskwTGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745907585; c=relaxed/relaxed;
	bh=7EkTj8zjQNiIWy2SSyHfpedL42RKtKz8QhkEGfsAEbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mlwTHmoz5fZ91XSuBidRZX3oh7UIKI2Oof+9lk56wjiUUKNEnhPFjIsRYJGX3x2vNwqj8rke/qcQVk6d/RzgrD5bF0nqBYgdXb7ytCnxWJD3Q9BRsmtZNuv7q1B/jcmi2uq9bweHO2BkgXfdiMHKhvLhE4h8O5qtZOIIOEfyxHjhRvascGM908CCLscoa4DDg4gk9VnXnjiezSZSqVIYwxVDb9uHWaKDH7J2x2cRof751SB3n7e3PAgfgfKZTv/XsBMN14dZvNWStGyTQx7fHjJdBuqSymq0IaPVjkmgSO8krPzS+hQ3gc6VUGlK42HsSeuv8R6ypAbZNsnNInR1Zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P8P2FUSp; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P8P2FUSp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zmqsr5zg3z305P
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 16:19:44 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53T4EZkH007143;
	Tue, 29 Apr 2025 06:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=7EkTj8
	zjQNiIWy2SSyHfpedL42RKtKz8QhkEGfsAEbE=; b=P8P2FUSplh1vHaGEmAbdUU
	eGuG0h2UKkRxj/WjlDDdFZRN4FyIcw6CaQkAh81rOOt9LGwIMHIovuPqEIEmPxsI
	9nxykKwUskeu2aq8kLhRRJjeAIxSKy0076WvkqB5Q4mctMJ7xMBkUOpQbRHOl0uB
	XIYkiQ7l4EwQ39ZCuZ27kJrTBXhqYWwKXkzXKTwjAa3SWO0i0e0RiuzxXLqpcFSa
	N9v6EPHVnwhTORHkQocr2lL/iTbvzOPv64BWr5OzpldlyPbdAQaJ6K/SYbFT7F1J
	FUszx3AL/EfQiU62DM8I7twMrlqRjncHnE/KR7eAJlAgYyxK/7G3lJmccSfTaU9g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ahs99h1k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 06:19:29 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53T6JSQq002020;
	Tue, 29 Apr 2025 06:19:28 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ahs99h1g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 06:19:28 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53T1i8th008542;
	Tue, 29 Apr 2025 06:19:27 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 469ch31mqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 06:19:27 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53T6JOIB58458594
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Apr 2025 06:19:24 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B5AA2004B;
	Tue, 29 Apr 2025 06:19:24 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 601C520040;
	Tue, 29 Apr 2025 06:19:21 +0000 (GMT)
Received: from [9.124.218.151] (unknown [9.124.218.151])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 29 Apr 2025 06:19:21 +0000 (GMT)
Message-ID: <7596af4a-e3aa-4aad-bc29-1cbfb4dfbc3d@linux.ibm.com>
Date: Tue, 29 Apr 2025 11:49:20 +0530
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
Subject: Re: [PATCH 1/2] powerpc: kvm: use generic transfer to guest mode work
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: npiggin@gmail.com, vaibhav@linux.ibm.com, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu,
        gautam@linux.ibm.com, linux-kernel@vger.kernel.org
References: <20250421102837.78515-1-sshegde@linux.ibm.com>
 <20250421102837.78515-2-sshegde@linux.ibm.com>
 <20250424144215._ooDjDz9@linutronix.de>
 <365ba747-9311-45ab-b798-80ba4e578796@linux.ibm.com>
 <20250424183811.7_MLThpt@linutronix.de>
 <2891b989-6249-4e84-969e-f11af3f92b0b@linux.ibm.com>
 <20250425133131.DTvWJE29@linutronix.de>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250425133131.DTvWJE29@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=LuKSymdc c=1 sm=1 tr=0 ts=68106f71 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=eUDsRD9QmrZOUdxpPkMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: _fMU_bGpcceVIh_J-soShGWwknXpVTbL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NSBTYWx0ZWRfXylq8sOFmwNoa OpiCmkmj1IVxVxTduM7c//hqVDmXg3DapEB3tMc64lAE7BMubDCLpmA9mKOhGLNQb7Mht/dc9Cw pWC8FhslsIJjKdZiEVnOaEH5gQq6fIlUtd0U4/ujpgTzIcPPyjQ1dBFiFws6IdtIk8rFVlouLxy
 ZxyYkIJBS877E8V/Od+/YK4L4bF1EcrR7WhphtYOehkU8EcK1yiALPadfoRYsQT7PgkGSauwNXA f7ndS60DZ7KKwnquU2BwOZXUTLfXckxmMOUOHulLpMjBvOojwWheGqbEaG7Ln0QRo1r75nHFGdK xC18zqFpH0hihut4Rrz8abCEQCicXHDY3wMQOOv4IqUpkJZE7xN0ytvXDmOQcG1b8hDkVOjGONn
 LHsDurNThXiVCBShEC166KWPISvyLUic7U1CwV95zQMyqLX/ryVAVm0G52p4D3PW7OsyllTy
X-Proofpoint-GUID: 05VXkeVRbrhdKPel1PaYX5LPwtcodsDr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 mlxscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290045
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 4/25/25 19:01, Sebastian Andrzej Siewior wrote:
> On 2025-04-25 16:49:19 [+0530], Shrikanth Hegde wrote:
>> On 4/25/25 00:08, Sebastian Andrzej Siewior wrote:
>>> On 2025-04-24 21:27:59 [+0530], Shrikanth Hegde wrote:
>>>>>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>>>>>> index 19f4d298d..123539642 100644
>>>>>> --- a/arch/powerpc/kvm/book3s_hv.c
>>>>>> +++ b/arch/powerpc/kvm/book3s_hv.c
>>>>>> @@ -4901,7 +4901,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
>>>>>>     	}
>>>>>>     	if (need_resched())
>>>>>> -		cond_resched();
>>>>>> +		schedule();
>>>>>
>>>>
>>>>
>>>>> This looks unrelated and odd. I don't why but this should be a
>>>>> cond_resched() so it can be optimized away on PREEMPT kernels.
>>>>
>>>> This is needed, otherwise KVM on powerVM setup gets stuck on preempt=full/lazy.
>>>

When i look back, i think below makes sense, since this is what even the 
generic framework will do and it would work for all preemption models.

Since this happens in a loop, it is necessary to check for reschedule.

if need_resched()
	schedule()

Ideal would be call xfer_to_guest_mode_handle_work in the loop, which 
would handle the above too.

>>> But this makes no sense. On preempt=full the cond_resched() gets patched
>>> out while schedule() doesn't. Okay, this explains the stuck.
>>
>> cond_resched works. What you said is right about schedule and preemption models.
>> Initially I had some other code changes and they were causing it get stuck. i retested it.
> 
> so it is unrelated then ;)
> 
>> But looking at the semantics of usage of xfer_to_guest_mode_work
>> I think using schedule is probably right over here.
>> Correct me if i got it all wrong.
> 
> No, if you do xfer_to_guest_mode_work() then it will invoke schedule()
> when appropriate. It just the thing in kvmhv_run_single_vcpu() looks odd
> and might have been duct tape or an accident and could probably be
> removed.
> 
>> on x86:
>> kvm_arch_vcpu_ioctl_run
>> 	vcpu_run
>> 		for () {
>> 			.. run guest..
>> 			xfer_to_guest_mode_handle_work
>> 				schedule
>> 		}
>>
>>
>> on Powerpc:  ( taking book3s_hv flavour):
>> kvm_arch_vcpu_ioctl_run
>> kvmppc_vcpu_run_hv  *1
>> 	do while() {
>> 		kvmhv_run_single_vcpu or kvmppc_run_vcpu
>> 			-- checking for need_resched and signals and bails out *2
>> 	}
>>
>>
>> *1 - checks for need resched and signals before entering guest
> I don't see the need_resched() check here.
> 
>> *2 - checks for need resched and signals while running the guest
>>
>>
>> This patch is addressing only *1 but it needs to address *2 as well using generic framework.
>> I think it is doable for books3s_hv atleast. (though might need rewrite)
>>
>> __kvmppc_vcpu_run is a block box to me yet. I think it first makes sense
>> to move it C and then try use the xfer_to_guest_mode_handle_work.
>> nick, vaibhav, any idea on __kvmppc_vcpu_run on how is it handling signal pending, and need_resched.
>>
>>
>> So this is going to need more work specially on *2 and doing that is also key for preempt=lazy/full to work
>> for kvm on powepc. will try to figure out.
> 
> Okay.
> 
> Sebastian


