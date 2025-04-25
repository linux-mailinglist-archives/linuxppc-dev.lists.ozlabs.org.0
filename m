Return-Path: <linuxppc-dev+bounces-7984-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C66D6A9CB9C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Apr 2025 16:25:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkZqt2znkz2yb9;
	Sat, 26 Apr 2025 00:25:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745591114;
	cv=none; b=iEyUbFUNjWLndCORNhnHVDeSQe5hnk1umYWRT25407/uPst3nAj1Q6hzGk1uMzrlXV4L/exKJhrBMB/HjvGuse05ZmsO01hk9XeHftCnxNURLnq71W/Adsy5dEP4C5ml/hwgPNPhKE6lDdMd+PMx3m87bAy0iiyJTiQGTEJM6/8KElc5D9osxSiOtFz7M5hX3mid8Yuv8oubhRCG50z+dKz7Da5/WFTQJbn72x5BUWW9W2zJqoPTn8+CwnW6coU31+pLae7c5unoIpr2+FbFSeD4leUwdeiW0yVWYoxuMTUdVjg6PfeNw4j5Wag1OH8l0+ESjHAvh8dmxwOc3qkwow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745591114; c=relaxed/relaxed;
	bh=zuxQaRvQdM2HJYeSLwgpF2CuLVYZKJbfytej8xx9CoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MuTnX2hiCM6rOjHnTngpgCDIzp8PnzcfLj/2RhfLigIvH5Avsgqd0jVXdY9yuZIT8zpM7sP5+BZqUezNkeUunJohECE7qoU0DRj61+/+qhs8MHvvS0aICYmLeSjjjfBh9sMzObSe02Jm8jlEZK6wBw9E7WTe/NMP4WaScwmFr+GBcw0oL5vUQMkbE7l5xVms2HiRKJBNSAg3rBffoWU7NQhVLPLhuNxCY3gbkl/yaMg7v4SDMR2HQWLYuwFBoB/hbpwTRBYUd1TFobjtG6lqJWE2UAB76VPLJcs9TYP5Qc4iQg305GApOmHm79SwSlgAt4+aZMOzER8gAzknFmGkEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ad4C0oXI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ad4C0oXI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkZqr2rM4z2yVj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 00:25:11 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PAesRC023207;
	Fri, 25 Apr 2025 14:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zuxQaR
	vQdM2HJYeSLwgpF2CuLVYZKJbfytej8xx9CoE=; b=ad4C0oXIrT+fFdMTXc+StL
	VDb74ArttNPPQAOsLRwPxRJaBpxNJZ4DE1vU8nJhyJAhQFZniL3tltHYhDFZELQY
	VLsWjLk0hyEhYS3cj5kTMBOvLwL6HWD6y8oueemhaOUzvZiGnu/+lnHQo22s2XLH
	g3NTZ5cM+eQwoYAdNvapwAXd7IpZ1BNIB9FDBXrNd4PbuLdyF5XnhcKG9tBOhjFU
	bAPevAfgZuisYU0PXxphV+AAUM67AwU6TBco3w7UlLngHhr8X8NCb0roX3ZXTfke
	XZF5GcGSQYa/+vNTi9lsvUzk9VJOGYiqLy5QQficlzw+hFrtyhT6pIwCzktQmDrw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4688usgyq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 14:25:04 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53PE76HO015663;
	Fri, 25 Apr 2025 14:25:03 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4688usgypy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 14:25:03 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53PCe7SJ004097;
	Fri, 25 Apr 2025 14:25:02 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jg05kjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 14:25:02 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53PEOxWt37028330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 14:24:59 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C3D220043;
	Fri, 25 Apr 2025 14:24:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7338220040;
	Fri, 25 Apr 2025 14:24:57 +0000 (GMT)
Received: from [9.124.216.146] (unknown [9.124.216.146])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Apr 2025 14:24:57 +0000 (GMT)
Message-ID: <5cc88718-13ff-4220-a8f6-c988a919aa65@linux.ibm.com>
Date: Fri, 25 Apr 2025 19:54:56 +0530
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
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=680b9b40 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=eUDsRD9QmrZOUdxpPkMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEwMCBTYWx0ZWRfX0Kcud2JAHLHA RME5rjHSZYWSDNjUeIOUHdAqm3QFscvfQeqOfr/9xrN13Tm/x9aW0b0igR15+gN9qmhZI7CLrTK zUddcHSuPSZOqyoFgrqckrEh8dYJXbwLq6vDDJxryVu591hdlLkzOrgWKizbrNHB6kvO39lBrUt
 1p4GHDZMr0j6tqt5eYzUG9tk/50V1B6rOhb7v1dnu5xExi7/cesmfPax+UimpytBmkBn3pY4Luo LUnxf7N26CNM0JYg0rRZ7WLWMz9BYk0SoNBH+uz5MUOlztLCynvH7Hq+eGMd965izoiVV8TMt9J vBDUFE7sYFajOz3fX56+2pUZ5WkXxxETcOhUqjgf71Ygw+xB4h5IZpFlx8iUpC3/v9cewnLrBsi
 KYla6ZmE8MdC6BqcUfEeAMiITqm8G963QnAO5p2e7o75T/+h87KHteIYHQStDhTeYyBh0AKx
X-Proofpoint-ORIG-GUID: 1GpJgedZ5Fw8Lf480XK3pPbd5qFhHuJM
X-Proofpoint-GUID: 5ODJ5PeDCuNiajrjpCIHuiss4C0Qkxwt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250100
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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

I was wondering xfer_to_guest_mode_work could also call cond_resched
instead of schedule since for preempt=full/lazy is preemptible
as early as possible right?

  
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

right, i think *2 is critical since it is in a loop.
*1 is probably an optimization to skip a few cycles.

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


