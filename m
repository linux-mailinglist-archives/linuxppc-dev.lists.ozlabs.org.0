Return-Path: <linuxppc-dev+bounces-12080-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D375B54E64
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 14:49:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNZ51076Xz3dC1;
	Fri, 12 Sep 2025 22:49:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757681380;
	cv=none; b=YOA95plxrFBEHW9dVunDZnoDgsW4qKapgbpG++epmEv0/fdgFNVDhEbw86pZbApQ3DnPdMGelL85BkeVe80yg49DXbLkhBiza/himPoXfn+CiUxRfpNSharm8K6ojspHtzlPBIgy8g1WbvfzuHqXUHR4GyntjnXMooaVqyylLN/QbClEKD4d9IFiogKnk5x31FjFQiTsQlxKctnubec+vAFll4y06yd8G20tDN20qDpHyTWDccxXweBjREVw8PzpRSzK3zU+md78uYEVeJ85LecRNkgy1Fpcj7T09TcMh7RyH3pgCPr1rWtiiNapBADZ69+pVNaqi7af906VCdiwHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757681380; c=relaxed/relaxed;
	bh=mXtTa86GhlKRdPoROiYtUj1KQibUwRJjlk6Jfn53Nrc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gyuqfbjZSAKf6hR1/zHXkxxFFgUCONuGAy+u/lbLA8bZOxak+vni3YeBrd2CRkmZ7tYTOzmEFHDqTHWbl1d7nfgsvfL41CjHUZ9yhAYEAUOKHIckfFEG4FeRsQ9U/23J3s7QXLXg3x1lHTCEQVUvoeYQu7/vdrwurEYb9XI01pYoCCB0N4ZLYBFZNzHNuWHWie4WAcxsMiIw/FkjyXacTrlFPWf4a/6K5qBJzNgV3f7LdoAjUlII4rqZz4Zb4d60tdNcFAk1F+0qYOBINBK7ei67yVSgZt+1MVL8KmkKDWUKVTWX5cpWcVcBRqjuS4kFct0xe5hi0fSfuDHuF1ahkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pHbXIaEb; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pHbXIaEb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNZ4z73jXz3dBs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 22:49:39 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C4sldS032411;
	Fri, 12 Sep 2025 12:49:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=mXtTa8
	6GhlKRdPoROiYtUj1KQibUwRJjlk6Jfn53Nrc=; b=pHbXIaEbobmxE3bXiTMoFL
	suDDN1HEz4jW5GOaXhVF2dGPikI3+rMoc32TRUx9uwiNqRxXM09vY48x3mnAyyy8
	Rf8O9Qk2A5bNAtW/N0DM8QmaP7GB/lcykT9uZoT3k+8VLWM1Scezf3KKuFZqtZ97
	U17EUUPzPtOPNpS2b+dhn934zuRxHWQjcmYajS7Nb/j7x1koO/YuGTAuF5yc7xn3
	OZiX6BhNKwscXTxFcyEC7qRTP4NNVPw8t/au3UHRBEaRk3ZdZBJXSphca54+gacw
	QVXj9g5bhjzveBXTqnXNoHpItyqJspTQ6KvRMBYDx0SnETJgTw34jo9YNoD/yXmw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490ukeykfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:49:28 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58CCcePs001236;
	Fri, 12 Sep 2025 12:49:27 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490ukeykfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:49:27 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58CA3ASd007944;
	Fri, 12 Sep 2025 12:49:26 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49109q30fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 12:49:26 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58CCnM1145351234
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 12 Sep 2025 12:49:22 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A47D520043;
	Fri, 12 Sep 2025 12:49:22 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21F5620040;
	Fri, 12 Sep 2025 12:49:14 +0000 (GMT)
Received: from [9.61.95.215] (unknown [9.61.95.215])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 12 Sep 2025 12:49:13 +0000 (GMT)
Message-ID: <52f5b23b-a1a6-4a24-93d0-c712a27ba00f@linux.ibm.com>
Date: Fri, 12 Sep 2025 18:19:12 +0530
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
Subject: Re: [RFC PATCH v3 07/10] sched/core: Push current task from paravirt
 CPU
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: vschneid@redhat.com, iii@linux.ibm.com, huschle@linux.ibm.com,
        rostedt@goodmis.org, dietmar.eggemann@arm.com, vineeth@bitbyteword.org,
        jgross@suse.com, pbonzini@redhat.com, seanjc@google.com,
        mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
 <20250910174210.1969750-8-sshegde@linux.ibm.com>
 <7227822a-0b4a-47cc-af7f-190f6d3b3e07@amd.com>
 <1617b0fb-273a-4d86-8247-c67968c07b3b@linux.ibm.com>
 <5493a681-4438-4854-9cf4-c1e71ad2dbed@amd.com>
 <36042e33-772d-4c4e-ba6d-8461c8f6e29b@linux.ibm.com>
 <2e97c804-c67a-4c92-94c9-d47a6648439c@amd.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <2e97c804-c67a-4c92-94c9-d47a6648439c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDE5NSBTYWx0ZWRfX1tBvb+1fr2UP
 ZwKNHslQpXBkwXHTQz/isweyNxieHtooQBIt+HdWBW2zilsVdV13z6MSX8lGE0qPdV83u6QKFtF
 lmvVtZLgtUf3ToX3j6AqkPw8LSQcgYxNQauVfbimtfvdWg0cAmiLEfT6qYEYV1eYSd+jYgLqcQ7
 KAxiycdBHCXj5g9WKYKDcOr/LwUvftT9tfPzOL/jd3Yb64KuxmlxqXhdr51ky+AmKdch8Qh5S9H
 Ku9j8NQLUpAd2+hgl3MDT2r/BnTiZvHlB7jc81dRtozH4TUptHCL0WUwETfsjvJaXZa+gPzca4j
 CT+mNwSF+D2wAAXiWgc5dZpgZ1eCokitz1q5jnwjp1K3bdEtNI0fjHeYPMzNoqgCc3VmOaBvLZo
 JG4BBr9b
X-Proofpoint-ORIG-GUID: _Z_ewn5No7AKUJRlqpv6ZF3urhPweW-W
X-Proofpoint-GUID: KmmnzaS-HQOVD0K6rSRWdIZYYLpqOPqZ
X-Authority-Analysis: v=2.4 cv=StCQ6OO0 c=1 sm=1 tr=0 ts=68c416d8 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=99mz2OWCW_9eoqye4tUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060195
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 9/12/25 2:18 PM, K Prateek Nayak wrote:
> Hello Shrikanth,
> 
> On 9/12/2025 10:52 AM, Shrikanth Hegde wrote:
>>
>>
>> On 9/11/25 10:36 PM, K Prateek Nayak wrote:
>>> Hello Shrikanth,
>>>
>>> On 9/11/2025 10:22 PM, Shrikanth Hegde wrote:
>>>>>> +    if (is_cpu_paravirt(cpu))
>>>>>> +        push_current_from_paravirt_cpu(rq);
>>>>>
>>>>> Does this mean paravirt CPU is capable of handling an interrupt but may
>>>>> not be continuously available to run a task?
>>>>
>>>> When i run hackbench which involves fair bit of IRQ stuff, it moves out.
>>>>
>>>> For example,
>>>>
>>>> echo 600-710 > /sys/devices/system/cpu/paravirt
>>>>
>>>> 11:31:54 AM  CPU    %usr   %nice    %sys %iowait    %irq   %soft  %steal  %guest  %gnice   %idle
>>>> 11:31:57 AM  598    2.04    0.00   77.55    0.00   18.37    0.00    1.02    0.00    0.00    1.02
>>>> 11:31:57 AM  599    1.01    0.00   79.80    0.00   17.17    0.00    1.01    0.00    0.00    1.01
>>>> 11:31:57 AM  600    0.00    0.00    0.00    0.00    0.00    0.00    0.99    0.00    0.00   99.01
>>>> 11:31:57 AM  601    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
>>>> 11:31:57 AM  602    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00    0.00  100.00
>>>>
>>>>
>>>> There could some workloads which doesn't move irq's out, for which needs irqbalance change.
>>>> Looking into it.
>>>>
>>>>    Or is the VMM expected to set
>>>>> the CPU on the paravirt mask and give the vCPU sufficient time to move the
>>>>> task before yanking it away from the pCPU?
>>>>>
>>>>
>>>> If the vCPU is running something, it is going to run at some point on pCPU.
>>>> hypervisor will give the cycles to this vCPU by preempting some other vCPU.
>>>>
>>>> It is that using this infra, there is should be nothing on that paravirt vCPU.
>>>> That way collectively VMM gets only limited request for pCPU which it can satify
>>>> without vCPU preemption.
>>>
>>> Ack! Just wanted to understand the usage.
>>>
>>> P.S. I remember discussions during last LPC where we could communicate
>>> this unavailability via CPU capacity. Was that problematic for some
>>> reason? Sorry if I didn't follow this discussion earlier.
>>>
>>
>> Thanks for that questions. Gives a opportunity to retrospect.
>>
>> Yes. That's where we started. but that has a lot of implementation challenges.
>> Still an option though.
>>
>> History upto current state:
>>
>> 1. At LPC24 presented the problem statement, and why existing approaches such as hotplug,
>>     cpuset cgroup or taskset are not viable solution. Hotplug would have come handy if the cost was low.
>>     The overhead of sched domain rebuild and serial nature of hotplug makes it not viable option.
>>     One of the possible approach was CPU Capacity.
> 
> Ack. Is creating an isolated partition on the fly too expensive too?
> I don't think creation of that partition is serialized and it should
> achieve a similar result with a single sched-domain rebuild and I'm
> hoping VMM doesn't change the paravirt mask at an alarming rate.
> 

That is a good idea too.

Main issue is with when workload does taskset.

For example,
taskset -c 650-700 stress-ng --cpu=100 -t 10
echo isolated > cpuset.cpus.partition
echo 600-710 > cpuset.cpus.exclusive

Tasks move out and is cpu affinity is reset to all cpus. Similar to hotplug.
But both hotplug and write to exclusive are triggered by user, and hence user
is aware of it.

I don't think it is good idea to reset users cpu affinity without an action from them.

Looking at code of
      cpuset_write_resmask
      update_exclusive_cpumask
    - update_parent_effective_cpumask
       + 6.16% cpuset_update_tasks_cpumask
            set_cpus_allowed_ptr
            __set_cpus_allowed_ptr
            affine_move_task

affine_move_task -> would call migration_cpu_stop -> Moves one task at a time

If you see we do the same/similar thing in paravirt infra, but we don't touch/reset task's cpu affinity.
Affined tasks continue to run if it is affined to only paravirt CPUs. If there is any one one
non paravirt CPU in its cpus_ptr it will move there.

> P.S. Some stupid benchmarking on a 256CPU machine:
> 
>      mkdir /sys/fs/cgroup/isol/
>      echo isolated >  /sys/fs/cgroup/isol/cpuset.cpus.partition
> 
>      time for i in {1..1000}; do \
>      echo "8-15" > /sys/fs/cgroup/isol/cpuset.cpus.exclusive; \
>      echo "16-23" > /sys/fs/cgroup/isol/cpuset.cpus.exclusive; \
>      done
> 
>      real    2m50.016s
>      user    0m0.198s
>      sys     1m47.708s
> 
> So that is about (170sec / 2000) ~ 85ms per cpuset operation.

That cost would be okay. VMM isn't expected to change at very high rate.

> Definitely more expensive than setting the paravirt but compare that to:
> 
>      for i in {8..15}; do echo 0 > /sys/devices/system/cpu/cpu$i/online; done; \
>      for i in {8..15}; do echo 1 > /sys/devices/system/cpu/cpu$i/online; done; \
>      for i in {16..23}; do echo 0 > /sys/devices/system/cpu/cpu$i/online; done; \
>      for i in {16..23}; do echo 1 > /sys/devices/system/cpu/cpu$i/online; done;'
> 
>      real    0m5.046s
>      user    0m0.014s
>      sys     0m0.110s
> 
> Definitely less expensive than a full hotplug.

This happens mainly due to the synchronize_rcu there.

> 
>>
>> 1. Issues with CPU Capacity approach:
>>     a. Need to make group_misfit_task as the highest priority. That alone will break big.LITTLE
>>        since it relies on group misfit and group_overload should have higher priority there.
>>     b. At high concurrency tasks still moved those CPUs with CAPACITY=1.
>>     c. A lot of scheduler stats would need to be aware of change in CAPACITY specially load balance/wakeup.
> 
> Ack. Thinking out loud: Can capacity go to 0 via H/W pressure interface?
> Maybe we can toggle the "sched_asym_cpucapacity" static branch without
> actually having SD_ASYM_CAPACITY in these special case to enable
> asym_fits_cpu() steer away from these 0 capacity CPUs.

bigger concern is around that group_misfit_task IMO.

> 
>>     d. in update_group_misfit - need to set the misfit load based on capacity. the current code sets to 0,
>>        because of task_fits_cpu stuff
>>     e. More challenges in RT.
>>
>> That's when Tobias had introduced a new group type called group_parked.
>> https://lore.kernel.org/all/20241204112149.25872-2-huschle@linux.ibm.com/
>>    It has relatively cleaner implementation compared to CPU CAPACITY.
>>
>> It had a few disadvantages too:
>> 1. It use to take around 8-10 seconds for tasks to move out of those CPUs. That was the main
>>     concern.
>> 2. Needs a few stats based changes in update_sg_lb_stats. might be tricky in all scenarios.
>>
>> That's when we were exploring how the tasks move out when the cpu goes offline. It happens quite fast too.
>> So tried a similar mechanism and this is where we are right now.
> 
> I agree push is great from that perspective.
> 

Yes. It is same at the moment.

>>
>>> [..snip..]
>>>>>> +    local_irq_save(flags);
>>>>>> +    preempt_disable();
>>>>>
>>>>> Disabling IRQs implies preemption is disabled.
>>>>>
>>>>
>>>> Most of the places stop_one_cpu_nowait called with preemption & irq disabled.
>>>> stopper runs at the next possible opportunity.
>>>
>>> But is there any reason to do both local_irq_save() and
>>> preempt_disable()? include/linux/preempt.h defines preemptible() as:
>>>
>>>       #define preemptible()   (preempt_count() == 0 && !irqs_disabled())
>>>
>>> so disabling IRQs should be sufficient right or am I missing something?
>>>
>>
>> f0498d2a54e79 (Peter Zijlstra) "sched: Fix stop_one_cpu_nowait() vs hotplug"
>> could be the answer you are looking for.
> 
> I think in all the cases covered by that commit, "task_rq_unlock(...)" would
> have enabled interrupts which required that specified pattern but here we
> have preempt_disable() within a local_irq_save() section which might not be
> necessary.
> 
>>
>>>>
>>>> stop_one_cpu_nowait
>>>>    ->queues the task into stopper list
>>>>       -> wake_up_process(stopper)
>>>>          -> set need_resched
>>>>            -> stopper runs as early as possible.
>>>>           
>>
> 


