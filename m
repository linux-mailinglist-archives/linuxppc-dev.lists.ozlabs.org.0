Return-Path: <linuxppc-dev+bounces-5990-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4A6A2D68A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2025 15:11:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yqt7P1D3Bz2yGC;
	Sun,  9 Feb 2025 01:11:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739023905;
	cv=none; b=LRM80db6KX+RsI7YG+N+X85bzil5ANLkyiNirSqEpKoqzK17IViFPOOJz6VzdCw+mYeYGUfaMupt5VQac2X7G+NDhJC6lcM+wxcCA0PW7LI6HBBinNZLOdyT+mea7rzyzuALqpMasMQJLRtwLRFPzPzSoc9H3yg+9JeQbe6Wslm9S9cUJBnsQfeqC92XzPX/+UEULqybmPi36Y4AXULxpoRNSwOmcjL4VlccR5AxeYuN+wNreGuuty9XJ4RVIc9053Nkar9ZcEhA+n24UFDIyfZwOC4R209eIYpL5TPvCpeBvgTpwqZ8PAKyclwLhI6gsK1ScyOtCqbJumnJBpJmgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739023905; c=relaxed/relaxed;
	bh=uMTVfUn/5m1Rzb1bO8xvYzC6kl7kpndEbLeAxr3QBGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kQ2la2NjO2azmT3K5z6Mxx6quk7ERe+6pfn4FWlLMZmJ8X9WImJorMj1A4WvMQOouVfqhF8iLNCg0txC4c4vEwAEdkUNp2XfX1syO/Y/vTqBAp3wP4TCND5gOGiHlItYqnAuds9labOe3LvItADulnELQ+O8c7oTMO80QpnPCjZIDqB6ADmLvGmqsXFYpY4IUeryF51In7GmxiIf88TNKgzxosNGJLej0xzXQxcXFTyY9KarD+kjcm6Sg7QdUlRqxFyhzPwG57M8GkaDQO+evr6lJHsZ7Fmh+eQooSodRgIeHejZXzhSKG0VkTsti/MqTI8jZJG5jCD6c0JOG1QOcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vdq52X8K; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vdq52X8K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yqt7N2lY6z2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2025 01:11:44 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 518DGVd1016257;
	Sat, 8 Feb 2025 14:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=uMTVfU
	n/5m1Rzb1bO8xvYzC6kl7kpndEbLeAxr3QBGs=; b=Vdq52X8KBa2bb9adwBI2Ry
	zNW3MGPXoyOVV9HoxNYddYWdlXcp5jY6otrq8HnYnLoRAyI2d9bFkTzY/O6IHb2T
	6gDAaOcj722Ik+hYrMXgDffDaT0yYlq+CCj+JkEnT2lxrXMhEjyBS+ohc9Aufujf
	0AidSzWftrZxJi9XeU8cztmY0Yn6sKVBgXfnsvtIAkGCBlXR6wEJ8OmBFfXU9AZW
	3AJTiJN+YCWO9oDiyHsUMadbrmG0gOm8CycwiYyll9qp83rsltHfdksEkx95wemF
	b1wsTPHrxfyCYfw7Dyy+SPxL/H+XyOeZLntOWK+kFFO9KmvMLCVlpc2/B+o08PKQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44p1379ay6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 14:10:43 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 518EAgrC016684;
	Sat, 8 Feb 2025 14:10:42 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44p1379ay3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 14:10:42 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 518A3lxS007133;
	Sat, 8 Feb 2025 14:10:41 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hxb08du9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Feb 2025 14:10:41 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 518EAdJn20513200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 8 Feb 2025 14:10:39 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16FD020096;
	Sat,  8 Feb 2025 13:42:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F9AF20095;
	Sat,  8 Feb 2025 13:42:33 +0000 (GMT)
Received: from [9.39.23.47] (unknown [9.39.23.47])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  8 Feb 2025 13:42:22 +0000 (GMT)
Message-ID: <936f0451-a4ee-4e14-9ce9-9cd9613fc55c@linux.ibm.com>
Date: Sat, 8 Feb 2025 19:12:21 +0530
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
Subject: Re: [PATCH v3 5/9] powerpc: Use preempt_model_str().
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
        Ben Segall <bsegall@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
        Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Valentin Schneider <vschneid@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Will Deacon <will@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
        linuxppc-dev@lists.ozlabs.org
References: <20250203141632.440554-1-bigeasy@linutronix.de>
 <20250203141632.440554-6-bigeasy@linutronix.de>
 <65c6f60d-bb52-48bd-a02c-87ffd2a915d4@csgroup.eu>
 <20250203160103.9DikC9FJ@linutronix.de>
 <51999b8e-61c0-48b7-b744-c83d39e7f311@csgroup.eu>
 <20250204082223.6iNyq_KR@linutronix.de>
 <7b51f7de-8e4b-4766-85ca-dee24832c693@linux.ibm.com>
 <93833119-9406-4d30-aa7b-4521adb3a573@csgroup.eu>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <93833119-9406-4d30-aa7b-4521adb3a573@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GPkCd9c96HNUEu_yFJHxBRUCThtVLmOl
X-Proofpoint-GUID: 5PiEU9b4tb5D8gIq7yPYICElXc8kNgjK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-08_06,2025-02-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502080117
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2/8/25 18:25, Christophe Leroy wrote:
> 
> 
> Le 08/02/2025 à 08:35, Shrikanth Hegde a écrit :
>>
>>
>> On 2/4/25 13:52, Sebastian Andrzej Siewior wrote:
>>> Use preempt_model_str() instead of manually conducting the preemption
>>> model. Use pr_emerg() instead of printk() to pass a loglevel.
>>
>> even on powerpc, i see __die ends up calling show_regs_print_info().
>> Why print it twice?
> 
> I don't understand what you mean, what is printed twice ?
> 
> I can't see show_regs_print_info() printing the preemption model, am I 
> missing something ?
> 

Patch 2/9 add preemption string in dump_stack_print_info.

__die -> show_regs() _> show_regs_print_info() -> 
dump_stack_print_info() -> init_utsname()->version, preempt_model_str(), 
BUILD_ID_VAL);

Wont we end up in this path?

> Christophe
> 
>>
>>>
>>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Nicholas Piggin <npiggin@gmail.com>
>>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> Cc: Naveen N Rao <naveen@kernel.org>
>>> Cc: linuxppc-dev@lists.ozlabs.org
>>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>>> ---
>>> v2…v3:
>>>    - Use printk() instead of pr_emerg() to remain consistent with the
>>>      other invocations in terms of printing context.
>>>
>>>   arch/powerpc/kernel/traps.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
>>> index edf5cabe5dfdb..d6d77d92b3358 100644
>>> --- a/arch/powerpc/kernel/traps.c
>>> +++ b/arch/powerpc/kernel/traps.c
>>> @@ -263,10 +263,10 @@ static int __die(const char *str, struct 
>>> pt_regs *regs, long err)
>>>   {
>>>       printk("Oops: %s, sig: %ld [#%d]\n", str, err, ++die_counter);
>>> -    printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
>>> +    printk("%s PAGE_SIZE=%luK%s %s %s%s%s%s %s\n",
>>>              IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
>>>              PAGE_SIZE / 1024, get_mmu_str(),
>>> -           IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
>>> +           preempt_model_str(),
>>>              IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
>>>              IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" 
>>> __stringify(NR_CPUS)) : "",
>>>              debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
>>
> 


